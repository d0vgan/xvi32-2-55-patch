//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Forms;

interface

uses
  SysUtils, Classes, Forms, Controls, Graphics, Menus, XVI32_Main;

type
  TScrollBarKind = (sbHorizontal, sbVertical);
  TScrollBarStyle = (ssRegular, ssFlat, ssHotTrack);
  TControlScrollBar = class(TPersistent)
  public
    FControl:TScrollingWinControl;//f4
    Increment:TScrollBarInc;//f8
    FPageIncrement:TScrollBarInc;//fA
    Position:Integer;//fC
    Range:Integer;//f10
    FCalcRange:Integer;//f14
    FKind:TScrollBarKind;//f18
    Margin:Word;//f1A
    Visible:Boolean;//f1C
    Tracking:Boolean;//f1D
    FScaled:Boolean;//f1E
    Smooth:Boolean;//f1F
    FDelay:Integer;//f20
    ButtonSize:Integer;//f24
    Color:TColor;//f28
    ParentColor:Boolean;//f2C
    Size:Integer;//f30
    Style:TScrollBarStyle;//f34
    ThumbSize:Integer;//f38
    FPageDiv:Integer;//f3C
    FLineDiv:Integer;//f40
    FUpdateNeeded:Boolean;//f44
    procedure Assign(Source:TPersistent); virtual;//v8//00056FD4
    constructor Create(AControl:TScrollingWinControl; AKind:TScrollBarKind);//00056F44
    procedure IsStoredIncrement(Value:TScrollBarInc);//00056FCC
    procedure ChangeBiDiPosition;//00057024
    procedure CalcAutoRange;//000570F0
    function IsScrollBarVisible:Boolean;//0005719C
    function ControlSize(ControlSB:Boolean; AssumeSB:Boolean):Integer;//00057284
    function GetScrollPos:Integer;//00057304
    function NeedsScrollBarVisible:Boolean;//00057314
    procedure ScrollMessage(var Msg:TWMScroll);//0005738C
    procedure SetButtonSize(Value:Integer);//00057684
    procedure SetColor(Value:TColor);//000576BC
    procedure SetParentColor(Value:Boolean);//000576D8
    procedure SetPosition(Value:Integer);//000576F0
    procedure SetSize(Value:Integer);//000577B4
    procedure SetStyle(Value:TScrollBarStyle);//000577EC
    procedure SetThumbSize(Value:Integer);//00057804
    procedure DoSetRange(Value:Integer);//0005781C
    procedure SetRange(Value:Integer);//00057834
    function IsRangeStored(Value:Integer):Boolean;//00057848
    procedure SetVisible(Value:Boolean);//00057854
    procedure Update(ControlSB:Boolean; AssumeSB:Boolean);//00057968
  end;
  TScrollingWinControl = class(TWinControl)
  public
    HorzScrollBar:TControlScrollBar;//f1EC
    VertScrollBar:TControlScrollBar;//f1F0
    FAutoScroll:Boolean;//f1F4
    FAutoRangeCount:Integer;//f1F8
    FUpdatingScrollBars:Boolean;//f1FC
    destructor Destroy; virtual;//00057AE8
    constructor Create(AOwner:TComponent); virtual;//v2C//00057A80
    procedure AdjustClientRect(var Rect:TRect); virtual;//v88//0005811C
    procedure AlignControls(AControl:TControl; var ARect:TRect); virtual;//v8C//00057B60
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00057B24
    procedure CreateWnd; virtual;//v9C//00057B34
    function AutoScrollEnabled:Boolean; virtual;//vB8//00057B80
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//00058064
    procedure WMHScroll(Message:TWMCommand); message WM_HSCROLL;//000580D4
    procedure WMVScroll(Message:TWMHScroll); message WM_VSCROLL;//000580F8
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//00058190
    procedure DoFlipChildren; dynamic;//00057BA0
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//00058040
    procedure CalcAutoRange;//00057CB8
    procedure SetAutoScroll(Value:Boolean);//00057CDC
    procedure SetHorzScrollBar(Value:TControlScrollBar);//00057D18
    procedure SetVertScrollBar(Value:TControlScrollBar);//00057D28
    procedure UpdateScrollBars;//00057D38
    procedure AutoScrollInView(AControl:TControl);//00057E30
    procedure ScrollInView(AControl:TControl);//00057E48
    procedure ScaleScrollBars(M:Integer; D:Integer);//00057F9C
  end;
  TFormBorderStyle = (bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin);
  TBorderStyle = (bsNone, bsSingle);
  TScrollBox = class(TScrollingWinControl)
  public
    BorderStyle:TBorderStyle;//f200
    constructor Create(AOwner:TComponent); virtual;//v2C//00058220
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00058280
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//000582E4
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//000582F8
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//00058300
    procedure SetBorderStyle(Value:TBorderStyle);//000582D0
  end;
  TWindowState = (wsNormal, wsMinimized, wsMaximized);
  TFormStyle = (fsNormal, fsMDIChild, fsMDIForm, fsStayOnTop);
  TBorderIcon = (biSystemMenu, biMinimize, biMaximize, biHelp);
  TBorderIcons = set of TBorderIcon;
  TPosition = (poDesigned, poDefault, poDefaultPosOnly, poDefaultSizeOnly, poScreenCenter, poDesktopCenter);
  TDefaultMonitor = (dmDesktop, dmPrimary, dmMainForm, dmActiveForm);
  TPrintScale = (poNone, poProportional, poPrintToFit);
  TCloseEvent = procedure(Sender:TObject; var Action:TCloseAction) of object;;
  TCloseQueryEvent = procedure(Sender:TObject; var CanClose:Boolean) of object;;
  TShortCutEvent = procedure(var Msg:TWMKey; var Handled:Boolean) of object;;
  TCustomForm = class(TScrollingWinControl)
  public
    FActiveControl:TWinControl;//f200
    FFocusedControl:TWinControl;//f204
    FBorderIcons:TBorderIcons;//f208
    FBorderStyle:TFormBorderStyle;//f209
    FSizeChanging:Boolean;//f20A
    FWindowState:TWindowState;//f20B
    FShowAction:TShowAction;//f20C
    FKeyPreview:Boolean;//f20D
    FActive:Boolean;//f20E
    FFormStyle:TFormStyle;//f20F
    FPosition:TPosition;//f210
    FDefaultMonitor:TDefaultMonitor;//f211
    FTileMode:TTileMode;//f212
    FDropTarget:Boolean;//f213
    FOldCreateOrder:Boolean;//f214
    FPrintScale:TPrintScale;//f215
    FCanvas:TControlCanvas;//f218
    FHelpFile:String;//f21C
    FIcon:TIcon;//f220
    FInCMParentBiDiModeChanged:Boolean;//f224
    FMenu:TMainMenu;//f228
    FModalResult:TModalResult;//f22C
    FDesigner:IDesigner;//f230
    FClientHandle:HWND;//f234
    FWindowMenu:TMenuItem;//f238
    FPixelsPerInch:Integer;//f23C
    FObjectMenuItem:TMenuItem;//f240
    FOleForm:IOleForm;//f244
    FClientWidth:Integer;//f248
    FClientHeight:Integer;//f24C
    FTextHeight:Integer;//f250
    FDefClientProc:TFarProc;//f254
    FClientInstance:TFarProc;//f258
    FActiveOleControl:TWinControl;//f25C
    FSavedBorderStyle:TFormBorderStyle;//f260
    FOnActivate:TNotifyEvent;//f264
    f266:word;//f266
    f268:dword;//f268
    FOnClose:TCloseEvent;//f26C
    f270:dword;//f270
    FOnCloseQuery:TCloseQueryEvent;//f274
    FOnDeactivate:TNotifyEvent;//f27C
    f27E:word;//f27E
    f280:dword;//f280
    FOnHelp:THelpEvent;//f284
    FOnHide:TNotifyEvent;//f28C
    FOnPaint:TNotifyEvent;//f294
    FOnShortCut:TShortCutEvent;//f29C
    FOnShow:TNotifyEvent;//f2A4
    f2A8:dword;//f2A8
    FOnCreate:TNotifyEvent;//f2AC
    FOnDestroy:TNotifyEvent;//f2B4
    FActionLists:TList;//f2BC
    FFormState:TFormState;//f2C0
    procedure AfterConstruction; virtual;//000584B4
    procedure BeforeDestruction; virtual;//000585F4
    procedure DefaultHandler(var Message:void ); virtual;//0005A878
    destructor Destroy; virtual;//00058658
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00058B5C
    procedure Loaded; virtual;//vC//0005881C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00058854
    procedure ReadState(Reader:TReader); virtual;//v14//00058948
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString); virtual;//v20//00059168
    //function QueryInterface(const IID:TGUID; var Obj:Pointer):?; virtual; stdcall;//v28//0005C978
    constructor Create(AOwner:TComponent); virtual;//v2C//0005832C
    function GetClientRect:TRect; virtual;//v44//00058E48
    function GetFloating:Boolean; virtual;//v54//00058F3C
    procedure SetParent(AParent:TWinControl); virtual;//v64//00059130
    procedure SetParentBiDiMode(Value:Boolean); virtual;//v68//00058FFC
    procedure WndProc(var Message:TMessage); virtual;//v70//000591EC
    procedure AlignControls(AControl:TControl; var Rect:TRect); virtual;//v8C//000598BC
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0005A3F4
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v98//0005A734
    procedure CreateWnd; virtual;//v9C//0005A5F4
    procedure DestroyWindowHandle; virtual;//vA0//0005A834
    procedure PaintWindow(DC:HDC); virtual;//vAC//0005AF80
    procedure SetFocus; virtual;//vB4//0005C258
    procedure UpdateActions; virtual;//vBC//0005C600
    constructor CreateNew(AOwner:TComponent; Dummy:Integer); virtual;//vC0//000584C4
    function CloseQuery:Boolean; virtual;//vC4//0005C12C
    function SetFocusedControl(Control:TWinControl):Boolean; virtual;//vC8//0005A9F8
    function ShowModal:Integer; virtual;//vCC//0005C2F0
    //function vD0:?; virtual;//vD0//0005912C
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//0005B3C4
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//0005B558
    procedure WMActivate(var Message:TWMActivate); message WM_ACTIVATE;//0005B538
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//0005B0E4
    procedure WMClose; message WM_CLOSE;//0005B5C0
    procedure WMQueryEndSession(var Message:TWMQueryEndSession); message WM_QUERYENDSESSION;//0005B5C8
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//0005B1C4
    procedure WMShowWindow(var Message:TWMShowWindow); message WM_SHOWWINDOW;//0005B6D4
    procedure WMSettingChange(var Message:TMessage); message WM_SETTINGCHANGE;//0005C684
    procedure WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo); message WM_GETMINMAXINFO;//0005B950
    procedure WMIconEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ICONERASEBKGND;//0005B164
    procedure WMNextDlgCtl(var Message:TWMNextDlgCtl); message WM_NEXTDLGCTL;//0005B7C4
    procedure WMQueryDragIcon(var Message:TWMQueryDragIcon); message WM_QUERYDRAGICON;//0005B1FC
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;//0005B9C4
    procedure WMHelp(var Message:TWMHelp); message WM_HELP;//0005B84C
    procedure WMNCCreate(var Message:TWMNCCreate); message WM_NCCREATE;//0005B30C
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//0005B340
    procedure WMCommand(Message:TWMCharToItem); message WM_COMMAND;//0005B424
    procedure WMSysCommand(var Message:TWMSysCommand); message WM_SYSCOMMAND;//0005B64C
    procedure WMInitMenuPopup(var Message:TWMInitMenuPopup); message WM_INITMENUPOPUP;//0005B458
    procedure WMMenuSelect(var Message:TWMMenuSelect); message WM_MENUSELECT;//0005B490
    procedure WMMenuChar(var Message:TWMMenuChar); message WM_MENUCHAR;//0005B470
    procedure WMEnterMenuLoop(var Message:TMessage); message WM_ENTERMENULOOP;//0005B7F0
    procedure WMMDIActivate(var Message:TWMMDIActivate); message WM_MDIACTIVATE;//0005B76C
    procedure CMActivate; message CM_ACTIVATE;//0005BA58
    procedure CMDeactivate; message CM_DEACTIVATE;//0005BA6C
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//0005BA80
    procedure CMParentFontChanged(var Message:TMessage); message CM_PARENTFONTCHANGED;//0005C01C
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//0005A028
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//0005A0AC
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0005A064
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//0005BFC4
    procedure CMMenuChanged(var Message:TMessage); message CM_MENUCHANGED;//0005A0CC
    procedure CMAppSysCommand(var Message:TMessage); message CM_APPSYSCOMMAND;//0005B5F4
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//0005BB1C
    procedure CMIconChanged(var Message:TMessage); message CM_ICONCHANGED;//0005BF9C
    procedure CMRelease; message CM_RELEASE;//0005BFBC
    procedure CMUIActivate; message CM_UIACTIVATE;//0005C014
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//000598F8
    procedure CMParentBiDiModeChanged(var Message:TMessage); message CM_PARENTBIDIMODECHANGED;//00059990
    procedure CMActionUpdate(var Message:TMessage); message CM_ACTIONUPDATE;//0005C854
    procedure CMActionExecute(var Message:TMessage); message CM_ACTIONEXECUTE;//0005C754
    procedure IsShortCut(var Message:TWMKey); dynamic;//0005C8FC
    procedure Paint; dynamic;//0005AF44
    procedure DoShow; dynamic;//00058E28
    procedure DoHide; dynamic;//00058E08
    procedure DoClose(var Action:TCloseAction); dynamic;//00058DE8
    procedure sub_0005AF14; dynamic;//0005AF14
    procedure sub_0005AC84; dynamic;//0005AC84
    procedure sub_0005AEE4; dynamic;//0005AEE4
    procedure MouseWheelHandler(var Message:TMessage); dynamic;//0005C9EC
    procedure Dock(NewDockSite:TWinControl; ARect:TRect); dynamic;//00059A7C
    procedure VisibleChanging; dynamic;//000590C8
    procedure RequestAlign; dynamic;//0005C668
    procedure PaletteChanged(Foreground:Boolean); dynamic;//0005B038
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect); dynamic;//00059AC4
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//00058CA0
    procedure BeginAutoDrag; dynamic;//00058C9C
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//00058F68
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00058ED0
    procedure DoCreate;//00058748
    procedure DoDestroy;//000587BC
    procedure ReadIgnoreFontProperty(Reader:TReader);//00058C08
    procedure ReadTextHeight(Reader:TReader);//00058C28
    procedure WriteTextHeight(Writer:TWriter);//00058C40
    procedure WritePixelsPerInch(Writer:TWriter);//00058C5C
    function GetTextHeight:Integer;//00058C78
    procedure IconChanged(Sender:TObject);//00058D20
    function IsClientSizeStored(Value:Integer):Boolean;//00058D7C
    function IsFormSizeStored(Value:Integer):Boolean;//00058D8C
    function IsAutoScrollStored(Value:Boolean):Boolean;//00058DB4
    procedure SetClientWidth(Value:Integer);//00059024
    procedure SetClientHeight(Value:Integer);//00059054
    procedure SetVisible(Value:Boolean);//00059084
    procedure ClientWndProc(var Message:TMessage);//000597F4
    procedure SetBorderIcons(Value:TBorderIcons);//00059A18
    procedure SetBorderStyle(Value:TFormBorderStyle);//00059A44
    function GetActiveMDIChild:TForm;//00059B18
    function GetMDIChildCount:Integer;//00059B4C
    function GetMDIChildren(I:Integer):TForm;//00059B98
    function GetMonitor:TMonitor;//00059BE8
    function GetCanvas:TCanvas;//00059C48
    procedure SetIcon(Value:TIcon);//00059C50
    function IsForm(Value:TWinControl):Boolean;//00059C5C
    function IsIconStored(Value:TIcon):Boolean;//00059C64
    procedure SetFormStyle(Value:TFormStyle);//00059C8C
    procedure RefreshMDIMenu;//00059D0C
    procedure SetObjectMenuItem(Value:TMenuItem);//00059D88
    procedure SetWindowMenu(Value:TMenuItem);//00059D9C
    procedure SetMenu(Value:TMainMenu);//00059DC4
    function GetPixelsPerInch:Integer;//00059F88
    procedure SetPixelsPerInch(Value:Integer);//00059F9C
    procedure SetPosition(Value:TPosition);//00059FD0
    function GetScaled:Boolean;//00059FEC
    procedure SetScaled(Value:Boolean);//00059FF8
    function NormalColor:TColor;//0005A04C
    procedure SetWindowState(Value:TWindowState);//0005A0E8
    procedure SetWindowToMonitor;//0005A128
    procedure SetActiveControl(Control:TWinControl);//0005A8DC
    procedure DefocusControl(Control:TWinControl; Removing:Boolean);//0005A98C
    procedure FocusControl(Control:TWinControl);//0005A9D4
    procedure SetWindowFocus;//0005AC88
    procedure SetActive(Value:Boolean);//0005ACD8
    procedure SendCancelMode(Sender:TControl);//0005AD3C
    procedure MergeMenu(MergeState:Boolean);//0005AD8C
    function GetIconHandle:HICON;//0005AF64
    procedure Close;//0005C088
    procedure CloseModal;//0005C190
    procedure Hide;//0005C238
    procedure Show;//0005C240
    procedure Release;//0005C2D4
  end;
  TForm = class(TCustomForm)
  end;
  TCustomDockForm = class(TCustomForm)
  public
    procedure Loaded; virtual;//vC//0005CB94
    constructor Create(AOwner:TComponent); virtual;//v2C//0005CA24
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//0005CC0C
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//0005CC34
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//0005CE14
    procedure CMControlListChange(var Message:TMessage); message CM_CONTROLLISTCHANGE;//0005CCC0
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//0005CDFC
    //procedure sub_0005CD18(?:?); dynamic;//0005CD18
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//0005CBE0
    procedure DoRemoveDockClient(Client:TControl); dynamic;//0005CB74
    //procedure sub_00046FFC(?:?; ?:?); dynamic;//0005CA8C
  end;
  TMonitor = class(TObject)
  public
    FHandle:HMONITOR;//f4
    FMonitorNum:Integer;//f8
    function GetLeft:Integer;//0005CE50
    function GetHeight:Integer;//0005CE70
    function GetTop:Integer;//0005CE94
    function GetWidth:Integer;//0005CEB4
  end;
  TScreen = class(TComponent)
  public
    FFonts:TStrings;//f24
    FImes:TStrings;//f28
    FDefaultIme:String;//f2C
    FDefaultKbLayout:HKL;//f30
    FPixelsPerInch:Integer;//f34
    FCursor:TCursor;//f38
    FCursorCount:Integer;//f3C
    FForms:TList;//f40
    FCustomForms:TList;//f44
    FDataModules:TList;//f48
    FMonitors:TList;//f4C
    FCursorList:PCursorRec;//f50
    FDefaultCursor:HCURSOR;//f54
    FActiveControl:TWinControl;//f58
    FActiveCustomForm:TCustomForm;//f5C
    FActiveForm:TForm;//f60
    FLastActiveControl:TWinControl;//f64
    FLastActiveCustomForm:TCustomForm;//f68
    FFocusedForm:TCustomForm;//f6C
    FSaveFocusedList:TList;//f70
    FIconFont:TFont;//f74
    FAlignLevel:Word;//f78
    FControlState:TControlState;//f7A
    FOnActiveControlChange:TNotifyEvent;//f7C
    FOnActiveFormChange:TNotifyEvent;//f84
    destructor Destroy; virtual;//0005D170
    constructor Create(AOwner:TComponent); virtual;//v2C//0005CFA0
    function GetHeight:Integer;//0005D208
    function GetWidth:Integer;//0005D214
    function GetDesktopTop:Integer;//0005D220
    function GetDesktopLeft:Integer;//0005D22C
    function GetDesktopHeight:Integer;//0005D238
    function GetDesktopWidth:Integer;//0005D244
    function GetMonitor(Index:Integer):TMonitor;//0005D250
    function GetMonitorCount:Integer;//0005D264
    function GetForm(Index:Integer):TForm;//0005D280
    function GetFormCount:Integer;//0005D294
    function GetCustomForms(Index:Integer):TCustomForm;//0005D29C
    function GetCustomFormCount:Integer;//0005D2B0
    procedure UpdateLastActive;//0005D2B8
    procedure AddForm(AForm:TCustomForm);//0005D300
    procedure RemoveForm(AForm:TCustomForm);//0005D338
    procedure CreateCursors;//0005D380
    procedure DestroyCursors;//0005D3DC
    procedure DeleteCursor(Index:Integer);//0005D438
    procedure InsertCursor(Index:Integer; Handle:HCURSOR);//0005D480
    procedure InitImes;//0005D4A8
    procedure IconFontChanged(Sender:TObject);//0005D6A0
    function GetDataModule(Index:Integer):TDataModule;//0005D6B0
    function GetDataModuleCount:Integer;//0005D6C4
    function GetCursors(Index:Integer):HCURSOR;//0005D6CC
    procedure SetCursor(Value:TCursor);//0005D6F4
    procedure SetCursors(Index:Integer; Handle:HCURSOR);//0005D784
    procedure GetMetricSettings;//0005D7CC
    procedure DisableAlign;//0005D810
    procedure EnableAlign;//0005D818
    procedure Realign;//0005D830
    procedure AlignForms(AForm:TCustomForm; var Rect:TRect);//0005DBF0
    procedure AlignForm(AForm:TCustomForm);//0005DC78
  end;
  THintInfo = THintInfo = record//size=40
f38:String;//f38
end;;
  TApplication = class(TComponent)
  public
    FHandle:HWND;//f24
    FBiDiMode:TBiDiMode;//f28
    FObjectInstance:Pointer;//f2C
    FMainForm:TForm;//f30
    FMouseControl:TControl;//f34
    FHelpFile:String;//f38
    FHint:String;//f3C
    FHintActive:Boolean;//f40
    FUpdateFormatSettings:Boolean;//f41
    FUpdateMetricSettings:Boolean;//f42
    FShowMainForm:Boolean;//f43
    FHintColor:TColor;//f44
    FHintControl:TControl;//f48
    FHintCursorRect:TRect;//f4C
    FHintHidePause:Integer;//f5C
    FHintPause:Integer;//f60
    FHintShortCuts:Boolean;//f64
    FHintShortPause:Integer;//f68
    FHintWindow:THintWindow;//f6C
    FShowHint:Boolean;//f70
    FTimerMode:TTimerMode;//f71
    FTimerHandle:Word;//f72
    FTitle:String;//f74
    FTopMostList:TList;//f78
    FTopMostLevel:Integer;//f7C
    FIcon:TIcon;//f80
    FTerminate:Boolean;//f84
    FActive:Boolean;//f85
    FAllowTesting:Boolean;//f86
    FTestLib:THandle;//f88
    FHandleCreated:Boolean;//f8C
    FRunning:Boolean;//f8D
    FWindowHooks:TList;//f90
    FWindowList:Pointer;//f94
    FDialogHandle:HWND;//f98
    FLastMsg:TMsg;//f9C
    FOnActionExecute:TActionEvent;//fB8
    FOnActionUpdate:TActionEvent;//fC0
    FOnException:TExceptionEvent;//fC8
    FOnMessage:TMessageEvent;//fD0
    FOnHelp:THelpEvent;//fD8
    fDC:TFormMain;//fDC
    FOnHint:TNotifyEvent;//fE0
    fE4:TFormMain;//fE4
    FOnIdle:TIdleEvent;//fE8
    FOnDeactivate:TNotifyEvent;//fF0
    FOnActivate:TNotifyEvent;//fF8
    FOnMinimize:TNotifyEvent;//f100
    FOnRestore:TNotifyEvent;//f108
    FOnShortCut:TShortCutEvent;//f110
    FOnShowHint:TShowHintEvent;//f118
    destructor Destroy; virtual;//0005E134
    constructor Create(AOwner:TComponent); virtual;//v2C//0005DFA0
    procedure CreateHandle;//0005E214
    procedure ControlDestroyed(Control:TControl);//0005E3A4
    procedure DoNormalizeTopMosts(IncludeMain:Boolean);//0005E470
    procedure NormalizeTopMosts;//0005E508
    procedure NormalizeAllTopMosts;//0005E510
    procedure RestoreTopMosts;//0005E518
    function UseRightToLeftReading:Boolean;//0005E574
    function UseRightToLeftAlignment:Boolean;//0005E58C
    function CheckIniChange(var Message:TMessage):Boolean;//0005E5A4
    procedure WndProc(var Message:TMessage);//0005E67C
    function GetIconHandle:HICON;//0005ED28
    procedure Minimize;//0005ED44
    procedure Restore;//0005ED8C
    procedure BringToFront;//0005EE14
    function GetTitle:AnsiString;//0005EE50
    procedure SetTitle(const Value:AnsiString);//0005EE98
    function IsDlgMsg(var Msg:TMsg):Boolean;//0005EEC8
    function IsIdleMessage(const Msg:TMsg):Boolean;//0005EEEC
    function IsMDIMsg(var Msg:TMsg):Boolean;//0005EF48
    function IsKeyMsg(var Msg:TMsg):Boolean;//0005EF98
    function IsHintMsg(var Msg:TMsg):Boolean;//0005F02C
    function IsShortCut(var Message:TWMKey):Boolean;//0005F05C
    function ProcessMessage(var Msg:TMsg):Boolean;//0005F0C8
    procedure ProcessMessages;//0005F160
    procedure HandleMessage;//0005F178
    procedure HookMainWindow(Hook:TWindowHook);//0005F19C
    procedure UnhookMainWindow(Hook:TWindowHook);//0005F1F8
    procedure Initialize;//0005F274
    procedure CreateForm(InstanceClass:TComponentClass; var Reference:void );//0005F28C
    procedure Run;//0005F30C
    procedure Terminate;//0005F3C0
    procedure HandleException(Sender:TObject);//0005F3D4
    function MessageBox(Text:PChar; Caption:PChar; Flags:Longint):Integer;//0005F464
    procedure ShowException(E:Exception);//0005F5BC
    function InvokeHelp(Command:Word; Data:Longint):Boolean;//0005F694
    function HelpContext(Context:THelpContext):Boolean;//0005F7C0
    function HelpCommand(Command:Integer; Data:Longint):Boolean;//0005F7CC
    function GetExeName:AnsiString;//0005F7D4
    procedure SetShowHint(Value:Boolean);//0005F7E4
    procedure DoActionIdle;//0005F824
    function DoMouseIdle:TControl;//0005F888
    procedure Idle(const Msg:TMsg);//0005F90C
    procedure NotifyForms(Msg:Word);//0005FA28
    procedure IconChanged(Sender:TObject);//0005FA64
    procedure SetHint(const Value:AnsiString);//0005FAB4
    procedure UpdateVisible;//0005FBA4
    procedure StartHintTimer(Value:Integer; TimerMode:TTimerMode);//0005FBFC
    procedure StopHintTimer;//0005FC34
    procedure HintMouseMessage(Control:TControl; var Message:TMessage);//0005FC54
    procedure HintTimerExpired;//0005FD60
    procedure HideHint;//0005FD94
    procedure CancelHint;//0005FDD0
    procedure ActivateHint(CursorPos:TPoint);//0005FFB0
    function DispatchAction(Msg:Longint; Action:TBasicAction):Boolean;//00060348
    function ExecuteAction(Action:TBasicAction):Boolean;//000603D8
    function UpdateAction(Action:TBasicAction):Boolean;//00060400
  end;
    procedure ShowMDIClientEdge(ClientHandle:THandle; ShowEdge:Boolean);//00056500
    procedure DoneApplication;//0005654C
    function DoDisableWindow(Window:HWND; Data:Longint):BOOL; stdcall;//00056584
    function DisableTaskWindows(ActiveWindow:HWND):Pointer;//000565D4
    procedure EnableTaskWindows(WindowList:Pointer);//00056688
    function DoFindWindow(Window:HWND; Param:Longint):BOOL; stdcall;//000566C0
    function FindTopMostWindow(ActiveWindow:HWND):HWND;//00056724
    function SendFocusMessage(Window:HWND; Msg:Word):Boolean;//00056760
    function CheckTaskWindow(Window:HWND; Data:Longint):BOOL; stdcall;//00056780
    function ForegroundTask:Boolean;//000567A0
    function FindGlobalComponent(const Name:AnsiString):TComponent;//000567CC
    procedure InitCtl3D;//00056844
    procedure DoneCtl3D;//00056A6C
    function Subclass3DWnd(Wnd:HWND):Boolean;//00056A98
    procedure Subclass3DDlg(Wnd:HWND; Flags:Word);//00056AD0
    procedure SetAutoSubClass(Enable:Boolean);//00056B04
    function StdWndProc(Window:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;//00056B58
    function CalcJmpOffset(Src:Pointer; Dest:Pointer):Longint;//00056B78
    function MakeObjectInstance(Method:TWndMethod):Pointer;//00056B80
    procedure FreeObjectInstance(ObjectInstance:Pointer);//00056C18
    procedure _NF__527;//00056C2C
    function AllocateHWnd(Method:TWndMethod):HWND;//00056C3C
    procedure DeallocateHWnd(Wnd:HWND);//00056CF8
    function KeysToShiftState(Keys:Word):TShiftState;//00056D20
    function KeyDataToShiftState(KeyData:Longint):TShiftState;//00056D74
    function KeyboardStateToShiftState(const KeyboardState:TKeyboardState):TShiftState;//00056DB0
    function IsAccel(VK:Word; const Str:AnsiString):Boolean;//00056DFC
    function GetParentForm(Control:TControl):TCustomForm;//00056E9C
    function ValidParentForm(Control:TControl):TCustomForm;//00056EC4
    procedure Assign(Source:TPersistent);//00056FD4
    procedure ProcessHorz(Control:TControl);//0005705C
    procedure ProcessVert(Control:TControl);//000570A8
    function ScrollBarVisible(Code:Word):Boolean;//000571D4
    function Adjustment(Code:Word; Metric:Word):Integer;//00057208
    function GetRealScrollPosition:Integer;//0005732C
    procedure UpdateScrollProperties(Redraw:Boolean);//00057860
    constructor Create(AOwner:TComponent);//00057A80
    destructor Destroy;//00057AE8
    procedure CreateParams(var Params:TCreateParams);//00057B24
    procedure CreateWnd;//00057B34
    procedure AlignControls(AControl:TControl; var ARect:TRect);//00057B60
    function AutoScrollEnabled:Boolean;//00057B80
    procedure DoFlipChildren;//00057BA0
    procedure ChangeScale(M:Integer; D:Integer);//00058040
    procedure WMSize(var Message:TWMSize);//00058064
    procedure WMHScroll(Message:TWMCommand);//000580D4
    procedure WMVScroll(Message:TWMHScroll);//000580F8
    procedure AdjustClientRect(var Rect:TRect);//0005811C
    procedure CMBiDiModeChanged(var Message:TMessage);//00058190
    constructor Create(AOwner:TComponent);//00058220
    procedure CreateParams(var Params:TCreateParams);//00058280
    procedure WMSize(var Message:TWMSize);//000582E4
    procedure WMNCHitTest(var Message:TWMNCHitTest);//000582F8
    procedure CMCtl3DChanged(var Message:TMessage);//00058300
    constructor Create(AOwner:TComponent);//0005832C
    procedure AfterConstruction;//000584B4
    constructor CreateNew(AOwner:TComponent; Dummy:Integer);//000584C4
    procedure BeforeDestruction;//000585F4
    destructor Destroy;//00058658
    procedure Loaded;//0005881C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00058854
    procedure ReadState(Reader:TReader);//00058948
    procedure DefineProperties(Filer:TFiler);//00058B5C
    procedure BeginAutoDrag;//00058C9C
    procedure ChangeScale(M:Integer; D:Integer);//00058CA0
    procedure DoClose(var Action:TCloseAction);//00058DE8
    procedure DoHide;//00058E08
    procedure DoShow;//00058E28
    function GetClientRect:TRect;//00058E48
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00058ED0
    function GetFloating:Boolean;//00058F3C
    procedure SetChildOrder(Child:TComponent; Order:Integer);//00058F68
    procedure SetParentBiDiMode(Value:Boolean);//00058FFC
    procedure VisibleChanging;//000590C8
    //function sub_0005912C:?;//0005912C
    procedure SetParent(AParent:TWinControl);//00059130
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);//00059168
    function GetMenuFont:HFONT;//000591A8
    procedure WndProc(var Message:TMessage);//000591EC
    procedure Default;//00059768
    function MaximizedChildren:Boolean;//000597B4
    procedure AlignControls(AControl:TControl; var Rect:TRect);//000598BC
    procedure CMBiDiModeChanged(var Message:TMessage);//000598F8
    procedure CMParentBiDiModeChanged(var Message:TMessage);//00059990
    procedure Dock(NewDockSite:TWinControl; ARect:TRect);//00059A7C
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect);//00059AC4
    procedure CMColorChanged(var Message:TMessage);//0005A028
    procedure CMCtl3DChanged(var Message:TMessage);//0005A064
    procedure CMFontChanged(var Message:TMessage);//0005A0AC
    procedure CMMenuChanged(var Message:TMessage);//0005A0CC
    procedure CreateParams(var Params:TCreateParams);//0005A3F4
    procedure CreateWnd;//0005A5F4
    procedure CreateWindowHandle(const Params:TCreateParams);//0005A734
    procedure DestroyWindowHandle;//0005A834
    procedure DefaultHandler(var Message:void );//0005A878
    function SetFocusedControl(Control:TWinControl):Boolean;//0005A9F8
    procedure sub_0005AC84;//0005AC84
    //procedure sub_0005AE98(?:?; ?:TWinControl; ?:TCustomForm);//0005AE98
    procedure sub_0005AEE4;//0005AEE4
    procedure sub_0005AF14;//0005AF14
    procedure Paint;//0005AF44
    procedure PaintWindow(DC:HDC);//0005AF80
    procedure PaletteChanged(Foreground:Boolean);//0005B038
    procedure WMPaint(var Message:TWMPaint);//0005B0E4
    procedure WMIconEraseBkgnd(var Message:TWMEraseBkgnd);//0005B164
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//0005B1C4
    procedure WMQueryDragIcon(var Message:TWMQueryDragIcon);//0005B1FC
    procedure ModifySystemMenu;//0005B210
    procedure WMNCCreate(var Message:TWMNCCreate);//0005B30C
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//0005B340
    procedure WMDestroy(var Message:TWMDestroy);//0005B3C4
    procedure WMCommand(Message:TWMCharToItem);//0005B424
    procedure WMInitMenuPopup(var Message:TWMInitMenuPopup);//0005B458
    procedure WMMenuChar(var Message:TWMMenuChar);//0005B470
    procedure WMMenuSelect(var Message:TWMMenuSelect);//0005B490
    procedure WMActivate(var Message:TWMActivate);//0005B538
    procedure WMSize(var Message:TWMSize);//0005B558
    procedure WMClose;//0005B5C0
    procedure WMQueryEndSession(var Message:TWMQueryEndSession);//0005B5C8
    procedure CMAppSysCommand(var Message:TMessage);//0005B5F4
    procedure WMSysCommand(var Message:TWMSysCommand);//0005B64C
    procedure WMShowWindow(var Message:TWMShowWindow);//0005B6D4
    procedure WMMDIActivate(var Message:TWMMDIActivate);//0005B76C
    procedure WMNextDlgCtl(var Message:TWMNextDlgCtl);//0005B7C4
    procedure WMEnterMenuLoop(var Message:TMessage);//0005B7F0
    function GetMenuHelpContext(Menu:TMenu):Integer;//0005B80C
    procedure WMHelp(var Message:TWMHelp);//0005B84C
    procedure WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo);//0005B950
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging);//0005B9C4
    procedure CMActivate;//0005BA58
    procedure CMDeactivate;//0005BA6C
    procedure CMDialogKey(var Message:TCMDialogKey);//0005BA80
    procedure CMShowingChanged(var Message:TMessage);//0005BB1C
    procedure CMIconChanged(var Message:TMessage);//0005BF9C
    procedure CMRelease;//0005BFBC
    procedure CMTextChanged(var Message:TMessage);//0005BFC4
    procedure CMUIActivate;//0005C014
    procedure CMParentFontChanged(var Message:TMessage);//0005C01C
    function CloseQuery:Boolean;//0005C12C
    procedure SetFocus;//0005C258
    function ShowModal:Integer;//0005C2F0
    procedure TraverseClients(Container:TWinControl);//0005C590
    procedure UpdateActions;//0005C600
    procedure RequestAlign;//0005C668
    procedure WMSettingChange(var Message:TMessage);//0005C684
    function ProcessExecute(Control:TControl):Boolean;//0005C6A8
    function TraverseClients(Container:TWinControl):Boolean;//0005C6D8
    procedure CMActionExecute(var Message:TMessage);//0005C754
    function ProcessUpdate(Control:TControl):Boolean;//0005C7A8
    function TraverseClients(Container:TWinControl):Boolean;//0005C7D8
    procedure CMActionUpdate(var Message:TMessage);//0005C854
    function DispatchShortCut:Boolean;//0005C8A8
    procedure IsShortCut(var Message:TWMKey);//0005C8FC
    //function QueryInterface(const IID:TGUID; var Obj:Pointer):?; stdcall;//0005C978
    procedure MouseWheelHandler(var Message:TMessage);//0005C9EC
    constructor Create(AOwner:TComponent);//0005CA24
    //procedure sub_00046FFC(?:?; ?:?);//0005CA8C
    procedure DoRemoveDockClient(Client:TControl);//0005CB74
    procedure Loaded;//0005CB94
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//0005CBE0
    procedure WMNCHitTest(var Message:TWMNCHitTest);//0005CC0C
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//0005CC34
    procedure CMControlListChange(var Message:TMessage);//0005CCC0
    //procedure sub_0005CD18(?:?);//0005CD18
    procedure CMUnDockClient(var Message:TCMUnDockClient);//0005CDFC
    procedure CMVisibleChanged(var Message:TMessage);//0005CE14
    function EnumFontsProc(var LogFont:TLogFont; var TextMetric:TTextMetric; FontType:Integer; Data:Pointer):Integer; stdcall;//0005CED8
    function EnumMonitorsProc(hm:HMONITOR; dc:HDC; r:PRect; Data:Pointer):Boolean; stdcall;//0005CF70
    constructor Create(AOwner:TComponent);//0005CFA0
    destructor Destroy;//0005D170
    function InsertBefore(C1:TCustomForm; C2:TCustomForm; AAlign:TAlign):Boolean;//0005D838
    procedure DoPosition(Form:TCustomForm; AAlign:TAlign);//0005D898
    procedure DoAlign(AAlign:TAlign);//0005DA48
    function AlignWork:Boolean;//0005DB98
    function GetHint(Control:TControl):AnsiString;//0005DCF4
    function GetHintControl(Control:TControl):TControl;//0005DD24
    procedure HintTimerProc(Wnd:HWND; Msg:Longint; TimerID:Longint; SysTime:Longint); stdcall;//0005DD44
    procedure HintMouseThread(Param:Integer); stdcall;//0005DD98
    function HintGetMsgHook(nCode:Integer; wParam:Longint; var Msg:TMsg):Longint; stdcall;//0005DDF4
    procedure HookHintHooks;//0005DE38
    procedure UnhookHintHooks;//0005DEAC
    function GetAnimation:Boolean;//0005DF08
    procedure SetAnimation(Value:Boolean);//0005DF38
    procedure ShowWinNoAnimate(Handle:HWND; CmdShow:Integer);//0005DF60
    constructor _NF__9C6;//0005DF90
    constructor Create(AOwner:TComponent);//0005DFA0
    destructor Destroy;//0005E134
    function GetTopMostWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;//0005E404
    procedure Default;//0005E5F4
    procedure DrawAppIcon;//0005E630
    procedure SetVisible(Value:Boolean);//0005FB48
    function FindScanline(Source:Pointer; MaxLen:Cardinal; Value:Cardinal):Cardinal;//0005FDF8
    function GetCursorHeightMargin:Integer;//0005FE08
    procedure ValidateHintWindow(HintClass:THintWindowClass);//0005FF5C
    procedure _NF__AF2;//00060428

implementation

//00056500
procedure ShowMDIClientEdge(ClientHandle:THandle; ShowEdge:Boolean);
begin
{*
 00056500    push        ebx
 00056501    push        esi
 00056502    mov         ebx,edx
 00056504    mov         esi,eax
 00056506    test        esi,esi
>00056508    je          00056547
 0005650A    push        0EC
 0005650C    push        esi
 0005650D    call        user32.GetWindowLongA
 00056512    test        bl,bl
>00056514    je          00056522
 00056516    test        ah,2
>00056519    jne         00056547
 0005651B    or          eax,200
>00056520    jmp         0005652C
 00056522    test        ah,2
>00056525    je          00056547
 00056527    and         eax,0FFFFFDFF
 0005652C    push        eax
 0005652D    push        0EC
 0005652F    push        esi
 00056530    call        user32.SetWindowLongA
 00056535    push        37
 00056537    push        0
 00056539    push        0
 0005653B    push        0
 0005653D    push        0
 0005653F    push        0
 00056541    push        esi
 00056542    call        user32.SetWindowPos
 00056547    pop         esi
 00056548    pop         ebx
 00056549    ret
*}
end;

//0005654C
procedure DoneApplication;
begin
{*
 0005654C    mov         eax,[000B67B0];Application:TApplication
 00056551    mov         eax,dword ptr [eax+24]
 00056554    test        eax,eax
>00056556    je          00056560
 00056558    push        0
 0005655A    push        eax
 0005655B    call        user32.ShowOwnedPopups
 00056560    xor         edx,edx
 00056562    mov         eax,[000B67B0];Application:TApplication
 00056567    call        TApplication.SetShowHint
 0005656C    mov         eax,[000B67B0];Application:TApplication
 00056571    call        TComponent.Destroying
 00056576    mov         eax,[000B67B0];Application:TApplication
 0005657B    call        TComponent.DestroyComponents
 00056580    ret
*}
end;

//00056584
function DoDisableWindow(Window:HWND; Data:Longint):BOOL; stdcall;
begin
{*
 00056584    push        ebp
 00056585    mov         ebp,esp
 00056587    push        ebx
 00056588    mov         ebx,dword ptr [ebp+8]
 0005658B    cmp         ebx,dword ptr ds:[0B49B4]
>00056591    je          000565C9
 00056593    push        ebx
 00056594    call        user32.IsWindowVisible
 00056599    test        eax,eax
>0005659B    je          000565C9
 0005659D    push        ebx
 0005659E    call        user32.IsWindowEnabled
 000565A3    test        eax,eax
>000565A5    je          000565C9
 000565A7    mov         eax,8
 000565AC    call        @GetMem
 000565B1    mov         edx,dword ptr ds:[0B49C0]
 000565B7    mov         dword ptr [eax],edx
 000565B9    mov         dword ptr [eax+4],ebx
 000565BC    mov         [000B49C0],eax
 000565C1    push        0
 000565C3    push        ebx
 000565C4    call        user32.EnableWindow
 000565C9    or          eax,0FFFFFFFF
 000565CC    pop         ebx
 000565CD    pop         ebp
 000565CE    ret         8
*}
end;

//000565D4
function DisableTaskWindows(ActiveWindow:HWND):Pointer;
begin
{*
 000565D4    push        ebp
 000565D5    mov         ebp,esp
 000565D7    add         esp,0FFFFFFF4
 000565DA    push        ebx
 000565DB    push        esi
 000565DC    push        edi
 000565DD    xor         edx,edx
 000565DF    mov         dword ptr [ebp-4],edx
 000565E2    mov         edx,dword ptr ds:[0B49B4]
 000565E8    mov         dword ptr [ebp-8],edx
 000565EB    mov         edx,dword ptr ds:[0B49C0]
 000565F1    mov         dword ptr [ebp-0C],edx
 000565F4    mov         [000B49B4],eax
 000565F9    xor         eax,eax
 000565FB    mov         [000B49C0],eax
 00056600    xor         eax,eax
 00056602    push        ebp
 00056603    push        56677
 00056608    push        dword ptr fs:[eax]
 0005660B    mov         dword ptr fs:[eax],esp
 0005660E    xor         eax,eax
 00056610    push        ebp
 00056611    push        56640
 00056616    push        dword ptr fs:[eax]
 00056619    mov         dword ptr fs:[eax],esp
 0005661C    push        0
 0005661E    push        56584;DoDisableWindow:BOOL
 00056623    call        kernel32.GetCurrentThreadId
 00056628    push        eax
 00056629    call        user32.EnumThreadWindows
 0005662E    mov         eax,[000B49C0]
 00056633    mov         dword ptr [ebp-4],eax
 00056636    xor         eax,eax
 00056638    pop         edx
 00056639    pop         ecx
 0005663A    pop         ecx
 0005663B    mov         dword ptr fs:[eax],edx
>0005663E    jmp         00056659
>00056640    jmp         @HandleAnyException
 00056645    mov         eax,[000B49C0]
 0005664A    call        EnableTaskWindows
 0005664F    call        @RaiseAgain
 00056654    call        @DoneExcept
 00056659    xor         eax,eax
 0005665B    pop         edx
 0005665C    pop         ecx
 0005665D    pop         ecx
 0005665E    mov         dword ptr fs:[eax],edx
 00056661    push        5667E
 00056666    mov         eax,dword ptr [ebp-0C]
 00056669    mov         [000B49C0],eax
 0005666E    mov         eax,dword ptr [ebp-8]
 00056671    mov         [000B49B4],eax
 00056676    ret
>00056677    jmp         @HandleFinally
>0005667C    jmp         00056666
 0005667E    mov         eax,dword ptr [ebp-4]
 00056681    pop         edi
 00056682    pop         esi
 00056683    pop         ebx
 00056684    mov         esp,ebp
 00056686    pop         ebp
 00056687    ret
*}
end;

//00056688
procedure EnableTaskWindows(WindowList:Pointer);
begin
{*
 00056688    push        ebx
 00056689    push        esi
 0005668A    mov         esi,eax
 0005668C    test        esi,esi
>0005668E    je          000566BC
 00056690    mov         ebx,esi
 00056692    mov         eax,dword ptr [ebx+4]
 00056695    push        eax
 00056696    call        user32.IsWindow
 0005669B    test        eax,eax
>0005669D    je          000566AA
 0005669F    push        0FF
 000566A1    mov         eax,dword ptr [ebx+4]
 000566A4    push        eax
 000566A5    call        user32.EnableWindow
 000566AA    mov         esi,dword ptr [ebx]
 000566AC    mov         edx,8
 000566B1    mov         eax,ebx
 000566B3    call        @FreeMem
 000566B8    test        esi,esi
>000566BA    jne         00056690
 000566BC    pop         esi
 000566BD    pop         ebx
 000566BE    ret
*}
end;

//000566C0
function DoFindWindow(Window:HWND; Param:Longint):BOOL; stdcall;
begin
{*
 000566C0    push        ebp
 000566C1    mov         ebp,esp
 000566C3    push        ebx
 000566C4    mov         ebx,dword ptr [ebp+8]
 000566C7    cmp         ebx,dword ptr ds:[0B49B4]
>000566CD    je          00056719
 000566CF    mov         eax,[000B67B0];Application:TApplication
 000566D4    cmp         ebx,dword ptr [eax+24]
>000566D7    je          00056719
 000566D9    push        ebx
 000566DA    call        user32.IsWindowVisible
 000566DF    test        eax,eax
>000566E1    je          00056719
 000566E3    push        ebx
 000566E4    call        user32.IsWindowEnabled
 000566E9    test        eax,eax
>000566EB    je          00056719
 000566ED    push        0EC
 000566EF    push        ebx
 000566F0    call        user32.GetWindowLongA
 000566F5    test        al,8
>000566F7    jne         0005670A
 000566F9    cmp         dword ptr ds:[0B49B8],0
>00056700    jne         00056719
 00056702    mov         dword ptr ds:[0B49B8],ebx
>00056708    jmp         00056719
 0005670A    cmp         dword ptr ds:[0B49BC],0
>00056711    jne         00056719
 00056713    mov         dword ptr ds:[0B49BC],ebx
 00056719    or          eax,0FFFFFFFF
 0005671C    pop         ebx
 0005671D    pop         ebp
 0005671E    ret         8
*}
end;

//00056724
function FindTopMostWindow(ActiveWindow:HWND):HWND;
begin
{*
 00056724    mov         [000B49B4],eax
 00056729    xor         eax,eax
 0005672B    mov         [000B49B8],eax
 00056730    xor         eax,eax
 00056732    mov         [000B49BC],eax
 00056737    push        0
 00056739    push        566C0;DoFindWindow:BOOL
 0005673E    call        kernel32.GetCurrentThreadId
 00056743    push        eax
 00056744    call        user32.EnumThreadWindows
 00056749    cmp         dword ptr ds:[0B49B8],0
>00056750    je          00056758
 00056752    mov         eax,[000B49B8]
 00056757    ret
 00056758    mov         eax,[000B49BC]
 0005675D    ret
*}
end;

//00056760
function SendFocusMessage(Window:HWND; Msg:Word):Boolean;
begin
{*
 00056760    push        ebx
 00056761    mov         ebx,dword ptr ds:[0B49B0]
 00056767    push        0
 00056769    push        0
 0005676B    movzx       edx,dx
 0005676E    push        edx
 0005676F    push        eax
 00056770    call        user32.SendMessageA
 00056775    cmp         ebx,dword ptr ds:[0B49B0]
 0005677B    sete        al
 0005677E    pop         ebx
 0005677F    ret
*}
end;

//00056780
function CheckTaskWindow(Window:HWND; Data:Longint):BOOL; stdcall;
begin
{*
 00056780    push        ebp
 00056781    mov         ebp,esp
 00056783    push        ebx
 00056784    mov         eax,dword ptr [ebp+0C]
 00056787    or          edx,0FFFFFFFF
 0005678A    mov         ecx,eax
 0005678C    mov         ebx,dword ptr [ecx]
 0005678E    cmp         ebx,dword ptr [ebp+8]
>00056791    jne         00056799
 00056793    xor         edx,edx
 00056795    mov         byte ptr [ecx+4],1
 00056799    mov         eax,edx
 0005679B    pop         ebx
 0005679C    pop         ebp
 0005679D    ret         8
*}
end;

//000567A0
function ForegroundTask:Boolean;
begin
{*
 000567A0    add         esp,0FFFFFFF8
 000567A3    call        user32.GetActiveWindow
 000567A8    mov         dword ptr [esp],eax
 000567AB    mov         byte ptr [esp+4],0
 000567B0    mov         eax,esp
 000567B2    push        eax
 000567B3    push        56780;CheckTaskWindow:BOOL
 000567B8    call        kernel32.GetCurrentThreadId
 000567BD    push        eax
 000567BE    call        user32.EnumThreadWindows
 000567C3    mov         al,byte ptr [esp+4]
 000567C7    pop         ecx
 000567C8    pop         edx
 000567C9    ret
*}
end;

//000567CC
function FindGlobalComponent(const Name:AnsiString):TComponent;
begin
{*
 000567CC    push        ebx
 000567CD    push        esi
 000567CE    push        edi
 000567CF    push        ebp
 000567D0    mov         ebp,eax
 000567D2    mov         eax,[000B67B4];Screen:TScreen
 000567D7    call        TScreen.GetFormCount
 000567DC    mov         ebx,eax
 000567DE    dec         ebx
 000567DF    test        ebx,ebx
>000567E1    jl          00056806
 000567E3    inc         ebx
 000567E4    xor         edi,edi
 000567E6    mov         edx,edi
 000567E8    mov         eax,[000B67B4];Screen:TScreen
 000567ED    call        TScreen.GetForm
 000567F2    mov         esi,eax
 000567F4    mov         edx,dword ptr [esi+8]
 000567F7    mov         eax,ebp
 000567F9    call        CompareText
 000567FE    test        eax,eax
>00056800    je          0005683C
 00056802    inc         edi
 00056803    dec         ebx
>00056804    jne         000567E6
 00056806    mov         eax,[000B67B4];Screen:TScreen
 0005680B    call        TScreen.GetDataModuleCount
 00056810    mov         ebx,eax
 00056812    dec         ebx
 00056813    test        ebx,ebx
>00056815    jl          0005683A
 00056817    inc         ebx
 00056818    xor         edi,edi
 0005681A    mov         edx,edi
 0005681C    mov         eax,[000B67B4];Screen:TScreen
 00056821    call        TScreen.GetDataModule
 00056826    mov         esi,eax
 00056828    mov         edx,dword ptr [esi+8]
 0005682B    mov         eax,ebp
 0005682D    call        CompareText
 00056832    test        eax,eax
>00056834    je          0005683C
 00056836    inc         edi
 00056837    dec         ebx
>00056838    jne         0005681A
 0005683A    xor         esi,esi
 0005683C    mov         eax,esi
 0005683E    pop         ebp
 0005683F    pop         edi
 00056840    pop         esi
 00056841    pop         ebx
 00056842    ret
*}
end;

//00056844
procedure InitCtl3D;
begin
{*
 00056844    push        ebx
 00056845    cmp         dword ptr ds:[0B67BC],0
>0005684C    jne         000569A4
 00056852    call        kernel32.GetVersion
 00056857    mov         ebx,eax
 00056859    cmp         bl,4
>0005685C    jae         0005688D
 0005685E    mov         eax,ebx
 00056860    call        HiByte
 00056865    cmp         al,59
>00056867    jae         0005688D
 00056869    push        8000
 0005686E    call        kernel32.SetErrorMode
 00056873    mov         ebx,eax
 00056875    push        569A8
 0005687A    call        kernel32.LoadLibraryA
 0005687F    mov         [000B67BC],eax
 00056884    movzx       eax,bx
 00056887    push        eax
 00056888    call        kernel32.SetErrorMode
 0005688D    cmp         dword ptr ds:[0B67BC],0
>00056894    jne         000568A5
 00056896    mov         dword ptr ds:[0B67BC],0FFFFFFFF
>000568A0    jmp         000569A4
 000568A5    push        569B4
 000568AA    mov         eax,[000B67BC]
 000568AF    push        eax
 000568B0    call        kernel32.GetProcAddress
 000568B5    mov         [000B67C0],eax
 000568BA    mov         eax,[000B5950];^HInstance:Longword
 000568BF    mov         eax,dword ptr [eax]
 000568C1    push        eax
 000568C2    call        dword ptr ds:[0B67C0]
 000568C8    test        eax,eax
>000568CA    je          0005698F
 000568D0    push        569C4
 000568D5    mov         eax,[000B67BC]
 000568DA    push        eax
 000568DB    call        kernel32.GetProcAddress
 000568E0    mov         [000B67C4],eax
 000568E5    push        569D4
 000568EA    mov         eax,[000B67BC]
 000568EF    push        eax
 000568F0    call        kernel32.GetProcAddress
 000568F5    mov         [000B67C8],eax
 000568FA    push        569E8
 000568FF    mov         eax,[000B67BC]
 00056904    push        eax
 00056905    call        kernel32.GetProcAddress
 0005690A    mov         [000B67CC],eax
 0005690F    push        569FC
 00056914    mov         eax,[000B67BC]
 00056919    push        eax
 0005691A    call        kernel32.GetProcAddress
 0005691F    mov         [000B49A0],eax;gvar_000B49A0
 00056924    push        56A10
 00056929    mov         eax,[000B67BC]
 0005692E    push        eax
 0005692F    call        kernel32.GetProcAddress
 00056934    mov         [000B49A4],eax
 00056939    push        56A20
 0005693E    mov         eax,[000B67BC]
 00056943    push        eax
 00056944    call        kernel32.GetProcAddress
 00056949    mov         [000B67D0],eax
 0005694E    push        56A34
 00056953    mov         eax,[000B67BC]
 00056958    push        eax
 00056959    call        kernel32.GetProcAddress
 0005695E    mov         [000B67D4],eax
 00056963    push        56A48
 00056968    mov         eax,[000B67BC]
 0005696D    push        eax
 0005696E    call        kernel32.GetProcAddress
 00056973    mov         [000B67D8],eax
 00056978    push        56A5C
 0005697D    mov         eax,[000B67BC]
 00056982    push        eax
 00056983    call        kernel32.GetProcAddress
 00056988    mov         [000B499C],eax
>0005698D    jmp         000569A4
 0005698F    mov         eax,[000B67BC]
 00056994    push        eax
 00056995    call        kernel32.FreeLibrary
 0005699A    mov         dword ptr ds:[0B67BC],0FFFFFFFF
 000569A4    pop         ebx
 000569A5    ret
*}
end;

//00056A6C
procedure DoneCtl3D;
begin
{*
 00056A6C    cmp         dword ptr ds:[0B67BC],0
>00056A73    je          00056A97
 00056A75    cmp         dword ptr ds:[0B67BC],0FFFFFFFF
>00056A7C    je          00056A97
 00056A7E    mov         eax,[000B5950];^HInstance:Longword
 00056A83    mov         eax,dword ptr [eax]
 00056A85    push        eax
 00056A86    call        dword ptr ds:[0B67C4]
 00056A8C    mov         eax,[000B67BC]
 00056A91    push        eax
 00056A92    call        kernel32.FreeLibrary
 00056A97    ret
*}
end;

//00056A98
function Subclass3DWnd(Wnd:HWND):Boolean;
begin
{*
 00056A98    push        ebx
 00056A99    push        esi
 00056A9A    mov         esi,eax
 00056A9C    xor         ebx,ebx
 00056A9E    cmp         dword ptr ds:[0B67BC],0
>00056AA5    jne         00056AAC
 00056AA7    call        InitCtl3D
 00056AAC    cmp         dword ptr ds:[0B67BC],0
>00056AB3    je          00056ACB
 00056AB5    cmp         dword ptr ds:[0B67BC],0FFFFFFFF
>00056ABC    je          00056ACB
 00056ABE    push        esi
 00056ABF    call        dword ptr ds:[0B67C8]
 00056AC5    neg         eax
 00056AC7    sbb         ebx,ebx
 00056AC9    neg         ebx
 00056ACB    mov         eax,ebx
 00056ACD    pop         esi
 00056ACE    pop         ebx
 00056ACF    ret
*}
end;

//00056AD0
procedure Subclass3DDlg(Wnd:HWND; Flags:Word);
begin
{*
 00056AD0    push        ebx
 00056AD1    push        esi
 00056AD2    mov         esi,edx
 00056AD4    mov         ebx,eax
 00056AD6    cmp         dword ptr ds:[0B67BC],0
>00056ADD    jne         00056AE4
 00056ADF    call        InitCtl3D
 00056AE4    cmp         dword ptr ds:[0B67BC],0
>00056AEB    je          00056AFE
 00056AED    cmp         dword ptr ds:[0B67BC],0FFFFFFFF
>00056AF4    je          00056AFE
 00056AF6    push        esi
 00056AF7    push        ebx
 00056AF8    call        dword ptr ds:[0B67CC]
 00056AFE    pop         esi
 00056AFF    pop         ebx
 00056B00    ret
*}
end;

//00056B04
procedure SetAutoSubClass(Enable:Boolean);
begin
{*
 00056B04    push        ebx
 00056B05    mov         ebx,eax
 00056B07    cmp         dword ptr ds:[0B67BC],0
>00056B0E    jne         00056B15
 00056B10    call        InitCtl3D
 00056B15    cmp         dword ptr ds:[0B67BC],0
>00056B1C    je          00056B53
 00056B1E    cmp         dword ptr ds:[0B67BC],0FFFFFFFF
>00056B25    je          00056B53
 00056B27    cmp         dword ptr ds:[0B67D0],0
>00056B2E    je          00056B53
 00056B30    cmp         dword ptr ds:[0B67D4],0
>00056B37    je          00056B53
 00056B39    test        bl,bl
>00056B3B    je          00056B4D
 00056B3D    mov         eax,[000B5950];^HInstance:Longword
 00056B42    mov         eax,dword ptr [eax]
 00056B44    push        eax
 00056B45    call        dword ptr ds:[0B67D0]
>00056B4B    jmp         00056B53
 00056B4D    call        dword ptr ds:[0B67D4]
 00056B53    pop         ebx
 00056B54    ret
*}
end;

//00056B58
function StdWndProc(Window:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;
begin
{*
 00056B58    push        ebp
 00056B59    mov         ebp,esp
 00056B5B    xor         eax,eax
 00056B5D    push        eax
 00056B5E    push        dword ptr [ebp+14]
 00056B61    push        dword ptr [ebp+10]
 00056B64    push        dword ptr [ebp+0C]
 00056B67    mov         edx,esp
 00056B69    mov         eax,dword ptr [ecx+4]
 00056B6C    call        dword ptr [ecx]
 00056B6E    add         esp,0C
 00056B71    pop         eax
 00056B72    pop         ebp
 00056B73    ret         10
*}
end;

//00056B78
function CalcJmpOffset(Src:Pointer; Dest:Pointer):Longint;
begin
{*
 00056B78    add         eax,5
 00056B7B    sub         edx,eax
 00056B7D    mov         eax,edx
 00056B7F    ret
*}
end;

//00056B80
function MakeObjectInstance(Method:TWndMethod):Pointer;
begin
{*
 00056B80    push        ebp
 00056B81    mov         ebp,esp
 00056B83    push        ebx
 00056B84    push        esi
 00056B85    push        edi
 00056B86    mov         edi,0B67E0
 00056B8B    cmp         dword ptr [edi],0
>00056B8E    jne         00056BFC
 00056B90    push        40
 00056B92    push        1000
 00056B97    push        1000
 00056B9C    push        0
 00056B9E    call        kernel32.VirtualAlloc
 00056BA3    mov         esi,eax
 00056BA5    mov         eax,[000B67DC]
 00056BAA    mov         dword ptr [esi],eax
 00056BAC    lea         edx,[esi+4]
 00056BAF    mov         eax,0B49C4
 00056BB4    mov         ecx,2
 00056BB9    call        Move
 00056BBE    mov         edx,56B58;StdWndProc:Longint
 00056BC3    lea         eax,[esi+5]
 00056BC6    call        CalcJmpOffset
 00056BCB    mov         dword ptr [esi+6],eax
 00056BCE    lea         ebx,[esi+0A]
 00056BD1    mov         byte ptr [ebx],0E8
 00056BD4    lea         edx,[esi+4]
 00056BD7    mov         eax,ebx
 00056BD9    call        CalcJmpOffset
 00056BDE    mov         dword ptr [ebx+1],eax
 00056BE1    mov         eax,dword ptr [edi]
 00056BE3    mov         dword ptr [ebx+5],eax
 00056BE6    mov         dword ptr [edi],ebx
 00056BE8    add         ebx,0D
 00056BEB    mov         eax,ebx
 00056BED    sub         eax,esi
 00056BEF    cmp         eax,0FFC
>00056BF4    jl          00056BD1
 00056BF6    mov         dword ptr ds:[0B67DC],esi
 00056BFC    mov         eax,dword ptr [edi]
 00056BFE    mov         ebx,dword ptr [edi]
 00056C00    mov         edx,dword ptr [ebx+5]
 00056C03    mov         dword ptr [edi],edx
 00056C05    mov         edx,dword ptr [ebp+8]
 00056C08    mov         dword ptr [ebx+5],edx
 00056C0B    mov         edx,dword ptr [ebp+0C]
 00056C0E    mov         dword ptr [ebx+9],edx
 00056C11    pop         edi
 00056C12    pop         esi
 00056C13    pop         ebx
 00056C14    pop         ebp
 00056C15    ret         8
*}
end;

//00056C18
procedure FreeObjectInstance(ObjectInstance:Pointer);
begin
{*
 00056C18    test        eax,eax
>00056C1A    je          00056C2A
 00056C1C    mov         edx,dword ptr ds:[0B67E0]
 00056C22    mov         dword ptr [eax+5],edx
 00056C25    mov         [000B67E0],eax
 00056C2A    ret
*}
end;

//00056C2C
procedure _NF__527;
begin
{*
 00056C2C    push        esp
 00056C2D    push        eax
 00056C2E    push        ebp
>00056C2F    je          00056C9A
 00056C31    ins         byte ptr [edi],dl
 00056C32    push        edi
 00056C33    imul        ebp,dword ptr [esi+64],776F
 00056C3A    add         byte ptr [eax],al
 00056C3C    push        ebp
 00056C3D    mov         ebp,esp
 00056C3F    add         esp,0FFFFFFD8
 00056C42    push        ebx
 00056C43    mov         eax,[000B5950];^HInstance:Longword
 00056C48    mov         eax,dword ptr [eax]
 00056C4A    mov         [000B49D8],eax
 00056C4F    lea         eax,[ebp-28]
 00056C52    push        eax
 00056C53    mov         eax,[000B49EC];^_NF__527
 00056C58    push        eax
 00056C59    mov         eax,[000B5950];^HInstance:Longword
 00056C5E    mov         eax,dword ptr [eax]
 00056C60    push        eax
 00056C61    call        user32.GetClassInfoA
 00056C66    neg         eax
 00056C68    sbb         eax,eax
 00056C6A    neg         eax
 00056C6C    test        al,al
>00056C6E    je          00056C7A
 00056C70    mov         edx,16CA0;user32.DefWindowProcA:Longint
 00056C75    cmp         edx,dword ptr [ebp-24]
>00056C78    je          00056C9B
 00056C7A    test        al,al
>00056C7C    je          00056C91
 00056C7E    mov         eax,[000B5950];^HInstance:Longword
 00056C83    mov         eax,dword ptr [eax]
 00056C85    push        eax
 00056C86    mov         eax,[000B49EC];^_NF__527
 00056C8B    push        eax
 00056C8C    call        user32.UnregisterClassA
 00056C91    push        0B49C8
 00056C96    call        user32.RegisterClassA
 00056C9B    push        0
 00056C9D    mov         eax,[000B5950];^HInstance:Longword
 00056CA2    mov         eax,dword ptr [eax]
 00056CA4    push        eax
 00056CA5    push        0
 00056CA7    push        0
 00056CA9    push        0
 00056CAB    push        0
 00056CAD    push        0
 00056CAF    push        0
 00056CB1    push        80000000
 00056CB6    push        56CF4
 00056CBB    mov         eax,[000B49EC];^_NF__527
 00056CC0    push        eax
 00056CC1    push        80
 00056CC6    call        user32.CreateWindowExA
 00056CCB    mov         ebx,eax
 00056CCD    cmp         word ptr [ebp+0A],0
>00056CD2    je          00056CE8
 00056CD4    push        dword ptr [ebp+0C]
 00056CD7    push        dword ptr [ebp+8]
 00056CDA    call        MakeObjectInstance
 00056CDF    push        eax
 00056CE0    push        0FC
 00056CE2    push        ebx
 00056CE3    call        user32.SetWindowLongA
 00056CE8    mov         eax,ebx
 00056CEA    pop         ebx
 00056CEB    mov         esp,ebp
 00056CED    pop         ebp
 00056CEE    ret         8
*}
end;

//00056C3C
function AllocateHWnd(Method:TWndMethod):HWND;
begin
{*
 00056C3C    push        ebp
 00056C3D    mov         ebp,esp
 00056C3F    add         esp,0FFFFFFD8
 00056C42    push        ebx
 00056C43    mov         eax,[000B5950];^HInstance:Longword
 00056C48    mov         eax,dword ptr [eax]
 00056C4A    mov         [000B49D8],eax
 00056C4F    lea         eax,[ebp-28]
 00056C52    push        eax
 00056C53    mov         eax,[000B49EC];^_NF__527
 00056C58    push        eax
 00056C59    mov         eax,[000B5950];^HInstance:Longword
 00056C5E    mov         eax,dword ptr [eax]
 00056C60    push        eax
 00056C61    call        user32.GetClassInfoA
 00056C66    neg         eax
 00056C68    sbb         eax,eax
 00056C6A    neg         eax
 00056C6C    test        al,al
>00056C6E    je          00056C7A
 00056C70    mov         edx,16CA0;user32.DefWindowProcA:Longint
 00056C75    cmp         edx,dword ptr [ebp-24]
>00056C78    je          00056C9B
 00056C7A    test        al,al
>00056C7C    je          00056C91
 00056C7E    mov         eax,[000B5950];^HInstance:Longword
 00056C83    mov         eax,dword ptr [eax]
 00056C85    push        eax
 00056C86    mov         eax,[000B49EC];^_NF__527
 00056C8B    push        eax
 00056C8C    call        user32.UnregisterClassA
 00056C91    push        0B49C8
 00056C96    call        user32.RegisterClassA
 00056C9B    push        0
 00056C9D    mov         eax,[000B5950];^HInstance:Longword
 00056CA2    mov         eax,dword ptr [eax]
 00056CA4    push        eax
 00056CA5    push        0
 00056CA7    push        0
 00056CA9    push        0
 00056CAB    push        0
 00056CAD    push        0
 00056CAF    push        0
 00056CB1    push        80000000
 00056CB6    push        56CF4
 00056CBB    mov         eax,[000B49EC];^_NF__527
 00056CC0    push        eax
 00056CC1    push        80
 00056CC6    call        user32.CreateWindowExA
 00056CCB    mov         ebx,eax
 00056CCD    cmp         word ptr [ebp+0A],0
>00056CD2    je          00056CE8
 00056CD4    push        dword ptr [ebp+0C]
 00056CD7    push        dword ptr [ebp+8]
 00056CDA    call        MakeObjectInstance
 00056CDF    push        eax
 00056CE0    push        0FC
 00056CE2    push        ebx
 00056CE3    call        user32.SetWindowLongA
 00056CE8    mov         eax,ebx
 00056CEA    pop         ebx
 00056CEB    mov         esp,ebp
 00056CED    pop         ebp
 00056CEE    ret         8
*}
end;

//00056CF8
procedure DeallocateHWnd(Wnd:HWND);
begin
{*
 00056CF8    push        ebx
 00056CF9    push        esi
 00056CFA    mov         esi,eax
 00056CFC    push        0FC
 00056CFE    push        esi
 00056CFF    call        user32.GetWindowLongA
 00056D04    mov         ebx,eax
 00056D06    push        esi
 00056D07    call        user32.DestroyWindow
 00056D0C    cmp         ebx,16CA0;user32.DefWindowProcA:Longint
>00056D12    je          00056D1B
 00056D14    mov         eax,ebx
 00056D16    call        FreeObjectInstance
 00056D1B    pop         esi
 00056D1C    pop         ebx
 00056D1D    ret
*}
end;

//00056D20
function KeysToShiftState(Keys:Word):TShiftState;
begin
{*
 00056D20    push        ebx
 00056D21    push        esi
 00056D22    mov         esi,eax
 00056D24    mov         bl,byte ptr ds:[56D70]
 00056D2A    test        si,4
>00056D2F    je          00056D34
 00056D31    or          bl,1
 00056D34    test        si,8
>00056D39    je          00056D3E
 00056D3B    or          bl,4
 00056D3E    test        si,1
>00056D43    je          00056D48
 00056D45    or          bl,8
 00056D48    test        si,2
>00056D4D    je          00056D52
 00056D4F    or          bl,10
 00056D52    test        si,10
>00056D57    je          00056D5C
 00056D59    or          bl,20
 00056D5C    push        12
 00056D5E    call        user32.GetKeyState
 00056D63    test        ax,ax
>00056D66    jge         00056D6B
 00056D68    or          bl,2
 00056D6B    mov         eax,ebx
 00056D6D    pop         esi
 00056D6E    pop         ebx
 00056D6F    ret
*}
end;

//00056D74
function KeyDataToShiftState(KeyData:Longint):TShiftState;
begin
{*
 00056D74    push        ebx
 00056D75    push        esi
 00056D76    mov         esi,eax
 00056D78    mov         bl,byte ptr ds:[56DAC]
 00056D7E    push        10
 00056D80    call        user32.GetKeyState
 00056D85    test        ax,ax
>00056D88    jge         00056D8D
 00056D8A    or          bl,1
 00056D8D    push        11
 00056D8F    call        user32.GetKeyState
 00056D94    test        ax,ax
>00056D97    jge         00056D9C
 00056D99    or          bl,4
 00056D9C    test        esi,20000000
>00056DA2    je          00056DA7
 00056DA4    or          bl,2
 00056DA7    mov         eax,ebx
 00056DA9    pop         esi
 00056DAA    pop         ebx
 00056DAB    ret
*}
end;

//00056DB0
function KeyboardStateToShiftState(const KeyboardState:TKeyboardState):TShiftState;
begin
{*
 00056DB0    push        ebx
 00056DB1    push        esi
 00056DB2    mov         esi,eax
 00056DB4    mov         bl,byte ptr ds:[56DF8]
 00056DBA    test        byte ptr [esi+10],80
>00056DBE    je          00056DC3
 00056DC0    or          bl,1
 00056DC3    test        byte ptr [esi+11],80
>00056DC7    je          00056DCC
 00056DC9    or          bl,4
 00056DCC    test        byte ptr [esi+12],80
>00056DD0    je          00056DD5
 00056DD2    or          bl,2
 00056DD5    test        byte ptr [esi+1],80
>00056DD9    je          00056DDE
 00056DDB    or          bl,8
 00056DDE    test        byte ptr [esi+2],80
>00056DE2    je          00056DE7
 00056DE4    or          bl,10
 00056DE7    test        byte ptr [esi+4],80
>00056DEB    je          00056DF0
 00056DED    or          bl,20
 00056DF0    mov         eax,ebx
 00056DF2    pop         esi
 00056DF3    pop         ebx
 00056DF4    ret
*}
end;

//00056DFC
function IsAccel(VK:Word; const Str:AnsiString):Boolean;
begin
{*
 00056DFC    push        ebp
 00056DFD    mov         ebp,esp
 00056DFF    push        0
 00056E01    push        0
 00056E03    push        ebx
 00056E04    push        esi
 00056E05    push        edi
 00056E06    mov         esi,edx
 00056E08    mov         edi,eax
 00056E0A    xor         eax,eax
 00056E0C    push        ebp
 00056E0D    push        56E7E
 00056E12    push        dword ptr fs:[eax]
 00056E15    mov         dword ptr fs:[eax],esp
 00056E18    mov         edx,esi
 00056E1A    mov         eax,56E98;'&'
 00056E1F    call        @LStrPos
 00056E24    mov         ebx,eax
 00056E26    test        ebx,ebx
>00056E28    je          00056E5B
 00056E2A    mov         eax,esi
 00056E2C    call        @LStrLen
 00056E31    cmp         ebx,eax
>00056E33    jge         00056E5B
 00056E35    lea         eax,[ebp-4]
 00056E38    mov         edx,edi
 00056E3A    call        @LStrFromChar
 00056E3F    mov         eax,dword ptr [ebp-4]
 00056E42    push        eax
 00056E43    lea         eax,[ebp-8]
 00056E46    mov         dl,byte ptr [esi+ebx]
 00056E49    call        @LStrFromChar
 00056E4E    mov         eax,dword ptr [ebp-8]
 00056E51    pop         edx
 00056E52    call        AnsiCompareText
 00056E57    test        eax,eax
>00056E59    je          00056E5F
 00056E5B    xor         eax,eax
>00056E5D    jmp         00056E61
 00056E5F    mov         al,1
 00056E61    mov         ebx,eax
 00056E63    xor         eax,eax
 00056E65    pop         edx
 00056E66    pop         ecx
 00056E67    pop         ecx
 00056E68    mov         dword ptr fs:[eax],edx
 00056E6B    push        56E85
 00056E70    lea         eax,[ebp-8]
 00056E73    mov         edx,2
 00056E78    call        @LStrArrayClr
 00056E7D    ret
>00056E7E    jmp         @HandleFinally
>00056E83    jmp         00056E70
 00056E85    mov         eax,ebx
 00056E87    pop         edi
 00056E88    pop         esi
 00056E89    pop         ebx
 00056E8A    pop         ecx
 00056E8B    pop         ecx
 00056E8C    pop         ebp
 00056E8D    ret
*}
end;

//00056E9C
function GetParentForm(Control:TControl):TCustomForm;
begin
{*
 00056E9C    push        ebx
 00056E9D    mov         ebx,eax
>00056E9F    jmp         00056EA3
 00056EA1    mov         ebx,eax
 00056EA3    mov         eax,dword ptr [ebx+24]
 00056EA6    test        eax,eax
>00056EA8    jne         00056EA1
 00056EAA    mov         eax,ebx
 00056EAC    mov         edx,dword ptr ds:[55208];TCustomForm
 00056EB2    call        @IsClass
 00056EB7    test        al,al
>00056EB9    je          00056EBF
 00056EBB    mov         eax,ebx
 00056EBD    pop         ebx
 00056EBE    ret
 00056EBF    xor         eax,eax
 00056EC1    pop         ebx
 00056EC2    ret
*}
end;

//00056EC4
function ValidParentForm(Control:TControl):TCustomForm;
begin
{*
 00056EC4    push        ebp
 00056EC5    mov         ebp,esp
 00056EC7    add         esp,0FFFFFFF4
 00056ECA    push        ebx
 00056ECB    push        esi
 00056ECC    xor         edx,edx
 00056ECE    mov         dword ptr [ebp-0C],edx
 00056ED1    mov         esi,eax
 00056ED3    xor         eax,eax
 00056ED5    push        ebp
 00056ED6    push        56F35
 00056EDB    push        dword ptr fs:[eax]
 00056EDE    mov         dword ptr fs:[eax],esp
 00056EE1    mov         eax,esi
 00056EE3    call        GetParentForm
 00056EE8    mov         ebx,eax
 00056EEA    test        ebx,ebx
>00056EEC    jne         00056F1F
 00056EEE    mov         eax,dword ptr [esi+8]
 00056EF1    mov         dword ptr [ebp-8],eax
 00056EF4    mov         byte ptr [ebp-4],0B
 00056EF8    lea         eax,[ebp-8]
 00056EFB    push        eax
 00056EFC    push        0
 00056EFE    lea         edx,[ebp-0C]
 00056F01    mov         eax,[000B5A5C];^SParentRequired:TResStringRec
 00056F06    call        LoadResString
 00056F0B    mov         ecx,dword ptr [ebp-0C]
 00056F0E    mov         dl,1
 00056F10    mov         eax,[0001EE64];EInvalidOperation
 00056F15    call        Exception.CreateFmt
 00056F1A    call        @RaiseExcept
 00056F1F    xor         eax,eax
 00056F21    pop         edx
 00056F22    pop         ecx
 00056F23    pop         ecx
 00056F24    mov         dword ptr fs:[eax],edx
 00056F27    push        56F3C
 00056F2C    lea         eax,[ebp-0C]
 00056F2F    call        @LStrClr
 00056F34    ret
>00056F35    jmp         @HandleFinally
>00056F3A    jmp         00056F2C
 00056F3C    mov         eax,ebx
 00056F3E    pop         esi
 00056F3F    pop         ebx
 00056F40    mov         esp,ebp
 00056F42    pop         ebp
 00056F43    ret
*}
end;

//00056F44
constructor TControlScrollBar.Create(AControl:TScrollingWinControl; AKind:TScrollBarKind);
begin
{*
 00056F44    push        ebp
 00056F45    mov         ebp,esp
 00056F47    push        ebx
 00056F48    push        esi
 00056F49    push        edi
 00056F4A    test        dl,dl
>00056F4C    je          00056F56
 00056F4E    add         esp,0FFFFFFF0
 00056F51    call        @ClassCreate
 00056F56    mov         esi,ecx
 00056F58    mov         ebx,edx
 00056F5A    mov         edi,eax
 00056F5C    xor         edx,edx
 00056F5E    mov         eax,edi
 00056F60    call        TObject.Create
 00056F65    mov         dword ptr [edi+4],esi
 00056F68    mov         al,byte ptr [ebp+8]
 00056F6B    mov         byte ptr [edi+18],al
 00056F6E    mov         cx,50
 00056F72    mov         word ptr [edi+0A],cx
 00056F76    movzx       eax,cx
 00056F79    mov         ecx,0A
 00056F7E    xor         edx,edx
 00056F80    div         eax,ecx
 00056F82    mov         word ptr [edi+8],ax
 00056F86    mov         byte ptr [edi+1C],1
 00056F8A    mov         dword ptr [edi+20],0A
 00056F91    mov         dword ptr [edi+40],4
 00056F98    mov         dword ptr [edi+3C],0C
 00056F9F    mov         dword ptr [edi+28],80000014
 00056FA6    mov         byte ptr [edi+2C],1
 00056FAA    mov         byte ptr [edi+44],1
 00056FAE    mov         eax,edi
 00056FB0    test        bl,bl
>00056FB2    je          00056FC3
 00056FB4    call        @AfterConstruction
 00056FB9    pop         dword ptr fs:[0]
 00056FC0    add         esp,0C
 00056FC3    mov         eax,edi
 00056FC5    pop         edi
 00056FC6    pop         esi
 00056FC7    pop         ebx
 00056FC8    pop         ebp
 00056FC9    ret         4
*}
end;

//00056FCC
procedure TControlScrollBar.IsStoredIncrement(Value:TScrollBarInc);
begin
{*
 00056FCC    mov         al,byte ptr [eax+1F];TControlScrollBar.Smooth:Boolean
 00056FCF    xor         al,1
 00056FD1    ret
*}
end;

//00056FD4
procedure TControlScrollBar.Assign(Source:TPersistent);
begin
{*
 00056FD4    push        ebx
 00056FD5    push        esi
 00056FD6    push        edi
 00056FD7    mov         esi,edx
 00056FD9    mov         ebx,eax
 00056FDB    mov         eax,esi
 00056FDD    mov         edx,dword ptr ds:[54240];TControlScrollBar
 00056FE3    call        @IsClass
 00056FE8    test        al,al
>00056FEA    je          00057016
 00056FEC    mov         edi,esi
 00056FEE    mov         dl,byte ptr [edi+1C]
 00056FF1    mov         eax,ebx
 00056FF3    call        TControlScrollBar.SetVisible
 00056FF8    mov         edx,dword ptr [edi+10]
 00056FFB    mov         eax,ebx
 00056FFD    call        TControlScrollBar.SetRange
 00057002    mov         edx,dword ptr [edi+0C]
 00057005    mov         eax,ebx
 00057007    call        TControlScrollBar.SetPosition
 0005700C    mov         ax,word ptr [edi+8]
 00057010    mov         word ptr [ebx+8],ax
>00057014    jmp         0005701F
 00057016    mov         edx,esi
 00057018    mov         eax,ebx
 0005701A    call        TPersistent.Assign
 0005701F    pop         edi
 00057020    pop         esi
 00057021    pop         ebx
 00057022    ret
*}
end;

//00057024
procedure TControlScrollBar.ChangeBiDiPosition;
begin
{*
 00057024    push        ebx
 00057025    mov         ebx,eax
 00057027    cmp         byte ptr [ebx+18],0
>0005702B    jne         00057059
 0005702D    mov         eax,ebx
 0005702F    call        TControlScrollBar.IsScrollBarVisible
 00057034    test        al,al
>00057036    je          00057059
 00057038    mov         eax,dword ptr [ebx+4]
 0005703B    call        TControl.UseRightToLeftScrollBar
 00057040    test        al,al
>00057042    jne         0005704F
 00057044    xor         edx,edx
 00057046    mov         eax,ebx
 00057048    call        TControlScrollBar.SetPosition
>0005704D    jmp         00057059
 0005704F    mov         edx,dword ptr [ebx+10]
 00057052    mov         eax,ebx
 00057054    call        TControlScrollBar.SetPosition
 00057059    pop         ebx
 0005705A    ret
*}
end;

//0005705C
procedure ProcessHorz(Control:TControl);
begin
{*
 0005705C    push        ebp
 0005705D    mov         ebp,esp
 0005705F    push        ebx
 00057060    mov         ebx,eax
 00057062    cmp         byte ptr [ebx+47],0
>00057066    je          000570A4
 00057068    mov         al,byte ptr [ebx+4B]
 0005706B    sub         al,1
>0005706D    jb          00057079
 0005706F    sub         al,2
>00057071    je          00057079
 00057073    dec         al
>00057075    je          0005709B
>00057077    jmp         000570A4
 00057079    mov         eax,dword ptr [ebp+8]
 0005707C    mov         eax,dword ptr [eax-8]
 0005707F    mov         edx,dword ptr [eax+0C]
 00057082    add         edx,dword ptr [ebx+30]
 00057085    add         edx,dword ptr [ebx+38]
 00057088    mov         eax,dword ptr [ebp+8]
 0005708B    mov         eax,dword ptr [eax-4]
 0005708E    call        Max
 00057093    mov         edx,dword ptr [ebp+8]
 00057096    mov         dword ptr [edx-4],eax
>00057099    jmp         000570A4
 0005709B    mov         eax,dword ptr [ebp+8]
 0005709E    mov         edx,dword ptr [ebx+38]
 000570A1    add         dword ptr [eax-0C],edx
 000570A4    pop         ebx
 000570A5    pop         ebp
 000570A6    ret
*}
end;

//000570A8
procedure ProcessVert(Control:TControl);
begin
{*
 000570A8    push        ebp
 000570A9    mov         ebp,esp
 000570AB    push        ebx
 000570AC    mov         ebx,eax
 000570AE    cmp         byte ptr [ebx+47],0
>000570B2    je          000570EA
 000570B4    mov         al,byte ptr [ebx+4B]
 000570B7    sub         al,2
>000570B9    jb          000570BF
>000570BB    je          000570E1
>000570BD    jmp         000570EA
 000570BF    mov         eax,dword ptr [ebp+8]
 000570C2    mov         eax,dword ptr [eax-8]
 000570C5    mov         edx,dword ptr [eax+0C]
 000570C8    add         edx,dword ptr [ebx+34]
 000570CB    add         edx,dword ptr [ebx+3C]
 000570CE    mov         eax,dword ptr [ebp+8]
 000570D1    mov         eax,dword ptr [eax-4]
 000570D4    call        Max
 000570D9    mov         edx,dword ptr [ebp+8]
 000570DC    mov         dword ptr [edx-4],eax
>000570DF    jmp         000570EA
 000570E1    mov         eax,dword ptr [ebp+8]
 000570E4    mov         edx,dword ptr [ebx+3C]
 000570E7    add         dword ptr [eax-0C],edx
 000570EA    pop         ebx
 000570EB    pop         ebp
 000570EC    ret
*}
end;

//000570F0
procedure TControlScrollBar.CalcAutoRange;
begin
{*
 000570F0    push        ebp
 000570F1    mov         ebp,esp
 000570F3    add         esp,0FFFFFFF4
 000570F6    push        ebx
 000570F7    push        esi
 000570F8    mov         dword ptr [ebp-8],eax
 000570FB    mov         eax,dword ptr [ebp-8]
 000570FE    mov         ebx,dword ptr [eax+4]
 00057101    cmp         byte ptr [ebx+1F4],0
>00057108    je          00057195
 0005710E    mov         eax,ebx
 00057110    mov         edx,dword ptr [eax]
 00057112    call        dword ptr [edx+0B8]
 00057118    test        al,al
>0005711A    je          0005718B
 0005711C    xor         eax,eax
 0005711E    mov         dword ptr [ebp-4],eax
 00057121    xor         eax,eax
 00057123    mov         dword ptr [ebp-0C],eax
 00057126    mov         eax,dword ptr [ebp-8]
 00057129    mov         eax,dword ptr [eax+4]
 0005712C    call        TWinControl.GetControlCount
 00057131    mov         ebx,eax
 00057133    dec         ebx
 00057134    test        ebx,ebx
>00057136    jl          00057172
 00057138    inc         ebx
 00057139    xor         esi,esi
 0005713B    mov         eax,dword ptr [ebp-8]
 0005713E    cmp         byte ptr [eax+18],0
>00057142    jne         0005715A
 00057144    push        ebp
 00057145    mov         eax,dword ptr [ebp-8]
 00057148    mov         eax,dword ptr [eax+4]
 0005714B    mov         edx,esi
 0005714D    call        TWinControl.GetControl
 00057152    call        ProcessHorz
 00057157    pop         ecx
>00057158    jmp         0005716E
 0005715A    push        ebp
 0005715B    mov         eax,dword ptr [ebp-8]
 0005715E    mov         eax,dword ptr [eax+4]
 00057161    mov         edx,esi
 00057163    call        TWinControl.GetControl
 00057168    call        ProcessVert
 0005716D    pop         ecx
 0005716E    inc         esi
 0005716F    dec         ebx
>00057170    jne         0005713B
 00057172    mov         edx,dword ptr [ebp-4]
 00057175    add         edx,dword ptr [ebp-0C]
 00057178    mov         eax,dword ptr [ebp-8]
 0005717B    movzx       eax,word ptr [eax+1A]
 0005717F    add         edx,eax
 00057181    mov         eax,dword ptr [ebp-8]
 00057184    call        TControlScrollBar.DoSetRange
>00057189    jmp         00057195
 0005718B    xor         edx,edx
 0005718D    mov         eax,dword ptr [ebp-8]
 00057190    call        TControlScrollBar.DoSetRange
 00057195    pop         esi
 00057196    pop         ebx
 00057197    mov         esp,ebp
 00057199    pop         ebp
 0005719A    ret
*}
end;

//0005719C
function TControlScrollBar.IsScrollBarVisible:Boolean;
begin
{*
 0005719C    push        ebx
 0005719D    push        esi
 0005719E    mov         ebx,eax
 000571A0    mov         esi,100000
 000571A5    cmp         byte ptr [ebx+18],1
>000571A9    jne         000571B0
 000571AB    mov         esi,200000
 000571B0    cmp         byte ptr [ebx+1C],0
>000571B4    je          000571CA
 000571B6    push        0F0
 000571B8    mov         eax,dword ptr [ebx+4]
 000571BB    call        TWinControl.GetHandle
 000571C0    push        eax
 000571C1    call        user32.GetWindowLongA
 000571C6    test        eax,esi
>000571C8    jne         000571CF
 000571CA    xor         eax,eax
 000571CC    pop         esi
 000571CD    pop         ebx
 000571CE    ret
 000571CF    mov         al,1
 000571D1    pop         esi
 000571D2    pop         ebx
 000571D3    ret
*}
end;

//000571D4
function ScrollBarVisible(Code:Word):Boolean;
begin
{*
 000571D4    push        ebp
 000571D5    mov         ebp,esp
 000571D7    push        ebx
 000571D8    mov         ebx,100000
 000571DD    cmp         ax,1
>000571E1    jne         000571E8
 000571E3    mov         ebx,200000
 000571E8    push        0F0
 000571EA    mov         eax,dword ptr [ebp+8]
 000571ED    mov         eax,dword ptr [eax-4]
 000571F0    mov         eax,dword ptr [eax+4]
 000571F3    call        TWinControl.GetHandle
 000571F8    push        eax
 000571F9    call        user32.GetWindowLongA
 000571FE    test        eax,ebx
 00057200    setne       al
 00057203    pop         ebx
 00057204    pop         ebp
 00057205    ret
*}
end;

//00057208
function Adjustment(Code:Word; Metric:Word):Integer;
begin
{*
 00057208    push        ebp
 00057209    mov         ebp,esp
 0005720B    push        ebx
 0005720C    push        esi
 0005720D    push        edi
 0005720E    mov         edi,edx
 00057210    mov         esi,eax
 00057212    xor         ebx,ebx
 00057214    mov         eax,dword ptr [ebp+8]
 00057217    cmp         byte ptr [eax-5],0
>0005721B    jne         0005727D
 0005721D    mov         eax,dword ptr [ebp+8]
 00057220    cmp         byte ptr [eax-6],0
>00057224    je          0005724F
 00057226    mov         eax,dword ptr [ebp+8]
 00057229    push        eax
 0005722A    mov         eax,esi
 0005722C    call        ScrollBarVisible
 00057231    pop         ecx
 00057232    test        al,al
>00057234    jne         0005724F
 00057236    movzx       eax,di
 00057239    push        eax
 0005723A    mov         eax,[000B582C];^gvar_000B66A0
 0005723F    mov         eax,dword ptr [eax]
 00057241    call        eax
 00057243    mov         ebx,eax
 00057245    mov         eax,dword ptr [ebp+8]
 00057248    sub         ebx,dword ptr [eax-0C]
 0005724B    neg         ebx
>0005724D    jmp         0005727D
 0005724F    mov         eax,dword ptr [ebp+8]
 00057252    cmp         byte ptr [eax-6],0
>00057256    jne         0005727D
 00057258    mov         eax,dword ptr [ebp+8]
 0005725B    push        eax
 0005725C    mov         eax,esi
 0005725E    call        ScrollBarVisible
 00057263    pop         ecx
 00057264    test        al,al
>00057266    je          0005727D
 00057268    movzx       eax,di
 0005726B    push        eax
 0005726C    mov         eax,[000B582C];^gvar_000B66A0
 00057271    mov         eax,dword ptr [eax]
 00057273    call        eax
 00057275    mov         ebx,eax
 00057277    mov         eax,dword ptr [ebp+8]
 0005727A    sub         ebx,dword ptr [eax-0C]
 0005727D    mov         eax,ebx
 0005727F    pop         edi
 00057280    pop         esi
 00057281    pop         ebx
 00057282    pop         ebp
 00057283    ret
*}
end;

//00057284
function TControlScrollBar.ControlSize(ControlSB:Boolean; AssumeSB:Boolean):Integer;
begin
{*
 00057284    push        ebp
 00057285    mov         ebp,esp
 00057287    add         esp,0FFFFFFF4
 0005728A    push        ebx
 0005728B    mov         byte ptr [ebp-6],cl
 0005728E    mov         byte ptr [ebp-5],dl
 00057291    mov         dword ptr [ebp-4],eax
 00057294    push        0F0
 00057296    mov         eax,dword ptr [ebp-4]
 00057299    mov         eax,dword ptr [eax+4]
 0005729C    call        TWinControl.GetHandle
 000572A1    push        eax
 000572A2    call        user32.GetWindowLongA
 000572A7    test        eax,840000
 000572AC    setne       al
 000572AF    and         eax,7F
 000572B2    mov         dword ptr [ebp-0C],eax
 000572B5    mov         eax,dword ptr [ebp-4]
 000572B8    cmp         byte ptr [eax+18],1
>000572BC    jne         000572DE
 000572BE    push        ebp
 000572BF    mov         dx,15
 000572C3    xor         eax,eax
 000572C5    call        Adjustment
 000572CA    pop         ecx
 000572CB    mov         ebx,eax
 000572CD    mov         eax,dword ptr [ebp-4]
 000572D0    mov         eax,dword ptr [eax+4]
 000572D3    call        TControl.GetClientHeight
 000572D8    add         ebx,eax
 000572DA    mov         eax,ebx
>000572DC    jmp         000572FE
 000572DE    push        ebp
 000572DF    mov         dx,14
 000572E3    mov         ax,1
 000572E7    call        Adjustment
 000572EC    pop         ecx
 000572ED    mov         ebx,eax
 000572EF    mov         eax,dword ptr [ebp-4]
 000572F2    mov         eax,dword ptr [eax+4]
 000572F5    call        TControl.GetClientWidth
 000572FA    add         ebx,eax
 000572FC    mov         eax,ebx
 000572FE    pop         ebx
 000572FF    mov         esp,ebp
 00057301    pop         ebp
 00057302    ret
*}
end;

//00057304
function TControlScrollBar.GetScrollPos:Integer;
begin
{*
 00057304    xor         edx,edx
 00057306    cmp         byte ptr [eax+1C],0
>0005730A    je          0005730F
 0005730C    mov         edx,dword ptr [eax+0C]
 0005730F    mov         eax,edx
 00057311    ret
*}
end;

//00057314
function TControlScrollBar.NeedsScrollBarVisible:Boolean;
begin
{*
 00057314    push        ebx
 00057315    mov         ebx,eax
 00057317    xor         ecx,ecx
 00057319    xor         edx,edx
 0005731B    mov         eax,ebx
 0005731D    call        TControlScrollBar.ControlSize
 00057322    cmp         eax,dword ptr [ebx+10]
 00057325    setl        al
 00057328    pop         ebx
 00057329    ret
*}
end;

//0005732C
function GetRealScrollPosition:Integer;
begin
{*
 0005732C    push        ebp
 0005732D    mov         ebp,esp
 0005732F    add         esp,0FFFFFFE4
 00057332    push        ebx
 00057333    push        esi
 00057334    mov         dword ptr [ebp-1C],1C
 0005733B    mov         dword ptr [ebp-18],10
 00057342    xor         ebx,ebx
 00057344    mov         eax,dword ptr [ebp+8]
 00057347    mov         eax,dword ptr [eax-4]
 0005734A    cmp         byte ptr [eax+18],1
>0005734E    jne         00057355
 00057350    mov         ebx,1
 00057355    mov         eax,dword ptr [ebp+8]
 00057358    mov         esi,dword ptr [eax-8]
 0005735B    movsx       esi,word ptr [esi+6]
 0005735F    lea         eax,[ebp-1C]
 00057362    push        eax
 00057363    push        ebx
 00057364    mov         eax,dword ptr [ebp+8]
 00057367    mov         eax,dword ptr [eax-4]
 0005736A    mov         eax,dword ptr [eax+4]
 0005736D    call        TWinControl.GetHandle
 00057372    push        eax
 00057373    mov         eax,[000B568C]
 00057378    mov         eax,dword ptr [eax]
 0005737A    call        eax
 0005737C    test        eax,eax
>0005737E    je          00057383
 00057380    mov         esi,dword ptr [ebp-4]
 00057383    mov         eax,esi
 00057385    pop         esi
 00057386    pop         ebx
 00057387    mov         esp,ebp
 00057389    pop         ebp
 0005738A    ret
*}
end;

//0005738C
procedure TControlScrollBar.ScrollMessage(var Msg:TWMScroll);
begin
{*
 0005738C    push        ebp
 0005738D    mov         ebp,esp
 0005738F    add         esp,0FFFFFFF0
 00057392    push        ebx
 00057393    push        esi
 00057394    push        edi
 00057395    mov         dword ptr [ebp-8],edx
 00057398    mov         dword ptr [ebp-4],eax
 0005739B    mov         eax,dword ptr [ebp-4]
 0005739E    cmp         byte ptr [eax+1F],0
>000573A2    je          00057546
 000573A8    mov         eax,dword ptr [ebp-8]
 000573AB    mov         ax,word ptr [eax+4]
 000573AF    sub         ax,4
>000573B3    jae         00057546
 000573B9    mov         eax,dword ptr [ebp-8]
 000573BC    mov         ax,word ptr [eax+4]
 000573C0    sub         ax,2
>000573C4    jb          000573CE
 000573C6    sub         ax,2
>000573CA    jb          000573EF
>000573CC    jmp         00057415
 000573CE    mov         eax,dword ptr [ebp-4]
 000573D1    movzx       ebx,word ptr [eax+8]
 000573D5    mov         eax,ebx
 000573D7    mov         edx,dword ptr [ebp-4]
 000573DA    mov         ecx,dword ptr [edx+40]
 000573DD    cdq
 000573DE    idiv        eax,ecx
 000573E0    mov         dword ptr [ebp-0C],eax
 000573E3    mov         eax,ebx
 000573E5    cdq
 000573E6    idiv        eax,ecx
 000573E8    mov         dword ptr [ebp-10],edx
 000573EB    mov         esi,ecx
>000573ED    jmp         00057421
 000573EF    mov         eax,dword ptr [ebp-4]
 000573F2    movzx       eax,word ptr [eax+0A]
 000573F6    mov         dword ptr [ebp-0C],eax
 000573F9    mov         eax,dword ptr [ebp-4]
 000573FC    mov         ecx,dword ptr [eax+3C]
 000573FF    mov         eax,dword ptr [ebp-0C]
 00057402    cdq
 00057403    idiv        eax,ecx
 00057405    mov         dword ptr [ebp-10],edx
 00057408    mov         eax,dword ptr [ebp-0C]
 0005740B    cdq
 0005740C    idiv        eax,ecx
 0005740E    mov         dword ptr [ebp-0C],eax
 00057411    mov         esi,ecx
>00057413    jmp         00057421
 00057415    xor         esi,esi
 00057417    xor         eax,eax
 00057419    mov         dword ptr [ebp-0C],eax
 0005741C    xor         eax,eax
 0005741E    mov         dword ptr [ebp-10],eax
 00057421    xor         edi,edi
 00057423    test        esi,esi
>00057425    jle         000574C6
 0005742B    call        GetCurrentTime
 00057430    mov         ebx,eax
 00057432    mov         eax,ebx
 00057434    sub         eax,edi
 00057436    mov         edx,dword ptr [ebp-4]
 00057439    mov         edx,dword ptr [edx+20]
 0005743C    cmp         eax,edx
>0005743E    jge         00057448
 00057440    sub         edx,eax
 00057442    push        edx
 00057443    call        kernel32.Sleep
 00057448    mov         edi,ebx
 0005744A    mov         eax,dword ptr [ebp-8]
 0005744D    mov         ax,word ptr [eax+4]
 00057451    sub         ax,1
>00057455    jb          00057465
>00057457    je          00057478
 00057459    dec         ax
>0005745C    je          0005748B
 0005745E    dec         ax
>00057461    je          0005749E
>00057463    jmp         000574AF
 00057465    mov         eax,dword ptr [ebp-4]
 00057468    mov         edx,dword ptr [eax+0C]
 0005746B    sub         edx,dword ptr [ebp-0C]
 0005746E    mov         eax,dword ptr [ebp-4]
 00057471    call        TControlScrollBar.SetPosition
>00057476    jmp         000574AF
 00057478    mov         eax,dword ptr [ebp-4]
 0005747B    mov         edx,dword ptr [eax+0C]
 0005747E    add         edx,dword ptr [ebp-0C]
 00057481    mov         eax,dword ptr [ebp-4]
 00057484    call        TControlScrollBar.SetPosition
>00057489    jmp         000574AF
 0005748B    mov         eax,dword ptr [ebp-4]
 0005748E    mov         edx,dword ptr [eax+0C]
 00057491    sub         edx,dword ptr [ebp-0C]
 00057494    mov         eax,dword ptr [ebp-4]
 00057497    call        TControlScrollBar.SetPosition
>0005749C    jmp         000574AF
 0005749E    mov         eax,dword ptr [ebp-4]
 000574A1    mov         edx,dword ptr [eax+0C]
 000574A4    add         edx,dword ptr [ebp-0C]
 000574A7    mov         eax,dword ptr [ebp-4]
 000574AA    call        TControlScrollBar.SetPosition
 000574AF    mov         eax,dword ptr [ebp-4]
 000574B2    mov         eax,dword ptr [eax+4]
 000574B5    mov         edx,dword ptr [eax]
 000574B7    call        dword ptr [edx+84]
 000574BD    dec         esi
 000574BE    test        esi,esi
>000574C0    jg          0005742B
 000574C6    cmp         dword ptr [ebp-10],0
>000574CA    jle         0005767A
 000574D0    mov         eax,dword ptr [ebp-8]
 000574D3    mov         ax,word ptr [eax+4]
 000574D7    sub         ax,1
>000574DB    jb          000574EE
>000574DD    je          00057504
 000574DF    dec         ax
>000574E2    je          0005751A
 000574E4    dec         ax
>000574E7    je          00057530
>000574E9    jmp         0005767A
 000574EE    mov         eax,dword ptr [ebp-4]
 000574F1    mov         edx,dword ptr [eax+0C]
 000574F4    sub         edx,dword ptr [ebp-10]
 000574F7    mov         eax,dword ptr [ebp-4]
 000574FA    call        TControlScrollBar.SetPosition
>000574FF    jmp         0005767A
 00057504    mov         eax,dword ptr [ebp-4]
 00057507    mov         edx,dword ptr [eax+0C]
 0005750A    add         edx,dword ptr [ebp-10]
 0005750D    mov         eax,dword ptr [ebp-4]
 00057510    call        TControlScrollBar.SetPosition
>00057515    jmp         0005767A
 0005751A    mov         eax,dword ptr [ebp-4]
 0005751D    mov         edx,dword ptr [eax+0C]
 00057520    sub         edx,dword ptr [ebp-10]
 00057523    mov         eax,dword ptr [ebp-4]
 00057526    call        TControlScrollBar.SetPosition
>0005752B    jmp         0005767A
 00057530    mov         eax,dword ptr [ebp-4]
 00057533    mov         edx,dword ptr [eax+0C]
 00057536    add         edx,dword ptr [ebp-10]
 00057539    mov         eax,dword ptr [ebp-4]
 0005753C    call        TControlScrollBar.SetPosition
>00057541    jmp         0005767A
 00057546    mov         eax,dword ptr [ebp-8]
 00057549    movsx       eax,word ptr [eax+4]
 0005754D    cmp         eax,7
>00057550    ja          0005767A
 00057556    jmp         dword ptr [eax*4+5755D]
 00057556    dd          0005757D
 00057556    dd          00057599
 00057556    dd          000575B5
 00057556    dd          000575D6
 00057556    dd          000575F7
 00057556    dd          00057627
 00057556    dd          00057660
 00057556    dd          0005766C
 0005757D    mov         eax,dword ptr [ebp-4]
 00057580    mov         edx,dword ptr [eax+0C]
 00057583    mov         eax,dword ptr [ebp-4]
 00057586    movzx       eax,word ptr [eax+8]
 0005758A    sub         edx,eax
 0005758C    mov         eax,dword ptr [ebp-4]
 0005758F    call        TControlScrollBar.SetPosition
>00057594    jmp         0005767A
 00057599    mov         eax,dword ptr [ebp-4]
 0005759C    mov         edx,dword ptr [eax+0C]
 0005759F    mov         eax,dword ptr [ebp-4]
 000575A2    movzx       eax,word ptr [eax+8]
 000575A6    add         edx,eax
 000575A8    mov         eax,dword ptr [ebp-4]
 000575AB    call        TControlScrollBar.SetPosition
>000575B0    jmp         0005767A
 000575B5    xor         ecx,ecx
 000575B7    mov         dl,1
 000575B9    mov         eax,dword ptr [ebp-4]
 000575BC    call        TControlScrollBar.ControlSize
 000575C1    mov         edx,dword ptr [ebp-4]
 000575C4    mov         edx,dword ptr [edx+0C]
 000575C7    sub         edx,eax
 000575C9    mov         eax,dword ptr [ebp-4]
 000575CC    call        TControlScrollBar.SetPosition
>000575D1    jmp         0005767A
 000575D6    xor         ecx,ecx
 000575D8    mov         dl,1
 000575DA    mov         eax,dword ptr [ebp-4]
 000575DD    call        TControlScrollBar.ControlSize
 000575E2    mov         edx,eax
 000575E4    mov         eax,dword ptr [ebp-4]
 000575E7    add         edx,dword ptr [eax+0C]
 000575EA    mov         eax,dword ptr [ebp-4]
 000575ED    call        TControlScrollBar.SetPosition
>000575F2    jmp         0005767A
 000575F7    mov         eax,dword ptr [ebp-4]
 000575FA    cmp         dword ptr [eax+14],7FFF
>00057601    jle         00057616
 00057603    push        ebp
 00057604    call        GetRealScrollPosition
 00057609    pop         ecx
 0005760A    mov         edx,eax
 0005760C    mov         eax,dword ptr [ebp-4]
 0005760F    call        TControlScrollBar.SetPosition
>00057614    jmp         0005767A
 00057616    mov         edx,dword ptr [ebp-8]
 00057619    movsx       edx,word ptr [edx+6]
 0005761D    mov         eax,dword ptr [ebp-4]
 00057620    call        TControlScrollBar.SetPosition
>00057625    jmp         0005767A
 00057627    mov         eax,dword ptr [ebp-4]
 0005762A    cmp         byte ptr [eax+1D],0
>0005762E    je          0005767A
 00057630    mov         eax,dword ptr [ebp-4]
 00057633    cmp         dword ptr [eax+14],7FFF
>0005763A    jle         0005764F
 0005763C    push        ebp
 0005763D    call        GetRealScrollPosition
 00057642    pop         ecx
 00057643    mov         edx,eax
 00057645    mov         eax,dword ptr [ebp-4]
 00057648    call        TControlScrollBar.SetPosition
>0005764D    jmp         0005767A
 0005764F    mov         edx,dword ptr [ebp-8]
 00057652    movsx       edx,word ptr [edx+6]
 00057656    mov         eax,dword ptr [ebp-4]
 00057659    call        TControlScrollBar.SetPosition
>0005765E    jmp         0005767A
 00057660    xor         edx,edx
 00057662    mov         eax,dword ptr [ebp-4]
 00057665    call        TControlScrollBar.SetPosition
>0005766A    jmp         0005767A
 0005766C    mov         eax,dword ptr [ebp-4]
 0005766F    mov         edx,dword ptr [eax+14]
 00057672    mov         eax,dword ptr [ebp-4]
 00057675    call        TControlScrollBar.SetPosition
 0005767A    pop         edi
 0005767B    pop         esi
 0005767C    pop         ebx
 0005767D    mov         esp,ebp
 0005767F    pop         ebp
 00057680    ret
*}
end;

//00057684
procedure TControlScrollBar.SetButtonSize(Value:Integer);
begin
{*
 00057684    push        ebx
 00057685    mov         ebx,eax
 00057687    cmp         edx,dword ptr [ebx+24];TControlScrollBar.ButtonSize:Integer
>0005768A    je          000576B7
 0005768C    test        edx,edx
>0005768E    jne         000576A8
 00057690    xor         eax,eax
 00057692    mov         al,byte ptr [ebx+18];TControlScrollBar.FKind:TScrollBarKind
 00057695    mov         eax,dword ptr [eax*4+0B49F0]
 0005769C    push        eax
 0005769D    mov         eax,[000B582C];^gvar_000B66A0
 000576A2    mov         eax,dword ptr [eax]
 000576A4    call        eax
 000576A6    mov         edx,eax
 000576A8    mov         dword ptr [ebx+24],edx;TControlScrollBar.ButtonSize:Integer
 000576AB    mov         byte ptr [ebx+44],1;TControlScrollBar.FUpdateNeeded:Boolean
 000576AF    mov         eax,dword ptr [ebx+4];TControlScrollBar.FControl:TScrollingWinControl
 000576B2    call        TScrollingWinControl.UpdateScrollBars
 000576B7    pop         ebx
 000576B8    ret
*}
end;

//000576BC
procedure TControlScrollBar.SetColor(Value:TColor);
begin
{*
 000576BC    cmp         edx,dword ptr [eax+28]
>000576BF    je          000576D4
 000576C1    mov         dword ptr [eax+28],edx
 000576C4    mov         byte ptr [eax+2C],0
 000576C8    mov         byte ptr [eax+44],1
 000576CC    mov         eax,dword ptr [eax+4]
 000576CF    call        TScrollingWinControl.UpdateScrollBars
 000576D4    ret
*}
end;

//000576D8
procedure TControlScrollBar.SetParentColor(Value:Boolean);
begin
{*
 000576D8    cmp         dl,byte ptr [eax+2C]
>000576DB    je          000576EE
 000576DD    mov         byte ptr [eax+2C],dl
 000576E0    test        dl,dl
>000576E2    je          000576EE
 000576E4    mov         edx,80000014
 000576E9    call        TControlScrollBar.SetColor
 000576EE    ret
*}
end;

//000576F0
procedure TControlScrollBar.SetPosition(Value:Integer);
begin
{*
 000576F0    push        ebx
 000576F1    push        esi
 000576F2    push        edi
 000576F3    mov         ebx,eax
 000576F5    mov         eax,dword ptr [ebx+4]
 000576F8    test        byte ptr [eax+20],2
>000576FC    je          00057706
 000576FE    mov         dword ptr [ebx+0C],edx
>00057701    jmp         000577AD
 00057706    mov         eax,dword ptr [ebx+14]
 00057709    cmp         edx,eax
>0005770B    jle         00057711
 0005770D    mov         edx,eax
>0005770F    jmp         00057717
 00057711    test        edx,edx
>00057713    jge         00057717
 00057715    xor         edx,edx
 00057717    cmp         byte ptr [ebx+18],0
>0005771B    jne         00057721
 0005771D    xor         esi,esi
>0005771F    jmp         00057725
 00057721    mov         si,1
 00057725    mov         eax,dword ptr [ebx+0C]
 00057728    cmp         edx,eax
>0005772A    je          00057779
 0005772C    mov         dword ptr [ebx+0C],edx
 0005772F    cmp         byte ptr [ebx+18],0
>00057733    jne         00057745
 00057735    sub         eax,edx
 00057737    mov         edx,eax
 00057739    xor         ecx,ecx
 0005773B    mov         eax,dword ptr [ebx+4]
 0005773E    call        TWinControl.ScrollBy
>00057743    jmp         00057753
 00057745    mov         ecx,eax
 00057747    sub         ecx,edx
 00057749    mov         eax,dword ptr [ebx+4]
 0005774C    xor         edx,edx
 0005774E    call        TWinControl.ScrollBy
 00057753    mov         eax,dword ptr [ebx+4]
 00057756    test        byte ptr [eax+20],10
>0005775A    je          00057779
 0005775C    call        GetParentForm
 00057761    test        eax,eax
>00057763    je          00057779
 00057765    cmp         dword ptr [eax+230],0
>0005776C    je          00057779
 0005776E    mov         eax,dword ptr [eax+230]
 00057774    mov         edx,dword ptr [eax]
 00057776    call        dword ptr [edx+0C]
 00057779    movzx       edi,si
 0005777C    push        edi
 0005777D    mov         eax,dword ptr [ebx+4]
 00057780    call        TWinControl.GetHandle
 00057785    push        eax
 00057786    mov         eax,[000B58A8]
 0005778B    mov         eax,dword ptr [eax]
 0005778D    call        eax
 0005778F    cmp         eax,dword ptr [ebx+0C]
>00057792    je          000577AD
 00057794    push        0FF
 00057796    mov         eax,dword ptr [ebx+0C]
 00057799    push        eax
 0005779A    push        edi
 0005779B    mov         eax,dword ptr [ebx+4]
 0005779E    call        TWinControl.GetHandle
 000577A3    push        eax
 000577A4    mov         eax,[000B5BBC]
 000577A9    mov         eax,dword ptr [eax]
 000577AB    call        eax
 000577AD    pop         edi
 000577AE    pop         esi
 000577AF    pop         ebx
 000577B0    ret
*}
end;

//000577B4
procedure TControlScrollBar.SetSize(Value:Integer);
begin
{*
 000577B4    push        ebx
 000577B5    mov         ebx,eax
 000577B7    cmp         edx,dword ptr [ebx+30];TControlScrollBar.Size:Integer
>000577BA    je          000577E7
 000577BC    test        edx,edx
>000577BE    jne         000577D8
 000577C0    xor         eax,eax
 000577C2    mov         al,byte ptr [ebx+18];TControlScrollBar.FKind:TScrollBarKind
 000577C5    mov         eax,dword ptr [eax*4+0B49F8]
 000577CC    push        eax
 000577CD    mov         eax,[000B582C];^gvar_000B66A0
 000577D2    mov         eax,dword ptr [eax]
 000577D4    call        eax
 000577D6    mov         edx,eax
 000577D8    mov         dword ptr [ebx+30],edx;TControlScrollBar.Size:Integer
 000577DB    mov         byte ptr [ebx+44],1;TControlScrollBar.FUpdateNeeded:Boolean
 000577DF    mov         eax,dword ptr [ebx+4];TControlScrollBar.FControl:TScrollingWinControl
 000577E2    call        TScrollingWinControl.UpdateScrollBars
 000577E7    pop         ebx
 000577E8    ret
*}
end;

//000577EC
procedure TControlScrollBar.SetStyle(Value:TScrollBarStyle);
begin
{*
 000577EC    cmp         dl,byte ptr [eax+34]
>000577EF    je          00057800
 000577F1    mov         byte ptr [eax+34],dl
 000577F4    mov         byte ptr [eax+44],1
 000577F8    mov         eax,dword ptr [eax+4]
 000577FB    call        TScrollingWinControl.UpdateScrollBars
 00057800    ret
*}
end;

//00057804
procedure TControlScrollBar.SetThumbSize(Value:Integer);
begin
{*
 00057804    cmp         edx,dword ptr [eax+38]
>00057807    je          00057818
 00057809    mov         dword ptr [eax+38],edx
 0005780C    mov         byte ptr [eax+44],1
 00057810    mov         eax,dword ptr [eax+4]
 00057813    call        TScrollingWinControl.UpdateScrollBars
 00057818    ret
*}
end;

//0005781C
procedure TControlScrollBar.DoSetRange(Value:Integer);
begin
{*
 0005781C    mov         ecx,edx
 0005781E    mov         dword ptr [eax+10],ecx
 00057821    test        ecx,ecx
>00057823    jge         0005782A
 00057825    xor         edx,edx
 00057827    mov         dword ptr [eax+10],edx
 0005782A    mov         eax,dword ptr [eax+4]
 0005782D    call        TScrollingWinControl.UpdateScrollBars
 00057832    ret
*}
end;

//00057834
procedure TControlScrollBar.SetRange(Value:Integer);
begin
{*
 00057834    mov         ecx,dword ptr [eax+4]
 00057837    mov         byte ptr [ecx+1F4],0
 0005783E    mov         byte ptr [eax+1E],1
 00057842    call        TControlScrollBar.DoSetRange
 00057847    ret
*}
end;

//00057848
function TControlScrollBar.IsRangeStored(Value:Integer):Boolean;
begin
{*
 00057848    mov         eax,dword ptr [eax+4]
 0005784B    mov         al,byte ptr [eax+1F4]
 00057851    xor         al,1
 00057853    ret
*}
end;

//00057854
procedure TControlScrollBar.SetVisible(Value:Boolean);
begin
{*
 00057854    mov         byte ptr [eax+1C],dl
 00057857    mov         eax,dword ptr [eax+4]
 0005785A    call        TScrollingWinControl.UpdateScrollBars
 0005785F    ret
*}
end;

//00057860
procedure UpdateScrollProperties(Redraw:Boolean);
begin
{*
 00057860    push        ebp
 00057861    mov         ebp,esp
 00057863    push        ebx
 00057864    push        esi
 00057865    mov         ebx,eax
 00057867    mov         esi,dword ptr [ebp+8]
 0005786A    add         esi,0FFFFFFFC
 0005786D    neg         bl
 0005786F    sbb         eax,eax
 00057871    push        eax
 00057872    mov         eax,dword ptr [esi]
 00057874    movzx       eax,byte ptr [eax+34]
 00057878    mov         eax,dword ptr [eax*4+0B4A28]
 0005787F    push        eax
 00057880    mov         eax,dword ptr [esi]
 00057882    movzx       eax,byte ptr [eax+18]
 00057886    lea         eax,[eax+eax*4]
 00057889    mov         eax,dword ptr [eax*4+0B4A00]
 00057890    push        eax
 00057891    mov         eax,dword ptr [esi]
 00057893    mov         eax,dword ptr [eax+4]
 00057896    call        TWinControl.GetHandle
 0005789B    push        eax
 0005789C    call        FlatSB_SetScrollProp
 000578A1    mov         eax,dword ptr [esi]
 000578A3    cmp         dword ptr [eax+24],0
>000578A7    jle         000578D2
 000578A9    push        0
 000578AB    mov         eax,dword ptr [esi]
 000578AD    mov         eax,dword ptr [eax+24]
 000578B0    push        eax
 000578B1    mov         eax,dword ptr [esi]
 000578B3    movzx       eax,byte ptr [eax+18]
 000578B7    lea         eax,[eax+eax*4]
 000578BA    mov         eax,dword ptr [eax*4+0B4A04]
 000578C1    push        eax
 000578C2    mov         eax,dword ptr [esi]
 000578C4    mov         eax,dword ptr [eax+4]
 000578C7    call        TWinControl.GetHandle
 000578CC    push        eax
 000578CD    call        FlatSB_SetScrollProp
 000578D2    mov         eax,dword ptr [esi]
 000578D4    cmp         dword ptr [eax+38],0
>000578D8    jle         00057903
 000578DA    push        0
 000578DC    mov         eax,dword ptr [esi]
 000578DE    mov         eax,dword ptr [eax+38]
 000578E1    push        eax
 000578E2    mov         eax,dword ptr [esi]
 000578E4    movzx       eax,byte ptr [eax+18]
 000578E8    lea         eax,[eax+eax*4]
 000578EB    mov         eax,dword ptr [eax*4+0B4A08]
 000578F2    push        eax
 000578F3    mov         eax,dword ptr [esi]
 000578F5    mov         eax,dword ptr [eax+4]
 000578F8    call        TWinControl.GetHandle
 000578FD    push        eax
 000578FE    call        FlatSB_SetScrollProp
 00057903    mov         eax,dword ptr [esi]
 00057905    cmp         dword ptr [eax+30],0
>00057909    jle         00057934
 0005790B    push        0
 0005790D    mov         eax,dword ptr [esi]
 0005790F    mov         eax,dword ptr [eax+30]
 00057912    push        eax
 00057913    mov         eax,dword ptr [esi]
 00057915    movzx       eax,byte ptr [eax+18]
 00057919    lea         eax,[eax+eax*4]
 0005791C    mov         eax,dword ptr [eax*4+0B4A0C]
 00057923    push        eax
 00057924    mov         eax,dword ptr [esi]
 00057926    mov         eax,dword ptr [eax+4]
 00057929    call        TWinControl.GetHandle
 0005792E    push        eax
 0005792F    call        FlatSB_SetScrollProp
 00057934    push        0
 00057936    mov         eax,dword ptr [esi]
 00057938    mov         eax,dword ptr [eax+28]
 0005793B    call        ColorToRGB
 00057940    push        eax
 00057941    mov         eax,dword ptr [esi]
 00057943    movzx       eax,byte ptr [eax+18]
 00057947    lea         eax,[eax+eax*4]
 0005794A    mov         eax,dword ptr [eax*4+0B4A10]
 00057951    push        eax
 00057952    mov         eax,dword ptr [esi]
 00057954    mov         eax,dword ptr [eax+4]
 00057957    call        TWinControl.GetHandle
 0005795C    push        eax
 0005795D    call        FlatSB_SetScrollProp
 00057962    pop         esi
 00057963    pop         ebx
 00057964    pop         ebp
 00057965    ret
*}
end;

//00057968
procedure TControlScrollBar.Update(ControlSB:Boolean; AssumeSB:Boolean);
begin
{*
 00057968    push        ebp
 00057969    mov         ebp,esp
 0005796B    add         esp,0FFFFFFDC
 0005796E    push        ebx
 0005796F    push        esi
 00057970    push        edi
 00057971    mov         byte ptr [ebp-6],cl
 00057974    mov         byte ptr [ebp-5],dl
 00057977    mov         dword ptr [ebp-4],eax
 0005797A    lea         esi,[ebp-4]
 0005797D    mov         eax,dword ptr [esi]
 0005797F    xor         edx,edx
 00057981    mov         dword ptr [eax+14],edx
 00057984    xor         ebx,ebx
 00057986    mov         eax,dword ptr [esi]
 00057988    cmp         byte ptr [eax+18],1
>0005798C    jne         00057992
 0005798E    mov         bx,1
 00057992    mov         eax,dword ptr [esi]
 00057994    cmp         byte ptr [eax+1C],0
>00057998    je          000579BE
 0005799A    mov         cl,byte ptr [ebp-6]
 0005799D    mov         dl,byte ptr [ebp-5]
 000579A0    mov         eax,dword ptr [esi]
 000579A2    call        TControlScrollBar.ControlSize
 000579A7    mov         edx,dword ptr [esi]
 000579A9    mov         edi,dword ptr [edx+10]
 000579AC    sub         edi,eax
 000579AE    mov         eax,dword ptr [esi]
 000579B0    mov         dword ptr [eax+14],edi
 000579B3    test        edi,edi
>000579B5    jge         000579BE
 000579B7    mov         eax,dword ptr [esi]
 000579B9    xor         edx,edx
 000579BB    mov         dword ptr [eax+14],edx
 000579BE    mov         dword ptr [ebp-22],1C
 000579C5    mov         dword ptr [ebp-1E],17
 000579CC    xor         eax,eax
 000579CE    mov         dword ptr [ebp-1A],eax
 000579D1    mov         eax,dword ptr [esi]
 000579D3    cmp         dword ptr [eax+14],0
>000579D7    jle         000579E3
 000579D9    mov         eax,dword ptr [esi]
 000579DB    mov         eax,dword ptr [eax+10]
 000579DE    mov         dword ptr [ebp-16],eax
>000579E1    jmp         000579E8
 000579E3    xor         eax,eax
 000579E5    mov         dword ptr [ebp-16],eax
 000579E8    mov         cl,byte ptr [ebp-6]
 000579EB    mov         dl,byte ptr [ebp-5]
 000579EE    mov         eax,dword ptr [esi]
 000579F0    call        TControlScrollBar.ControlSize
 000579F5    inc         eax
 000579F6    mov         dword ptr [ebp-12],eax
 000579F9    mov         eax,dword ptr [esi]
 000579FB    mov         eax,dword ptr [eax+0C]
 000579FE    mov         dword ptr [ebp-0E],eax
 00057A01    mov         dword ptr [ebp-0A],eax
 00057A04    push        ebp
 00057A05    mov         eax,dword ptr [esi]
 00057A07    mov         al,byte ptr [eax+44]
 00057A0A    call        UpdateScrollProperties
 00057A0F    pop         ecx
 00057A10    mov         eax,dword ptr [esi]
 00057A12    mov         byte ptr [eax+44],0
 00057A16    push        0FF
 00057A18    lea         eax,[ebp-22]
 00057A1B    push        eax
 00057A1C    movzx       eax,bx
 00057A1F    push        eax
 00057A20    mov         eax,dword ptr [esi]
 00057A22    mov         eax,dword ptr [eax+4]
 00057A25    call        TWinControl.GetHandle
 00057A2A    push        eax
 00057A2B    mov         eax,[000B59D8]
 00057A30    mov         eax,dword ptr [eax]
 00057A32    call        eax
 00057A34    mov         eax,dword ptr [esi]
 00057A36    mov         edx,dword ptr [eax+0C]
 00057A39    mov         eax,dword ptr [esi]
 00057A3B    call        TControlScrollBar.SetPosition
 00057A40    xor         ecx,ecx
 00057A42    mov         dl,1
 00057A44    mov         eax,dword ptr [esi]
 00057A46    call        TControlScrollBar.ControlSize
 00057A4B    lea         eax,[eax+eax*8]
 00057A4E    mov         ecx,0A
 00057A53    cdq
 00057A54    idiv        eax,ecx
 00057A56    mov         ebx,eax
 00057A58    mov         eax,dword ptr [esi]
 00057A5A    mov         word ptr [eax+0A],bx
 00057A5E    mov         eax,dword ptr [esi]
 00057A60    cmp         byte ptr [eax+1F],0
>00057A64    je          00057A78
 00057A66    movzx       eax,bx
 00057A69    mov         ecx,0A
 00057A6E    xor         edx,edx
 00057A70    div         eax,ecx
 00057A72    mov         edx,dword ptr [esi]
 00057A74    mov         word ptr [edx+8],ax
 00057A78    pop         edi
 00057A79    pop         esi
 00057A7A    pop         ebx
 00057A7B    mov         esp,ebp
 00057A7D    pop         ebp
 00057A7E    ret
*}
end;

//00057A80
constructor TScrollingWinControl.Create(AOwner:TComponent);
begin
{*
 00057A80    push        ebx
 00057A81    push        esi
 00057A82    test        dl,dl
>00057A84    je          00057A8E
 00057A86    add         esp,0FFFFFFF0
 00057A89    call        @ClassCreate
 00057A8E    mov         ebx,edx
 00057A90    mov         esi,eax
 00057A92    xor         edx,edx
 00057A94    mov         eax,esi
 00057A96    call        TWinControl.Create
 00057A9B    push        0
 00057A9D    mov         ecx,esi
 00057A9F    mov         dl,1
 00057AA1    mov         eax,[00054240];TControlScrollBar
 00057AA6    call        TControlScrollBar.Create
 00057AAB    mov         dword ptr [esi+1EC],eax
 00057AB1    push        1
 00057AB3    mov         ecx,esi
 00057AB5    mov         dl,1
 00057AB7    mov         eax,[00054240];TControlScrollBar
 00057ABC    call        TControlScrollBar.Create
 00057AC1    mov         dword ptr [esi+1F0],eax
 00057AC7    mov         byte ptr [esi+1F4],1
 00057ACE    mov         eax,esi
 00057AD0    test        bl,bl
>00057AD2    je          00057AE3
 00057AD4    call        @AfterConstruction
 00057AD9    pop         dword ptr fs:[0]
 00057AE0    add         esp,0C
 00057AE3    mov         eax,esi
 00057AE5    pop         esi
 00057AE6    pop         ebx
 00057AE7    ret
*}
end;

//00057AE8
destructor TScrollingWinControl.Destroy;
begin
{*
 00057AE8    push        ebx
 00057AE9    push        esi
 00057AEA    call        @BeforeDestruction
 00057AEF    mov         ebx,edx
 00057AF1    mov         esi,eax
 00057AF3    mov         eax,dword ptr [esi+1EC]
 00057AF9    call        TObject.Free
 00057AFE    mov         eax,dword ptr [esi+1F0]
 00057B04    call        TObject.Free
 00057B09    mov         edx,ebx
 00057B0B    and         dl,0FC
 00057B0E    mov         eax,esi
 00057B10    call        TWinControl.Destroy
 00057B15    test        bl,bl
>00057B17    jle         00057B20
 00057B19    mov         eax,esi
 00057B1B    call        @ClassDestroy
 00057B20    pop         esi
 00057B21    pop         ebx
 00057B22    ret
*}
end;

//00057B24
procedure TScrollingWinControl.CreateParams(var Params:TCreateParams);
begin
{*
 00057B24    push        ebx
 00057B25    mov         ebx,edx
 00057B27    mov         edx,ebx
 00057B29    call        TWinControl.CreateParams
 00057B2E    and         dword ptr [ebx+24],0FFFFFFFC
 00057B32    pop         ebx
 00057B33    ret
*}
end;

//00057B34
procedure TScrollingWinControl.CreateWnd;
begin
{*
 00057B34    push        ebx
 00057B35    mov         ebx,eax
 00057B37    mov         eax,ebx
 00057B39    call        TWinControl.CreateWnd
 00057B3E    mov         eax,[000B5C08];SysLocale:TSysLocale
 00057B43    cmp         byte ptr [eax+9],0
>00057B47    jne         00057B56
 00057B49    mov         eax,ebx
 00057B4B    call        TWinControl.GetHandle
 00057B50    push        eax
 00057B51    call        InitializeFlatSB
 00057B56    mov         eax,ebx
 00057B58    call        TScrollingWinControl.UpdateScrollBars
 00057B5D    pop         ebx
 00057B5E    ret
*}
end;

//00057B60
procedure TScrollingWinControl.AlignControls(AControl:TControl; var ARect:TRect);
begin
{*
 00057B60    push        ebx
 00057B61    push        esi
 00057B62    push        edi
 00057B63    mov         edi,ecx
 00057B65    mov         esi,edx
 00057B67    mov         ebx,eax
 00057B69    mov         eax,ebx
 00057B6B    call        TScrollingWinControl.CalcAutoRange
 00057B70    mov         ecx,edi
 00057B72    mov         edx,esi
 00057B74    mov         eax,ebx
 00057B76    call        TWinControl.AlignControls
 00057B7B    pop         edi
 00057B7C    pop         esi
 00057B7D    pop         ebx
 00057B7E    ret
*}
end;

//00057B80
function TScrollingWinControl.AutoScrollEnabled:Boolean;
begin
{*
 00057B80    cmp         byte ptr [eax+4C],0
>00057B84    jne         00057B98
 00057B86    cmp         byte ptr [eax+138],0
>00057B8D    je          00057B9B
 00057B8F    cmp         byte ptr [eax+180],0
>00057B96    je          00057B9B
 00057B98    xor         eax,eax
 00057B9A    ret
 00057B9B    mov         al,1
 00057B9D    ret
*}
end;

//00057BA0
procedure TScrollingWinControl.DoFlipChildren;
begin
{*
 00057BA0    push        ebp
 00057BA1    mov         ebp,esp
 00057BA3    add         esp,0FFFFFFF0
 00057BA6    push        ebx
 00057BA7    push        esi
 00057BA8    push        edi
 00057BA9    mov         dword ptr [ebp-4],eax
 00057BAC    mov         dl,1
 00057BAE    mov         eax,[0001EEC4];TList
 00057BB3    call        TObject.Create
 00057BB8    mov         dword ptr [ebp-10],eax
 00057BBB    xor         eax,eax
 00057BBD    push        ebp
 00057BBE    push        57CA8
 00057BC3    push        dword ptr fs:[eax]
 00057BC6    mov         dword ptr fs:[eax],esp
 00057BC9    mov         eax,dword ptr [ebp-4]
 00057BCC    call        TControl.GetClientWidth
 00057BD1    mov         dword ptr [ebp-8],eax
 00057BD4    mov         eax,dword ptr [ebp-4]
 00057BD7    mov         ebx,dword ptr [eax+1EC]
 00057BDD    mov         eax,ebx
 00057BDF    call        TControlScrollBar.IsScrollBarVisible
 00057BE4    test        al,al
>00057BE6    je          00057BF0
 00057BE8    mov         eax,dword ptr [ebx+10]
 00057BEB    cmp         eax,dword ptr [ebp-8]
>00057BEE    jg          00057BF4
 00057BF0    xor         eax,eax
>00057BF2    jmp         00057BF6
 00057BF4    mov         al,1
 00057BF6    mov         byte ptr [ebp-9],al
 00057BF9    cmp         byte ptr [ebp-9],0
>00057BFD    je          00057C0E
 00057BFF    mov         eax,dword ptr [ebx+10]
 00057C02    mov         dword ptr [ebp-8],eax
 00057C05    xor         edx,edx
 00057C07    mov         eax,ebx
 00057C09    call        TControlScrollBar.SetPosition
 00057C0E    mov         eax,dword ptr [ebp-4]
 00057C11    call        TWinControl.GetControlCount
 00057C16    mov         esi,eax
 00057C18    dec         esi
 00057C19    test        esi,esi
>00057C1B    jl          00057C54
 00057C1D    inc         esi
 00057C1E    xor         ebx,ebx
 00057C20    mov         edx,ebx
 00057C22    mov         eax,dword ptr [ebp-4]
 00057C25    call        TWinControl.GetControl
 00057C2A    mov         edi,eax
 00057C2C    mov         edx,ebx
 00057C2E    mov         eax,dword ptr [ebp-4]
 00057C31    call        TWinControl.GetControl
 00057C36    mov         edx,eax
 00057C38    mov         eax,dword ptr [ebp-10]
 00057C3B    call        TList.Add
 00057C40    mov         edx,dword ptr [ebp-8]
 00057C43    sub         edx,dword ptr [edi+38]
 00057C46    sub         edx,dword ptr [edi+30]
 00057C49    mov         eax,edi
 00057C4B    call        TControl.SetLeft
 00057C50    inc         ebx
 00057C51    dec         esi
>00057C52    jne         00057C20
 00057C54    mov         eax,dword ptr [ebp-10]
 00057C57    mov         esi,dword ptr [eax+8]
 00057C5A    dec         esi
 00057C5B    test        esi,esi
>00057C5D    jl          00057C7E
 00057C5F    inc         esi
 00057C60    xor         ebx,ebx
 00057C62    push        0
 00057C64    mov         edx,ebx
 00057C66    mov         eax,dword ptr [ebp-10]
 00057C69    call        TList.Get
 00057C6E    xor         ecx,ecx
 00057C70    mov         edx,0B03E
 00057C75    call        TControl.Perform
 00057C7A    inc         ebx
 00057C7B    dec         esi
>00057C7C    jne         00057C62
 00057C7E    cmp         byte ptr [ebp-9],0
>00057C82    je          00057C92
 00057C84    mov         eax,dword ptr [ebp-4]
 00057C87    mov         eax,dword ptr [eax+1EC]
 00057C8D    call        TControlScrollBar.ChangeBiDiPosition
 00057C92    xor         eax,eax
 00057C94    pop         edx
 00057C95    pop         ecx
 00057C96    pop         ecx
 00057C97    mov         dword ptr fs:[eax],edx
 00057C9A    push        57CAF
 00057C9F    mov         eax,dword ptr [ebp-10]
 00057CA2    call        TObject.Free
 00057CA7    ret
>00057CA8    jmp         @HandleFinally
>00057CAD    jmp         00057C9F
 00057CAF    pop         edi
 00057CB0    pop         esi
 00057CB1    pop         ebx
 00057CB2    mov         esp,ebp
 00057CB4    pop         ebp
 00057CB5    ret
*}
end;

//00057CB8
procedure TScrollingWinControl.CalcAutoRange;
begin
{*
 00057CB8    push        ebx
 00057CB9    mov         ebx,eax
 00057CBB    cmp         dword ptr [ebx+1F8],0
>00057CC2    jg          00057CDA
 00057CC4    mov         eax,dword ptr [ebx+1EC]
 00057CCA    call        TControlScrollBar.CalcAutoRange
 00057CCF    mov         eax,dword ptr [ebx+1F0]
 00057CD5    call        TControlScrollBar.CalcAutoRange
 00057CDA    pop         ebx
 00057CDB    ret
*}
end;

//00057CDC
procedure TScrollingWinControl.SetAutoScroll(Value:Boolean);
begin
{*
 00057CDC    push        ebx
 00057CDD    mov         ebx,eax
 00057CDF    cmp         dl,byte ptr [ebx+1F4]
>00057CE5    je          00057D14
 00057CE7    mov         byte ptr [ebx+1F4],dl
 00057CED    test        dl,dl
>00057CEF    je          00057CFA
 00057CF1    mov         eax,ebx
 00057CF3    call        TScrollingWinControl.CalcAutoRange
>00057CF8    jmp         00057D14
 00057CFA    xor         edx,edx
 00057CFC    mov         eax,dword ptr [ebx+1EC]
 00057D02    call        TControlScrollBar.SetRange
 00057D07    xor         edx,edx
 00057D09    mov         eax,dword ptr [ebx+1F0]
 00057D0F    call        TControlScrollBar.SetRange
 00057D14    pop         ebx
 00057D15    ret
*}
end;

//00057D18
procedure TScrollingWinControl.SetHorzScrollBar(Value:TControlScrollBar);
begin
{*
 00057D18    push        esi
 00057D19    mov         esi,eax
 00057D1B    mov         eax,dword ptr [esi+1EC]
 00057D21    mov         ecx,dword ptr [eax]
 00057D23    call        dword ptr [ecx+8]
 00057D26    pop         esi
 00057D27    ret
*}
end;

//00057D28
procedure TScrollingWinControl.SetVertScrollBar(Value:TControlScrollBar);
begin
{*
 00057D28    push        esi
 00057D29    mov         esi,eax
 00057D2B    mov         eax,dword ptr [esi+1F0]
 00057D31    mov         ecx,dword ptr [eax]
 00057D33    call        dword ptr [ecx+8]
 00057D36    pop         esi
 00057D37    ret
*}
end;

//00057D38
procedure TScrollingWinControl.UpdateScrollBars;
begin
{*
 00057D38    push        ebp
 00057D39    mov         ebp,esp
 00057D3B    push        ecx
 00057D3C    mov         dword ptr [ebp-4],eax
 00057D3F    mov         eax,dword ptr [ebp-4]
 00057D42    cmp         byte ptr [eax+1FC],0
>00057D49    jne         00057E2A
 00057D4F    mov         eax,dword ptr [ebp-4]
 00057D52    call        TWinControl.HandleAllocated
 00057D57    test        al,al
>00057D59    je          00057E2A
 00057D5F    xor         eax,eax
 00057D61    push        ebp
 00057D62    push        57E23
 00057D67    push        dword ptr fs:[eax]
 00057D6A    mov         dword ptr fs:[eax],esp
 00057D6D    mov         eax,dword ptr [ebp-4]
 00057D70    mov         byte ptr [eax+1FC],1
 00057D77    mov         eax,dword ptr [ebp-4]
 00057D7A    mov         eax,dword ptr [eax+1F0]
 00057D80    call        TControlScrollBar.NeedsScrollBarVisible
 00057D85    test        al,al
>00057D87    je          00057DAF
 00057D89    mov         eax,dword ptr [ebp-4]
 00057D8C    mov         eax,dword ptr [eax+1EC]
 00057D92    mov         cl,1
 00057D94    xor         edx,edx
 00057D96    call        TControlScrollBar.Update
 00057D9B    mov         eax,dword ptr [ebp-4]
 00057D9E    mov         eax,dword ptr [eax+1F0]
 00057DA4    xor         ecx,ecx
 00057DA6    mov         dl,1
 00057DA8    call        TControlScrollBar.Update
>00057DAD    jmp         00057E0B
 00057DAF    mov         eax,dword ptr [ebp-4]
 00057DB2    mov         eax,dword ptr [eax+1EC]
 00057DB8    call        TControlScrollBar.NeedsScrollBarVisible
 00057DBD    test        al,al
>00057DBF    je          00057DE7
 00057DC1    mov         eax,dword ptr [ebp-4]
 00057DC4    mov         eax,dword ptr [eax+1F0]
 00057DCA    mov         cl,1
 00057DCC    xor         edx,edx
 00057DCE    call        TControlScrollBar.Update
 00057DD3    mov         eax,dword ptr [ebp-4]
 00057DD6    mov         eax,dword ptr [eax+1EC]
 00057DDC    xor         ecx,ecx
 00057DDE    mov         dl,1
 00057DE0    call        TControlScrollBar.Update
>00057DE5    jmp         00057E0B
 00057DE7    mov         eax,dword ptr [ebp-4]
 00057DEA    mov         eax,dword ptr [eax+1F0]
 00057DF0    xor         ecx,ecx
 00057DF2    xor         edx,edx
 00057DF4    call        TControlScrollBar.Update
 00057DF9    mov         eax,dword ptr [ebp-4]
 00057DFC    mov         eax,dword ptr [eax+1EC]
 00057E02    xor         ecx,ecx
 00057E04    mov         dl,1
 00057E06    call        TControlScrollBar.Update
 00057E0B    xor         eax,eax
 00057E0D    pop         edx
 00057E0E    pop         ecx
 00057E0F    pop         ecx
 00057E10    mov         dword ptr fs:[eax],edx
 00057E13    push        57E2A
 00057E18    mov         eax,dword ptr [ebp-4]
 00057E1B    mov         byte ptr [eax+1FC],0
 00057E22    ret
>00057E23    jmp         @HandleFinally
>00057E28    jmp         00057E18
 00057E2A    pop         ecx
 00057E2B    pop         ebp
 00057E2C    ret
*}
end;

//00057E30
procedure TScrollingWinControl.AutoScrollInView(AControl:TControl);
begin
{*
 00057E30    test        edx,edx
>00057E32    je          00057E45
 00057E34    test        byte ptr [edx+20],1
>00057E38    jne         00057E45
 00057E3A    test        byte ptr [eax+20],1
>00057E3E    jne         00057E45
 00057E40    call        TScrollingWinControl.ScrollInView
 00057E45    ret
*}
end;

//00057E48
procedure TScrollingWinControl.ScrollInView(AControl:TControl);
begin
{*
 00057E48    push        ebx
 00057E49    push        esi
 00057E4A    push        edi
 00057E4B    push        ebp
 00057E4C    add         esp,0FFFFFFE0
 00057E4F    mov         esi,edx
 00057E51    mov         ebx,eax
 00057E53    mov         edi,esp
 00057E55    test        esi,esi
>00057E57    je          00057F91
 00057E5D    mov         edx,edi
 00057E5F    mov         eax,esi
 00057E61    mov         ecx,dword ptr [eax]
 00057E63    call        dword ptr [ecx+44]
 00057E66    mov         eax,dword ptr [ebx+1EC]
 00057E6C    movzx       eax,word ptr [eax+1A]
 00057E70    sub         dword ptr [edi],eax
 00057E72    add         dword ptr [edi+8],eax
 00057E75    mov         eax,dword ptr [ebx+1F0]
 00057E7B    movzx       eax,word ptr [eax+1A]
 00057E7F    sub         dword ptr [edi+4],eax
 00057E82    add         dword ptr [edi+0C],eax
 00057E85    lea         ecx,[esp+18]
 00057E89    mov         edx,edi
 00057E8B    mov         eax,esi
 00057E8D    call        TControl.ClientToScreen
 00057E92    lea         edx,[esp+18]
 00057E96    lea         ecx,[esp+10]
 00057E9A    mov         eax,ebx
 00057E9C    call        TControl.ScreenToClient
 00057EA1    mov         eax,dword ptr [esp+10]
 00057EA5    mov         dword ptr [edi],eax
 00057EA7    mov         eax,dword ptr [esp+14]
 00057EAB    mov         dword ptr [edi+4],eax
 00057EAE    lea         ecx,[esp+18]
 00057EB2    lea         edx,[edi+8]
 00057EB5    mov         eax,esi
 00057EB7    call        TControl.ClientToScreen
 00057EBC    lea         edx,[esp+18]
 00057EC0    lea         ecx,[esp+10]
 00057EC4    mov         eax,ebx
 00057EC6    call        TControl.ScreenToClient
 00057ECB    mov         eax,dword ptr [esp+10]
 00057ECF    mov         dword ptr [edi+8],eax
 00057ED2    mov         eax,dword ptr [esp+14]
 00057ED6    mov         dword ptr [edi+0C],eax
 00057ED9    mov         esi,dword ptr [edi]
 00057EDB    test        esi,esi
>00057EDD    jge         00057EF1
 00057EDF    mov         eax,dword ptr [ebx+1EC]
 00057EE5    mov         edx,dword ptr [eax+0C]
 00057EE8    add         edx,esi
 00057EEA    call        TControlScrollBar.SetPosition
>00057EEF    jmp         00057F34
 00057EF1    mov         eax,ebx
 00057EF3    call        TControl.GetClientWidth
 00057EF8    mov         ebp,dword ptr [edi+8]
 00057EFB    cmp         eax,ebp
>00057EFD    jge         00057F34
 00057EFF    mov         eax,ebx
 00057F01    call        TControl.GetClientWidth
 00057F06    sub         ebp,esi
 00057F08    cmp         eax,ebp
>00057F0A    jge         00057F18
 00057F0C    mov         eax,ebx
 00057F0E    call        TControl.GetClientWidth
 00057F13    add         eax,dword ptr [edi]
 00057F15    mov         dword ptr [edi+8],eax
 00057F18    mov         esi,dword ptr [ebx+1EC]
 00057F1E    mov         eax,ebx
 00057F20    call        TControl.GetClientWidth
 00057F25    mov         edx,dword ptr [esi+0C]
 00057F28    add         edx,dword ptr [edi+8]
 00057F2B    sub         edx,eax
 00057F2D    mov         eax,esi
 00057F2F    call        TControlScrollBar.SetPosition
 00057F34    mov         esi,dword ptr [edi+4]
 00057F37    test        esi,esi
>00057F39    jge         00057F4D
 00057F3B    mov         eax,dword ptr [ebx+1F0]
 00057F41    mov         edx,dword ptr [eax+0C]
 00057F44    add         edx,esi
 00057F46    call        TControlScrollBar.SetPosition
>00057F4B    jmp         00057F91
 00057F4D    mov         eax,ebx
 00057F4F    call        TControl.GetClientHeight
 00057F54    mov         ebp,dword ptr [edi+0C]
 00057F57    cmp         eax,ebp
>00057F59    jge         00057F91
 00057F5B    mov         eax,ebx
 00057F5D    call        TControl.GetClientHeight
 00057F62    sub         ebp,esi
 00057F64    cmp         eax,ebp
>00057F66    jge         00057F75
 00057F68    mov         eax,ebx
 00057F6A    call        TControl.GetClientHeight
 00057F6F    add         eax,dword ptr [edi+4]
 00057F72    mov         dword ptr [edi+0C],eax
 00057F75    mov         esi,dword ptr [ebx+1F0]
 00057F7B    mov         eax,ebx
 00057F7D    call        TControl.GetClientHeight
 00057F82    mov         edx,dword ptr [esi+0C]
 00057F85    add         edx,dword ptr [edi+0C]
 00057F88    sub         edx,eax
 00057F8A    mov         eax,esi
 00057F8C    call        TControlScrollBar.SetPosition
 00057F91    add         esp,20
 00057F94    pop         ebp
 00057F95    pop         edi
 00057F96    pop         esi
 00057F97    pop         ebx
 00057F98    ret
*}
end;

//00057F9C
procedure TScrollingWinControl.ScaleScrollBars(M:Integer; D:Integer);
begin
{*
 00057F9C    push        ebx
 00057F9D    push        esi
 00057F9E    push        edi
 00057F9F    push        ebp
 00057FA0    mov         edi,ecx
 00057FA2    mov         esi,edx
 00057FA4    mov         ebx,eax
 00057FA6    cmp         edi,esi
>00057FA8    je          00058027
 00057FAA    test        byte ptr [ebx+20],1
>00057FAE    jne         00057FC4
 00057FB0    mov         eax,dword ptr [ebx+1EC]
 00057FB6    mov         byte ptr [eax+1E],1
 00057FBA    mov         eax,dword ptr [ebx+1F0]
 00057FC0    mov         byte ptr [eax+1E],1
 00057FC4    xor         edx,edx
 00057FC6    mov         eax,dword ptr [ebx+1EC]
 00057FCC    call        TControlScrollBar.SetPosition
 00057FD1    xor         edx,edx
 00057FD3    mov         eax,dword ptr [ebx+1F0]
 00057FD9    call        TControlScrollBar.SetPosition
 00057FDE    cmp         byte ptr [ebx+1F4],0
>00057FE5    jne         00058027
 00057FE7    mov         ebp,dword ptr [ebx+1EC]
 00057FED    cmp         byte ptr [ebp+1E],0
>00057FF1    je          00058007
 00057FF3    push        edi
 00057FF4    push        esi
 00057FF5    mov         eax,dword ptr [ebp+10]
 00057FF8    push        eax
 00057FF9    call        kernel32.MulDiv
 00057FFE    mov         edx,eax
 00058000    mov         eax,ebp
 00058002    call        TControlScrollBar.SetRange
 00058007    mov         ebp,dword ptr [ebx+1F0]
 0005800D    cmp         byte ptr [ebp+1E],0
>00058011    je          00058027
 00058013    push        edi
 00058014    push        esi
 00058015    mov         eax,dword ptr [ebp+10]
 00058018    push        eax
 00058019    call        kernel32.MulDiv
 0005801E    mov         edx,eax
 00058020    mov         eax,ebp
 00058022    call        TControlScrollBar.SetRange
 00058027    mov         eax,dword ptr [ebx+1EC]
 0005802D    mov         byte ptr [eax+1E],0
 00058031    mov         eax,dword ptr [ebx+1F0]
 00058037    mov         byte ptr [eax+1E],0
 0005803B    pop         ebp
 0005803C    pop         edi
 0005803D    pop         esi
 0005803E    pop         ebx
 0005803F    ret
*}
end;

//00058040
procedure TScrollingWinControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 00058040    push        ebx
 00058041    push        esi
 00058042    push        edi
 00058043    mov         edi,ecx
 00058045    mov         esi,edx
 00058047    mov         ebx,eax
 00058049    mov         ecx,edi
 0005804B    mov         edx,esi
 0005804D    mov         eax,ebx
 0005804F    call        TScrollingWinControl.ScaleScrollBars
 00058054    mov         ecx,edi
 00058056    mov         edx,esi
 00058058    mov         eax,ebx
 0005805A    call        TWinControl.ChangeScale
 0005805F    pop         edi
 00058060    pop         esi
 00058061    pop         ebx
 00058062    ret
*}
end;

//00058064
procedure TScrollingWinControl.WMSize(var Message:TWMSize);
begin
{*
 00058064    push        ebp
 00058065    mov         ebp,esp
 00058067    push        ecx
 00058068    mov         dword ptr [ebp-4],eax
 0005806B    mov         eax,dword ptr [ebp-4]
 0005806E    inc         dword ptr [eax+1F8]
 00058074    xor         eax,eax
 00058076    push        ebp
 00058077    push        580A1
 0005807C    push        dword ptr fs:[eax]
 0005807F    mov         dword ptr fs:[eax],esp
 00058082    mov         eax,dword ptr [ebp-4]
 00058085    call        TWinControl.WMSize
 0005808A    xor         eax,eax
 0005808C    pop         edx
 0005808D    pop         ecx
 0005808E    pop         ecx
 0005808F    mov         dword ptr fs:[eax],edx
 00058092    push        580A8
 00058097    mov         eax,dword ptr [ebp-4]
 0005809A    dec         dword ptr [eax+1F8]
 000580A0    ret
>000580A1    jmp         @HandleFinally
>000580A6    jmp         00058097
 000580A8    mov         eax,dword ptr [ebp-4]
 000580AB    mov         eax,dword ptr [eax+1EC]
 000580B1    cmp         byte ptr [eax+1C],0
>000580B5    jne         000580C6
 000580B7    mov         eax,dword ptr [ebp-4]
 000580BA    mov         eax,dword ptr [eax+1F0]
 000580C0    cmp         byte ptr [eax+1C],0
>000580C4    je          000580CE
 000580C6    mov         eax,dword ptr [ebp-4]
 000580C9    call        TScrollingWinControl.UpdateScrollBars
 000580CE    pop         ecx
 000580CF    pop         ebp
 000580D0    ret
*}
end;

//000580D4
procedure TScrollingWinControl.WMHScroll(Message:TWMCommand);
begin
{*
 000580D4    cmp         dword ptr [edx+8],0
>000580D8    jne         000580F2
 000580DA    mov         ecx,dword ptr [eax+1EC];TScrollingWinControl.HorzScrollBar:TControlScrollBar
 000580E0    cmp         byte ptr [ecx+1C],0;TControlScrollBar.Visible:Boolean
>000580E4    je          000580F2
 000580E6    mov         eax,dword ptr [eax+1EC];TScrollingWinControl.HorzScrollBar:TControlScrollBar
 000580EC    call        TControlScrollBar.ScrollMessage
 000580F1    ret
 000580F2    call        TWinControl.WMCommand
 000580F7    ret
*}
end;

//000580F8
procedure TScrollingWinControl.WMVScroll(Message:TWMHScroll);
begin
{*
 000580F8    cmp         dword ptr [edx+8],0
>000580FC    jne         00058116
 000580FE    mov         ecx,dword ptr [eax+1F0];TScrollingWinControl.VertScrollBar:TControlScrollBar
 00058104    cmp         byte ptr [ecx+1C],0;TControlScrollBar.Visible:Boolean
>00058108    je          00058116
 0005810A    mov         eax,dword ptr [eax+1F0];TScrollingWinControl.VertScrollBar:TControlScrollBar
 00058110    call        TControlScrollBar.ScrollMessage
 00058115    ret
 00058116    call        TWinControl.WMHScroll
 0005811B    ret
*}
end;

//0005811C
procedure TScrollingWinControl.AdjustClientRect(var Rect:TRect);
begin
{*
 0005811C    push        ebx
 0005811D    push        esi
 0005811E    push        edi
 0005811F    add         esp,0FFFFFFF0
 00058122    mov         esi,edx
 00058124    mov         ebx,eax
 00058126    mov         eax,ebx
 00058128    call        TControl.GetClientHeight
 0005812D    mov         edx,dword ptr [ebx+1F0]
 00058133    mov         edx,dword ptr [edx+10]
 00058136    call        Max
 0005813B    push        eax
 0005813C    lea         eax,[esp+4]
 00058140    push        eax
 00058141    mov         eax,ebx
 00058143    call        TControl.GetClientWidth
 00058148    mov         edx,eax
 0005814A    mov         edi,dword ptr [ebx+1EC]
 00058150    mov         eax,dword ptr [edi+10]
 00058153    call        Max
 00058158    mov         ecx,eax
 0005815A    mov         eax,dword ptr [ebx+1F0]
 00058160    mov         edx,dword ptr [eax+0C]
 00058163    neg         edx
 00058165    mov         eax,dword ptr [edi+0C]
 00058168    neg         eax
 0005816A    call        Bounds
 0005816F    push        esi
 00058170    mov         edi,esi
 00058172    lea         esi,[esp+4]
 00058176    mov         ecx,4
 0005817B    rep movs    dword ptr [edi],dword ptr [esi]
 0005817D    pop         esi
 0005817E    mov         edx,esi
 00058180    mov         eax,ebx
 00058182    call        TWinControl.AdjustClientRect
 00058187    add         esp,10
 0005818A    pop         edi
 0005818B    pop         esi
 0005818C    pop         ebx
 0005818D    ret
*}
end;

//00058190
procedure TScrollingWinControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 00058190    push        ebp
 00058191    mov         ebp,esp
 00058193    add         esp,0FFFFFFF4
 00058196    mov         dword ptr [ebp-8],edx
 00058199    mov         dword ptr [ebp-4],eax
 0005819C    mov         eax,dword ptr [ebp-8]
 0005819F    mov         eax,dword ptr [eax+4]
 000581A2    mov         dword ptr [ebp-0C],eax
 000581A5    xor         eax,eax
 000581A7    push        ebp
 000581A8    push        581F1
 000581AD    push        dword ptr fs:[eax]
 000581B0    mov         dword ptr fs:[eax],esp
 000581B3    mov         eax,dword ptr [ebp-4]
 000581B6    mov         edx,dword ptr ds:[546D8];TScrollBox
 000581BC    call        @IsClass
 000581C1    test        al,al
>000581C3    jne         000581CF
 000581C5    mov         eax,dword ptr [ebp-8]
 000581C8    mov         dword ptr [eax+4],1
 000581CF    mov         edx,dword ptr [ebp-8]
 000581D2    mov         eax,dword ptr [ebp-4]
 000581D5    call        TWinControl.CMBiDiModeChanged
 000581DA    xor         eax,eax
 000581DC    pop         edx
 000581DD    pop         ecx
 000581DE    pop         ecx
 000581DF    mov         dword ptr fs:[eax],edx
 000581E2    push        581F8
 000581E7    mov         eax,dword ptr [ebp-8]
 000581EA    mov         edx,dword ptr [ebp-0C]
 000581ED    mov         dword ptr [eax+4],edx
 000581F0    ret
>000581F1    jmp         @HandleFinally
>000581F6    jmp         000581E7
 000581F8    mov         eax,dword ptr [ebp-4]
 000581FB    call        TWinControl.HandleAllocated
 00058200    test        al,al
>00058202    je          0005821A
 00058204    mov         eax,dword ptr [ebp-4]
 00058207    mov         eax,dword ptr [eax+1EC]
 0005820D    call        TControlScrollBar.ChangeBiDiPosition
 00058212    mov         eax,dword ptr [ebp-4]
 00058215    call        TScrollingWinControl.UpdateScrollBars
 0005821A    mov         esp,ebp
 0005821C    pop         ebp
 0005821D    ret
*}
end;

//00058220
constructor TScrollBox.Create(AOwner:TComponent);
begin
{*
 00058220    push        ebx
 00058221    push        esi
 00058222    test        dl,dl
>00058224    je          0005822E
 00058226    add         esp,0FFFFFFF0
 00058229    call        @ClassCreate
 0005822E    mov         ebx,edx
 00058230    mov         esi,eax
 00058232    xor         edx,edx
 00058234    mov         eax,esi
 00058236    call        TScrollingWinControl.Create
 0005823B    mov         eax,[0005827C]
 00058240    mov         dword ptr [esi+40],eax
 00058243    mov         edx,0B9
 00058248    mov         eax,esi
 0005824A    call        TControl.SetWidth
 0005824F    mov         edx,29
 00058254    mov         eax,esi
 00058256    call        TControl.SetHeight
 0005825B    mov         byte ptr [esi+200],1
 00058262    mov         eax,esi
 00058264    test        bl,bl
>00058266    je          00058277
 00058268    call        @AfterConstruction
 0005826D    pop         dword ptr fs:[0]
 00058274    add         esp,0C
 00058277    mov         eax,esi
 00058279    pop         esi
 0005827A    pop         ebx
 0005827B    ret
*}
end;

//00058280
procedure TScrollBox.CreateParams(var Params:TCreateParams);
begin
{*
 00058280    push        ebx
 00058281    push        esi
 00058282    mov         esi,edx
 00058284    mov         ebx,eax
 00058286    mov         edx,esi
 00058288    mov         eax,ebx
 0005828A    call        TScrollingWinControl.CreateParams
 0005828F    xor         eax,eax
 00058291    mov         al,byte ptr [ebx+200]
 00058297    mov         eax,dword ptr [eax*4+0B4A34]
 0005829E    or          dword ptr [esi+4],eax
 000582A1    mov         eax,[000B58C0];NewStyleControls:Boolean
 000582A6    cmp         byte ptr [eax],0
>000582A9    je          000582CB
 000582AB    cmp         byte ptr [ebx+12C],0
>000582B2    je          000582CB
 000582B4    cmp         byte ptr [ebx+200],1
>000582BB    jne         000582CB
 000582BD    and         dword ptr [esi+4],0FF7FFFFF
 000582C4    or          dword ptr [esi+8],200
 000582CB    pop         esi
 000582CC    pop         ebx
 000582CD    ret
*}
end;

//000582D0
procedure TScrollBox.SetBorderStyle(Value:TBorderStyle);
begin
{*
 000582D0    cmp         dl,byte ptr [eax+200]
>000582D6    je          000582E3
 000582D8    mov         byte ptr [eax+200],dl
 000582DE    call        TWinControl.RecreateWnd
 000582E3    ret
*}
end;

//000582E4
procedure TScrollBox.WMSize(var Message:TWMSize);
begin
{*
 000582E4    push        ebx
 000582E5    mov         ebx,eax
 000582E7    mov         eax,ebx
 000582E9    call        TScrollingWinControl.WMSize
 000582EE    mov         eax,ebx
 000582F0    call        TScrollingWinControl.CalcAutoRange
 000582F5    pop         ebx
 000582F6    ret
*}
end;

//000582F8
procedure TScrollBox.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 000582F8    mov         ecx,dword ptr [eax]
 000582FA    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 000582FD    ret
*}
end;

//00058300
procedure TScrollBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 00058300    push        ebx
 00058301    push        esi
 00058302    mov         esi,edx
 00058304    mov         ebx,eax
 00058306    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005830B    cmp         byte ptr [eax],0
>0005830E    je          00058320
 00058310    cmp         byte ptr [ebx+200],1
>00058317    jne         00058320
 00058319    mov         eax,ebx
 0005831B    call        TWinControl.RecreateWnd
 00058320    mov         edx,esi
 00058322    mov         eax,ebx
 00058324    call        TWinControl.CMCtl3DChanged
 00058329    pop         esi
 0005832A    pop         ebx
 0005832B    ret
*}
end;

//0005832C
constructor TCustomForm.Create(AOwner:TComponent);
begin
{*
 0005832C    push        ebp
 0005832D    mov         ebp,esp
 0005832F    add         esp,0FFFFFEEC
 00058335    push        ebx
 00058336    xor         ebx,ebx
 00058338    mov         dword ptr [ebp-114],ebx
 0005833E    test        dl,dl
>00058340    je          0005834A
 00058342    add         esp,0FFFFFFF0
 00058345    call        @ClassCreate
 0005834A    mov         ebx,ecx
 0005834C    mov         byte ptr [ebp-5],dl
 0005834F    mov         dword ptr [ebp-4],eax
 00058352    xor         eax,eax
 00058354    push        ebp
 00058355    push        5848D
 0005835A    push        dword ptr fs:[eax]
 0005835D    mov         dword ptr fs:[eax],esp
 00058360    mov         eax,[000B5BD0];GlobalNameSpace:TMultiReadExclusiveWriteSynchronizer
 00058365    mov         eax,dword ptr [eax]
 00058367    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 0005836C    xor         eax,eax
 0005836E    push        ebp
 0005836F    push        5846D
 00058374    push        dword ptr fs:[eax]
 00058377    mov         dword ptr fs:[eax],esp
 0005837A    push        0
 0005837C    mov         ecx,ebx
 0005837E    xor         edx,edx
 00058380    mov         eax,dword ptr [ebp-4]
 00058383    mov         ebx,dword ptr [eax]
 00058385    call        dword ptr [ebx+0C0]
 0005838B    mov         eax,dword ptr [ebp-4]
 0005838E    call        TObject.ClassType
 00058393    cmp         eax,dword ptr ds:[554E4];TForm
>00058399    je          00058453
 0005839F    mov         eax,dword ptr [ebp-4]
 000583A2    test        byte ptr [eax+20],10
>000583A6    jne         00058453
 000583AC    mov         eax,dword ptr [ebp-4]
 000583AF    or          byte ptr [eax+2C0],1
 000583B6    xor         eax,eax
 000583B8    push        ebp
 000583B9    push        58438
 000583BE    push        dword ptr fs:[eax]
 000583C1    mov         dword ptr fs:[eax],esp
 000583C4    mov         edx,dword ptr ds:[554E4];TForm
 000583CA    mov         eax,dword ptr [ebp-4]
 000583CD    call        InitInheritedComponent
 000583D2    test        al,al
>000583D4    jne         00058420
 000583D6    lea         edx,[ebp-110]
 000583DC    mov         eax,dword ptr [ebp-4]
 000583DF    mov         eax,dword ptr [eax]
 000583E1    call        TObject.ClassName
 000583E6    lea         eax,[ebp-110]
 000583EC    mov         dword ptr [ebp-10],eax
 000583EF    mov         byte ptr [ebp-0C],4
 000583F3    lea         eax,[ebp-10]
 000583F6    push        eax
 000583F7    push        0
 000583F9    lea         edx,[ebp-114]
 000583FF    mov         eax,[000B58DC];^SResNotFound:TResStringRec
 00058404    call        LoadResString
 00058409    mov         ecx,dword ptr [ebp-114]
 0005840F    mov         dl,1
 00058411    mov         eax,[0001EC40];EResNotFound
 00058416    call        Exception.CreateFmt
 0005841B    call        @RaiseExcept
 00058420    xor         eax,eax
 00058422    pop         edx
 00058423    pop         ecx
 00058424    pop         ecx
 00058425    mov         dword ptr fs:[eax],edx
 00058428    push        5843F
 0005842D    mov         eax,dword ptr [ebp-4]
 00058430    and         byte ptr [eax+2C0],0FE
 00058437    ret
>00058438    jmp         @HandleFinally
>0005843D    jmp         0005842D
 0005843F    mov         eax,dword ptr [ebp-4]
 00058442    cmp         byte ptr [eax+214],0
>00058449    je          00058453
 0005844B    mov         eax,dword ptr [ebp-4]
 0005844E    call        TCustomForm.DoCreate
 00058453    xor         eax,eax
 00058455    pop         edx
 00058456    pop         ecx
 00058457    pop         ecx
 00058458    mov         dword ptr fs:[eax],edx
 0005845B    push        58474
 00058460    mov         eax,[000B5BD0];GlobalNameSpace:TMultiReadExclusiveWriteSynchronizer
 00058465    mov         eax,dword ptr [eax]
 00058467    call        TMultiReadExclusiveWriteSynchronizer.EndWrite
 0005846C    ret
>0005846D    jmp         @HandleFinally
>00058472    jmp         00058460
 00058474    xor         eax,eax
 00058476    pop         edx
 00058477    pop         ecx
 00058478    pop         ecx
 00058479    mov         dword ptr fs:[eax],edx
 0005847C    push        58494
 00058481    lea         eax,[ebp-114]
 00058487    call        @LStrClr
 0005848C    ret
>0005848D    jmp         @HandleFinally
>00058492    jmp         00058481
 00058494    mov         eax,dword ptr [ebp-4]
 00058497    cmp         byte ptr [ebp-5],0
>0005849B    je          000584AC
 0005849D    call        @AfterConstruction
 000584A2    pop         dword ptr fs:[0]
 000584A9    add         esp,0C
 000584AC    mov         eax,dword ptr [ebp-4]
 000584AF    pop         ebx
 000584B0    mov         esp,ebp
 000584B2    pop         ebp
 000584B3    ret
*}
end;

//000584B4
procedure TCustomForm.AfterConstruction;
begin
{*
 000584B4    cmp         byte ptr [eax+214],0
>000584BB    jne         000584C2
 000584BD    call        TCustomForm.DoCreate
 000584C2    ret
*}
end;

//000584C4
constructor TCustomForm.CreateNew(AOwner:TComponent; Dummy:Integer);
begin
{*
 000584C4    push        ebp
 000584C5    mov         ebp,esp
 000584C7    push        ecx
 000584C8    push        ebx
 000584C9    push        esi
 000584CA    test        dl,dl
>000584CC    je          000584D6
 000584CE    add         esp,0FFFFFFF0
 000584D1    call        @ClassCreate
 000584D6    mov         byte ptr [ebp-1],dl
 000584D9    mov         ebx,eax
 000584DB    xor         edx,edx
 000584DD    mov         eax,ebx
 000584DF    call        TScrollingWinControl.Create
 000584E4    mov         eax,[000585EC]
 000584E9    mov         dword ptr [ebx+40],eax
 000584EC    xor         edx,edx
 000584EE    mov         eax,ebx
 000584F0    call        TControl.SetLeft
 000584F5    xor         edx,edx
 000584F7    mov         eax,ebx
 000584F9    call        TControl.SetTop
 000584FE    mov         edx,140
 00058503    mov         eax,ebx
 00058505    call        TControl.SetWidth
 0005850A    mov         edx,0F0
 0005850F    mov         eax,ebx
 00058511    call        TControl.SetHeight
 00058516    xor         edx,edx
 00058518    mov         eax,ebx
 0005851A    call        TCustomForm.SetVisible
 0005851F    xor         edx,edx
 00058521    mov         eax,ebx
 00058523    call        TControl.SetParentColor
 00058528    xor         edx,edx
 0005852A    mov         eax,ebx
 0005852C    call        TControl.SetParentFont
 00058531    mov         dl,1
 00058533    mov         eax,ebx
 00058535    call        TWinControl.SetCtl3D
 0005853A    mov         al,[000585F0]
 0005853F    mov         byte ptr [ebx+208],al
 00058545    mov         byte ptr [ebx+209],2
 0005854C    mov         byte ptr [ebx+20B],0
 00058553    mov         byte ptr [ebx+211],3
 0005855A    mov         dl,1
 0005855C    mov         eax,[000290B0];TIcon
 00058561    call        TIcon.Create
 00058566    mov         esi,eax
 00058568    mov         dword ptr [ebx+220],esi
 0005856E    mov         dword ptr [esi+8],ebx
 00058571    mov         dword ptr [esi+4],58D20;TCustomForm.IconChanged
 00058578    mov         byte ptr [ebx+224],0
 0005857F    mov         dl,1
 00058581    mov         eax,[0003E18C];TControlCanvas
 00058586    call        TCanvas.Create
 0005858B    mov         esi,eax
 0005858D    mov         dword ptr [ebx+218],esi
 00058593    mov         edx,ebx
 00058595    mov         eax,esi
 00058597    call        TControlCanvas.SetControl
 0005859C    mov         eax,[000B67B4];Screen:TScreen
 000585A1    mov         eax,dword ptr [eax+34]
 000585A4    mov         dword ptr [ebx+23C],eax
 000585AA    mov         byte ptr [ebx+215],1
 000585B1    mov         eax,ebx
 000585B3    call        TObject.ClassType
 000585B8    mov         dword ptr [ebx+0A0],eax
 000585BE    mov         edx,ebx
 000585C0    mov         eax,[000B67B4];Screen:TScreen
 000585C5    call        TScreen.AddForm
 000585CA    mov         eax,ebx
 000585CC    cmp         byte ptr [ebp-1],0
>000585D0    je          000585E1
 000585D2    call        @AfterConstruction
 000585D7    pop         dword ptr fs:[0]
 000585DE    add         esp,0C
 000585E1    mov         eax,ebx
 000585E3    pop         esi
 000585E4    pop         ebx
 000585E5    pop         ecx
 000585E6    pop         ebp
 000585E7    ret         4
*}
end;

//000585F4
procedure TCustomForm.BeforeDestruction;
begin
{*
 000585F4    push        ebx
 000585F5    mov         ebx,eax
 000585F7    mov         eax,[000B5BD0];GlobalNameSpace:TMultiReadExclusiveWriteSynchronizer
 000585FC    mov         eax,dword ptr [eax]
 000585FE    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 00058603    mov         eax,ebx
 00058605    call        TComponent.Destroying
 0005860A    mov         eax,[000B67B4];Screen:TScreen
 0005860F    mov         eax,dword ptr [eax+70]
 00058612    mov         edx,ebx
 00058614    call        TList.Remove
 00058619    xor         edx,edx
 0005861B    mov         eax,ebx
 0005861D    call        RemoveFixupReferences
 00058622    cmp         dword ptr [ebx+244],0
>00058629    je          00058636
 0005862B    mov         eax,dword ptr [ebx+244]
 00058631    mov         edx,dword ptr [eax]
 00058633    call        dword ptr [edx+0C]
 00058636    cmp         byte ptr [ebx+20F],1
>0005863D    je          00058646
 0005863F    mov         eax,ebx
 00058641    call        TCustomForm.Hide
 00058646    cmp         byte ptr [ebx+214],0
>0005864D    jne         00058656
 0005864F    mov         eax,ebx
 00058651    call        TCustomForm.DoDestroy
 00058656    pop         ebx
 00058657    ret
*}
end;

//00058658
destructor TCustomForm.Destroy;
begin
{*
 00058658    push        ebp
 00058659    mov         ebp,esp
 0005865B    add         esp,0FFFFFFF8
 0005865E    call        @BeforeDestruction
 00058663    mov         byte ptr [ebp-5],dl
 00058666    mov         dword ptr [ebp-4],eax
 00058669    mov         eax,dword ptr [ebp-4]
 0005866C    test        byte ptr [eax+20],8
>00058670    jne         0005867E
 00058672    mov         eax,[000B5BD0];GlobalNameSpace:TMultiReadExclusiveWriteSynchronizer
 00058677    mov         eax,dword ptr [eax]
 00058679    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 0005867E    xor         eax,eax
 00058680    push        ebp
 00058681    push        5872E
 00058686    push        dword ptr fs:[eax]
 00058689    mov         dword ptr fs:[eax],esp
 0005868C    mov         eax,dword ptr [ebp-4]
 0005868F    cmp         byte ptr [eax+214],0
>00058696    je          000586A0
 00058698    mov         eax,dword ptr [ebp-4]
 0005869B    call        TCustomForm.DoDestroy
 000586A0    xor         edx,edx
 000586A2    mov         eax,dword ptr [ebp-4]
 000586A5    call        TCustomForm.MergeMenu
 000586AA    mov         eax,dword ptr [ebp-4]
 000586AD    call        TWinControl.HandleAllocated
 000586B2    test        al,al
>000586B4    je          000586C1
 000586B6    mov         eax,dword ptr [ebp-4]
 000586B9    mov         edx,dword ptr [eax]
 000586BB    call        dword ptr [edx+0A0]
 000586C1    mov         edx,dword ptr [ebp-4]
 000586C4    mov         eax,[000B67B4];Screen:TScreen
 000586C9    call        TScreen.RemoveForm
 000586CE    mov         eax,dword ptr [ebp-4]
 000586D1    mov         eax,dword ptr [eax+218]
 000586D7    call        TObject.Free
 000586DC    mov         eax,dword ptr [ebp-4]
 000586DF    mov         eax,dword ptr [eax+220]
 000586E5    call        TObject.Free
 000586EA    mov         eax,dword ptr [ebp-4]
 000586ED    mov         eax,dword ptr [eax+228]
 000586F3    call        TObject.Free
 000586F8    mov         eax,dword ptr [ebp-4]
 000586FB    mov         eax,dword ptr [eax+2BC]
 00058701    call        TObject.Free
 00058706    mov         dl,byte ptr [ebp-5]
 00058709    and         dl,0FC
 0005870C    mov         eax,dword ptr [ebp-4]
 0005870F    call        TScrollingWinControl.Destroy
 00058714    xor         eax,eax
 00058716    pop         edx
 00058717    pop         ecx
 00058718    pop         ecx
 00058719    mov         dword ptr fs:[eax],edx
 0005871C    push        58735
 00058721    mov         eax,[000B5BD0];GlobalNameSpace:TMultiReadExclusiveWriteSynchronizer
 00058726    mov         eax,dword ptr [eax]
 00058728    call        TMultiReadExclusiveWriteSynchronizer.EndWrite
 0005872D    ret
>0005872E    jmp         @HandleFinally
>00058733    jmp         00058721
 00058735    cmp         byte ptr [ebp-5],0
>00058739    jle         00058743
 0005873B    mov         eax,dword ptr [ebp-4]
 0005873E    call        @ClassDestroy
 00058743    pop         ecx
 00058744    pop         ecx
 00058745    pop         ebp
 00058746    ret
*}
end;

//00058748
procedure TCustomForm.DoCreate;
begin
{*
 00058748    push        ebp
 00058749    mov         ebp,esp
 0005874B    push        ecx
 0005874C    push        ebx
 0005874D    push        esi
 0005874E    push        edi
 0005874F    mov         dword ptr [ebp-4],eax
 00058752    mov         eax,dword ptr [ebp-4]
 00058755    cmp         word ptr [eax+2AE],0
>0005875D    je          000587A0
 0005875F    xor         eax,eax
 00058761    push        ebp
 00058762    push        58789
 00058767    push        dword ptr fs:[eax]
 0005876A    mov         dword ptr fs:[eax],esp
 0005876D    mov         ebx,dword ptr [ebp-4]
 00058770    mov         edx,dword ptr [ebp-4]
 00058773    mov         eax,dword ptr [ebx+2B0]
 00058779    call        dword ptr [ebx+2AC]
 0005877F    xor         eax,eax
 00058781    pop         edx
 00058782    pop         ecx
 00058783    pop         ecx
 00058784    mov         dword ptr fs:[eax],edx
>00058787    jmp         000587A0
>00058789    jmp         @HandleAnyException
 0005878E    mov         edx,dword ptr [ebp-4]
 00058791    mov         eax,[000B67B0];Application:TApplication
 00058796    call        TApplication.HandleException
 0005879B    call        @DoneExcept
 000587A0    mov         eax,dword ptr [ebp-4]
 000587A3    test        byte ptr [eax+2C0],2
>000587AA    je          000587B6
 000587AC    mov         dl,1
 000587AE    mov         eax,dword ptr [ebp-4]
 000587B1    call        TCustomForm.SetVisible
 000587B6    pop         edi
 000587B7    pop         esi
 000587B8    pop         ebx
 000587B9    pop         ecx
 000587BA    pop         ebp
 000587BB    ret
*}
end;

//000587BC
procedure TCustomForm.DoDestroy;
begin
{*
 000587BC    push        ebp
 000587BD    mov         ebp,esp
 000587BF    push        ecx
 000587C0    push        ebx
 000587C1    push        esi
 000587C2    push        edi
 000587C3    mov         dword ptr [ebp-4],eax
 000587C6    mov         eax,dword ptr [ebp-4]
 000587C9    cmp         word ptr [eax+2B6],0
>000587D1    je          00058814
 000587D3    xor         eax,eax
 000587D5    push        ebp
 000587D6    push        587FD
 000587DB    push        dword ptr fs:[eax]
 000587DE    mov         dword ptr fs:[eax],esp
 000587E1    mov         ebx,dword ptr [ebp-4]
 000587E4    mov         edx,dword ptr [ebp-4]
 000587E7    mov         eax,dword ptr [ebx+2B8]
 000587ED    call        dword ptr [ebx+2B4]
 000587F3    xor         eax,eax
 000587F5    pop         edx
 000587F6    pop         ecx
 000587F7    pop         ecx
 000587F8    mov         dword ptr fs:[eax],edx
>000587FB    jmp         00058814
>000587FD    jmp         @HandleAnyException
 00058802    mov         edx,dword ptr [ebp-4]
 00058805    mov         eax,[000B67B0];Application:TApplication
 0005880A    call        TApplication.HandleException
 0005880F    call        @DoneExcept
 00058814    pop         edi
 00058815    pop         esi
 00058816    pop         ebx
 00058817    pop         ecx
 00058818    pop         ebp
 00058819    ret
*}
end;

//0005881C
procedure TCustomForm.Loaded;
begin
{*
 0005881C    push        ebx
 0005881D    push        esi
 0005881E    mov         ebx,eax
 00058820    mov         eax,ebx
 00058822    call        TControl.Loaded
 00058827    mov         eax,dword ptr [ebx+200]
 0005882D    test        eax,eax
>0005882F    je          0005884F
 00058831    mov         esi,eax
 00058833    xor         eax,eax
 00058835    mov         dword ptr [ebx+200],eax
 0005883B    mov         eax,esi
 0005883D    call        TWinControl.CanFocus
 00058842    test        al,al
>00058844    je          0005884F
 00058846    mov         edx,esi
 00058848    mov         eax,ebx
 0005884A    call        TCustomForm.SetActiveControl
 0005884F    pop         esi
 00058850    pop         ebx
 00058851    ret
*}
end;

//00058854
procedure TCustomForm.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00058854    push        ebx
 00058855    push        esi
 00058856    push        edi
 00058857    push        ebp
 00058858    mov         ebx,ecx
 0005885A    mov         esi,edx
 0005885C    mov         edi,eax
 0005885E    mov         ecx,ebx
 00058860    mov         edx,esi
 00058862    mov         eax,edi
 00058864    call        TControl.Notification
 00058869    mov         eax,ebx
 0005886B    sub         al,1
>0005886D    jb          00058876
>0005886F    je          000588E1
>00058871    jmp         00058929
 00058876    mov         eax,esi
 00058878    mov         edx,dword ptr ds:[4D310];TCustomActionList
 0005887E    call        @IsClass
 00058883    test        al,al
>00058885    je          000588B1
 00058887    cmp         dword ptr [edi+2BC],0
>0005888E    jne         000588A2
 00058890    mov         dl,1
 00058892    mov         eax,[0001EEC4];TList
 00058897    call        TObject.Create
 0005889C    mov         dword ptr [edi+2BC],eax
 000588A2    mov         edx,esi
 000588A4    mov         eax,dword ptr [edi+2BC]
 000588AA    call        TList.Add
>000588AF    jmp         00058929
 000588B1    test        byte ptr [edi+20],1
>000588B5    jne         00058929
 000588B7    cmp         dword ptr [edi+228],0
>000588BE    jne         00058929
 000588C0    cmp         edi,dword ptr [esi+4]
>000588C3    jne         00058929
 000588C5    mov         eax,esi
 000588C7    mov         edx,dword ptr ds:[50288];TMainMenu
 000588CD    call        @IsClass
 000588D2    test        al,al
>000588D4    je          00058929
 000588D6    mov         edx,esi
 000588D8    mov         eax,edi
 000588DA    call        TCustomForm.SetMenu
>000588DF    jmp         00058929
 000588E1    mov         ebp,dword ptr [edi+2BC]
 000588E7    test        ebp,ebp
>000588E9    je          00058907
 000588EB    mov         eax,esi
 000588ED    mov         edx,dword ptr ds:[4D310];TCustomActionList
 000588F3    call        @IsClass
 000588F8    test        al,al
>000588FA    je          00058907
 000588FC    mov         edx,esi
 000588FE    mov         eax,ebp
 00058900    call        TList.Remove
>00058905    jmp         00058929
 00058907    cmp         esi,dword ptr [edi+228]
>0005890D    jne         00058918
 0005890F    xor         edx,edx
 00058911    mov         eax,edi
 00058913    call        TCustomForm.SetMenu
 00058918    cmp         esi,dword ptr [edi+238]
>0005891E    jne         00058929
 00058920    xor         edx,edx
 00058922    mov         eax,edi
 00058924    call        TCustomForm.SetWindowMenu
 00058929    cmp         dword ptr [edi+230],0
>00058930    je          00058941
 00058932    mov         ecx,ebx
 00058934    mov         edx,esi
 00058936    mov         eax,dword ptr [edi+230]
 0005893C    mov         ebx,dword ptr [eax]
 0005893E    call        dword ptr [ebx+10]
 00058941    pop         ebp
 00058942    pop         edi
 00058943    pop         esi
 00058944    pop         ebx
 00058945    ret
*}
end;

//00058948
procedure TCustomForm.ReadState(Reader:TReader);
begin
{*
 00058948    push        ebp
 00058949    mov         ebp,esp
 0005894B    push        ecx
 0005894C    push        ebx
 0005894D    push        esi
 0005894E    mov         esi,edx
 00058950    mov         dword ptr [ebp-4],eax
 00058953    mov         eax,dword ptr [ebp-4]
 00058956    call        TWinControl.DisableAlign
 0005895B    xor         edx,edx
 0005895D    push        ebp
 0005895E    push        58B4A
 00058963    push        dword ptr fs:[edx]
 00058966    mov         dword ptr fs:[edx],esp
 00058969    mov         eax,dword ptr [ebp-4]
 0005896C    xor         edx,edx
 0005896E    mov         dword ptr [eax+248],edx
 00058974    mov         eax,dword ptr [ebp-4]
 00058977    xor         edx,edx
 00058979    mov         dword ptr [eax+24C],edx
 0005897F    mov         eax,dword ptr [ebp-4]
 00058982    xor         edx,edx
 00058984    mov         dword ptr [eax+250],edx
 0005898A    xor         ebx,ebx
 0005898C    mov         eax,[000B5AE8];^ModuleIsCpp:Boolean
 00058991    mov         al,byte ptr [eax]
 00058993    xor         al,1
 00058995    mov         edx,dword ptr [ebp-4]
 00058998    mov         byte ptr [edx+214],al
 0005899E    mov         edx,esi
 000589A0    mov         eax,dword ptr [ebp-4]
 000589A3    call        TWinControl.ReadState
 000589A8    mov         eax,dword ptr [ebp-4]
 000589AB    cmp         dword ptr [eax+23C],0
>000589B2    je          00058ABE
 000589B8    mov         eax,dword ptr [ebp-4]
 000589BB    cmp         dword ptr [eax+250],0
>000589C2    jle         00058ABE
 000589C8    mov         eax,dword ptr [ebp-4]
 000589CB    test        byte ptr [eax+84],10
>000589D2    je          00058A17
 000589D4    mov         eax,dword ptr [ebp-4]
 000589D7    mov         eax,dword ptr [eax+23C]
 000589DD    mov         edx,dword ptr ds:[0B67B4];Screen:TScreen
 000589E3    cmp         eax,dword ptr [edx+34]
>000589E6    je          00058A17
 000589E8    mov         eax,dword ptr [ebp-4]
 000589EB    mov         eax,dword ptr [eax+23C]
 000589F1    push        eax
 000589F2    mov         eax,[000B67B4];Screen:TScreen
 000589F7    mov         eax,dword ptr [eax+34]
 000589FA    push        eax
 000589FB    mov         eax,dword ptr [ebp-4]
 000589FE    mov         esi,dword ptr [eax+58]
 00058A01    mov         eax,esi
 00058A03    call        TFont.GetHeight
 00058A08    push        eax
 00058A09    call        kernel32.MulDiv
 00058A0E    mov         edx,eax
 00058A10    mov         eax,esi
 00058A12    call        TFont.SetHeight
 00058A17    mov         eax,[000B67B4];Screen:TScreen
 00058A1C    mov         eax,dword ptr [eax+34]
 00058A1F    mov         edx,dword ptr [ebp-4]
 00058A22    mov         dword ptr [edx+23C],eax
 00058A28    mov         eax,dword ptr [ebp-4]
 00058A2B    call        TCustomForm.GetTextHeight
 00058A30    mov         esi,eax
 00058A32    mov         eax,dword ptr [ebp-4]
 00058A35    mov         eax,dword ptr [eax+250]
 00058A3B    cmp         esi,eax
>00058A3D    je          00058ABE
 00058A3F    mov         bl,1
 00058A41    mov         ecx,eax
 00058A43    mov         edx,esi
 00058A45    mov         eax,dword ptr [ebp-4]
 00058A48    call        TScrollingWinControl.ScaleScrollBars
 00058A4D    mov         eax,dword ptr [ebp-4]
 00058A50    mov         ecx,dword ptr [eax+250]
 00058A56    mov         edx,esi
 00058A58    mov         eax,dword ptr [ebp-4]
 00058A5B    call        TWinControl.ScaleControls
 00058A60    mov         eax,dword ptr [ebp-4]
 00058A63    test        byte ptr [eax+84],4
>00058A6A    je          00058A8F
 00058A6C    mov         eax,dword ptr [ebp-4]
 00058A6F    mov         eax,dword ptr [eax+250]
 00058A75    push        eax
 00058A76    push        esi
 00058A77    mov         eax,dword ptr [ebp-4]
 00058A7A    mov         eax,dword ptr [eax+248]
 00058A80    push        eax
 00058A81    call        kernel32.MulDiv
 00058A86    mov         edx,dword ptr [ebp-4]
 00058A89    mov         dword ptr [edx+248],eax
 00058A8F    mov         eax,dword ptr [ebp-4]
 00058A92    test        byte ptr [eax+84],8
>00058A99    je          00058ABE
 00058A9B    mov         eax,dword ptr [ebp-4]
 00058A9E    mov         eax,dword ptr [eax+250]
 00058AA4    push        eax
 00058AA5    push        esi
 00058AA6    mov         eax,dword ptr [ebp-4]
 00058AA9    mov         eax,dword ptr [eax+24C]
 00058AAF    push        eax
 00058AB0    call        kernel32.MulDiv
 00058AB5    mov         edx,dword ptr [ebp-4]
 00058AB8    mov         dword ptr [edx+24C],eax
 00058ABE    mov         eax,dword ptr [ebp-4]
 00058AC1    mov         eax,dword ptr [eax+248]
 00058AC7    test        eax,eax
>00058AC9    jle         00058AD5
 00058ACB    mov         edx,eax
 00058ACD    mov         eax,dword ptr [ebp-4]
 00058AD0    call        TControl.SetClientWidth
 00058AD5    mov         eax,dword ptr [ebp-4]
 00058AD8    mov         eax,dword ptr [eax+24C]
 00058ADE    test        eax,eax
>00058AE0    jle         00058AEC
 00058AE2    mov         edx,eax
 00058AE4    mov         eax,dword ptr [ebp-4]
 00058AE7    call        TControl.SetClientHeight
 00058AEC    mov         eax,dword ptr [ebp-4]
 00058AEF    mov         dl,byte ptr ds:[58B58]
 00058AF5    mov         byte ptr [eax+84],dl
 00058AFB    test        bl,bl
>00058AFD    jne         00058B23
 00058AFF    mov         ecx,1
 00058B04    mov         edx,1
 00058B09    mov         eax,dword ptr [ebp-4]
 00058B0C    call        TScrollingWinControl.ScaleScrollBars
 00058B11    mov         ecx,1
 00058B16    mov         edx,1
 00058B1B    mov         eax,dword ptr [ebp-4]
 00058B1E    call        TWinControl.ScaleControls
 00058B23    push        0
 00058B25    xor         ecx,ecx
 00058B27    mov         edx,0B03D
 00058B2C    mov         eax,dword ptr [ebp-4]
 00058B2F    call        TControl.Perform
 00058B34    xor         eax,eax
 00058B36    pop         edx
 00058B37    pop         ecx
 00058B38    pop         ecx
 00058B39    mov         dword ptr fs:[eax],edx
 00058B3C    push        58B51
 00058B41    mov         eax,dword ptr [ebp-4]
 00058B44    call        TWinControl.EnableAlign
 00058B49    ret
>00058B4A    jmp         @HandleFinally
>00058B4F    jmp         00058B41
 00058B51    pop         esi
 00058B52    pop         ebx
 00058B53    pop         ecx
 00058B54    pop         ebp
 00058B55    ret
*}
end;

//00058B5C
procedure TCustomForm.DefineProperties(Filer:TFiler);
begin
{*
 00058B5C    push        ebx
 00058B5D    push        esi
 00058B5E    push        edi
 00058B5F    mov         esi,edx
 00058B61    mov         ebx,eax
 00058B63    mov         edx,esi
 00058B65    mov         eax,ebx
 00058B67    call        TControl.DefineProperties
 00058B6C    push        0
 00058B6E    push        0
 00058B70    push        ebx
 00058B71    push        58C5C;TCustomForm.WritePixelsPerInch
 00058B76    mov         cl,byte ptr [ebx+4E]
 00058B79    xor         cl,1
 00058B7C    mov         edx,58BC8;'PixelsPerInch'
 00058B81    mov         eax,esi
 00058B83    mov         edi,dword ptr [eax]
 00058B85    call        dword ptr [edi]
 00058B87    push        ebx
 00058B88    push        58C28;TCustomForm.ReadTextHeight
 00058B8D    push        ebx
 00058B8E    push        58C40;TCustomForm.WriteTextHeight
 00058B93    mov         cl,byte ptr [ebx+4E]
 00058B96    xor         cl,1
 00058B99    mov         edx,58BE0;'TextHeight'
 00058B9E    mov         eax,esi
 00058BA0    mov         edi,dword ptr [eax]
 00058BA2    call        dword ptr [edi]
 00058BA4    push        ebx
 00058BA5    push        58C08;TCustomForm.ReadIgnoreFontProperty
 00058BAA    push        0
 00058BAC    push        0
 00058BAE    xor         ecx,ecx
 00058BB0    mov         edx,58BF4;'IgnoreFontProperty'
 00058BB5    mov         eax,esi
 00058BB7    mov         ebx,dword ptr [eax]
 00058BB9    call        dword ptr [ebx]
 00058BBB    pop         edi
 00058BBC    pop         esi
 00058BBD    pop         ebx
 00058BBE    ret
*}
end;

//00058C08
procedure TCustomForm.ReadIgnoreFontProperty(Reader:TReader);
begin
{*
 00058C08    push        ebx
 00058C09    push        esi
 00058C0A    mov         esi,edx
 00058C0C    mov         ebx,eax
 00058C0E    mov         eax,esi
 00058C10    call        TReader.ReadBoolean
 00058C15    test        al,al
>00058C17    je          00058C22
 00058C19    mov         dl,1
 00058C1B    mov         eax,ebx
 00058C1D    call        TControl.SetParentFont
 00058C22    pop         esi
 00058C23    pop         ebx
 00058C24    ret
*}
end;

//00058C28
procedure TCustomForm.ReadTextHeight(Reader:TReader);
begin
{*
 00058C28    push        ebx
 00058C29    push        esi
 00058C2A    mov         esi,edx
 00058C2C    mov         ebx,eax
 00058C2E    mov         eax,esi
 00058C30    call        TReader.ReadInteger
 00058C35    mov         dword ptr [ebx+250],eax
 00058C3B    pop         esi
 00058C3C    pop         ebx
 00058C3D    ret
*}
end;

//00058C40
procedure TCustomForm.WriteTextHeight(Writer:TWriter);
begin
{*
 00058C40    push        ebx
 00058C41    push        esi
 00058C42    mov         esi,edx
 00058C44    mov         ebx,eax
 00058C46    mov         eax,ebx
 00058C48    call        TCustomForm.GetTextHeight
 00058C4D    mov         edx,eax
 00058C4F    mov         eax,esi
 00058C51    call        TWriter.WriteInteger
 00058C56    pop         esi
 00058C57    pop         ebx
 00058C58    ret
*}
end;

//00058C5C
procedure TCustomForm.WritePixelsPerInch(Writer:TWriter);
begin
{*
 00058C5C    push        ebx
 00058C5D    push        esi
 00058C5E    mov         esi,edx
 00058C60    mov         ebx,eax
 00058C62    mov         eax,ebx
 00058C64    call        TCustomForm.GetPixelsPerInch
 00058C69    mov         edx,eax
 00058C6B    mov         eax,esi
 00058C6D    call        TWriter.WriteInteger
 00058C72    pop         esi
 00058C73    pop         ebx
 00058C74    ret
*}
end;

//00058C78
function TCustomForm.GetTextHeight:Integer;
begin
{*
 00058C78    push        ebx
 00058C79    mov         ebx,eax
 00058C7B    mov         eax,ebx
 00058C7D    call        TCustomForm.GetCanvas
 00058C82    mov         edx,58C98;'0'
 00058C87    call        TCanvas.TextHeight
 00058C8C    pop         ebx
 00058C8D    ret
*}
end;

//00058C9C
procedure TCustomForm.BeginAutoDrag;
begin
{*
 00058C9C    ret
*}
end;

//00058CA0
procedure TCustomForm.ChangeScale(M:Integer; D:Integer);
begin
{*
 00058CA0    push        ebx
 00058CA1    push        esi
 00058CA2    push        edi
 00058CA3    push        ebp
 00058CA4    mov         edi,ecx
 00058CA6    mov         esi,edx
 00058CA8    mov         ebx,eax
 00058CAA    mov         ecx,edi
 00058CAC    mov         edx,esi
 00058CAE    mov         eax,ebx
 00058CB0    call        TScrollingWinControl.ScaleScrollBars
 00058CB5    mov         ecx,edi
 00058CB7    mov         edx,esi
 00058CB9    mov         eax,ebx
 00058CBB    call        TWinControl.ScaleControls
 00058CC0    mov         eax,ebx
 00058CC2    call        TCustomForm.IsClientSizeStored
 00058CC7    test        al,al
>00058CC9    je          00058CFD
 00058CCB    mov         eax,ebx
 00058CCD    call        TControl.GetClientHeight
 00058CD2    mov         ebp,eax
 00058CD4    push        edi
 00058CD5    push        esi
 00058CD6    mov         eax,ebx
 00058CD8    call        TControl.GetClientWidth
 00058CDD    push        eax
 00058CDE    call        kernel32.MulDiv
 00058CE3    mov         edx,eax
 00058CE5    mov         eax,ebx
 00058CE7    call        TCustomForm.SetClientWidth
 00058CEC    push        edi
 00058CED    push        esi
 00058CEE    push        ebp
 00058CEF    call        kernel32.MulDiv
 00058CF4    mov         edx,eax
 00058CF6    mov         eax,ebx
 00058CF8    call        TCustomForm.SetClientHeight
 00058CFD    push        edi
 00058CFE    push        esi
 00058CFF    mov         ebp,dword ptr [ebx+58]
 00058D02    mov         eax,ebp
 00058D04    call        TFont.GetSize
 00058D09    push        eax
 00058D0A    call        kernel32.MulDiv
 00058D0F    mov         edx,eax
 00058D11    mov         eax,ebp
 00058D13    call        TFont.SetSize
 00058D18    pop         ebp
 00058D19    pop         edi
 00058D1A    pop         esi
 00058D1B    pop         ebx
 00058D1C    ret
*}
end;

//00058D20
procedure TCustomForm.IconChanged(Sender:TObject);
begin
{*
 00058D20    push        ebx
 00058D21    mov         ebx,eax
 00058D23    mov         eax,[000B58C0];NewStyleControls:Boolean
 00058D28    cmp         byte ptr [eax],0
>00058D2B    je          00058D5F
 00058D2D    mov         eax,ebx
 00058D2F    call        TWinControl.HandleAllocated
 00058D34    test        al,al
>00058D36    je          00058D77
 00058D38    cmp         byte ptr [ebx+209],3
>00058D3F    je          00058D77
 00058D41    mov         eax,ebx
 00058D43    call        TCustomForm.GetIconHandle
 00058D48    push        eax
 00058D49    push        1
 00058D4B    push        80
 00058D50    mov         eax,ebx
 00058D52    call        TWinControl.GetHandle
 00058D57    push        eax
 00058D58    call        user32.SendMessageA
 00058D5D    pop         ebx
 00058D5E    ret
 00058D5F    mov         eax,ebx
 00058D61    call        TWinControl.GetHandle
 00058D66    push        eax
 00058D67    call        user32.IsIconic
 00058D6C    test        eax,eax
>00058D6E    je          00058D77
 00058D70    mov         eax,ebx
 00058D72    mov         edx,dword ptr [eax]
 00058D74    call        dword ptr [edx+78]
 00058D77    pop         ebx
 00058D78    ret
*}
end;

//00058D7C
function TCustomForm.IsClientSizeStored(Value:Integer):Boolean;
begin
{*
 00058D7C    push        ebx
 00058D7D    mov         ebx,eax
 00058D7F    mov         eax,ebx
 00058D81    call        TCustomForm.IsFormSizeStored
 00058D86    xor         al,1
 00058D88    pop         ebx
 00058D89    ret
*}
end;

//00058D8C
function TCustomForm.IsFormSizeStored(Value:Integer):Boolean;
begin
{*
 00058D8C    cmp         byte ptr [eax+1F4],0
>00058D93    jne         00058DB0
 00058D95    mov         edx,dword ptr [eax+1EC]
 00058D9B    cmp         dword ptr [edx+10],0
>00058D9F    jne         00058DB0
 00058DA1    mov         eax,dword ptr [eax+1F0]
 00058DA7    cmp         dword ptr [eax+10],0
>00058DAB    jne         00058DB0
 00058DAD    xor         eax,eax
 00058DAF    ret
 00058DB0    mov         al,1
 00058DB2    ret
*}
end;

//00058DB4
function TCustomForm.IsAutoScrollStored(Value:Boolean):Boolean;
begin
{*
 00058DB4    push        ebx
 00058DB5    mov         ebx,eax
 00058DB7    mov         eax,ebx
 00058DB9    call        TCustomForm.IsForm
 00058DBE    test        al,al
>00058DC0    je          00058DDE
 00058DC2    mov         al,byte ptr [ebx+209]
 00058DC8    sub         al,2
>00058DCA    je          00058DD4
 00058DCC    sub         al,3
>00058DCE    je          00058DD4
 00058DD0    xor         eax,eax
>00058DD2    jmp         00058DD6
 00058DD4    mov         al,1
 00058DD6    cmp         al,byte ptr [ebx+1F4]
>00058DDC    jne         00058DE2
 00058DDE    xor         eax,eax
 00058DE0    pop         ebx
 00058DE1    ret
 00058DE2    mov         al,1
 00058DE4    pop         ebx
 00058DE5    ret
*}
end;

//00058DE8
procedure TCustomForm.DoClose(var Action:TCloseAction);
begin
{*
 00058DE8    push        ebx
 00058DE9    cmp         word ptr [eax+26E],0
>00058DF1    je          00058E05
 00058DF3    mov         ecx,edx
 00058DF5    mov         ebx,eax
 00058DF7    mov         edx,eax
 00058DF9    mov         eax,dword ptr [ebx+270]
 00058DFF    call        dword ptr [ebx+26C]
 00058E05    pop         ebx
 00058E06    ret
*}
end;

//00058E08
procedure TCustomForm.DoHide;
begin
{*
 00058E08    push        ebx
 00058E09    cmp         word ptr [eax+28E],0
>00058E11    je          00058E23
 00058E13    mov         ebx,eax
 00058E15    mov         edx,eax
 00058E17    mov         eax,dword ptr [ebx+290]
 00058E1D    call        dword ptr [ebx+28C]
 00058E23    pop         ebx
 00058E24    ret
*}
end;

//00058E28
procedure TCustomForm.DoShow;
begin
{*
 00058E28    push        ebx
 00058E29    cmp         word ptr [eax+2A6],0
>00058E31    je          00058E43
 00058E33    mov         ebx,eax
 00058E35    mov         edx,eax
 00058E37    mov         eax,dword ptr [ebx+2A8]
 00058E3D    call        dword ptr [ebx+2A4]
 00058E43    pop         ebx
 00058E44    ret
*}
end;

//00058E48
function TCustomForm.GetClientRect:TRect;
begin
{*
 00058E48    push        ebx
 00058E49    push        esi
 00058E4A    mov         esi,edx
 00058E4C    mov         ebx,eax
 00058E4E    mov         eax,ebx
 00058E50    call        TWinControl.GetHandle
 00058E55    push        eax
 00058E56    call        user32.IsIconic
 00058E5B    test        eax,eax
>00058E5D    je          00058EC2
 00058E5F    push        0
 00058E61    push        0
 00058E63    push        0
 00058E65    push        0
 00058E67    push        esi
 00058E68    call        user32.SetRect
 00058E6D    push        0EC
 00058E6F    mov         eax,ebx
 00058E71    call        TWinControl.GetHandle
 00058E76    push        eax
 00058E77    call        user32.GetWindowLongA
 00058E7C    push        eax
 00058E7D    cmp         dword ptr [ebx+228],0
 00058E84    setne       al
 00058E87    neg         al
 00058E89    sbb         eax,eax
 00058E8B    push        eax
 00058E8C    push        0F0
 00058E8E    mov         eax,ebx
 00058E90    call        TWinControl.GetHandle
 00058E95    push        eax
 00058E96    call        user32.GetWindowLongA
 00058E9B    push        eax
 00058E9C    push        esi
 00058E9D    call        user32.AdjustWindowRectEx
 00058EA2    mov         eax,dword ptr [ebx+3C]
 00058EA5    sub         eax,dword ptr [esi+0C]
 00058EA8    add         eax,dword ptr [esi+4]
 00058EAB    push        eax
 00058EAC    mov         eax,dword ptr [ebx+38]
 00058EAF    sub         eax,dword ptr [esi+8]
 00058EB2    add         eax,dword ptr [esi]
 00058EB4    push        eax
 00058EB5    push        0
 00058EB7    push        0
 00058EB9    push        esi
 00058EBA    call        user32.SetRect
 00058EBF    pop         esi
 00058EC0    pop         ebx
 00058EC1    ret
 00058EC2    mov         edx,esi
 00058EC4    mov         eax,ebx
 00058EC6    call        TWinControl.GetClientRect
 00058ECB    pop         esi
 00058ECC    pop         ebx
 00058ECD    ret
*}
end;

//00058ED0
procedure TCustomForm.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00058ED0    push        ebp
 00058ED1    mov         ebp,esp
 00058ED3    add         esp,0FFFFFFF8
 00058ED6    push        ebx
 00058ED7    push        esi
 00058ED8    push        edi
 00058ED9    mov         ebx,edx
 00058EDB    mov         esi,eax
 00058EDD    push        dword ptr [ebp+0C]
 00058EE0    push        dword ptr [ebp+8]
 00058EE3    mov         edx,ebx
 00058EE5    mov         eax,esi
 00058EE7    call        TWinControl.GetChildren
 00058EEC    cmp         esi,ebx
>00058EEE    jne         00058F32
 00058EF0    mov         eax,esi
 00058EF2    call        TComponent.GetComponentCount
 00058EF7    dec         eax
 00058EF8    test        eax,eax
>00058EFA    jl          00058F32
 00058EFC    inc         eax
 00058EFD    mov         dword ptr [ebp-8],eax
 00058F00    mov         dword ptr [ebp-4],0
 00058F07    mov         edx,dword ptr [ebp-4]
 00058F0A    mov         eax,esi
 00058F0C    call        TComponent.GetComponent
 00058F11    mov         edi,eax
 00058F13    mov         eax,edi
 00058F15    mov         bx,0FFF2
 00058F19    call        @CallDynaInst
 00058F1E    test        al,al
>00058F20    jne         00058F2A
 00058F22    mov         edx,edi
 00058F24    mov         eax,dword ptr [ebp+0C]
 00058F27    call        dword ptr [ebp+8]
 00058F2A    inc         dword ptr [ebp-4]
 00058F2D    dec         dword ptr [ebp-8]
>00058F30    jne         00058F07
 00058F32    pop         edi
 00058F33    pop         esi
 00058F34    pop         ebx
 00058F35    pop         ecx
 00058F36    pop         ecx
 00058F37    pop         ebp
 00058F38    ret         8
*}
end;

//00058F3C
function TCustomForm.GetFloating:Boolean;
begin
{*
 00058F3C    push        ebx
 00058F3D    push        esi
 00058F3E    mov         ebx,eax
 00058F40    cmp         dword ptr [ebx+8C],0
>00058F47    jne         00058F5D
 00058F49    mov         eax,ebx
 00058F4B    mov         edx,dword ptr [eax]
 00058F4D    call        dword ptr [edx+58]
 00058F50    mov         esi,eax
 00058F52    mov         eax,ebx
 00058F54    call        TObject.ClassType
 00058F59    cmp         esi,eax
>00058F5B    je          00058F62
 00058F5D    xor         eax,eax
 00058F5F    pop         esi
 00058F60    pop         ebx
 00058F61    ret
 00058F62    mov         al,1
 00058F64    pop         esi
 00058F65    pop         ebx
 00058F66    ret
*}
end;

//00058F68
procedure TCustomForm.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 00058F68    push        ebx
 00058F69    push        esi
 00058F6A    push        edi
 00058F6B    push        ebp
 00058F6C    add         esp,0FFFFFFF4
 00058F6F    mov         dword ptr [esp+4],ecx
 00058F73    mov         dword ptr [esp],edx
 00058F76    mov         ebp,eax
 00058F78    mov         eax,dword ptr [esp]
 00058F7B    mov         edx,dword ptr ds:[3EB50];TControl
 00058F81    call        @IsClass
 00058F86    test        al,al
>00058F88    je          00058F9A
 00058F8A    mov         ecx,dword ptr [esp+4]
 00058F8E    mov         edx,dword ptr [esp]
 00058F91    mov         eax,ebp
 00058F93    call        TWinControl.SetChildOrder
>00058F98    jmp         00058FF2
 00058F9A    mov         eax,ebp
 00058F9C    call        TWinControl.GetControlCount
 00058FA1    sub         dword ptr [esp+4],eax
 00058FA5    mov         dword ptr [esp+8],0FFFFFFFF
 00058FAD    mov         eax,ebp
 00058FAF    call        TComponent.GetComponentCount
 00058FB4    mov         esi,eax
 00058FB6    dec         esi
 00058FB7    test        esi,esi
>00058FB9    jl          00058FF2
 00058FBB    inc         esi
 00058FBC    xor         edi,edi
 00058FBE    mov         edx,edi
 00058FC0    mov         eax,ebp
 00058FC2    call        TComponent.GetComponent
 00058FC7    mov         bx,0FFF2
 00058FCB    call        @CallDynaInst
 00058FD0    test        al,al
>00058FD2    jne         00058FEE
 00058FD4    inc         dword ptr [esp+8]
 00058FD8    mov         eax,dword ptr [esp+8]
 00058FDC    cmp         eax,dword ptr [esp+4]
>00058FE0    jne         00058FEE
 00058FE2    mov         edx,edi
 00058FE4    mov         eax,dword ptr [esp]
 00058FE7    call        TComponent.SetComponentIndex
>00058FEC    jmp         00058FF2
 00058FEE    inc         edi
 00058FEF    dec         esi
>00058FF0    jne         00058FBE
 00058FF2    add         esp,0C
 00058FF5    pop         ebp
 00058FF6    pop         edi
 00058FF7    pop         esi
 00058FF8    pop         ebx
 00058FF9    ret
*}
end;

//00058FFC
procedure TCustomForm.SetParentBiDiMode(Value:Boolean);
begin
{*
 00058FFC    push        ebx
 00058FFD    mov         ebx,eax
 00058FFF    cmp         dl,byte ptr [ebx+50]
>00059002    je          00059021
 00059004    mov         eax,ebx
 00059006    call        TControl.SetParentBiDiMode
 0005900B    cmp         dword ptr [ebx+24],0
>0005900F    jne         00059021
 00059011    push        0
 00059013    xor         ecx,ecx
 00059015    mov         edx,0B03D
 0005901A    mov         eax,ebx
 0005901C    call        TControl.Perform
 00059021    pop         ebx
 00059022    ret
*}
end;

//00059024
procedure TCustomForm.SetClientWidth(Value:Integer);
begin
{*
 00059024    push        ebx
 00059025    mov         ebx,eax
 00059027    test        byte ptr [ebx+44],8
>0005902B    je          00059046
 0005902D    mov         dword ptr [ebx+248],edx
 00059033    mov         al,[00059050]
 00059038    or          al,byte ptr [ebx+84]
 0005903E    mov         byte ptr [ebx+84],al
 00059044    pop         ebx
 00059045    ret
 00059046    mov         eax,ebx
 00059048    call        TControl.SetClientWidth
 0005904D    pop         ebx
 0005904E    ret
*}
end;

//00059054
procedure TCustomForm.SetClientHeight(Value:Integer);
begin
{*
 00059054    push        ebx
 00059055    mov         ebx,eax
 00059057    test        byte ptr [ebx+44],8
>0005905B    je          00059076
 0005905D    mov         dword ptr [ebx+24C],edx
 00059063    mov         al,[00059080]
 00059068    or          al,byte ptr [ebx+84]
 0005906E    mov         byte ptr [ebx+84],al
 00059074    pop         ebx
 00059075    ret
 00059076    mov         eax,ebx
 00059078    call        TControl.SetClientHeight
 0005907D    pop         ebx
 0005907E    ret
*}
end;

//00059084
procedure TCustomForm.SetVisible(Value:Boolean);
begin
{*
 00059084    push        ebx
 00059085    push        esi
 00059086    mov         ebx,edx
 00059088    mov         esi,eax
 0005908A    test        byte ptr [esi+2C0],1
>00059091    je          000590AA
 00059093    test        bl,bl
>00059095    je          000590A0
 00059097    or          byte ptr [esi+2C0],2
>0005909E    jmp         000590C3
 000590A0    and         byte ptr [esi+2C0],0FD
 000590A7    pop         esi
 000590A8    pop         ebx
 000590A9    ret
 000590AA    test        bl,bl
>000590AC    je          000590BA
 000590AE    cmp         bl,byte ptr [esi+47]
>000590B1    je          000590BA
 000590B3    mov         eax,esi
 000590B5    call        TCustomForm.SetWindowToMonitor
 000590BA    mov         edx,ebx
 000590BC    mov         eax,esi
 000590BE    call        TControl.SetVisible
 000590C3    pop         esi
 000590C4    pop         ebx
 000590C5    ret
*}
end;

//000590C8
procedure TCustomForm.VisibleChanging;
begin
{*
 000590C8    push        ebp
 000590C9    mov         ebp,esp
 000590CB    push        0
 000590CD    xor         edx,edx
 000590CF    push        ebp
 000590D0    push        59121
 000590D5    push        dword ptr fs:[edx]
 000590D8    mov         dword ptr fs:[edx],esp
 000590DB    cmp         byte ptr [eax+20F],1
>000590E2    jne         0005910B
 000590E4    cmp         byte ptr [eax+47],0
>000590E8    je          0005910B
 000590EA    lea         edx,[ebp-4]
 000590ED    mov         eax,[000B56B0];^SMDIChildNotVisible:TResStringRec
 000590F2    call        LoadResString
 000590F7    mov         ecx,dword ptr [ebp-4]
 000590FA    mov         dl,1
 000590FC    mov         eax,[0001EE64];EInvalidOperation
 00059101    call        Exception.Create
 00059106    call        @RaiseExcept
 0005910B    xor         eax,eax
 0005910D    pop         edx
 0005910E    pop         ecx
 0005910F    pop         ecx
 00059110    mov         dword ptr fs:[eax],edx
 00059113    push        59128
 00059118    lea         eax,[ebp-4]
 0005911B    call        @LStrClr
 00059120    ret
>00059121    jmp         @HandleFinally
>00059126    jmp         00059118
 00059128    pop         ecx
 00059129    pop         ebp
 0005912A    ret
*}
end;

//0005912C
{*function sub_0005912C:?;
begin
 0005912C    xor         eax,eax
 0005912E    ret
end;*}

//00059130
procedure TCustomForm.SetParent(AParent:TWinControl);
begin
{*
 00059130    push        ebx
 00059131    push        esi
 00059132    mov         esi,edx
 00059134    mov         ebx,eax
 00059136    mov         eax,dword ptr [ebx+24]
 00059139    cmp         esi,eax
>0005913B    je          00059162
 0005913D    cmp         ebx,esi
>0005913F    je          00059162
 00059141    test        eax,eax
>00059143    jne         0005914C
 00059145    mov         eax,ebx
 00059147    call        TWinControl.DestroyHandle
 0005914C    mov         edx,esi
 0005914E    mov         eax,ebx
 00059150    call        TControl.SetParent
 00059155    cmp         dword ptr [ebx+24],0
>00059159    jne         00059162
 0005915B    mov         eax,ebx
 0005915D    call        TWinControl.UpdateControlState
 00059162    pop         esi
 00059163    pop         ebx
 00059164    ret
*}
end;

//00059168
procedure TCustomForm.ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);
begin
{*
 00059168    push        ebp
 00059169    mov         ebp,esp
 0005916B    push        ebx
 0005916C    push        esi
 0005916D    push        edi
 0005916E    mov         edi,ecx
 00059170    mov         esi,edx
 00059172    mov         ebx,eax
 00059174    mov         eax,dword ptr [ebp+8]
 00059177    push        eax
 00059178    mov         ecx,edi
 0005917A    mov         edx,esi
 0005917C    mov         eax,ebx
 0005917E    call        TComponent.ValidateRename
 00059183    cmp         dword ptr [ebx+230],0
>0005918A    je          0005919F
 0005918C    mov         eax,dword ptr [ebp+8]
 0005918F    push        eax
 00059190    mov         ecx,edi
 00059192    mov         edx,esi
 00059194    mov         eax,dword ptr [ebx+230]
 0005919A    mov         ebx,dword ptr [eax]
 0005919C    call        dword ptr [ebx+2C]
 0005919F    pop         edi
 000591A0    pop         esi
 000591A1    pop         ebx
 000591A2    pop         ebp
 000591A3    ret         4
*}
end;

//000591A8
function GetMenuFont:HFONT;
begin
{*
 000591A8    push        ebp
 000591A9    mov         ebp,esp
 000591AB    add         esp,0FFFFFEAC
 000591B1    mov         dword ptr [ebp-154],154
 000591BB    push        0
 000591BD    lea         eax,[ebp-154]
 000591C3    push        eax
 000591C4    push        0
 000591C6    push        29
 000591C8    call        user32.SystemParametersInfoA
 000591CD    test        eax,eax
>000591CF    je          000591DF
 000591D1    lea         eax,[ebp-0B4]
 000591D7    push        eax
 000591D8    call        gdi32.CreateFontIndirectA
>000591DD    jmp         000591E6
 000591DF    push        0D
 000591E1    call        gdi32.GetStockObject
 000591E6    mov         esp,ebp
 000591E8    pop         ebp
 000591E9    ret
*}
end;

//000591EC
procedure TCustomForm.WndProc(var Message:TMessage);
begin
{*
 000591EC    push        ebp
 000591ED    mov         ebp,esp
 000591EF    add         esp,0FFFFFFEC
 000591F2    push        ebx
 000591F3    push        esi
 000591F4    push        edi
 000591F5    mov         esi,edx
 000591F7    mov         dword ptr [ebp-4],eax
 000591FA    mov         eax,dword ptr [esi]
 000591FC    cmp         eax,46
>000591FF    jg          0005922D
>00059201    je          00059462
 00059207    add         eax,0FFFFFFFA
 0005920A    sub         eax,3
>0005920D    jb          000593A6
 00059213    sub         eax,3
>00059216    je          0005924E
 00059218    sub         eax,1F
>0005921B    je          000594D3
 00059221    dec         eax
>00059222    je          00059621
>00059228    jmp         0005974E
 0005922D    add         eax,0FFFFFF7B
 00059232    sub         eax,2
>00059235    jb          0005924E
 00059237    sub         eax,0AF93
>0005923C    je          00059441
 00059242    dec         eax
>00059243    je          00059420
>00059249    jmp         0005974E
 0005924E    mov         eax,dword ptr [ebp-4]
 00059251    call        TWinControl.HandleAllocated
 00059256    test        al,al
>00059258    je          0005974E
 0005925E    mov         eax,dword ptr [ebp-4]
 00059261    cmp         byte ptr [eax+209],3;TCustomForm.FBorderStyle:TFormBorderStyle
>00059268    jne         0005974E
 0005926E    mov         eax,dword ptr [ebp-4]
 00059271    cmp         byte ptr [eax+12C],0;TCustomForm.FCtl3D:Boolean
>00059278    je          0005974E
 0005927E    cmp         dword ptr ds:[0B49A0],0;gvar_000B49A0
>00059285    je          0005974E
 0005928B    cmp         dword ptr [esi],0C
>0005928E    jne         00059384
 00059294    mov         eax,dword ptr [ebp-4]
 00059297    mov         eax,dword ptr [eax+3C];TCustomForm.Height:Integer
 0005929A    push        eax
 0005929B    mov         eax,dword ptr [ebp-4]
 0005929E    mov         eax,dword ptr [eax+38];TCustomForm.Width:Integer
 000592A1    push        eax
 000592A2    push        0
 000592A4    push        0
 000592A6    call        gdi32.CreateRectRgn
 000592AB    mov         ebx,eax
 000592AD    push        ebx
 000592AE    mov         eax,dword ptr [ebp-4]
 000592B1    call        TWinControl.GetHandle
 000592B6    push        eax
 000592B7    call        user32.GetWindowRgn
 000592BC    push        0
 000592BE    push        0
 000592C0    push        0
 000592C2    push        0
 000592C4    push        0
 000592C6    call        gdi32.CreateRectRgn
 000592CB    push        eax
 000592CC    mov         eax,dword ptr [ebp-4]
 000592CF    call        TWinControl.GetHandle
 000592D4    push        eax
 000592D5    call        user32.SetWindowRgn
 000592DA    mov         edx,esi
 000592DC    mov         eax,dword ptr [ebp-4]
 000592DF    call        TWinControl.WndProc
 000592E4    push        0
 000592E6    push        ebx
 000592E7    mov         eax,dword ptr [ebp-4]
 000592EA    call        TWinControl.GetHandle
 000592EF    push        eax
 000592F0    call        user32.SetWindowRgn
 000592F5    push        7
 000592F7    mov         eax,[000B582C];^gvar_000B66A0
 000592FC    mov         eax,dword ptr [eax]
 000592FE    call        eax
 00059300    mov         ebx,eax
 00059302    push        8
 00059304    mov         eax,[000B582C];^gvar_000B66A0
 00059309    mov         eax,dword ptr [eax]
 0005930B    call        eax
 0005930D    mov         esi,eax
 0005930F    push        4
 00059311    mov         eax,[000B582C];^gvar_000B66A0
 00059316    mov         eax,dword ptr [eax]
 00059318    call        eax
 0005931A    mov         edx,dword ptr [ebp-4]
 0005931D    mov         edx,dword ptr [edx+34];TCustomForm.Top:Integer
 00059320    add         edx,esi
 00059322    add         eax,edx
 00059324    dec         eax
 00059325    push        eax
 00059326    mov         eax,dword ptr [ebp-4]
 00059329    mov         edi,dword ptr [eax+30];TCustomForm.Left:Integer
 0005932C    mov         eax,edi
 0005932E    mov         edx,dword ptr [ebp-4]
 00059331    add         eax,dword ptr [edx+38];TCustomForm.Width:Integer
 00059334    mov         edx,ebx
 00059336    add         edx,edx
 00059338    sub         eax,edx
 0005933A    push        eax
 0005933B    mov         eax,dword ptr [ebp-4]
 0005933E    add         esi,dword ptr [eax+34];TCustomForm.Top:Integer
 00059341    inc         esi
 00059342    push        esi
 00059343    add         ebx,edi
 00059345    add         ebx,2
 00059348    push        ebx
 00059349    call        gdi32.CreateRectRgn
 0005934E    mov         ebx,eax
 00059350    push        0
 00059352    push        ebx
 00059353    push        85
 00059358    mov         eax,dword ptr [ebp-4]
 0005935B    call        TWinControl.GetHandle
 00059360    push        eax
 00059361    call        dword ptr ds:[0B49A0]
 00059367    push        0
 00059369    push        0
 0005936B    mov         eax,dword ptr [ebp-4]
 0005936E    call        TWinControl.GetHandle
 00059373    push        eax
 00059374    call        user32.SetWindowRgn
 00059379    push        ebx
 0005937A    call        gdi32.DeleteObject
>0005937F    jmp         00059758
 00059384    mov         eax,dword ptr [esi+8];TMessage.LParam:Longint
 00059387    push        eax
 00059388    mov         eax,dword ptr [esi+4];TMessage.WParam:Longint
 0005938B    push        eax
 0005938C    mov         eax,dword ptr [esi]
 0005938E    push        eax
 0005938F    mov         eax,dword ptr [ebp-4]
 00059392    call        TWinControl.GetHandle
 00059397    push        eax
 00059398    call        dword ptr ds:[0B49A0]
 0005939E    mov         dword ptr [esi+0C],eax;TMessage.ResultLo:Word
>000593A1    jmp         00059758
 000593A6    cmp         byte ptr ds:[0B49AC],0;gvar_000B49AC
>000593AD    je          00059758
 000593B3    cmp         dword ptr [esi],7
>000593B6    jne         0005974E
 000593BC    mov         eax,dword ptr [ebp-4]
 000593BF    test        byte ptr [eax+20],10;TCustomForm.FComponentState:TComponentState
>000593C3    jne         0005974E
 000593C9    xor         ebx,ebx
 000593CB    mov         eax,dword ptr [ebp-4]
 000593CE    cmp         byte ptr [eax+20F],2;TCustomForm.FFormStyle:TFormStyle
>000593D5    jne         000593F4
 000593D7    mov         eax,dword ptr [ebp-4]
 000593DA    call        TCustomForm.GetActiveMDIChild
 000593DF    test        eax,eax
>000593E1    je          0005940D
 000593E3    mov         eax,dword ptr [ebp-4]
 000593E6    call        TCustomForm.GetActiveMDIChild
 000593EB    call        TWinControl.GetHandle
 000593F0    mov         ebx,eax
>000593F2    jmp         0005940D
 000593F4    mov         eax,dword ptr [ebp-4]
 000593F7    mov         eax,dword ptr [eax+200];TCustomForm.FActiveControl:TWinControl
 000593FD    test        eax,eax
>000593FF    je          0005940D
 00059401    cmp         eax,dword ptr [ebp-4]
>00059404    je          0005940D
 00059406    call        TWinControl.GetHandle
 0005940B    mov         ebx,eax
 0005940D    test        ebx,ebx
>0005940F    je          0005974E
 00059415    push        ebx
 00059416    call        user32.SetFocus
>0005941B    jmp         00059758
 00059420    mov         eax,dword ptr [ebp-4]
 00059423    cmp         dword ptr [eax+8C],0;TCustomForm.FHostDockSite:TWinControl
>0005942A    je          0005974E
 00059430    mov         eax,dword ptr [ebp-4]
 00059433    mov         bx,0FFB6
 00059437    call        @CallDynaInst;TCustomForm.sub_0005AF14
>0005943C    jmp         0005974E
 00059441    mov         eax,dword ptr [ebp-4]
 00059444    cmp         dword ptr [eax+8C],0;TCustomForm.FHostDockSite:TWinControl
>0005944B    je          0005974E
 00059451    mov         eax,dword ptr [ebp-4]
 00059454    mov         bx,0FFB8
 00059458    call        @CallDynaInst;TCustomForm.sub_0005AEE4
>0005945D    jmp         0005974E
 00059462    mov         eax,dword ptr [ebp-4]
 00059465    mov         al,byte ptr [eax+20];TCustomForm.FComponentState:TComponentState
 00059468    and         al,byte ptr ds:[59760];0x11 gvar_00059760
 0005946E    mov         dl,byte ptr ds:[59764];0x1 gvar_00059764
 00059474    cmp         dl,al
>00059476    jne         0005974E
 0005947C    mov         eax,dword ptr [ebp-4]
 0005947F    mov         al,byte ptr [eax+210];TCustomForm.FPosition:TPosition
 00059485    dec         eax
 00059486    sub         al,2
>00059488    jae         0005949D
 0005948A    mov         eax,dword ptr [ebp-4]
 0005948D    cmp         byte ptr [eax+20B],2;TCustomForm.FWindowState:TWindowState
>00059494    je          0005949D
 00059496    mov         eax,dword ptr [esi+8];TMessage.LParam:Longint
 00059499    or          dword ptr [eax+18],2
 0005949D    mov         eax,dword ptr [ebp-4]
 000594A0    mov         al,byte ptr [eax+210];TCustomForm.FPosition:TPosition
 000594A6    sub         al,1
>000594A8    je          000594B2
 000594AA    sub         al,2
>000594AC    jne         0005974E
 000594B2    mov         eax,dword ptr [ebp-4]
 000594B5    mov         al,byte ptr [eax+209];TCustomForm.FBorderStyle:TFormBorderStyle
 000594BB    sub         al,2
>000594BD    je          000594C7
 000594BF    sub         al,3
>000594C1    jne         0005974E
 000594C7    mov         eax,dword ptr [esi+8];TMessage.LParam:Longint
 000594CA    or          dword ptr [eax+18],1
>000594CE    jmp         0005974E
 000594D3    mov         eax,dword ptr [esi+8];TMessage.LParam:Longint
 000594D6    mov         dword ptr [ebp-14],eax
 000594D9    mov         eax,dword ptr [ebp-14]
 000594DC    cmp         dword ptr [eax],1
>000594DF    jne         0005974E
 000594E5    mov         eax,dword ptr [ebp-4]
 000594E8    cmp         dword ptr [eax+228],0;TCustomForm.FMenu:TMainMenu
>000594EF    je          0005974E
 000594F5    mov         eax,dword ptr [ebp-14]
 000594F8    mov         edx,dword ptr [eax+8]
 000594FB    mov         eax,dword ptr [ebp-4]
 000594FE    mov         eax,dword ptr [eax+228];TCustomForm.FMenu:TMainMenu
 00059504    xor         ecx,ecx
 00059506    call        TMenu.FindItem
 0005950B    mov         edi,eax
 0005950D    test        edi,edi
>0005950F    je          0005974E
 00059515    mov         dl,1
 00059517    mov         eax,[0003E18C];TControlCanvas
 0005951C    call        TCanvas.Create;TControlCanvas.Create
 00059521    mov         dword ptr [ebp-0C],eax
 00059524    xor         eax,eax
 00059526    push        ebp
 00059527    push        5961A
 0005952C    push        dword ptr fs:[eax]
 0005952F    mov         dword ptr fs:[eax],esp
 00059532    mov         eax,dword ptr [ebp-14]
 00059535    mov         eax,dword ptr [eax+18]
 00059538    push        eax
 00059539    call        gdi32.SaveDC
 0005953E    mov         dword ptr [ebp-8],eax
 00059541    xor         eax,eax
 00059543    push        ebp
 00059544    push        595FD
 00059549    push        dword ptr fs:[eax]
 0005954C    mov         dword ptr fs:[eax],esp
 0005954F    mov         eax,dword ptr [ebp-14]
 00059552    mov         edx,dword ptr [eax+18]
 00059555    mov         eax,dword ptr [ebp-0C]
 00059558    call        TCanvas.SetHandle
 0005955D    call        GetMenuFont
 00059562    mov         edx,eax
 00059564    mov         eax,dword ptr [ebp-0C]
 00059567    mov         eax,dword ptr [eax+0C];TControlCanvas.Font:TFont
 0005956A    call        TFont.SetHandle
 0005956F    mov         eax,dword ptr [ebp-14]
 00059572    test        byte ptr [eax+10],1
>00059576    je          0005959A
 00059578    mov         eax,dword ptr [ebp-0C]
 0005957B    mov         eax,dword ptr [eax+14];TControlCanvas.Brush:TBrush
 0005957E    mov         edx,8000000D
 00059583    call        TBrush.SetColor
 00059588    mov         eax,dword ptr [ebp-0C]
 0005958B    mov         eax,dword ptr [eax+0C];TControlCanvas.Font:TFont
 0005958E    mov         edx,8000000E
 00059593    call        TFont.SetColor
>00059598    jmp         000595BA
 0005959A    mov         eax,dword ptr [ebp-0C]
 0005959D    mov         eax,dword ptr [eax+14];TControlCanvas.Brush:TBrush
 000595A0    mov         edx,80000004
 000595A5    call        TBrush.SetColor
 000595AA    mov         eax,dword ptr [ebp-0C]
 000595AD    mov         eax,dword ptr [eax+0C];TControlCanvas.Font:TFont
 000595B0    mov         edx,80000007
 000595B5    call        TFont.SetColor
 000595BA    mov         eax,dword ptr [ebp-14]
 000595BD    test        byte ptr [eax+10],1
 000595C1    setne       al
 000595C4    push        eax
 000595C5    mov         eax,dword ptr [ebp-14]
 000595C8    lea         ecx,[eax+1C]
 000595CB    mov         edx,dword ptr [ebp-0C]
 000595CE    mov         eax,edi
 000595D0    mov         ebx,dword ptr [eax]
 000595D2    call        dword ptr [ebx+30];TMenuItem.DrawItem
 000595D5    xor         eax,eax
 000595D7    pop         edx
 000595D8    pop         ecx
 000595D9    pop         ecx
 000595DA    mov         dword ptr fs:[eax],edx
 000595DD    push        59604
 000595E2    xor         edx,edx
 000595E4    mov         eax,dword ptr [ebp-0C]
 000595E7    call        TCanvas.SetHandle
 000595EC    mov         eax,dword ptr [ebp-8]
 000595EF    push        eax
 000595F0    mov         eax,dword ptr [ebp-14]
 000595F3    mov         eax,dword ptr [eax+18]
 000595F6    push        eax
 000595F7    call        gdi32.RestoreDC
 000595FC    ret
>000595FD    jmp         @HandleFinally
>00059602    jmp         000595E2
 00059604    xor         eax,eax
 00059606    pop         edx
 00059607    pop         ecx
 00059608    pop         ecx
 00059609    mov         dword ptr fs:[eax],edx
 0005960C    push        59758
 00059611    mov         eax,dword ptr [ebp-0C]
 00059614    call        TObject.Free
 00059619    ret
>0005961A    jmp         @HandleFinally
>0005961F    jmp         00059611
 00059621    mov         ebx,dword ptr [esi+8];TMessage.LParam:Longint
 00059624    cmp         dword ptr [ebx],1
>00059627    jne         0005974E
 0005962D    mov         eax,dword ptr [ebp-4]
 00059630    cmp         dword ptr [eax+228],0;TCustomForm.FMenu:TMainMenu
>00059637    je          0005974E
 0005963D    mov         edx,dword ptr [ebx+8]
 00059640    mov         eax,dword ptr [ebp-4]
 00059643    mov         eax,dword ptr [eax+228];TCustomForm.FMenu:TMainMenu
 00059649    xor         ecx,ecx
 0005964B    call        TMenu.FindItem
 00059650    mov         edi,eax
 00059652    test        edi,edi
>00059654    je          0005974E
 0005965A    mov         eax,dword ptr [ebp-4]
 0005965D    call        TWinControl.GetHandle
 00059662    push        eax
 00059663    call        user32.GetWindowDC
 00059668    mov         dword ptr [ebp-10],eax
 0005966B    xor         eax,eax
 0005966D    push        ebp
 0005966E    push        59747
 00059673    push        dword ptr fs:[eax]
 00059676    mov         dword ptr fs:[eax],esp
 00059679    mov         dl,1
 0005967B    mov         eax,[0003E18C];TControlCanvas
 00059680    call        TCanvas.Create;TControlCanvas.Create
 00059685    mov         dword ptr [ebp-0C],eax
 00059688    xor         eax,eax
 0005968A    push        ebp
 0005968B    push        59720
 00059690    push        dword ptr fs:[eax]
 00059693    mov         dword ptr fs:[eax],esp
 00059696    mov         eax,dword ptr [ebp-10]
 00059699    push        eax
 0005969A    call        gdi32.SaveDC
 0005969F    mov         dword ptr [ebp-8],eax
 000596A2    xor         eax,eax
 000596A4    push        ebp
 000596A5    push        59703
 000596AA    push        dword ptr fs:[eax]
 000596AD    mov         dword ptr fs:[eax],esp
 000596B0    mov         edx,dword ptr [ebp-10]
 000596B3    mov         eax,dword ptr [ebp-0C]
 000596B6    call        TCanvas.SetHandle
 000596BB    call        GetMenuFont
 000596C0    mov         edx,eax
 000596C2    mov         eax,dword ptr [ebp-0C]
 000596C5    mov         eax,dword ptr [eax+0C];TControlCanvas.Font:TFont
 000596C8    call        TFont.SetHandle
 000596CD    lea         eax,[ebx+10]
 000596D0    push        eax
 000596D1    lea         ecx,[ebx+0C]
 000596D4    mov         edx,dword ptr [ebp-0C]
 000596D7    mov         eax,edi
 000596D9    call        TMenuItem.MeasureItem
 000596DE    xor         eax,eax
 000596E0    pop         edx
 000596E1    pop         ecx
 000596E2    pop         ecx
 000596E3    mov         dword ptr fs:[eax],edx
 000596E6    push        5970A
 000596EB    xor         edx,edx
 000596ED    mov         eax,dword ptr [ebp-0C]
 000596F0    call        TCanvas.SetHandle
 000596F5    mov         eax,dword ptr [ebp-8]
 000596F8    push        eax
 000596F9    mov         eax,dword ptr [ebp-10]
 000596FC    push        eax
 000596FD    call        gdi32.RestoreDC
 00059702    ret
>00059703    jmp         @HandleFinally
>00059708    jmp         000596EB
 0005970A    xor         eax,eax
 0005970C    pop         edx
 0005970D    pop         ecx
 0005970E    pop         ecx
 0005970F    mov         dword ptr fs:[eax],edx
 00059712    push        59727
 00059717    mov         eax,dword ptr [ebp-0C]
 0005971A    call        TObject.Free
 0005971F    ret
>00059720    jmp         @HandleFinally
>00059725    jmp         00059717
 00059727    xor         eax,eax
 00059729    pop         edx
 0005972A    pop         ecx
 0005972B    pop         ecx
 0005972C    mov         dword ptr fs:[eax],edx
 0005972F    push        59758
 00059734    mov         eax,dword ptr [ebp-10]
 00059737    push        eax
 00059738    mov         eax,dword ptr [ebp-4]
 0005973B    call        TWinControl.GetHandle
 00059740    push        eax
 00059741    call        user32.ReleaseDC
 00059746    ret
>00059747    jmp         @HandleFinally
>0005974C    jmp         00059734
 0005974E    mov         edx,esi
 00059750    mov         eax,dword ptr [ebp-4]
 00059753    call        TWinControl.WndProc
 00059758    pop         edi
 00059759    pop         esi
 0005975A    pop         ebx
 0005975B    mov         esp,ebp
 0005975D    pop         ebp
 0005975E    ret
*}
end;

//00059768
procedure Default;
begin
{*
 00059768    push        ebp
 00059769    mov         ebp,esp
 0005976B    mov         eax,dword ptr [ebp+8]
 0005976E    mov         eax,dword ptr [eax-8]
 00059771    mov         eax,dword ptr [eax+8]
 00059774    push        eax
 00059775    mov         eax,dword ptr [ebp+8]
 00059778    mov         eax,dword ptr [eax-8]
 0005977B    mov         eax,dword ptr [eax+4]
 0005977E    push        eax
 0005977F    mov         eax,dword ptr [ebp+8]
 00059782    mov         eax,dword ptr [eax-8]
 00059785    mov         eax,dword ptr [eax]
 00059787    push        eax
 00059788    mov         eax,dword ptr [ebp+8]
 0005978B    mov         eax,dword ptr [eax-4]
 0005978E    mov         eax,dword ptr [eax+234]
 00059794    push        eax
 00059795    mov         eax,dword ptr [ebp+8]
 00059798    mov         eax,dword ptr [eax-4]
 0005979B    mov         eax,dword ptr [eax+254]
 000597A1    push        eax
 000597A2    call        user32.CallWindowProcA
 000597A7    mov         edx,dword ptr [ebp+8]
 000597AA    mov         edx,dword ptr [edx-8]
 000597AD    mov         dword ptr [edx+0C],eax
 000597B0    pop         ebp
 000597B1    ret
*}
end;

//000597B4
function MaximizedChildren:Boolean;
begin
{*
 000597B4    push        ebp
 000597B5    mov         ebp,esp
 000597B7    push        ebx
 000597B8    push        esi
 000597B9    mov         eax,dword ptr [ebp+8]
 000597BC    mov         eax,dword ptr [eax-4]
 000597BF    call        TCustomForm.GetMDIChildCount
 000597C4    mov         ebx,eax
 000597C6    dec         ebx
 000597C7    test        ebx,ebx
>000597C9    jl          000597EC
 000597CB    inc         ebx
 000597CC    xor         esi,esi
 000597CE    mov         eax,dword ptr [ebp+8]
 000597D1    mov         eax,dword ptr [eax-4]
 000597D4    mov         edx,esi
 000597D6    call        TCustomForm.GetMDIChildren
 000597DB    cmp         byte ptr [eax+20B],2
>000597E2    jne         000597E8
 000597E4    mov         al,1
>000597E6    jmp         000597EE
 000597E8    inc         esi
 000597E9    dec         ebx
>000597EA    jne         000597CE
 000597EC    xor         eax,eax
 000597EE    pop         esi
 000597EF    pop         ebx
 000597F0    pop         ebp
 000597F1    ret
*}
end;

//000597F4
procedure TCustomForm.ClientWndProc(var Message:TMessage);
begin
{*
 000597F4    push        ebp
 000597F5    mov         ebp,esp
 000597F7    add         esp,0FFFFFFE8
 000597FA    mov         dword ptr [ebp-8],edx
 000597FD    mov         dword ptr [ebp-4],eax
 00059800    mov         eax,dword ptr [ebp-8]
 00059803    mov         eax,dword ptr [eax]
 00059805    sub         eax,14
>00059808    je          00059838
 0005980A    sub         eax,2B
>0005980D    je          0005986E
 0005980F    sub         eax,45
>00059812    jne         000598AE
 00059818    push        ebp
 00059819    call        Default
 0005981E    pop         ecx
 0005981F    mov         eax,dword ptr [ebp-8]
 00059822    cmp         dword ptr [eax+0C],1
>00059826    jne         000598B5
 0005982C    mov         eax,dword ptr [ebp-8]
 0005982F    mov         dword ptr [eax+0C],0FFFFFFFF
>00059836    jmp         000598B5
 00059838    mov         eax,dword ptr [ebp-4]
 0005983B    mov         eax,dword ptr [eax+124]
 00059841    call        TBrush.GetHandle
 00059846    push        eax
 00059847    lea         edx,[ebp-18]
 0005984A    mov         eax,dword ptr [ebp-4]
 0005984D    mov         ecx,dword ptr [eax]
 0005984F    call        dword ptr [ecx+44]
 00059852    lea         eax,[ebp-18]
 00059855    push        eax
 00059856    mov         eax,dword ptr [ebp-8]
 00059859    mov         eax,dword ptr [eax+4]
 0005985C    push        eax
 0005985D    call        user32.FillRect
 00059862    mov         eax,dword ptr [ebp-8]
 00059865    mov         dword ptr [eax+0C],1
>0005986C    jmp         000598B5
 0005986E    push        ebp
 0005986F    call        Default
 00059874    pop         ecx
 00059875    mov         eax,dword ptr [ebp-4]
 00059878    cmp         byte ptr [eax+20F],2
>0005987F    jne         000598B5
 00059881    mov         eax,dword ptr [ebp-4]
 00059884    call        TCustomForm.GetMDIChildCount
 00059889    test        eax,eax
>0005988B    je          0005989C
 0005988D    push        ebp
 0005988E    call        MaximizedChildren
 00059893    pop         ecx
 00059894    test        al,al
>00059896    je          0005989C
 00059898    xor         edx,edx
>0005989A    jmp         0005989E
 0005989C    mov         dl,1
 0005989E    mov         eax,dword ptr [ebp-4]
 000598A1    mov         eax,dword ptr [eax+234]
 000598A7    call        ShowMDIClientEdge
>000598AC    jmp         000598B5
 000598AE    push        ebp
 000598AF    call        Default
 000598B4    pop         ecx
 000598B5    mov         esp,ebp
 000598B7    pop         ebp
 000598B8    ret
*}
end;

//000598BC
procedure TCustomForm.AlignControls(AControl:TControl; var Rect:TRect);
begin
{*
 000598BC    push        ebx
 000598BD    push        esi
 000598BE    push        edi
 000598BF    mov         ebx,ecx
 000598C1    mov         esi,eax
 000598C3    mov         ecx,ebx
 000598C5    mov         eax,esi
 000598C7    call        TScrollingWinControl.AlignControls
 000598CC    mov         eax,dword ptr [esi+234]
 000598D2    test        eax,eax
>000598D4    je          000598F3
 000598D6    push        14
 000598D8    mov         ecx,dword ptr [ebx+0C]
 000598DB    mov         edi,dword ptr [ebx+4]
 000598DE    sub         ecx,edi
 000598E0    push        ecx
 000598E1    mov         ecx,dword ptr [ebx+8]
 000598E4    mov         edx,dword ptr [ebx]
 000598E6    sub         ecx,edx
 000598E8    push        ecx
 000598E9    push        edi
 000598EA    push        edx
 000598EB    push        1
 000598ED    push        eax
 000598EE    call        user32.SetWindowPos
 000598F3    pop         edi
 000598F4    pop         esi
 000598F5    pop         ebx
 000598F6    ret
*}
end;

//000598F8
procedure TCustomForm.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 000598F8    push        ebx
 000598F9    push        esi
 000598FA    push        edi
 000598FB    push        ecx
 000598FC    mov         ebx,eax
 000598FE    mov         eax,ebx
 00059900    call        TScrollingWinControl.CMBiDiModeChanged
 00059905    mov         eax,ebx
 00059907    call        TWinControl.HandleAllocated
 0005990C    test        al,al
>0005990E    je          0005994D
 00059910    push        0EC
 00059912    mov         eax,ebx
 00059914    call        TWinControl.GetHandle
 00059919    push        eax
 0005991A    call        user32.GetWindowLongA
 0005991F    and         eax,0FFFFEFFF
 00059924    and         eax,0FFFFDFFF
 00059929    and         eax,0FFFFBFFF
 0005992E    mov         dword ptr [esp],eax
 00059931    mov         edx,esp
 00059933    mov         eax,ebx
 00059935    call        TWinControl.AddBiDiModeExStyle
 0005993A    mov         eax,dword ptr [esp]
 0005993D    push        eax
 0005993E    push        0EC
 00059940    mov         eax,ebx
 00059942    call        TWinControl.GetHandle
 00059947    push        eax
 00059948    call        user32.SetWindowLongA
 0005994D    mov         eax,ebx
 0005994F    call        TComponent.GetComponentCount
 00059954    mov         edi,eax
 00059956    dec         edi
 00059957    test        edi,edi
>00059959    jl          00059988
 0005995B    inc         edi
 0005995C    xor         esi,esi
 0005995E    mov         edx,esi
 00059960    mov         eax,ebx
 00059962    call        TComponent.GetComponent
 00059967    mov         edx,dword ptr ds:[50194];TMenu
 0005996D    call        @IsClass
 00059972    test        al,al
>00059974    je          00059984
 00059976    mov         edx,esi
 00059978    mov         eax,ebx
 0005997A    call        TComponent.GetComponent
 0005997F    call        TMenu.ParentBiDiModeChanged
 00059984    inc         esi
 00059985    dec         edi
>00059986    jne         0005995E
 00059988    pop         edx
 00059989    pop         edi
 0005998A    pop         esi
 0005998B    pop         ebx
 0005998C    ret
*}
end;

//00059990
procedure TCustomForm.CMParentBiDiModeChanged(var Message:TMessage);
begin
{*
 00059990    push        ebp
 00059991    mov         ebp,esp
 00059993    push        ecx
 00059994    mov         dword ptr [ebp-4],eax
 00059997    mov         eax,dword ptr [ebp-4]
 0005999A    cmp         byte ptr [eax+224],0
>000599A1    jne         00059A14
 000599A3    mov         eax,dword ptr [ebp-4]
 000599A6    mov         byte ptr [eax+224],1
 000599AD    xor         edx,edx
 000599AF    push        ebp
 000599B0    push        59A0D
 000599B5    push        dword ptr fs:[edx]
 000599B8    mov         dword ptr fs:[edx],esp
 000599BB    mov         eax,dword ptr [ebp-4]
 000599BE    cmp         byte ptr [eax+50],0
>000599C2    je          000599F5
 000599C4    mov         eax,dword ptr [ebp-4]
 000599C7    mov         eax,dword ptr [eax+24]
 000599CA    test        eax,eax
>000599CC    jne         000599E0
 000599CE    mov         eax,[000B67B0];Application:TApplication
 000599D3    mov         dl,byte ptr [eax+28]
 000599D6    mov         eax,dword ptr [ebp-4]
 000599D9    mov         ecx,dword ptr [eax]
 000599DB    call        dword ptr [ecx+6C]
>000599DE    jmp         000599EB
 000599E0    mov         dl,byte ptr [eax+4F]
 000599E3    mov         eax,dword ptr [ebp-4]
 000599E6    mov         ecx,dword ptr [eax]
 000599E8    call        dword ptr [ecx+6C]
 000599EB    mov         dl,1
 000599ED    mov         eax,dword ptr [ebp-4]
 000599F0    mov         ecx,dword ptr [eax]
 000599F2    call        dword ptr [ecx+68]
 000599F5    xor         eax,eax
 000599F7    pop         edx
 000599F8    pop         ecx
 000599F9    pop         ecx
 000599FA    mov         dword ptr fs:[eax],edx
 000599FD    push        59A14
 00059A02    mov         eax,dword ptr [ebp-4]
 00059A05    mov         byte ptr [eax+224],0
 00059A0C    ret
>00059A0D    jmp         @HandleFinally
>00059A12    jmp         00059A02
 00059A14    pop         ecx
 00059A15    pop         ebp
 00059A16    ret
*}
end;

//00059A18
procedure TCustomForm.SetBorderIcons(Value:TBorderIcons);
begin
{*
 00059A18    push        ebx
 00059A19    push        ecx
 00059A1A    mov         byte ptr [esp],dl
 00059A1D    mov         ebx,eax
 00059A1F    mov         al,byte ptr [esp]
 00059A22    cmp         al,byte ptr [ebx+208]
>00059A28    je          00059A40
 00059A2A    mov         al,byte ptr [esp]
 00059A2D    mov         byte ptr [ebx+208],al
 00059A33    test        byte ptr [ebx+20],10
>00059A37    jne         00059A40
 00059A39    mov         eax,ebx
 00059A3B    call        TWinControl.RecreateWnd
 00059A40    pop         edx
 00059A41    pop         ebx
 00059A42    ret
*}
end;

//00059A44
procedure TCustomForm.SetBorderStyle(Value:TFormBorderStyle);
begin
{*
 00059A44    push        esi
 00059A45    mov         esi,eax
 00059A47    cmp         dl,byte ptr [esi+209]
>00059A4D    je          00059A79
 00059A4F    mov         eax,edx
 00059A51    mov         byte ptr [esi+209],al
 00059A57    sub         al,2
>00059A59    je          00059A63
 00059A5B    sub         al,3
>00059A5D    je          00059A63
 00059A5F    xor         edx,edx
>00059A61    jmp         00059A65
 00059A63    mov         dl,1
 00059A65    mov         eax,esi
 00059A67    call        TScrollingWinControl.SetAutoScroll
 00059A6C    test        byte ptr [esi+20],10
>00059A70    jne         00059A79
 00059A72    mov         eax,esi
 00059A74    call        TWinControl.RecreateWnd
 00059A79    pop         esi
 00059A7A    ret
*}
end;

//00059A7C
procedure TCustomForm.Dock(NewDockSite:TWinControl; ARect:TRect);
begin
{*
 00059A7C    push        ebx
 00059A7D    push        esi
 00059A7E    push        edi
 00059A7F    add         esp,0FFFFFFF0
 00059A82    mov         esi,ecx
 00059A84    lea         edi,[esp]
 00059A87    mov         ecx,4
 00059A8C    rep movs    dword ptr [edi],dword ptr [esi]
 00059A8E    mov         ebx,eax
 00059A90    mov         edi,dword ptr [ebx+24]
 00059A93    mov         esi,dword ptr [ebx+8C]
 00059A99    mov         ecx,esp
 00059A9B    mov         eax,ebx
 00059A9D    call        TControl.Dock
 00059AA2    mov         eax,dword ptr [ebx+24]
 00059AA5    test        eax,eax
>00059AA7    je          00059ABC
 00059AA9    cmp         edi,eax
>00059AAB    jne         00059ABC
 00059AAD    cmp         esi,dword ptr [ebx+8C]
>00059AB3    je          00059ABC
 00059AB5    mov         eax,ebx
 00059AB7    call        TWinControl.RecreateWnd
 00059ABC    add         esp,10
 00059ABF    pop         edi
 00059AC0    pop         esi
 00059AC1    pop         ebx
 00059AC2    ret
*}
end;

//00059AC4
procedure TCustomForm.DoDock(NewDockSite:TWinControl; var ARect:TRect);
begin
{*
 00059AC4    push        ebx
 00059AC5    push        esi
 00059AC6    push        edi
 00059AC7    mov         edi,ecx
 00059AC9    mov         esi,edx
 00059ACB    mov         ebx,eax
 00059ACD    cmp         esi,dword ptr [ebx+8C]
>00059AD3    je          00059B09
 00059AD5    test        esi,esi
>00059AD7    je          00059AE4
 00059AD9    mov         eax,ebx
 00059ADB    mov         edx,dword ptr [eax]
 00059ADD    call        dword ptr [edx+54]
 00059AE0    test        al,al
>00059AE2    je          00059B09
 00059AE4    test        esi,esi
>00059AE6    jne         00059AF6
 00059AE8    mov         al,byte ptr [ebx+260]
 00059AEE    mov         byte ptr [ebx+209],al
>00059AF4    jmp         00059B09
 00059AF6    mov         al,byte ptr [ebx+209]
 00059AFC    mov         byte ptr [ebx+260],al
 00059B02    mov         byte ptr [ebx+209],0
 00059B09    mov         ecx,edi
 00059B0B    mov         edx,esi
 00059B0D    mov         eax,ebx
 00059B0F    call        TControl.DoDock
 00059B14    pop         edi
 00059B15    pop         esi
 00059B16    pop         ebx
 00059B17    ret
*}
end;

//00059B18
function TCustomForm.GetActiveMDIChild:TForm;
begin
{*
 00059B18    push        ebx
 00059B19    mov         ebx,eax
 00059B1B    xor         eax,eax
 00059B1D    cmp         byte ptr [ebx+20F],2
>00059B24    jne         00059B49
 00059B26    cmp         dword ptr [ebx+234],0
>00059B2D    je          00059B49
 00059B2F    push        0
 00059B31    push        0
 00059B33    push        229
 00059B38    mov         eax,dword ptr [ebx+234]
 00059B3E    push        eax
 00059B3F    call        user32.SendMessageA
 00059B44    call        FindControl
 00059B49    pop         ebx
 00059B4A    ret
*}
end;

//00059B4C
function TCustomForm.GetMDIChildCount:Integer;
begin
{*
 00059B4C    push        ebx
 00059B4D    push        esi
 00059B4E    push        edi
 00059B4F    xor         edi,edi
 00059B51    cmp         byte ptr [eax+20F],2
>00059B58    jne         00059B91
 00059B5A    cmp         dword ptr [eax+234],0
>00059B61    je          00059B91
 00059B63    mov         eax,[000B67B4];Screen:TScreen
 00059B68    call        TScreen.GetFormCount
 00059B6D    mov         ebx,eax
 00059B6F    dec         ebx
 00059B70    test        ebx,ebx
>00059B72    jl          00059B91
 00059B74    inc         ebx
 00059B75    xor         esi,esi
 00059B77    mov         edx,esi
 00059B79    mov         eax,[000B67B4];Screen:TScreen
 00059B7E    call        TScreen.GetForm
 00059B83    cmp         byte ptr [eax+20F],1
>00059B8A    jne         00059B8D
 00059B8C    inc         edi
 00059B8D    inc         esi
 00059B8E    dec         ebx
>00059B8F    jne         00059B77
 00059B91    mov         eax,edi
 00059B93    pop         edi
 00059B94    pop         esi
 00059B95    pop         ebx
 00059B96    ret
*}
end;

//00059B98
function TCustomForm.GetMDIChildren(I:Integer):TForm;
begin
{*
 00059B98    push        ebx
 00059B99    push        esi
 00059B9A    push        edi
 00059B9B    mov         edi,edx
 00059B9D    cmp         byte ptr [eax+20F],2
>00059BA4    jne         00059BE1
 00059BA6    cmp         dword ptr [eax+234],0
>00059BAD    je          00059BE1
 00059BAF    mov         eax,[000B67B4];Screen:TScreen
 00059BB4    call        TScreen.GetFormCount
 00059BB9    mov         ebx,eax
 00059BBB    dec         ebx
 00059BBC    test        ebx,ebx
>00059BBE    jl          00059BE1
 00059BC0    inc         ebx
 00059BC1    xor         esi,esi
 00059BC3    mov         edx,esi
 00059BC5    mov         eax,[000B67B4];Screen:TScreen
 00059BCA    call        TScreen.GetForm
 00059BCF    cmp         byte ptr [eax+20F],1
>00059BD6    jne         00059BDD
 00059BD8    dec         edi
 00059BD9    test        edi,edi
>00059BDB    jl          00059BE3
 00059BDD    inc         esi
 00059BDE    dec         ebx
>00059BDF    jne         00059BC3
 00059BE1    xor         eax,eax
 00059BE3    pop         edi
 00059BE4    pop         esi
 00059BE5    pop         ebx
 00059BE6    ret
*}
end;

//00059BE8
function TCustomForm.GetMonitor:TMonitor;
begin
{*
 00059BE8    push        ebx
 00059BE9    push        esi
 00059BEA    push        edi
 00059BEB    push        ebp
 00059BEC    mov         ebx,eax
 00059BEE    xor         ebp,ebp
 00059BF0    push        2
 00059BF2    mov         eax,ebx
 00059BF4    call        TWinControl.GetHandle
 00059BF9    push        eax
 00059BFA    mov         eax,[000B58D4];MonitorFromWindow:TMonitorFromWindow
 00059BFF    mov         eax,dword ptr [eax]
 00059C01    call        eax
 00059C03    mov         edi,eax
 00059C05    mov         eax,[000B67B4];Screen:TScreen
 00059C0A    call        TScreen.GetMonitorCount
 00059C0F    mov         esi,eax
 00059C11    dec         esi
 00059C12    test        esi,esi
>00059C14    jl          00059C3E
 00059C16    inc         esi
 00059C17    xor         ebx,ebx
 00059C19    mov         edx,ebx
 00059C1B    mov         eax,[000B67B4];Screen:TScreen
 00059C20    call        TScreen.GetMonitor
 00059C25    cmp         edi,dword ptr [eax+4]
>00059C28    jne         00059C3A
 00059C2A    mov         edx,ebx
 00059C2C    mov         eax,[000B67B4];Screen:TScreen
 00059C31    call        TScreen.GetMonitor
 00059C36    mov         ebp,eax
>00059C38    jmp         00059C3E
 00059C3A    inc         ebx
 00059C3B    dec         esi
>00059C3C    jne         00059C19
 00059C3E    mov         eax,ebp
 00059C40    pop         ebp
 00059C41    pop         edi
 00059C42    pop         esi
 00059C43    pop         ebx
 00059C44    ret
*}
end;

//00059C48
function TCustomForm.GetCanvas:TCanvas;
begin
{*
 00059C48    mov         eax,dword ptr [eax+218]
 00059C4E    ret
*}
end;

//00059C50
procedure TCustomForm.SetIcon(Value:TIcon);
begin
{*
 00059C50    mov         eax,dword ptr [eax+220]
 00059C56    mov         ecx,dword ptr [eax]
 00059C58    call        dword ptr [ecx+8]
 00059C5B    ret
*}
end;

//00059C5C
function TCustomForm.IsForm(Value:TWinControl):Boolean;
begin
{*
 00059C5C    mov         al,byte ptr [eax+4E]
 00059C5F    xor         al,1
 00059C61    ret
*}
end;

//00059C64
function TCustomForm.IsIconStored(Value:TIcon):Boolean;
begin
{*
 00059C64    push        ebx
 00059C65    mov         ebx,eax
 00059C67    mov         eax,ebx
 00059C69    call        TCustomForm.IsForm
 00059C6E    test        al,al
>00059C70    je          00059C81
 00059C72    mov         eax,dword ptr [ebx+220]
 00059C78    call        TIcon.GetHandle
 00059C7D    test        eax,eax
>00059C7F    jne         00059C85
 00059C81    xor         eax,eax
 00059C83    pop         ebx
 00059C84    ret
 00059C85    mov         al,1
 00059C87    pop         ebx
 00059C88    ret
*}
end;

//00059C8C
procedure TCustomForm.SetFormStyle(Value:TFormStyle);
begin
{*
 00059C8C    push        ebx
 00059C8D    push        esi
 00059C8E    mov         ebx,edx
 00059C90    mov         esi,eax
 00059C92    cmp         bl,byte ptr [esi+20F]
>00059C98    je          00059D07
 00059C9A    cmp         bl,1
>00059C9D    jne         00059CB1
 00059C9F    cmp         byte ptr [esi+210],0
>00059CA6    jne         00059CB1
 00059CA8    mov         dl,1
 00059CAA    mov         eax,esi
 00059CAC    call        TCustomForm.SetPosition
 00059CB1    test        byte ptr [esi+20],10
>00059CB5    jne         00059CBE
 00059CB7    mov         eax,esi
 00059CB9    call        TWinControl.DestroyHandle
 00059CBE    mov         al,byte ptr [esi+20F]
 00059CC4    mov         byte ptr [esi+20F],bl
 00059CCA    cmp         bl,2
>00059CCD    je          00059CD3
 00059CCF    cmp         al,2
>00059CD1    jne         00059CEC
 00059CD3    cmp         byte ptr [esi+12C],0
>00059CDA    jne         00059CEC
 00059CDC    mov         eax,esi
 00059CDE    call        TCustomForm.NormalColor
 00059CE3    mov         edx,eax
 00059CE5    mov         eax,esi
 00059CE7    call        TControl.SetColor
 00059CEC    test        byte ptr [esi+20],10
>00059CF0    jne         00059CF9
 00059CF2    mov         eax,esi
 00059CF4    call        TWinControl.UpdateControlState
 00059CF9    cmp         bl,1
>00059CFC    jne         00059D07
 00059CFE    mov         dl,1
 00059D00    mov         eax,esi
 00059D02    call        TCustomForm.SetVisible
 00059D07    pop         esi
 00059D08    pop         ebx
 00059D09    ret
*}
end;

//00059D0C
procedure TCustomForm.RefreshMDIMenu;
begin
{*
 00059D0C    push        ebx
 00059D0D    push        esi
 00059D0E    push        edi
 00059D0F    push        ebp
 00059D10    mov         ebp,eax
 00059D12    cmp         byte ptr [ebp+20F],2
>00059D19    jne         00059D80
 00059D1B    cmp         dword ptr [ebp+234],0
>00059D22    je          00059D80
 00059D24    xor         esi,esi
 00059D26    mov         eax,dword ptr [ebp+228]
 00059D2C    test        eax,eax
>00059D2E    je          00059D37
 00059D30    mov         edx,dword ptr [eax]
 00059D32    call        dword ptr [edx+34]
 00059D35    mov         esi,eax
 00059D37    xor         edi,edi
 00059D39    mov         eax,dword ptr [ebp+238]
 00059D3F    test        eax,eax
>00059D41    je          00059D4A
 00059D43    call        TMenuItem.GetHandle
 00059D48    mov         edi,eax
 00059D4A    mov         eax,ebp
 00059D4C    call        TWinControl.GetHandle
 00059D51    push        eax
 00059D52    call        user32.GetMenu
 00059D57    cmp         esi,eax
 00059D59    setne       bl
 00059D5C    push        edi
 00059D5D    push        esi
 00059D5E    push        230
 00059D63    mov         eax,dword ptr [ebp+234]
 00059D69    push        eax
 00059D6A    call        user32.SendMessageA
 00059D6F    test        bl,bl
>00059D71    je          00059D80
 00059D73    mov         eax,ebp
 00059D75    call        TWinControl.GetHandle
 00059D7A    push        eax
 00059D7B    call        user32.DrawMenuBar
 00059D80    pop         ebp
 00059D81    pop         edi
 00059D82    pop         esi
 00059D83    pop         ebx
 00059D84    ret
*}
end;

//00059D88
procedure TCustomForm.SetObjectMenuItem(Value:TMenuItem);
begin
{*
 00059D88    mov         dword ptr [eax+240],edx
 00059D8E    test        edx,edx
>00059D90    je          00059D9B
 00059D92    mov         eax,edx
 00059D94    xor         edx,edx
 00059D96    call        TMenuItem.SetEnabled
 00059D9B    ret
*}
end;

//00059D9C
procedure TCustomForm.SetWindowMenu(Value:TMenuItem);
begin
{*
 00059D9C    push        ebx
 00059D9D    mov         ebx,eax
 00059D9F    cmp         edx,dword ptr [ebx+238]
>00059DA5    je          00059DC1
 00059DA7    mov         dword ptr [ebx+238],edx
 00059DAD    test        edx,edx
>00059DAF    je          00059DBA
 00059DB1    mov         eax,edx
 00059DB3    mov         edx,ebx
 00059DB5    call        TComponent.FreeNotification
 00059DBA    mov         eax,ebx
 00059DBC    call        TCustomForm.RefreshMDIMenu
 00059DC1    pop         ebx
 00059DC2    ret
*}
end;

//00059DC4
procedure TCustomForm.SetMenu(Value:TMainMenu);
begin
{*
 00059DC4    push        ebp
 00059DC5    mov         ebp,esp
 00059DC7    add         esp,0FFFFFFF0
 00059DCA    push        ebx
 00059DCB    push        esi
 00059DCC    push        edi
 00059DCD    xor         ecx,ecx
 00059DCF    mov         dword ptr [ebp-10],ecx
 00059DD2    mov         esi,edx
 00059DD4    mov         ebx,eax
 00059DD6    xor         eax,eax
 00059DD8    push        ebp
 00059DD9    push        59F78
 00059DDE    push        dword ptr fs:[eax]
 00059DE1    mov         dword ptr fs:[eax],esp
 00059DE4    test        esi,esi
>00059DE6    je          00059E58
 00059DE8    mov         eax,[000B67B4];Screen:TScreen
 00059DED    call        TScreen.GetFormCount
 00059DF2    dec         eax
 00059DF3    test        eax,eax
>00059DF5    jl          00059E58
 00059DF7    inc         eax
 00059DF8    mov         dword ptr [ebp-4],eax
 00059DFB    xor         edi,edi
 00059DFD    mov         edx,edi
 00059DFF    mov         eax,[000B67B4];Screen:TScreen
 00059E04    call        TScreen.GetForm
 00059E09    cmp         esi,dword ptr [eax+228]
>00059E0F    jne         00059E52
 00059E11    mov         edx,edi
 00059E13    mov         eax,[000B67B4];Screen:TScreen
 00059E18    call        TScreen.GetForm
 00059E1D    cmp         ebx,eax
>00059E1F    je          00059E52
 00059E21    mov         eax,dword ptr [esi+8]
 00059E24    mov         dword ptr [ebp-0C],eax
 00059E27    mov         byte ptr [ebp-8],0B
 00059E2B    lea         eax,[ebp-0C]
 00059E2E    push        eax
 00059E2F    push        0
 00059E31    lea         edx,[ebp-10]
 00059E34    mov         eax,[000B5798];^SDuplicateMenus:TResStringRec
 00059E39    call        LoadResString
 00059E3E    mov         ecx,dword ptr [ebp-10]
 00059E41    mov         dl,1
 00059E43    mov         eax,[0001EE64];EInvalidOperation
 00059E48    call        Exception.CreateFmt
 00059E4D    call        @RaiseExcept
 00059E52    inc         edi
 00059E53    dec         dword ptr [ebp-4]
>00059E56    jne         00059DFD
 00059E58    mov         eax,dword ptr [ebx+228]
 00059E5E    test        eax,eax
>00059E60    je          00059E69
 00059E62    xor         edx,edx
 00059E64    call        TMenu.SetWindowHandle
 00059E69    mov         dword ptr [ebx+228],esi
 00059E6F    test        esi,esi
>00059E71    je          00059E7C
 00059E73    mov         edx,ebx
 00059E75    mov         eax,esi
 00059E77    call        TComponent.FreeNotification
 00059E7C    test        esi,esi
>00059E7E    je          00059F2F
 00059E84    test        byte ptr [ebx+20],10
>00059E88    jne         00059E97
 00059E8A    cmp         byte ptr [ebx+209],3
>00059E91    je          00059F2F
 00059E97    mov         eax,dword ptr [ebx+228]
 00059E9D    cmp         byte ptr [eax+4C],0
>00059EA1    jne         00059EAC
 00059EA3    cmp         byte ptr [ebx+20F],1
>00059EAA    jne         00059EB2
 00059EAC    test        byte ptr [ebx+20],10
>00059EB0    je          00059F0A
 00059EB2    mov         eax,ebx
 00059EB4    call        TWinControl.HandleAllocated
 00059EB9    test        al,al
>00059EBB    je          00059F49
 00059EC1    mov         eax,dword ptr [ebx+228]
 00059EC7    mov         edx,dword ptr [eax]
 00059EC9    call        dword ptr [edx+34]
 00059ECC    mov         edi,eax
 00059ECE    mov         eax,ebx
 00059ED0    call        TWinControl.GetHandle
 00059ED5    push        eax
 00059ED6    call        user32.GetMenu
 00059EDB    cmp         edi,eax
>00059EDD    je          00059EF8
 00059EDF    mov         eax,dword ptr [ebx+228]
 00059EE5    mov         edx,dword ptr [eax]
 00059EE7    call        dword ptr [edx+34]
 00059EEA    push        eax
 00059EEB    mov         eax,ebx
 00059EED    call        TWinControl.GetHandle
 00059EF2    push        eax
 00059EF3    call        user32.SetMenu
 00059EF8    mov         eax,ebx
 00059EFA    call        TWinControl.GetHandle
 00059EFF    mov         edx,eax
 00059F01    mov         eax,esi
 00059F03    call        TMenu.SetWindowHandle
>00059F08    jmp         00059F49
 00059F0A    cmp         byte ptr [ebx+20F],1
>00059F11    je          00059F49
 00059F13    mov         eax,ebx
 00059F15    call        TWinControl.HandleAllocated
 00059F1A    test        al,al
>00059F1C    je          00059F49
 00059F1E    push        0
 00059F20    mov         eax,ebx
 00059F22    call        TWinControl.GetHandle
 00059F27    push        eax
 00059F28    call        user32.SetMenu
>00059F2D    jmp         00059F49
 00059F2F    mov         eax,ebx
 00059F31    call        TWinControl.HandleAllocated
 00059F36    test        al,al
>00059F38    je          00059F49
 00059F3A    push        0
 00059F3C    mov         eax,ebx
 00059F3E    call        TWinControl.GetHandle
 00059F43    push        eax
 00059F44    call        user32.SetMenu
 00059F49    cmp         byte ptr [ebx+20E],0
>00059F50    je          00059F5B
 00059F52    mov         dl,1
 00059F54    mov         eax,ebx
 00059F56    call        TCustomForm.MergeMenu
 00059F5B    mov         eax,ebx
 00059F5D    call        TCustomForm.RefreshMDIMenu
 00059F62    xor         eax,eax
 00059F64    pop         edx
 00059F65    pop         ecx
 00059F66    pop         ecx
 00059F67    mov         dword ptr fs:[eax],edx
 00059F6A    push        59F7F
 00059F6F    lea         eax,[ebp-10]
 00059F72    call        @LStrClr
 00059F77    ret
>00059F78    jmp         @HandleFinally
>00059F7D    jmp         00059F6F
 00059F7F    pop         edi
 00059F80    pop         esi
 00059F81    pop         ebx
 00059F82    mov         esp,ebp
 00059F84    pop         ebp
 00059F85    ret
*}
end;

//00059F88
function TCustomForm.GetPixelsPerInch:Integer;
begin
{*
 00059F88    mov         eax,dword ptr [eax+23C]
 00059F8E    test        eax,eax
>00059F90    jne         00059F9A
 00059F92    mov         eax,[000B67B4];Screen:TScreen
 00059F97    mov         eax,dword ptr [eax+34]
 00059F9A    ret
*}
end;

//00059F9C
procedure TCustomForm.SetPixelsPerInch(Value:Integer);
begin
{*
 00059F9C    push        ebx
 00059F9D    push        esi
 00059F9E    mov         esi,edx
 00059FA0    mov         ebx,eax
 00059FA2    mov         eax,ebx
 00059FA4    call        TCustomForm.GetPixelsPerInch
 00059FA9    cmp         esi,eax
>00059FAB    je          00059FCB
 00059FAD    test        esi,esi
>00059FAF    je          00059FB6
 00059FB1    cmp         esi,24
>00059FB4    jl          00059FCB
 00059FB6    test        byte ptr [ebx+20],1
>00059FBA    je          00059FC5
 00059FBC    cmp         dword ptr [ebx+23C],0
>00059FC3    je          00059FCB
 00059FC5    mov         dword ptr [ebx+23C],esi
 00059FCB    pop         esi
 00059FCC    pop         ebx
 00059FCD    ret
*}
end;

//00059FD0
procedure TCustomForm.SetPosition(Value:TPosition);
begin
{*
 00059FD0    cmp         dl,byte ptr [eax+210]
>00059FD6    je          00059FE9
 00059FD8    mov         byte ptr [eax+210],dl
 00059FDE    test        byte ptr [eax+20],10
>00059FE2    jne         00059FE9
 00059FE4    call        TWinControl.RecreateWnd
 00059FE9    ret
*}
end;

//00059FEC
function TCustomForm.GetScaled:Boolean;
begin
{*
 00059FEC    cmp         dword ptr [eax+23C],0
 00059FF3    setne       al
 00059FF6    ret
*}
end;

//00059FF8
procedure TCustomForm.SetScaled(Value:Boolean);
begin
{*
 00059FF8    push        ebx
 00059FF9    push        esi
 00059FFA    mov         ebx,edx
 00059FFC    mov         esi,eax
 00059FFE    mov         eax,esi
 0005A000    call        TCustomForm.GetScaled
 0005A005    cmp         bl,al
>0005A007    je          0005A023
 0005A009    xor         eax,eax
 0005A00B    mov         dword ptr [esi+23C],eax
 0005A011    test        bl,bl
>0005A013    je          0005A023
 0005A015    mov         eax,[000B67B4];Screen:TScreen
 0005A01A    mov         eax,dword ptr [eax+34]
 0005A01D    mov         dword ptr [esi+23C],eax
 0005A023    pop         esi
 0005A024    pop         ebx
 0005A025    ret
*}
end;

//0005A028
procedure TCustomForm.CMColorChanged(var Message:TMessage);
begin
{*
 0005A028    push        ebx
 0005A029    mov         ebx,eax
 0005A02B    mov         eax,ebx
 0005A02D    call        TWinControl.CMColorChanged
 0005A032    mov         eax,dword ptr [ebx+218]
 0005A038    test        eax,eax
>0005A03A    je          0005A047
 0005A03C    mov         eax,dword ptr [eax+14]
 0005A03F    mov         edx,dword ptr [ebx+64]
 0005A042    call        TBrush.SetColor
 0005A047    pop         ebx
 0005A048    ret
*}
end;

//0005A04C
function TCustomForm.NormalColor:TColor;
begin
{*
 0005A04C    mov         edx,80000005
 0005A051    cmp         byte ptr [eax+20F],2
>0005A058    jne         0005A05F
 0005A05A    mov         edx,8000000C
 0005A05F    mov         eax,edx
 0005A061    ret
*}
end;

//0005A064
procedure TCustomForm.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0005A064    push        ebx
 0005A065    mov         ebx,eax
 0005A067    mov         eax,ebx
 0005A069    call        TWinControl.CMCtl3DChanged
 0005A06E    cmp         byte ptr [ebx+12C],0
>0005A075    je          0005A091
 0005A077    mov         eax,ebx
 0005A079    call        TCustomForm.NormalColor
 0005A07E    cmp         eax,dword ptr [ebx+64]
>0005A081    jne         0005A0AA
 0005A083    mov         edx,8000000F
 0005A088    mov         eax,ebx
 0005A08A    call        TControl.SetColor
 0005A08F    pop         ebx
 0005A090    ret
 0005A091    cmp         dword ptr [ebx+64],8000000F
>0005A098    jne         0005A0AA
 0005A09A    mov         eax,ebx
 0005A09C    call        TCustomForm.NormalColor
 0005A0A1    mov         edx,eax
 0005A0A3    mov         eax,ebx
 0005A0A5    call        TControl.SetColor
 0005A0AA    pop         ebx
 0005A0AB    ret
*}
end;

//0005A0AC
procedure TCustomForm.CMFontChanged(var Message:TMessage);
begin
{*
 0005A0AC    push        ebx
 0005A0AD    mov         ebx,eax
 0005A0AF    mov         eax,ebx
 0005A0B1    call        TWinControl.CMFontChanged
 0005A0B6    mov         eax,dword ptr [ebx+218]
 0005A0BC    test        eax,eax
>0005A0BE    je          0005A0C8
 0005A0C0    mov         edx,dword ptr [ebx+58]
 0005A0C3    call        TCanvas.SetFont
 0005A0C8    pop         ebx
 0005A0C9    ret
*}
end;

//0005A0CC
procedure TCustomForm.CMMenuChanged(var Message:TMessage);
begin
{*
 0005A0CC    push        ebx
 0005A0CD    mov         ebx,eax
 0005A0CF    mov         eax,ebx
 0005A0D1    call        TCustomForm.RefreshMDIMenu
 0005A0D6    mov         edx,dword ptr [ebx+228]
 0005A0DC    mov         eax,ebx
 0005A0DE    call        TCustomForm.SetMenu
 0005A0E3    pop         ebx
 0005A0E4    ret
*}
end;

//0005A0E8
procedure TCustomForm.SetWindowState(Value:TWindowState);
begin
{*
 0005A0E8    push        ebx
 0005A0E9    push        esi
 0005A0EA    mov         ebx,edx
 0005A0EC    mov         esi,eax
 0005A0EE    cmp         bl,byte ptr [esi+20B]
>0005A0F4    je          0005A124
 0005A0F6    mov         byte ptr [esi+20B],bl
 0005A0FC    test        byte ptr [esi+20],10
>0005A100    jne         0005A124
 0005A102    cmp         byte ptr [esi+16C],0
>0005A109    je          0005A124
 0005A10B    xor         eax,eax
 0005A10D    mov         al,bl
 0005A10F    mov         eax,dword ptr [eax*4+0B4A3C]
 0005A116    push        eax
 0005A117    mov         eax,esi
 0005A119    call        TWinControl.GetHandle
 0005A11E    push        eax
 0005A11F    call        user32.ShowWindow
 0005A124    pop         esi
 0005A125    pop         ebx
 0005A126    ret
*}
end;

//0005A128
procedure TCustomForm.SetWindowToMonitor;
begin
{*
 0005A128    push        ebx
 0005A129    push        esi
 0005A12A    push        edi
 0005A12B    push        ebp
 0005A12C    add         esp,0FFFFFFEC
 0005A12F    mov         ebx,eax
 0005A131    mov         al,byte ptr [ebx+211]
 0005A137    test        al,al
>0005A139    je          0005A3EB
 0005A13F    mov         edx,dword ptr ds:[0B67B0];Application:TApplication
 0005A145    cmp         dword ptr [edx+30],0
>0005A149    je          0005A3EB
 0005A14F    xor         edx,edx
 0005A151    mov         dword ptr [esp],edx
 0005A154    cmp         al,2
>0005A156    jne         0005A16D
 0005A158    mov         eax,[000B67B0];Application:TApplication
 0005A15D    mov         eax,dword ptr [eax+30]
 0005A160    call        TCustomForm.GetMonitor
 0005A165    mov         eax,dword ptr [eax+4]
 0005A168    mov         dword ptr [esp],eax
>0005A16B    jmp         0005A1AE
 0005A16D    mov         al,byte ptr [ebx+211]
 0005A173    cmp         al,3
>0005A175    jne         0005A198
 0005A177    mov         edx,dword ptr ds:[0B67B4];Screen:TScreen
 0005A17D    cmp         dword ptr [edx+5C],0
>0005A181    je          0005A198
 0005A183    mov         eax,[000B67B4];Screen:TScreen
 0005A188    mov         eax,dword ptr [eax+5C]
 0005A18B    call        TCustomForm.GetMonitor
 0005A190    mov         eax,dword ptr [eax+4]
 0005A193    mov         dword ptr [esp],eax
>0005A196    jmp         0005A1AE
 0005A198    cmp         al,1
>0005A19A    jne         0005A1AE
 0005A19C    xor         edx,edx
 0005A19E    mov         eax,[000B67B4];Screen:TScreen
 0005A1A3    call        TScreen.GetMonitor
 0005A1A8    mov         eax,dword ptr [eax+4]
 0005A1AB    mov         dword ptr [esp],eax
 0005A1AE    mov         eax,ebx
 0005A1B0    call        TCustomForm.GetMonitor
 0005A1B5    mov         eax,dword ptr [eax+4]
 0005A1B8    mov         dword ptr [esp+4],eax
 0005A1BC    mov         eax,[000B67B4];Screen:TScreen
 0005A1C1    call        TScreen.GetMonitorCount
 0005A1C6    dec         eax
 0005A1C7    test        eax,eax
>0005A1C9    jl          0005A3EB
 0005A1CF    inc         eax
 0005A1D0    mov         dword ptr [esp+0C],eax
 0005A1D4    xor         esi,esi
 0005A1D6    mov         edx,esi
 0005A1D8    mov         eax,[000B67B4];Screen:TScreen
 0005A1DD    call        TScreen.GetMonitor
 0005A1E2    mov         eax,dword ptr [eax+4]
 0005A1E5    cmp         eax,dword ptr [esp]
>0005A1E8    jne         0005A3E0
 0005A1EE    mov         eax,dword ptr [esp]
 0005A1F1    cmp         eax,dword ptr [esp+4]
>0005A1F5    je          0005A3E0
 0005A1FB    mov         eax,[000B67B4];Screen:TScreen
 0005A200    call        TScreen.GetMonitorCount
 0005A205    dec         eax
 0005A206    test        eax,eax
>0005A208    jl          0005A3E0
 0005A20E    inc         eax
 0005A20F    mov         dword ptr [esp+10],eax
 0005A213    xor         edi,edi
 0005A215    mov         edx,edi
 0005A217    mov         eax,[000B67B4];Screen:TScreen
 0005A21C    call        TScreen.GetMonitor
 0005A221    mov         eax,dword ptr [eax+4]
 0005A224    cmp         eax,dword ptr [esp+4]
>0005A228    jne         0005A3D5
 0005A22E    cmp         byte ptr [ebx+210],4
>0005A235    jne         0005A2B1
 0005A237    mov         eax,dword ptr [ebx+38]
 0005A23A    push        eax
 0005A23B    mov         ebp,dword ptr [ebx+3C]
 0005A23E    push        ebp
 0005A23F    mov         edx,esi
 0005A241    mov         eax,[000B67B4];Screen:TScreen
 0005A246    call        TScreen.GetMonitor
 0005A24B    call        TMonitor.GetTop
 0005A250    push        eax
 0005A251    mov         edx,esi
 0005A253    mov         eax,[000B67B4];Screen:TScreen
 0005A258    call        TScreen.GetMonitor
 0005A25D    call        TMonitor.GetHeight
 0005A262    sub         eax,ebp
 0005A264    sar         eax,1
>0005A266    jns         0005A26B
 0005A268    adc         eax,0
 0005A26B    pop         edx
 0005A26C    add         edx,eax
 0005A26E    push        edx
 0005A26F    mov         edx,esi
 0005A271    mov         eax,[000B67B4];Screen:TScreen
 0005A276    call        TScreen.GetMonitor
 0005A27B    call        TMonitor.GetLeft
 0005A280    mov         ebp,eax
 0005A282    mov         edx,esi
 0005A284    mov         eax,[000B67B4];Screen:TScreen
 0005A289    call        TScreen.GetMonitor
 0005A28E    call        TMonitor.GetWidth
 0005A293    sub         eax,dword ptr [ebx+38]
 0005A296    sar         eax,1
>0005A298    jns         0005A29D
 0005A29A    adc         eax,0
 0005A29D    add         ebp,eax
 0005A29F    mov         edx,ebp
 0005A2A1    mov         eax,ebx
 0005A2A3    pop         ecx
 0005A2A4    mov         ebp,dword ptr [eax]
 0005A2A6    call        dword ptr [ebp+80]
>0005A2AC    jmp         0005A3D5
 0005A2B1    mov         edx,esi
 0005A2B3    mov         eax,[000B67B4];Screen:TScreen
 0005A2B8    call        TScreen.GetMonitor
 0005A2BD    call        TMonitor.GetLeft
 0005A2C2    mov         ebp,eax
 0005A2C4    add         ebp,dword ptr [ebx+30]
 0005A2C7    mov         edx,edi
 0005A2C9    mov         eax,[000B67B4];Screen:TScreen
 0005A2CE    call        TScreen.GetMonitor
 0005A2D3    call        TMonitor.GetLeft
 0005A2D8    sub         ebp,eax
 0005A2DA    mov         edx,esi
 0005A2DC    mov         eax,[000B67B4];Screen:TScreen
 0005A2E1    call        TScreen.GetMonitor
 0005A2E6    call        TMonitor.GetLeft
 0005A2EB    push        eax
 0005A2EC    mov         edx,esi
 0005A2EE    mov         eax,[000B67B4];Screen:TScreen
 0005A2F3    call        TScreen.GetMonitor
 0005A2F8    call        TMonitor.GetWidth
 0005A2FD    pop         edx
 0005A2FE    add         edx,eax
 0005A300    mov         eax,dword ptr [ebx+38]
 0005A303    add         eax,ebp
 0005A305    cmp         edx,eax
>0005A307    jge         0005A332
 0005A309    mov         edx,esi
 0005A30B    mov         eax,[000B67B4];Screen:TScreen
 0005A310    call        TScreen.GetMonitor
 0005A315    call        TMonitor.GetLeft
 0005A31A    mov         ebp,eax
 0005A31C    mov         edx,esi
 0005A31E    mov         eax,[000B67B4];Screen:TScreen
 0005A323    call        TScreen.GetMonitor
 0005A328    call        TMonitor.GetWidth
 0005A32D    add         ebp,eax
 0005A32F    sub         ebp,dword ptr [ebx+38]
 0005A332    mov         edx,esi
 0005A334    mov         eax,[000B67B4];Screen:TScreen
 0005A339    call        TScreen.GetMonitor
 0005A33E    call        TMonitor.GetTop
 0005A343    add         eax,dword ptr [ebx+34]
 0005A346    push        eax
 0005A347    mov         edx,edi
 0005A349    mov         eax,[000B67B4];Screen:TScreen
 0005A34E    call        TScreen.GetMonitor
 0005A353    call        TMonitor.GetTop
 0005A358    pop         edx
 0005A359    sub         edx,eax
 0005A35B    mov         dword ptr [esp+8],edx
 0005A35F    mov         edx,esi
 0005A361    mov         eax,[000B67B4];Screen:TScreen
 0005A366    call        TScreen.GetMonitor
 0005A36B    call        TMonitor.GetTop
 0005A370    push        eax
 0005A371    mov         edx,esi
 0005A373    mov         eax,[000B67B4];Screen:TScreen
 0005A378    call        TScreen.GetMonitor
 0005A37D    call        TMonitor.GetHeight
 0005A382    pop         edx
 0005A383    add         edx,eax
 0005A385    mov         eax,dword ptr [esp+8]
 0005A389    add         eax,dword ptr [ebx+3C]
 0005A38C    cmp         edx,eax
>0005A38E    jge         0005A3BD
 0005A390    mov         edx,esi
 0005A392    mov         eax,[000B67B4];Screen:TScreen
 0005A397    call        TScreen.GetMonitor
 0005A39C    call        TMonitor.GetTop
 0005A3A1    push        eax
 0005A3A2    mov         edx,esi
 0005A3A4    mov         eax,[000B67B4];Screen:TScreen
 0005A3A9    call        TScreen.GetMonitor
 0005A3AE    call        TMonitor.GetHeight
 0005A3B3    pop         edx
 0005A3B4    add         edx,eax
 0005A3B6    sub         edx,dword ptr [ebx+3C]
 0005A3B9    mov         dword ptr [esp+8],edx
 0005A3BD    mov         eax,dword ptr [ebx+38]
 0005A3C0    push        eax
 0005A3C1    mov         eax,dword ptr [ebx+3C]
 0005A3C4    push        eax
 0005A3C5    mov         ecx,dword ptr [esp+10]
 0005A3C9    mov         edx,ebp
 0005A3CB    mov         eax,ebx
 0005A3CD    mov         ebp,dword ptr [eax]
 0005A3CF    call        dword ptr [ebp+80]
 0005A3D5    inc         edi
 0005A3D6    dec         dword ptr [esp+10]
>0005A3DA    jne         0005A215
 0005A3E0    inc         esi
 0005A3E1    dec         dword ptr [esp+0C]
>0005A3E5    jne         0005A1D6
 0005A3EB    add         esp,14
 0005A3EE    pop         ebp
 0005A3EF    pop         edi
 0005A3F0    pop         esi
 0005A3F1    pop         ebx
 0005A3F2    ret
*}
end;

//0005A3F4
procedure TCustomForm.CreateParams(var Params:TCreateParams);
begin
{*
 0005A3F4    push        ebx
 0005A3F5    push        esi
 0005A3F6    push        edi
 0005A3F7    push        ecx
 0005A3F8    mov         esi,edx
 0005A3FA    mov         edi,eax
 0005A3FC    mov         edx,esi
 0005A3FE    mov         eax,edi
 0005A400    call        TScrollingWinControl.CreateParams
 0005A405    cmp         dword ptr [edi+24],0
>0005A409    jne         0005A426
 0005A40B    cmp         dword ptr [edi+168],0
>0005A412    jne         0005A426
 0005A414    mov         eax,[000B67B0];Application:TApplication
 0005A419    mov         eax,dword ptr [eax+24]
 0005A41C    mov         dword ptr [esi+1C],eax
 0005A41F    and         dword ptr [esi+4],0BFFCFFFF
 0005A426    mov         dword ptr [esi+24],8
 0005A42D    test        byte ptr [edi+20],10
>0005A431    je          0005A43F
 0005A433    or          dword ptr [esi+4],0CF0000
>0005A43A    jmp         0005A5E3
 0005A43F    mov         al,byte ptr [edi+210]
 0005A445    dec         eax
 0005A446    sub         al,2
>0005A448    jae         0005A458
 0005A44A    mov         dword ptr [esi+0C],80000000
 0005A451    mov         dword ptr [esi+10],80000000
 0005A458    mov         bl,byte ptr [edi+208]
 0005A45E    mov         al,byte ptr [edi+209]
 0005A464    mov         byte ptr [esp],al
 0005A467    cmp         byte ptr [edi+20F],1
>0005A46E    jne         0005A47F
 0005A470    mov         al,byte ptr [esp]
 0005A473    test        al,al
>0005A475    je          0005A47B
 0005A477    sub         al,3
>0005A479    jne         0005A47F
 0005A47B    mov         byte ptr [esp],2
 0005A47F    xor         eax,eax
 0005A481    mov         al,byte ptr [esp]
 0005A484    cmp         eax,5
>0005A487    ja          0005A543
 0005A48D    jmp         dword ptr [eax*4+5A494]
 0005A48D    dd          0005A4AC
 0005A48D    dd          0005A4CA
 0005A48D    dd          0005A4D3
 0005A48D    dd          0005A4F8
 0005A48D    dd          0005A4CA
 0005A48D    dd          0005A4D3
 0005A4AC    cmp         dword ptr [edi+24],0
>0005A4B0    jne         0005A4C2
 0005A4B2    cmp         dword ptr [edi+168],0
>0005A4B9    jne         0005A4C2
 0005A4BB    or          dword ptr [esi+4],80000000
 0005A4C2    mov         bl,byte ptr ds:[5A5E8]
>0005A4C8    jmp         0005A543
 0005A4CA    or          dword ptr [esi+4],0C00000
>0005A4D1    jmp         0005A543
 0005A4D3    or          dword ptr [esi+4],0C40000
 0005A4DA    mov         al,byte ptr [edi+210]
 0005A4E0    sub         al,1
>0005A4E2    je          0005A4E8
 0005A4E4    sub         al,2
>0005A4E6    jne         0005A543
 0005A4E8    mov         dword ptr [esi+14],80000000
 0005A4EF    mov         dword ptr [esi+18],80000000
>0005A4F6    jmp         0005A543
 0005A4F8    mov         eax,dword ptr [esi+4]
 0005A4FB    or          eax,80000000
 0005A500    or          eax,0C00000
 0005A505    mov         dword ptr [esi+4],eax
 0005A508    mov         dword ptr [esi+8],101
 0005A50F    lea         edx,[esi+8]
 0005A512    mov         eax,edi
 0005A514    call        TWinControl.AddBiDiModeExStyle
 0005A519    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005A51E    cmp         byte ptr [eax],0
>0005A521    jne         0005A533
 0005A523    mov         eax,dword ptr [esi+4]
 0005A526    or          eax,400000
 0005A52B    or          eax,80
 0005A530    mov         dword ptr [esi+4],eax
 0005A533    mov         al,[0005A5EC]
 0005A538    and         al,bl
 0005A53A    mov         ebx,eax
 0005A53C    mov         dword ptr [esi+24],2808
 0005A543    mov         al,byte ptr [esp]
 0005A546    add         al,0FC
 0005A548    sub         al,2
>0005A54A    jae         0005A566
 0005A54C    mov         dword ptr [esi+8],80
 0005A553    lea         edx,[esi+8]
 0005A556    mov         eax,edi
 0005A558    call        TWinControl.AddBiDiModeExStyle
 0005A55D    mov         al,[0005A5F0]
 0005A562    and         al,bl
 0005A564    mov         ebx,eax
 0005A566    mov         al,byte ptr [esp]
 0005A569    sub         al,3
>0005A56B    jae         0005A5B3
 0005A56D    cmp         byte ptr [edi+20F],1
>0005A574    jne         0005A57B
 0005A576    test        bl,1
>0005A579    je          0005A593
 0005A57B    test        bl,2
>0005A57E    je          0005A587
 0005A580    or          dword ptr [esi+4],20000
 0005A587    test        bl,4
>0005A58A    je          0005A593
 0005A58C    or          dword ptr [esi+4],10000
 0005A593    mov         al,byte ptr [edi+20B]
 0005A599    cmp         al,1
>0005A59B    jne         0005A5A6
 0005A59D    or          dword ptr [esi+4],20000000
>0005A5A4    jmp         0005A5BA
 0005A5A6    cmp         al,2
>0005A5A8    jne         0005A5BA
 0005A5AA    or          dword ptr [esi+4],1000000
>0005A5B1    jmp         0005A5BA
 0005A5B3    mov         byte ptr [edi+20B],0
 0005A5BA    test        bl,1
>0005A5BD    je          0005A5C6
 0005A5BF    or          dword ptr [esi+4],80000
 0005A5C6    test        bl,8
>0005A5C9    je          0005A5D2
 0005A5CB    or          dword ptr [esi+8],400
 0005A5D2    cmp         byte ptr [edi+20F],1
>0005A5D9    jne         0005A5E3
 0005A5DB    mov         eax,16C98;user32.DefMDIChildProcA:Longint
 0005A5E0    mov         dword ptr [esi+28],eax
 0005A5E3    pop         edx
 0005A5E4    pop         edi
 0005A5E5    pop         esi
 0005A5E6    pop         ebx
 0005A5E7    ret
*}
end;

//0005A5F4
procedure TCustomForm.CreateWnd;
begin
{*
 0005A5F4    push        ebx
 0005A5F5    push        esi
 0005A5F6    add         esp,0FFFFFFF8
 0005A5F9    mov         ebx,eax
 0005A5FB    mov         eax,ebx
 0005A5FD    call        TScrollingWinControl.CreateWnd
 0005A602    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005A607    cmp         byte ptr [eax],0
>0005A60A    je          0005A649
 0005A60C    cmp         byte ptr [ebx+209],3
>0005A613    je          0005A633
 0005A615    mov         eax,ebx
 0005A617    call        TCustomForm.GetIconHandle
 0005A61C    push        eax
 0005A61D    push        1
 0005A61F    push        80
 0005A624    mov         eax,ebx
 0005A626    call        TWinControl.GetHandle
 0005A62B    push        eax
 0005A62C    call        user32.SendMessageA
>0005A631    jmp         0005A649
 0005A633    push        0
 0005A635    push        1
 0005A637    push        80
 0005A63C    mov         eax,ebx
 0005A63E    call        TWinControl.GetHandle
 0005A643    push        eax
 0005A644    call        user32.SendMessageA
 0005A649    test        byte ptr [ebx+20],10
>0005A64D    jne         0005A723
 0005A653    mov         al,byte ptr [ebx+20F]
 0005A659    sub         al,2
>0005A65B    je          0005A66A
 0005A65D    dec         al
>0005A65F    je          0005A70A
>0005A665    jmp         0005A723
 0005A66A    mov         dword ptr [esp+4],0FF00
 0005A672    xor         eax,eax
 0005A674    mov         dword ptr [esp],eax
 0005A677    mov         esi,dword ptr [ebx+238]
 0005A67D    test        esi,esi
>0005A67F    je          0005A68B
 0005A681    mov         eax,esi
 0005A683    call        TMenuItem.GetHandle
 0005A688    mov         dword ptr [esp],eax
 0005A68B    push        esp
 0005A68C    mov         eax,[000B5950];^HInstance:Longword
 0005A691    mov         eax,dword ptr [eax]
 0005A693    push        eax
 0005A694    push        0
 0005A696    mov         eax,ebx
 0005A698    call        TWinControl.GetHandle
 0005A69D    push        eax
 0005A69E    mov         eax,ebx
 0005A6A0    call        TControl.GetClientHeight
 0005A6A5    push        eax
 0005A6A6    mov         eax,ebx
 0005A6A8    call        TControl.GetClientWidth
 0005A6AD    push        eax
 0005A6AE    push        0
 0005A6B0    push        0
 0005A6B2    push        56330001
 0005A6B7    push        0
 0005A6B9    push        5A728
 0005A6BE    push        200
 0005A6C3    call        user32.CreateWindowExA
 0005A6C8    mov         dword ptr [ebx+234],eax
 0005A6CE    push        ebx
 0005A6CF    push        597F4;TCustomForm.ClientWndProc
 0005A6D4    call        MakeObjectInstance
 0005A6D9    mov         dword ptr [ebx+258],eax
 0005A6DF    push        0FC
 0005A6E1    mov         eax,dword ptr [ebx+234]
 0005A6E7    push        eax
 0005A6E8    call        user32.GetWindowLongA
 0005A6ED    mov         dword ptr [ebx+254],eax
 0005A6F3    mov         eax,dword ptr [ebx+258]
 0005A6F9    push        eax
 0005A6FA    push        0FC
 0005A6FC    mov         eax,dword ptr [ebx+234]
 0005A702    push        eax
 0005A703    call        user32.SetWindowLongA
>0005A708    jmp         0005A723
 0005A70A    push        13
 0005A70C    push        0
 0005A70E    push        0
 0005A710    push        0
 0005A712    push        0
 0005A714    push        0FF
 0005A716    mov         eax,ebx
 0005A718    call        TWinControl.GetHandle
 0005A71D    push        eax
 0005A71E    call        user32.SetWindowPos
 0005A723    pop         ecx
 0005A724    pop         edx
 0005A725    pop         esi
 0005A726    pop         ebx
 0005A727    ret
*}
end;

//0005A734
procedure TCustomForm.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 0005A734    push        ebp
 0005A735    mov         ebp,esp
 0005A737    add         esp,0FFFFFFD8
 0005A73A    push        ebx
 0005A73B    xor         ecx,ecx
 0005A73D    mov         dword ptr [ebp-28],ecx
 0005A740    mov         ebx,eax
 0005A742    xor         eax,eax
 0005A744    push        ebp
 0005A745    push        5A828
 0005A74A    push        dword ptr fs:[eax]
 0005A74D    mov         dword ptr fs:[eax],esp
 0005A750    cmp         byte ptr [ebx+20F],1
>0005A757    jne         0005A804
 0005A75D    test        byte ptr [ebx+20],10
>0005A761    jne         0005A804
 0005A767    mov         eax,[000B67B0];Application:TApplication
 0005A76C    mov         eax,dword ptr [eax+30]
 0005A76F    test        eax,eax
>0005A771    je          0005A77C
 0005A773    cmp         dword ptr [eax+234],0
>0005A77A    jne         0005A79D
 0005A77C    lea         edx,[ebp-28]
 0005A77F    mov         eax,[000B5B04];^SNoMDIForm:TResStringRec
 0005A784    call        LoadResString
 0005A789    mov         ecx,dword ptr [ebp-28]
 0005A78C    mov         dl,1
 0005A78E    mov         eax,[0001EE64];EInvalidOperation
 0005A793    call        Exception.Create
 0005A798    call        @RaiseExcept
 0005A79D    lea         eax,[edx+4C]
 0005A7A0    mov         dword ptr [ebp-24],eax
 0005A7A3    mov         eax,dword ptr [edx]
 0005A7A5    mov         dword ptr [ebp-20],eax
 0005A7A8    mov         eax,[000B5950];^HInstance:Longword
 0005A7AD    mov         eax,dword ptr [eax]
 0005A7AF    mov         dword ptr [ebp-1C],eax
 0005A7B2    mov         eax,dword ptr [edx+0C]
 0005A7B5    mov         dword ptr [ebp-18],eax
 0005A7B8    mov         eax,dword ptr [edx+10]
 0005A7BB    mov         dword ptr [ebp-14],eax
 0005A7BE    mov         eax,dword ptr [edx+14]
 0005A7C1    mov         dword ptr [ebp-10],eax
 0005A7C4    mov         eax,dword ptr [edx+18]
 0005A7C7    mov         dword ptr [ebp-0C],eax
 0005A7CA    mov         eax,dword ptr [edx+4]
 0005A7CD    mov         dword ptr [ebp-8],eax
 0005A7D0    mov         eax,dword ptr [edx+20]
 0005A7D3    mov         dword ptr [ebp-4],eax
 0005A7D6    lea         eax,[ebp-24]
 0005A7D9    push        eax
 0005A7DA    push        0
 0005A7DC    push        220
 0005A7E1    mov         eax,[000B67B0];Application:TApplication
 0005A7E6    mov         eax,dword ptr [eax+30]
 0005A7E9    mov         eax,dword ptr [eax+234]
 0005A7EF    push        eax
 0005A7F0    call        user32.SendMessageA
 0005A7F5    mov         dword ptr [ebx+140],eax
 0005A7FB    or          byte ptr [ebx+2C0],10
>0005A802    jmp         0005A812
 0005A804    mov         eax,ebx
 0005A806    call        TWinControl.CreateWindowHandle
 0005A80B    and         byte ptr [ebx+2C0],0EF
 0005A812    xor         eax,eax
 0005A814    pop         edx
 0005A815    pop         ecx
 0005A816    pop         ecx
 0005A817    mov         dword ptr fs:[eax],edx
 0005A81A    push        5A82F
 0005A81F    lea         eax,[ebp-28]
 0005A822    call        @LStrClr
 0005A827    ret
>0005A828    jmp         @HandleFinally
>0005A82D    jmp         0005A81F
 0005A82F    pop         ebx
 0005A830    mov         esp,ebp
 0005A832    pop         ebp
 0005A833    ret
*}
end;

//0005A834
procedure TCustomForm.DestroyWindowHandle;
begin
{*
 0005A834    push        ebx
 0005A835    mov         ebx,eax
 0005A837    test        byte ptr [ebx+2C0],10
>0005A83E    je          0005A865
 0005A840    push        0
 0005A842    mov         eax,ebx
 0005A844    call        TWinControl.GetHandle
 0005A849    push        eax
 0005A84A    push        221
 0005A84F    mov         eax,[000B67B0];Application:TApplication
 0005A854    mov         eax,dword ptr [eax+30]
 0005A857    mov         eax,dword ptr [eax+234]
 0005A85D    push        eax
 0005A85E    call        user32.SendMessageA
>0005A863    jmp         0005A86C
 0005A865    mov         eax,ebx
 0005A867    call        TWinControl.DestroyWindowHandle
 0005A86C    xor         eax,eax
 0005A86E    mov         dword ptr [ebx+234],eax
 0005A874    pop         ebx
 0005A875    ret
*}
end;

//0005A878
procedure TCustomForm.DefaultHandler(var Message:void );
begin
{*
 0005A878    push        ebx
 0005A879    push        esi
 0005A87A    mov         esi,edx
 0005A87C    mov         ebx,eax
 0005A87E    cmp         dword ptr [ebx+234],0
>0005A885    je          0005A8CE
 0005A887    cmp         dword ptr [esi],5
>0005A88A    jne         0005A8A9
 0005A88C    mov         eax,dword ptr [esi+8]
 0005A88F    push        eax
 0005A890    mov         eax,dword ptr [esi+4]
 0005A893    push        eax
 0005A894    mov         eax,dword ptr [esi]
 0005A896    push        eax
 0005A897    mov         eax,ebx
 0005A899    call        TWinControl.GetHandle
 0005A89E    push        eax
 0005A89F    call        user32.DefWindowProcA
 0005A8A4    mov         dword ptr [esi+0C],eax
>0005A8A7    jmp         0005A8D7
 0005A8A9    mov         eax,dword ptr [esi+8]
 0005A8AC    push        eax
 0005A8AD    mov         eax,dword ptr [esi+4]
 0005A8B0    push        eax
 0005A8B1    mov         eax,dword ptr [esi]
 0005A8B3    push        eax
 0005A8B4    mov         eax,dword ptr [ebx+234]
 0005A8BA    push        eax
 0005A8BB    mov         eax,ebx
 0005A8BD    call        TWinControl.GetHandle
 0005A8C2    push        eax
 0005A8C3    call        user32.DefFrameProcA
 0005A8C8    mov         dword ptr [esi+0C],eax
 0005A8CB    pop         esi
 0005A8CC    pop         ebx
 0005A8CD    ret
 0005A8CE    mov         edx,esi
 0005A8D0    mov         eax,ebx
 0005A8D2    call        TWinControl.DefaultHandler
 0005A8D7    pop         esi
 0005A8D8    pop         ebx
 0005A8D9    ret
*}
end;

//0005A8DC
procedure TCustomForm.SetActiveControl(Control:TWinControl);
begin
{*
 0005A8DC    push        ebp
 0005A8DD    mov         ebp,esp
 0005A8DF    push        0
 0005A8E1    push        ebx
 0005A8E2    push        esi
 0005A8E3    mov         esi,edx
 0005A8E5    mov         ebx,eax
 0005A8E7    xor         eax,eax
 0005A8E9    push        ebp
 0005A8EA    push        5A97F
 0005A8EF    push        dword ptr fs:[eax]
 0005A8F2    mov         dword ptr fs:[eax],esp
 0005A8F5    cmp         esi,dword ptr [ebx+200]
>0005A8FB    je          0005A969
 0005A8FD    test        esi,esi
>0005A8FF    je          0005A942
 0005A901    cmp         ebx,esi
>0005A903    je          0005A921
 0005A905    mov         eax,esi
 0005A907    call        GetParentForm
 0005A90C    cmp         ebx,eax
>0005A90E    jne         0005A921
 0005A910    test        byte ptr [ebx+20],1
>0005A914    jne         0005A942
 0005A916    mov         eax,esi
 0005A918    call        TWinControl.CanFocus
 0005A91D    test        al,al
>0005A91F    jne         0005A942
 0005A921    lea         edx,[ebp-4]
 0005A924    mov         eax,[000B5B2C];^SCannotFocus:TResStringRec
 0005A929    call        LoadResString
 0005A92E    mov         ecx,dword ptr [ebp-4]
 0005A931    mov         dl,1
 0005A933    mov         eax,[0001EE64];EInvalidOperation
 0005A938    call        Exception.Create
 0005A93D    call        @RaiseExcept
 0005A942    mov         dword ptr [ebx+200],esi
 0005A948    test        byte ptr [ebx+20],1
>0005A94C    jne         0005A969
 0005A94E    cmp         byte ptr [ebx+20E],0
>0005A955    je          0005A95E
 0005A957    mov         eax,ebx
 0005A959    call        TCustomForm.SetWindowFocus
 0005A95E    mov         eax,ebx
 0005A960    mov         bx,0FFB7
 0005A964    call        @CallDynaInst
 0005A969    xor         eax,eax
 0005A96B    pop         edx
 0005A96C    pop         ecx
 0005A96D    pop         ecx
 0005A96E    mov         dword ptr fs:[eax],edx
 0005A971    push        5A986
 0005A976    lea         eax,[ebp-4]
 0005A979    call        @LStrClr
 0005A97E    ret
>0005A97F    jmp         @HandleFinally
>0005A984    jmp         0005A976
 0005A986    pop         esi
 0005A987    pop         ebx
 0005A988    pop         ecx
 0005A989    pop         ebp
 0005A98A    ret
*}
end;

//0005A98C
procedure TCustomForm.DefocusControl(Control:TWinControl; Removing:Boolean);
begin
{*
 0005A98C    push        ebx
 0005A98D    push        esi
 0005A98E    push        edi
 0005A98F    mov         ebx,ecx
 0005A991    mov         esi,edx
 0005A993    mov         edi,eax
 0005A995    test        bl,bl
>0005A997    je          0005A9B3
 0005A999    mov         edx,dword ptr [edi+204]
 0005A99F    mov         eax,esi
 0005A9A1    call        TWinControl.ContainsControl
 0005A9A6    test        al,al
>0005A9A8    je          0005A9B3
 0005A9AA    mov         eax,dword ptr [esi+24]
 0005A9AD    mov         dword ptr [edi+204],eax
 0005A9B3    mov         edx,dword ptr [edi+200]
 0005A9B9    mov         eax,esi
 0005A9BB    call        TWinControl.ContainsControl
 0005A9C0    test        al,al
>0005A9C2    je          0005A9CD
 0005A9C4    xor         edx,edx
 0005A9C6    mov         eax,edi
 0005A9C8    call        TCustomForm.SetActiveControl
 0005A9CD    pop         edi
 0005A9CE    pop         esi
 0005A9CF    pop         ebx
 0005A9D0    ret
*}
end;

//0005A9D4
procedure TCustomForm.FocusControl(Control:TWinControl);
begin
{*
 0005A9D4    push        ebx
 0005A9D5    push        esi
 0005A9D6    mov         esi,eax
 0005A9D8    mov         bl,byte ptr [esi+20E]
 0005A9DE    mov         eax,esi
 0005A9E0    call        TCustomForm.SetActiveControl
 0005A9E5    test        bl,bl
>0005A9E7    jne         0005A9F3
 0005A9E9    mov         eax,esi
 0005A9EB    mov         edx,dword ptr [eax]
 0005A9ED    call        dword ptr [edx+0B4]
 0005A9F3    pop         esi
 0005A9F4    pop         ebx
 0005A9F5    ret
*}
end;

//0005A9F8
function TCustomForm.SetFocusedControl(Control:TWinControl):Boolean;
begin
{*
 0005A9F8    push        ebp
 0005A9F9    mov         ebp,esp
 0005A9FB    push        ecx
 0005A9FC    push        ebx
 0005A9FD    push        esi
 0005A9FE    push        edi
 0005A9FF    mov         dword ptr [ebp-4],edx
 0005AA02    mov         edi,eax
 0005AA04    xor         ebx,ebx
 0005AA06    inc         dword ptr ds:[0B49B0]
 0005AA0C    cmp         dword ptr [edi+230],0
>0005AA13    jne         0005AA2D
 0005AA15    cmp         edi,dword ptr [ebp-4]
>0005AA18    je          0005AA25
 0005AA1A    mov         eax,dword ptr [ebp-4]
 0005AA1D    mov         dword ptr [edi+200],eax
>0005AA23    jmp         0005AA2D
 0005AA25    xor         eax,eax
 0005AA27    mov         dword ptr [edi+200],eax
 0005AA2D    mov         eax,[000B67B4];Screen:TScreen
 0005AA32    mov         edx,dword ptr [ebp-4]
 0005AA35    mov         dword ptr [eax+58],edx
 0005AA38    mov         eax,[000B67B4];Screen:TScreen
 0005AA3D    mov         dword ptr [eax+5C],edi
 0005AA40    mov         eax,[000B67B4];Screen:TScreen
 0005AA45    mov         eax,dword ptr [eax+44]
 0005AA48    mov         edx,edi
 0005AA4A    call        TList.Remove
 0005AA4F    mov         eax,[000B67B4];Screen:TScreen
 0005AA54    mov         eax,dword ptr [eax+44]
 0005AA57    mov         ecx,edi
 0005AA59    xor         edx,edx
 0005AA5B    call        TList.Insert
 0005AA60    mov         eax,edi
 0005AA62    mov         edx,dword ptr ds:[554E4];TForm
 0005AA68    call        @IsClass
 0005AA6D    test        al,al
>0005AA6F    je          0005AA9B
 0005AA71    mov         eax,[000B67B4];Screen:TScreen
 0005AA76    mov         dword ptr [eax+60],edi
 0005AA79    mov         eax,[000B67B4];Screen:TScreen
 0005AA7E    mov         eax,dword ptr [eax+40]
 0005AA81    mov         edx,edi
 0005AA83    call        TList.Remove
 0005AA88    mov         eax,[000B67B4];Screen:TScreen
 0005AA8D    mov         eax,dword ptr [eax+40]
 0005AA90    mov         ecx,edi
 0005AA92    xor         edx,edx
 0005AA94    call        TList.Insert
>0005AA99    jmp         0005AAA5
 0005AA9B    mov         eax,[000B67B4];Screen:TScreen
 0005AAA0    xor         edx,edx
 0005AAA2    mov         dword ptr [eax+60],edx
 0005AAA5    mov         eax,dword ptr [ebp-4]
 0005AAA8    test        byte ptr [eax+44],20
>0005AAAC    jne         0005AC78
 0005AAB2    mov         eax,dword ptr [ebp-4]
 0005AAB5    mov         ax,word ptr [eax+44]
 0005AAB9    or          ax,word ptr ds:[5AC80]
 0005AAC0    mov         edx,dword ptr [ebp-4]
 0005AAC3    mov         word ptr [edx+44],ax
 0005AAC7    xor         edx,edx
 0005AAC9    push        ebp
 0005AACA    push        5AC65
 0005AACF    push        dword ptr fs:[edx]
 0005AAD2    mov         dword ptr fs:[edx],esp
 0005AAD5    mov         eax,[000B67B4];Screen:TScreen
 0005AADA    mov         eax,dword ptr [eax+6C]
 0005AADD    cmp         edi,eax
>0005AADF    je          0005AB35
 0005AAE1    test        eax,eax
>0005AAE3    je          0005AB0F
 0005AAE5    call        TWinControl.GetHandle
 0005AAEA    mov         esi,eax
 0005AAEC    mov         eax,[000B67B4];Screen:TScreen
 0005AAF1    xor         edx,edx
 0005AAF3    mov         dword ptr [eax+6C],edx
 0005AAF6    mov         dx,0B001
 0005AAFA    mov         eax,esi
 0005AAFC    call        SendFocusMessage
 0005AB01    test        al,al
>0005AB03    jne         0005AB0F
 0005AB05    call        @TryFinallyExit
>0005AB0A    jmp         0005AC78
 0005AB0F    mov         eax,[000B67B4];Screen:TScreen
 0005AB14    mov         dword ptr [eax+6C],edi
 0005AB17    mov         eax,edi
 0005AB19    call        TWinControl.GetHandle
 0005AB1E    mov         dx,0B000
 0005AB22    call        SendFocusMessage
 0005AB27    test        al,al
>0005AB29    jne         0005AB35
 0005AB2B    call        @TryFinallyExit
>0005AB30    jmp         0005AC78
 0005AB35    cmp         dword ptr [edi+204],0
>0005AB3C    jne         0005AB44
 0005AB3E    mov         dword ptr [edi+204],edi
 0005AB44    mov         eax,dword ptr [edi+204]
 0005AB4A    cmp         eax,dword ptr [ebp-4]
>0005AB4D    je          0005AC40
>0005AB53    jmp         0005AB8A
 0005AB55    mov         eax,dword ptr [edi+204]
 0005AB5B    call        TWinControl.GetHandle
 0005AB60    mov         esi,eax
 0005AB62    mov         eax,dword ptr [edi+204]
 0005AB68    mov         eax,dword ptr [eax+24]
 0005AB6B    mov         dword ptr [edi+204],eax
 0005AB71    mov         dx,0B01B
 0005AB75    mov         eax,esi
 0005AB77    call        SendFocusMessage
 0005AB7C    test        al,al
>0005AB7E    jne         0005AB8A
 0005AB80    call        @TryFinallyExit
>0005AB85    jmp         0005AC78
 0005AB8A    mov         esi,dword ptr [edi+204]
 0005AB90    test        esi,esi
>0005AB92    je          0005ABDA
 0005AB94    mov         eax,esi
 0005AB96    mov         edx,dword ptr [ebp-4]
 0005AB99    call        TWinControl.ContainsControl
 0005AB9E    test        al,al
>0005ABA0    je          0005AB55
>0005ABA2    jmp         0005ABDA
 0005ABA4    mov         esi,dword ptr [ebp-4]
>0005ABA7    jmp         0005ABAB
 0005ABA9    mov         esi,eax
 0005ABAB    mov         eax,dword ptr [esi+24]
 0005ABAE    cmp         eax,dword ptr [edi+204]
>0005ABB4    jne         0005ABA9
 0005ABB6    mov         dword ptr [edi+204],esi
 0005ABBC    mov         eax,esi
 0005ABBE    call        TWinControl.GetHandle
 0005ABC3    mov         dx,0B01A
 0005ABC7    call        SendFocusMessage
 0005ABCC    test        al,al
>0005ABCE    jne         0005ABDA
 0005ABD0    call        @TryFinallyExit
>0005ABD5    jmp         0005AC78
 0005ABDA    mov         eax,dword ptr [edi+204]
 0005ABE0    cmp         eax,dword ptr [ebp-4]
>0005ABE3    jne         0005ABA4
 0005ABE5    mov         eax,dword ptr [ebp-4]
 0005ABE8    mov         esi,dword ptr [eax+24]
 0005ABEB    test        esi,esi
>0005ABED    je          0005AC11
 0005ABEF    mov         eax,esi
 0005ABF1    mov         edx,dword ptr ds:[54494];TScrollingWinControl
 0005ABF7    call        @IsClass
 0005ABFC    test        al,al
>0005ABFE    je          0005AC0A
 0005AC00    mov         edx,dword ptr [ebp-4]
 0005AC03    mov         eax,esi
 0005AC05    call        TScrollingWinControl.AutoScrollInView
 0005AC0A    mov         esi,dword ptr [esi+24]
 0005AC0D    test        esi,esi
>0005AC0F    jne         0005ABEF
 0005AC11    mov         eax,dword ptr [ebp-4]
 0005AC14    push        eax
 0005AC15    xor         ecx,ecx
 0005AC17    mov         edx,0B007
 0005AC1C    mov         eax,edi
 0005AC1E    call        TControl.Perform
 0005AC23    mov         eax,dword ptr [edi+25C]
 0005AC29    test        eax,eax
>0005AC2B    je          0005AC40
 0005AC2D    cmp         eax,dword ptr [ebp-4]
>0005AC30    je          0005AC40
 0005AC32    push        0
 0005AC34    xor         ecx,ecx
 0005AC36    mov         edx,0B02A
 0005AC3B    call        TControl.Perform
 0005AC40    xor         eax,eax
 0005AC42    pop         edx
 0005AC43    pop         ecx
 0005AC44    pop         ecx
 0005AC45    mov         dword ptr fs:[eax],edx
 0005AC48    push        5AC6C
 0005AC4D    mov         eax,dword ptr [ebp-4]
 0005AC50    mov         dx,word ptr ds:[5AC80]
 0005AC57    not         edx
 0005AC59    and         dx,word ptr [eax+44]
 0005AC5D    mov         eax,dword ptr [ebp-4]
 0005AC60    mov         word ptr [eax+44],dx
 0005AC64    ret
>0005AC65    jmp         @HandleFinally
>0005AC6A    jmp         0005AC4D
 0005AC6C    mov         eax,[000B67B4];Screen:TScreen
 0005AC71    call        TScreen.UpdateLastActive
 0005AC76    mov         bl,1
 0005AC78    mov         eax,ebx
 0005AC7A    pop         edi
 0005AC7B    pop         esi
 0005AC7C    pop         ebx
 0005AC7D    pop         ecx
 0005AC7E    pop         ebp
 0005AC7F    ret
*}
end;

//0005AC84
procedure TCustomForm.sub_0005AC84;
begin
{*
 0005AC84    ret
*}
end;

//0005AC88
procedure TCustomForm.SetWindowFocus;
begin
{*
 0005AC88    push        ebx
 0005AC89    push        esi
 0005AC8A    mov         edx,dword ptr [eax+200]
 0005AC90    test        edx,edx
>0005AC92    je          0005ACA1
 0005AC94    cmp         dword ptr [eax+230],0
>0005AC9B    jne         0005ACA1
 0005AC9D    mov         ebx,edx
>0005AC9F    jmp         0005ACA3
 0005ACA1    mov         ebx,eax
 0005ACA3    mov         eax,ebx
 0005ACA5    call        TWinControl.GetHandle
 0005ACAA    push        eax
 0005ACAB    call        user32.SetFocus
 0005ACB0    mov         eax,ebx
 0005ACB2    call        TWinControl.GetHandle
 0005ACB7    mov         esi,eax
 0005ACB9    call        user32.GetFocus
 0005ACBE    cmp         esi,eax
>0005ACC0    jne         0005ACD2
 0005ACC2    push        0
 0005ACC4    xor         ecx,ecx
 0005ACC6    mov         edx,0B029
 0005ACCB    mov         eax,ebx
 0005ACCD    call        TControl.Perform
 0005ACD2    pop         esi
 0005ACD3    pop         ebx
 0005ACD4    ret
*}
end;

//0005ACD8
procedure TCustomForm.SetActive(Value:Boolean);
begin
{*
 0005ACD8    push        ebx
 0005ACD9    push        esi
 0005ACDA    mov         ebx,edx
 0005ACDC    mov         esi,eax
 0005ACDE    mov         byte ptr [esi+20E],bl
 0005ACE4    mov         eax,dword ptr [esi+25C]
 0005ACEA    test        eax,eax
>0005ACEC    je          0005ACFE
 0005ACEE    push        0
 0005ACF0    xor         ecx,ecx
 0005ACF2    mov         cl,bl
 0005ACF4    mov         edx,0B02B
 0005ACF9    call        TControl.Perform
 0005ACFE    test        bl,bl
>0005AD00    je          0005AD39
 0005AD02    cmp         dword ptr [esi+200],0
>0005AD09    jne         0005AD29
 0005AD0B    test        byte ptr [esi+20],10
>0005AD0F    jne         0005AD29
 0005AD11    push        1
 0005AD13    push        0
 0005AD15    mov         cl,1
 0005AD17    xor         edx,edx
 0005AD19    mov         eax,esi
 0005AD1B    call        TWinControl.FindNextControl
 0005AD20    mov         edx,eax
 0005AD22    mov         eax,esi
 0005AD24    call        TCustomForm.SetActiveControl
 0005AD29    mov         dl,1
 0005AD2B    mov         eax,esi
 0005AD2D    call        TCustomForm.MergeMenu
 0005AD32    mov         eax,esi
 0005AD34    call        TCustomForm.SetWindowFocus
 0005AD39    pop         esi
 0005AD3A    pop         ebx
 0005AD3B    ret
*}
end;

//0005AD3C
procedure TCustomForm.SendCancelMode(Sender:TControl);
begin
{*
 0005AD3C    push        ebx
 0005AD3D    push        esi
 0005AD3E    mov         esi,edx
 0005AD40    mov         ebx,eax
 0005AD42    cmp         byte ptr [ebx+20E],0
>0005AD49    je          0005AD67
 0005AD4B    cmp         dword ptr [ebx+200],0
>0005AD52    je          0005AD67
 0005AD54    push        esi
 0005AD55    xor         ecx,ecx
 0005AD57    mov         edx,0B004
 0005AD5C    mov         eax,dword ptr [ebx+200]
 0005AD62    call        TControl.Perform
 0005AD67    cmp         byte ptr [ebx+20F],2
>0005AD6E    jne         0005AD89
 0005AD70    mov         eax,ebx
 0005AD72    call        TCustomForm.GetActiveMDIChild
 0005AD77    test        eax,eax
>0005AD79    je          0005AD89
 0005AD7B    mov         eax,ebx
 0005AD7D    call        TCustomForm.GetActiveMDIChild
 0005AD82    mov         edx,esi
 0005AD84    call        TCustomForm.SendCancelMode
 0005AD89    pop         esi
 0005AD8A    pop         ebx
 0005AD8B    ret
*}
end;

//0005AD8C
procedure TCustomForm.MergeMenu(MergeState:Boolean);
begin
{*
 0005AD8C    push        ebx
 0005AD8D    push        esi
 0005AD8E    push        ecx
 0005AD8F    mov         byte ptr [esp],dl
 0005AD92    mov         ebx,eax
 0005AD94    test        byte ptr [ebx+2C0],8
>0005AD9B    jne         0005AE91
 0005ADA1    mov         eax,[000B67B0];Application:TApplication
 0005ADA6    cmp         dword ptr [eax+30],0
>0005ADAA    je          0005AE91
 0005ADB0    mov         eax,[000B67B0];Application:TApplication
 0005ADB5    mov         eax,dword ptr [eax+30]
 0005ADB8    cmp         dword ptr [eax+228],0
>0005ADBF    je          0005AE91
 0005ADC5    mov         eax,[000B67B0];Application:TApplication
 0005ADCA    cmp         ebx,dword ptr [eax+30]
>0005ADCD    je          0005AE91
 0005ADD3    cmp         byte ptr [ebx+20F],1
>0005ADDA    je          0005ADF1
 0005ADDC    mov         eax,[000B67B0];Application:TApplication
 0005ADE1    mov         eax,dword ptr [eax+30]
 0005ADE4    cmp         byte ptr [eax+20F],2
>0005ADEB    je          0005AE91
 0005ADF1    xor         eax,eax
 0005ADF3    test        byte ptr [ebx+20],10
>0005ADF7    jne         0005AE1D
 0005ADF9    cmp         dword ptr [ebx+228],0
>0005AE00    je          0005AE1D
 0005AE02    mov         edx,dword ptr [ebx+228]
 0005AE08    cmp         byte ptr [edx+4C],0
>0005AE0C    jne         0005AE17
 0005AE0E    cmp         byte ptr [ebx+20F],1
>0005AE15    jne         0005AE1D
 0005AE17    mov         eax,dword ptr [ebx+228]
 0005AE1D    mov         edx,dword ptr ds:[0B67B0];Application:TApplication
 0005AE23    mov         edx,dword ptr [edx+30]
 0005AE26    mov         edx,dword ptr [edx+228]
 0005AE2C    cmp         byte ptr [esp],0
>0005AE30    je          0005AE3A
 0005AE32    xchg        eax,edx
 0005AE33    call        TMainMenu.Merge
>0005AE38    jmp         0005AE40
 0005AE3A    xchg        eax,edx
 0005AE3B    call        TMainMenu.Unmerge
 0005AE40    cmp         byte ptr [esp],0
>0005AE44    je          0005AE91
 0005AE46    cmp         byte ptr [ebx+20F],1
>0005AE4D    jne         0005AE91
 0005AE4F    cmp         byte ptr [ebx+20B],2
>0005AE56    jne         0005AE91
 0005AE58    mov         eax,ebx
 0005AE5A    call        TControl.GetClientWidth
 0005AE5F    mov         esi,eax
 0005AE61    mov         eax,ebx
 0005AE63    call        TControl.GetClientHeight
 0005AE68    shl         eax,10
 0005AE6B    add         esi,eax
 0005AE6D    push        esi
 0005AE6E    push        0
 0005AE70    push        5
 0005AE72    mov         eax,ebx
 0005AE74    call        TWinControl.GetHandle
 0005AE79    push        eax
 0005AE7A    call        user32.SendMessageA
 0005AE7F    push        esi
 0005AE80    push        2
 0005AE82    push        5
 0005AE84    mov         eax,ebx
 0005AE86    call        TWinControl.GetHandle
 0005AE8B    push        eax
 0005AE8C    call        user32.SendMessageA
 0005AE91    pop         edx
 0005AE92    pop         esi
 0005AE93    pop         ebx
 0005AE94    ret
*}
end;

//0005AE98
{*procedure sub_0005AE98(?:?; ?:TWinControl; ?:TCustomForm);
begin
 0005AE98    push        ebx
 0005AE99    push        esi
 0005AE9A    push        edi
 0005AE9B    push        ebp
 0005AE9C    mov         edi,ecx
 0005AE9E    mov         ebx,edx
 0005AEA0    mov         ebp,eax
 0005AEA2    test        ebx,ebx
>0005AEA4    je          0005AEDC
>0005AEA6    jmp         0005AEAA
 0005AEA8    mov         ebx,esi
 0005AEAA    mov         esi,dword ptr [ebx+24]
 0005AEAD    test        esi,esi
>0005AEAF    je          0005AEC2
 0005AEB1    mov         eax,ebx
 0005AEB3    mov         edx,dword ptr ds:[55208];TCustomForm
 0005AEB9    call        @IsClass
 0005AEBE    test        al,al
>0005AEC0    je          0005AEA8
 0005AEC2    test        ebx,ebx
>0005AEC4    je          0005AEDC
 0005AEC6    cmp         edi,ebx
>0005AEC8    je          0005AEDC
 0005AECA    push        0
 0005AECC    push        0
 0005AECE    push        ebp
 0005AECF    mov         eax,ebx
 0005AED1    call        TWinControl.GetHandle
 0005AED6    push        eax
 0005AED7    call        user32.SendMessageA
 0005AEDC    pop         ebp
 0005AEDD    pop         edi
 0005AEDE    pop         esi
 0005AEDF    pop         ebx
 0005AEE0    ret
end;*}

//0005AEE4
procedure TCustomForm.sub_0005AEE4;
begin
{*
 0005AEE4    push        ebx
 0005AEE5    mov         ebx,eax
 0005AEE7    mov         ecx,ebx
 0005AEE9    mov         edx,dword ptr [ebx+200];TCustomForm.FActiveControl:TWinControl
 0005AEEF    mov         eax,0B000
 0005AEF4    call        0005AE98
 0005AEF9    cmp         word ptr [ebx+266],0;TCustomForm.?f266:word
>0005AF01    je          0005AF11
 0005AF03    mov         edx,ebx
 0005AF05    mov         eax,dword ptr [ebx+268];TCustomForm.?f268:dword
 0005AF0B    call        dword ptr [ebx+264];TCustomForm.FOnActivate
 0005AF11    pop         ebx
 0005AF12    ret
*}
end;

//0005AF14
procedure TCustomForm.sub_0005AF14;
begin
{*
 0005AF14    push        ebx
 0005AF15    mov         ebx,eax
 0005AF17    mov         ecx,ebx
 0005AF19    mov         edx,dword ptr [ebx+200];TCustomForm.FActiveControl:TWinControl
 0005AF1F    mov         eax,0B001
 0005AF24    call        0005AE98
 0005AF29    cmp         word ptr [ebx+27E],0;TCustomForm.?f27E:word
>0005AF31    je          0005AF41
 0005AF33    mov         edx,ebx
 0005AF35    mov         eax,dword ptr [ebx+280];TCustomForm.?f280:dword
 0005AF3B    call        dword ptr [ebx+27C];TCustomForm.FOnDeactivate
 0005AF41    pop         ebx
 0005AF42    ret
*}
end;

//0005AF44
procedure TCustomForm.Paint;
begin
{*
 0005AF44    push        ebx
 0005AF45    cmp         word ptr [eax+296],0
>0005AF4D    je          0005AF5F
 0005AF4F    mov         ebx,eax
 0005AF51    mov         edx,eax
 0005AF53    mov         eax,dword ptr [ebx+298]
 0005AF59    call        dword ptr [ebx+294]
 0005AF5F    pop         ebx
 0005AF60    ret
*}
end;

//0005AF64
function TCustomForm.GetIconHandle:HICON;
begin
{*
 0005AF64    mov         eax,dword ptr [eax+220]
 0005AF6A    call        TIcon.GetHandle
 0005AF6F    test        eax,eax
>0005AF71    jne         0005AF7D
 0005AF73    mov         eax,[000B67B0];Application:TApplication
 0005AF78    call        TApplication.GetIconHandle
 0005AF7D    ret
*}
end;

//0005AF80
procedure TCustomForm.PaintWindow(DC:HDC);
begin
{*
 0005AF80    push        ebp
 0005AF81    mov         ebp,esp
 0005AF83    push        ecx
 0005AF84    push        ebx
 0005AF85    mov         ebx,edx
 0005AF87    mov         dword ptr [ebp-4],eax
 0005AF8A    mov         eax,dword ptr [ebp-4]
 0005AF8D    mov         eax,dword ptr [eax+218]
 0005AF93    call        TCanvas.Lock
 0005AF98    xor         eax,eax
 0005AF9A    push        ebp
 0005AF9B    push        5B02D
 0005AFA0    push        dword ptr fs:[eax]
 0005AFA3    mov         dword ptr fs:[eax],esp
 0005AFA6    mov         eax,dword ptr [ebp-4]
 0005AFA9    mov         eax,dword ptr [eax+218]
 0005AFAF    mov         edx,ebx
 0005AFB1    call        TCanvas.SetHandle
 0005AFB6    xor         eax,eax
 0005AFB8    push        ebp
 0005AFB9    push        5B00A
 0005AFBE    push        dword ptr fs:[eax]
 0005AFC1    mov         dword ptr fs:[eax],esp
 0005AFC4    mov         eax,dword ptr [ebp-4]
 0005AFC7    cmp         dword ptr [eax+230],0
>0005AFCE    je          0005AFE0
 0005AFD0    mov         eax,dword ptr [ebp-4]
 0005AFD3    mov         eax,dword ptr [eax+230]
 0005AFD9    mov         edx,dword ptr [eax]
 0005AFDB    call        dword ptr [edx+28]
>0005AFDE    jmp         0005AFEC
 0005AFE0    mov         eax,dword ptr [ebp-4]
 0005AFE3    mov         bx,0FFB2
 0005AFE7    call        @CallDynaInst
 0005AFEC    xor         eax,eax
 0005AFEE    pop         edx
 0005AFEF    pop         ecx
 0005AFF0    pop         ecx
 0005AFF1    mov         dword ptr fs:[eax],edx
 0005AFF4    push        5B011
 0005AFF9    mov         eax,dword ptr [ebp-4]
 0005AFFC    mov         eax,dword ptr [eax+218]
 0005B002    xor         edx,edx
 0005B004    call        TCanvas.SetHandle
 0005B009    ret
>0005B00A    jmp         @HandleFinally
>0005B00F    jmp         0005AFF9
 0005B011    xor         eax,eax
 0005B013    pop         edx
 0005B014    pop         ecx
 0005B015    pop         ecx
 0005B016    mov         dword ptr fs:[eax],edx
 0005B019    push        5B034
 0005B01E    mov         eax,dword ptr [ebp-4]
 0005B021    mov         eax,dword ptr [eax+218]
 0005B027    call        TCanvas.Unlock
 0005B02C    ret
>0005B02D    jmp         @HandleFinally
>0005B032    jmp         0005B01E
 0005B034    pop         ebx
 0005B035    pop         ecx
 0005B036    pop         ebp
 0005B037    ret
*}
end;

//0005B038
procedure TCustomForm.PaletteChanged(Foreground:Boolean);
begin
{*
 0005B038    push        ebx
 0005B039    push        esi
 0005B03A    push        edi
 0005B03B    push        ebp
 0005B03C    add         esp,0FFFFFFF4
 0005B03F    mov         byte ptr [esp],dl
 0005B042    mov         ebp,eax
 0005B044    mov         byte ptr [esp+1],0
 0005B049    mov         eax,ebp
 0005B04B    call        TCustomForm.GetActiveMDIChild
 0005B050    mov         dword ptr [esp+8],eax
 0005B054    cmp         dword ptr [esp+8],0
>0005B059    je          0005B06F
 0005B05B    mov         dl,byte ptr [esp]
 0005B05E    mov         eax,dword ptr [esp+8]
 0005B062    mov         bx,0FFD7
 0005B066    call        @CallDynaInst
 0005B06B    mov         byte ptr [esp+1],al
 0005B06F    mov         eax,ebp
 0005B071    call        TCustomForm.GetMDIChildCount
 0005B076    mov         edi,eax
 0005B078    dec         edi
 0005B079    test        edi,edi
>0005B07B    jl          0005B0BF
 0005B07D    inc         edi
 0005B07E    mov         dword ptr [esp+4],0
 0005B086    mov         al,byte ptr [esp]
 0005B089    and         al,byte ptr [esp+1]
>0005B08D    jne         0005B0D6
 0005B08F    mov         edx,dword ptr [esp+4]
 0005B093    mov         eax,ebp
 0005B095    call        TCustomForm.GetMDIChildren
 0005B09A    mov         esi,eax
 0005B09C    cmp         esi,dword ptr [esp+8]
>0005B0A0    je          0005B0B8
 0005B0A2    mov         dl,byte ptr [esp]
 0005B0A5    mov         eax,esi
 0005B0A7    mov         bx,0FFD7
 0005B0AB    call        @CallDynaInst
 0005B0B0    or          al,byte ptr [esp+1]
 0005B0B4    mov         byte ptr [esp+1],al
 0005B0B8    inc         dword ptr [esp+4]
 0005B0BC    dec         edi
>0005B0BD    jne         0005B086
 0005B0BF    mov         al,byte ptr [esp]
 0005B0C2    and         al,byte ptr [esp+1]
>0005B0C6    jne         0005B0D6
 0005B0C8    mov         dl,byte ptr [esp]
 0005B0CB    mov         eax,ebp
 0005B0CD    call        TWinControl.PaletteChanged
 0005B0D2    mov         byte ptr [esp+1],al
 0005B0D6    mov         al,byte ptr [esp+1]
 0005B0DA    add         esp,0C
 0005B0DD    pop         ebp
 0005B0DE    pop         edi
 0005B0DF    pop         esi
 0005B0E0    pop         ebx
 0005B0E1    ret
*}
end;

//0005B0E4
procedure TCustomForm.WMPaint(var Message:TWMPaint);
begin
{*
 0005B0E4    push        ebx
 0005B0E5    push        esi
 0005B0E6    add         esp,0FFFFFFC0
 0005B0E9    mov         esi,edx
 0005B0EB    mov         ebx,eax
 0005B0ED    mov         eax,ebx
 0005B0EF    call        TWinControl.GetHandle
 0005B0F4    push        eax
 0005B0F5    call        user32.IsIconic
 0005B0FA    test        eax,eax
>0005B0FC    jne         0005B127
 0005B0FE    mov         ax,[0005B160]
 0005B104    or          ax,word ptr [ebx+44]
 0005B108    mov         word ptr [ebx+44],ax
 0005B10C    mov         edx,esi
 0005B10E    mov         eax,ebx
 0005B110    call        TWinControl.WMPaint
 0005B115    mov         ax,[0005B160]
 0005B11B    not         eax
 0005B11D    and         ax,word ptr [ebx+44]
 0005B121    mov         word ptr [ebx+44],ax
>0005B125    jmp         0005B157
 0005B127    push        esp
 0005B128    mov         eax,ebx
 0005B12A    call        TWinControl.GetHandle
 0005B12F    push        eax
 0005B130    call        user32.BeginPaint
 0005B135    mov         esi,eax
 0005B137    mov         eax,ebx
 0005B139    call        TCustomForm.GetIconHandle
 0005B13E    push        eax
 0005B13F    push        0
 0005B141    push        0
 0005B143    push        esi
 0005B144    call        user32.DrawIcon
 0005B149    push        esp
 0005B14A    mov         eax,ebx
 0005B14C    call        TWinControl.GetHandle
 0005B151    push        eax
 0005B152    call        user32.EndPaint
 0005B157    add         esp,40
 0005B15A    pop         esi
 0005B15B    pop         ebx
 0005B15C    ret
*}
end;

//0005B164
procedure TCustomForm.WMIconEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 0005B164    push        ebx
 0005B165    push        esi
 0005B166    add         esp,0FFFFFFF0
 0005B169    mov         esi,edx
 0005B16B    mov         ebx,eax
 0005B16D    cmp         byte ptr [ebx+20F],1
>0005B174    jne         0005B1BD
 0005B176    cmp         byte ptr [ebx+20F],1
>0005B17D    jne         0005B1B4
 0005B17F    test        byte ptr [ebx+20],10
>0005B183    jne         0005B1B4
 0005B185    mov         eax,[000B67B0];Application:TApplication
 0005B18A    mov         eax,dword ptr [eax+30]
 0005B18D    mov         eax,dword ptr [eax+124]
 0005B193    call        TBrush.GetHandle
 0005B198    push        eax
 0005B199    lea         edx,[esp+4]
 0005B19D    mov         eax,ebx
 0005B19F    mov         ecx,dword ptr [eax]
 0005B1A1    call        dword ptr [ecx+44]
 0005B1A4    lea         eax,[esp+4]
 0005B1A8    push        eax
 0005B1A9    mov         eax,dword ptr [esi+4]
 0005B1AC    push        eax
 0005B1AD    call        user32.FillRect
>0005B1B2    jmp         0005B1BD
 0005B1B4    mov         edx,esi
 0005B1B6    mov         eax,ebx
 0005B1B8    mov         ecx,dword ptr [eax]
 0005B1BA    call        dword ptr [ecx-10]
 0005B1BD    add         esp,10
 0005B1C0    pop         esi
 0005B1C1    pop         ebx
 0005B1C2    ret
*}
end;

//0005B1C4
procedure TCustomForm.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 0005B1C4    push        ebx
 0005B1C5    push        esi
 0005B1C6    mov         esi,edx
 0005B1C8    mov         ebx,eax
 0005B1CA    mov         eax,ebx
 0005B1CC    call        TWinControl.GetHandle
 0005B1D1    push        eax
 0005B1D2    call        user32.IsIconic
 0005B1D7    test        eax,eax
>0005B1D9    jne         0005B1E7
 0005B1DB    mov         edx,esi
 0005B1DD    mov         eax,ebx
 0005B1DF    call        TWinControl.WMEraseBkgnd
 0005B1E4    pop         esi
 0005B1E5    pop         ebx
 0005B1E6    ret
 0005B1E7    mov         dword ptr [esi],27
 0005B1ED    mov         edx,esi
 0005B1EF    mov         eax,ebx
 0005B1F1    mov         ecx,dword ptr [eax]
 0005B1F3    call        dword ptr [ecx-10]
 0005B1F6    pop         esi
 0005B1F7    pop         ebx
 0005B1F8    ret
*}
end;

//0005B1FC
procedure TCustomForm.WMQueryDragIcon(var Message:TWMQueryDragIcon);
begin
{*
 0005B1FC    push        ebx
 0005B1FD    push        esi
 0005B1FE    mov         esi,edx
 0005B200    mov         ebx,eax
 0005B202    mov         eax,ebx
 0005B204    call        TCustomForm.GetIconHandle
 0005B209    mov         dword ptr [esi+0C],eax
 0005B20C    pop         esi
 0005B20D    pop         ebx
 0005B20E    ret
*}
end;

//0005B210
procedure ModifySystemMenu;
begin
{*
 0005B210    push        ebp
 0005B211    mov         ebp,esp
 0005B213    push        ebx
 0005B214    mov         eax,dword ptr [ebp+8]
 0005B217    mov         eax,dword ptr [eax-4]
 0005B21A    cmp         byte ptr [eax+209],0
>0005B221    je          0005B306
 0005B227    mov         eax,dword ptr [ebp+8]
 0005B22A    mov         eax,dword ptr [eax-4]
 0005B22D    test        byte ptr [eax+208],1
>0005B234    je          0005B306
 0005B23A    mov         eax,dword ptr [ebp+8]
 0005B23D    mov         eax,dword ptr [eax-4]
 0005B240    cmp         byte ptr [eax+20F],1
>0005B247    je          0005B306
 0005B24D    push        0
 0005B24F    mov         eax,dword ptr [ebp+8]
 0005B252    mov         eax,dword ptr [eax-4]
 0005B255    call        TWinControl.GetHandle
 0005B25A    push        eax
 0005B25B    call        user32.GetSystemMenu
 0005B260    mov         ebx,eax
 0005B262    mov         eax,dword ptr [ebp+8]
 0005B265    mov         eax,dword ptr [eax-4]
 0005B268    cmp         byte ptr [eax+209],3
>0005B26F    jne         0005B2CE
 0005B271    push        0
 0005B273    push        0F130
 0005B278    push        ebx
 0005B279    call        user32.DeleteMenu
 0005B27E    push        400
 0005B283    push        7
 0005B285    push        ebx
 0005B286    call        user32.DeleteMenu
 0005B28B    push        400
 0005B290    push        5
 0005B292    push        ebx
 0005B293    call        user32.DeleteMenu
 0005B298    push        0
 0005B29A    push        0F030
 0005B29F    push        ebx
 0005B2A0    call        user32.DeleteMenu
 0005B2A5    push        0
 0005B2A7    push        0F020
 0005B2AC    push        ebx
 0005B2AD    call        user32.DeleteMenu
 0005B2B2    push        0
 0005B2B4    push        0F000
 0005B2B9    push        ebx
 0005B2BA    call        user32.DeleteMenu
 0005B2BF    push        0
 0005B2C1    push        0F120
 0005B2C6    push        ebx
 0005B2C7    call        user32.DeleteMenu
>0005B2CC    jmp         0005B306
 0005B2CE    mov         eax,dword ptr [ebp+8]
 0005B2D1    mov         eax,dword ptr [eax-4]
 0005B2D4    test        byte ptr [eax+208],2
>0005B2DB    jne         0005B2EA
 0005B2DD    push        1
 0005B2DF    push        0F020
 0005B2E4    push        ebx
 0005B2E5    call        user32.EnableMenuItem
 0005B2EA    mov         eax,dword ptr [ebp+8]
 0005B2ED    mov         eax,dword ptr [eax-4]
 0005B2F0    test        byte ptr [eax+208],4
>0005B2F7    jne         0005B306
 0005B2F9    push        1
 0005B2FB    push        0F030
 0005B300    push        ebx
 0005B301    call        user32.EnableMenuItem
 0005B306    pop         ebx
 0005B307    pop         ebp
 0005B308    ret
*}
end;

//0005B30C
procedure TCustomForm.WMNCCreate(var Message:TWMNCCreate);
begin
{*
 0005B30C    push        ebp
 0005B30D    mov         ebp,esp
 0005B30F    push        ecx
 0005B310    mov         dword ptr [ebp-4],eax
 0005B313    mov         eax,dword ptr [ebp-4]
 0005B316    mov         ecx,dword ptr [eax]
 0005B318    call        dword ptr [ecx-10]
 0005B31B    mov         eax,dword ptr [ebp-4]
 0005B31E    mov         edx,dword ptr [eax+228]
 0005B324    mov         eax,dword ptr [ebp-4]
 0005B327    call        TCustomForm.SetMenu
 0005B32C    mov         eax,dword ptr [ebp-4]
 0005B32F    test        byte ptr [eax+20],10
>0005B333    jne         0005B33C
 0005B335    push        ebp
 0005B336    call        ModifySystemMenu
 0005B33B    pop         ecx
 0005B33C    pop         ecx
 0005B33D    pop         ebp
 0005B33E    ret
*}
end;

//0005B340
procedure TCustomForm.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 0005B340    push        ebx
 0005B341    push        esi
 0005B342    mov         esi,edx
 0005B344    mov         ebx,eax
 0005B346    cmp         dword ptr [esi+4],2
>0005B34A    jne         0005B3B8
 0005B34C    cmp         byte ptr [ebx+87],1
>0005B353    jne         0005B3B8
 0005B355    test        byte ptr [ebx+20],10
>0005B359    jne         0005B3B8
 0005B35B    mov         eax,ebx
 0005B35D    call        TWinControl.GetHandle
 0005B362    push        eax
 0005B363    call        user32.IsIconic
 0005B368    test        eax,eax
>0005B36A    jne         0005B3B8
 0005B36C    push        7
 0005B36E    push        0
 0005B370    push        0
 0005B372    push        0
 0005B374    push        0
 0005B376    push        0
 0005B378    mov         eax,ebx
 0005B37A    call        TWinControl.GetHandle
 0005B37F    push        eax
 0005B380    call        user32.SetWindowPos
 0005B385    mov         eax,dword ptr [esi+8]
 0005B388    push        eax
 0005B389    mov         eax,dword ptr [esi+4]
 0005B38C    push        eax
 0005B38D    push        0A2
 0005B392    mov         eax,ebx
 0005B394    call        TWinControl.GetHandle
 0005B399    push        eax
 0005B39A    call        user32.PostMessageA
 0005B39F    mov         eax,ebx
 0005B3A1    mov         edx,dword ptr [eax]
 0005B3A3    call        dword ptr [edx+54]
 0005B3A6    mov         edx,eax
 0005B3A8    xor         dl,1
 0005B3AB    or          ecx,0FFFFFFFF
 0005B3AE    mov         eax,ebx
 0005B3B0    call        TControl.BeginDrag
 0005B3B5    pop         esi
 0005B3B6    pop         ebx
 0005B3B7    ret
 0005B3B8    mov         edx,esi
 0005B3BA    mov         eax,ebx
 0005B3BC    call        TControl.WMNCLButtonDown
 0005B3C1    pop         esi
 0005B3C2    pop         ebx
 0005B3C3    ret
*}
end;

//0005B3C4
procedure TCustomForm.WMDestroy(var Message:TWMDestroy);
begin
{*
 0005B3C4    push        ebx
 0005B3C5    push        esi
 0005B3C6    mov         esi,edx
 0005B3C8    mov         ebx,eax
 0005B3CA    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005B3CF    cmp         byte ptr [eax],0
>0005B3D2    je          0005B3EA
 0005B3D4    push        0
 0005B3D6    push        1
 0005B3D8    push        80
 0005B3DD    mov         eax,ebx
 0005B3DF    call        TWinControl.GetHandle
 0005B3E4    push        eax
 0005B3E5    call        user32.SendMessageA
 0005B3EA    cmp         dword ptr [ebx+228],0
>0005B3F1    je          0005B418
 0005B3F3    cmp         byte ptr [ebx+20F],1
>0005B3FA    je          0005B418
 0005B3FC    push        0
 0005B3FE    mov         eax,ebx
 0005B400    call        TWinControl.GetHandle
 0005B405    push        eax
 0005B406    call        user32.SetMenu
 0005B40B    xor         edx,edx
 0005B40D    mov         eax,dword ptr [ebx+228]
 0005B413    call        TMenu.SetWindowHandle
 0005B418    mov         edx,esi
 0005B41A    mov         eax,ebx
 0005B41C    call        TWinControl.WMDestroy
 0005B421    pop         esi
 0005B422    pop         ebx
 0005B423    ret
*}
end;

//0005B424
procedure TCustomForm.WMCommand(Message:TWMCharToItem);
begin
{*
 0005B424    push        ebx
 0005B425    push        esi
 0005B426    mov         esi,edx
 0005B428    mov         ebx,eax
 0005B42A    cmp         dword ptr [esi+8],0
>0005B42E    jne         0005B44C
 0005B430    cmp         dword ptr [ebx+228],0;TCustomForm.FMenu:TMainMenu
>0005B437    je          0005B44C
 0005B439    mov         dx,word ptr [esi+4]
 0005B43D    mov         eax,dword ptr [ebx+228];TCustomForm.FMenu:TMainMenu
 0005B443    call        TMenu.DispatchCommand
 0005B448    test        al,al
>0005B44A    jne         0005B455
 0005B44C    mov         edx,esi
 0005B44E    mov         eax,ebx
 0005B450    call        TWinControl.WMCharToItem
 0005B455    pop         esi
 0005B456    pop         ebx
 0005B457    ret
*}
end;

//0005B458
procedure TCustomForm.WMInitMenuPopup(var Message:TWMInitMenuPopup);
begin
{*
 0005B458    mov         ecx,dword ptr [eax+228]
 0005B45E    test        ecx,ecx
>0005B460    je          0005B46C
 0005B462    mov         edx,dword ptr [edx+4]
 0005B465    mov         eax,ecx
 0005B467    call        TMenu.DispatchPopup
 0005B46C    ret
*}
end;

//0005B470
procedure TCustomForm.WMMenuChar(var Message:TWMMenuChar);
begin
{*
 0005B470    push        esi
 0005B471    mov         esi,eax
 0005B473    mov         eax,dword ptr [esi+228]
 0005B479    test        eax,eax
>0005B47B    je          0005B484
 0005B47D    call        TMenu.ProcessMenuChar
 0005B482    pop         esi
 0005B483    ret
 0005B484    mov         eax,esi
 0005B486    mov         ecx,dword ptr [eax]
 0005B488    call        dword ptr [ecx-10]
 0005B48B    pop         esi
 0005B48C    ret
*}
end;

//0005B490
procedure TCustomForm.WMMenuSelect(var Message:TWMMenuSelect);
begin
{*
 0005B490    push        ebp
 0005B491    mov         ebp,esp
 0005B493    push        0
 0005B495    push        ebx
 0005B496    push        esi
 0005B497    push        edi
 0005B498    mov         edi,eax
 0005B49A    xor         eax,eax
 0005B49C    push        ebp
 0005B49D    push        5B52B
 0005B4A2    push        dword ptr fs:[eax]
 0005B4A5    mov         dword ptr fs:[eax],esp
 0005B4A8    cmp         dword ptr [edi+228],0
>0005B4AF    je          0005B515
 0005B4B1    xor         esi,esi
 0005B4B3    cmp         word ptr [edx+6],0FFFF
>0005B4B9    jne         0005B4C2
 0005B4BB    cmp         word ptr [edx+4],0
>0005B4C0    je          0005B4EB
 0005B4C2    xor         ebx,ebx
 0005B4C4    movzx       eax,word ptr [edx+4]
 0005B4C8    test        byte ptr [edx+6],10
>0005B4CC    je          0005B4DA
 0005B4CE    mov         bl,1
 0005B4D0    push        eax
 0005B4D1    mov         eax,dword ptr [edx+8]
 0005B4D4    push        eax
 0005B4D5    call        user32.GetSubMenu
 0005B4DA    mov         ecx,ebx
 0005B4DC    mov         edx,eax
 0005B4DE    mov         eax,dword ptr [edi+228]
 0005B4E4    call        TMenu.FindItem
 0005B4E9    mov         esi,eax
 0005B4EB    test        esi,esi
>0005B4ED    je          0005B509
 0005B4EF    lea         edx,[ebp-4]
 0005B4F2    mov         eax,dword ptr [esi+4C]
 0005B4F5    call        GetLongHint
 0005B4FA    mov         edx,dword ptr [ebp-4]
 0005B4FD    mov         eax,[000B67B0];Application:TApplication
 0005B502    call        TApplication.SetHint
>0005B507    jmp         0005B515
 0005B509    xor         edx,edx
 0005B50B    mov         eax,[000B67B0];Application:TApplication
 0005B510    call        TApplication.SetHint
 0005B515    xor         eax,eax
 0005B517    pop         edx
 0005B518    pop         ecx
 0005B519    pop         ecx
 0005B51A    mov         dword ptr fs:[eax],edx
 0005B51D    push        5B532
 0005B522    lea         eax,[ebp-4]
 0005B525    call        @LStrClr
 0005B52A    ret
>0005B52B    jmp         @HandleFinally
>0005B530    jmp         0005B522
 0005B532    pop         edi
 0005B533    pop         esi
 0005B534    pop         ebx
 0005B535    pop         ecx
 0005B536    pop         ebp
 0005B537    ret
*}
end;

//0005B538
procedure TCustomForm.WMActivate(var Message:TWMActivate);
begin
{*
 0005B538    cmp         byte ptr [eax+20F],2
>0005B53F    jne         0005B547
 0005B541    test        byte ptr [eax+20],10
>0005B545    je          0005B554
 0005B547    cmp         word ptr [edx+4],0
 0005B54C    setne       dl
 0005B54F    call        TCustomForm.SetActive
 0005B554    ret
*}
end;

//0005B558
procedure TCustomForm.WMSize(var Message:TWMSize);
begin
{*
 0005B558    push        ebx
 0005B559    push        esi
 0005B55A    mov         ebx,edx
 0005B55C    mov         esi,eax
 0005B55E    mov         edx,ebx
 0005B560    mov         eax,esi
 0005B562    call        TScrollingWinControl.WMSize
 0005B567    test        byte ptr [esi+20],10
>0005B56B    jne         0005B595
 0005B56D    mov         eax,dword ptr [ebx+4]
 0005B570    sub         eax,1
>0005B573    jb          0005B57C
>0005B575    je          0005B585
 0005B577    dec         eax
>0005B578    je          0005B58E
>0005B57A    jmp         0005B595
 0005B57C    mov         byte ptr [esi+20B],0
>0005B583    jmp         0005B595
 0005B585    mov         byte ptr [esi+20B],1
>0005B58C    jmp         0005B595
 0005B58E    mov         byte ptr [esi+20B],2
 0005B595    mov         eax,esi
 0005B597    mov         bx,0FFD6
 0005B59B    call        @CallDynaInst
 0005B5A0    cmp         dword ptr [esi+244],0
>0005B5A7    je          0005B5B4
 0005B5A9    mov         eax,dword ptr [esi+244]
 0005B5AF    mov         edx,dword ptr [eax]
 0005B5B1    call        dword ptr [edx+10]
 0005B5B4    mov         eax,esi
 0005B5B6    call        TScrollingWinControl.CalcAutoRange
 0005B5BB    pop         esi
 0005B5BC    pop         ebx
 0005B5BD    ret
*}
end;

//0005B5C0
procedure TCustomForm.WMClose;
begin
{*
 0005B5C0    call        TCustomForm.Close
 0005B5C5    ret
*}
end;

//0005B5C8
procedure TCustomForm.WMQueryEndSession(var Message:TWMQueryEndSession);
begin
{*
 0005B5C8    push        ebx
 0005B5C9    push        esi
 0005B5CA    mov         esi,edx
 0005B5CC    mov         ebx,eax
 0005B5CE    mov         eax,ebx
 0005B5D0    mov         edx,dword ptr [eax]
 0005B5D2    call        dword ptr [edx+0C4]
 0005B5D8    test        al,al
>0005B5DA    je          0005B5E5
 0005B5DC    call        CallTerminateProcs
 0005B5E1    test        al,al
>0005B5E3    jne         0005B5E9
 0005B5E5    xor         eax,eax
>0005B5E7    jmp         0005B5EB
 0005B5E9    mov         al,1
 0005B5EB    and         eax,7F
 0005B5EE    mov         dword ptr [esi+0C],eax
 0005B5F1    pop         esi
 0005B5F2    pop         ebx
 0005B5F3    ret
*}
end;

//0005B5F4
procedure TCustomForm.CMAppSysCommand(var Message:TMessage);
begin
{*
 0005B5F4    push        ebx
 0005B5F5    push        esi
 0005B5F6    mov         ebx,edx
 0005B5F8    xor         edx,edx
 0005B5FA    mov         dword ptr [ebx+0C],edx
 0005B5FD    test        byte ptr [eax+20],10
>0005B601    jne         0005B621
 0005B603    cmp         byte ptr [eax+20F],1
>0005B60A    je          0005B621
 0005B60C    cmp         dword ptr [eax+228],0
>0005B613    je          0005B621
 0005B615    mov         edx,dword ptr [eax+228]
 0005B61B    cmp         byte ptr [edx+4C],0
>0005B61F    je          0005B647
 0005B621    mov         esi,dword ptr [ebx+8]
 0005B624    xor         edx,edx
 0005B626    call        TCustomForm.SendCancelMode
 0005B62B    movzx       ecx,word ptr [esi+8]
 0005B62F    mov         edx,dword ptr [esi+4]
 0005B632    mov         eax,0B017
 0005B637    call        SendAppMessage
 0005B63C    test        eax,eax
>0005B63E    je          0005B647
 0005B640    mov         dword ptr [ebx+0C],1
 0005B647    pop         esi
 0005B648    pop         ebx
 0005B649    ret
*}
end;

//0005B64C
procedure TCustomForm.WMSysCommand(var Message:TWMSysCommand);
begin
{*
 0005B64C    push        ebx
 0005B64D    push        esi
 0005B64E    mov         esi,edx
 0005B650    mov         ebx,eax
 0005B652    mov         eax,dword ptr [esi+4]
 0005B655    and         eax,0FFF0
 0005B65A    cmp         eax,0F020
>0005B65F    jne         0005B677
 0005B661    mov         eax,[000B67B0];Application:TApplication
 0005B666    cmp         ebx,dword ptr [eax+30]
>0005B669    jne         0005B677
 0005B66B    mov         eax,[000B67B0];Application:TApplication
 0005B670    call        TApplication.Minimize
>0005B675    jmp         0005B6A4
 0005B677    mov         eax,dword ptr [esi+4]
 0005B67A    and         eax,0FFF0
 0005B67F    cmp         eax,0F010
>0005B684    jne         0005B69B
 0005B686    test        byte ptr [ebx+20],10
>0005B68A    jne         0005B69B
 0005B68C    cmp         byte ptr [ebx+4B],0
>0005B690    je          0005B69B
 0005B692    cmp         byte ptr [ebx+20B],1
>0005B699    jne         0005B6A4
 0005B69B    mov         edx,esi
 0005B69D    mov         eax,ebx
 0005B69F    call        TWinControl.WMSysCommand
 0005B6A4    mov         eax,dword ptr [esi+4]
 0005B6A7    and         eax,0FFF0
 0005B6AC    cmp         eax,0F020
>0005B6B1    je          0005B6BA
 0005B6B3    cmp         eax,0F120
>0005B6B8    jne         0005B6D1
 0005B6BA    test        byte ptr [ebx+20],10
>0005B6BE    jne         0005B6D1
 0005B6C0    cmp         byte ptr [ebx+4B],0
>0005B6C4    je          0005B6D1
 0005B6C6    mov         eax,ebx
 0005B6C8    mov         bx,0FFD6
 0005B6CC    call        @CallDynaInst
 0005B6D1    pop         esi
 0005B6D2    pop         ebx
 0005B6D3    ret
*}
end;

//0005B6D4
procedure TCustomForm.WMShowWindow(var Message:TWMShowWindow);
begin
{*
 0005B6D4    push        ebx
 0005B6D5    push        esi
 0005B6D6    mov         esi,edx
 0005B6D8    mov         ebx,eax
 0005B6DA    mov         eax,dword ptr [esi+8]
 0005B6DD    dec         eax
>0005B6DE    je          0005B6E7
 0005B6E0    sub         eax,2
>0005B6E3    je          0005B72E
>0005B6E5    jmp         0005B75E
 0005B6E7    mov         eax,ebx
 0005B6E9    call        TWinControl.GetHandle
 0005B6EE    push        eax
 0005B6EF    call        user32.IsIconic
 0005B6F4    test        eax,eax
>0005B6F6    je          0005B701
 0005B6F8    mov         byte ptr [ebx+20C],2
>0005B6FF    jmp         0005B722
 0005B701    mov         eax,ebx
 0005B703    call        TWinControl.GetHandle
 0005B708    push        eax
 0005B709    call        user32.IsZoomed
 0005B70E    test        eax,eax
>0005B710    je          0005B71B
 0005B712    mov         byte ptr [ebx+20C],3
>0005B719    jmp         0005B722
 0005B71B    mov         byte ptr [ebx+20C],1
 0005B722    mov         edx,esi
 0005B724    mov         eax,ebx
 0005B726    mov         ecx,dword ptr [eax]
 0005B728    call        dword ptr [ecx-10]
 0005B72B    pop         esi
 0005B72C    pop         ebx
 0005B72D    ret
 0005B72E    cmp         byte ptr [ebx+20C],0
>0005B735    je          0005B767
 0005B737    xor         eax,eax
 0005B739    mov         al,byte ptr [ebx+20C]
 0005B73F    mov         eax,dword ptr [eax*4+0B4A44]
 0005B746    push        eax
 0005B747    mov         eax,ebx
 0005B749    call        TWinControl.GetHandle
 0005B74E    push        eax
 0005B74F    call        user32.ShowWindow
 0005B754    mov         byte ptr [ebx+20C],0
 0005B75B    pop         esi
 0005B75C    pop         ebx
 0005B75D    ret
 0005B75E    mov         edx,esi
 0005B760    mov         eax,ebx
 0005B762    mov         ecx,dword ptr [eax]
 0005B764    call        dword ptr [ecx-10]
 0005B767    pop         esi
 0005B768    pop         ebx
 0005B769    ret
*}
end;

//0005B76C
procedure TCustomForm.WMMDIActivate(var Message:TWMMDIActivate);
begin
{*
 0005B76C    push        ebx
 0005B76D    push        esi
 0005B76E    mov         ebx,edx
 0005B770    mov         esi,eax
 0005B772    mov         edx,ebx
 0005B774    mov         eax,esi
 0005B776    mov         ecx,dword ptr [eax]
 0005B778    call        dword ptr [ecx-10]
 0005B77B    cmp         byte ptr [esi+20F],1
>0005B782    jne         0005B7C1
 0005B784    mov         eax,esi
 0005B786    call        TWinControl.GetHandle
 0005B78B    cmp         eax,dword ptr [ebx+8]
 0005B78E    sete        al
 0005B791    mov         ebx,eax
 0005B793    mov         edx,ebx
 0005B795    mov         eax,esi
 0005B797    call        TCustomForm.SetActive
 0005B79C    test        bl,bl
>0005B79E    je          0005B7C1
 0005B7A0    mov         eax,[000B67B0];Application:TApplication
 0005B7A5    mov         eax,dword ptr [eax+30]
 0005B7A8    test        byte ptr [eax+44],4
>0005B7AC    je          0005B7C1
 0005B7AE    mov         eax,[000B67B0];Application:TApplication
 0005B7B3    mov         eax,dword ptr [eax+30]
 0005B7B6    mov         dl,1
 0005B7B8    mov         bx,0FFD7
 0005B7BC    call        @CallDynaInst
 0005B7C1    pop         esi
 0005B7C2    pop         ebx
 0005B7C3    ret
*}
end;

//0005B7C4
procedure TCustomForm.WMNextDlgCtl(var Message:TWMNextDlgCtl);
begin
{*
 0005B7C4    cmp         word ptr [edx+8],0
>0005B7C9    je          0005B7D5
 0005B7CB    mov         eax,dword ptr [edx+4]
 0005B7CE    push        eax
 0005B7CF    call        user32.SetFocus
 0005B7D4    ret
 0005B7D5    push        1
 0005B7D7    mov         ecx,dword ptr [edx+4]
 0005B7DA    cmp         ecx,1
 0005B7DD    sbb         ecx,ecx
 0005B7DF    neg         ecx
 0005B7E1    mov         edx,dword ptr [eax+200]
 0005B7E7    call        TWinControl.SelectNext
 0005B7EC    ret
*}
end;

//0005B7F0
procedure TCustomForm.WMEnterMenuLoop(var Message:TMessage);
begin
{*
 0005B7F0    push        ebx
 0005B7F1    push        esi
 0005B7F2    mov         esi,edx
 0005B7F4    mov         ebx,eax
 0005B7F6    xor         edx,edx
 0005B7F8    mov         eax,ebx
 0005B7FA    call        TCustomForm.SendCancelMode
 0005B7FF    mov         edx,esi
 0005B801    mov         eax,ebx
 0005B803    mov         ecx,dword ptr [eax]
 0005B805    call        dword ptr [ecx-10]
 0005B808    pop         esi
 0005B809    pop         ebx
 0005B80A    ret
*}
end;

//0005B80C
function GetMenuHelpContext(Menu:TMenu):Integer;
begin
{*
 0005B80C    push        ebp
 0005B80D    mov         ebp,esp
 0005B80F    push        ebx
 0005B810    mov         ebx,eax
 0005B812    xor         eax,eax
 0005B814    test        ebx,ebx
>0005B816    je          0005B846
 0005B818    mov         eax,dword ptr [ebp+8]
 0005B81B    mov         eax,dword ptr [eax-4]
 0005B81E    mov         eax,dword ptr [eax+8]
 0005B821    mov         edx,dword ptr [eax+8]
 0005B824    mov         cl,1
 0005B826    mov         eax,ebx
 0005B828    call        TMenu.GetHelpContext
 0005B82D    test        eax,eax
>0005B82F    jne         0005B846
 0005B831    mov         eax,dword ptr [ebp+8]
 0005B834    mov         eax,dword ptr [eax-4]
 0005B837    mov         eax,dword ptr [eax+8]
 0005B83A    mov         edx,dword ptr [eax+0C]
 0005B83D    xor         ecx,ecx
 0005B83F    mov         eax,ebx
 0005B841    call        TMenu.GetHelpContext
 0005B846    pop         ebx
 0005B847    pop         ebp
 0005B848    ret
*}
end;

//0005B84C
procedure TCustomForm.WMHelp(var Message:TWMHelp);
begin
{*
 0005B84C    push        ebp
 0005B84D    mov         ebp,esp
 0005B84F    add         esp,0FFFFFFE8
 0005B852    push        ebx
 0005B853    push        esi
 0005B854    push        edi
 0005B855    mov         dword ptr [ebp-4],edx
 0005B858    mov         esi,eax
 0005B85A    test        byte ptr [esi+20],10
>0005B85E    je          0005B86F
 0005B860    mov         edx,dword ptr [ebp-4]
 0005B863    mov         eax,esi
 0005B865    mov         ecx,dword ptr [eax]
 0005B867    call        dword ptr [ecx-10]
>0005B86A    jmp         0005B948
 0005B86F    mov         eax,dword ptr [ebp-4]
 0005B872    mov         eax,dword ptr [eax+8]
 0005B875    cmp         dword ptr [eax+4],1
>0005B879    jne         0005B8CB
 0005B87B    mov         eax,dword ptr [eax+0C]
 0005B87E    call        FindControl
 0005B883    mov         ebx,eax
>0005B885    jmp         0005B88A
 0005B887    mov         ebx,dword ptr [ebx+24]
 0005B88A    test        ebx,ebx
>0005B88C    je          0005B897
 0005B88E    cmp         dword ptr [ebx+144],0
>0005B895    je          0005B887
 0005B897    test        ebx,ebx
>0005B899    je          0005B948
 0005B89F    mov         edi,dword ptr [ebx+144]
 0005B8A5    lea         ecx,[ebp-18]
 0005B8A8    xor         edx,edx
 0005B8AA    xor         eax,eax
 0005B8AC    call        Point
 0005B8B1    lea         edx,[ebp-18]
 0005B8B4    lea         ecx,[ebp-10]
 0005B8B7    mov         eax,ebx
 0005B8B9    call        TControl.ClientToScreen
 0005B8BE    lea         eax,[ebp-10]
 0005B8C1    call        PointToSmallPoint
 0005B8C6    mov         dword ptr [ebp-8],eax
>0005B8C9    jmp         0005B90E
 0005B8CB    push        ebp
 0005B8CC    mov         eax,dword ptr [esi+228]
 0005B8D2    call        GetMenuHelpContext
 0005B8D7    pop         ecx
 0005B8D8    mov         edi,eax
 0005B8DA    test        edi,edi
>0005B8DC    jne         0005B8EA
 0005B8DE    push        ebp
 0005B8DF    mov         eax,dword ptr [esi+70]
 0005B8E2    call        GetMenuHelpContext
 0005B8E7    pop         ecx
 0005B8E8    mov         edi,eax
 0005B8EA    lea         ecx,[ebp-18]
 0005B8ED    xor         edx,edx
 0005B8EF    xor         eax,eax
 0005B8F1    call        Point
 0005B8F6    lea         edx,[ebp-18]
 0005B8F9    lea         ecx,[ebp-10]
 0005B8FC    mov         eax,esi
 0005B8FE    call        TControl.ClientToScreen
 0005B903    lea         eax,[ebp-10]
 0005B906    call        PointToSmallPoint
 0005B90B    mov         dword ptr [ebp-8],eax
 0005B90E    test        byte ptr [esi+208],8
>0005B915    je          0005B93C
 0005B917    mov         ecx,dword ptr [ebp-8]
 0005B91A    mov         edx,0D
 0005B91F    mov         eax,[000B67B0];Application:TApplication
 0005B924    call        TApplication.HelpCommand
 0005B929    mov         ecx,edi
 0005B92B    mov         edx,8
 0005B930    mov         eax,[000B67B0];Application:TApplication
 0005B935    call        TApplication.HelpCommand
>0005B93A    jmp         0005B948
 0005B93C    mov         edx,edi
 0005B93E    mov         eax,[000B67B0];Application:TApplication
 0005B943    call        TApplication.HelpContext
 0005B948    pop         edi
 0005B949    pop         esi
 0005B94A    pop         ebx
 0005B94B    mov         esp,ebp
 0005B94D    pop         ebp
 0005B94E    ret
*}
end;

//0005B950
procedure TCustomForm.WMGetMinMaxInfo(var Message:TWMGetMinMaxInfo);
begin
{*
 0005B950    push        ebx
 0005B951    push        esi
 0005B952    push        ecx
 0005B953    mov         dword ptr [esp],edx
 0005B956    mov         esi,eax
 0005B958    test        byte ptr [esi+20],2
>0005B95C    jne         0005B9B3
 0005B95E    cmp         byte ptr [esi+20A],0
>0005B965    je          0005B9B3
 0005B967    mov         edx,dword ptr [esp]
 0005B96A    mov         edx,dword ptr [edx+8]
 0005B96D    mov         eax,dword ptr [esi+68]
 0005B970    lea         ecx,[edx+18]
 0005B973    mov         ebx,dword ptr [eax+14]
 0005B976    test        ebx,ebx
>0005B978    jbe         0005B97C
 0005B97A    mov         dword ptr [ecx],ebx
 0005B97C    mov         ebx,dword ptr [eax+10]
 0005B97F    test        ebx,ebx
>0005B981    jbe         0005B986
 0005B983    mov         dword ptr [ecx+4],ebx
 0005B986    lea         ecx,[edx+20]
 0005B989    mov         ebx,dword ptr [eax+0C]
 0005B98C    test        ebx,ebx
>0005B98E    jbe         0005B992
 0005B990    mov         dword ptr [ecx],ebx
 0005B992    mov         ebx,dword ptr [eax+8]
 0005B995    test        ebx,ebx
>0005B997    jbe         0005B99C
 0005B999    mov         dword ptr [ecx+4],ebx
 0005B99C    lea         eax,[edx+20]
 0005B99F    push        eax
 0005B9A0    lea         eax,[edx+24]
 0005B9A3    push        eax
 0005B9A4    lea         ecx,[edx+1C]
 0005B9A7    lea         eax,[edx+18]
 0005B9AA    mov         edx,eax
 0005B9AC    mov         eax,esi
 0005B9AE    mov         ebx,dword ptr [eax]
 0005B9B0    call        dword ptr [ebx+3C]
 0005B9B3    mov         edx,dword ptr [esp]
 0005B9B6    mov         eax,esi
 0005B9B8    mov         ecx,dword ptr [eax]
 0005B9BA    call        dword ptr [ecx-10]
 0005B9BD    pop         edx
 0005B9BE    pop         esi
 0005B9BF    pop         ebx
 0005B9C0    ret
*}
end;

//0005B9C4
procedure TCustomForm.WMWindowPosChanging(var Message:TWMWindowPosChanging);
begin
{*
 0005B9C4    push        ebp
 0005B9C5    mov         ebp,esp
 0005B9C7    push        ecx
 0005B9C8    push        ebx
 0005B9C9    push        esi
 0005B9CA    mov         esi,edx
 0005B9CC    mov         dword ptr [ebp-4],eax
 0005B9CF    mov         ebx,dword ptr [esi+8]
 0005B9D2    mov         eax,dword ptr [ebp-4]
 0005B9D5    mov         al,byte ptr [eax+20]
 0005B9D8    and         al,byte ptr ds:[5BA50]
 0005B9DE    mov         dl,byte ptr ds:[5BA54]
 0005B9E4    cmp         dl,al
>0005B9E6    jne         0005BA04
 0005B9E8    test        byte ptr [ebx+18],1
>0005B9EC    jne         0005BA04
 0005B9EE    mov         eax,dword ptr [ebx+10]
 0005B9F1    mov         edx,dword ptr [ebp-4]
 0005B9F4    cmp         eax,dword ptr [edx+38]
>0005B9F7    jne         0005BA08
 0005B9F9    mov         eax,dword ptr [ebx+14]
 0005B9FC    mov         edx,dword ptr [ebp-4]
 0005B9FF    cmp         eax,dword ptr [edx+3C]
>0005BA02    jne         0005BA08
 0005BA04    xor         eax,eax
>0005BA06    jmp         0005BA0A
 0005BA08    mov         al,1
 0005BA0A    mov         edx,dword ptr [ebp-4]
 0005BA0D    mov         byte ptr [edx+20A],al
 0005BA13    xor         eax,eax
 0005BA15    push        ebp
 0005BA16    push        5BA43
 0005BA1B    push        dword ptr fs:[eax]
 0005BA1E    mov         dword ptr fs:[eax],esp
 0005BA21    mov         edx,esi
 0005BA23    mov         eax,dword ptr [ebp-4]
 0005BA26    call        TWinControl.WMWindowPosChanging
 0005BA2B    xor         eax,eax
 0005BA2D    pop         edx
 0005BA2E    pop         ecx
 0005BA2F    pop         ecx
 0005BA30    mov         dword ptr fs:[eax],edx
 0005BA33    push        5BA4A
 0005BA38    mov         eax,dword ptr [ebp-4]
 0005BA3B    mov         byte ptr [eax+20A],0
 0005BA42    ret
>0005BA43    jmp         @HandleFinally
>0005BA48    jmp         0005BA38
 0005BA4A    pop         esi
 0005BA4B    pop         ebx
 0005BA4C    pop         ecx
 0005BA4D    pop         ebp
 0005BA4E    ret
*}
end;

//0005BA58
procedure TCustomForm.CMActivate;
begin
{*
 0005BA58    push        ebx
 0005BA59    test        byte ptr [eax+20],2;TCustomForm.FComponentState:TComponentState
>0005BA5D    jne         0005BA68
 0005BA5F    mov         bx,0FFB8
 0005BA63    call        @CallDynaInst;TCustomForm.sub_0005AEE4
 0005BA68    pop         ebx
 0005BA69    ret
*}
end;

//0005BA6C
procedure TCustomForm.CMDeactivate;
begin
{*
 0005BA6C    push        ebx
 0005BA6D    test        byte ptr [eax+20],2;TCustomForm.FComponentState:TComponentState
>0005BA71    jne         0005BA7C
 0005BA73    mov         bx,0FFB6
 0005BA77    call        @CallDynaInst;TCustomForm.sub_0005AF14
 0005BA7C    pop         ebx
 0005BA7D    ret
*}
end;

//0005BA80
procedure TCustomForm.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 0005BA80    push        ebx
 0005BA81    push        esi
 0005BA82    mov         esi,edx
 0005BA84    mov         ebx,eax
 0005BA86    push        12
 0005BA88    call        user32.GetKeyState
 0005BA8D    test        ax,ax
>0005BA90    jl          0005BB0E
 0005BA92    mov         ax,word ptr [esi+4]
 0005BA96    sub         ax,9
>0005BA9A    je          0005BAA7
 0005BA9C    add         eax,0FFFFFFE4
 0005BA9F    sub         ax,4
>0005BAA3    jb          0005BAD9
>0005BAA5    jmp         0005BB0E
 0005BAA7    push        11
 0005BAA9    call        user32.GetKeyState
 0005BAAE    test        ax,ax
>0005BAB1    jl          0005BB0E
 0005BAB3    push        1
 0005BAB5    push        10
 0005BAB7    call        user32.GetKeyState
 0005BABC    test        ax,ax
 0005BABF    setge       cl
 0005BAC2    mov         edx,dword ptr [ebx+200]
 0005BAC8    mov         eax,ebx
 0005BACA    call        TWinControl.SelectNext
 0005BACF    mov         dword ptr [esi+0C],1
 0005BAD6    pop         esi
 0005BAD7    pop         ebx
 0005BAD8    ret
 0005BAD9    mov         eax,dword ptr [ebx+200]
 0005BADF    test        eax,eax
>0005BAE1    je          0005BB17
 0005BAE3    push        0
 0005BAE5    mov         dx,word ptr [esi+4]
 0005BAE9    cmp         dx,27
>0005BAED    je          0005BAF9
 0005BAEF    cmp         dx,28
>0005BAF3    je          0005BAF9
 0005BAF5    xor         ecx,ecx
>0005BAF7    jmp         0005BAFB
 0005BAF9    mov         cl,1
 0005BAFB    mov         edx,dword ptr [eax+24]
 0005BAFE    xchg        eax,edx
 0005BAFF    call        TWinControl.SelectNext
 0005BB04    mov         dword ptr [esi+0C],1
 0005BB0B    pop         esi
 0005BB0C    pop         ebx
 0005BB0D    ret
 0005BB0E    mov         edx,esi
 0005BB10    mov         eax,ebx
 0005BB12    call        TWinControl.CMDialogKey
 0005BB17    pop         esi
 0005BB18    pop         ebx
 0005BB19    ret
*}
end;

//0005BB1C
procedure TCustomForm.CMShowingChanged(var Message:TMessage);
begin
{*
 0005BB1C    push        ebp
 0005BB1D    mov         ebp,esp
 0005BB1F    add         esp,0FFFFFFF8
 0005BB22    push        ebx
 0005BB23    push        esi
 0005BB24    push        edi
 0005BB25    xor         ecx,ecx
 0005BB27    mov         dword ptr [ebp-8],ecx
 0005BB2A    mov         dword ptr [ebp-4],eax
 0005BB2D    xor         eax,eax
 0005BB2F    push        ebp
 0005BB30    push        5BF8E
 0005BB35    push        dword ptr fs:[eax]
 0005BB38    mov         dword ptr fs:[eax],esp
 0005BB3B    mov         eax,dword ptr [ebp-4]
 0005BB3E    test        byte ptr [eax+20],10
>0005BB42    jne         0005BB71
 0005BB44    mov         eax,dword ptr [ebp-4]
 0005BB47    test        byte ptr [eax+2C0],4
>0005BB4E    je          0005BB71
 0005BB50    lea         edx,[ebp-8]
 0005BB53    mov         eax,[000B5BF4];^SVisibleChanged:TResStringRec
 0005BB58    call        LoadResString
 0005BB5D    mov         ecx,dword ptr [ebp-8]
 0005BB60    mov         dl,1
 0005BB62    mov         eax,[0001EE64];EInvalidOperation
 0005BB67    call        Exception.Create
 0005BB6C    call        @RaiseExcept
 0005BB71    mov         eax,[000B67B0];Application:TApplication
 0005BB76    call        TApplication.UpdateVisible
 0005BB7B    mov         eax,dword ptr [ebp-4]
 0005BB7E    or          byte ptr [eax+2C0],4
 0005BB85    xor         edx,edx
 0005BB87    push        ebp
 0005BB88    push        5BF71
 0005BB8D    push        dword ptr fs:[edx]
 0005BB90    mov         dword ptr fs:[edx],esp
 0005BB93    mov         eax,dword ptr [ebp-4]
 0005BB96    test        byte ptr [eax+20],10
>0005BB9A    jne         0005BF59
 0005BBA0    mov         eax,dword ptr [ebp-4]
 0005BBA3    cmp         byte ptr [eax+16C],0
>0005BBAA    je          0005BE54
 0005BBB0    xor         eax,eax
 0005BBB2    push        ebp
 0005BBB3    push        5BBD4
 0005BBB8    push        dword ptr fs:[eax]
 0005BBBB    mov         dword ptr fs:[eax],esp
 0005BBBE    mov         eax,dword ptr [ebp-4]
 0005BBC1    mov         bx,0FFB3
 0005BBC5    call        @CallDynaInst
 0005BBCA    xor         eax,eax
 0005BBCC    pop         edx
 0005BBCD    pop         ecx
 0005BBCE    pop         ecx
 0005BBCF    mov         dword ptr fs:[eax],edx
>0005BBD2    jmp         0005BBEB
>0005BBD4    jmp         @HandleAnyException
 0005BBD9    mov         edx,dword ptr [ebp-4]
 0005BBDC    mov         eax,[000B67B0];Application:TApplication
 0005BBE1    call        TApplication.HandleException
 0005BBE6    call        @DoneExcept
 0005BBEB    mov         eax,dword ptr [ebp-4]
 0005BBEE    mov         al,byte ptr [eax+210]
 0005BBF4    cmp         al,4
>0005BBF6    jne         0005BCB7
 0005BBFC    mov         eax,dword ptr [ebp-4]
 0005BBFF    cmp         byte ptr [eax+20F],1
>0005BC06    jne         0005BC42
 0005BC08    mov         eax,[000B67B0];Application:TApplication
 0005BC0D    mov         eax,dword ptr [eax+30]
 0005BC10    call        TControl.GetClientWidth
 0005BC15    mov         ebx,eax
 0005BC17    mov         eax,dword ptr [ebp-4]
 0005BC1A    sub         ebx,dword ptr [eax+38]
 0005BC1D    sar         ebx,1
>0005BC1F    jns         0005BC24
 0005BC21    adc         ebx,0
 0005BC24    mov         eax,[000B67B0];Application:TApplication
 0005BC29    mov         eax,dword ptr [eax+30]
 0005BC2C    call        TControl.GetClientHeight
 0005BC31    mov         esi,eax
 0005BC33    mov         eax,dword ptr [ebp-4]
 0005BC36    sub         esi,dword ptr [eax+3C]
 0005BC39    sar         esi,1
>0005BC3B    jns         0005BC74
 0005BC3D    adc         esi,0
>0005BC40    jmp         0005BC74
 0005BC42    mov         eax,[000B67B4];Screen:TScreen
 0005BC47    call        TScreen.GetWidth
 0005BC4C    mov         ebx,eax
 0005BC4E    mov         eax,dword ptr [ebp-4]
 0005BC51    sub         ebx,dword ptr [eax+38]
 0005BC54    sar         ebx,1
>0005BC56    jns         0005BC5B
 0005BC58    adc         ebx,0
 0005BC5B    mov         eax,[000B67B4];Screen:TScreen
 0005BC60    call        TScreen.GetHeight
 0005BC65    mov         esi,eax
 0005BC67    mov         eax,dword ptr [ebp-4]
 0005BC6A    sub         esi,dword ptr [eax+3C]
 0005BC6D    sar         esi,1
>0005BC6F    jns         0005BC74
 0005BC71    adc         esi,0
 0005BC74    test        ebx,ebx
>0005BC76    jge         0005BC7A
 0005BC78    xor         ebx,ebx
 0005BC7A    test        esi,esi
>0005BC7C    jge         0005BC80
 0005BC7E    xor         esi,esi
 0005BC80    mov         eax,dword ptr [ebp-4]
 0005BC83    mov         eax,dword ptr [eax+38]
 0005BC86    push        eax
 0005BC87    mov         eax,dword ptr [ebp-4]
 0005BC8A    mov         eax,dword ptr [eax+3C]
 0005BC8D    push        eax
 0005BC8E    mov         ecx,esi
 0005BC90    mov         edx,ebx
 0005BC92    mov         eax,dword ptr [ebp-4]
 0005BC95    mov         ebx,dword ptr [eax]
 0005BC97    call        dword ptr [ebx+80]
 0005BC9D    mov         eax,dword ptr [ebp-4]
 0005BCA0    cmp         byte ptr [eax+47],0
>0005BCA4    je          0005BD60
 0005BCAA    mov         eax,dword ptr [ebp-4]
 0005BCAD    call        TCustomForm.SetWindowToMonitor
>0005BCB2    jmp         0005BD60
 0005BCB7    cmp         al,5
>0005BCB9    jne         0005BD60
 0005BCBF    mov         eax,dword ptr [ebp-4]
 0005BCC2    cmp         byte ptr [eax+20F],1
>0005BCC9    jne         0005BD05
 0005BCCB    mov         eax,[000B67B0];Application:TApplication
 0005BCD0    mov         eax,dword ptr [eax+30]
 0005BCD3    call        TControl.GetClientWidth
 0005BCD8    mov         ebx,eax
 0005BCDA    mov         eax,dword ptr [ebp-4]
 0005BCDD    sub         ebx,dword ptr [eax+38]
 0005BCE0    sar         ebx,1
>0005BCE2    jns         0005BCE7
 0005BCE4    adc         ebx,0
 0005BCE7    mov         eax,[000B67B0];Application:TApplication
 0005BCEC    mov         eax,dword ptr [eax+30]
 0005BCEF    call        TControl.GetClientHeight
 0005BCF4    mov         esi,eax
 0005BCF6    mov         eax,dword ptr [ebp-4]
 0005BCF9    sub         esi,dword ptr [eax+3C]
 0005BCFC    sar         esi,1
>0005BCFE    jns         0005BD37
 0005BD00    adc         esi,0
>0005BD03    jmp         0005BD37
 0005BD05    mov         eax,[000B67B4];Screen:TScreen
 0005BD0A    call        TScreen.GetDesktopWidth
 0005BD0F    mov         ebx,eax
 0005BD11    mov         eax,dword ptr [ebp-4]
 0005BD14    sub         ebx,dword ptr [eax+38]
 0005BD17    sar         ebx,1
>0005BD19    jns         0005BD1E
 0005BD1B    adc         ebx,0
 0005BD1E    mov         eax,[000B67B4];Screen:TScreen
 0005BD23    call        TScreen.GetDesktopHeight
 0005BD28    mov         esi,eax
 0005BD2A    mov         eax,dword ptr [ebp-4]
 0005BD2D    sub         esi,dword ptr [eax+3C]
 0005BD30    sar         esi,1
>0005BD32    jns         0005BD37
 0005BD34    adc         esi,0
 0005BD37    test        ebx,ebx
>0005BD39    jge         0005BD3D
 0005BD3B    xor         ebx,ebx
 0005BD3D    test        esi,esi
>0005BD3F    jge         0005BD43
 0005BD41    xor         esi,esi
 0005BD43    mov         eax,dword ptr [ebp-4]
 0005BD46    mov         eax,dword ptr [eax+38]
 0005BD49    push        eax
 0005BD4A    mov         eax,dword ptr [ebp-4]
 0005BD4D    mov         eax,dword ptr [eax+3C]
 0005BD50    push        eax
 0005BD51    mov         ecx,esi
 0005BD53    mov         edx,ebx
 0005BD55    mov         eax,dword ptr [ebp-4]
 0005BD58    mov         ebx,dword ptr [eax]
 0005BD5A    call        dword ptr [ebx+80]
 0005BD60    mov         eax,dword ptr [ebp-4]
 0005BD63    mov         byte ptr [eax+210],0
 0005BD6A    mov         eax,dword ptr [ebp-4]
 0005BD6D    cmp         byte ptr [eax+20F],1
>0005BD74    jne         0005BE2F
 0005BD7A    mov         eax,dword ptr [ebp-4]
 0005BD7D    cmp         byte ptr [eax+20B],2
>0005BD84    jne         0005BDBC
 0005BD86    push        0
 0005BD88    mov         eax,dword ptr [ebp-4]
 0005BD8B    call        TWinControl.GetHandle
 0005BD90    push        eax
 0005BD91    push        223
 0005BD96    mov         eax,[000B67B0];Application:TApplication
 0005BD9B    mov         eax,dword ptr [eax+30]
 0005BD9E    mov         eax,dword ptr [eax+234]
 0005BDA4    push        eax
 0005BDA5    call        user32.SendMessageA
 0005BDAA    push        3
 0005BDAC    mov         eax,dword ptr [ebp-4]
 0005BDAF    call        TWinControl.GetHandle
 0005BDB4    push        eax
 0005BDB5    call        user32.ShowWindow
>0005BDBA    jmp         0005BE0D
 0005BDBC    mov         eax,dword ptr [ebp-4]
 0005BDBF    movzx       eax,byte ptr [eax+20B]
 0005BDC6    mov         eax,dword ptr [eax*4+0B4A54]
 0005BDCD    push        eax
 0005BDCE    mov         eax,dword ptr [ebp-4]
 0005BDD1    call        TWinControl.GetHandle
 0005BDD6    push        eax
 0005BDD7    call        user32.ShowWindow
 0005BDDC    mov         eax,dword ptr [ebp-4]
 0005BDDF    mov         eax,dword ptr [eax+38]
 0005BDE2    mov         edx,dword ptr [ebp-4]
 0005BDE5    mov         edx,dword ptr [edx+3C]
 0005BDE8    shl         edx,10
 0005BDEB    or          eax,edx
 0005BDED    push        eax
 0005BDEE    push        0
 0005BDF0    push        5
 0005BDF2    mov         eax,dword ptr [ebp-4]
 0005BDF5    call        TWinControl.GetHandle
 0005BDFA    push        eax
 0005BDFB    push        16C98;user32.DefMDIChildProcA:Longint
 0005BE00    call        user32.CallWindowProcA
 0005BE05    mov         eax,dword ptr [ebp-4]
 0005BE08    call        TControl.BringToFront
 0005BE0D    push        0
 0005BE0F    push        0
 0005BE11    push        234
 0005BE16    mov         eax,[000B67B0];Application:TApplication
 0005BE1B    mov         eax,dword ptr [eax+30]
 0005BE1E    mov         eax,dword ptr [eax+234]
 0005BE24    push        eax
 0005BE25    call        user32.SendMessageA
>0005BE2A    jmp         0005BF59
 0005BE2F    mov         eax,dword ptr [ebp-4]
 0005BE32    movzx       eax,byte ptr [eax+20B]
 0005BE39    mov         eax,dword ptr [eax*4+0B4A54]
 0005BE40    push        eax
 0005BE41    mov         eax,dword ptr [ebp-4]
 0005BE44    call        TWinControl.GetHandle
 0005BE49    push        eax
 0005BE4A    call        user32.ShowWindow
>0005BE4F    jmp         0005BF59
 0005BE54    xor         eax,eax
 0005BE56    push        ebp
 0005BE57    push        5BE78
 0005BE5C    push        dword ptr fs:[eax]
 0005BE5F    mov         dword ptr fs:[eax],esp
 0005BE62    mov         eax,dword ptr [ebp-4]
 0005BE65    mov         bx,0FFB4
 0005BE69    call        @CallDynaInst
 0005BE6E    xor         eax,eax
 0005BE70    pop         edx
 0005BE71    pop         ecx
 0005BE72    pop         ecx
 0005BE73    mov         dword ptr fs:[eax],edx
>0005BE76    jmp         0005BE8F
>0005BE78    jmp         @HandleAnyException
 0005BE7D    mov         edx,dword ptr [ebp-4]
 0005BE80    mov         eax,[000B67B0];Application:TApplication
 0005BE85    call        TApplication.HandleException
 0005BE8A    call        @DoneExcept
 0005BE8F    mov         eax,[000B67B4];Screen:TScreen
 0005BE94    mov         eax,dword ptr [eax+60]
 0005BE97    cmp         eax,dword ptr [ebp-4]
>0005BE9A    jne         0005BEA6
 0005BE9C    xor         edx,edx
 0005BE9E    mov         eax,dword ptr [ebp-4]
 0005BEA1    call        TCustomForm.MergeMenu
 0005BEA6    mov         eax,dword ptr [ebp-4]
 0005BEA9    cmp         byte ptr [eax+20F],1
>0005BEB0    jne         0005BEBF
 0005BEB2    mov         eax,dword ptr [ebp-4]
 0005BEB5    call        TWinControl.DestroyHandle
>0005BEBA    jmp         0005BF59
 0005BEBF    mov         eax,dword ptr [ebp-4]
 0005BEC2    test        byte ptr [eax+2C0],8
>0005BEC9    je          0005BEEA
 0005BECB    push        97
 0005BED0    push        0
 0005BED2    push        0
 0005BED4    push        0
 0005BED6    push        0
 0005BED8    push        0
 0005BEDA    mov         eax,dword ptr [ebp-4]
 0005BEDD    call        TWinControl.GetHandle
 0005BEE2    push        eax
 0005BEE3    call        user32.SetWindowPos
>0005BEE8    jmp         0005BF59
 0005BEEA    xor         ebx,ebx
 0005BEEC    mov         eax,dword ptr [ebp-4]
 0005BEEF    call        TWinControl.GetHandle
 0005BEF4    mov         esi,eax
 0005BEF6    call        user32.GetActiveWindow
 0005BEFB    cmp         esi,eax
>0005BEFD    jne         0005BF20
 0005BEFF    mov         eax,dword ptr [ebp-4]
 0005BF02    call        TWinControl.GetHandle
 0005BF07    push        eax
 0005BF08    call        user32.IsIconic
 0005BF0D    test        eax,eax
>0005BF0F    jne         0005BF20
 0005BF11    mov         eax,dword ptr [ebp-4]
 0005BF14    call        TWinControl.GetHandle
 0005BF19    call        FindTopMostWindow
 0005BF1E    mov         ebx,eax
 0005BF20    test        ebx,ebx
>0005BF22    je          0005BF49
 0005BF24    push        97
 0005BF29    push        0
 0005BF2B    push        0
 0005BF2D    push        0
 0005BF2F    push        0
 0005BF31    push        0
 0005BF33    mov         eax,dword ptr [ebp-4]
 0005BF36    call        TWinControl.GetHandle
 0005BF3B    push        eax
 0005BF3C    call        user32.SetWindowPos
 0005BF41    push        ebx
 0005BF42    call        user32.SetActiveWindow
>0005BF47    jmp         0005BF59
 0005BF49    push        0
 0005BF4B    mov         eax,dword ptr [ebp-4]
 0005BF4E    call        TWinControl.GetHandle
 0005BF53    push        eax
 0005BF54    call        user32.ShowWindow
 0005BF59    xor         eax,eax
 0005BF5B    pop         edx
 0005BF5C    pop         ecx
 0005BF5D    pop         ecx
 0005BF5E    mov         dword ptr fs:[eax],edx
 0005BF61    push        5BF78
 0005BF66    mov         eax,dword ptr [ebp-4]
 0005BF69    and         byte ptr [eax+2C0],0FB
 0005BF70    ret
>0005BF71    jmp         @HandleFinally
>0005BF76    jmp         0005BF66
 0005BF78    xor         eax,eax
 0005BF7A    pop         edx
 0005BF7B    pop         ecx
 0005BF7C    pop         ecx
 0005BF7D    mov         dword ptr fs:[eax],edx
 0005BF80    push        5BF95
 0005BF85    lea         eax,[ebp-8]
 0005BF88    call        @LStrClr
 0005BF8D    ret
>0005BF8E    jmp         @HandleFinally
>0005BF93    jmp         0005BF85
 0005BF95    pop         edi
 0005BF96    pop         esi
 0005BF97    pop         ebx
 0005BF98    pop         ecx
 0005BF99    pop         ecx
 0005BF9A    pop         ebp
 0005BF9B    ret
*}
end;

//0005BF9C
procedure TCustomForm.CMIconChanged(var Message:TMessage);
begin
{*
 0005BF9C    push        ebx
 0005BF9D    mov         ebx,eax
 0005BF9F    mov         eax,dword ptr [ebx+220]
 0005BFA5    call        TIcon.GetHandle
 0005BFAA    test        eax,eax
>0005BFAC    jne         0005BFB7
 0005BFAE    xor         edx,edx
 0005BFB0    mov         eax,ebx
 0005BFB2    call        TCustomForm.IconChanged
 0005BFB7    pop         ebx
 0005BFB8    ret
*}
end;

//0005BFBC
procedure TCustomForm.CMRelease;
begin
{*
 0005BFBC    call        TObject.Free
 0005BFC1    ret
*}
end;

//0005BFC4
procedure TCustomForm.CMTextChanged(var Message:TMessage);
begin
{*
 0005BFC4    push        esi
 0005BFC5    mov         esi,eax
 0005BFC7    mov         eax,esi
 0005BFC9    mov         ecx,dword ptr [eax]
 0005BFCB    call        dword ptr [ecx-10]
 0005BFCE    cmp         byte ptr [esi+20F],1
>0005BFD5    jne         0005C010
 0005BFD7    mov         eax,[000B67B0];Application:TApplication
 0005BFDC    cmp         dword ptr [eax+30],0
>0005BFE0    je          0005C010
 0005BFE2    mov         eax,[000B67B0];Application:TApplication
 0005BFE7    mov         eax,dword ptr [eax+30]
 0005BFEA    cmp         dword ptr [eax+234],0
>0005BFF1    je          0005C010
 0005BFF3    push        0
 0005BFF5    push        0
 0005BFF7    push        234
 0005BFFC    mov         eax,[000B67B0];Application:TApplication
 0005C001    mov         eax,dword ptr [eax+30]
 0005C004    mov         eax,dword ptr [eax+234]
 0005C00A    push        eax
 0005C00B    call        user32.SendMessageA
 0005C010    pop         esi
 0005C011    ret
*}
end;

//0005C014
procedure TCustomForm.CMUIActivate;
begin
{*
 0005C014    mov         ecx,dword ptr [eax]
 0005C016    call        dword ptr [ecx-10];TCustomForm.DefaultHandler
 0005C019    ret
*}
end;

//0005C01C
procedure TCustomForm.CMParentFontChanged(var Message:TMessage);
begin
{*
 0005C01C    push        ebp
 0005C01D    mov         ebp,esp
 0005C01F    push        ecx
 0005C020    push        esi
 0005C021    mov         esi,eax
 0005C023    cmp         byte ptr [esi+49],0
>0005C027    je          0005C081
 0005C029    cmp         dword ptr [edx+4],0
>0005C02D    je          0005C03C
 0005C02F    mov         eax,dword ptr [esi+58]
 0005C032    mov         edx,dword ptr [edx+8]
 0005C035    mov         ecx,dword ptr [eax]
 0005C037    call        dword ptr [ecx+8]
>0005C03A    jmp         0005C081
 0005C03C    mov         dl,1
 0005C03E    mov         eax,[00028720];TFont
 0005C043    call        TFont.Create
 0005C048    mov         dword ptr [ebp-4],eax
 0005C04B    xor         eax,eax
 0005C04D    push        ebp
 0005C04E    push        5C07A
 0005C053    push        dword ptr fs:[eax]
 0005C056    mov         dword ptr fs:[eax],esp
 0005C059    mov         eax,dword ptr [esi+58]
 0005C05C    mov         edx,dword ptr [ebp-4]
 0005C05F    mov         ecx,dword ptr [eax]
 0005C061    call        dword ptr [ecx+8]
 0005C064    xor         eax,eax
 0005C066    pop         edx
 0005C067    pop         ecx
 0005C068    pop         ecx
 0005C069    mov         dword ptr fs:[eax],edx
 0005C06C    push        5C081
 0005C071    mov         eax,dword ptr [ebp-4]
 0005C074    call        TObject.Free
 0005C079    ret
>0005C07A    jmp         @HandleFinally
>0005C07F    jmp         0005C071
 0005C081    pop         esi
 0005C082    pop         ecx
 0005C083    pop         ebp
 0005C084    ret
*}
end;

//0005C088
procedure TCustomForm.Close;
begin
{*
 0005C088    push        ebx
 0005C089    push        esi
 0005C08A    push        ecx
 0005C08B    mov         esi,eax
 0005C08D    test        byte ptr [esi+2C0],8
>0005C094    je          0005C0A5
 0005C096    mov         dword ptr [esi+22C],2
>0005C0A0    jmp         0005C125
 0005C0A5    mov         eax,esi
 0005C0A7    mov         edx,dword ptr [eax]
 0005C0A9    call        dword ptr [edx+0C4]
 0005C0AF    test        al,al
>0005C0B1    je          0005C125
 0005C0B3    cmp         byte ptr [esi+20F],1
>0005C0BA    jne         0005C0D1
 0005C0BC    test        byte ptr [esi+208],2
>0005C0C3    je          0005C0CB
 0005C0C5    mov         byte ptr [esp],3
>0005C0C9    jmp         0005C0D5
 0005C0CB    mov         byte ptr [esp],0
>0005C0CF    jmp         0005C0D5
 0005C0D1    mov         byte ptr [esp],1
 0005C0D5    mov         edx,esp
 0005C0D7    mov         eax,esi
 0005C0D9    mov         bx,0FFB5
 0005C0DD    call        @CallDynaInst
 0005C0E2    cmp         byte ptr [esp],0
>0005C0E6    je          0005C125
 0005C0E8    mov         eax,[000B67B0];Application:TApplication
 0005C0ED    cmp         esi,dword ptr [eax+30]
>0005C0F0    jne         0005C0FE
 0005C0F2    mov         eax,[000B67B0];Application:TApplication
 0005C0F7    call        TApplication.Terminate
>0005C0FC    jmp         0005C125
 0005C0FE    cmp         byte ptr [esp],1
>0005C102    jne         0005C10D
 0005C104    mov         eax,esi
 0005C106    call        TCustomForm.Hide
>0005C10B    jmp         0005C125
 0005C10D    cmp         byte ptr [esp],3
>0005C111    jne         0005C11E
 0005C113    mov         dl,1
 0005C115    mov         eax,esi
 0005C117    call        TCustomForm.SetWindowState
>0005C11C    jmp         0005C125
 0005C11E    mov         eax,esi
 0005C120    call        TCustomForm.Release
 0005C125    pop         edx
 0005C126    pop         esi
 0005C127    pop         ebx
 0005C128    ret
*}
end;

//0005C12C
function TCustomForm.CloseQuery:Boolean;
begin
{*
 0005C12C    push        ebx
 0005C12D    push        esi
 0005C12E    push        edi
 0005C12F    push        ecx
 0005C130    mov         ebx,eax
 0005C132    cmp         byte ptr [ebx+20F],2
>0005C139    jne         0005C169
 0005C13B    mov         byte ptr [esp],0
 0005C13F    mov         eax,ebx
 0005C141    call        TCustomForm.GetMDIChildCount
 0005C146    mov         esi,eax
 0005C148    dec         esi
 0005C149    test        esi,esi
>0005C14B    jl          0005C169
 0005C14D    inc         esi
 0005C14E    xor         edi,edi
 0005C150    mov         edx,edi
 0005C152    mov         eax,ebx
 0005C154    call        TCustomForm.GetMDIChildren
 0005C159    mov         edx,dword ptr [eax]
 0005C15B    call        dword ptr [edx+0C4]
 0005C161    test        al,al
>0005C163    je          0005C187
 0005C165    inc         edi
 0005C166    dec         esi
>0005C167    jne         0005C150
 0005C169    mov         byte ptr [esp],1
 0005C16D    cmp         word ptr [ebx+276],0
>0005C175    je          0005C187
 0005C177    mov         ecx,esp
 0005C179    mov         edx,ebx
 0005C17B    mov         eax,dword ptr [ebx+278]
 0005C181    call        dword ptr [ebx+274]
 0005C187    mov         al,byte ptr [esp]
 0005C18A    pop         edx
 0005C18B    pop         edi
 0005C18C    pop         esi
 0005C18D    pop         ebx
 0005C18E    ret
*}
end;

//0005C190
procedure TCustomForm.CloseModal;
begin
{*
 0005C190    push        ebp
 0005C191    mov         ebp,esp
 0005C193    add         esp,0FFFFFFF8
 0005C196    push        ebx
 0005C197    push        esi
 0005C198    push        edi
 0005C199    mov         dword ptr [ebp-4],eax
 0005C19C    xor         eax,eax
 0005C19E    push        ebp
 0005C19F    push        5C20F
 0005C1A4    push        dword ptr fs:[eax]
 0005C1A7    mov         dword ptr fs:[eax],esp
 0005C1AA    mov         byte ptr [ebp-5],0
 0005C1AE    mov         eax,dword ptr [ebp-4]
 0005C1B1    mov         edx,dword ptr [eax]
 0005C1B3    call        dword ptr [edx+0C4]
 0005C1B9    test        al,al
>0005C1BB    je          0005C1E3
 0005C1BD    mov         byte ptr [ebp-5],1
 0005C1C1    mov         eax,dword ptr [ebp-4]
 0005C1C4    cmp         word ptr [eax+26E],0
>0005C1CC    je          0005C1E3
 0005C1CE    lea         ecx,[ebp-5]
 0005C1D1    mov         ebx,dword ptr [ebp-4]
 0005C1D4    mov         edx,dword ptr [ebp-4]
 0005C1D7    mov         eax,dword ptr [ebx+270]
 0005C1DD    call        dword ptr [ebx+26C]
 0005C1E3    mov         al,byte ptr [ebp-5]
 0005C1E6    sub         al,1
>0005C1E8    jb          0005C1F0
 0005C1EA    dec         al
>0005C1EC    je          0005C1FD
>0005C1EE    jmp         0005C205
 0005C1F0    mov         eax,dword ptr [ebp-4]
 0005C1F3    xor         edx,edx
 0005C1F5    mov         dword ptr [eax+22C],edx
>0005C1FB    jmp         0005C205
 0005C1FD    mov         eax,dword ptr [ebp-4]
 0005C200    call        TCustomForm.Release
 0005C205    xor         eax,eax
 0005C207    pop         edx
 0005C208    pop         ecx
 0005C209    pop         ecx
 0005C20A    mov         dword ptr fs:[eax],edx
>0005C20D    jmp         0005C231
>0005C20F    jmp         @HandleAnyException
 0005C214    mov         eax,dword ptr [ebp-4]
 0005C217    xor         edx,edx
 0005C219    mov         dword ptr [eax+22C],edx
 0005C21F    mov         edx,dword ptr [ebp-4]
 0005C222    mov         eax,[000B67B0];Application:TApplication
 0005C227    call        TApplication.HandleException
 0005C22C    call        @DoneExcept
 0005C231    pop         edi
 0005C232    pop         esi
 0005C233    pop         ebx
 0005C234    pop         ecx
 0005C235    pop         ecx
 0005C236    pop         ebp
 0005C237    ret
*}
end;

//0005C238
procedure TCustomForm.Hide;
begin
{*
 0005C238    xor         edx,edx
 0005C23A    call        TCustomForm.SetVisible
 0005C23F    ret
*}
end;

//0005C240
procedure TCustomForm.Show;
begin
{*
 0005C240    push        ebx
 0005C241    mov         ebx,eax
 0005C243    mov         dl,1
 0005C245    mov         eax,ebx
 0005C247    call        TCustomForm.SetVisible
 0005C24C    mov         eax,ebx
 0005C24E    call        TControl.BringToFront
 0005C253    pop         ebx
 0005C254    ret
*}
end;

//0005C258
procedure TCustomForm.SetFocus;
begin
{*
 0005C258    push        ebp
 0005C259    mov         ebp,esp
 0005C25B    push        0
 0005C25D    push        ebx
 0005C25E    mov         ebx,eax
 0005C260    xor         eax,eax
 0005C262    push        ebp
 0005C263    push        5C2C6
 0005C268    push        dword ptr fs:[eax]
 0005C26B    mov         dword ptr fs:[eax],esp
 0005C26E    cmp         byte ptr [ebx+20E],0
>0005C275    jne         0005C2B0
 0005C277    cmp         byte ptr [ebx+47],0
>0005C27B    je          0005C288
 0005C27D    mov         eax,ebx
 0005C27F    mov         edx,dword ptr [eax]
 0005C281    call        dword ptr [edx+50]
 0005C284    test        al,al
>0005C286    jne         0005C2A9
 0005C288    lea         edx,[ebp-4]
 0005C28B    mov         eax,[000B5B2C];^SCannotFocus:TResStringRec
 0005C290    call        LoadResString
 0005C295    mov         ecx,dword ptr [ebp-4]
 0005C298    mov         dl,1
 0005C29A    mov         eax,[0001EE64];EInvalidOperation
 0005C29F    call        Exception.Create
 0005C2A4    call        @RaiseExcept
 0005C2A9    mov         eax,ebx
 0005C2AB    call        TCustomForm.SetWindowFocus
 0005C2B0    xor         eax,eax
 0005C2B2    pop         edx
 0005C2B3    pop         ecx
 0005C2B4    pop         ecx
 0005C2B5    mov         dword ptr fs:[eax],edx
 0005C2B8    push        5C2CD
 0005C2BD    lea         eax,[ebp-4]
 0005C2C0    call        @LStrClr
 0005C2C5    ret
>0005C2C6    jmp         @HandleFinally
>0005C2CB    jmp         0005C2BD
 0005C2CD    pop         ebx
 0005C2CE    pop         ecx
 0005C2CF    pop         ebp
 0005C2D0    ret
*}
end;

//0005C2D4
procedure TCustomForm.Release;
begin
{*
 0005C2D4    push        ebx
 0005C2D5    mov         ebx,eax
 0005C2D7    push        0
 0005C2D9    push        0
 0005C2DB    push        0B021
 0005C2E0    mov         eax,ebx
 0005C2E2    call        TWinControl.GetHandle
 0005C2E7    push        eax
 0005C2E8    call        user32.PostMessageA
 0005C2ED    pop         ebx
 0005C2EE    ret
*}
end;

//0005C2F0
function TCustomForm.ShowModal:Integer;
begin
{*
 0005C2F0    push        ebp
 0005C2F1    mov         ebp,esp
 0005C2F3    add         esp,0FFFFFFE0
 0005C2F6    push        ebx
 0005C2F7    push        esi
 0005C2F8    xor         edx,edx
 0005C2FA    mov         dword ptr [ebp-20],edx
 0005C2FD    mov         dword ptr [ebp-4],eax
 0005C300    mov         ebx,0B67B0;Application:TApplication
 0005C305    xor         eax,eax
 0005C307    push        ebp
 0005C308    push        5C580
 0005C30D    push        dword ptr fs:[eax]
 0005C310    mov         dword ptr fs:[eax],esp
 0005C313    call        CancelDrag
 0005C318    mov         eax,dword ptr [ebp-4]
 0005C31B    cmp         byte ptr [eax+47],0
>0005C31F    jne         0005C345
 0005C321    mov         eax,dword ptr [ebp-4]
 0005C324    mov         edx,dword ptr [eax]
 0005C326    call        dword ptr [edx+50]
 0005C329    test        al,al
>0005C32B    je          0005C345
 0005C32D    mov         eax,dword ptr [ebp-4]
 0005C330    test        byte ptr [eax+2C0],8
>0005C337    jne         0005C345
 0005C339    mov         eax,dword ptr [ebp-4]
 0005C33C    cmp         byte ptr [eax+20F],1
>0005C343    jne         0005C366
 0005C345    lea         edx,[ebp-20]
 0005C348    mov         eax,[000B58E4];^SCannotShowModal:TResStringRec
 0005C34D    call        LoadResString
 0005C352    mov         ecx,dword ptr [ebp-20]
 0005C355    mov         dl,1
 0005C357    mov         eax,[0001EE64];EInvalidOperation
 0005C35C    call        Exception.Create
 0005C361    call        @RaiseExcept
 0005C366    call        user32.GetCapture
 0005C36B    test        eax,eax
>0005C36D    je          0005C380
 0005C36F    push        0
 0005C371    push        0
 0005C373    push        1F
 0005C375    call        user32.GetCapture
 0005C37A    push        eax
 0005C37B    call        user32.SendMessageA
 0005C380    call        user32.ReleaseCapture
 0005C385    mov         eax,dword ptr [ebp-4]
 0005C388    or          byte ptr [eax+2C0],8
 0005C38F    call        user32.GetActiveWindow
 0005C394    mov         dword ptr [ebp-1C],eax
 0005C397    mov         eax,[000B49B0]
 0005C39C    mov         dword ptr [ebp-10],eax
 0005C39F    mov         eax,[000B67B4];Screen:TScreen
 0005C3A4    mov         ecx,dword ptr [eax+6C]
 0005C3A7    mov         eax,[000B67B4];Screen:TScreen
 0005C3AC    mov         eax,dword ptr [eax+70]
 0005C3AF    xor         edx,edx
 0005C3B1    call        TList.Insert
 0005C3B6    mov         eax,[000B67B4];Screen:TScreen
 0005C3BB    mov         edx,dword ptr [ebp-4]
 0005C3BE    mov         dword ptr [eax+6C],edx
 0005C3C1    mov         eax,[000B67B4];Screen:TScreen
 0005C3C6    mov         ax,word ptr [eax+38]
 0005C3CA    mov         word ptr [ebp-12],ax
 0005C3CE    xor         edx,edx
 0005C3D0    mov         eax,[000B67B4];Screen:TScreen
 0005C3D5    call        TScreen.SetCursor
 0005C3DA    mov         eax,[000B67B4];Screen:TScreen
 0005C3DF    mov         eax,dword ptr [eax+3C]
 0005C3E2    mov         dword ptr [ebp-18],eax
 0005C3E5    xor         eax,eax
 0005C3E7    call        DisableTaskWindows
 0005C3EC    mov         dword ptr [ebp-0C],eax
 0005C3EF    xor         edx,edx
 0005C3F1    push        ebp
 0005C3F2    push        5C560
 0005C3F7    push        dword ptr fs:[edx]
 0005C3FA    mov         dword ptr fs:[edx],esp
 0005C3FD    mov         eax,dword ptr [ebp-4]
 0005C400    call        TCustomForm.Show
 0005C405    xor         edx,edx
 0005C407    push        ebp
 0005C408    push        5C4BF
 0005C40D    push        dword ptr fs:[edx]
 0005C410    mov         dword ptr fs:[edx],esp
 0005C413    push        0
 0005C415    push        0
 0005C417    push        0B000
 0005C41C    mov         eax,dword ptr [ebp-4]
 0005C41F    call        TWinControl.GetHandle
 0005C424    push        eax
 0005C425    call        user32.SendMessageA
 0005C42A    mov         eax,dword ptr [ebp-4]
 0005C42D    xor         edx,edx
 0005C42F    mov         dword ptr [eax+22C],edx
 0005C435    mov         eax,dword ptr [ebx]
 0005C437    call        TApplication.HandleMessage
 0005C43C    mov         eax,dword ptr [ebx]
 0005C43E    cmp         byte ptr [eax+84],0
>0005C445    je          0005C456
 0005C447    mov         eax,dword ptr [ebp-4]
 0005C44A    mov         dword ptr [eax+22C],2
>0005C454    jmp         0005C46A
 0005C456    mov         eax,dword ptr [ebp-4]
 0005C459    cmp         dword ptr [eax+22C],0
>0005C460    je          0005C46A
 0005C462    mov         eax,dword ptr [ebp-4]
 0005C465    call        TCustomForm.CloseModal
 0005C46A    mov         eax,dword ptr [ebp-4]
 0005C46D    mov         eax,dword ptr [eax+22C]
 0005C473    test        eax,eax
>0005C475    je          0005C435
 0005C477    mov         dword ptr [ebp-8],eax
 0005C47A    push        0
 0005C47C    push        0
 0005C47E    push        0B001
 0005C483    mov         eax,dword ptr [ebp-4]
 0005C486    call        TWinControl.GetHandle
 0005C48B    push        eax
 0005C48C    call        user32.SendMessageA
 0005C491    mov         eax,dword ptr [ebp-4]
 0005C494    call        TWinControl.GetHandle
 0005C499    mov         ebx,eax
 0005C49B    call        user32.GetActiveWindow
 0005C4A0    cmp         ebx,eax
>0005C4A2    je          0005C4A9
 0005C4A4    xor         eax,eax
 0005C4A6    mov         dword ptr [ebp-1C],eax
 0005C4A9    xor         eax,eax
 0005C4AB    pop         edx
 0005C4AC    pop         ecx
 0005C4AD    pop         ecx
 0005C4AE    mov         dword ptr fs:[eax],edx
 0005C4B1    push        5C4C6
 0005C4B6    mov         eax,dword ptr [ebp-4]
 0005C4B9    call        TCustomForm.Hide
 0005C4BE    ret
>0005C4BF    jmp         @HandleFinally
>0005C4C4    jmp         0005C4B6
 0005C4C6    xor         eax,eax
 0005C4C8    pop         edx
 0005C4C9    pop         ecx
 0005C4CA    pop         ecx
 0005C4CB    mov         dword ptr fs:[eax],edx
 0005C4CE    push        5C56A
 0005C4D3    mov         eax,[000B67B4];Screen:TScreen
 0005C4D8    mov         eax,dword ptr [eax+3C]
 0005C4DB    cmp         eax,dword ptr [ebp-18]
>0005C4DE    jne         0005C4F0
 0005C4E0    mov         dx,word ptr [ebp-12]
 0005C4E4    mov         eax,[000B67B4];Screen:TScreen
 0005C4E9    call        TScreen.SetCursor
>0005C4EE    jmp         0005C4FC
 0005C4F0    xor         edx,edx
 0005C4F2    mov         eax,[000B67B4];Screen:TScreen
 0005C4F7    call        TScreen.SetCursor
 0005C4FC    mov         eax,dword ptr [ebp-0C]
 0005C4FF    call        EnableTaskWindows
 0005C504    mov         eax,[000B67B4];Screen:TScreen
 0005C509    mov         ebx,dword ptr [eax+70]
 0005C50C    cmp         dword ptr [ebx+8],0
>0005C510    jle         0005C534
 0005C512    mov         eax,ebx
 0005C514    call        TList.First
 0005C519    mov         esi,eax
 0005C51B    mov         eax,[000B67B4];Screen:TScreen
 0005C520    mov         dword ptr [eax+6C],esi
 0005C523    mov         edx,esi
 0005C525    mov         eax,[000B67B4];Screen:TScreen
 0005C52A    mov         eax,dword ptr [eax+70]
 0005C52D    call        TList.Remove
>0005C532    jmp         0005C53E
 0005C534    mov         eax,[000B67B4];Screen:TScreen
 0005C539    xor         edx,edx
 0005C53B    mov         dword ptr [eax+6C],edx
 0005C53E    cmp         dword ptr [ebp-1C],0
>0005C542    je          0005C54D
 0005C544    mov         eax,dword ptr [ebp-1C]
 0005C547    push        eax
 0005C548    call        user32.SetActiveWindow
 0005C54D    mov         eax,dword ptr [ebp-10]
 0005C550    mov         [000B49B0],eax
 0005C555    mov         eax,dword ptr [ebp-4]
 0005C558    and         byte ptr [eax+2C0],0F7
 0005C55F    ret
>0005C560    jmp         @HandleFinally
>0005C565    jmp         0005C4D3
 0005C56A    xor         eax,eax
 0005C56C    pop         edx
 0005C56D    pop         ecx
 0005C56E    pop         ecx
 0005C56F    mov         dword ptr fs:[eax],edx
 0005C572    push        5C587
 0005C577    lea         eax,[ebp-20]
 0005C57A    call        @LStrClr
 0005C57F    ret
>0005C580    jmp         @HandleFinally
>0005C585    jmp         0005C577
 0005C587    mov         eax,dword ptr [ebp-8]
 0005C58A    pop         esi
 0005C58B    pop         ebx
 0005C58C    mov         esp,ebp
 0005C58E    pop         ebp
 0005C58F    ret
*}
end;

//0005C590
procedure TraverseClients(Container:TWinControl);
begin
{*
 0005C590    push        ebp
 0005C591    mov         ebp,esp
 0005C593    push        ecx
 0005C594    push        ebx
 0005C595    push        esi
 0005C596    push        edi
 0005C597    mov         dword ptr [ebp-4],eax
 0005C59A    mov         eax,dword ptr [ebp-4]
 0005C59D    cmp         byte ptr [eax+16C],0
>0005C5A4    je          0005C5F8
 0005C5A6    mov         eax,dword ptr [ebp-4]
 0005C5A9    call        TWinControl.GetControlCount
 0005C5AE    mov         esi,eax
 0005C5B0    dec         esi
 0005C5B1    test        esi,esi
>0005C5B3    jl          0005C5F8
 0005C5B5    inc         esi
 0005C5B6    xor         edi,edi
 0005C5B8    mov         edx,edi
 0005C5BA    mov         eax,dword ptr [ebp-4]
 0005C5BD    call        TWinControl.GetControl
 0005C5C2    mov         ebx,eax
 0005C5C4    test        byte ptr [ebx+41],80
>0005C5C8    je          0005C5D7
 0005C5CA    cmp         byte ptr [ebx+47],0
>0005C5CE    je          0005C5D7
 0005C5D0    mov         eax,ebx
 0005C5D2    mov         edx,dword ptr [eax]
 0005C5D4    call        dword ptr [edx+74]
 0005C5D7    mov         eax,ebx
 0005C5D9    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0005C5DF    call        @IsClass
 0005C5E4    test        al,al
>0005C5E6    je          0005C5F4
 0005C5E8    mov         eax,dword ptr [ebp+8]
 0005C5EB    push        eax
 0005C5EC    mov         eax,ebx
 0005C5EE    call        TraverseClients
 0005C5F3    pop         ecx
 0005C5F4    inc         edi
 0005C5F5    dec         esi
>0005C5F6    jne         0005C5B8
 0005C5F8    pop         edi
 0005C5F9    pop         esi
 0005C5FA    pop         ebx
 0005C5FB    pop         ecx
 0005C5FC    pop         ebp
 0005C5FD    ret
*}
end;

//0005C600
procedure TCustomForm.UpdateActions;
begin
{*
 0005C600    push        ebp
 0005C601    mov         ebp,esp
 0005C603    push        ebx
 0005C604    push        esi
 0005C605    push        edi
 0005C606    mov         ebx,eax
 0005C608    test        byte ptr [ebx+20],10
>0005C60C    jne         0005C662
 0005C60E    cmp         byte ptr [ebx+16C],0
>0005C615    je          0005C662
 0005C617    mov         eax,ebx
 0005C619    mov         edx,dword ptr [eax]
 0005C61B    call        dword ptr [edx+74]
 0005C61E    mov         esi,dword ptr [ebx+228]
 0005C624    test        esi,esi
>0005C626    je          0005C659
 0005C628    mov         eax,dword ptr [esi+28]
 0005C62B    call        TMenuItem.GetCount
 0005C630    dec         eax
 0005C631    test        eax,eax
>0005C633    jl          0005C659
 0005C635    inc         eax
 0005C636    mov         esi,eax
 0005C638    xor         edi,edi
 0005C63A    mov         eax,dword ptr [ebx+228]
 0005C640    mov         eax,dword ptr [eax+28]
 0005C643    mov         edx,edi
 0005C645    call        TMenuItem.GetItem
 0005C64A    cmp         byte ptr [eax+30],0
>0005C64E    je          0005C655
 0005C650    mov         edx,dword ptr [eax]
 0005C652    call        dword ptr [edx+38]
 0005C655    inc         edi
 0005C656    dec         esi
>0005C657    jne         0005C63A
 0005C659    push        ebp
 0005C65A    mov         eax,ebx
 0005C65C    call        TraverseClients
 0005C661    pop         ecx
 0005C662    pop         edi
 0005C663    pop         esi
 0005C664    pop         ebx
 0005C665    pop         ebp
 0005C666    ret
*}
end;

//0005C668
procedure TCustomForm.RequestAlign;
begin
{*
 0005C668    cmp         dword ptr [eax+24],0
>0005C66C    jne         0005C67B
 0005C66E    mov         edx,eax
 0005C670    mov         eax,[000B67B4];Screen:TScreen
 0005C675    call        TScreen.AlignForm
 0005C67A    ret
 0005C67B    call        TControl.RequestAlign
 0005C680    ret
*}
end;

//0005C684
procedure TCustomForm.WMSettingChange(var Message:TMessage);
begin
{*
 0005C684    push        ebx
 0005C685    push        esi
 0005C686    mov         esi,edx
 0005C688    mov         ebx,eax
 0005C68A    mov         edx,esi
 0005C68C    mov         eax,ebx
 0005C68E    call        TWinControl.WMWinIniChange
 0005C693    cmp         dword ptr [esi+4],2F
>0005C697    jne         0005C6A4
 0005C699    mov         eax,ebx
 0005C69B    mov         bx,0FFD6
 0005C69F    call        @CallDynaInst
 0005C6A4    pop         esi
 0005C6A5    pop         ebx
 0005C6A6    ret
*}
end;

//0005C6A8
function ProcessExecute(Control:TControl):Boolean;
begin
{*
 0005C6A8    push        ebp
 0005C6A9    mov         ebp,esp
 0005C6AB    push        ebx
 0005C6AC    push        esi
 0005C6AD    mov         esi,eax
 0005C6AF    test        esi,esi
>0005C6B1    je          0005C6CB
 0005C6B3    mov         eax,dword ptr [ebp+8]
 0005C6B6    mov         edx,dword ptr [eax-4]
 0005C6B9    mov         edx,dword ptr [edx+8]
 0005C6BC    mov         eax,esi
 0005C6BE    mov         bx,0FFF4
 0005C6C2    call        @CallDynaInst
 0005C6C7    test        al,al
>0005C6C9    jne         0005C6CF
 0005C6CB    xor         eax,eax
>0005C6CD    jmp         0005C6D1
 0005C6CF    mov         al,1
 0005C6D1    pop         esi
 0005C6D2    pop         ebx
 0005C6D3    pop         ebp
 0005C6D4    ret
*}
end;

//0005C6D8
function TraverseClients(Container:TWinControl):Boolean;
begin
{*
 0005C6D8    push        ebp
 0005C6D9    mov         ebp,esp
 0005C6DB    push        ecx
 0005C6DC    push        ebx
 0005C6DD    push        esi
 0005C6DE    push        edi
 0005C6DF    mov         dword ptr [ebp-4],eax
 0005C6E2    mov         eax,dword ptr [ebp-4]
 0005C6E5    cmp         byte ptr [eax+16C],0
>0005C6EC    je          0005C74B
 0005C6EE    mov         eax,dword ptr [ebp-4]
 0005C6F1    call        TWinControl.GetControlCount
 0005C6F6    mov         esi,eax
 0005C6F8    dec         esi
 0005C6F9    test        esi,esi
>0005C6FB    jl          0005C74B
 0005C6FD    inc         esi
 0005C6FE    xor         edi,edi
 0005C700    mov         edx,edi
 0005C702    mov         eax,dword ptr [ebp-4]
 0005C705    call        TWinControl.GetControl
 0005C70A    mov         ebx,eax
 0005C70C    cmp         byte ptr [ebx+47],0
>0005C710    je          0005C722
 0005C712    mov         eax,dword ptr [ebp+8]
 0005C715    push        eax
 0005C716    mov         eax,ebx
 0005C718    call        ProcessExecute
 0005C71D    pop         ecx
 0005C71E    test        al,al
>0005C720    jne         0005C743
 0005C722    mov         eax,ebx
 0005C724    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0005C72A    call        @IsClass
 0005C72F    test        al,al
>0005C731    je          0005C747
 0005C733    mov         eax,dword ptr [ebp+8]
 0005C736    push        eax
 0005C737    mov         eax,ebx
 0005C739    call        TraverseClients
 0005C73E    pop         ecx
 0005C73F    test        al,al
>0005C741    je          0005C747
 0005C743    mov         al,1
>0005C745    jmp         0005C74D
 0005C747    inc         edi
 0005C748    dec         esi
>0005C749    jne         0005C700
 0005C74B    xor         eax,eax
 0005C74D    pop         edi
 0005C74E    pop         esi
 0005C74F    pop         ebx
 0005C750    pop         ecx
 0005C751    pop         ebp
 0005C752    ret
*}
end;

//0005C754
procedure TCustomForm.CMActionExecute(var Message:TMessage);
begin
{*
 0005C754    push        ebp
 0005C755    mov         ebp,esp
 0005C757    push        ecx
 0005C758    push        ebx
 0005C759    mov         dword ptr [ebp-4],edx
 0005C75C    mov         ebx,eax
 0005C75E    test        byte ptr [ebx+20],10
>0005C762    jne         0005C7A2
 0005C764    cmp         byte ptr [ebx+16C],0
>0005C76B    je          0005C7A2
 0005C76D    push        ebp
 0005C76E    mov         eax,dword ptr [ebx+200]
 0005C774    call        ProcessExecute
 0005C779    pop         ecx
 0005C77A    test        al,al
>0005C77C    jne         0005C798
 0005C77E    push        ebp
 0005C77F    mov         eax,ebx
 0005C781    call        ProcessExecute
 0005C786    pop         ecx
 0005C787    test        al,al
>0005C789    jne         0005C798
 0005C78B    push        ebp
 0005C78C    mov         eax,ebx
 0005C78E    call        TraverseClients
 0005C793    pop         ecx
 0005C794    test        al,al
>0005C796    je          0005C7A2
 0005C798    mov         eax,dword ptr [ebp-4]
 0005C79B    mov         dword ptr [eax+0C],1
 0005C7A2    pop         ebx
 0005C7A3    pop         ecx
 0005C7A4    pop         ebp
 0005C7A5    ret
*}
end;

//0005C7A8
function ProcessUpdate(Control:TControl):Boolean;
begin
{*
 0005C7A8    push        ebp
 0005C7A9    mov         ebp,esp
 0005C7AB    push        ebx
 0005C7AC    push        esi
 0005C7AD    mov         esi,eax
 0005C7AF    test        esi,esi
>0005C7B1    je          0005C7CB
 0005C7B3    mov         eax,dword ptr [ebp+8]
 0005C7B6    mov         edx,dword ptr [eax-4]
 0005C7B9    mov         edx,dword ptr [edx+8]
 0005C7BC    mov         eax,esi
 0005C7BE    mov         bx,0FFF1
 0005C7C2    call        @CallDynaInst
 0005C7C7    test        al,al
>0005C7C9    jne         0005C7CF
 0005C7CB    xor         eax,eax
>0005C7CD    jmp         0005C7D1
 0005C7CF    mov         al,1
 0005C7D1    pop         esi
 0005C7D2    pop         ebx
 0005C7D3    pop         ebp
 0005C7D4    ret
*}
end;

//0005C7D8
function TraverseClients(Container:TWinControl):Boolean;
begin
{*
 0005C7D8    push        ebp
 0005C7D9    mov         ebp,esp
 0005C7DB    push        ecx
 0005C7DC    push        ebx
 0005C7DD    push        esi
 0005C7DE    push        edi
 0005C7DF    mov         dword ptr [ebp-4],eax
 0005C7E2    mov         eax,dword ptr [ebp-4]
 0005C7E5    cmp         byte ptr [eax+16C],0
>0005C7EC    je          0005C84B
 0005C7EE    mov         eax,dword ptr [ebp-4]
 0005C7F1    call        TWinControl.GetControlCount
 0005C7F6    mov         esi,eax
 0005C7F8    dec         esi
 0005C7F9    test        esi,esi
>0005C7FB    jl          0005C84B
 0005C7FD    inc         esi
 0005C7FE    xor         edi,edi
 0005C800    mov         edx,edi
 0005C802    mov         eax,dword ptr [ebp-4]
 0005C805    call        TWinControl.GetControl
 0005C80A    mov         ebx,eax
 0005C80C    cmp         byte ptr [ebx+47],0
>0005C810    je          0005C822
 0005C812    mov         eax,dword ptr [ebp+8]
 0005C815    push        eax
 0005C816    mov         eax,ebx
 0005C818    call        ProcessUpdate
 0005C81D    pop         ecx
 0005C81E    test        al,al
>0005C820    jne         0005C843
 0005C822    mov         eax,ebx
 0005C824    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0005C82A    call        @IsClass
 0005C82F    test        al,al
>0005C831    je          0005C847
 0005C833    mov         eax,dword ptr [ebp+8]
 0005C836    push        eax
 0005C837    mov         eax,ebx
 0005C839    call        TraverseClients
 0005C83E    pop         ecx
 0005C83F    test        al,al
>0005C841    je          0005C847
 0005C843    mov         al,1
>0005C845    jmp         0005C84D
 0005C847    inc         edi
 0005C848    dec         esi
>0005C849    jne         0005C800
 0005C84B    xor         eax,eax
 0005C84D    pop         edi
 0005C84E    pop         esi
 0005C84F    pop         ebx
 0005C850    pop         ecx
 0005C851    pop         ebp
 0005C852    ret
*}
end;

//0005C854
procedure TCustomForm.CMActionUpdate(var Message:TMessage);
begin
{*
 0005C854    push        ebp
 0005C855    mov         ebp,esp
 0005C857    push        ecx
 0005C858    push        ebx
 0005C859    mov         dword ptr [ebp-4],edx
 0005C85C    mov         ebx,eax
 0005C85E    test        byte ptr [ebx+20],10
>0005C862    jne         0005C8A2
 0005C864    cmp         byte ptr [ebx+16C],0
>0005C86B    je          0005C8A2
 0005C86D    push        ebp
 0005C86E    mov         eax,dword ptr [ebx+200]
 0005C874    call        ProcessUpdate
 0005C879    pop         ecx
 0005C87A    test        al,al
>0005C87C    jne         0005C898
 0005C87E    push        ebp
 0005C87F    mov         eax,ebx
 0005C881    call        ProcessUpdate
 0005C886    pop         ecx
 0005C887    test        al,al
>0005C889    jne         0005C898
 0005C88B    push        ebp
 0005C88C    mov         eax,ebx
 0005C88E    call        TraverseClients
 0005C893    pop         ecx
 0005C894    test        al,al
>0005C896    je          0005C8A2
 0005C898    mov         eax,dword ptr [ebp-4]
 0005C89B    mov         dword ptr [eax+0C],1
 0005C8A2    pop         ebx
 0005C8A3    pop         ecx
 0005C8A4    pop         ebp
 0005C8A5    ret
*}
end;

//0005C8A8
function DispatchShortCut:Boolean;
begin
{*
 0005C8A8    push        ebp
 0005C8A9    mov         ebp,esp
 0005C8AB    push        ebx
 0005C8AC    push        esi
 0005C8AD    mov         eax,dword ptr [ebp+8]
 0005C8B0    mov         eax,dword ptr [eax-4]
 0005C8B3    mov         eax,dword ptr [eax+2BC]
 0005C8B9    test        eax,eax
>0005C8BB    je          0005C8F5
 0005C8BD    mov         edx,dword ptr [ebp+8]
 0005C8C0    mov         ebx,dword ptr [eax+8]
 0005C8C3    dec         ebx
 0005C8C4    test        ebx,ebx
>0005C8C6    jl          0005C8F5
 0005C8C8    inc         ebx
 0005C8C9    xor         esi,esi
 0005C8CB    mov         eax,dword ptr [ebp+8]
 0005C8CE    mov         eax,dword ptr [eax-4]
 0005C8D1    mov         eax,dword ptr [eax+2BC]
 0005C8D7    mov         edx,esi
 0005C8D9    call        TList.Get
 0005C8DE    mov         edx,dword ptr [ebp+8]
 0005C8E1    mov         edx,dword ptr [edx-8]
 0005C8E4    call        TCustomActionList.IsShortCut
 0005C8E9    test        al,al
>0005C8EB    je          0005C8F1
 0005C8ED    mov         al,1
>0005C8EF    jmp         0005C8F7
 0005C8F1    inc         esi
 0005C8F2    dec         ebx
>0005C8F3    jne         0005C8CB
 0005C8F5    xor         eax,eax
 0005C8F7    pop         esi
 0005C8F8    pop         ebx
 0005C8F9    pop         ebp
 0005C8FA    ret
*}
end;

//0005C8FC
procedure TCustomForm.IsShortCut(var Message:TWMKey);
begin
{*
 0005C8FC    push        ebp
 0005C8FD    mov         ebp,esp
 0005C8FF    add         esp,0FFFFFFF4
 0005C902    push        ebx
 0005C903    push        esi
 0005C904    mov         dword ptr [ebp-8],edx
 0005C907    mov         dword ptr [ebp-4],eax
 0005C90A    mov         byte ptr [ebp-9],0
 0005C90E    mov         eax,dword ptr [ebp-4]
 0005C911    cmp         word ptr [eax+29E],0
>0005C919    je          0005C930
 0005C91B    lea         ecx,[ebp-9]
 0005C91E    mov         edx,dword ptr [ebp-8]
 0005C921    mov         ebx,dword ptr [ebp-4]
 0005C924    mov         eax,dword ptr [ebx+2A0]
 0005C92A    call        dword ptr [ebx+29C]
 0005C930    cmp         byte ptr [ebp-9],0
>0005C934    jne         0005C96A
 0005C936    mov         eax,dword ptr [ebp-4]
 0005C939    mov         esi,dword ptr [eax+228]
 0005C93F    test        esi,esi
>0005C941    je          0005C95B
 0005C943    cmp         dword ptr [esi+2C],0
>0005C947    je          0005C95B
 0005C949    mov         edx,dword ptr [ebp-8]
 0005C94C    mov         eax,esi
 0005C94E    mov         bx,0FFF0
 0005C952    call        @CallDynaInst
 0005C957    test        al,al
>0005C959    jne         0005C96A
 0005C95B    push        ebp
 0005C95C    call        DispatchShortCut
 0005C961    pop         ecx
 0005C962    test        al,al
>0005C964    jne         0005C96A
 0005C966    xor         eax,eax
>0005C968    jmp         0005C96C
 0005C96A    mov         al,1
 0005C96C    mov         byte ptr [ebp-9],al
 0005C96F    mov         al,byte ptr [ebp-9]
 0005C972    pop         esi
 0005C973    pop         ebx
 0005C974    mov         esp,ebp
 0005C976    pop         ebp
 0005C977    ret
*}
end;

//0005C978
{*function TCustomForm.QueryInterface(const IID:TGUID; var Obj:Pointer):?; stdcall;
begin
 0005C978    push        ebp
 0005C979    mov         ebp,esp
 0005C97B    push        ebx
 0005C97C    push        esi
 0005C97D    push        edi
 0005C97E    mov         edi,dword ptr [ebp+10]
 0005C981    mov         ebx,dword ptr [ebp+0C]
 0005C984    mov         esi,dword ptr [ebp+8]
 0005C987    push        5C9CC;['{B971E807-E3A6-11D1-AAB1-00C04FB16FBC}']
 0005C98C    push        ebx
 0005C98D    call        ole32.IsEqualGUID
 0005C992    test        al,al
>0005C994    jne         0005C9A5
 0005C996    push        5C9DC;['{ABBE7256-5495-11D1-9FB5-0020AF3D82DA}']
 0005C99B    push        ebx
 0005C99C    call        ole32.IsEqualGUID
 0005C9A1    test        al,al
>0005C9A3    je          0005C9B6
 0005C9A5    xor         ebx,ebx
 0005C9A7    mov         eax,edi
 0005C9A9    mov         edx,dword ptr [esi+230]
 0005C9AF    call        @IntfCopy
>0005C9B4    jmp         0005C9C0
 0005C9B6    push        edi
 0005C9B7    push        ebx
 0005C9B8    push        esi
 0005C9B9    call        TComponent.QueryInterface
 0005C9BE    mov         ebx,eax
 0005C9C0    mov         eax,ebx
 0005C9C2    pop         edi
 0005C9C3    pop         esi
 0005C9C4    pop         ebx
 0005C9C5    pop         ebp
 0005C9C6    ret         0C
end;*}

//0005C9EC
procedure TCustomForm.MouseWheelHandler(var Message:TMessage);
begin
{*
 0005C9EC    push        ebx
 0005C9ED    push        esi
 0005C9EE    push        edi
 0005C9EF    mov         esi,edx
 0005C9F1    mov         ebx,eax
 0005C9F3    mov         edi,dword ptr [ebx+204]
 0005C9F9    test        edi,edi
>0005C9FB    je          0005CA15
 0005C9FD    mov         eax,dword ptr [esi+8]
 0005CA00    push        eax
 0005CA01    mov         ecx,dword ptr [esi+4]
 0005CA04    mov         edx,0B043
 0005CA09    mov         eax,edi
 0005CA0B    call        TControl.Perform
 0005CA10    mov         dword ptr [esi+0C],eax
>0005CA13    jmp         0005CA1E
 0005CA15    mov         edx,esi
 0005CA17    mov         eax,ebx
 0005CA19    call        TWinControl.MouseWheelHandler
 0005CA1E    pop         edi
 0005CA1F    pop         esi
 0005CA20    pop         ebx
 0005CA21    ret
*}
end;

//0005CA24
constructor TCustomDockForm.Create(AOwner:TComponent);
begin
{*
 0005CA24    push        ebp
 0005CA25    mov         ebp,esp
 0005CA27    push        ecx
 0005CA28    push        ebx
 0005CA29    push        esi
 0005CA2A    test        dl,dl
>0005CA2C    je          0005CA36
 0005CA2E    add         esp,0FFFFFFF0
 0005CA31    call        @ClassCreate
 0005CA36    mov         byte ptr [ebp-1],dl
 0005CA39    mov         ebx,eax
 0005CA3B    push        0
 0005CA3D    xor         edx,edx
 0005CA3F    mov         eax,ebx
 0005CA41    mov         esi,dword ptr [eax]
 0005CA43    call        dword ptr [esi+0C0]
 0005CA49    xor         edx,edx
 0005CA4B    mov         eax,ebx
 0005CA4D    call        TScrollingWinControl.SetAutoScroll
 0005CA52    mov         dl,5
 0005CA54    mov         eax,ebx
 0005CA56    call        TCustomForm.SetBorderStyle
 0005CA5B    mov         dl,1
 0005CA5D    mov         eax,ebx
 0005CA5F    call        TWinControl.SetDockSite
 0005CA64    mov         dl,3
 0005CA66    mov         eax,ebx
 0005CA68    call        TCustomForm.SetFormStyle
 0005CA6D    mov         eax,ebx
 0005CA6F    cmp         byte ptr [ebp-1],0
>0005CA73    je          0005CA84
 0005CA75    call        @AfterConstruction
 0005CA7A    pop         dword ptr fs:[0]
 0005CA81    add         esp,0C
 0005CA84    mov         eax,ebx
 0005CA86    pop         esi
 0005CA87    pop         ebx
 0005CA88    pop         ecx
 0005CA89    pop         ebp
 0005CA8A    ret
*}
end;

//0005CA8C
{*procedure TCustomDockForm.sub_00046FFC(?:?; ?:?);
begin
 0005CA8C    push        ebp
 0005CA8D    mov         ebp,esp
 0005CA8F    add         esp,0FFFFFFF4
 0005CA92    push        ebx
 0005CA93    push        esi
 0005CA94    xor         ebx,ebx
 0005CA96    mov         dword ptr [ebp-0C],ebx
 0005CA99    mov         dword ptr [ebp-8],ecx
 0005CA9C    mov         dword ptr [ebp-4],edx
 0005CA9F    mov         esi,eax
 0005CAA1    xor         eax,eax
 0005CAA3    push        ebp
 0005CAA4    push        5CB65
 0005CAA9    push        dword ptr fs:[eax]
 0005CAAC    mov         dword ptr fs:[eax],esp
 0005CAAF    mov         eax,esi
 0005CAB1    call        TWinControl.GetDockClientCount
 0005CAB6    dec         eax
>0005CAB7    jne         0005CB29
 0005CAB9    mov         eax,dword ptr [ebp-4]
 0005CABC    call        TControl.GetTextLen
 0005CAC1    mov         ecx,eax
 0005CAC3    inc         ecx
 0005CAC4    lea         eax,[ebp-0C]
 0005CAC7    xor         edx,edx
 0005CAC9    call        @LStrFromPCharLen
 0005CACE    mov         eax,dword ptr [ebp-0C]
 0005CAD1    call        @LStrLen
 0005CAD6    push        eax
 0005CAD7    mov         eax,dword ptr [ebp-0C]
 0005CADA    call        @LStrToPChar
 0005CADF    mov         edx,eax
 0005CAE1    mov         eax,dword ptr [ebp-4]
 0005CAE4    pop         ecx
 0005CAE5    call        TControl.GetTextBuf
 0005CAEA    mov         eax,dword ptr [ebp-0C]
 0005CAED    call        @LStrLen
 0005CAF2    mov         edx,eax
 0005CAF4    test        edx,edx
>0005CAF6    jle         0005CB1F
 0005CAF8    mov         eax,1
 0005CAFD    mov         ecx,dword ptr [ebp-0C]
 0005CB00    mov         cl,byte ptr [ecx+eax-1]
 0005CB04    sub         cl,0A
>0005CB07    je          0005CB0E
 0005CB09    sub         cl,3
>0005CB0C    jne         0005CB1B
 0005CB0E    mov         edx,eax
 0005CB10    dec         edx
 0005CB11    lea         eax,[ebp-0C]
 0005CB14    call        @LStrSetLength
>0005CB19    jmp         0005CB1F
 0005CB1B    inc         eax
 0005CB1C    dec         edx
>0005CB1D    jne         0005CAFD
 0005CB1F    mov         edx,dword ptr [ebp-0C]
 0005CB22    mov         eax,esi
 0005CB24    call        TControl.SetText
 0005CB29    mov         ecx,dword ptr [ebp-8]
 0005CB2C    mov         edx,dword ptr [ebp-4]
 0005CB2F    mov         eax,esi
 0005CB31    call        TWinControl.sub_00046FFC
 0005CB36    mov         dl,5
 0005CB38    mov         eax,dword ptr [ebp-4]
 0005CB3B    call        TControl.SetAlign
 0005CB40    test        byte ptr [esi+20],1;TCustomDockForm.FComponentState:TComponentState
>0005CB44    jne         0005CB4F
 0005CB46    mov         dl,1
 0005CB48    mov         eax,esi
 0005CB4A    call        TCustomForm.SetVisible
 0005CB4F    xor         eax,eax
 0005CB51    pop         edx
 0005CB52    pop         ecx
 0005CB53    pop         ecx
 0005CB54    mov         dword ptr fs:[eax],edx
 0005CB57    push        5CB6C
 0005CB5C    lea         eax,[ebp-0C]
 0005CB5F    call        @LStrClr
 0005CB64    ret
>0005CB65    jmp         @HandleFinally
>0005CB6A    jmp         0005CB5C
 0005CB6C    pop         esi
 0005CB6D    pop         ebx
 0005CB6E    mov         esp,ebp
 0005CB70    pop         ebp
 0005CB71    ret
end;*}

//0005CB74
procedure TCustomDockForm.DoRemoveDockClient(Client:TControl);
begin
{*
 0005CB74    push        ebx
 0005CB75    mov         ebx,eax
 0005CB77    mov         eax,ebx
 0005CB79    call        TWinControl.DoRemoveDockClient
 0005CB7E    mov         eax,ebx
 0005CB80    call        TWinControl.GetDockClientCount
 0005CB85    test        eax,eax
>0005CB87    jne         0005CB90
 0005CB89    mov         eax,ebx
 0005CB8B    call        TCustomForm.Release
 0005CB90    pop         ebx
 0005CB91    ret
*}
end;

//0005CB94
procedure TCustomDockForm.Loaded;
begin
{*
 0005CB94    push        ebx
 0005CB95    push        esi
 0005CB96    push        edi
 0005CB97    push        ebp
 0005CB98    add         esp,0FFFFFFF0
 0005CB9B    mov         esi,eax
 0005CB9D    mov         eax,esi
 0005CB9F    call        TWinControl.GetControlCount
 0005CBA4    mov         edi,eax
 0005CBA6    dec         edi
 0005CBA7    test        edi,edi
>0005CBA9    jl          0005CBD1
 0005CBAB    inc         edi
 0005CBAC    xor         ebp,ebp
 0005CBAE    mov         edx,esp
 0005CBB0    mov         eax,esi
 0005CBB2    mov         ecx,dword ptr [eax]
 0005CBB4    call        dword ptr [ecx+44]
 0005CBB7    push        esp
 0005CBB8    mov         edx,ebp
 0005CBBA    mov         eax,esi
 0005CBBC    call        TWinControl.GetControl
 0005CBC1    mov         edx,esi
 0005CBC3    pop         ecx
 0005CBC4    mov         bx,0FFD2
 0005CBC8    call        @CallDynaInst
 0005CBCD    inc         ebp
 0005CBCE    dec         edi
>0005CBCF    jne         0005CBAE
 0005CBD1    mov         eax,esi
 0005CBD3    call        TCustomForm.Loaded
 0005CBD8    add         esp,10
 0005CBDB    pop         ebp
 0005CBDC    pop         edi
 0005CBDD    pop         esi
 0005CBDE    pop         ebx
 0005CBDF    ret
*}
end;

//0005CBE0
procedure TCustomDockForm.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 0005CBE0    push        ebp
 0005CBE1    mov         ebp,esp
 0005CBE3    add         esp,0FFFFFFF8
 0005CBE6    push        ebx
 0005CBE7    push        esi
 0005CBE8    push        edi
 0005CBE9    mov         esi,dword ptr [ebp+0C]
 0005CBEC    lea         edi,[ebp-8]
 0005CBEF    movs        dword ptr [edi],dword ptr [esi]
 0005CBF0    movs        dword ptr [edi],dword ptr [esi]
 0005CBF1    mov         ebx,eax
 0005CBF3    mov         eax,ebx
 0005CBF5    call        TWinControl.GetDockClientCount
 0005CBFA    test        eax,eax
 0005CBFC    mov         eax,dword ptr [ebp+8]
 0005CBFF    sete        byte ptr [eax]
 0005CC02    pop         edi
 0005CC03    pop         esi
 0005CC04    pop         ebx
 0005CC05    pop         ecx
 0005CC06    pop         ecx
 0005CC07    pop         ebp
 0005CC08    ret         8
*}
end;

//0005CC0C
procedure TCustomDockForm.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 0005CC0C    push        ebx
 0005CC0D    push        esi
 0005CC0E    mov         esi,edx
 0005CC10    mov         ebx,eax
 0005CC12    mov         edx,esi
 0005CC14    mov         eax,ebx
 0005CC16    call        TWinControl.WMNCHitTest
 0005CC1B    test        byte ptr [ebx+20],10
>0005CC1F    jne         0005CC2E
 0005CC21    cmp         dword ptr [esi+0C],1
>0005CC25    jne         0005CC2E
 0005CC27    mov         dword ptr [esi+0C],2
 0005CC2E    pop         esi
 0005CC2F    pop         ebx
 0005CC30    ret
*}
end;

//0005CC34
procedure TCustomDockForm.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 0005CC34    push        ebx
 0005CC35    push        esi
 0005CC36    mov         esi,edx
 0005CC38    mov         ebx,eax
 0005CC3A    cmp         dword ptr [esi+4],2
>0005CC3E    jne         0005CCB4
 0005CC40    cmp         byte ptr [ebx+87],1
>0005CC47    je          0005CCB4
 0005CC49    test        byte ptr [ebx+20],10
>0005CC4D    jne         0005CCB4
 0005CC4F    mov         eax,ebx
 0005CC51    call        TWinControl.GetHandle
 0005CC56    push        eax
 0005CC57    call        user32.IsIconic
 0005CC5C    test        eax,eax
>0005CC5E    jne         0005CCB4
 0005CC60    mov         eax,ebx
 0005CC62    call        TWinControl.GetDockClientCount
 0005CC67    test        eax,eax
>0005CC69    jle         0005CCB4
 0005CC6B    push        7
 0005CC6D    push        0
 0005CC6F    push        0
 0005CC71    push        0
 0005CC73    push        0
 0005CC75    push        0
 0005CC77    mov         eax,ebx
 0005CC79    call        TWinControl.GetHandle
 0005CC7E    push        eax
 0005CC7F    call        user32.SetWindowPos
 0005CC84    mov         eax,dword ptr [esi+8]
 0005CC87    push        eax
 0005CC88    mov         eax,dword ptr [esi+4]
 0005CC8B    push        eax
 0005CC8C    push        0A2
 0005CC91    mov         eax,ebx
 0005CC93    call        TWinControl.GetHandle
 0005CC98    push        eax
 0005CC99    call        user32.PostMessageA
 0005CC9E    xor         edx,edx
 0005CCA0    mov         eax,ebx
 0005CCA2    call        TWinControl.GetDockClients
 0005CCA7    or          ecx,0FFFFFFFF
 0005CCAA    mov         dl,1
 0005CCAC    call        TControl.BeginDrag
 0005CCB1    pop         esi
 0005CCB2    pop         ebx
 0005CCB3    ret
 0005CCB4    mov         edx,esi
 0005CCB6    mov         eax,ebx
 0005CCB8    call        TCustomForm.WMNCLButtonDown
 0005CCBD    pop         esi
 0005CCBE    pop         ebx
 0005CCBF    ret
*}
end;

//0005CCC0
procedure TCustomDockForm.CMControlListChange(var Message:TMessage);
begin
{*
 0005CCC0    push        ebx
 0005CCC1    push        esi
 0005CCC2    push        edi
 0005CCC3    add         esp,0FFFFFFF0
 0005CCC6    mov         esi,edx
 0005CCC8    mov         ebx,eax
 0005CCCA    mov         edx,esi
 0005CCCC    mov         eax,ebx
 0005CCCE    call        TWinControl.CMControlListChange
 0005CCD3    cmp         dword ptr [esi+8],0
>0005CCD7    jne         0005CD0F
 0005CCD9    mov         eax,dword ptr [esi+4]
 0005CCDC    push        eax
 0005CCDD    xor         ecx,ecx
 0005CCDF    mov         edx,0B039
 0005CCE4    mov         eax,ebx
 0005CCE6    call        TControl.Perform
 0005CCEB    mov         edi,dword ptr [esi+4]
 0005CCEE    cmp         ebx,dword ptr [edi+8C]
>0005CCF4    jne         0005CD0F
 0005CCF6    mov         edx,esp
 0005CCF8    mov         eax,edi
 0005CCFA    call        TControl.GetBoundsRect
 0005CCFF    mov         ecx,esp
 0005CD01    mov         eax,edi
 0005CD03    or          edx,0FFFFFFFF
 0005CD06    mov         bx,0FFD2
 0005CD0A    call        @CallDynaInst
 0005CD0F    add         esp,10
 0005CD12    pop         edi
 0005CD13    pop         esi
 0005CD14    pop         ebx
 0005CD15    ret
*}
end;

//0005CD18
{*procedure TCustomDockForm.sub_0005CD18(?:?);
begin
 0005CD18    push        ebp
 0005CD19    mov         ebp,esp
 0005CD1B    add         esp,0FFFFFFF8
 0005CD1E    push        ebx
 0005CD1F    xor         ecx,ecx
 0005CD21    mov         dword ptr [ebp-8],ecx
 0005CD24    mov         ebx,edx
 0005CD26    mov         dword ptr [ebp-4],eax
 0005CD29    xor         eax,eax
 0005CD2B    push        ebp
 0005CD2C    push        5CDED
 0005CD31    push        dword ptr fs:[eax]
 0005CD34    mov         dword ptr fs:[eax],esp
 0005CD37    mov         edx,ebx
 0005CD39    mov         eax,dword ptr [ebp-4]
 0005CD3C    mov         ecx,dword ptr [eax]
 0005CD3E    call        dword ptr [ecx-10];TCustomForm.DefaultHandler
 0005CD41    mov         eax,dword ptr [ebx+8]
 0005CD44    mov         eax,dword ptr [eax]
 0005CD46    sub         eax,0C
>0005CD49    je          0005CD66
 0005CD4B    sub         eax,0AFFF
>0005CD50    jne         0005CDD7
 0005CD56    mov         eax,dword ptr [ebx+4]
 0005CD59    mov         dl,byte ptr [eax+47]
 0005CD5C    mov         eax,dword ptr [ebp-4]
 0005CD5F    call        TCustomForm.SetVisible
>0005CD64    jmp         0005CDD7
 0005CD66    mov         eax,dword ptr [ebx+4]
 0005CD69    call        TControl.GetTextLen
 0005CD6E    mov         ecx,eax
 0005CD70    inc         ecx
 0005CD71    lea         eax,[ebp-8]
 0005CD74    xor         edx,edx
 0005CD76    call        @LStrFromPCharLen
 0005CD7B    mov         eax,dword ptr [ebp-8]
 0005CD7E    call        @LStrLen
 0005CD83    push        eax
 0005CD84    mov         eax,dword ptr [ebp-8]
 0005CD87    call        @LStrToPChar
 0005CD8C    mov         edx,eax
 0005CD8E    mov         eax,dword ptr [ebx+4]
 0005CD91    pop         ecx
 0005CD92    call        TControl.GetTextBuf
 0005CD97    mov         eax,dword ptr [ebp-8]
 0005CD9A    call        @LStrLen
 0005CD9F    mov         edx,eax
 0005CDA1    test        edx,edx
>0005CDA3    jle         0005CDCC
 0005CDA5    mov         eax,1
 0005CDAA    mov         ecx,dword ptr [ebp-8]
 0005CDAD    mov         cl,byte ptr [ecx+eax-1]
 0005CDB1    sub         cl,0A
>0005CDB4    je          0005CDBB
 0005CDB6    sub         cl,3
>0005CDB9    jne         0005CDC8
 0005CDBB    mov         edx,eax
 0005CDBD    dec         edx
 0005CDBE    lea         eax,[ebp-8]
 0005CDC1    call        @LStrSetLength
>0005CDC6    jmp         0005CDCC
 0005CDC8    inc         eax
 0005CDC9    dec         edx
>0005CDCA    jne         0005CDAA
 0005CDCC    mov         edx,dword ptr [ebp-8]
 0005CDCF    mov         eax,dword ptr [ebp-4]
 0005CDD2    call        TControl.SetText
 0005CDD7    xor         eax,eax
 0005CDD9    pop         edx
 0005CDDA    pop         ecx
 0005CDDB    pop         ecx
 0005CDDC    mov         dword ptr fs:[eax],edx
 0005CDDF    push        5CDF4
 0005CDE4    lea         eax,[ebp-8]
 0005CDE7    call        @LStrClr
 0005CDEC    ret
>0005CDED    jmp         @HandleFinally
>0005CDF2    jmp         0005CDE4
 0005CDF4    pop         ebx
 0005CDF5    pop         ecx
 0005CDF6    pop         ecx
 0005CDF7    pop         ebp
 0005CDF8    ret
end;*}

//0005CDFC
procedure TCustomDockForm.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 0005CDFC    push        ebx
 0005CDFD    mov         ebx,edx
 0005CDFF    mov         edx,ebx
 0005CE01    call        TWinControl.CMUnDockClient
 0005CE06    mov         eax,dword ptr [ebx+8]
 0005CE09    xor         edx,edx
 0005CE0B    call        TControl.SetAlign
 0005CE10    pop         ebx
 0005CE11    ret
*}
end;

//0005CE14
procedure TCustomDockForm.CMVisibleChanged(var Message:TMessage);
begin
{*
 0005CE14    push        ebx
 0005CE15    push        esi
 0005CE16    push        edi
 0005CE17    mov         ebx,eax
 0005CE19    mov         eax,ebx
 0005CE1B    call        TWinControl.CMVisibleChanged
 0005CE20    test        byte ptr [ebx+20],8
>0005CE24    jne         0005CE4C
 0005CE26    mov         eax,ebx
 0005CE28    call        TWinControl.GetDockClientCount
 0005CE2D    mov         esi,eax
 0005CE2F    dec         esi
 0005CE30    test        esi,esi
>0005CE32    jl          0005CE4C
 0005CE34    inc         esi
 0005CE35    xor         edi,edi
 0005CE37    mov         edx,edi
 0005CE39    mov         eax,ebx
 0005CE3B    call        TWinControl.GetDockClients
 0005CE40    mov         dl,byte ptr [ebx+47]
 0005CE43    call        TControl.SetVisible
 0005CE48    inc         edi
 0005CE49    dec         esi
>0005CE4A    jne         0005CE37
 0005CE4C    pop         edi
 0005CE4D    pop         esi
 0005CE4E    pop         ebx
 0005CE4F    ret
*}
end;

//0005CE50
function TMonitor.GetLeft:Integer;
begin
{*
 0005CE50    add         esp,0FFFFFFD8
 0005CE53    mov         dword ptr [esp],28
 0005CE5A    push        esp
 0005CE5B    mov         eax,dword ptr [eax+4]
 0005CE5E    push        eax
 0005CE5F    mov         eax,[000B57F4];GetMonitorInfo:TGetMonitorInfoA
 0005CE64    mov         eax,dword ptr [eax]
 0005CE66    call        eax
 0005CE68    mov         eax,dword ptr [esp+4]
 0005CE6C    add         esp,28
 0005CE6F    ret
*}
end;

//0005CE70
function TMonitor.GetHeight:Integer;
begin
{*
 0005CE70    add         esp,0FFFFFFD8
 0005CE73    mov         dword ptr [esp],28
 0005CE7A    push        esp
 0005CE7B    mov         eax,dword ptr [eax+4]
 0005CE7E    push        eax
 0005CE7F    mov         eax,[000B57F4];GetMonitorInfo:TGetMonitorInfoA
 0005CE84    mov         eax,dword ptr [eax]
 0005CE86    call        eax
 0005CE88    mov         eax,dword ptr [esp+10]
 0005CE8C    sub         eax,dword ptr [esp+8]
 0005CE90    add         esp,28
 0005CE93    ret
*}
end;

//0005CE94
function TMonitor.GetTop:Integer;
begin
{*
 0005CE94    add         esp,0FFFFFFD8
 0005CE97    mov         dword ptr [esp],28
 0005CE9E    push        esp
 0005CE9F    mov         eax,dword ptr [eax+4]
 0005CEA2    push        eax
 0005CEA3    mov         eax,[000B57F4];GetMonitorInfo:TGetMonitorInfoA
 0005CEA8    mov         eax,dword ptr [eax]
 0005CEAA    call        eax
 0005CEAC    mov         eax,dword ptr [esp+8]
 0005CEB0    add         esp,28
 0005CEB3    ret
*}
end;

//0005CEB4
function TMonitor.GetWidth:Integer;
begin
{*
 0005CEB4    add         esp,0FFFFFFD8
 0005CEB7    mov         dword ptr [esp],28
 0005CEBE    push        esp
 0005CEBF    mov         eax,dword ptr [eax+4]
 0005CEC2    push        eax
 0005CEC3    mov         eax,[000B57F4];GetMonitorInfo:TGetMonitorInfoA
 0005CEC8    mov         eax,dword ptr [eax]
 0005CECA    call        eax
 0005CECC    mov         eax,dword ptr [esp+0C]
 0005CED0    sub         eax,dword ptr [esp+4]
 0005CED4    add         esp,28
 0005CED7    ret
*}
end;

//0005CED8
function EnumFontsProc(var LogFont:TLogFont; var TextMetric:TTextMetric; FontType:Integer; Data:Pointer):Integer; stdcall;
begin
{*
 0005CED8    push        ebp
 0005CED9    mov         ebp,esp
 0005CEDB    push        0
 0005CEDD    push        0
 0005CEDF    push        ebx
 0005CEE0    push        esi
 0005CEE1    xor         eax,eax
 0005CEE3    push        ebp
 0005CEE4    push        5CF5D
 0005CEE9    push        dword ptr fs:[eax]
 0005CEEC    mov         dword ptr fs:[eax],esp
 0005CEEF    mov         ebx,dword ptr [ebp+14]
 0005CEF2    lea         eax,[ebp-4]
 0005CEF5    mov         edx,dword ptr [ebp+8]
 0005CEF8    add         edx,1C
 0005CEFB    mov         ecx,20
 0005CF00    call        @LStrFromArray
 0005CF05    mov         eax,ebx
 0005CF07    mov         edx,dword ptr [eax]
 0005CF09    call        dword ptr [edx+14]
 0005CF0C    test        eax,eax
>0005CF0E    je          0005CF33
 0005CF10    mov         eax,ebx
 0005CF12    mov         edx,dword ptr [eax]
 0005CF14    call        dword ptr [edx+14]
 0005CF17    mov         edx,eax
 0005CF19    dec         edx
 0005CF1A    lea         ecx,[ebp-8]
 0005CF1D    mov         eax,ebx
 0005CF1F    mov         esi,dword ptr [eax]
 0005CF21    call        dword ptr [esi+0C]
 0005CF24    mov         eax,dword ptr [ebp-8]
 0005CF27    mov         edx,dword ptr [ebp-4]
 0005CF2A    call        AnsiCompareText
 0005CF2F    test        eax,eax
>0005CF31    je          0005CF3D
 0005CF33    mov         edx,dword ptr [ebp-4]
 0005CF36    mov         eax,ebx
 0005CF38    mov         ecx,dword ptr [eax]
 0005CF3A    call        dword ptr [ecx+34]
 0005CF3D    mov         ebx,1
 0005CF42    xor         eax,eax
 0005CF44    pop         edx
 0005CF45    pop         ecx
 0005CF46    pop         ecx
 0005CF47    mov         dword ptr fs:[eax],edx
 0005CF4A    push        5CF64
 0005CF4F    lea         eax,[ebp-8]
 0005CF52    mov         edx,2
 0005CF57    call        @LStrArrayClr
 0005CF5C    ret
>0005CF5D    jmp         @HandleFinally
>0005CF62    jmp         0005CF4F
 0005CF64    mov         eax,ebx
 0005CF66    pop         esi
 0005CF67    pop         ebx
 0005CF68    pop         ecx
 0005CF69    pop         ecx
 0005CF6A    pop         ebp
 0005CF6B    ret         10
*}
end;

//0005CF70
function EnumMonitorsProc(hm:HMONITOR; dc:HDC; r:PRect; Data:Pointer):Boolean; stdcall;
begin
{*
 0005CF70    push        ebp
 0005CF71    mov         ebp,esp
 0005CF73    push        ebx
 0005CF74    mov         ebx,dword ptr [ebp+14]
 0005CF77    mov         dl,1
 0005CF79    mov         eax,[00056300];TMonitor
 0005CF7E    call        TObject.Create
 0005CF83    mov         edx,dword ptr [ebp+8]
 0005CF86    mov         dword ptr [eax+4],edx
 0005CF89    mov         edx,dword ptr [ebx+8]
 0005CF8C    mov         dword ptr [eax+8],edx
 0005CF8F    mov         edx,eax
 0005CF91    mov         eax,ebx
 0005CF93    call        TList.Add
 0005CF98    mov         al,1
 0005CF9A    pop         ebx
 0005CF9B    pop         ebp
 0005CF9C    ret         10
*}
end;

//0005CFA0
constructor TScreen.Create(AOwner:TComponent);
begin
{*
 0005CFA0    push        ebp
 0005CFA1    mov         ebp,esp
 0005CFA3    add         esp,0FFFFFFB8
 0005CFA6    test        dl,dl
>0005CFA8    je          0005CFB2
 0005CFAA    add         esp,0FFFFFFF0
 0005CFAD    call        @ClassCreate
 0005CFB2    mov         byte ptr [ebp-5],dl
 0005CFB5    mov         dword ptr [ebp-4],eax
 0005CFB8    xor         edx,edx
 0005CFBA    mov         eax,dword ptr [ebp-4]
 0005CFBD    call        TComponent.Create
 0005CFC2    mov         eax,dword ptr [ebp-4]
 0005CFC5    call        TScreen.CreateCursors
 0005CFCA    mov         eax,dword ptr [ebp-4]
 0005CFCD    call        TScreen.InitImes
 0005CFD2    mov         dl,1
 0005CFD4    mov         eax,[0001F340];TStringList
 0005CFD9    call        TObject.Create
 0005CFDE    mov         edx,dword ptr [ebp-4]
 0005CFE1    mov         dword ptr [edx+24],eax
 0005CFE4    mov         dl,1
 0005CFE6    mov         eax,[0001EEC4];TList
 0005CFEB    call        TObject.Create
 0005CFF0    mov         edx,dword ptr [ebp-4]
 0005CFF3    mov         dword ptr [edx+40],eax
 0005CFF6    mov         dl,1
 0005CFF8    mov         eax,[0001EEC4];TList
 0005CFFD    call        TObject.Create
 0005D002    mov         edx,dword ptr [ebp-4]
 0005D005    mov         dword ptr [edx+44],eax
 0005D008    mov         dl,1
 0005D00A    mov         eax,[0001EEC4];TList
 0005D00F    call        TObject.Create
 0005D014    mov         edx,dword ptr [ebp-4]
 0005D017    mov         dword ptr [edx+48],eax
 0005D01A    mov         dl,1
 0005D01C    mov         eax,[0001EEC4];TList
 0005D021    call        TObject.Create
 0005D026    mov         edx,dword ptr [ebp-4]
 0005D029    mov         dword ptr [edx+4C],eax
 0005D02C    mov         dl,1
 0005D02E    mov         eax,[0001EEC4];TList
 0005D033    call        TObject.Create
 0005D038    mov         edx,dword ptr [ebp-4]
 0005D03B    mov         dword ptr [edx+70],eax
 0005D03E    push        0
 0005D040    call        user32.GetDC
 0005D045    mov         dword ptr [ebp-0C],eax
 0005D048    xor         eax,eax
 0005D04A    push        ebp
 0005D04B    push        5D0F3
 0005D050    push        dword ptr fs:[eax]
 0005D053    mov         dword ptr fs:[eax],esp
 0005D056    mov         eax,dword ptr [ebp-4]
 0005D059    mov         eax,dword ptr [eax+24]
 0005D05C    mov         edx,5D168;'Default'
 0005D061    mov         ecx,dword ptr [eax]
 0005D063    call        dword ptr [ecx+34]
 0005D066    call        kernel32.GetVersion
 0005D06B    and         ax,0FF
 0005D06F    cmp         ax,4
>0005D073    jb          0005D0A5
 0005D075    lea         eax,[ebp-48]
 0005D078    xor         ecx,ecx
 0005D07A    mov         edx,3C
 0005D07F    call        @FillChar
 0005D084    mov         byte ptr [ebp-31],1
 0005D088    push        0
 0005D08A    mov         eax,dword ptr [ebp-4]
 0005D08D    mov         eax,dword ptr [eax+24]
 0005D090    push        eax
 0005D091    push        5CED8;EnumFontsProc:Integer
 0005D096    lea         eax,[ebp-48]
 0005D099    push        eax
 0005D09A    mov         eax,dword ptr [ebp-0C]
 0005D09D    push        eax
 0005D09E    call        gdi32.EnumFontFamiliesExA
>0005D0A3    jmp         0005D0BC
 0005D0A5    mov         eax,dword ptr [ebp-4]
 0005D0A8    mov         eax,dword ptr [eax+24]
 0005D0AB    push        eax
 0005D0AC    push        5CED8;EnumFontsProc:Integer
 0005D0B1    push        0
 0005D0B3    mov         eax,dword ptr [ebp-0C]
 0005D0B6    push        eax
 0005D0B7    call        gdi32.EnumFontsA
 0005D0BC    mov         eax,dword ptr [ebp-4]
 0005D0BF    mov         eax,dword ptr [eax+24]
 0005D0C2    mov         dl,1
 0005D0C4    call        TStringList.SetSorted
 0005D0C9    push        5A
 0005D0CB    mov         eax,dword ptr [ebp-0C]
 0005D0CE    push        eax
 0005D0CF    call        gdi32.GetDeviceCaps
 0005D0D4    mov         edx,dword ptr [ebp-4]
 0005D0D7    mov         dword ptr [edx+34],eax
 0005D0DA    xor         eax,eax
 0005D0DC    pop         edx
 0005D0DD    pop         ecx
 0005D0DE    pop         ecx
 0005D0DF    mov         dword ptr fs:[eax],edx
 0005D0E2    push        5D0FA
 0005D0E7    mov         eax,dword ptr [ebp-0C]
 0005D0EA    push        eax
 0005D0EB    push        0
 0005D0ED    call        user32.ReleaseDC
 0005D0F2    ret
>0005D0F3    jmp         @HandleFinally
>0005D0F8    jmp         0005D0E7
 0005D0FA    mov         eax,dword ptr [ebp-4]
 0005D0FD    mov         eax,dword ptr [eax+4C]
 0005D100    push        eax
 0005D101    mov         eax,5CF70;EnumMonitorsProc:Boolean
 0005D106    push        eax
 0005D107    push        0
 0005D109    push        0
 0005D10B    mov         eax,[000B593C];EnumDisplayMonitors:TEnumDisplayMonitors
 0005D110    mov         eax,dword ptr [eax]
 0005D112    call        eax
 0005D114    mov         dl,1
 0005D116    mov         eax,[00028720];TFont
 0005D11B    call        TFont.Create
 0005D120    mov         edx,dword ptr [ebp-4]
 0005D123    mov         dword ptr [edx+74],eax
 0005D126    mov         eax,dword ptr [ebp-4]
 0005D129    call        TScreen.GetMetricSettings
 0005D12E    mov         eax,dword ptr [ebp-4]
 0005D131    mov         eax,dword ptr [eax+74]
 0005D134    mov         edx,dword ptr [ebp-4]
 0005D137    mov         dword ptr [eax+8],edx
 0005D13A    mov         dword ptr [eax+4],5D6A0;TScreen.IconFontChanged
 0005D141    mov         eax,dword ptr [ebp-4]
 0005D144    cmp         byte ptr [ebp-5],0
>0005D148    je          0005D159
 0005D14A    call        @AfterConstruction
 0005D14F    pop         dword ptr fs:[0]
 0005D156    add         esp,0C
 0005D159    mov         eax,dword ptr [ebp-4]
 0005D15C    mov         esp,ebp
 0005D15E    pop         ebp
 0005D15F    ret
*}
end;

//0005D170
destructor TScreen.Destroy;
begin
{*
 0005D170    push        ebx
 0005D171    push        esi
 0005D172    push        edi
 0005D173    push        ebp
 0005D174    call        @BeforeDestruction
 0005D179    mov         ebx,edx
 0005D17B    mov         ebp,eax
 0005D17D    mov         eax,dword ptr [ebp+74]
 0005D180    call        TObject.Free
 0005D185    mov         eax,dword ptr [ebp+48]
 0005D188    call        TObject.Free
 0005D18D    mov         eax,dword ptr [ebp+44]
 0005D190    call        TObject.Free
 0005D195    mov         eax,dword ptr [ebp+40]
 0005D198    call        TObject.Free
 0005D19D    mov         eax,dword ptr [ebp+24]
 0005D1A0    call        TObject.Free
 0005D1A5    mov         eax,dword ptr [ebp+28]
 0005D1A8    call        TObject.Free
 0005D1AD    mov         eax,dword ptr [ebp+70]
 0005D1B0    call        TObject.Free
 0005D1B5    mov         eax,dword ptr [ebp+4C]
 0005D1B8    test        eax,eax
>0005D1BA    je          0005D1DA
 0005D1BC    mov         esi,dword ptr [eax+8]
 0005D1BF    dec         esi
 0005D1C0    test        esi,esi
>0005D1C2    jl          0005D1DA
 0005D1C4    inc         esi
 0005D1C5    xor         edi,edi
 0005D1C7    mov         edx,edi
 0005D1C9    mov         eax,dword ptr [ebp+4C]
 0005D1CC    call        TList.Get
 0005D1D1    call        TObject.Free
 0005D1D6    inc         edi
 0005D1D7    dec         esi
>0005D1D8    jne         0005D1C7
 0005D1DA    mov         eax,dword ptr [ebp+4C]
 0005D1DD    call        TObject.Free
 0005D1E2    mov         eax,ebp
 0005D1E4    call        TScreen.DestroyCursors
 0005D1E9    mov         edx,ebx
 0005D1EB    and         dl,0FC
 0005D1EE    mov         eax,ebp
 0005D1F0    call        TComponent.Destroy
 0005D1F5    test        bl,bl
>0005D1F7    jle         0005D200
 0005D1F9    mov         eax,ebp
 0005D1FB    call        @ClassDestroy
 0005D200    pop         ebp
 0005D201    pop         edi
 0005D202    pop         esi
 0005D203    pop         ebx
 0005D204    ret
*}
end;

//0005D208
function TScreen.GetHeight:Integer;
begin
{*
 0005D208    push        1
 0005D20A    mov         eax,[000B582C];^gvar_000B66A0
 0005D20F    mov         eax,dword ptr [eax]
 0005D211    call        eax
 0005D213    ret
*}
end;

//0005D214
function TScreen.GetWidth:Integer;
begin
{*
 0005D214    push        0
 0005D216    mov         eax,[000B582C];^gvar_000B66A0
 0005D21B    mov         eax,dword ptr [eax]
 0005D21D    call        eax
 0005D21F    ret
*}
end;

//0005D220
function TScreen.GetDesktopTop:Integer;
begin
{*
 0005D220    push        4D
 0005D222    mov         eax,[000B582C];^gvar_000B66A0
 0005D227    mov         eax,dword ptr [eax]
 0005D229    call        eax
 0005D22B    ret
*}
end;

//0005D22C
function TScreen.GetDesktopLeft:Integer;
begin
{*
 0005D22C    push        4C
 0005D22E    mov         eax,[000B582C];^gvar_000B66A0
 0005D233    mov         eax,dword ptr [eax]
 0005D235    call        eax
 0005D237    ret
*}
end;

//0005D238
function TScreen.GetDesktopHeight:Integer;
begin
{*
 0005D238    push        4F
 0005D23A    mov         eax,[000B582C];^gvar_000B66A0
 0005D23F    mov         eax,dword ptr [eax]
 0005D241    call        eax
 0005D243    ret
*}
end;

//0005D244
function TScreen.GetDesktopWidth:Integer;
begin
{*
 0005D244    push        4E
 0005D246    mov         eax,[000B582C];^gvar_000B66A0
 0005D24B    mov         eax,dword ptr [eax]
 0005D24D    call        eax
 0005D24F    ret
*}
end;

//0005D250
function TScreen.GetMonitor(Index:Integer):TMonitor;
begin
{*
 0005D250    push        ebx
 0005D251    push        esi
 0005D252    mov         esi,edx
 0005D254    mov         ebx,eax
 0005D256    mov         edx,esi
 0005D258    mov         eax,dword ptr [ebx+4C]
 0005D25B    call        TList.Get
 0005D260    pop         esi
 0005D261    pop         ebx
 0005D262    ret
*}
end;

//0005D264
function TScreen.GetMonitorCount:Integer;
begin
{*
 0005D264    mov         edx,dword ptr [eax+4C]
 0005D267    mov         edx,dword ptr [edx+8]
 0005D26A    test        edx,edx
>0005D26C    jne         0005D27A
 0005D26E    push        50
 0005D270    mov         eax,[000B582C];^gvar_000B66A0
 0005D275    mov         eax,dword ptr [eax]
 0005D277    call        eax
 0005D279    ret
 0005D27A    mov         eax,edx
 0005D27C    ret
*}
end;

//0005D280
function TScreen.GetForm(Index:Integer):TForm;
begin
{*
 0005D280    push        ebx
 0005D281    push        esi
 0005D282    mov         esi,edx
 0005D284    mov         ebx,eax
 0005D286    mov         edx,esi
 0005D288    mov         eax,dword ptr [ebx+40]
 0005D28B    call        TList.Get
 0005D290    pop         esi
 0005D291    pop         ebx
 0005D292    ret
*}
end;

//0005D294
function TScreen.GetFormCount:Integer;
begin
{*
 0005D294    mov         eax,dword ptr [eax+40]
 0005D297    mov         eax,dword ptr [eax+8]
 0005D29A    ret
*}
end;

//0005D29C
function TScreen.GetCustomForms(Index:Integer):TCustomForm;
begin
{*
 0005D29C    push        ebx
 0005D29D    push        esi
 0005D29E    mov         esi,edx
 0005D2A0    mov         ebx,eax
 0005D2A2    mov         edx,esi
 0005D2A4    mov         eax,dword ptr [ebx+44]
 0005D2A7    call        TList.Get
 0005D2AC    pop         esi
 0005D2AD    pop         ebx
 0005D2AE    ret
*}
end;

//0005D2B0
function TScreen.GetCustomFormCount:Integer;
begin
{*
 0005D2B0    mov         eax,dword ptr [eax+44]
 0005D2B3    mov         eax,dword ptr [eax+8]
 0005D2B6    ret
*}
end;

//0005D2B8
procedure TScreen.UpdateLastActive;
begin
{*
 0005D2B8    push        ebx
 0005D2B9    mov         ebx,eax
 0005D2BB    mov         eax,dword ptr [ebx+5C]
 0005D2BE    cmp         eax,dword ptr [ebx+68]
>0005D2C1    je          0005D2DE
 0005D2C3    mov         dword ptr [ebx+68],eax
 0005D2C6    cmp         word ptr [ebx+86],0
>0005D2CE    je          0005D2DE
 0005D2D0    mov         edx,ebx
 0005D2D2    mov         eax,dword ptr [ebx+88]
 0005D2D8    call        dword ptr [ebx+84]
 0005D2DE    mov         eax,dword ptr [ebx+58]
 0005D2E1    cmp         eax,dword ptr [ebx+64]
>0005D2E4    je          0005D2FB
 0005D2E6    mov         dword ptr [ebx+64],eax
 0005D2E9    cmp         word ptr [ebx+7E],0
>0005D2EE    je          0005D2FB
 0005D2F0    mov         edx,ebx
 0005D2F2    mov         eax,dword ptr [ebx+80]
 0005D2F8    call        dword ptr [ebx+7C]
 0005D2FB    pop         ebx
 0005D2FC    ret
*}
end;

//0005D300
procedure TScreen.AddForm(AForm:TCustomForm);
begin
{*
 0005D300    push        ebx
 0005D301    push        esi
 0005D302    mov         esi,edx
 0005D304    mov         ebx,eax
 0005D306    mov         edx,esi
 0005D308    mov         eax,dword ptr [ebx+44]
 0005D30B    call        TList.Add
 0005D310    mov         eax,esi
 0005D312    mov         edx,dword ptr ds:[554E4];TForm
 0005D318    call        @IsClass
 0005D31D    test        al,al
>0005D31F    je          0005D335
 0005D321    mov         edx,esi
 0005D323    mov         eax,dword ptr [ebx+40]
 0005D326    call        TList.Add
 0005D32B    mov         eax,[000B67B0];Application:TApplication
 0005D330    call        TApplication.UpdateVisible
 0005D335    pop         esi
 0005D336    pop         ebx
 0005D337    ret
*}
end;

//0005D338
procedure TScreen.RemoveForm(AForm:TCustomForm);
begin
{*
 0005D338    push        ebx
 0005D339    push        esi
 0005D33A    mov         esi,edx
 0005D33C    mov         ebx,eax
 0005D33E    mov         edx,esi
 0005D340    mov         eax,dword ptr [ebx+44]
 0005D343    call        TList.Remove
 0005D348    mov         edx,esi
 0005D34A    mov         eax,dword ptr [ebx+40]
 0005D34D    call        TList.Remove
 0005D352    mov         eax,[000B67B0];Application:TApplication
 0005D357    call        TApplication.UpdateVisible
 0005D35C    mov         eax,dword ptr [ebx+44]
 0005D35F    cmp         dword ptr [eax+8],0
>0005D363    jne         0005D37D
 0005D365    mov         eax,[000B67B0];Application:TApplication
 0005D36A    cmp         dword ptr [eax+6C],0
>0005D36E    je          0005D37D
 0005D370    mov         eax,[000B67B0];Application:TApplication
 0005D375    mov         eax,dword ptr [eax+6C]
 0005D378    call        THintWindow.ReleaseHandle
 0005D37D    pop         esi
 0005D37E    pop         ebx
 0005D37F    ret
*}
end;

//0005D380
procedure TScreen.CreateCursors;
begin
{*
 0005D380    push        ebx
 0005D381    push        esi
 0005D382    push        edi
 0005D383    push        ebp
 0005D384    mov         ebp,eax
 0005D386    push        7F00
 0005D38B    push        0
 0005D38D    call        user32.LoadCursorA
 0005D392    mov         dword ptr [ebp+54],eax
 0005D395    mov         ebx,0FFFFFFEA
 0005D39A    mov         esi,0B4A60
 0005D39F    cmp         ebx,0FFFFFFEF
>0005D3A2    jl          0005D3A9
 0005D3A4    cmp         ebx,0FFFFFFF4
>0005D3A7    jle         0005D3AE
 0005D3A9    cmp         ebx,0FFFFFFEB
>0005D3AC    jne         0005D3B8
 0005D3AE    mov         edi,dword ptr ds:[0B5950];^HInstance:Longword
 0005D3B4    mov         edi,dword ptr [edi]
>0005D3B6    jmp         0005D3BA
 0005D3B8    xor         edi,edi
 0005D3BA    mov         eax,dword ptr [esi]
 0005D3BC    push        eax
 0005D3BD    push        edi
 0005D3BE    call        user32.LoadCursorA
 0005D3C3    mov         ecx,eax
 0005D3C5    mov         edx,ebx
 0005D3C7    mov         eax,ebp
 0005D3C9    call        TScreen.InsertCursor
 0005D3CE    inc         ebx
 0005D3CF    add         esi,4
 0005D3D2    cmp         ebx,0FFFFFFFF
>0005D3D5    jne         0005D39F
 0005D3D7    pop         ebp
 0005D3D8    pop         edi
 0005D3D9    pop         esi
 0005D3DA    pop         ebx
 0005D3DB    ret
*}
end;

//0005D3DC
procedure TScreen.DestroyCursors;
begin
{*
 0005D3DC    push        ebx
 0005D3DD    push        esi
 0005D3DE    push        edi
 0005D3DF    mov         edi,eax
 0005D3E1    mov         ebx,dword ptr [edi+50]
 0005D3E4    test        ebx,ebx
>0005D3E6    je          0005D41B
 0005D3E8    mov         eax,dword ptr [ebx+4]
 0005D3EB    cmp         eax,0FFFFFFEF
>0005D3EE    jl          0005D3F5
 0005D3F0    cmp         eax,0FFFFFFF4
>0005D3F3    jle         0005D3FE
 0005D3F5    cmp         eax,0FFFFFFEB
>0005D3F8    je          0005D3FE
 0005D3FA    test        eax,eax
>0005D3FC    jle         0005D407
 0005D3FE    mov         eax,dword ptr [ebx+8]
 0005D401    push        eax
 0005D402    call        user32.DestroyCursor
 0005D407    mov         esi,dword ptr [ebx]
 0005D409    mov         edx,0C
 0005D40E    mov         eax,ebx
 0005D410    call        @FreeMem
 0005D415    mov         ebx,esi
 0005D417    test        ebx,ebx
>0005D419    jne         0005D3E8
 0005D41B    push        7F00
 0005D420    push        0
 0005D422    call        user32.LoadCursorA
 0005D427    mov         edx,dword ptr [edi+54]
 0005D42A    cmp         eax,edx
>0005D42C    je          0005D434
 0005D42E    push        edx
 0005D42F    call        user32.DestroyCursor
 0005D434    pop         edi
 0005D435    pop         esi
 0005D436    pop         ebx
 0005D437    ret
*}
end;

//0005D438
procedure TScreen.DeleteCursor(Index:Integer);
begin
{*
 0005D438    push        ebx
 0005D439    push        esi
 0005D43A    push        edi
 0005D43B    mov         edi,eax
 0005D43D    mov         ebx,dword ptr [edi+50]
 0005D440    xor         esi,esi
>0005D442    jmp         0005D448
 0005D444    mov         esi,ebx
 0005D446    mov         ebx,dword ptr [ebx]
 0005D448    test        ebx,ebx
>0005D44A    je          0005D451
 0005D44C    cmp         edx,dword ptr [ebx+4]
>0005D44F    jne         0005D444
 0005D451    test        ebx,ebx
>0005D453    je          0005D479
 0005D455    mov         eax,dword ptr [ebx+8]
 0005D458    push        eax
 0005D459    call        user32.DestroyCursor
 0005D45E    test        esi,esi
>0005D460    jne         0005D469
 0005D462    mov         eax,dword ptr [ebx]
 0005D464    mov         dword ptr [edi+50],eax
>0005D467    jmp         0005D46D
 0005D469    mov         eax,dword ptr [ebx]
 0005D46B    mov         dword ptr [esi],eax
 0005D46D    mov         edx,0C
 0005D472    mov         eax,ebx
 0005D474    call        @FreeMem
 0005D479    pop         edi
 0005D47A    pop         esi
 0005D47B    pop         ebx
 0005D47C    ret
*}
end;

//0005D480
procedure TScreen.InsertCursor(Index:Integer; Handle:HCURSOR);
begin
{*
 0005D480    push        ebx
 0005D481    push        esi
 0005D482    push        edi
 0005D483    mov         edi,ecx
 0005D485    mov         esi,edx
 0005D487    mov         ebx,eax
 0005D489    mov         eax,0C
 0005D48E    call        @GetMem
 0005D493    mov         edx,dword ptr [ebx+50]
 0005D496    mov         dword ptr [eax],edx
 0005D498    mov         dword ptr [eax+4],esi
 0005D49B    mov         dword ptr [eax+8],edi
 0005D49E    mov         dword ptr [ebx+50],eax
 0005D4A1    pop         edi
 0005D4A2    pop         esi
 0005D4A3    pop         ebx
 0005D4A4    ret
*}
end;

//0005D4A8
procedure TScreen.InitImes;
begin
{*
 0005D4A8    push        ebp
 0005D4A9    mov         ebp,esp
 0005D4AB    add         esp,0FFFFFDA0
 0005D4B1    push        ebx
 0005D4B2    xor         edx,edx
 0005D4B4    mov         dword ptr [ebp-260],edx
 0005D4BA    mov         dword ptr [ebp-4],eax
 0005D4BD    xor         eax,eax
 0005D4BF    push        ebp
 0005D4C0    push        5D64D
 0005D4C5    push        dword ptr fs:[eax]
 0005D4C8    mov         dword ptr fs:[eax],esp
 0005D4CB    mov         dl,1
 0005D4CD    mov         eax,[0001F340];TStringList
 0005D4D2    call        TObject.Create
 0005D4D7    mov         edx,dword ptr [ebp-4]
 0005D4DA    mov         dword ptr [edx+28],eax
 0005D4DD    mov         eax,dword ptr [ebp-4]
 0005D4E0    add         eax,2C
 0005D4E3    call        @LStrClr
 0005D4E8    push        0
 0005D4EA    call        user32.GetKeyboardLayout
 0005D4EF    mov         edx,dword ptr [ebp-4]
 0005D4F2    mov         dword ptr [edx+30],eax
 0005D4F5    lea         eax,[ebp-114]
 0005D4FB    push        eax
 0005D4FC    push        40
 0005D4FE    call        user32.GetKeyboardLayoutList
 0005D503    dec         eax
 0005D504    test        eax,eax
>0005D506    jl          0005D623
 0005D50C    inc         eax
 0005D50D    mov         dword ptr [ebp-10],eax
 0005D510    lea         eax,[ebp-114]
 0005D516    mov         dword ptr [ebp-14],eax
 0005D519    mov         eax,dword ptr [ebp-14]
 0005D51C    mov         eax,dword ptr [eax]
 0005D51E    call        Imm32IsIME
 0005D523    test        al,al
>0005D525    je          0005D616
 0005D52B    lea         eax,[ebp-0C]
 0005D52E    push        eax
 0005D52F    push        0F003F
 0005D534    push        0
 0005D536    push        0
 0005D538    mov         eax,dword ptr [ebp-14]
 0005D53B    mov         eax,dword ptr [eax]
 0005D53D    mov         dword ptr [ebp-25C],eax
 0005D543    mov         byte ptr [ebp-258],0
 0005D54A    lea         ecx,[ebp-25C]
 0005D550    mov         edx,5D65C
 0005D555    lea         eax,[ebp-254]
 0005D55B    call        StrFmt
 0005D560    push        eax
 0005D561    push        80000002
 0005D566    call        advapi32.RegOpenKeyExA
 0005D56B    test        eax,eax
>0005D56D    jne         0005D616
 0005D573    xor         eax,eax
 0005D575    push        ebp
 0005D576    push        5D60F
 0005D57B    push        dword ptr fs:[eax]
 0005D57E    mov         dword ptr fs:[eax],esp
 0005D581    mov         dword ptr [ebp-8],100
 0005D588    lea         eax,[ebp-8]
 0005D58B    push        eax
 0005D58C    lea         eax,[ebp-214]
 0005D592    push        eax
 0005D593    push        0
 0005D595    push        0
 0005D597    push        5D694
 0005D59C    mov         eax,dword ptr [ebp-0C]
 0005D59F    push        eax
 0005D5A0    call        advapi32.RegQueryValueExA
 0005D5A5    test        eax,eax
>0005D5A7    jne         0005D5F8
 0005D5A9    lea         eax,[ebp-260]
 0005D5AF    lea         edx,[ebp-214]
 0005D5B5    mov         ecx,100
 0005D5BA    call        @LStrFromArray
 0005D5BF    mov         edx,dword ptr [ebp-260]
 0005D5C5    mov         eax,dword ptr [ebp-14]
 0005D5C8    mov         ecx,dword ptr [eax]
 0005D5CA    mov         eax,dword ptr [ebp-4]
 0005D5CD    mov         eax,dword ptr [eax+28]
 0005D5D0    mov         ebx,dword ptr [eax]
 0005D5D2    call        dword ptr [ebx+38]
 0005D5D5    mov         eax,dword ptr [ebp-14]
 0005D5D8    mov         eax,dword ptr [eax]
 0005D5DA    mov         edx,dword ptr [ebp-4]
 0005D5DD    cmp         eax,dword ptr [edx+30]
>0005D5E0    jne         0005D5F8
 0005D5E2    mov         eax,dword ptr [ebp-4]
 0005D5E5    add         eax,2C
 0005D5E8    lea         edx,[ebp-214]
 0005D5EE    mov         ecx,100
 0005D5F3    call        @LStrFromArray
 0005D5F8    xor         eax,eax
 0005D5FA    pop         edx
 0005D5FB    pop         ecx
 0005D5FC    pop         ecx
 0005D5FD    mov         dword ptr fs:[eax],edx
 0005D600    push        5D616
 0005D605    mov         eax,dword ptr [ebp-0C]
 0005D608    push        eax
 0005D609    call        advapi32.RegCloseKey
 0005D60E    ret
>0005D60F    jmp         @HandleFinally
>0005D614    jmp         0005D605
 0005D616    add         dword ptr [ebp-14],4
 0005D61A    dec         dword ptr [ebp-10]
>0005D61D    jne         0005D519
 0005D623    mov         eax,dword ptr [ebp-4]
 0005D626    mov         eax,dword ptr [eax+28]
 0005D629    mov         byte ptr [eax+19],0
 0005D62D    mov         dl,1
 0005D62F    call        TStringList.SetSorted
 0005D634    xor         eax,eax
 0005D636    pop         edx
 0005D637    pop         ecx
 0005D638    pop         ecx
 0005D639    mov         dword ptr fs:[eax],edx
 0005D63C    push        5D654
 0005D641    lea         eax,[ebp-260]
 0005D647    call        @LStrClr
 0005D64C    ret
>0005D64D    jmp         @HandleFinally
>0005D652    jmp         0005D641
 0005D654    pop         ebx
 0005D655    mov         esp,ebp
 0005D657    pop         ebp
 0005D658    ret
*}
end;

//0005D6A0
procedure TScreen.IconFontChanged(Sender:TObject);
begin
{*
 0005D6A0    mov         dx,0B035
 0005D6A4    mov         eax,[000B67B0];Application:TApplication
 0005D6A9    call        TApplication.NotifyForms
 0005D6AE    ret
*}
end;

//0005D6B0
function TScreen.GetDataModule(Index:Integer):TDataModule;
begin
{*
 0005D6B0    push        ebx
 0005D6B1    push        esi
 0005D6B2    mov         esi,edx
 0005D6B4    mov         ebx,eax
 0005D6B6    mov         edx,esi
 0005D6B8    mov         eax,dword ptr [ebx+48]
 0005D6BB    call        TList.Get
 0005D6C0    pop         esi
 0005D6C1    pop         ebx
 0005D6C2    ret
*}
end;

//0005D6C4
function TScreen.GetDataModuleCount:Integer;
begin
{*
 0005D6C4    mov         eax,dword ptr [eax+48]
 0005D6C7    mov         eax,dword ptr [eax+8]
 0005D6CA    ret
*}
end;

//0005D6CC
function TScreen.GetCursors(Index:Integer):HCURSOR;
begin
{*
 0005D6CC    xor         ecx,ecx
 0005D6CE    cmp         edx,0FFFFFFFF
>0005D6D1    je          0005D6EF
 0005D6D3    mov         ecx,dword ptr [eax+50]
>0005D6D6    jmp         0005D6DA
 0005D6D8    mov         ecx,dword ptr [ecx]
 0005D6DA    test        ecx,ecx
>0005D6DC    je          0005D6E3
 0005D6DE    cmp         edx,dword ptr [ecx+4]
>0005D6E1    jne         0005D6D8
 0005D6E3    test        ecx,ecx
>0005D6E5    jne         0005D6EC
 0005D6E7    mov         ecx,dword ptr [eax+54]
>0005D6EA    jmp         0005D6EF
 0005D6EC    mov         ecx,dword ptr [ecx+8]
 0005D6EF    mov         eax,ecx
 0005D6F1    ret
*}
end;

//0005D6F4
procedure TScreen.SetCursor(Value:TCursor);
begin
{*
 0005D6F4    push        ebx
 0005D6F5    push        esi
 0005D6F6    push        edi
 0005D6F7    push        ebp
 0005D6F8    add         esp,0FFFFFFF8
 0005D6FB    mov         esi,edx
 0005D6FD    mov         ebx,eax
 0005D6FF    cmp         si,word ptr [ebx+38]
>0005D703    je          0005D778
 0005D705    mov         word ptr [ebx+38],si
 0005D709    test        si,si
>0005D70C    jne         0005D768
 0005D70E    push        esp
 0005D70F    call        user32.GetCursorPos
 0005D714    push        dword ptr [esp+4]
 0005D718    push        dword ptr [esp+4]
 0005D71C    call        user32.WindowFromPoint
 0005D721    mov         edi,eax
 0005D723    test        edi,edi
>0005D725    je          0005D768
 0005D727    push        0
 0005D729    push        edi
 0005D72A    call        user32.GetWindowThreadProcessId
 0005D72F    mov         ebp,eax
 0005D731    call        kernel32.GetCurrentThreadId
 0005D736    cmp         ebp,eax
>0005D738    jne         0005D768
 0005D73A    mov         eax,esp
 0005D73C    call        PointToSmallPoint
 0005D741    push        eax
 0005D742    push        0
 0005D744    push        84
 0005D749    push        edi
 0005D74A    call        user32.SendMessageA
 0005D74F    mov         ebx,eax
 0005D751    mov         dx,200
 0005D755    mov         eax,ebx
 0005D757    call        MakeLong
 0005D75C    push        eax
 0005D75D    push        edi
 0005D75E    push        20
 0005D760    push        edi
 0005D761    call        user32.SendMessageA
>0005D766    jmp         0005D77B
 0005D768    movsx       edx,si
 0005D76B    mov         eax,ebx
 0005D76D    call        TScreen.GetCursors
 0005D772    push        eax
 0005D773    call        user32.SetCursor
 0005D778    inc         dword ptr [ebx+3C]
 0005D77B    pop         ecx
 0005D77C    pop         edx
 0005D77D    pop         ebp
 0005D77E    pop         edi
 0005D77F    pop         esi
 0005D780    pop         ebx
 0005D781    ret
*}
end;

//0005D784
procedure TScreen.SetCursors(Index:Integer; Handle:HCURSOR);
begin
{*
 0005D784    push        ebx
 0005D785    push        esi
 0005D786    push        edi
 0005D787    mov         edi,ecx
 0005D789    mov         esi,edx
 0005D78B    mov         ebx,eax
 0005D78D    test        esi,esi
>0005D78F    jne         0005D7AB
 0005D791    test        edi,edi
>0005D793    jne         0005D7A6
 0005D795    push        7F00
 0005D79A    push        0
 0005D79C    call        user32.LoadCursorA
 0005D7A1    mov         dword ptr [ebx+54],eax
>0005D7A4    jmp         0005D7C8
 0005D7A6    mov         dword ptr [ebx+54],edi
>0005D7A9    jmp         0005D7C8
 0005D7AB    cmp         esi,0FFFFFFFF
>0005D7AE    je          0005D7C8
 0005D7B0    mov         edx,esi
 0005D7B2    mov         eax,ebx
 0005D7B4    call        TScreen.DeleteCursor
 0005D7B9    test        edi,edi
>0005D7BB    je          0005D7C8
 0005D7BD    mov         ecx,edi
 0005D7BF    mov         edx,esi
 0005D7C1    mov         eax,ebx
 0005D7C3    call        TScreen.InsertCursor
 0005D7C8    pop         edi
 0005D7C9    pop         esi
 0005D7CA    pop         ebx
 0005D7CB    ret
*}
end;

//0005D7CC
procedure TScreen.GetMetricSettings;
begin
{*
 0005D7CC    push        ebx
 0005D7CD    add         esp,0FFFFFFC4
 0005D7D0    mov         ebx,eax
 0005D7D2    push        0
 0005D7D4    lea         eax,[esp+4]
 0005D7D8    push        eax
 0005D7D9    push        3C
 0005D7DB    push        1F
 0005D7DD    call        user32.SystemParametersInfoA
 0005D7E2    test        eax,eax
>0005D7E4    je          0005D7F8
 0005D7E6    push        esp
 0005D7E7    call        gdi32.CreateFontIndirectA
 0005D7EC    mov         edx,eax
 0005D7EE    mov         eax,dword ptr [ebx+74]
 0005D7F1    call        TFont.SetHandle
>0005D7F6    jmp         0005D809
 0005D7F8    push        0D
 0005D7FA    call        gdi32.GetStockObject
 0005D7FF    mov         edx,eax
 0005D801    mov         eax,dword ptr [ebx+74]
 0005D804    call        TFont.SetHandle
 0005D809    add         esp,3C
 0005D80C    pop         ebx
 0005D80D    ret
*}
end;

//0005D810
procedure TScreen.DisableAlign;
begin
{*
 0005D810    inc         word ptr [eax+78]
 0005D814    ret
*}
end;

//0005D818
procedure TScreen.EnableAlign;
begin
{*
 0005D818    dec         word ptr [eax+78]
 0005D81C    cmp         word ptr [eax+78],0
>0005D821    jne         0005D82E
 0005D823    test        byte ptr [eax+7A],10
>0005D827    je          0005D82E
 0005D829    call        TScreen.Realign
 0005D82E    ret
*}
end;

//0005D830
procedure TScreen.Realign;
begin
{*
 0005D830    xor         edx,edx
 0005D832    call        TScreen.AlignForm
 0005D837    ret
*}
end;

//0005D838
function InsertBefore(C1:TCustomForm; C2:TCustomForm; AAlign:TAlign):Boolean;
begin
{*
 0005D838    push        ebp
 0005D839    mov         ebp,esp
 0005D83B    push        ecx
 0005D83C    push        ebx
 0005D83D    mov         byte ptr [ebp-1],cl
 0005D840    xor         ecx,ecx
 0005D842    mov         bl,byte ptr [ebp-1]
 0005D845    dec         bl
>0005D847    je          0005D857
 0005D849    dec         bl
>0005D84B    je          0005D862
 0005D84D    dec         bl
>0005D84F    je          0005D875
 0005D851    dec         bl
>0005D853    je          0005D880
>0005D855    jmp         0005D891
 0005D857    mov         edx,dword ptr [edx+34]
 0005D85A    cmp         edx,dword ptr [eax+34]
 0005D85D    setg        cl
>0005D860    jmp         0005D891
 0005D862    mov         ecx,dword ptr [edx+34]
 0005D865    add         ecx,dword ptr [edx+3C]
 0005D868    mov         edx,dword ptr [eax+34]
 0005D86B    add         edx,dword ptr [eax+3C]
 0005D86E    cmp         ecx,edx
 0005D870    setl        cl
>0005D873    jmp         0005D891
 0005D875    mov         edx,dword ptr [edx+30]
 0005D878    cmp         edx,dword ptr [eax+30]
 0005D87B    setg        cl
>0005D87E    jmp         0005D891
 0005D880    mov         ecx,dword ptr [edx+30]
 0005D883    add         ecx,dword ptr [edx+38]
 0005D886    mov         edx,dword ptr [eax+30]
 0005D889    add         edx,dword ptr [eax+38]
 0005D88C    cmp         ecx,edx
 0005D88E    setl        cl
 0005D891    mov         eax,ecx
 0005D893    pop         ebx
 0005D894    pop         ecx
 0005D895    pop         ebp
 0005D896    ret
*}
end;

//0005D898
procedure DoPosition(Form:TCustomForm; AAlign:TAlign);
begin
{*
 0005D898    push        ebp
 0005D899    mov         ebp,esp
 0005D89B    add         esp,0FFFFFFF0
 0005D89E    push        ebx
 0005D89F    push        esi
 0005D8A0    push        edi
 0005D8A1    mov         byte ptr [ebp-1],dl
 0005D8A4    mov         ebx,eax
 0005D8A6    mov         eax,dword ptr [ebp+8]
 0005D8A9    mov         esi,dword ptr [eax-4]
 0005D8AC    mov         esi,dword ptr [esi+8]
 0005D8AF    mov         eax,dword ptr [ebp+8]
 0005D8B2    mov         eax,dword ptr [eax-4]
 0005D8B5    sub         esi,dword ptr [eax]
 0005D8B7    test        esi,esi
>0005D8B9    jl          0005D8C4
 0005D8BB    mov         al,byte ptr [ebp-1]
 0005D8BE    add         al,0FD
 0005D8C0    sub         al,2
>0005D8C2    jae         0005D8C7
 0005D8C4    mov         esi,dword ptr [ebx+38]
 0005D8C7    mov         eax,dword ptr [ebp+8]
 0005D8CA    mov         eax,dword ptr [eax-4]
 0005D8CD    mov         eax,dword ptr [eax+0C]
 0005D8D0    mov         edx,dword ptr [ebp+8]
 0005D8D3    mov         edx,dword ptr [edx-4]
 0005D8D6    sub         eax,dword ptr [edx+4]
 0005D8D9    mov         dword ptr [ebp-10],eax
 0005D8DC    cmp         dword ptr [ebp-10],0
>0005D8E0    jl          0005D8EA
 0005D8E2    mov         al,byte ptr [ebp-1]
 0005D8E5    dec         eax
 0005D8E6    sub         al,2
>0005D8E8    jae         0005D8F0
 0005D8EA    mov         eax,dword ptr [ebx+3C]
 0005D8ED    mov         dword ptr [ebp-10],eax
 0005D8F0    cmp         byte ptr [ebp-1],1
>0005D8F4    jne         0005D91A
 0005D8F6    cmp         byte ptr [ebx+20B],2
>0005D8FD    jne         0005D91A
 0005D8FF    mov         eax,dword ptr [ebx+30]
 0005D902    mov         dword ptr [ebp-8],eax
 0005D905    mov         eax,dword ptr [ebx+34]
 0005D908    mov         dword ptr [ebp-0C],eax
 0005D90B    push        3D
 0005D90D    mov         eax,[000B582C];^gvar_000B66A0
 0005D912    mov         eax,dword ptr [eax]
 0005D914    call        eax
 0005D916    mov         esi,eax
>0005D918    jmp         0005D931
 0005D91A    mov         eax,dword ptr [ebp+8]
 0005D91D    mov         eax,dword ptr [eax-4]
 0005D920    mov         eax,dword ptr [eax]
 0005D922    mov         dword ptr [ebp-8],eax
 0005D925    mov         eax,dword ptr [ebp+8]
 0005D928    mov         eax,dword ptr [eax-4]
 0005D92B    mov         eax,dword ptr [eax+4]
 0005D92E    mov         dword ptr [ebp-0C],eax
 0005D931    mov         al,byte ptr [ebp-1]
 0005D934    dec         al
>0005D936    je          0005D946
 0005D938    dec         al
>0005D93A    je          0005D954
 0005D93C    dec         al
>0005D93E    je          0005D96E
 0005D940    dec         al
>0005D942    je          0005D978
>0005D944    jmp         0005D98D
 0005D946    mov         eax,dword ptr [ebp+8]
 0005D949    mov         eax,dword ptr [eax-4]
 0005D94C    mov         edx,dword ptr [ebp-10]
 0005D94F    add         dword ptr [eax+4],edx
>0005D952    jmp         0005D98D
 0005D954    mov         eax,dword ptr [ebp+8]
 0005D957    mov         eax,dword ptr [eax-4]
 0005D95A    mov         edx,dword ptr [ebp-10]
 0005D95D    sub         dword ptr [eax+0C],edx
 0005D960    mov         eax,dword ptr [ebp+8]
 0005D963    mov         eax,dword ptr [eax-4]
 0005D966    mov         eax,dword ptr [eax+0C]
 0005D969    mov         dword ptr [ebp-0C],eax
>0005D96C    jmp         0005D98D
 0005D96E    mov         eax,dword ptr [ebp+8]
 0005D971    mov         eax,dword ptr [eax-4]
 0005D974    add         dword ptr [eax],esi
>0005D976    jmp         0005D98D
 0005D978    mov         eax,dword ptr [ebp+8]
 0005D97B    mov         eax,dword ptr [eax-4]
 0005D97E    sub         dword ptr [eax+8],esi
 0005D981    mov         eax,dword ptr [ebp+8]
 0005D984    mov         eax,dword ptr [eax-4]
 0005D987    mov         eax,dword ptr [eax+8]
 0005D98A    mov         dword ptr [ebp-8],eax
 0005D98D    push        esi
 0005D98E    mov         eax,dword ptr [ebp-10]
 0005D991    push        eax
 0005D992    mov         ecx,dword ptr [ebp-0C]
 0005D995    mov         edx,dword ptr [ebp-8]
 0005D998    mov         eax,ebx
 0005D99A    mov         edi,dword ptr [eax]
 0005D99C    call        dword ptr [edi+80]
 0005D9A2    cmp         byte ptr [ebx+20B],2
>0005D9A9    jne         0005D9B4
 0005D9AB    sub         esi,dword ptr [ebp-8]
 0005D9AE    mov         eax,dword ptr [ebp-0C]
 0005D9B1    sub         dword ptr [ebp-10],eax
 0005D9B4    mov         eax,dword ptr [ebx+38]
 0005D9B7    cmp         esi,eax
>0005D9B9    jne         0005D9C3
 0005D9BB    mov         edx,dword ptr [ebx+3C]
 0005D9BE    cmp         edx,dword ptr [ebp-10]
>0005D9C1    je          0005DA41
 0005D9C3    xor         edx,edx
 0005D9C5    mov         dl,byte ptr [ebp-1]
 0005D9C8    cmp         edx,5
>0005D9CB    ja          0005DA41
 0005D9CD    jmp         dword ptr [edx*4+5D9D4]
 0005D9CD    dd          0005DA41
 0005D9CD    dd          0005D9EC
 0005D9CD    dd          0005D9FD
 0005D9CD    dd          0005DA0E
 0005D9CD    dd          0005DA1A
 0005D9CD    dd          0005DA27
 0005D9EC    mov         eax,dword ptr [ebp-10]
 0005D9EF    sub         eax,dword ptr [ebx+3C]
 0005D9F2    mov         edx,dword ptr [ebp+8]
 0005D9F5    mov         edx,dword ptr [edx-4]
 0005D9F8    sub         dword ptr [edx+4],eax
>0005D9FB    jmp         0005DA41
 0005D9FD    mov         eax,dword ptr [ebp-10]
 0005DA00    sub         eax,dword ptr [ebx+3C]
 0005DA03    mov         edx,dword ptr [ebp+8]
 0005DA06    mov         edx,dword ptr [edx-4]
 0005DA09    add         dword ptr [edx+0C],eax
>0005DA0C    jmp         0005DA41
 0005DA0E    sub         esi,eax
 0005DA10    mov         eax,dword ptr [ebp+8]
 0005DA13    mov         eax,dword ptr [eax-4]
 0005DA16    sub         dword ptr [eax],esi
>0005DA18    jmp         0005DA41
 0005DA1A    sub         esi,eax
 0005DA1C    mov         eax,dword ptr [ebp+8]
 0005DA1F    mov         eax,dword ptr [eax-4]
 0005DA22    add         dword ptr [eax+8],esi
>0005DA25    jmp         0005DA41
 0005DA27    sub         esi,eax
 0005DA29    mov         eax,dword ptr [ebp+8]
 0005DA2C    mov         eax,dword ptr [eax-4]
 0005DA2F    add         dword ptr [eax+8],esi
 0005DA32    mov         eax,dword ptr [ebp-10]
 0005DA35    sub         eax,dword ptr [ebx+3C]
 0005DA38    mov         edx,dword ptr [ebp+8]
 0005DA3B    mov         edx,dword ptr [edx-4]
 0005DA3E    add         dword ptr [edx+0C],eax
 0005DA41    pop         edi
 0005DA42    pop         esi
 0005DA43    pop         ebx
 0005DA44    mov         esp,ebp
 0005DA46    pop         ebp
 0005DA47    ret
*}
end;

//0005DA48
procedure DoAlign(AAlign:TAlign);
begin
{*
 0005DA48    push        ebp
 0005DA49    mov         ebp,esp
 0005DA4B    add         esp,0FFFFFFF8
 0005DA4E    push        ebx
 0005DA4F    push        esi
 0005DA50    push        edi
 0005DA51    mov         byte ptr [ebp-1],al
 0005DA54    mov         eax,dword ptr [ebp+8]
 0005DA57    mov         eax,dword ptr [eax-8]
 0005DA5A    mov         bx,0FFFF
 0005DA5E    call        @CallDynaInst
 0005DA63    mov         eax,dword ptr [ebp+8]
 0005DA66    cmp         dword ptr [eax-0C],0
>0005DA6A    je          0005DABE
 0005DA6C    mov         eax,dword ptr [ebp+8]
 0005DA6F    mov         eax,dword ptr [eax-0C]
 0005DA72    cmp         dword ptr [eax+24],0
>0005DA76    jne         0005DABE
 0005DA78    mov         eax,dword ptr [ebp+8]
 0005DA7B    mov         eax,dword ptr [eax-0C]
 0005DA7E    test        byte ptr [eax+20],10
>0005DA82    jne         0005DABE
 0005DA84    mov         eax,dword ptr [ebp+8]
 0005DA87    mov         eax,dword ptr [eax-0C]
 0005DA8A    cmp         byte ptr [eax+47],0
>0005DA8E    je          0005DABE
 0005DA90    mov         eax,dword ptr [ebp+8]
 0005DA93    mov         eax,dword ptr [eax-0C]
 0005DA96    mov         al,byte ptr [eax+4B]
 0005DA99    cmp         al,byte ptr [ebp-1]
>0005DA9C    jne         0005DABE
 0005DA9E    mov         eax,dword ptr [ebp+8]
 0005DAA1    mov         eax,dword ptr [eax-0C]
 0005DAA4    cmp         byte ptr [eax+20B],1
>0005DAAB    je          0005DABE
 0005DAAD    mov         eax,dword ptr [ebp+8]
 0005DAB0    mov         edx,dword ptr [eax-0C]
 0005DAB3    mov         eax,dword ptr [ebp+8]
 0005DAB6    mov         eax,dword ptr [eax-8]
 0005DAB9    call        TList.Add
 0005DABE    mov         eax,dword ptr [ebp+8]
 0005DAC1    mov         eax,dword ptr [eax-10]
 0005DAC4    call        TScreen.GetCustomFormCount
 0005DAC9    mov         edi,eax
 0005DACB    dec         edi
 0005DACC    test        edi,edi
>0005DACE    jl          0005DB59
 0005DAD4    inc         edi
 0005DAD5    mov         dword ptr [ebp-8],0
 0005DADC    mov         eax,dword ptr [ebp+8]
 0005DADF    mov         eax,dword ptr [eax-10]
 0005DAE2    mov         edx,dword ptr [ebp-8]
 0005DAE5    call        TScreen.GetCustomForms
 0005DAEA    mov         ebx,eax
 0005DAEC    cmp         dword ptr [ebx+24],0
>0005DAF0    jne         0005DB53
 0005DAF2    mov         al,byte ptr [ebx+4B]
 0005DAF5    cmp         al,byte ptr [ebp-1]
>0005DAF8    jne         0005DB53
 0005DAFA    test        byte ptr [ebx+20],10
>0005DAFE    jne         0005DB53
 0005DB00    cmp         byte ptr [ebx+47],0
>0005DB04    je          0005DB53
 0005DB06    cmp         byte ptr [ebx+20B],1
>0005DB0D    je          0005DB53
 0005DB0F    mov         eax,dword ptr [ebp+8]
 0005DB12    cmp         ebx,dword ptr [eax-0C]
>0005DB15    je          0005DB53
 0005DB17    xor         esi,esi
>0005DB19    jmp         0005DB1C
 0005DB1B    inc         esi
 0005DB1C    mov         eax,dword ptr [ebp+8]
 0005DB1F    mov         eax,dword ptr [eax-8]
 0005DB22    cmp         esi,dword ptr [eax+8]
>0005DB25    jge         0005DB44
 0005DB27    mov         eax,dword ptr [ebp+8]
 0005DB2A    mov         eax,dword ptr [eax-8]
 0005DB2D    mov         edx,esi
 0005DB2F    call        TList.Get
 0005DB34    mov         edx,eax
 0005DB36    mov         cl,byte ptr [ebp-1]
 0005DB39    mov         eax,ebx
 0005DB3B    call        InsertBefore
 0005DB40    test        al,al
>0005DB42    je          0005DB1B
 0005DB44    mov         eax,dword ptr [ebp+8]
 0005DB47    mov         eax,dword ptr [eax-8]
 0005DB4A    mov         ecx,ebx
 0005DB4C    mov         edx,esi
 0005DB4E    call        TList.Insert
 0005DB53    inc         dword ptr [ebp-8]
 0005DB56    dec         edi
>0005DB57    jne         0005DADC
 0005DB59    mov         eax,dword ptr [ebp+8]
 0005DB5C    mov         eax,dword ptr [eax-8]
 0005DB5F    mov         edi,dword ptr [eax+8]
 0005DB62    dec         edi
 0005DB63    test        edi,edi
>0005DB65    jl          0005DB90
 0005DB67    inc         edi
 0005DB68    mov         dword ptr [ebp-8],0
 0005DB6F    mov         eax,dword ptr [ebp+8]
 0005DB72    push        eax
 0005DB73    mov         eax,dword ptr [ebp+8]
 0005DB76    mov         eax,dword ptr [eax-8]
 0005DB79    mov         edx,dword ptr [ebp-8]
 0005DB7C    call        TList.Get
 0005DB81    mov         dl,byte ptr [ebp-1]
 0005DB84    call        DoPosition
 0005DB89    pop         ecx
 0005DB8A    inc         dword ptr [ebp-8]
 0005DB8D    dec         edi
>0005DB8E    jne         0005DB6F
 0005DB90    pop         edi
 0005DB91    pop         esi
 0005DB92    pop         ebx
 0005DB93    pop         ecx
 0005DB94    pop         ecx
 0005DB95    pop         ebp
 0005DB96    ret
*}
end;

//0005DB98
function AlignWork:Boolean;
begin
{*
 0005DB98    push        ebp
 0005DB99    mov         ebp,esp
 0005DB9B    push        ebx
 0005DB9C    push        esi
 0005DB9D    mov         bl,1
 0005DB9F    mov         eax,dword ptr [ebp+8]
 0005DBA2    mov         eax,dword ptr [eax-10]
 0005DBA5    call        TScreen.GetCustomFormCount
 0005DBAA    mov         esi,eax
 0005DBAC    dec         esi
 0005DBAD    cmp         esi,0
>0005DBB0    jl          0005DBE6
 0005DBB2    mov         eax,dword ptr [ebp+8]
 0005DBB5    mov         eax,dword ptr [eax-10]
 0005DBB8    mov         edx,esi
 0005DBBA    call        TScreen.GetCustomForms
 0005DBBF    cmp         dword ptr [eax+24],0
>0005DBC3    jne         0005DBE0
 0005DBC5    test        byte ptr [eax+20],10
>0005DBC9    jne         0005DBE0
 0005DBCB    cmp         byte ptr [eax+4B],0
>0005DBCF    je          0005DBE0
 0005DBD1    cmp         byte ptr [eax+47],0
>0005DBD5    je          0005DBE0
 0005DBD7    cmp         byte ptr [eax+20B],1
>0005DBDE    jne         0005DBE8
 0005DBE0    dec         esi
 0005DBE1    cmp         esi,0FFFFFFFF
>0005DBE4    jne         0005DBB2
 0005DBE6    xor         ebx,ebx
 0005DBE8    mov         eax,ebx
 0005DBEA    pop         esi
 0005DBEB    pop         ebx
 0005DBEC    pop         ebp
 0005DBED    ret
*}
end;

//0005DBF0
procedure TScreen.AlignForms(AForm:TCustomForm; var Rect:TRect);
begin
{*
 0005DBF0    push        ebp
 0005DBF1    mov         ebp,esp
 0005DBF3    add         esp,0FFFFFFF0
 0005DBF6    mov         dword ptr [ebp-4],ecx
 0005DBF9    mov         dword ptr [ebp-0C],edx
 0005DBFC    mov         dword ptr [ebp-10],eax
 0005DBFF    push        ebp
 0005DC00    call        AlignWork
 0005DC05    pop         ecx
 0005DC06    test        al,al
>0005DC08    je          0005DC71
 0005DC0A    mov         dl,1
 0005DC0C    mov         eax,[0001EEC4];TList
 0005DC11    call        TObject.Create
 0005DC16    mov         dword ptr [ebp-8],eax
 0005DC19    xor         eax,eax
 0005DC1B    push        ebp
 0005DC1C    push        5DC6A
 0005DC21    push        dword ptr fs:[eax]
 0005DC24    mov         dword ptr fs:[eax],esp
 0005DC27    push        ebp
 0005DC28    mov         al,1
 0005DC2A    call        DoAlign
 0005DC2F    pop         ecx
 0005DC30    push        ebp
 0005DC31    mov         al,2
 0005DC33    call        DoAlign
 0005DC38    pop         ecx
 0005DC39    push        ebp
 0005DC3A    mov         al,3
 0005DC3C    call        DoAlign
 0005DC41    pop         ecx
 0005DC42    push        ebp
 0005DC43    mov         al,4
 0005DC45    call        DoAlign
 0005DC4A    pop         ecx
 0005DC4B    push        ebp
 0005DC4C    mov         al,5
 0005DC4E    call        DoAlign
 0005DC53    pop         ecx
 0005DC54    xor         eax,eax
 0005DC56    pop         edx
 0005DC57    pop         ecx
 0005DC58    pop         ecx
 0005DC59    mov         dword ptr fs:[eax],edx
 0005DC5C    push        5DC71
 0005DC61    mov         eax,dword ptr [ebp-8]
 0005DC64    call        TObject.Free
 0005DC69    ret
>0005DC6A    jmp         @HandleFinally
>0005DC6F    jmp         0005DC61
 0005DC71    mov         esp,ebp
 0005DC73    pop         ebp
 0005DC74    ret
*}
end;

//0005DC78
procedure TScreen.AlignForm(AForm:TCustomForm);
begin
{*
 0005DC78    push        ebp
 0005DC79    mov         ebp,esp
 0005DC7B    add         esp,0FFFFFFEC
 0005DC7E    push        ebx
 0005DC7F    mov         ebx,edx
 0005DC81    mov         dword ptr [ebp-4],eax
 0005DC84    mov         eax,dword ptr [ebp-4]
 0005DC87    cmp         word ptr [eax+78],0
>0005DC8C    je          0005DC98
 0005DC8E    mov         eax,dword ptr [ebp-4]
 0005DC91    or          word ptr [eax+7A],10
>0005DC96    jmp         0005DCEF
 0005DC98    mov         eax,dword ptr [ebp-4]
 0005DC9B    call        TScreen.DisableAlign
 0005DCA0    xor         eax,eax
 0005DCA2    push        ebp
 0005DCA3    push        5DCE8
 0005DCA8    push        dword ptr fs:[eax]
 0005DCAB    mov         dword ptr fs:[eax],esp
 0005DCAE    push        0
 0005DCB0    lea         eax,[ebp-14]
 0005DCB3    push        eax
 0005DCB4    push        0
 0005DCB6    push        30
 0005DCB8    call        user32.SystemParametersInfoA
 0005DCBD    lea         ecx,[ebp-14]
 0005DCC0    mov         edx,ebx
 0005DCC2    mov         eax,dword ptr [ebp-4]
 0005DCC5    call        TScreen.AlignForms
 0005DCCA    xor         eax,eax
 0005DCCC    pop         edx
 0005DCCD    pop         ecx
 0005DCCE    pop         ecx
 0005DCCF    mov         dword ptr fs:[eax],edx
 0005DCD2    push        5DCEF
 0005DCD7    mov         eax,dword ptr [ebp-4]
 0005DCDA    and         word ptr [eax+7A],0FFFFFFEF
 0005DCDF    mov         eax,dword ptr [ebp-4]
 0005DCE2    call        TScreen.EnableAlign
 0005DCE7    ret
>0005DCE8    jmp         @HandleFinally
>0005DCED    jmp         0005DCD7
 0005DCEF    pop         ebx
 0005DCF0    mov         esp,ebp
 0005DCF2    pop         ebp
 0005DCF3    ret
*}
end;

//0005DCF4
function GetHint(Control:TControl):AnsiString;
begin
{*
 0005DCF4    push        ebx
 0005DCF5    push        esi
 0005DCF6    mov         esi,edx
 0005DCF8    mov         ebx,eax
 0005DCFA    test        ebx,ebx
>0005DCFC    je          0005DD1A
 0005DCFE    cmp         dword ptr [ebx+74],0
>0005DD02    jne         0005DD09
 0005DD04    mov         ebx,dword ptr [ebx+24]
>0005DD07    jmp         0005DD16
 0005DD09    mov         eax,esi
 0005DD0B    mov         edx,dword ptr [ebx+74]
 0005DD0E    call        @LStrLAsg
 0005DD13    pop         esi
 0005DD14    pop         ebx
 0005DD15    ret
 0005DD16    test        ebx,ebx
>0005DD18    jne         0005DCFE
 0005DD1A    mov         eax,esi
 0005DD1C    call        @LStrClr
 0005DD21    pop         esi
 0005DD22    pop         ebx
 0005DD23    ret
*}
end;

//0005DD24
function GetHintControl(Control:TControl):TControl;
begin
{*
>0005DD24    jmp         0005DD29
 0005DD26    mov         eax,dword ptr [eax+24]
 0005DD29    test        eax,eax
>0005DD2B    je          0005DD36
 0005DD2D    cmp         byte ptr [eax+85],0
>0005DD34    je          0005DD26
 0005DD36    test        eax,eax
>0005DD38    je          0005DD42
 0005DD3A    test        byte ptr [eax+20],10
>0005DD3E    je          0005DD42
 0005DD40    xor         eax,eax
 0005DD42    ret
*}
end;

//0005DD44
procedure HintTimerProc(Wnd:HWND; Msg:Longint; TimerID:Longint; SysTime:Longint); stdcall;
begin
{*
 0005DD44    push        ebp
 0005DD45    mov         ebp,esp
 0005DD47    push        ebx
 0005DD48    push        esi
 0005DD49    push        edi
 0005DD4A    cmp         dword ptr ds:[0B67B0],0;Application:TApplication
>0005DD51    je          0005DD8F
 0005DD53    xor         eax,eax
 0005DD55    push        ebp
 0005DD56    push        5DD75
 0005DD5B    push        dword ptr fs:[eax]
 0005DD5E    mov         dword ptr fs:[eax],esp
 0005DD61    mov         eax,[000B67B0];Application:TApplication
 0005DD66    call        TApplication.HintTimerExpired
 0005DD6B    xor         eax,eax
 0005DD6D    pop         edx
 0005DD6E    pop         ecx
 0005DD6F    pop         ecx
 0005DD70    mov         dword ptr fs:[eax],edx
>0005DD73    jmp         0005DD8F
>0005DD75    jmp         @HandleAnyException
 0005DD7A    mov         edx,dword ptr ds:[0B67B0];Application:TApplication
 0005DD80    mov         eax,[000B67B0];Application:TApplication
 0005DD85    call        TApplication.HandleException
 0005DD8A    call        @DoneExcept
 0005DD8F    pop         edi
 0005DD90    pop         esi
 0005DD91    pop         ebx
 0005DD92    pop         ebp
 0005DD93    ret         10
*}
end;

//0005DD98
procedure HintMouseThread(Param:Integer); stdcall;
begin
{*
 0005DD98    push        ebp
 0005DD99    mov         ebp,esp
 0005DD9B    add         esp,0FFFFFFF8
 0005DD9E    push        ebx
 0005DD9F    mov         ebx,0B67B0;Application:TApplication
 0005DDA4    call        kernel32.GetCurrentThreadId
 0005DDA9    mov         [000B67E4],eax
>0005DDAE    jmp         0005DDD9
 0005DDB0    cmp         dword ptr [ebx],0
>0005DDB3    je          0005DDD9
 0005DDB5    mov         eax,dword ptr [ebx]
 0005DDB7    cmp         dword ptr [eax+48],0
>0005DDBB    je          0005DDD9
 0005DDBD    lea         eax,[ebp-8]
 0005DDC0    push        eax
 0005DDC1    call        user32.GetCursorPos
 0005DDC6    lea         eax,[ebp-8]
 0005DDC9    call        FindVCLWindow
 0005DDCE    test        eax,eax
>0005DDD0    jne         0005DDD9
 0005DDD2    mov         eax,dword ptr [ebx]
 0005DDD4    call        TApplication.CancelHint
 0005DDD9    push        64
 0005DDDB    mov         eax,[000B67E8]
 0005DDE0    push        eax
 0005DDE1    call        kernel32.WaitForSingleObject
 0005DDE6    cmp         eax,102
>0005DDEB    je          0005DDB0
 0005DDED    pop         ebx
 0005DDEE    pop         ecx
 0005DDEF    pop         ecx
 0005DDF0    pop         ebp
 0005DDF1    ret         4
*}
end;

//0005DDF4
function HintGetMsgHook(nCode:Integer; wParam:Longint; var Msg:TMsg):Longint; stdcall;
begin
{*
 0005DDF4    push        ebp
 0005DDF5    mov         ebp,esp
 0005DDF7    push        ebx
 0005DDF8    push        esi
 0005DDF9    push        edi
 0005DDFA    mov         esi,dword ptr [ebp+10]
 0005DDFD    mov         ebx,dword ptr [ebp+8]
 0005DE00    push        esi
 0005DE01    mov         eax,dword ptr [ebp+0C]
 0005DE04    push        eax
 0005DE05    push        ebx
 0005DE06    mov         eax,[000B67EC]
 0005DE0B    push        eax
 0005DE0C    call        user32.CallNextHookEx
 0005DE11    mov         edi,eax
 0005DE13    test        ebx,ebx
>0005DE15    jl          0005DE2C
 0005DE17    cmp         dword ptr ds:[0B67B0],0;Application:TApplication
>0005DE1E    je          0005DE2C
 0005DE20    mov         edx,esi
 0005DE22    mov         eax,[000B67B0];Application:TApplication
 0005DE27    call        TApplication.IsHintMsg
 0005DE2C    mov         eax,edi
 0005DE2E    pop         edi
 0005DE2F    pop         esi
 0005DE30    pop         ebx
 0005DE31    pop         ebp
 0005DE32    ret         0C
*}
end;

//0005DE38
procedure HookHintHooks;
begin
{*
 0005DE38    push        ecx
 0005DE39    mov         eax,[000B67B0];Application:TApplication
 0005DE3E    cmp         byte ptr [eax+8D],0
>0005DE45    jne         0005DEA9
 0005DE47    cmp         dword ptr ds:[0B67EC],0
>0005DE4E    jne         0005DE6A
 0005DE50    call        kernel32.GetCurrentThreadId
 0005DE55    push        eax
 0005DE56    push        0
 0005DE58    mov         eax,5DDF4;HintGetMsgHook:Longint
 0005DE5D    push        eax
 0005DE5E    push        3
 0005DE60    call        user32.SetWindowsHookExA
 0005DE65    mov         [000B67EC],eax
 0005DE6A    cmp         dword ptr ds:[0B67E8],0
>0005DE71    jne         0005DE85
 0005DE73    push        0
 0005DE75    push        0
 0005DE77    push        0
 0005DE79    push        0
 0005DE7B    call        kernel32.CreateEventA
 0005DE80    mov         [000B67E8],eax
 0005DE85    cmp         dword ptr ds:[0B67F0],0
>0005DE8C    jne         0005DEA9
 0005DE8E    push        esp
 0005DE8F    push        0
 0005DE91    push        0
 0005DE93    push        5DD98;HintMouseThread
 0005DE98    push        3E8
 0005DE9D    push        0
 0005DE9F    call        kernel32.CreateThread
 0005DEA4    mov         [000B67F0],eax
 0005DEA9    pop         edx
 0005DEAA    ret
*}
end;

//0005DEAC
procedure UnhookHintHooks;
begin
{*
 0005DEAC    cmp         dword ptr ds:[0B67EC],0
>0005DEB3    je          0005DEC0
 0005DEB5    mov         eax,[000B67EC]
 0005DEBA    push        eax
 0005DEBB    call        user32.UnhookWindowsHookEx
 0005DEC0    xor         eax,eax
 0005DEC2    mov         [000B67EC],eax
 0005DEC7    cmp         dword ptr ds:[0B67F0],0
>0005DECE    je          0005DF07
 0005DED0    mov         eax,[000B67E8]
 0005DED5    push        eax
 0005DED6    call        kernel32.SetEvent
 0005DEDB    call        kernel32.GetCurrentThreadId
 0005DEE0    cmp         eax,dword ptr ds:[0B67E4]
>0005DEE6    je          0005DEF5
 0005DEE8    push        0FF
 0005DEEA    mov         eax,[000B67F0]
 0005DEEF    push        eax
 0005DEF0    call        kernel32.WaitForSingleObject
 0005DEF5    mov         eax,[000B67F0]
 0005DEFA    push        eax
 0005DEFB    call        kernel32.CloseHandle
 0005DF00    xor         eax,eax
 0005DF02    mov         [000B67F0],eax
 0005DF07    ret
*}
end;

//0005DF08
function GetAnimation:Boolean;
begin
{*
 0005DF08    add         esp,0FFFFFFF8
 0005DF0B    mov         dword ptr [esp],8
 0005DF12    push        0
 0005DF14    lea         eax,[esp+4]
 0005DF18    push        eax
 0005DF19    push        8
 0005DF1B    push        48
 0005DF1D    call        user32.SystemParametersInfoA
 0005DF22    test        eax,eax
>0005DF24    je          0005DF31
 0005DF26    cmp         dword ptr [esp+4],0
 0005DF2B    setne       al
 0005DF2E    pop         ecx
 0005DF2F    pop         edx
 0005DF30    ret
 0005DF31    xor         eax,eax
 0005DF33    pop         ecx
 0005DF34    pop         edx
 0005DF35    ret
*}
end;

//0005DF38
procedure SetAnimation(Value:Boolean);
begin
{*
 0005DF38    add         esp,0FFFFFFF8
 0005DF3B    mov         dword ptr [esp],8
 0005DF42    neg         al
 0005DF44    sbb         eax,eax
 0005DF46    mov         dword ptr [esp+4],eax
 0005DF4A    push        0
 0005DF4C    lea         eax,[esp+4]
 0005DF50    push        eax
 0005DF51    push        8
 0005DF53    push        49
 0005DF55    call        user32.SystemParametersInfoA
 0005DF5A    pop         ecx
 0005DF5B    pop         edx
 0005DF5C    ret
*}
end;

//0005DF60
procedure ShowWinNoAnimate(Handle:HWND; CmdShow:Integer);
begin
{*
 0005DF60    push        ebx
 0005DF61    push        esi
 0005DF62    push        edi
 0005DF63    mov         edi,edx
 0005DF65    mov         esi,eax
 0005DF67    call        GetAnimation
 0005DF6C    mov         ebx,eax
 0005DF6E    test        bl,bl
>0005DF70    je          0005DF79
 0005DF72    xor         eax,eax
 0005DF74    call        SetAnimation
 0005DF79    push        edi
 0005DF7A    push        esi
 0005DF7B    call        user32.ShowWindow
 0005DF80    test        bl,bl
>0005DF82    je          0005DF8B
 0005DF84    mov         al,1
 0005DF86    call        SetAnimation
 0005DF8B    pop         edi
 0005DF8C    pop         esi
 0005DF8D    pop         ebx
 0005DF8E    ret
*}
end;

//0005DF90
constructor _NF__9C6;
begin
{*
 0005DF90    push        esp
 0005DF91    inc         ecx
>0005DF92    jo          0005E004
 0005DF94    ins         byte ptr [edi],dl
 0005DF95    imul        esp,dword ptr [ebx+61],6E6F6974
 0005DF9C    add         byte ptr [eax],al
 0005DF9E    add         byte ptr [eax],al
 0005DFA0    push        ebp
 0005DFA1    mov         ebp,esp
 0005DFA3    add         esp,0FFFFFEFC
 0005DFA9    push        ebx
 0005DFAA    push        esi
 0005DFAB    test        dl,dl
>0005DFAD    je          0005DFB7
 0005DFAF    add         esp,0FFFFFFF0
 0005DFB2    call        @ClassCreate
 0005DFB7    mov         byte ptr [ebp-1],dl
 0005DFBA    mov         ebx,eax
 0005DFBC    xor         edx,edx
 0005DFBE    mov         eax,ebx
 0005DFC0    call        TComponent.Create
 0005DFC5    mov         byte ptr [ebx+28],0
 0005DFC9    mov         dl,1
 0005DFCB    mov         eax,[0001EEC4];TList
 0005DFD0    call        TObject.Create
 0005DFD5    mov         dword ptr [ebx+78],eax
 0005DFD8    mov         dl,1
 0005DFDA    mov         eax,[0001EEC4];TList
 0005DFDF    call        TObject.Create
 0005DFE4    mov         dword ptr [ebx+90],eax
 0005DFEA    xor         eax,eax
 0005DFEC    mov         dword ptr [ebx+48],eax
 0005DFEF    xor         eax,eax
 0005DFF1    mov         dword ptr [ebx+6C],eax
 0005DFF4    mov         dword ptr [ebx+44],80000018
 0005DFFB    mov         dword ptr [ebx+60],1F4
 0005E002    mov         byte ptr [ebx+64],1
 0005E006    xor         eax,eax
 0005E008    mov         dword ptr [ebx+68],eax
 0005E00B    mov         dword ptr [ebx+5C],9C4
 0005E012    mov         byte ptr [ebx+70],0
 0005E016    mov         byte ptr [ebx+85],1
 0005E01D    mov         dl,1
 0005E01F    mov         eax,[000290B0];TIcon
 0005E024    call        TIcon.Create
 0005E029    mov         esi,eax
 0005E02B    mov         dword ptr [ebx+80],esi
 0005E031    push        5E128
 0005E036    mov         eax,[000B5800];MainInstance:Cardinal
 0005E03B    mov         eax,dword ptr [eax]
 0005E03D    push        eax
 0005E03E    call        user32.LoadIconA
 0005E043    mov         edx,eax
 0005E045    mov         eax,esi
 0005E047    call        TIcon.SetHandle
 0005E04C    mov         eax,dword ptr [ebx+80]
 0005E052    mov         dword ptr [eax+8],ebx
 0005E055    mov         dword ptr [eax+4],5FA64;TApplication.IconChanged
 0005E05C    push        100
 0005E061    lea         eax,[ebp-101]
 0005E067    push        eax
 0005E068    mov         eax,[000B5800];MainInstance:Cardinal
 0005E06D    mov         eax,dword ptr [eax]
 0005E06F    push        eax
 0005E070    call        kernel32.GetModuleFileNameA
 0005E075    lea         eax,[ebp-101]
 0005E07B    push        eax
 0005E07C    lea         eax,[ebp-101]
 0005E082    push        eax
 0005E083    call        user32.OemToCharA
 0005E088    lea         eax,[ebp-101]
 0005E08E    mov         dl,5C
 0005E090    call        AnsiStrRScan
 0005E095    test        eax,eax
>0005E097    je          0005E0A7
 0005E099    lea         edx,[eax+1]
 0005E09C    lea         eax,[ebp-101]
 0005E0A2    call        StrCopy
 0005E0A7    lea         eax,[ebp-101]
 0005E0AD    mov         dl,2E
 0005E0AF    call        AnsiStrScan
 0005E0B4    test        eax,eax
>0005E0B6    je          0005E0BB
 0005E0B8    mov         byte ptr [eax],0
 0005E0BB    lea         eax,[ebp-101]
 0005E0C1    inc         eax
 0005E0C2    push        eax
 0005E0C3    call        user32.CharLowerA
 0005E0C8    lea         eax,[ebx+74]
 0005E0CB    lea         edx,[ebp-101]
 0005E0D1    mov         ecx,100
 0005E0D6    call        @LStrFromArray
 0005E0DB    mov         eax,[000B563C];IsLibrary:Boolean
 0005E0E0    cmp         byte ptr [eax],0
>0005E0E3    jne         0005E0EC
 0005E0E5    mov         eax,ebx
 0005E0E7    call        TApplication.CreateHandle
 0005E0EC    mov         byte ptr [ebx+41],1
 0005E0F0    mov         byte ptr [ebx+42],1
 0005E0F4    mov         byte ptr [ebx+43],1
 0005E0F8    mov         byte ptr [ebx+86],1
 0005E0FF    xor         eax,eax
 0005E101    mov         dword ptr [ebx+88],eax
 0005E107    mov         eax,ebx
 0005E109    cmp         byte ptr [ebp-1],0
>0005E10D    je          0005E11E
 0005E10F    call        @AfterConstruction
 0005E114    pop         dword ptr fs:[0]
 0005E11B    add         esp,0C
 0005E11E    mov         eax,ebx
 0005E120    pop         esi
 0005E121    pop         ebx
 0005E122    mov         esp,ebp
 0005E124    pop         ebp
 0005E125    ret
*}
end;

//0005DFA0
constructor TApplication.Create(AOwner:TComponent);
begin
{*
 0005DFA0    push        ebp
 0005DFA1    mov         ebp,esp
 0005DFA3    add         esp,0FFFFFEFC
 0005DFA9    push        ebx
 0005DFAA    push        esi
 0005DFAB    test        dl,dl
>0005DFAD    je          0005DFB7
 0005DFAF    add         esp,0FFFFFFF0
 0005DFB2    call        @ClassCreate
 0005DFB7    mov         byte ptr [ebp-1],dl
 0005DFBA    mov         ebx,eax
 0005DFBC    xor         edx,edx
 0005DFBE    mov         eax,ebx
 0005DFC0    call        TComponent.Create
 0005DFC5    mov         byte ptr [ebx+28],0
 0005DFC9    mov         dl,1
 0005DFCB    mov         eax,[0001EEC4];TList
 0005DFD0    call        TObject.Create
 0005DFD5    mov         dword ptr [ebx+78],eax
 0005DFD8    mov         dl,1
 0005DFDA    mov         eax,[0001EEC4];TList
 0005DFDF    call        TObject.Create
 0005DFE4    mov         dword ptr [ebx+90],eax
 0005DFEA    xor         eax,eax
 0005DFEC    mov         dword ptr [ebx+48],eax
 0005DFEF    xor         eax,eax
 0005DFF1    mov         dword ptr [ebx+6C],eax
 0005DFF4    mov         dword ptr [ebx+44],80000018
 0005DFFB    mov         dword ptr [ebx+60],1F4
 0005E002    mov         byte ptr [ebx+64],1
 0005E006    xor         eax,eax
 0005E008    mov         dword ptr [ebx+68],eax
 0005E00B    mov         dword ptr [ebx+5C],9C4
 0005E012    mov         byte ptr [ebx+70],0
 0005E016    mov         byte ptr [ebx+85],1
 0005E01D    mov         dl,1
 0005E01F    mov         eax,[000290B0];TIcon
 0005E024    call        TIcon.Create
 0005E029    mov         esi,eax
 0005E02B    mov         dword ptr [ebx+80],esi
 0005E031    push        5E128
 0005E036    mov         eax,[000B5800];MainInstance:Cardinal
 0005E03B    mov         eax,dword ptr [eax]
 0005E03D    push        eax
 0005E03E    call        user32.LoadIconA
 0005E043    mov         edx,eax
 0005E045    mov         eax,esi
 0005E047    call        TIcon.SetHandle
 0005E04C    mov         eax,dword ptr [ebx+80]
 0005E052    mov         dword ptr [eax+8],ebx
 0005E055    mov         dword ptr [eax+4],5FA64;TApplication.IconChanged
 0005E05C    push        100
 0005E061    lea         eax,[ebp-101]
 0005E067    push        eax
 0005E068    mov         eax,[000B5800];MainInstance:Cardinal
 0005E06D    mov         eax,dword ptr [eax]
 0005E06F    push        eax
 0005E070    call        kernel32.GetModuleFileNameA
 0005E075    lea         eax,[ebp-101]
 0005E07B    push        eax
 0005E07C    lea         eax,[ebp-101]
 0005E082    push        eax
 0005E083    call        user32.OemToCharA
 0005E088    lea         eax,[ebp-101]
 0005E08E    mov         dl,5C
 0005E090    call        AnsiStrRScan
 0005E095    test        eax,eax
>0005E097    je          0005E0A7
 0005E099    lea         edx,[eax+1]
 0005E09C    lea         eax,[ebp-101]
 0005E0A2    call        StrCopy
 0005E0A7    lea         eax,[ebp-101]
 0005E0AD    mov         dl,2E
 0005E0AF    call        AnsiStrScan
 0005E0B4    test        eax,eax
>0005E0B6    je          0005E0BB
 0005E0B8    mov         byte ptr [eax],0
 0005E0BB    lea         eax,[ebp-101]
 0005E0C1    inc         eax
 0005E0C2    push        eax
 0005E0C3    call        user32.CharLowerA
 0005E0C8    lea         eax,[ebx+74]
 0005E0CB    lea         edx,[ebp-101]
 0005E0D1    mov         ecx,100
 0005E0D6    call        @LStrFromArray
 0005E0DB    mov         eax,[000B563C];IsLibrary:Boolean
 0005E0E0    cmp         byte ptr [eax],0
>0005E0E3    jne         0005E0EC
 0005E0E5    mov         eax,ebx
 0005E0E7    call        TApplication.CreateHandle
 0005E0EC    mov         byte ptr [ebx+41],1
 0005E0F0    mov         byte ptr [ebx+42],1
 0005E0F4    mov         byte ptr [ebx+43],1
 0005E0F8    mov         byte ptr [ebx+86],1
 0005E0FF    xor         eax,eax
 0005E101    mov         dword ptr [ebx+88],eax
 0005E107    mov         eax,ebx
 0005E109    cmp         byte ptr [ebp-1],0
>0005E10D    je          0005E11E
 0005E10F    call        @AfterConstruction
 0005E114    pop         dword ptr fs:[0]
 0005E11B    add         esp,0C
 0005E11E    mov         eax,ebx
 0005E120    pop         esi
 0005E121    pop         ebx
 0005E122    mov         esp,ebp
 0005E124    pop         ebp
 0005E125    ret
*}
end;

//0005E134
destructor TApplication.Destroy;
begin
{*
 0005E134    push        ebx
 0005E135    push        esi
 0005E136    call        @BeforeDestruction
 0005E13B    mov         ebx,edx
 0005E13D    mov         esi,eax
 0005E13F    mov         eax,dword ptr [esi+88]
 0005E145    cmp         eax,20
>0005E148    jbe         0005E150
 0005E14A    push        eax
 0005E14B    call        kernel32.FreeLibrary
 0005E150    cmp         dword ptr [esi+24],0
>0005E154    je          0005E173
 0005E156    cmp         byte ptr [esi+8C],0
>0005E15D    je          0005E173
 0005E15F    cmp         dword ptr [esi+38],0
>0005E163    je          0005E173
 0005E165    xor         ecx,ecx
 0005E167    mov         edx,2
 0005E16C    mov         eax,esi
 0005E16E    call        TApplication.HelpCommand
 0005E173    mov         byte ptr [esi+85],0
 0005E17A    mov         eax,esi
 0005E17C    call        TApplication.CancelHint
 0005E181    xor         edx,edx
 0005E183    mov         eax,esi
 0005E185    call        TApplication.SetShowHint
 0005E18A    mov         edx,ebx
 0005E18C    and         dl,0FC
 0005E18F    mov         eax,esi
 0005E191    call        TComponent.Destroy
 0005E196    push        esi
 0005E197    push        5E5A4;TApplication.CheckIniChange:Boolean
 0005E19C    mov         eax,esi
 0005E19E    call        TApplication.UnhookMainWindow
 0005E1A3    mov         eax,dword ptr [esi+24]
 0005E1A6    test        eax,eax
>0005E1A8    je          0005E1D6
 0005E1AA    cmp         byte ptr [esi+8C],0
>0005E1B1    je          0005E1D6
 0005E1B3    mov         edx,dword ptr ds:[0B58C0];NewStyleControls:Boolean
 0005E1B9    cmp         byte ptr [edx],0
>0005E1BC    je          0005E1CD
 0005E1BE    push        0
 0005E1C0    push        1
 0005E1C2    push        80
 0005E1C7    push        eax
 0005E1C8    call        user32.SendMessageA
 0005E1CD    mov         eax,dword ptr [esi+24]
 0005E1D0    push        eax
 0005E1D1    call        user32.DestroyWindow
 0005E1D6    mov         eax,dword ptr [esi+2C]
 0005E1D9    test        eax,eax
>0005E1DB    je          0005E1E2
 0005E1DD    call        FreeObjectInstance
 0005E1E2    call        DoneCtl3D
 0005E1E7    mov         eax,dword ptr [esi+90]
 0005E1ED    call        TObject.Free
 0005E1F2    mov         eax,dword ptr [esi+78]
 0005E1F5    call        TObject.Free
 0005E1FA    mov         eax,dword ptr [esi+80]
 0005E200    call        TObject.Free
 0005E205    test        bl,bl
>0005E207    jle         0005E210
 0005E209    mov         eax,esi
 0005E20B    call        @ClassDestroy
 0005E210    pop         esi
 0005E211    pop         ebx
 0005E212    ret
*}
end;

//0005E214
procedure TApplication.CreateHandle;
begin
{*
 0005E214    push        ebp
 0005E215    mov         ebp,esp
 0005E217    add         esp,0FFFFFFD4
 0005E21A    push        ebx
 0005E21B    xor         edx,edx
 0005E21D    mov         dword ptr [ebp-2C],edx
 0005E220    mov         ebx,eax
 0005E222    xor         eax,eax
 0005E224    push        ebp
 0005E225    push        5E398
 0005E22A    push        dword ptr fs:[eax]
 0005E22D    mov         dword ptr fs:[eax],esp
 0005E230    cmp         byte ptr [ebx+8C],0
>0005E237    jne         0005E382
 0005E23D    mov         eax,[000B5A94];IsConsole:Boolean
 0005E242    cmp         byte ptr [eax],0
>0005E245    jne         0005E382
 0005E24B    push        ebx
 0005E24C    push        5E67C;TApplication.WndProc
 0005E251    call        MakeObjectInstance
 0005E256    mov         dword ptr [ebx+2C],eax
 0005E259    lea         eax,[ebp-28]
 0005E25C    push        eax
 0005E25D    mov         eax,[000B4AD8];^_NF__9C6
 0005E262    push        eax
 0005E263    mov         eax,[000B5950];^HInstance:Longword
 0005E268    mov         eax,dword ptr [eax]
 0005E26A    push        eax
 0005E26B    call        user32.GetClassInfoA
 0005E270    test        eax,eax
>0005E272    jne         0005E2B0
 0005E274    mov         eax,[000B5950];^HInstance:Longword
 0005E279    mov         eax,dword ptr [eax]
 0005E27B    mov         [000B4AC4],eax
 0005E280    push        0B4AB4
 0005E285    call        user32.RegisterClassA
 0005E28A    test        ax,ax
>0005E28D    jne         0005E2B0
 0005E28F    lea         edx,[ebp-2C]
 0005E292    mov         eax,[000B5704];^SWindowClass:TResStringRec
 0005E297    call        LoadResString
 0005E29C    mov         ecx,dword ptr [ebp-2C]
 0005E29F    mov         dl,1
 0005E2A1    mov         eax,[0001EE08];EOutOfResources
 0005E2A6    call        Exception.Create
 0005E2AB    call        @RaiseExcept
 0005E2B0    push        0
 0005E2B2    mov         eax,[000B582C];^gvar_000B66A0
 0005E2B7    mov         eax,dword ptr [eax]
 0005E2B9    call        eax
 0005E2BB    sar         eax,1
>0005E2BD    jns         0005E2C2
 0005E2BF    adc         eax,0
 0005E2C2    push        eax
 0005E2C3    push        1
 0005E2C5    mov         eax,[000B582C];^gvar_000B66A0
 0005E2CA    mov         eax,dword ptr [eax]
 0005E2CC    call        eax
 0005E2CE    sar         eax,1
>0005E2D0    jns         0005E2D5
 0005E2D2    adc         eax,0
 0005E2D5    push        eax
 0005E2D6    push        0
 0005E2D8    push        0
 0005E2DA    push        0
 0005E2DC    push        0
 0005E2DE    mov         eax,[000B5950];^HInstance:Longword
 0005E2E3    mov         eax,dword ptr [eax]
 0005E2E5    push        eax
 0005E2E6    push        0
 0005E2E8    mov         eax,dword ptr [ebx+74]
 0005E2EB    call        @LStrToPChar
 0005E2F0    mov         edx,eax
 0005E2F2    mov         ecx,84CA0000
 0005E2F7    mov         eax,[000B4AD8];^_NF__9C6
 0005E2FC    call        CreateWindow
 0005E301    mov         dword ptr [ebx+24],eax
 0005E304    lea         eax,[ebx+74]
 0005E307    call        @LStrClr
 0005E30C    mov         byte ptr [ebx+8C],1
 0005E313    mov         eax,dword ptr [ebx+2C]
 0005E316    push        eax
 0005E317    push        0FC
 0005E319    mov         eax,dword ptr [ebx+24]
 0005E31C    push        eax
 0005E31D    call        user32.SetWindowLongA
 0005E322    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005E327    cmp         byte ptr [eax],0
>0005E32A    je          0005E344
 0005E32C    mov         eax,ebx
 0005E32E    call        TApplication.GetIconHandle
 0005E333    push        eax
 0005E334    push        1
 0005E336    push        80
 0005E33B    mov         eax,dword ptr [ebx+24]
 0005E33E    push        eax
 0005E33F    call        user32.SendMessageA
 0005E344    push        0
 0005E346    mov         eax,dword ptr [ebx+24]
 0005E349    push        eax
 0005E34A    call        user32.GetSystemMenu
 0005E34F    mov         ebx,eax
 0005E351    push        0
 0005E353    push        0F030
 0005E358    push        ebx
 0005E359    call        user32.DeleteMenu
 0005E35E    push        0
 0005E360    push        0F000
 0005E365    push        ebx
 0005E366    call        user32.DeleteMenu
 0005E36B    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005E370    cmp         byte ptr [eax],0
>0005E373    je          0005E382
 0005E375    push        0
 0005E377    push        0F010
 0005E37C    push        ebx
 0005E37D    call        user32.DeleteMenu
 0005E382    xor         eax,eax
 0005E384    pop         edx
 0005E385    pop         ecx
 0005E386    pop         ecx
 0005E387    mov         dword ptr fs:[eax],edx
 0005E38A    push        5E39F
 0005E38F    lea         eax,[ebp-2C]
 0005E392    call        @LStrClr
 0005E397    ret
>0005E398    jmp         @HandleFinally
>0005E39D    jmp         0005E38F
 0005E39F    pop         ebx
 0005E3A0    mov         esp,ebp
 0005E3A2    pop         ebp
 0005E3A3    ret
*}
end;

//0005E3A4
procedure TApplication.ControlDestroyed(Control:TControl);
begin
{*
 0005E3A4    push        ebx
 0005E3A5    push        esi
 0005E3A6    mov         ecx,0B67B4;Screen:TScreen
 0005E3AB    cmp         edx,dword ptr [eax+30]
>0005E3AE    jne         0005E3B5
 0005E3B0    xor         ebx,ebx
 0005E3B2    mov         dword ptr [eax+30],ebx
 0005E3B5    cmp         edx,dword ptr [eax+34]
>0005E3B8    jne         0005E3BF
 0005E3BA    xor         ebx,ebx
 0005E3BC    mov         dword ptr [eax+34],ebx
 0005E3BF    mov         ebx,dword ptr [ecx]
 0005E3C1    cmp         edx,dword ptr [ebx+58]
>0005E3C4    jne         0005E3CD
 0005E3C6    mov         ebx,dword ptr [ecx]
 0005E3C8    xor         esi,esi
 0005E3CA    mov         dword ptr [ebx+58],esi
 0005E3CD    mov         ebx,dword ptr [ecx]
 0005E3CF    cmp         edx,dword ptr [ebx+5C]
>0005E3D2    jne         0005E3E2
 0005E3D4    mov         ebx,dword ptr [ecx]
 0005E3D6    xor         esi,esi
 0005E3D8    mov         dword ptr [ebx+5C],esi
 0005E3DB    mov         ebx,dword ptr [ecx]
 0005E3DD    xor         esi,esi
 0005E3DF    mov         dword ptr [ebx+60],esi
 0005E3E2    mov         ebx,dword ptr [ecx]
 0005E3E4    cmp         edx,dword ptr [ebx+6C]
>0005E3E7    jne         0005E3F0
 0005E3E9    mov         ebx,dword ptr [ecx]
 0005E3EB    xor         esi,esi
 0005E3ED    mov         dword ptr [ebx+6C],esi
 0005E3F0    cmp         edx,dword ptr [eax+48]
>0005E3F3    jne         0005E3FA
 0005E3F5    xor         edx,edx
 0005E3F7    mov         dword ptr [eax+48],edx
 0005E3FA    mov         eax,dword ptr [ecx]
 0005E3FC    call        TScreen.UpdateLastActive
 0005E401    pop         esi
 0005E402    pop         ebx
 0005E403    ret
*}
end;

//0005E404
function GetTopMostWindows(Handle:HWND; Info:Pointer):BOOL; stdcall;
begin
{*
 0005E404    push        ebp
 0005E405    mov         ebp,esp
 0005E407    push        ebx
 0005E408    push        esi
 0005E409    push        edi
 0005E40A    mov         ebx,dword ptr [ebp+8]
 0005E40D    or          esi,0FFFFFFFF
 0005E410    push        4
 0005E412    push        ebx
 0005E413    call        user32.GetWindow
 0005E418    mov         edx,dword ptr ds:[0B67B0];Application:TApplication
 0005E41E    cmp         eax,dword ptr [edx+24]
>0005E421    jne         0005E467
 0005E423    push        0EC
 0005E425    push        ebx
 0005E426    call        user32.GetWindowLongA
 0005E42B    test        al,8
>0005E42D    je          0005E460
 0005E42F    mov         eax,[000B67B0];Application:TApplication
 0005E434    mov         edi,dword ptr [eax+30]
 0005E437    test        edi,edi
>0005E439    je          0005E44F
 0005E43B    mov         eax,dword ptr [ebp+0C]
 0005E43E    cmp         byte ptr [eax+4],0
>0005E442    jne         0005E44F
 0005E444    mov         eax,edi
 0005E446    call        TWinControl.GetHandle
 0005E44B    cmp         ebx,eax
>0005E44D    je          0005E460
 0005E44F    mov         eax,[000B67B0];Application:TApplication
 0005E454    mov         eax,dword ptr [eax+78]
 0005E457    mov         edx,ebx
 0005E459    call        TList.Add
>0005E45E    jmp         0005E467
 0005E460    mov         eax,dword ptr [ebp+0C]
 0005E463    mov         dword ptr [eax],ebx
 0005E465    xor         esi,esi
 0005E467    mov         eax,esi
 0005E469    pop         edi
 0005E46A    pop         esi
 0005E46B    pop         ebx
 0005E46C    pop         ebp
 0005E46D    ret         8
*}
end;

//0005E470
procedure TApplication.DoNormalizeTopMosts(IncludeMain:Boolean);
begin
{*
 0005E470    push        ebx
 0005E471    push        esi
 0005E472    add         esp,0FFFFFFF8
 0005E475    mov         ebx,eax
 0005E477    mov         eax,[000B67B0];Application:TApplication
 0005E47C    cmp         dword ptr [eax+24],0
>0005E480    je          0005E500
 0005E482    cmp         dword ptr [ebx+7C],0
>0005E486    jne         0005E4FD
 0005E488    mov         eax,dword ptr [ebx+24]
 0005E48B    mov         dword ptr [esp],eax
 0005E48E    mov         byte ptr [esp+4],dl
 0005E492    mov         eax,esp
 0005E494    push        eax
 0005E495    push        5E404;GetTopMostWindows:BOOL
 0005E49A    call        user32.EnumWindows
 0005E49F    mov         eax,dword ptr [ebx+78]
 0005E4A2    cmp         dword ptr [eax+8],0
>0005E4A6    je          0005E4FD
 0005E4A8    push        3
 0005E4AA    mov         eax,dword ptr [esp+4]
 0005E4AE    push        eax
 0005E4AF    call        user32.GetWindow
 0005E4B4    mov         esi,eax
 0005E4B6    mov         dword ptr [esp],esi
 0005E4B9    push        0EC
 0005E4BB    push        esi
 0005E4BC    call        user32.GetWindowLongA
 0005E4C1    test        al,8
>0005E4C3    je          0005E4CC
 0005E4C5    mov         dword ptr [esp],0FFFFFFFE
 0005E4CC    mov         eax,dword ptr [ebx+78]
 0005E4CF    mov         esi,dword ptr [eax+8]
 0005E4D2    dec         esi
 0005E4D3    cmp         esi,0
>0005E4D6    jl          0005E4FD
 0005E4D8    push        13
 0005E4DA    push        0
 0005E4DC    push        0
 0005E4DE    push        0
 0005E4E0    push        0
 0005E4E2    mov         eax,dword ptr [esp+14]
 0005E4E6    push        eax
 0005E4E7    mov         edx,esi
 0005E4E9    mov         eax,dword ptr [ebx+78]
 0005E4EC    call        TList.Get
 0005E4F1    push        eax
 0005E4F2    call        user32.SetWindowPos
 0005E4F7    dec         esi
 0005E4F8    cmp         esi,0FFFFFFFF
>0005E4FB    jne         0005E4D8
 0005E4FD    inc         dword ptr [ebx+7C]
 0005E500    pop         ecx
 0005E501    pop         edx
 0005E502    pop         esi
 0005E503    pop         ebx
 0005E504    ret
*}
end;

//0005E508
procedure TApplication.NormalizeTopMosts;
begin
{*
 0005E508    xor         edx,edx
 0005E50A    call        TApplication.DoNormalizeTopMosts
 0005E50F    ret
*}
end;

//0005E510
procedure TApplication.NormalizeAllTopMosts;
begin
{*
 0005E510    mov         dl,1
 0005E512    call        TApplication.DoNormalizeTopMosts
 0005E517    ret
*}
end;

//0005E518
procedure TApplication.RestoreTopMosts;
begin
{*
 0005E518    push        ebx
 0005E519    push        esi
 0005E51A    mov         ebx,eax
 0005E51C    mov         eax,[000B67B0];Application:TApplication
 0005E521    cmp         dword ptr [eax+24],0
>0005E525    je          0005E570
 0005E527    cmp         dword ptr [ebx+7C],0
>0005E52B    jle         0005E570
 0005E52D    dec         dword ptr [ebx+7C]
 0005E530    cmp         dword ptr [ebx+7C],0
>0005E534    jne         0005E570
 0005E536    mov         eax,dword ptr [ebx+78]
 0005E539    mov         esi,dword ptr [eax+8]
 0005E53C    dec         esi
 0005E53D    cmp         esi,0
>0005E540    jl          0005E564
 0005E542    push        13
 0005E544    push        0
 0005E546    push        0
 0005E548    push        0
 0005E54A    push        0
 0005E54C    push        0FF
 0005E54E    mov         edx,esi
 0005E550    mov         eax,dword ptr [ebx+78]
 0005E553    call        TList.Get
 0005E558    push        eax
 0005E559    call        user32.SetWindowPos
 0005E55E    dec         esi
 0005E55F    cmp         esi,0FFFFFFFF
>0005E562    jne         0005E542
 0005E564    mov         eax,dword ptr [ebx+78]
 0005E567    mov         bx,0FFFF
 0005E56B    call        @CallDynaInst
 0005E570    pop         esi
 0005E571    pop         ebx
 0005E572    ret
*}
end;

//0005E574
function TApplication.UseRightToLeftReading:Boolean;
begin
{*
 0005E574    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 0005E57A    cmp         byte ptr [edx+9],0
>0005E57E    je          0005E586
 0005E580    cmp         byte ptr [eax+28],0
>0005E584    jne         0005E589
 0005E586    xor         eax,eax
 0005E588    ret
 0005E589    mov         al,1
 0005E58B    ret
*}
end;

//0005E58C
function TApplication.UseRightToLeftAlignment:Boolean;
begin
{*
 0005E58C    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 0005E592    cmp         byte ptr [edx+9],0
>0005E596    je          0005E59E
 0005E598    cmp         byte ptr [eax+28],1
>0005E59C    je          0005E5A1
 0005E59E    xor         eax,eax
 0005E5A0    ret
 0005E5A1    mov         al,1
 0005E5A3    ret
*}
end;

//0005E5A4
function TApplication.CheckIniChange(var Message:TMessage):Boolean;
begin
{*
 0005E5A4    push        ebx
 0005E5A5    push        esi
 0005E5A6    mov         esi,eax
 0005E5A8    xor         ebx,ebx
 0005E5AA    mov         eax,dword ptr [edx]
 0005E5AC    sub         eax,1A
>0005E5AF    jne         0005E5EE
 0005E5B1    cmp         byte ptr [esi+41],0
>0005E5B5    je          0005E5C6
 0005E5B7    push        400
 0005E5BC    call        kernel32.SetThreadLocale
 0005E5C1    call        GetFormatSettings
 0005E5C6    cmp         byte ptr [esi+42],0
>0005E5CA    je          0005E5EE
 0005E5CC    mov         eax,[000B67B4];Screen:TScreen
 0005E5D1    call        TScreen.GetMetricSettings
 0005E5D6    cmp         byte ptr [esi+70],0
>0005E5DA    je          0005E5EE
 0005E5DC    xor         edx,edx
 0005E5DE    mov         eax,esi
 0005E5E0    call        TApplication.SetShowHint
 0005E5E5    mov         dl,1
 0005E5E7    mov         eax,esi
 0005E5E9    call        TApplication.SetShowHint
 0005E5EE    mov         eax,ebx
 0005E5F0    pop         esi
 0005E5F1    pop         ebx
 0005E5F2    ret
*}
end;

//0005E5F4
procedure Default;
begin
{*
 0005E5F4    push        ebp
 0005E5F5    mov         ebp,esp
 0005E5F7    mov         eax,dword ptr [ebp+8]
 0005E5FA    mov         eax,dword ptr [eax-8]
 0005E5FD    mov         eax,dword ptr [eax+8]
 0005E600    push        eax
 0005E601    mov         eax,dword ptr [ebp+8]
 0005E604    mov         eax,dword ptr [eax-8]
 0005E607    mov         eax,dword ptr [eax+4]
 0005E60A    push        eax
 0005E60B    mov         eax,dword ptr [ebp+8]
 0005E60E    mov         eax,dword ptr [eax-8]
 0005E611    mov         eax,dword ptr [eax]
 0005E613    push        eax
 0005E614    mov         eax,dword ptr [ebp+8]
 0005E617    mov         eax,dword ptr [eax-4]
 0005E61A    mov         eax,dword ptr [eax+24]
 0005E61D    push        eax
 0005E61E    call        user32.DefWindowProcA
 0005E623    mov         edx,dword ptr [ebp+8]
 0005E626    mov         edx,dword ptr [edx-8]
 0005E629    mov         dword ptr [edx+0C],eax
 0005E62C    pop         ebp
 0005E62D    ret
*}
end;

//0005E630
procedure DrawAppIcon;
begin
{*
 0005E630    push        ebp
 0005E631    mov         ebp,esp
 0005E633    add         esp,0FFFFFFC0
 0005E636    push        ebx
 0005E637    lea         eax,[ebp-40]
 0005E63A    push        eax
 0005E63B    mov         eax,dword ptr [ebp+8]
 0005E63E    mov         eax,dword ptr [eax-4]
 0005E641    mov         eax,dword ptr [eax+24]
 0005E644    push        eax
 0005E645    call        user32.BeginPaint
 0005E64A    mov         ebx,eax
 0005E64C    mov         eax,dword ptr [ebp+8]
 0005E64F    mov         eax,dword ptr [eax-4]
 0005E652    call        TApplication.GetIconHandle
 0005E657    push        eax
 0005E658    push        0
 0005E65A    push        0
 0005E65C    push        ebx
 0005E65D    call        user32.DrawIcon
 0005E662    lea         eax,[ebp-40]
 0005E665    push        eax
 0005E666    mov         eax,dword ptr [ebp+8]
 0005E669    mov         eax,dword ptr [eax-4]
 0005E66C    mov         eax,dword ptr [eax+24]
 0005E66F    push        eax
 0005E670    call        user32.EndPaint
 0005E675    pop         ebx
 0005E676    mov         esp,ebp
 0005E678    pop         ebp
 0005E679    ret
*}
end;

//0005E67C
procedure TApplication.WndProc(var Message:TMessage);
begin
{*
 0005E67C    push        ebp
 0005E67D    mov         ebp,esp
 0005E67F    add         esp,0FFFFFFF8
 0005E682    push        ebx
 0005E683    push        esi
 0005E684    push        edi
 0005E685    mov         dword ptr [ebp-8],edx
 0005E688    mov         dword ptr [ebp-4],eax
 0005E68B    xor         edx,edx
 0005E68D    push        ebp
 0005E68E    push        5ECE5
 0005E693    push        dword ptr fs:[edx]
 0005E696    mov         dword ptr fs:[edx],esp
 0005E699    mov         eax,dword ptr [ebp-8]
 0005E69C    xor         edx,edx
 0005E69E    mov         dword ptr [eax+0C],edx
 0005E6A1    mov         eax,dword ptr [ebp-4]
 0005E6A4    mov         eax,dword ptr [eax+90]
 0005E6AA    mov         ebx,dword ptr [eax+8]
 0005E6AD    dec         ebx
 0005E6AE    test        ebx,ebx
>0005E6B0    jl          0005E6E4
 0005E6B2    inc         ebx
 0005E6B3    xor         esi,esi
 0005E6B5    mov         eax,dword ptr [ebp-4]
 0005E6B8    mov         eax,dword ptr [eax+90]
 0005E6BE    mov         edx,esi
 0005E6C0    call        TList.Get
 0005E6C5    mov         edi,eax
 0005E6C7    mov         edx,dword ptr [ebp-8]
 0005E6CA    mov         eax,dword ptr [edi+4]
 0005E6CD    call        dword ptr [edi]
 0005E6CF    test        al,al
>0005E6D1    je          0005E6E0
 0005E6D3    xor         eax,eax
 0005E6D5    pop         edx
 0005E6D6    pop         ecx
 0005E6D7    pop         ecx
 0005E6D8    mov         dword ptr fs:[eax],edx
>0005E6DB    jmp         0005ECFA
 0005E6E0    inc         esi
 0005E6E1    dec         ebx
>0005E6E2    jne         0005E6B5
 0005E6E4    mov         edx,dword ptr [ebp-8]
 0005E6E7    mov         eax,dword ptr [ebp-4]
 0005E6EA    call        TApplication.CheckIniChange
 0005E6EF    mov         ebx,dword ptr [ebp-8]
 0005E6F2    mov         ebx,dword ptr [ebx]
 0005E6F4    mov         eax,ebx
 0005E6F6    cmp         eax,112
>0005E6FB    jg          0005E796
>0005E701    je          0005E811
 0005E707    cmp         eax,15
>0005E70A    jg          0005E75D
>0005E70C    je          0005E86A
 0005E712    add         eax,0FFFFFFF9
 0005E715    cmp         eax,0D
>0005E718    ja          0005ECD4
 0005E71E    jmp         dword ptr [eax*4+5E725]
 0005E71E    dd          0005E8EC
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005E976
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005E89C
 0005E71E    dd          0005E852
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005ECD4
 0005E71E    dd          0005E8C4
 0005E75D    cmp         eax,1C
>0005E760    jg          0005E77F
>0005E762    je          0005E90D
 0005E768    sub         eax,16
>0005E76B    je          0005EA10
 0005E771    sub         eax,4
>0005E774    je          0005ECB9
>0005E77A    jmp         0005ECD4
 0005E77F    sub         eax,37
>0005E782    je          0005E8D9
 0005E788    sub         eax,13
>0005E78B    je          0005EA27
>0005E791    jmp         0005ECD4
 0005E796    cmp         eax,0B01A
>0005E79B    jg          0005E7E5
>0005E79D    je          0005EC02
 0005E7A3    cmp         eax,0B001
>0005E7A8    jg          0005E7CE
>0005E7AA    je          0005EBDA
 0005E7B0    add         eax,0FFFFFECE
 0005E7B5    sub         eax,7
>0005E7B8    jb          0005E9E4
 0005E7BE    sub         eax,0AEC7
>0005E7C3    je          0005EBB2
>0005E7C9    jmp         0005ECD4
 0005E7CE    sub         eax,0B016
>0005E7D3    je          0005EAF7
 0005E7D9    dec         eax
>0005E7DA    je          0005EB19
>0005E7E0    jmp         0005ECD4
 0005E7E5    sub         eax,0B01F
>0005E7EA    je          0005EC41
 0005E7F0    dec         eax
>0005E7F1    je          0005EC5B
 0005E7F7    sub         eax,11
>0005E7FA    je          0005EC8E
 0005E800    add         eax,0FFFFFFF2
 0005E803    sub         eax,2
>0005E806    jb          0005EAD6
>0005E80C    jmp         0005ECD4
 0005E811    mov         eax,dword ptr [ebp-8]
 0005E814    mov         eax,dword ptr [eax+4]
 0005E817    and         eax,0FFF0
 0005E81C    sub         eax,0F020
>0005E821    je          0005E82C
 0005E823    sub         eax,100
>0005E828    je          0005E839
>0005E82A    jmp         0005E846
 0005E82C    mov         eax,dword ptr [ebp-4]
 0005E82F    call        TApplication.Minimize
>0005E834    jmp         0005ECDB
 0005E839    mov         eax,dword ptr [ebp-4]
 0005E83C    call        TApplication.Restore
>0005E841    jmp         0005ECDB
 0005E846    push        ebp
 0005E847    call        Default
 0005E84C    pop         ecx
>0005E84D    jmp         0005ECDB
 0005E852    mov         eax,dword ptr [ebp-4]
 0005E855    mov         eax,dword ptr [eax+30]
 0005E858    test        eax,eax
>0005E85A    je          0005ECDB
 0005E860    call        TCustomForm.Close
>0005E865    jmp         0005ECDB
 0005E86A    cmp         dword ptr ds:[0B67BC],0
>0005E871    je          0005ECDB
 0005E877    cmp         dword ptr ds:[0B67BC],0FFFFFFFF
>0005E87E    je          0005ECDB
 0005E884    cmp         dword ptr ds:[0B67D8],0
>0005E88B    je          0005ECDB
 0005E891    call        dword ptr ds:[0B67D8]
>0005E897    jmp         0005ECDB
 0005E89C    mov         eax,dword ptr [ebp-4]
 0005E89F    mov         eax,dword ptr [eax+24]
 0005E8A2    push        eax
 0005E8A3    call        user32.IsIconic
 0005E8A8    test        eax,eax
>0005E8AA    je          0005E8B8
 0005E8AC    push        ebp
 0005E8AD    call        DrawAppIcon
 0005E8B2    pop         ecx
>0005E8B3    jmp         0005ECDB
 0005E8B8    push        ebp
 0005E8B9    call        Default
 0005E8BE    pop         ecx
>0005E8BF    jmp         0005ECDB
 0005E8C4    mov         eax,dword ptr [ebp-8]
 0005E8C7    mov         dword ptr [eax],27
 0005E8CD    push        ebp
 0005E8CE    call        Default
 0005E8D3    pop         ecx
>0005E8D4    jmp         0005ECDB
 0005E8D9    mov         eax,dword ptr [ebp-4]
 0005E8DC    call        TApplication.GetIconHandle
 0005E8E1    mov         edx,dword ptr [ebp-8]
 0005E8E4    mov         dword ptr [edx+0C],eax
>0005E8E7    jmp         0005ECDB
 0005E8EC    push        0
 0005E8EE    push        0
 0005E8F0    push        0B01A
 0005E8F5    mov         eax,dword ptr [ebp-4]
 0005E8F8    mov         eax,dword ptr [eax+24]
 0005E8FB    push        eax
 0005E8FC    call        user32.PostMessageA
 0005E901    push        ebp
 0005E902    call        Default
 0005E907    pop         ecx
>0005E908    jmp         0005ECDB
 0005E90D    push        ebp
 0005E90E    call        Default
 0005E913    pop         ecx
 0005E914    mov         eax,dword ptr [ebp-8]
 0005E917    mov         eax,dword ptr [eax+4]
 0005E91A    neg         eax
 0005E91C    sbb         eax,eax
 0005E91E    neg         eax
 0005E920    mov         edx,dword ptr [ebp-4]
 0005E923    mov         byte ptr [edx+85],al
 0005E929    mov         eax,dword ptr [ebp-8]
 0005E92C    cmp         dword ptr [eax+4],0
>0005E930    je          0005E954
 0005E932    mov         eax,dword ptr [ebp-4]
 0005E935    call        TApplication.RestoreTopMosts
 0005E93A    push        0
 0005E93C    push        0
 0005E93E    push        0B000
 0005E943    mov         eax,dword ptr [ebp-4]
 0005E946    mov         eax,dword ptr [eax+24]
 0005E949    push        eax
 0005E94A    call        user32.PostMessageA
>0005E94F    jmp         0005ECDB
 0005E954    mov         eax,dword ptr [ebp-4]
 0005E957    call        TApplication.NormalizeTopMosts
 0005E95C    push        0
 0005E95E    push        0
 0005E960    push        0B001
 0005E965    mov         eax,dword ptr [ebp-4]
 0005E968    mov         eax,dword ptr [eax+24]
 0005E96B    push        eax
 0005E96C    call        user32.PostMessageA
>0005E971    jmp         0005ECDB
 0005E976    mov         eax,dword ptr [ebp-8]
 0005E979    cmp         dword ptr [eax+4],0
>0005E97D    je          0005E9B0
 0005E97F    mov         eax,dword ptr [ebp-4]
 0005E982    call        TApplication.RestoreTopMosts
 0005E987    mov         eax,dword ptr [ebp-4]
 0005E98A    mov         eax,dword ptr [eax+94]
 0005E990    test        eax,eax
>0005E992    je          0005E9A4
 0005E994    call        EnableTaskWindows
 0005E999    mov         eax,dword ptr [ebp-4]
 0005E99C    xor         edx,edx
 0005E99E    mov         dword ptr [eax+94],edx
 0005E9A4    push        ebp
 0005E9A5    call        Default
 0005E9AA    pop         ecx
>0005E9AB    jmp         0005ECDB
 0005E9B0    push        ebp
 0005E9B1    call        Default
 0005E9B6    pop         ecx
 0005E9B7    mov         eax,dword ptr [ebp-4]
 0005E9BA    cmp         dword ptr [eax+94],0
>0005E9C1    jne         0005E9D7
 0005E9C3    mov         eax,dword ptr [ebp-4]
 0005E9C6    mov         eax,dword ptr [eax+24]
 0005E9C9    call        DisableTaskWindows
 0005E9CE    mov         edx,dword ptr [ebp-4]
 0005E9D1    mov         dword ptr [edx+94],eax
 0005E9D7    mov         eax,dword ptr [ebp-4]
 0005E9DA    call        TApplication.NormalizeAllTopMosts
>0005E9DF    jmp         0005ECDB
 0005E9E4    mov         esi,dword ptr [ebp-8]
 0005E9E7    mov         esi,dword ptr [esi+8]
 0005E9EA    push        esi
 0005E9EB    mov         eax,dword ptr [ebp-8]
 0005E9EE    mov         eax,dword ptr [eax+4]
 0005E9F1    push        eax
 0005E9F2    mov         eax,dword ptr [ebp-8]
 0005E9F5    add         ebx,0BC00
 0005E9FB    push        ebx
 0005E9FC    mov         eax,dword ptr [ebp-8]
 0005E9FF    push        esi
 0005EA00    call        user32.SendMessageA
 0005EA05    mov         edx,dword ptr [ebp-8]
 0005EA08    mov         dword ptr [edx+0C],eax
>0005EA0B    jmp         0005ECDB
 0005EA10    mov         eax,dword ptr [ebp-8]
 0005EA13    cmp         dword ptr [eax+4],0
>0005EA17    je          0005ECDB
 0005EA1D    call        @Halt0
>0005EA22    jmp         0005ECDB
 0005EA27    mov         eax,dword ptr [ebp-8]
 0005EA2A    mov         eax,dword ptr [eax+8]
 0005EA2D    cmp         dword ptr [eax],0DE534454
>0005EA33    jne         0005ECDB
 0005EA39    mov         eax,dword ptr [ebp-4]
 0005EA3C    cmp         byte ptr [eax+86],0
>0005EA43    je          0005ECDB
 0005EA49    mov         eax,dword ptr [ebp-4]
 0005EA4C    cmp         dword ptr [eax+88],0
>0005EA53    jne         0005EAC9
 0005EA55    push        5ED04
 0005EA5A    call        kernel32.LoadLibraryA
 0005EA5F    mov         ebx,eax
 0005EA61    mov         eax,dword ptr [ebp-4]
 0005EA64    mov         dword ptr [eax+88],ebx
 0005EA6A    test        ebx,ebx
>0005EA6C    je          0005EAAE
 0005EA6E    mov         eax,dword ptr [ebp-8]
 0005EA71    xor         edx,edx
 0005EA73    mov         dword ptr [eax+0C],edx
 0005EA76    push        5ED14
 0005EA7B    mov         eax,dword ptr [ebp-4]
 0005EA7E    mov         eax,dword ptr [eax+88]
 0005EA84    push        eax
 0005EA85    call        kernel32.GetProcAddress
 0005EA8A    mov         esi,eax
 0005EA8C    mov         ebx,esi
 0005EA8E    test        esi,esi
>0005EA90    je          0005ECDB
 0005EA96    mov         eax,dword ptr [ebp-8]
 0005EA99    mov         eax,dword ptr [eax+8]
 0005EA9C    mov         edx,dword ptr [eax+8]
 0005EA9F    push        edx
 0005EAA0    mov         edx,dword ptr [ebp-8]
 0005EAA3    mov         eax,dword ptr [eax+4]
 0005EAA6    push        eax
 0005EAA7    call        ebx
>0005EAA9    jmp         0005ECDB
 0005EAAE    call        kernel32.GetLastError
 0005EAB3    mov         edx,dword ptr [ebp-8]
 0005EAB6    mov         dword ptr [edx+0C],eax
 0005EAB9    mov         eax,dword ptr [ebp-4]
 0005EABC    xor         edx,edx
 0005EABE    mov         dword ptr [eax+88],edx
>0005EAC4    jmp         0005ECDB
 0005EAC9    mov         eax,dword ptr [ebp-8]
 0005EACC    xor         edx,edx
 0005EACE    mov         dword ptr [eax+0C],edx
>0005EAD1    jmp         0005ECDB
 0005EAD6    mov         ecx,dword ptr [ebp-8]
 0005EAD9    mov         ecx,dword ptr [ecx+8]
 0005EADC    mov         eax,dword ptr [ebp-8]
 0005EADF    mov         edx,ebx
 0005EAE1    mov         eax,dword ptr [ebp-4]
 0005EAE4    call        TApplication.DispatchAction
 0005EAE9    and         eax,7F
 0005EAEC    mov         edx,dword ptr [ebp-8]
 0005EAEF    mov         dword ptr [edx+0C],eax
>0005EAF2    jmp         0005ECDB
 0005EAF7    mov         edx,dword ptr [ebp-8]
 0005EAFA    mov         eax,dword ptr [ebp-4]
 0005EAFD    call        TApplication.IsShortCut
 0005EB02    test        al,al
>0005EB04    je          0005ECDB
 0005EB0A    mov         eax,dword ptr [ebp-8]
 0005EB0D    mov         dword ptr [eax+0C],1
>0005EB14    jmp         0005ECDB
 0005EB19    mov         eax,dword ptr [ebp-4]
 0005EB1C    mov         eax,dword ptr [eax+30]
 0005EB1F    test        eax,eax
>0005EB21    je          0005ECDB
 0005EB27    mov         ebx,eax
 0005EB29    mov         eax,ebx
 0005EB2B    call        TWinControl.GetHandle
 0005EB30    test        eax,eax
>0005EB32    je          0005ECDB
 0005EB38    mov         eax,ebx
 0005EB3A    call        TWinControl.GetHandle
 0005EB3F    push        eax
 0005EB40    call        user32.IsWindowEnabled
 0005EB45    test        eax,eax
>0005EB47    je          0005ECDB
 0005EB4D    mov         eax,ebx
 0005EB4F    call        TWinControl.GetHandle
 0005EB54    push        eax
 0005EB55    call        user32.IsWindowVisible
 0005EB5A    test        eax,eax
>0005EB5C    je          0005ECDB
 0005EB62    mov         byte ptr ds:[0B49AC],0;gvar_000B49AC
 0005EB69    call        user32.GetFocus
 0005EB6E    mov         esi,eax
 0005EB70    mov         eax,ebx
 0005EB72    call        TWinControl.GetHandle
 0005EB77    push        eax
 0005EB78    call        user32.SetFocus
 0005EB7D    mov         eax,dword ptr [ebp-8]
 0005EB80    mov         eax,dword ptr [eax+8]
 0005EB83    push        eax
 0005EB84    mov         ecx,dword ptr [ebp-8]
 0005EB87    mov         ecx,dword ptr [ecx+4]
 0005EB8A    mov         edx,112
 0005EB8F    mov         eax,ebx
 0005EB91    call        TControl.Perform
 0005EB96    push        esi
 0005EB97    call        user32.SetFocus
 0005EB9C    mov         byte ptr ds:[0B49AC],1;gvar_000B49AC
 0005EBA3    mov         eax,dword ptr [ebp-8]
 0005EBA6    mov         dword ptr [eax+0C],1
>0005EBAD    jmp         0005ECDB
 0005EBB2    mov         eax,dword ptr [ebp-4]
 0005EBB5    cmp         word ptr [eax+0FA],0
>0005EBBD    je          0005ECDB
 0005EBC3    mov         ebx,dword ptr [ebp-4]
 0005EBC6    mov         edx,dword ptr [ebp-4]
 0005EBC9    mov         eax,dword ptr [ebx+0FC]
 0005EBCF    call        dword ptr [ebx+0F8]
>0005EBD5    jmp         0005ECDB
 0005EBDA    mov         eax,dword ptr [ebp-4]
 0005EBDD    cmp         word ptr [eax+0F2],0
>0005EBE5    je          0005ECDB
 0005EBEB    mov         ebx,dword ptr [ebp-4]
 0005EBEE    mov         edx,dword ptr [ebp-4]
 0005EBF1    mov         eax,dword ptr [ebx+0F4]
 0005EBF7    call        dword ptr [ebx+0F0]
>0005EBFD    jmp         0005ECDB
 0005EC02    mov         eax,dword ptr [ebp-4]
 0005EC05    mov         eax,dword ptr [eax+24]
 0005EC08    push        eax
 0005EC09    call        user32.IsIconic
 0005EC0E    test        eax,eax
>0005EC10    jne         0005ECDB
 0005EC16    call        user32.GetFocus
 0005EC1B    mov         edx,dword ptr [ebp-4]
 0005EC1E    cmp         eax,dword ptr [edx+24]
>0005EC21    jne         0005ECDB
 0005EC27    xor         eax,eax
 0005EC29    call        FindTopMostWindow
 0005EC2E    test        eax,eax
>0005EC30    je          0005ECDB
 0005EC36    push        eax
 0005EC37    call        user32.SetFocus
>0005EC3C    jmp         0005ECDB
 0005EC41    mov         ecx,dword ptr [ebp-8]
 0005EC44    mov         ecx,dword ptr [ecx+8]
 0005EC47    mov         edx,dword ptr [ebp-8]
 0005EC4A    mov         dx,word ptr [edx+4]
 0005EC4E    mov         eax,dword ptr [ebp-4]
 0005EC51    call        TApplication.InvokeHelp
>0005EC56    jmp         0005ECDB
 0005EC5B    mov         eax,dword ptr [ebp-8]
 0005EC5E    cmp         dword ptr [eax+4],0
>0005EC62    jne         0005EC79
 0005EC64    mov         eax,dword ptr [ebp-8]
 0005EC67    mov         eax,dword ptr [eax+8]
 0005EC6A    push        dword ptr [eax+4]
 0005EC6D    push        dword ptr [eax]
 0005EC6F    mov         eax,dword ptr [ebp-4]
 0005EC72    call        TApplication.HookMainWindow
>0005EC77    jmp         0005ECDB
 0005EC79    mov         eax,dword ptr [ebp-8]
 0005EC7C    mov         eax,dword ptr [eax+8]
 0005EC7F    push        dword ptr [eax+4]
 0005EC82    push        dword ptr [eax]
 0005EC84    mov         eax,dword ptr [ebp-4]
 0005EC87    call        TApplication.UnhookMainWindow
>0005EC8C    jmp         0005ECDB
 0005EC8E    mov         eax,dword ptr [ebp-8]
 0005EC91    cmp         dword ptr [eax+4],1
>0005EC95    jne         0005ECA8
 0005EC97    mov         eax,dword ptr [ebp-4]
 0005EC9A    mov         eax,dword ptr [eax+98]
 0005ECA0    mov         edx,dword ptr [ebp-8]
 0005ECA3    mov         dword ptr [edx+0C],eax
>0005ECA6    jmp         0005ECDB
 0005ECA8    mov         eax,dword ptr [ebp-8]
 0005ECAB    mov         eax,dword ptr [eax+8]
 0005ECAE    mov         edx,dword ptr [ebp-4]
 0005ECB1    mov         dword ptr [edx+98],eax
>0005ECB7    jmp         0005ECDB
 0005ECB9    mov         edx,dword ptr [ebp-8]
 0005ECBC    mov         edx,dword ptr [edx+4]
 0005ECBF    mov         eax,[000B5B98];Mouse:TMouse
 0005ECC4    mov         eax,dword ptr [eax]
 0005ECC6    call        TMouse.SettingChanged
 0005ECCB    push        ebp
 0005ECCC    call        Default
 0005ECD1    pop         ecx
>0005ECD2    jmp         0005ECDB
 0005ECD4    push        ebp
 0005ECD5    call        Default
 0005ECDA    pop         ecx
 0005ECDB    xor         eax,eax
 0005ECDD    pop         edx
 0005ECDE    pop         ecx
 0005ECDF    pop         ecx
 0005ECE0    mov         dword ptr fs:[eax],edx
>0005ECE3    jmp         0005ECFA
>0005ECE5    jmp         @HandleAnyException
 0005ECEA    mov         edx,dword ptr [ebp-4]
 0005ECED    mov         eax,dword ptr [ebp-4]
 0005ECF0    call        TApplication.HandleException
 0005ECF5    call        @DoneExcept
 0005ECFA    pop         edi
 0005ECFB    pop         esi
 0005ECFC    pop         ebx
 0005ECFD    pop         ecx
 0005ECFE    pop         ecx
 0005ECFF    pop         ebp
 0005ED00    ret
*}
end;

//0005ED28
function TApplication.GetIconHandle:HICON;
begin
{*
 0005ED28    mov         eax,dword ptr [eax+80]
 0005ED2E    call        TIcon.GetHandle
 0005ED33    test        eax,eax
>0005ED35    jne         0005ED43
 0005ED37    push        7F00
 0005ED3C    push        0
 0005ED3E    call        user32.LoadIconA
 0005ED43    ret
*}
end;

//0005ED44
procedure TApplication.Minimize;
begin
{*
 0005ED44    push        ebx
 0005ED45    mov         ebx,eax
 0005ED47    mov         eax,dword ptr [ebx+24]
 0005ED4A    push        eax
 0005ED4B    call        user32.IsIconic
 0005ED50    test        eax,eax
>0005ED52    jne         0005ED89
 0005ED54    mov         eax,ebx
 0005ED56    call        TApplication.NormalizeTopMosts
 0005ED5B    mov         eax,dword ptr [ebx+24]
 0005ED5E    push        eax
 0005ED5F    call        user32.SetActiveWindow
 0005ED64    mov         edx,6
 0005ED69    mov         eax,dword ptr [ebx+24]
 0005ED6C    call        ShowWinNoAnimate
 0005ED71    cmp         word ptr [ebx+102],0
>0005ED79    je          0005ED89
 0005ED7B    mov         edx,ebx
 0005ED7D    mov         eax,dword ptr [ebx+104]
 0005ED83    call        dword ptr [ebx+100]
 0005ED89    pop         ebx
 0005ED8A    ret
*}
end;

//0005ED8C
procedure TApplication.Restore;
begin
{*
 0005ED8C    push        ebx
 0005ED8D    push        esi
 0005ED8E    mov         ebx,eax
 0005ED90    mov         eax,dword ptr [ebx+24]
 0005ED93    push        eax
 0005ED94    call        user32.IsIconic
 0005ED99    test        eax,eax
>0005ED9B    je          0005EE10
 0005ED9D    mov         eax,dword ptr [ebx+24]
 0005EDA0    push        eax
 0005EDA1    call        user32.SetActiveWindow
 0005EDA6    mov         edx,9
 0005EDAB    mov         eax,dword ptr [ebx+24]
 0005EDAE    call        ShowWinNoAnimate
 0005EDB3    mov         eax,dword ptr [ebx+30]
 0005EDB6    test        eax,eax
>0005EDB8    je          0005EDD8
 0005EDBA    cmp         byte ptr [eax+20B],1
>0005EDC1    jne         0005EDD8
 0005EDC3    cmp         byte ptr [eax+47],0
>0005EDC7    jne         0005EDD8
 0005EDC9    xor         edx,edx
 0005EDCB    call        TCustomForm.SetWindowState
 0005EDD0    mov         eax,dword ptr [ebx+30]
 0005EDD3    call        TCustomForm.Show
 0005EDD8    mov         eax,ebx
 0005EDDA    call        TApplication.RestoreTopMosts
 0005EDDF    mov         eax,[000B67B4];Screen:TScreen
 0005EDE4    mov         esi,dword ptr [eax+58]
 0005EDE7    test        esi,esi
>0005EDE9    je          0005EDF8
 0005EDEB    mov         eax,esi
 0005EDED    call        TWinControl.GetHandle
 0005EDF2    push        eax
 0005EDF3    call        user32.SetFocus
 0005EDF8    cmp         word ptr [ebx+10A],0
>0005EE00    je          0005EE10
 0005EE02    mov         edx,ebx
 0005EE04    mov         eax,dword ptr [ebx+10C]
 0005EE0A    call        dword ptr [ebx+108]
 0005EE10    pop         esi
 0005EE11    pop         ebx
 0005EE12    ret
*}
end;

//0005EE14
procedure TApplication.BringToFront;
begin
{*
 0005EE14    push        ebx
 0005EE15    push        esi
 0005EE16    mov         ebx,eax
 0005EE18    mov         eax,dword ptr [ebx+24]
 0005EE1B    test        eax,eax
>0005EE1D    je          0005EE4A
 0005EE1F    push        eax
 0005EE20    call        user32.GetLastActivePopup
 0005EE25    mov         esi,eax
 0005EE27    test        esi,esi
>0005EE29    je          0005EE4A
 0005EE2B    cmp         esi,dword ptr [ebx+24]
>0005EE2E    je          0005EE4A
 0005EE30    push        esi
 0005EE31    call        user32.IsWindowVisible
 0005EE36    test        eax,eax
>0005EE38    je          0005EE4A
 0005EE3A    push        esi
 0005EE3B    call        user32.IsWindowEnabled
 0005EE40    test        eax,eax
>0005EE42    je          0005EE4A
 0005EE44    push        esi
 0005EE45    call        user32.SetForegroundWindow
 0005EE4A    pop         esi
 0005EE4B    pop         ebx
 0005EE4C    ret
*}
end;

//0005EE50
function TApplication.GetTitle:AnsiString;
begin
{*
 0005EE50    push        ebx
 0005EE51    push        esi
 0005EE52    add         esp,0FFFFFF00
 0005EE58    mov         esi,edx
 0005EE5A    mov         ebx,eax
 0005EE5C    cmp         byte ptr [ebx+8C],0
>0005EE63    je          0005EE85
 0005EE65    push        100
 0005EE6A    lea         eax,[esp+4]
 0005EE6E    push        eax
 0005EE6F    mov         eax,dword ptr [ebx+24]
 0005EE72    push        eax
 0005EE73    call        user32.GetWindowTextA
 0005EE78    mov         ecx,eax
 0005EE7A    mov         edx,esp
 0005EE7C    mov         eax,esi
 0005EE7E    call        @LStrFromPCharLen
>0005EE83    jmp         0005EE8F
 0005EE85    mov         eax,esi
 0005EE87    mov         edx,dword ptr [ebx+74]
 0005EE8A    call        @LStrLAsg
 0005EE8F    add         esp,100
 0005EE95    pop         esi
 0005EE96    pop         ebx
 0005EE97    ret
*}
end;

//0005EE98
procedure TApplication.SetTitle(const Value:AnsiString);
begin
{*
 0005EE98    push        ebx
 0005EE99    push        esi
 0005EE9A    mov         esi,edx
 0005EE9C    mov         ebx,eax
 0005EE9E    cmp         byte ptr [ebx+8C],0
>0005EEA5    je          0005EEBB
 0005EEA7    mov         eax,esi
 0005EEA9    call        @LStrToPChar
 0005EEAE    push        eax
 0005EEAF    mov         eax,dword ptr [ebx+24]
 0005EEB2    push        eax
 0005EEB3    call        user32.SetWindowTextA
 0005EEB8    pop         esi
 0005EEB9    pop         ebx
 0005EEBA    ret
 0005EEBB    lea         eax,[ebx+74]
 0005EEBE    mov         edx,esi
 0005EEC0    call        @LStrAsg
 0005EEC5    pop         esi
 0005EEC6    pop         ebx
 0005EEC7    ret
*}
end;

//0005EEC8
function TApplication.IsDlgMsg(var Msg:TMsg):Boolean;
begin
{*
 0005EEC8    push        ebx
 0005EEC9    push        esi
 0005EECA    push        edi
 0005EECB    mov         edi,edx
 0005EECD    mov         ebx,eax
 0005EECF    xor         eax,eax
 0005EED1    mov         esi,dword ptr [ebx+98]
 0005EED7    test        esi,esi
>0005EED9    je          0005EEE8
 0005EEDB    push        edi
 0005EEDC    push        esi
 0005EEDD    call        user32.IsDialogMessageA
 0005EEE2    neg         eax
 0005EEE4    sbb         eax,eax
 0005EEE6    neg         eax
 0005EEE8    pop         edi
 0005EEE9    pop         esi
 0005EEEA    pop         ebx
 0005EEEB    ret
*}
end;

//0005EEEC
function TApplication.IsIdleMessage(const Msg:TMsg):Boolean;
begin
{*
 0005EEEC    push        esi
 0005EEED    push        edi
 0005EEEE    mov         ecx,dword ptr [edx+4]
 0005EEF1    cmp         ecx,200
>0005EEF7    je          0005EF01
 0005EEF9    cmp         ecx,0A0
>0005EEFF    jne         0005EF3A
 0005EF01    mov         ecx,dword ptr [edx+4]
 0005EF04    cmp         ecx,dword ptr [eax+0A0]
>0005EF0A    jne         0005EF26
 0005EF0C    mov         ecx,dword ptr [edx+14]
 0005EF0F    cmp         ecx,dword ptr [eax+0B0]
>0005EF15    jne         0005EF26
 0005EF17    mov         ecx,dword ptr [edx+18]
 0005EF1A    cmp         ecx,dword ptr [eax+0B4]
>0005EF20    jne         0005EF26
 0005EF22    xor         eax,eax
>0005EF24    jmp         0005EF43
 0005EF26    mov         esi,edx
 0005EF28    lea         edi,[eax+9C]
 0005EF2E    mov         ecx,7
 0005EF33    rep movs    dword ptr [edi],dword ptr [esi]
 0005EF35    mov         al,1
 0005EF37    pop         edi
 0005EF38    pop         esi
 0005EF39    ret
 0005EF3A    cmp         ecx,118
 0005EF40    setne       al
 0005EF43    pop         edi
 0005EF44    pop         esi
 0005EF45    ret
*}
end;

//0005EF48
function TApplication.IsMDIMsg(var Msg:TMsg):Boolean;
begin
{*
 0005EF48    push        ebx
 0005EF49    push        esi
 0005EF4A    push        edi
 0005EF4B    mov         edi,edx
 0005EF4D    mov         ebx,eax
 0005EF4F    xor         eax,eax
 0005EF51    mov         esi,dword ptr [ebx+30]
 0005EF54    test        esi,esi
>0005EF56    je          0005EF92
 0005EF58    cmp         byte ptr [esi+20F],2
>0005EF5F    jne         0005EF92
 0005EF61    mov         edx,dword ptr ds:[0B67B4];Screen:TScreen
 0005EF67    cmp         dword ptr [edx+60],0
>0005EF6B    je          0005EF92
 0005EF6D    mov         edx,dword ptr ds:[0B67B4];Screen:TScreen
 0005EF73    mov         edx,dword ptr [edx+60]
 0005EF76    cmp         byte ptr [edx+20F],1
>0005EF7D    jne         0005EF92
 0005EF7F    push        edi
 0005EF80    mov         eax,dword ptr [esi+234]
 0005EF86    push        eax
 0005EF87    call        user32.TranslateMDISysAccel
 0005EF8C    neg         eax
 0005EF8E    sbb         eax,eax
 0005EF90    neg         eax
 0005EF92    pop         edi
 0005EF93    pop         esi
 0005EF94    pop         ebx
 0005EF95    ret
*}
end;

//0005EF98
function TApplication.IsKeyMsg(var Msg:TMsg):Boolean;
begin
{*
 0005EF98    push        ebx
 0005EF99    push        esi
 0005EF9A    push        edi
 0005EF9B    push        ebp
 0005EF9C    mov         edi,edx
 0005EF9E    mov         ebp,eax
 0005EFA0    xor         ebx,ebx
 0005EFA2    mov         eax,dword ptr [edi+4]
 0005EFA5    cmp         eax,100
>0005EFAA    jb          0005F024
 0005EFAC    cmp         eax,108
>0005EFB1    ja          0005F024
 0005EFB3    call        user32.GetCapture
 0005EFB8    mov         esi,eax
 0005EFBA    test        esi,esi
>0005EFBC    jne         0005EFF5
 0005EFBE    mov         esi,dword ptr [edi]
 0005EFC0    mov         eax,dword ptr [ebp+30]
 0005EFC3    test        eax,eax
>0005EFC5    je          0005EFD6
 0005EFC7    cmp         esi,dword ptr [eax+234]
>0005EFCD    jne         0005EFD6
 0005EFCF    call        TWinControl.GetHandle
 0005EFD4    mov         esi,eax
 0005EFD6    mov         eax,dword ptr [edi+0C]
 0005EFD9    push        eax
 0005EFDA    mov         eax,dword ptr [edi+8]
 0005EFDD    push        eax
 0005EFDE    mov         eax,dword ptr [edi+4]
 0005EFE1    add         eax,0BC00
 0005EFE6    push        eax
 0005EFE7    push        esi
 0005EFE8    call        user32.SendMessageA
 0005EFED    test        eax,eax
>0005EFEF    je          0005F024
 0005EFF1    mov         bl,1
>0005EFF3    jmp         0005F024
 0005EFF5    push        0FA
 0005EFF7    push        esi
 0005EFF8    call        user32.GetWindowLongA
 0005EFFD    mov         edx,dword ptr ds:[0B5950];^HInstance:Longword
 0005F003    cmp         eax,dword ptr [edx]
>0005F005    jne         0005F024
 0005F007    mov         eax,dword ptr [edi+0C]
 0005F00A    push        eax
 0005F00B    mov         eax,dword ptr [edi+8]
 0005F00E    push        eax
 0005F00F    mov         eax,dword ptr [edi+4]
 0005F012    add         eax,0BC00
 0005F017    push        eax
 0005F018    push        esi
 0005F019    call        user32.SendMessageA
 0005F01E    test        eax,eax
>0005F020    je          0005F024
 0005F022    mov         bl,1
 0005F024    mov         eax,ebx
 0005F026    pop         ebp
 0005F027    pop         edi
 0005F028    pop         esi
 0005F029    pop         ebx
 0005F02A    ret
*}
end;

//0005F02C
function TApplication.IsHintMsg(var Msg:TMsg):Boolean;
begin
{*
 0005F02C    push        ebx
 0005F02D    push        esi
 0005F02E    push        edi
 0005F02F    push        ebp
 0005F030    mov         edi,edx
 0005F032    mov         ebp,eax
 0005F034    xor         ebx,ebx
 0005F036    mov         esi,dword ptr [ebp+6C]
 0005F039    test        esi,esi
>0005F03B    je          0005F054
 0005F03D    mov         edx,edi
 0005F03F    mov         eax,esi
 0005F041    mov         ecx,dword ptr [eax]
 0005F043    call        dword ptr [ecx+0C8]
 0005F049    test        al,al
>0005F04B    je          0005F054
 0005F04D    mov         eax,ebp
 0005F04F    call        TApplication.CancelHint
 0005F054    mov         eax,ebx
 0005F056    pop         ebp
 0005F057    pop         edi
 0005F058    pop         esi
 0005F059    pop         ebx
 0005F05A    ret
*}
end;

//0005F05C
function TApplication.IsShortCut(var Message:TWMKey):Boolean;
begin
{*
 0005F05C    push        ebx
 0005F05D    push        esi
 0005F05E    push        edi
 0005F05F    push        ebp
 0005F060    push        ecx
 0005F061    mov         ebp,edx
 0005F063    mov         esi,eax
 0005F065    mov         byte ptr [esp],0
 0005F069    cmp         word ptr [esi+112],0
>0005F071    je          0005F083
 0005F073    mov         ecx,esp
 0005F075    mov         edx,ebp
 0005F077    mov         eax,dword ptr [esi+114]
 0005F07D    call        dword ptr [esi+110]
 0005F083    cmp         byte ptr [esp],0
>0005F087    jne         0005F0B7
 0005F089    mov         edi,dword ptr [esi+30]
 0005F08C    test        edi,edi
>0005F08E    je          0005F0B3
 0005F090    mov         eax,edi
 0005F092    call        TWinControl.GetHandle
 0005F097    push        eax
 0005F098    call        user32.IsWindowEnabled
 0005F09D    test        eax,eax
>0005F09F    je          0005F0B3
 0005F0A1    mov         edx,ebp
 0005F0A3    mov         eax,dword ptr [esi+30]
 0005F0A6    mov         bx,0FFB1
 0005F0AA    call        @CallDynaInst
 0005F0AF    test        al,al
>0005F0B1    jne         0005F0B7
 0005F0B3    xor         eax,eax
>0005F0B5    jmp         0005F0B9
 0005F0B7    mov         al,1
 0005F0B9    mov         byte ptr [esp],al
 0005F0BC    mov         al,byte ptr [esp]
 0005F0BF    pop         edx
 0005F0C0    pop         ebp
 0005F0C1    pop         edi
 0005F0C2    pop         esi
 0005F0C3    pop         ebx
 0005F0C4    ret
*}
end;

//0005F0C8
function TApplication.ProcessMessage(var Msg:TMsg):Boolean;
begin
{*
 0005F0C8    push        ebx
 0005F0C9    push        esi
 0005F0CA    push        edi
 0005F0CB    push        ecx
 0005F0CC    mov         edi,edx
 0005F0CE    mov         esi,eax
 0005F0D0    xor         ebx,ebx
 0005F0D2    push        1
 0005F0D4    push        0
 0005F0D6    push        0
 0005F0D8    push        0
 0005F0DA    push        edi
 0005F0DB    call        user32.PeekMessageA
 0005F0E0    test        eax,eax
>0005F0E2    je          0005F159
 0005F0E4    mov         bl,1
 0005F0E6    cmp         dword ptr [edi+4],12
>0005F0EA    je          0005F152
 0005F0EC    mov         byte ptr [esp],0
 0005F0F0    cmp         word ptr [esi+0D2],0
>0005F0F8    je          0005F10A
 0005F0FA    mov         ecx,esp
 0005F0FC    mov         edx,edi
 0005F0FE    mov         eax,dword ptr [esi+0D4]
 0005F104    call        dword ptr [esi+0D0]
 0005F10A    mov         edx,edi
 0005F10C    mov         eax,esi
 0005F10E    call        TApplication.IsHintMsg
 0005F113    test        al,al
>0005F115    jne         0005F159
 0005F117    cmp         byte ptr [esp],0
>0005F11B    jne         0005F159
 0005F11D    mov         edx,edi
 0005F11F    mov         eax,esi
 0005F121    call        TApplication.IsMDIMsg
 0005F126    test        al,al
>0005F128    jne         0005F159
 0005F12A    mov         edx,edi
 0005F12C    mov         eax,esi
 0005F12E    call        TApplication.IsKeyMsg
 0005F133    test        al,al
>0005F135    jne         0005F159
 0005F137    mov         edx,edi
 0005F139    mov         eax,esi
 0005F13B    call        TApplication.IsDlgMsg
 0005F140    test        al,al
>0005F142    jne         0005F159
 0005F144    push        edi
 0005F145    call        user32.TranslateMessage
 0005F14A    push        edi
 0005F14B    call        user32.DispatchMessageA
>0005F150    jmp         0005F159
 0005F152    mov         byte ptr [esi+84],1
 0005F159    mov         eax,ebx
 0005F15B    pop         edx
 0005F15C    pop         edi
 0005F15D    pop         esi
 0005F15E    pop         ebx
 0005F15F    ret
*}
end;

//0005F160
procedure TApplication.ProcessMessages;
begin
{*
 0005F160    push        ebx
 0005F161    add         esp,0FFFFFFE4
 0005F164    mov         ebx,eax
 0005F166    mov         edx,esp
 0005F168    mov         eax,ebx
 0005F16A    call        TApplication.ProcessMessage
 0005F16F    test        al,al
>0005F171    jne         0005F166
 0005F173    add         esp,1C
 0005F176    pop         ebx
 0005F177    ret
*}
end;

//0005F178
procedure TApplication.HandleMessage;
begin
{*
 0005F178    push        ebx
 0005F179    add         esp,0FFFFFFE4
 0005F17C    mov         ebx,eax
 0005F17E    mov         edx,esp
 0005F180    mov         eax,ebx
 0005F182    call        TApplication.ProcessMessage
 0005F187    test        al,al
>0005F189    jne         0005F194
 0005F18B    mov         edx,esp
 0005F18D    mov         eax,ebx
 0005F18F    call        TApplication.Idle
 0005F194    add         esp,1C
 0005F197    pop         ebx
 0005F198    ret
*}
end;

//0005F19C
procedure TApplication.HookMainWindow(Hook:TWindowHook);
begin
{*
 0005F19C    push        ebp
 0005F19D    mov         ebp,esp
 0005F19F    push        ebx
 0005F1A0    mov         ebx,eax
 0005F1A2    cmp         byte ptr [ebx+8C],0
>0005F1A9    jne         0005F1C5
 0005F1AB    mov         eax,dword ptr [ebx+24]
 0005F1AE    test        eax,eax
>0005F1B0    je          0005F1F2
 0005F1B2    lea         edx,[ebp+8]
 0005F1B5    push        edx
 0005F1B6    push        0
 0005F1B8    push        0B020
 0005F1BD    push        eax
 0005F1BE    call        user32.SendMessageA
>0005F1C3    jmp         0005F1F2
 0005F1C5    mov         eax,dword ptr [ebx+90]
 0005F1CB    call        TList.Expand
 0005F1D0    mov         eax,8
 0005F1D5    call        @GetMem
 0005F1DA    mov         edx,dword ptr [ebp+8]
 0005F1DD    mov         dword ptr [eax],edx
 0005F1DF    mov         edx,dword ptr [ebp+0C]
 0005F1E2    mov         dword ptr [eax+4],edx
 0005F1E5    mov         edx,eax
 0005F1E7    mov         eax,dword ptr [ebx+90]
 0005F1ED    call        TList.Add
 0005F1F2    pop         ebx
 0005F1F3    pop         ebp
 0005F1F4    ret         8
*}
end;

//0005F1F8
procedure TApplication.UnhookMainWindow(Hook:TWindowHook);
begin
{*
 0005F1F8    push        ebp
 0005F1F9    mov         ebp,esp
 0005F1FB    push        ebx
 0005F1FC    push        esi
 0005F1FD    push        edi
 0005F1FE    mov         ebx,eax
 0005F200    cmp         byte ptr [ebx+8C],0
>0005F207    jne         0005F223
 0005F209    mov         eax,dword ptr [ebx+24]
 0005F20C    test        eax,eax
>0005F20E    je          0005F26D
 0005F210    lea         edx,[ebp+8]
 0005F213    push        edx
 0005F214    push        1
 0005F216    push        0B020
 0005F21B    push        eax
 0005F21C    call        user32.SendMessageA
>0005F221    jmp         0005F26D
 0005F223    mov         eax,dword ptr [ebx+90]
 0005F229    mov         edi,dword ptr [eax+8]
 0005F22C    dec         edi
 0005F22D    test        edi,edi
>0005F22F    jl          0005F26D
 0005F231    inc         edi
 0005F232    xor         esi,esi
 0005F234    mov         edx,esi
 0005F236    mov         eax,dword ptr [ebx+90]
 0005F23C    call        TList.Get
 0005F241    mov         edx,dword ptr [eax]
 0005F243    cmp         edx,dword ptr [ebp+8]
>0005F246    jne         0005F269
 0005F248    mov         edx,dword ptr [ebp+0C]
 0005F24B    cmp         edx,dword ptr [eax+4]
>0005F24E    jne         0005F269
 0005F250    mov         edx,8
 0005F255    call        @FreeMem
 0005F25A    mov         edx,esi
 0005F25C    mov         eax,dword ptr [ebx+90]
 0005F262    call        TList.Delete
>0005F267    jmp         0005F26D
 0005F269    inc         esi
 0005F26A    dec         edi
>0005F26B    jne         0005F234
 0005F26D    pop         edi
 0005F26E    pop         esi
 0005F26F    pop         ebx
 0005F270    pop         ebp
 0005F271    ret         8
*}
end;

//0005F274
procedure TApplication.Initialize;
begin
{*
 0005F274    push        ebx
 0005F275    mov         eax,[000B58FC];InitProc:Pointer
 0005F27A    cmp         dword ptr [eax],0
>0005F27D    je          0005F289
 0005F27F    mov         ebx,dword ptr ds:[0B58FC];InitProc:Pointer
 0005F285    mov         ebx,dword ptr [ebx]
 0005F287    call        ebx
 0005F289    pop         ebx
 0005F28A    ret
*}
end;

//0005F28C
procedure TApplication.CreateForm(InstanceClass:TComponentClass; var Reference:void );
begin
{*
 0005F28C    push        ebp
 0005F28D    mov         ebp,esp
 0005F28F    push        ecx
 0005F290    push        ebx
 0005F291    push        esi
 0005F292    push        edi
 0005F293    mov         dword ptr [ebp-4],ecx
 0005F296    mov         ebx,edx
 0005F298    mov         esi,eax
 0005F29A    mov         eax,ebx
 0005F29C    call        dword ptr [eax-0C]
 0005F29F    mov         ebx,eax
 0005F2A1    mov         eax,dword ptr [ebp-4]
 0005F2A4    mov         dword ptr [eax],ebx
 0005F2A6    xor         eax,eax
 0005F2A8    push        ebp
 0005F2A9    push        5F2CA
 0005F2AE    push        dword ptr fs:[eax]
 0005F2B1    mov         dword ptr fs:[eax],esp
 0005F2B4    mov         ecx,esi
 0005F2B6    or          edx,0FFFFFFFF
 0005F2B9    mov         eax,ebx
 0005F2BB    mov         edi,dword ptr [eax]
 0005F2BD    call        dword ptr [edi+2C]
 0005F2C0    xor         eax,eax
 0005F2C2    pop         edx
 0005F2C3    pop         ecx
 0005F2C4    pop         ecx
 0005F2C5    mov         dword ptr fs:[eax],edx
>0005F2C8    jmp         0005F2E0
>0005F2CA    jmp         @HandleAnyException
 0005F2CF    mov         eax,dword ptr [ebp-4]
 0005F2D2    xor         edx,edx
 0005F2D4    mov         dword ptr [eax],edx
 0005F2D6    call        @RaiseAgain
 0005F2DB    call        @DoneExcept
 0005F2E0    cmp         dword ptr [esi+30],0
>0005F2E4    jne         0005F303
 0005F2E6    mov         eax,ebx
 0005F2E8    mov         edx,dword ptr ds:[554E4];TForm
 0005F2EE    call        @IsClass
 0005F2F3    test        al,al
>0005F2F5    je          0005F303
 0005F2F7    mov         edi,ebx
 0005F2F9    mov         eax,edi
 0005F2FB    call        TWinControl.HandleNeeded
 0005F300    mov         dword ptr [esi+30],edi
 0005F303    pop         edi
 0005F304    pop         esi
 0005F305    pop         ebx
 0005F306    pop         ecx
 0005F307    pop         ebp
 0005F308    ret
*}
end;

//0005F30C
procedure TApplication.Run;
begin
{*
 0005F30C    push        ebp
 0005F30D    mov         ebp,esp
 0005F30F    push        ecx
 0005F310    mov         dword ptr [ebp-4],eax
 0005F313    mov         eax,dword ptr [ebp-4]
 0005F316    mov         byte ptr [eax+8D],1
 0005F31D    xor         edx,edx
 0005F31F    push        ebp
 0005F320    push        5F3B6
 0005F325    push        dword ptr fs:[edx]
 0005F328    mov         dword ptr fs:[edx],esp
 0005F32B    mov         eax,5654C;DoneApplication
 0005F330    call        AddExitProc
 0005F335    mov         eax,dword ptr [ebp-4]
 0005F338    mov         eax,dword ptr [eax+30]
 0005F33B    test        eax,eax
>0005F33D    je          0005F39E
 0005F33F    mov         edx,dword ptr ds:[0B59A0];^gvar_000B602C:Integer
 0005F345    mov         edx,dword ptr [edx]
 0005F347    sub         edx,3
>0005F34A    je          0005F35A
 0005F34C    sub         edx,4
>0005F34F    jne         0005F361
 0005F351    mov         byte ptr [eax+20B],1
>0005F358    jmp         0005F361
 0005F35A    mov         dl,2
 0005F35C    call        TCustomForm.SetWindowState
 0005F361    mov         eax,dword ptr [ebp-4]
 0005F364    cmp         byte ptr [eax+43],0
>0005F368    je          0005F38A
 0005F36A    mov         eax,dword ptr [ebp-4]
 0005F36D    mov         eax,dword ptr [eax+30]
 0005F370    cmp         byte ptr [eax+20B],1
>0005F377    jne         0005F383
 0005F379    mov         eax,dword ptr [ebp-4]
 0005F37C    call        TApplication.Minimize
>0005F381    jmp         0005F38A
 0005F383    mov         dl,1
 0005F385    call        TCustomForm.SetVisible
 0005F38A    mov         eax,dword ptr [ebp-4]
 0005F38D    call        TApplication.HandleMessage
 0005F392    mov         eax,dword ptr [ebp-4]
 0005F395    cmp         byte ptr [eax+84],0
>0005F39C    je          0005F38A
 0005F39E    xor         eax,eax
 0005F3A0    pop         edx
 0005F3A1    pop         ecx
 0005F3A2    pop         ecx
 0005F3A3    mov         dword ptr fs:[eax],edx
 0005F3A6    push        5F3BD
 0005F3AB    mov         eax,dword ptr [ebp-4]
 0005F3AE    mov         byte ptr [eax+8D],0
 0005F3B5    ret
>0005F3B6    jmp         @HandleFinally
>0005F3BB    jmp         0005F3AB
 0005F3BD    pop         ecx
 0005F3BE    pop         ebp
 0005F3BF    ret
*}
end;

//0005F3C0
procedure TApplication.Terminate;
begin
{*
 0005F3C0    call        CallTerminateProcs
 0005F3C5    test        al,al
>0005F3C7    je          0005F3D0
 0005F3C9    push        0
 0005F3CB    call        user32.PostQuitMessage
 0005F3D0    ret
*}
end;

//0005F3D4
procedure TApplication.HandleException(Sender:TObject);
begin
{*
 0005F3D4    push        ebx
 0005F3D5    push        esi
 0005F3D6    mov         esi,edx
 0005F3D8    mov         ebx,eax
 0005F3DA    call        user32.GetCapture
 0005F3DF    test        eax,eax
>0005F3E1    je          0005F3F4
 0005F3E3    push        0
 0005F3E5    push        0
 0005F3E7    push        1F
 0005F3E9    call        user32.GetCapture
 0005F3EE    push        eax
 0005F3EF    call        user32.SendMessageA
 0005F3F4    call        ExceptObject
 0005F3F9    mov         edx,dword ptr ds:[176E8];Exception
 0005F3FF    call        @IsClass
 0005F404    test        al,al
>0005F406    je          0005F44E
 0005F408    call        ExceptObject
 0005F40D    mov         edx,dword ptr ds:[17750];EAbort
 0005F413    call        @IsClass
 0005F418    test        al,al
>0005F41A    jne         0005F45F
 0005F41C    cmp         word ptr [ebx+0CA],0
>0005F424    je          0005F43D
 0005F426    call        ExceptObject
 0005F42B    mov         ecx,eax
 0005F42D    mov         edx,esi
 0005F42F    mov         eax,dword ptr [ebx+0CC]
 0005F435    call        dword ptr [ebx+0C8]
>0005F43B    jmp         0005F45F
 0005F43D    call        ExceptObject
 0005F442    mov         edx,eax
 0005F444    mov         eax,ebx
 0005F446    call        TApplication.ShowException
 0005F44B    pop         esi
 0005F44C    pop         ebx
 0005F44D    ret
 0005F44E    call        ExceptAddr
 0005F453    push        eax
 0005F454    call        ExceptObject
 0005F459    pop         edx
 0005F45A    call        ShowException
 0005F45F    pop         esi
 0005F460    pop         ebx
 0005F461    ret
*}
end;

//0005F464
function TApplication.MessageBox(Text:PChar; Caption:PChar; Flags:Longint):Integer;
begin
{*
 0005F464    push        ebp
 0005F465    mov         ebp,esp
 0005F467    add         esp,0FFFFFFB0
 0005F46A    push        ebx
 0005F46B    push        esi
 0005F46C    push        edi
 0005F46D    mov         edi,ecx
 0005F46F    mov         esi,edx
 0005F471    mov         dword ptr [ebp-4],eax
 0005F474    mov         ebx,dword ptr [ebp+8]
 0005F477    call        user32.GetActiveWindow
 0005F47C    mov         dword ptr [ebp-0C],eax
 0005F47F    push        2
 0005F481    mov         eax,dword ptr [ebp-0C]
 0005F484    push        eax
 0005F485    mov         eax,[000B58D4];MonitorFromWindow:TMonitorFromWindow
 0005F48A    mov         eax,dword ptr [eax]
 0005F48C    call        eax
 0005F48E    mov         dword ptr [ebp-14],eax
 0005F491    push        2
 0005F493    mov         eax,dword ptr [ebp-4]
 0005F496    mov         eax,dword ptr [eax+24]
 0005F499    push        eax
 0005F49A    mov         eax,[000B58D4];MonitorFromWindow:TMonitorFromWindow
 0005F49F    mov         eax,dword ptr [eax]
 0005F4A1    call        eax
 0005F4A3    mov         dword ptr [ebp-18],eax
 0005F4A6    mov         eax,dword ptr [ebp-14]
 0005F4A9    cmp         eax,dword ptr [ebp-18]
>0005F4AC    je          0005F50E
 0005F4AE    mov         dword ptr [ebp-40],28
 0005F4B5    lea         eax,[ebp-40]
 0005F4B8    push        eax
 0005F4B9    mov         eax,dword ptr [ebp-14]
 0005F4BC    push        eax
 0005F4BD    mov         eax,[000B57F4];GetMonitorInfo:TGetMonitorInfoA
 0005F4C2    mov         eax,dword ptr [eax]
 0005F4C4    call        eax
 0005F4C6    lea         eax,[ebp-50]
 0005F4C9    push        eax
 0005F4CA    mov         eax,dword ptr [ebp-4]
 0005F4CD    mov         eax,dword ptr [eax+24]
 0005F4D0    push        eax
 0005F4D1    call        user32.GetWindowRect
 0005F4D6    push        1D
 0005F4D8    push        0
 0005F4DA    push        0
 0005F4DC    mov         ecx,dword ptr [ebp-30]
 0005F4DF    mov         edx,dword ptr [ebp-38]
 0005F4E2    sub         ecx,edx
 0005F4E4    sar         ecx,1
>0005F4E6    jns         0005F4EB
 0005F4E8    adc         ecx,0
 0005F4EB    add         ecx,edx
 0005F4ED    push        ecx
 0005F4EE    mov         edx,dword ptr [ebp-34]
 0005F4F1    mov         eax,dword ptr [ebp-3C]
 0005F4F4    sub         edx,eax
 0005F4F6    sar         edx,1
>0005F4F8    jns         0005F4FD
 0005F4FA    adc         edx,0
 0005F4FD    add         edx,eax
 0005F4FF    push        edx
 0005F500    push        0
 0005F502    mov         eax,dword ptr [ebp-4]
 0005F505    mov         eax,dword ptr [eax+24]
 0005F508    push        eax
 0005F509    call        user32.SetWindowPos
 0005F50E    xor         eax,eax
 0005F510    call        DisableTaskWindows
 0005F515    mov         dword ptr [ebp-10],eax
 0005F518    mov         eax,dword ptr [ebp-4]
 0005F51B    call        TApplication.UseRightToLeftReading
 0005F520    test        al,al
>0005F522    je          0005F52A
 0005F524    or          ebx,100000
 0005F52A    xor         ecx,ecx
 0005F52C    push        ebp
 0005F52D    push        5F5A9
 0005F532    push        dword ptr fs:[ecx]
 0005F535    mov         dword ptr fs:[ecx],esp
 0005F538    push        ebx
 0005F539    push        edi
 0005F53A    push        esi
 0005F53B    mov         eax,dword ptr [ebp-4]
 0005F53E    mov         eax,dword ptr [eax+24]
 0005F541    push        eax
 0005F542    call        user32.MessageBoxA
 0005F547    mov         dword ptr [ebp-8],eax
 0005F54A    xor         eax,eax
 0005F54C    pop         edx
 0005F54D    pop         ecx
 0005F54E    pop         ecx
 0005F54F    mov         dword ptr fs:[eax],edx
 0005F552    push        5F5B0
 0005F557    mov         eax,dword ptr [ebp-14]
 0005F55A    cmp         eax,dword ptr [ebp-18]
>0005F55D    je          0005F597
 0005F55F    push        1D
 0005F561    push        0
 0005F563    push        0
 0005F565    mov         ecx,dword ptr [ebp-44]
 0005F568    mov         edx,dword ptr [ebp-4C]
 0005F56B    sub         ecx,edx
 0005F56D    sar         ecx,1
>0005F56F    jns         0005F574
 0005F571    adc         ecx,0
 0005F574    add         ecx,edx
 0005F576    push        ecx
 0005F577    mov         edx,dword ptr [ebp-48]
 0005F57A    mov         eax,dword ptr [ebp-50]
 0005F57D    sub         edx,eax
 0005F57F    sar         edx,1
>0005F581    jns         0005F586
 0005F583    adc         edx,0
 0005F586    add         edx,eax
 0005F588    push        edx
 0005F589    push        0
 0005F58B    mov         eax,dword ptr [ebp-4]
 0005F58E    mov         eax,dword ptr [eax+24]
 0005F591    push        eax
 0005F592    call        user32.SetWindowPos
 0005F597    mov         eax,dword ptr [ebp-10]
 0005F59A    call        EnableTaskWindows
 0005F59F    mov         eax,dword ptr [ebp-0C]
 0005F5A2    push        eax
 0005F5A3    call        user32.SetActiveWindow
 0005F5A8    ret
>0005F5A9    jmp         @HandleFinally
>0005F5AE    jmp         0005F557
 0005F5B0    mov         eax,dword ptr [ebp-8]
 0005F5B3    pop         edi
 0005F5B4    pop         esi
 0005F5B5    pop         ebx
 0005F5B6    mov         esp,ebp
 0005F5B8    pop         ebp
 0005F5B9    ret         4
*}
end;

//0005F5BC
procedure TApplication.ShowException(E:Exception);
begin
{*
 0005F5BC    push        ebp
 0005F5BD    mov         ebp,esp
 0005F5BF    add         esp,0FFFFFEF8
 0005F5C5    push        ebx
 0005F5C6    push        esi
 0005F5C7    xor         ecx,ecx
 0005F5C9    mov         dword ptr [ebp-108],ecx
 0005F5CF    mov         dword ptr [ebp-4],ecx
 0005F5D2    mov         esi,edx
 0005F5D4    mov         ebx,eax
 0005F5D6    xor         eax,eax
 0005F5D8    push        ebp
 0005F5D9    push        5F677
 0005F5DE    push        dword ptr fs:[eax]
 0005F5E1    mov         dword ptr fs:[eax],esp
 0005F5E4    lea         eax,[ebp-4]
 0005F5E7    mov         edx,dword ptr [esi+4]
 0005F5EA    call        @LStrLAsg
 0005F5EF    cmp         dword ptr [ebp-4],0
>0005F5F3    je          0005F629
 0005F5F5    mov         eax,dword ptr [ebp-4]
 0005F5F8    call        AnsiLastChar
 0005F5FD    mov         edx,eax
 0005F5FF    lea         eax,[ebp-104]
 0005F605    call        @_CToPasStr
 0005F60A    lea         eax,[ebp-104]
 0005F610    mov         edx,5F684
 0005F615    call        @PStrCmp
>0005F61A    jbe         0005F629
 0005F61C    lea         eax,[ebp-4]
 0005F61F    mov         edx,5F690;'.'
 0005F624    call        @LStrCat
 0005F629    push        10
 0005F62B    lea         edx,[ebp-108]
 0005F631    mov         eax,ebx
 0005F633    call        TApplication.GetTitle
 0005F638    mov         eax,dword ptr [ebp-108]
 0005F63E    call        @LStrToPChar
 0005F643    push        eax
 0005F644    mov         eax,dword ptr [ebp-4]
 0005F647    call        @LStrToPChar
 0005F64C    mov         edx,eax
 0005F64E    mov         eax,ebx
 0005F650    pop         ecx
 0005F651    call        TApplication.MessageBox
 0005F656    xor         eax,eax
 0005F658    pop         edx
 0005F659    pop         ecx
 0005F65A    pop         ecx
 0005F65B    mov         dword ptr fs:[eax],edx
 0005F65E    push        5F67E
 0005F663    lea         eax,[ebp-108]
 0005F669    call        @LStrClr
 0005F66E    lea         eax,[ebp-4]
 0005F671    call        @LStrClr
 0005F676    ret
>0005F677    jmp         @HandleFinally
>0005F67C    jmp         0005F663
 0005F67E    pop         esi
 0005F67F    pop         ebx
 0005F680    mov         esp,ebp
 0005F682    pop         ebp
 0005F683    ret
*}
end;

//0005F694
function TApplication.InvokeHelp(Command:Word; Data:Longint):Boolean;
begin
{*
 0005F694    push        ebx
 0005F695    push        esi
 0005F696    push        edi
 0005F697    add         esp,0FFFFFFF4
 0005F69A    mov         dword ptr [esp+4],ecx
 0005F69E    mov         word ptr [esp],dx
 0005F6A2    mov         esi,eax
 0005F6A4    xor         ebx,ebx
 0005F6A6    mov         byte ptr [esp+8],1
 0005F6AB    mov         eax,[000B67B4];Screen:TScreen
 0005F6B0    mov         edi,dword ptr [eax+5C]
 0005F6B3    test        edi,edi
>0005F6B5    je          0005F6DF
 0005F6B7    cmp         word ptr [edi+286],0
>0005F6BF    je          0005F6DF
 0005F6C1    lea         eax,[esp+8]
 0005F6C5    push        eax
 0005F6C6    mov         ecx,dword ptr [esp+8]
 0005F6CA    mov         dx,word ptr [esp+4]
 0005F6CF    mov         eax,dword ptr [edi+288]
 0005F6D5    call        dword ptr [edi+284]
 0005F6DB    mov         ebx,eax
>0005F6DD    jmp         0005F705
 0005F6DF    cmp         word ptr [esi+0DA],0
>0005F6E7    je          0005F705
 0005F6E9    lea         eax,[esp+8]
 0005F6ED    push        eax
 0005F6EE    mov         ecx,dword ptr [esp+8]
 0005F6F2    mov         dx,word ptr [esp+4]
 0005F6F7    mov         eax,dword ptr [esi+0DC]
 0005F6FD    call        dword ptr [esi+0D8]
 0005F703    mov         ebx,eax
 0005F705    cmp         byte ptr [esp+8],0
>0005F70A    je          0005F7B5
 0005F710    test        edi,edi
>0005F712    je          0005F758
 0005F714    mov         eax,edi
 0005F716    call        TWinControl.HandleAllocated
 0005F71B    test        al,al
>0005F71D    je          0005F758
 0005F71F    cmp         dword ptr [edi+21C],0
>0005F726    je          0005F758
 0005F728    mov         eax,edi
 0005F72A    call        TWinControl.GetHandle
 0005F72F    mov         ebx,eax
 0005F731    mov         eax,dword ptr [esp+4]
 0005F735    push        eax
 0005F736    movzx       eax,word ptr [esp+4]
 0005F73B    push        eax
 0005F73C    mov         eax,dword ptr [edi+21C]
 0005F742    call        @LStrToPChar
 0005F747    push        eax
 0005F748    push        ebx
 0005F749    call        user32.WinHelpA
 0005F74E    neg         eax
 0005F750    sbb         eax,eax
 0005F752    neg         eax
 0005F754    mov         ebx,eax
>0005F756    jmp         0005F7B5
 0005F758    cmp         dword ptr [esi+38],0
>0005F75C    je          0005F793
 0005F75E    mov         ebx,dword ptr [esi+24]
 0005F761    mov         eax,dword ptr [esi+30]
 0005F764    test        eax,eax
>0005F766    je          0005F76F
 0005F768    call        TWinControl.GetHandle
 0005F76D    mov         ebx,eax
 0005F76F    mov         eax,dword ptr [esp+4]
 0005F773    push        eax
 0005F774    movzx       eax,word ptr [esp+4]
 0005F779    push        eax
 0005F77A    mov         eax,dword ptr [esi+38]
 0005F77D    call        @LStrToPChar
 0005F782    push        eax
 0005F783    push        ebx
 0005F784    call        user32.WinHelpA
 0005F789    neg         eax
 0005F78B    sbb         eax,eax
 0005F78D    neg         eax
 0005F78F    mov         ebx,eax
>0005F791    jmp         0005F7B5
 0005F793    cmp         byte ptr [esi+8C],0
>0005F79A    jne         0005F7B5
 0005F79C    mov         eax,dword ptr [esp+4]
 0005F7A0    push        eax
 0005F7A1    movzx       eax,word ptr [esp+4]
 0005F7A6    push        eax
 0005F7A7    push        0B01F
 0005F7AC    mov         eax,dword ptr [esi+24]
 0005F7AF    push        eax
 0005F7B0    call        user32.PostMessageA
 0005F7B5    mov         eax,ebx
 0005F7B7    add         esp,0C
 0005F7BA    pop         edi
 0005F7BB    pop         esi
 0005F7BC    pop         ebx
 0005F7BD    ret
*}
end;

//0005F7C0
function TApplication.HelpContext(Context:THelpContext):Boolean;
begin
{*
 0005F7C0    mov         ecx,edx
 0005F7C2    mov         dx,1
 0005F7C6    call        TApplication.InvokeHelp
 0005F7CB    ret
*}
end;

//0005F7CC
function TApplication.HelpCommand(Command:Integer; Data:Longint):Boolean;
begin
{*
 0005F7CC    call        TApplication.InvokeHelp
 0005F7D1    ret
*}
end;

//0005F7D4
function TApplication.GetExeName:AnsiString;
begin
{*
 0005F7D4    push        ebx
 0005F7D5    mov         ebx,edx
 0005F7D7    mov         edx,ebx
 0005F7D9    xor         eax,eax
 0005F7DB    call        ParamStr
 0005F7E0    pop         ebx
 0005F7E1    ret
*}
end;

//0005F7E4
procedure TApplication.SetShowHint(Value:Boolean);
begin
{*
 0005F7E4    push        ebx
 0005F7E5    push        esi
 0005F7E6    mov         ebx,eax
 0005F7E8    cmp         dl,byte ptr [ebx+70]
>0005F7EB    je          0005F820
 0005F7ED    mov         eax,edx
 0005F7EF    mov         byte ptr [ebx+70],al
 0005F7F2    test        al,al
>0005F7F4    je          0005F813
 0005F7F6    mov         ecx,ebx
 0005F7F8    mov         dl,1
 0005F7FA    mov         eax,[000B49A8]
 0005F7FF    call        dword ptr [eax+2C]
 0005F802    mov         esi,eax
 0005F804    mov         dword ptr [ebx+6C],esi
 0005F807    mov         edx,dword ptr [ebx+44]
 0005F80A    mov         eax,esi
 0005F80C    call        TControl.SetColor
>0005F811    jmp         0005F820
 0005F813    mov         eax,dword ptr [ebx+6C]
 0005F816    call        TObject.Free
 0005F81B    xor         eax,eax
 0005F81D    mov         dword ptr [ebx+6C],eax
 0005F820    pop         esi
 0005F821    pop         ebx
 0005F822    ret
*}
end;

//0005F824
procedure TApplication.DoActionIdle;
begin
{*
 0005F824    push        ebx
 0005F825    push        esi
 0005F826    push        edi
 0005F827    mov         eax,[000B67B4];Screen:TScreen
 0005F82C    call        TScreen.GetCustomFormCount
 0005F831    mov         esi,eax
 0005F833    dec         esi
 0005F834    test        esi,esi
>0005F836    jl          0005F884
 0005F838    inc         esi
 0005F839    xor         edi,edi
 0005F83B    mov         edx,edi
 0005F83D    mov         eax,[000B67B4];Screen:TScreen
 0005F842    call        TScreen.GetCustomForms
 0005F847    mov         ebx,eax
 0005F849    mov         eax,ebx
 0005F84B    call        TWinControl.HandleAllocated
 0005F850    test        al,al
>0005F852    je          0005F880
 0005F854    mov         eax,ebx
 0005F856    call        TWinControl.GetHandle
 0005F85B    push        eax
 0005F85C    call        user32.IsWindowVisible
 0005F861    test        eax,eax
>0005F863    je          0005F880
 0005F865    mov         eax,ebx
 0005F867    call        TWinControl.GetHandle
 0005F86C    push        eax
 0005F86D    call        user32.IsWindowEnabled
 0005F872    test        eax,eax
>0005F874    je          0005F880
 0005F876    mov         eax,ebx
 0005F878    mov         edx,dword ptr [eax]
 0005F87A    call        dword ptr [edx+0BC]
 0005F880    inc         edi
 0005F881    dec         esi
>0005F882    jne         0005F83B
 0005F884    pop         edi
 0005F885    pop         esi
 0005F886    pop         ebx
 0005F887    ret
*}
end;

//0005F888
function TApplication.DoMouseIdle:TControl;
begin
{*
 0005F888    push        ebx
 0005F889    push        esi
 0005F88A    push        edi
 0005F88B    add         esp,0FFFFFFF8
 0005F88E    mov         ebx,eax
 0005F890    push        esp
 0005F891    call        user32.GetCursorPos
 0005F896    mov         eax,esp
 0005F898    mov         dl,1
 0005F89A    call        FindDragTarget
 0005F89F    mov         esi,eax
 0005F8A1    test        esi,esi
>0005F8A3    je          0005F8AD
 0005F8A5    test        byte ptr [esi+20],10
>0005F8A9    je          0005F8AD
 0005F8AB    xor         esi,esi
 0005F8AD    call        GetCaptureControl
 0005F8B2    mov         edi,eax
 0005F8B4    cmp         esi,dword ptr [ebx+34]
>0005F8B7    je          0005F904
 0005F8B9    cmp         dword ptr [ebx+34],0
>0005F8BD    je          0005F8C3
 0005F8BF    test        edi,edi
>0005F8C1    je          0005F8CC
 0005F8C3    test        edi,edi
>0005F8C5    je          0005F8DD
 0005F8C7    cmp         edi,dword ptr [ebx+34]
>0005F8CA    jne         0005F8DD
 0005F8CC    push        0
 0005F8CE    xor         ecx,ecx
 0005F8D0    mov         edx,0B014
 0005F8D5    mov         eax,dword ptr [ebx+34]
 0005F8D8    call        TControl.Perform
 0005F8DD    mov         dword ptr [ebx+34],esi
 0005F8E0    cmp         dword ptr [ebx+34],0
>0005F8E4    je          0005F8EA
 0005F8E6    test        edi,edi
>0005F8E8    je          0005F8F3
 0005F8EA    test        edi,edi
>0005F8EC    je          0005F904
 0005F8EE    cmp         edi,dword ptr [ebx+34]
>0005F8F1    jne         0005F904
 0005F8F3    push        0
 0005F8F5    xor         ecx,ecx
 0005F8F7    mov         edx,0B013
 0005F8FC    mov         eax,dword ptr [ebx+34]
 0005F8FF    call        TControl.Perform
 0005F904    mov         eax,esi
 0005F906    pop         ecx
 0005F907    pop         edx
 0005F908    pop         edi
 0005F909    pop         esi
 0005F90A    pop         ebx
 0005F90B    ret
*}
end;

//0005F90C
procedure TApplication.Idle(const Msg:TMsg);
begin
{*
 0005F90C    push        ebp
 0005F90D    mov         ebp,esp
 0005F90F    add         esp,0FFFFFFF0
 0005F912    push        ebx
 0005F913    push        esi
 0005F914    push        edi
 0005F915    xor         ecx,ecx
 0005F917    mov         dword ptr [ebp-0C],ecx
 0005F91A    mov         dword ptr [ebp-10],ecx
 0005F91D    mov         esi,edx
 0005F91F    mov         dword ptr [ebp-4],eax
 0005F922    xor         eax,eax
 0005F924    push        ebp
 0005F925    push        5FA17
 0005F92A    push        dword ptr fs:[eax]
 0005F92D    mov         dword ptr fs:[eax],esp
 0005F930    mov         eax,dword ptr [ebp-4]
 0005F933    call        TApplication.DoMouseIdle
 0005F938    mov         ebx,eax
 0005F93A    mov         eax,dword ptr [ebp-4]
 0005F93D    cmp         byte ptr [eax+70],0
>0005F941    je          0005F954
 0005F943    mov         eax,dword ptr [ebp-4]
 0005F946    cmp         dword ptr [eax+34],0
>0005F94A    jne         0005F954
 0005F94C    mov         eax,dword ptr [ebp-4]
 0005F94F    call        TApplication.CancelHint
 0005F954    lea         edx,[ebp-10]
 0005F957    mov         eax,ebx
 0005F959    call        GetHint
 0005F95E    mov         eax,dword ptr [ebp-10]
 0005F961    lea         edx,[ebp-0C]
 0005F964    call        GetLongHint
 0005F969    mov         edx,dword ptr [ebp-0C]
 0005F96C    mov         eax,[000B67B0];Application:TApplication
 0005F971    call        TApplication.SetHint
 0005F976    mov         byte ptr [ebp-5],1
 0005F97A    xor         eax,eax
 0005F97C    push        ebp
 0005F97D    push        5F9D0
 0005F982    push        dword ptr fs:[eax]
 0005F985    mov         dword ptr fs:[eax],esp
 0005F988    mov         eax,dword ptr [ebp-4]
 0005F98B    cmp         word ptr [eax+0EA],0
>0005F993    je          0005F9AA
 0005F995    lea         ecx,[ebp-5]
 0005F998    mov         ebx,dword ptr [ebp-4]
 0005F99B    mov         edx,dword ptr [ebp-4]
 0005F99E    mov         eax,dword ptr [ebx+0EC]
 0005F9A4    call        dword ptr [ebx+0E8]
 0005F9AA    cmp         byte ptr [ebp-5],0
>0005F9AE    je          0005F9C6
 0005F9B0    mov         edx,esi
 0005F9B2    mov         eax,dword ptr [ebp-4]
 0005F9B5    call        TApplication.IsIdleMessage
 0005F9BA    test        al,al
>0005F9BC    je          0005F9C6
 0005F9BE    mov         eax,dword ptr [ebp-4]
 0005F9C1    call        TApplication.DoActionIdle
 0005F9C6    xor         eax,eax
 0005F9C8    pop         edx
 0005F9C9    pop         ecx
 0005F9CA    pop         ecx
 0005F9CB    mov         dword ptr fs:[eax],edx
>0005F9CE    jmp         0005F9F1
>0005F9D0    jmp         @HandleOnException
 0005F9D5    dd          1
 0005F9D9    dd          000176E8;Exception
 0005F9DD    dd          0005F9E1
 0005F9E1    mov         edx,dword ptr [ebp-4]
 0005F9E4    mov         eax,dword ptr [ebp-4]
 0005F9E7    call        TApplication.HandleException
 0005F9EC    call        @DoneExcept
 0005F9F1    cmp         byte ptr [ebp-5],0
>0005F9F5    je          0005F9FC
 0005F9F7    call        user32.WaitMessage
 0005F9FC    xor         eax,eax
 0005F9FE    pop         edx
 0005F9FF    pop         ecx
 0005FA00    pop         ecx
 0005FA01    mov         dword ptr fs:[eax],edx
 0005FA04    push        5FA1E
 0005FA09    lea         eax,[ebp-10]
 0005FA0C    mov         edx,2
 0005FA11    call        @LStrArrayClr
 0005FA16    ret
>0005FA17    jmp         @HandleFinally
>0005FA1C    jmp         0005FA09
 0005FA1E    pop         edi
 0005FA1F    pop         esi
 0005FA20    pop         ebx
 0005FA21    mov         esp,ebp
 0005FA23    pop         ebp
 0005FA24    ret
*}
end;

//0005FA28
procedure TApplication.NotifyForms(Msg:Word);
begin
{*
 0005FA28    push        ebx
 0005FA29    push        esi
 0005FA2A    push        edi
 0005FA2B    mov         edi,edx
 0005FA2D    mov         eax,[000B67B4];Screen:TScreen
 0005FA32    call        TScreen.GetFormCount
 0005FA37    mov         ebx,eax
 0005FA39    dec         ebx
 0005FA3A    test        ebx,ebx
>0005FA3C    jl          0005FA5D
 0005FA3E    inc         ebx
 0005FA3F    xor         esi,esi
 0005FA41    push        0
 0005FA43    mov         edx,esi
 0005FA45    mov         eax,[000B67B4];Screen:TScreen
 0005FA4A    call        TScreen.GetForm
 0005FA4F    movzx       edx,di
 0005FA52    xor         ecx,ecx
 0005FA54    call        TControl.Perform
 0005FA59    inc         esi
 0005FA5A    dec         ebx
>0005FA5B    jne         0005FA41
 0005FA5D    pop         edi
 0005FA5E    pop         esi
 0005FA5F    pop         ebx
 0005FA60    ret
*}
end;

//0005FA64
procedure TApplication.IconChanged(Sender:TObject);
begin
{*
 0005FA64    push        ebx
 0005FA65    mov         ebx,eax
 0005FA67    mov         eax,[000B58C0];NewStyleControls:Boolean
 0005FA6C    cmp         byte ptr [eax],0
>0005FA6F    je          0005FA8B
 0005FA71    mov         eax,ebx
 0005FA73    call        TApplication.GetIconHandle
 0005FA78    push        eax
 0005FA79    push        1
 0005FA7B    push        80
 0005FA80    mov         eax,dword ptr [ebx+24]
 0005FA83    push        eax
 0005FA84    call        user32.SendMessageA
>0005FA89    jmp         0005FAA5
 0005FA8B    mov         eax,dword ptr [ebx+24]
 0005FA8E    push        eax
 0005FA8F    call        user32.IsIconic
 0005FA94    test        eax,eax
>0005FA96    je          0005FAA5
 0005FA98    push        0FF
 0005FA9A    push        0
 0005FA9C    mov         eax,dword ptr [ebx+24]
 0005FA9F    push        eax
 0005FAA0    call        user32.InvalidateRect
 0005FAA5    mov         dx,0B01D
 0005FAA9    mov         eax,ebx
 0005FAAB    call        TApplication.NotifyForms
 0005FAB0    pop         ebx
 0005FAB1    ret
*}
end;

//0005FAB4
procedure TApplication.SetHint(const Value:AnsiString);
begin
{*
 0005FAB4    push        ebp
 0005FAB5    mov         ebp,esp
 0005FAB7    push        ecx
 0005FAB8    push        ebx
 0005FAB9    push        esi
 0005FABA    mov         esi,edx
 0005FABC    mov         ebx,eax
 0005FABE    mov         eax,dword ptr [ebx+3C]
 0005FAC1    mov         edx,esi
 0005FAC3    call        @LStrCmp
>0005FAC8    je          0005FB40
 0005FACA    lea         eax,[ebx+3C]
 0005FACD    mov         edx,esi
 0005FACF    call        @LStrAsg
 0005FAD4    cmp         word ptr [ebx+0E2],0
>0005FADC    je          0005FAEE
 0005FADE    mov         edx,ebx
 0005FAE0    mov         eax,dword ptr [ebx+0E4]
 0005FAE6    call        dword ptr [ebx+0E0]
>0005FAEC    jmp         0005FB40
 0005FAEE    mov         ecx,ebx
 0005FAF0    mov         dl,1
 0005FAF2    mov         eax,[0003DDB0];THintAction
 0005FAF7    call        THintAction.Create
 0005FAFC    mov         dword ptr [ebp-4],eax
 0005FAFF    mov         edx,esi
 0005FB01    mov         eax,dword ptr [ebp-4]
 0005FB04    call        TCustomAction.SetHint
 0005FB09    xor         eax,eax
 0005FB0B    push        ebp
 0005FB0C    push        5FB39
 0005FB11    push        dword ptr fs:[eax]
 0005FB14    mov         dword ptr fs:[eax],esp
 0005FB17    mov         eax,dword ptr [ebp-4]
 0005FB1A    mov         bx,0FFF0
 0005FB1E    call        @CallDynaInst
 0005FB23    xor         eax,eax
 0005FB25    pop         edx
 0005FB26    pop         ecx
 0005FB27    pop         ecx
 0005FB28    mov         dword ptr fs:[eax],edx
 0005FB2B    push        5FB40
 0005FB30    mov         eax,dword ptr [ebp-4]
 0005FB33    call        TObject.Free
 0005FB38    ret
>0005FB39    jmp         @HandleFinally
>0005FB3E    jmp         0005FB30
 0005FB40    pop         esi
 0005FB41    pop         ebx
 0005FB42    pop         ecx
 0005FB43    pop         ebp
 0005FB44    ret
*}
end;

//0005FB48
procedure SetVisible(Value:Boolean);
begin
{*
 0005FB48    push        ebp
 0005FB49    mov         ebp,esp
 0005FB4B    push        ebx
 0005FB4C    mov         ebx,eax
 0005FB4E    mov         eax,dword ptr [ebp+8]
 0005FB51    mov         eax,dword ptr [eax-4]
 0005FB54    mov         eax,dword ptr [eax+24]
 0005FB57    push        eax
 0005FB58    call        user32.IsWindowVisible
 0005FB5D    neg         eax
 0005FB5F    sbb         eax,eax
 0005FB61    neg         eax
 0005FB63    cmp         al,byte ptr ds:[0B4ADC]
>0005FB69    jne         0005FB9F
 0005FB6B    cmp         bl,byte ptr ds:[0B4ADC]
>0005FB71    je          0005FB9F
 0005FB73    xor         eax,eax
 0005FB75    mov         al,bl
 0005FB77    movzx       eax,word ptr [eax*2+0B4AE0]
 0005FB7F    push        eax
 0005FB80    push        0
 0005FB82    push        0
 0005FB84    push        0
 0005FB86    push        0
 0005FB88    push        0
 0005FB8A    mov         eax,dword ptr [ebp+8]
 0005FB8D    mov         eax,dword ptr [eax-4]
 0005FB90    mov         eax,dword ptr [eax+24]
 0005FB93    push        eax
 0005FB94    call        user32.SetWindowPos
 0005FB99    mov         byte ptr ds:[0B4ADC],bl
 0005FB9F    pop         ebx
 0005FBA0    pop         ebp
 0005FBA1    ret
*}
end;

//0005FBA4
procedure TApplication.UpdateVisible;
begin
{*
 0005FBA4    push        ebp
 0005FBA5    mov         ebp,esp
 0005FBA7    push        ecx
 0005FBA8    push        ebx
 0005FBA9    push        esi
 0005FBAA    mov         dword ptr [ebp-4],eax
 0005FBAD    mov         eax,dword ptr [ebp-4]
 0005FBB0    cmp         dword ptr [eax+24],0
>0005FBB4    je          0005FBF4
 0005FBB6    mov         eax,[000B67B4];Screen:TScreen
 0005FBBB    call        TScreen.GetFormCount
 0005FBC0    mov         ebx,eax
 0005FBC2    dec         ebx
 0005FBC3    test        ebx,ebx
>0005FBC5    jl          0005FBEB
 0005FBC7    inc         ebx
 0005FBC8    xor         esi,esi
 0005FBCA    mov         edx,esi
 0005FBCC    mov         eax,[000B67B4];Screen:TScreen
 0005FBD1    call        TScreen.GetForm
 0005FBD6    cmp         byte ptr [eax+47],0
>0005FBDA    je          0005FBE7
 0005FBDC    push        ebp
 0005FBDD    mov         al,1
 0005FBDF    call        SetVisible
 0005FBE4    pop         ecx
>0005FBE5    jmp         0005FBF4
 0005FBE7    inc         esi
 0005FBE8    dec         ebx
>0005FBE9    jne         0005FBCA
 0005FBEB    push        ebp
 0005FBEC    xor         eax,eax
 0005FBEE    call        SetVisible
 0005FBF3    pop         ecx
 0005FBF4    pop         esi
 0005FBF5    pop         ebx
 0005FBF6    pop         ecx
 0005FBF7    pop         ebp
 0005FBF8    ret
*}
end;

//0005FBFC
procedure TApplication.StartHintTimer(Value:Integer; TimerMode:TTimerMode);
begin
{*
 0005FBFC    push        ebx
 0005FBFD    push        esi
 0005FBFE    push        edi
 0005FBFF    mov         ebx,ecx
 0005FC01    mov         esi,edx
 0005FC03    mov         edi,eax
 0005FC05    mov         eax,edi
 0005FC07    call        TApplication.StopHintTimer
 0005FC0C    push        5DD44;HintTimerProc
 0005FC11    push        esi
 0005FC12    push        0
 0005FC14    push        0
 0005FC16    call        user32.SetTimer
 0005FC1B    mov         word ptr [edi+72],ax
 0005FC1F    mov         byte ptr [edi+71],bl
 0005FC22    cmp         word ptr [edi+72],0
>0005FC27    jne         0005FC30
 0005FC29    mov         eax,edi
 0005FC2B    call        TApplication.CancelHint
 0005FC30    pop         edi
 0005FC31    pop         esi
 0005FC32    pop         ebx
 0005FC33    ret
*}
end;

//0005FC34
procedure TApplication.StopHintTimer;
begin
{*
 0005FC34    push        ebx
 0005FC35    mov         ebx,eax
 0005FC37    mov         ax,word ptr [ebx+72]
 0005FC3B    test        ax,ax
>0005FC3E    je          0005FC51
 0005FC40    movzx       eax,ax
 0005FC43    push        eax
 0005FC44    push        0
 0005FC46    call        user32.KillTimer
 0005FC4B    mov         word ptr [ebx+72],0
 0005FC51    pop         ebx
 0005FC52    ret
*}
end;

//0005FC54
procedure TApplication.HintMouseMessage(Control:TControl; var Message:TMessage);
begin
{*
 0005FC54    push        ebx
 0005FC55    push        esi
 0005FC56    push        edi
 0005FC57    push        ebp
 0005FC58    add         esp,0FFFFFFE0
 0005FC5B    mov         ebp,ecx
 0005FC5D    mov         edi,edx
 0005FC5F    mov         esi,eax
 0005FC61    lea         edx,[esp+18]
 0005FC65    mov         eax,dword ptr [ebp+8]
 0005FC68    call        SmallPointToPoint
 0005FC6D    lea         edx,[esp+18]
 0005FC71    lea         ecx,[esp+10]
 0005FC75    mov         eax,edi
 0005FC77    call        TControl.ClientToScreen
 0005FC7C    lea         eax,[esp+10]
 0005FC80    mov         dl,1
 0005FC82    call        FindDragTarget
 0005FC87    call        GetHintControl
 0005FC8C    mov         ebx,eax
 0005FC8E    test        ebx,ebx
>0005FC90    je          0005FC9B
 0005FC92    cmp         byte ptr [ebx+85],0
>0005FC99    jne         0005FCA7
 0005FC9B    mov         eax,esi
 0005FC9D    call        TApplication.CancelHint
>0005FCA2    jmp         0005FD58
 0005FCA7    cmp         ebx,dword ptr [esi+48]
>0005FCAA    jne         0005FCDC
 0005FCAC    lea         edx,[esp+18]
 0005FCB0    mov         eax,dword ptr [ebp+8]
 0005FCB3    call        SmallPointToPoint
 0005FCB8    lea         edx,[esp+18]
 0005FCBC    lea         ecx,[esp+10]
 0005FCC0    mov         eax,edi
 0005FCC2    call        TControl.ClientToScreen
 0005FCC7    push        dword ptr [esp+14]
 0005FCCB    push        dword ptr [esp+14]
 0005FCCF    lea         eax,[esi+4C]
 0005FCD2    push        eax
 0005FCD3    call        user32.PtInRect
 0005FCD8    test        eax,eax
>0005FCDA    jne         0005FD58
 0005FCDC    mov         al,byte ptr [esi+40]
 0005FCDF    mov         byte ptr [esp+4],al
 0005FCE3    cmp         byte ptr [esp+4],0
>0005FCE8    je          0005FCF2
 0005FCEA    mov         eax,dword ptr [esi+68]
 0005FCED    mov         dword ptr [esp],eax
>0005FCF0    jmp         0005FCF8
 0005FCF2    mov         eax,dword ptr [esi+60]
 0005FCF5    mov         dword ptr [esp],eax
 0005FCF8    mov         eax,esp
 0005FCFA    push        eax
 0005FCFB    xor         ecx,ecx
 0005FCFD    mov         cl,byte ptr [esp+8]
 0005FD01    mov         edx,0B041
 0005FD06    mov         eax,ebx
 0005FD08    call        TControl.Perform
 0005FD0D    cmp         byte ptr [esp+4],0
>0005FD12    je          0005FD3B
 0005FD14    cmp         dword ptr [esp],0
>0005FD18    jne         0005FD3B
 0005FD1A    mov         al,byte ptr [esp+4]
 0005FD1E    mov         byte ptr [esi+40],al
 0005FD21    mov         dword ptr [esi+48],ebx
 0005FD24    lea         eax,[esp+8]
 0005FD28    push        eax
 0005FD29    call        user32.GetCursorPos
 0005FD2E    lea         edx,[esp+8]
 0005FD32    mov         eax,esi
 0005FD34    call        TApplication.ActivateHint
>0005FD39    jmp         0005FD58
 0005FD3B    mov         eax,esi
 0005FD3D    call        TApplication.CancelHint
 0005FD42    mov         al,byte ptr [esp+4]
 0005FD46    mov         byte ptr [esi+40],al
 0005FD49    mov         dword ptr [esi+48],ebx
 0005FD4C    xor         ecx,ecx
 0005FD4E    mov         edx,dword ptr [esp]
 0005FD51    mov         eax,esi
 0005FD53    call        TApplication.StartHintTimer
 0005FD58    add         esp,20
 0005FD5B    pop         ebp
 0005FD5C    pop         edi
 0005FD5D    pop         esi
 0005FD5E    pop         ebx
 0005FD5F    ret
*}
end;

//0005FD60
procedure TApplication.HintTimerExpired;
begin
{*
 0005FD60    push        ebx
 0005FD61    add         esp,0FFFFFFF8
 0005FD64    mov         ebx,eax
 0005FD66    mov         eax,ebx
 0005FD68    call        TApplication.StopHintTimer
 0005FD6D    mov         al,byte ptr [ebx+71]
 0005FD70    sub         al,1
>0005FD72    jb          0005FD7F
>0005FD74    jne         0005FD8E
 0005FD76    mov         eax,ebx
 0005FD78    call        TApplication.HideHint
>0005FD7D    jmp         0005FD8E
 0005FD7F    push        esp
 0005FD80    call        user32.GetCursorPos
 0005FD85    mov         edx,esp
 0005FD87    mov         eax,ebx
 0005FD89    call        TApplication.ActivateHint
 0005FD8E    pop         ecx
 0005FD8F    pop         edx
 0005FD90    pop         ebx
 0005FD91    ret
*}
end;

//0005FD94
procedure TApplication.HideHint;
begin
{*
 0005FD94    push        ebx
 0005FD95    push        esi
 0005FD96    mov         ebx,eax
 0005FD98    mov         esi,dword ptr [ebx+6C]
 0005FD9B    test        esi,esi
>0005FD9D    je          0005FDCC
 0005FD9F    mov         eax,esi
 0005FDA1    call        TWinControl.HandleAllocated
 0005FDA6    test        al,al
>0005FDA8    je          0005FDCC
 0005FDAA    mov         eax,dword ptr [ebx+6C]
 0005FDAD    call        TWinControl.GetHandle
 0005FDB2    push        eax
 0005FDB3    call        user32.IsWindowVisible
 0005FDB8    test        eax,eax
>0005FDBA    je          0005FDCC
 0005FDBC    push        0
 0005FDBE    mov         eax,dword ptr [ebx+6C]
 0005FDC1    call        TWinControl.GetHandle
 0005FDC6    push        eax
 0005FDC7    call        user32.ShowWindow
 0005FDCC    pop         esi
 0005FDCD    pop         ebx
 0005FDCE    ret
*}
end;

//0005FDD0
procedure TApplication.CancelHint;
begin
{*
 0005FDD0    push        ebx
 0005FDD1    mov         ebx,eax
 0005FDD3    cmp         dword ptr [ebx+48],0
>0005FDD7    je          0005FDF5
 0005FDD9    mov         eax,ebx
 0005FDDB    call        TApplication.HideHint
 0005FDE0    xor         eax,eax
 0005FDE2    mov         dword ptr [ebx+48],eax
 0005FDE5    mov         byte ptr [ebx+40],0
 0005FDE9    call        UnhookHintHooks
 0005FDEE    mov         eax,ebx
 0005FDF0    call        TApplication.StopHintTimer
 0005FDF5    pop         ebx
 0005FDF6    ret
*}
end;

//0005FDF8
function FindScanline(Source:Pointer; MaxLen:Cardinal; Value:Cardinal):Cardinal;
begin
{*
 0005FDF8    push        ecx
 0005FDF9    mov         ecx,edx
 0005FDFB    mov         edx,edi
 0005FDFD    mov         edi,eax
 0005FDFF    pop         eax
 0005FE00    repe scas   byte ptr [edi]
 0005FE02    mov         eax,ecx
 0005FE04    mov         edi,edx
 0005FE06    ret
*}
end;

//0005FE08
function GetCursorHeightMargin:Integer;
begin
{*
 0005FE08    push        ebp
 0005FE09    mov         ebp,esp
 0005FE0B    add         esp,0FFFFFFD8
 0005FE0E    push        ebx
 0005FE0F    push        esi
 0005FE10    push        edi
 0005FE11    push        0E
 0005FE13    mov         eax,[000B582C];^gvar_000B66A0
 0005FE18    mov         eax,dword ptr [eax]
 0005FE1A    call        eax
 0005FE1C    mov         dword ptr [ebp-4],eax
 0005FE1F    lea         eax,[ebp-28]
 0005FE22    push        eax
 0005FE23    call        user32.GetCursor
 0005FE28    push        eax
 0005FE29    call        user32.GetIconInfo
 0005FE2E    test        eax,eax
>0005FE30    je          0005FF51
 0005FE36    xor         edx,edx
 0005FE38    push        ebp
 0005FE39    push        5FF4A
 0005FE3E    push        dword ptr fs:[edx]
 0005FE41    mov         dword ptr fs:[edx],esp
 0005FE44    lea         ecx,[ebp-0C]
 0005FE47    lea         edx,[ebp-8]
 0005FE4A    mov         eax,dword ptr [ebp-1C]
 0005FE4D    call        GetDIBSizes
 0005FE52    mov         eax,dword ptr [ebp-8]
 0005FE55    add         eax,dword ptr [ebp-0C]
 0005FE58    call        AllocMem
 0005FE5D    mov         dword ptr [ebp-10],eax
 0005FE60    xor         edx,edx
 0005FE62    push        ebp
 0005FE63    push        5FF1B
 0005FE68    push        dword ptr fs:[edx]
 0005FE6B    mov         dword ptr fs:[edx],esp
 0005FE6E    mov         ebx,dword ptr [ebp-10]
 0005FE71    add         ebx,dword ptr [ebp-8]
 0005FE74    push        ebx
 0005FE75    mov         esi,dword ptr [ebp-10]
 0005FE78    mov         ecx,esi
 0005FE7A    xor         edx,edx
 0005FE7C    mov         eax,dword ptr [ebp-1C]
 0005FE7F    call        GetDIB
 0005FE84    test        al,al
>0005FE86    je          0005FEFF
 0005FE88    mov         eax,dword ptr [ebp-10]
 0005FE8B    cmp         word ptr [eax+0E],1
>0005FE90    jne         0005FEFF
 0005FE92    mov         eax,dword ptr [esi+4]
 0005FE95    mov         edx,eax
 0005FE97    movzx       ecx,word ptr [esi+0E]
 0005FE9B    imul        edx,ecx
 0005FE9E    add         edx,1F
 0005FEA1    and         edx,0FFFFFFE0
 0005FEA4    test        edx,edx
>0005FEA6    jns         0005FEAB
 0005FEA8    add         edx,7
 0005FEAB    sar         edx,3
 0005FEAE    mov         dword ptr [ebp-14],edx
 0005FEB1    mov         edi,eax
 0005FEB3    imul        edi,dword ptr [ebp-14]
 0005FEB7    add         ebx,dword ptr [ebp-0C]
 0005FEBA    sub         ebx,edi
 0005FEBC    mov         ecx,0FF
 0005FEC1    mov         edx,edi
 0005FEC3    mov         eax,ebx
 0005FEC5    call        FindScanline
 0005FECA    mov         dword ptr [ebp-4],eax
 0005FECD    cmp         dword ptr [ebp-4],0
>0005FED1    jne         0005FEEF
 0005FED3    mov         eax,dword ptr [esi+8]
 0005FED6    mov         edx,dword ptr [esi+4]
 0005FED9    add         edx,edx
 0005FEDB    cmp         eax,edx
>0005FEDD    jl          0005FEEF
 0005FEDF    mov         eax,ebx
 0005FEE1    sub         eax,edi
 0005FEE3    xor         ecx,ecx
 0005FEE5    mov         edx,edi
 0005FEE7    call        FindScanline
 0005FEEC    mov         dword ptr [ebp-4],eax
 0005FEEF    mov         eax,dword ptr [ebp-4]
 0005FEF2    cdq
 0005FEF3    idiv        eax,dword ptr [ebp-14]
 0005FEF6    mov         dword ptr [ebp-4],eax
 0005FEF9    mov         eax,dword ptr [ebp-20]
 0005FEFC    sub         dword ptr [ebp-4],eax
 0005FEFF    xor         eax,eax
 0005FF01    pop         edx
 0005FF02    pop         ecx
 0005FF03    pop         ecx
 0005FF04    mov         dword ptr fs:[eax],edx
 0005FF07    push        5FF22
 0005FF0C    mov         edx,dword ptr [ebp-8]
 0005FF0F    add         edx,dword ptr [ebp-0C]
 0005FF12    mov         eax,dword ptr [ebp-10]
 0005FF15    call        @FreeMem
 0005FF1A    ret
>0005FF1B    jmp         @HandleFinally
>0005FF20    jmp         0005FF0C
 0005FF22    xor         eax,eax
 0005FF24    pop         edx
 0005FF25    pop         ecx
 0005FF26    pop         ecx
 0005FF27    mov         dword ptr fs:[eax],edx
 0005FF2A    push        5FF51
 0005FF2F    mov         eax,dword ptr [ebp-18]
 0005FF32    test        eax,eax
>0005FF34    je          0005FF3C
 0005FF36    push        eax
 0005FF37    call        gdi32.DeleteObject
 0005FF3C    mov         eax,dword ptr [ebp-1C]
 0005FF3F    test        eax,eax
>0005FF41    je          0005FF49
 0005FF43    push        eax
 0005FF44    call        gdi32.DeleteObject
 0005FF49    ret
>0005FF4A    jmp         @HandleFinally
>0005FF4F    jmp         0005FF2F
 0005FF51    mov         eax,dword ptr [ebp-4]
 0005FF54    pop         edi
 0005FF55    pop         esi
 0005FF56    pop         ebx
 0005FF57    mov         esp,ebp
 0005FF59    pop         ebp
 0005FF5A    ret
*}
end;

//0005FF5C
procedure ValidateHintWindow(HintClass:THintWindowClass);
begin
{*
 0005FF5C    push        ebp
 0005FF5D    mov         ebp,esp
 0005FF5F    push        ebx
 0005FF60    push        esi
 0005FF61    mov         ebx,eax
 0005FF63    test        ebx,ebx
>0005FF65    jne         0005FF6D
 0005FF67    mov         ebx,dword ptr ds:[0B49A8]
 0005FF6D    mov         eax,dword ptr [ebp+8]
 0005FF70    mov         eax,dword ptr [eax-4]
 0005FF73    mov         esi,dword ptr [eax+6C]
 0005FF76    test        esi,esi
>0005FF78    je          0005FF88
 0005FF7A    mov         eax,dword ptr [ebp+8]
 0005FF7D    mov         eax,esi
 0005FF7F    call        TObject.ClassType
 0005FF84    cmp         ebx,eax
>0005FF86    je          0005FFAC
 0005FF88    mov         eax,dword ptr [ebp+8]
 0005FF8B    mov         eax,dword ptr [eax-4]
 0005FF8E    mov         eax,dword ptr [eax+6C]
 0005FF91    call        TObject.Free
 0005FF96    mov         eax,dword ptr [ebp+8]
 0005FF99    mov         ecx,dword ptr [eax-4]
 0005FF9C    mov         dl,1
 0005FF9E    mov         eax,ebx
 0005FFA0    call        dword ptr [eax+2C]
 0005FFA3    mov         edx,dword ptr [ebp+8]
 0005FFA6    mov         edx,dword ptr [edx-4]
 0005FFA9    mov         dword ptr [edx+6C],eax
 0005FFAC    pop         esi
 0005FFAD    pop         ebx
 0005FFAE    pop         ebp
 0005FFAF    ret
*}
end;

//0005FFB0
procedure TApplication.ActivateHint(CursorPos:TPoint);
begin
{*
 0005FFB0    push        ebp
 0005FFB1    mov         ebp,esp
 0005FFB3    add         esp,0FFFFFF70
 0005FFB9    push        ebx
 0005FFBA    push        esi
 0005FFBB    push        edi
 0005FFBC    xor         ecx,ecx
 0005FFBE    mov         dword ptr [ebp-8C],ecx
 0005FFC4    mov         dword ptr [ebp-90],ecx
 0005FFCA    mov         esi,edx
 0005FFCC    lea         edi,[ebp-0C]
 0005FFCF    movs        dword ptr [edi],dword ptr [esi]
 0005FFD0    movs        dword ptr [edi],dword ptr [esi]
 0005FFD1    mov         dword ptr [ebp-4],eax
 0005FFD4    lea         eax,[ebp-60]
 0005FFD7    mov         edx,dword ptr ds:[56410];THintInfo
 0005FFDD    call        @AddRefRecord
 0005FFE2    lea         esi,[ebp-4]
 0005FFE5    xor         eax,eax
 0005FFE7    push        ebp
 0005FFE8    push        60337
 0005FFED    push        dword ptr fs:[eax]
 0005FFF0    mov         dword ptr fs:[eax],esp
 0005FFF3    mov         eax,dword ptr [esi]
 0005FFF5    mov         byte ptr [eax+40],0
 0005FFF9    mov         eax,dword ptr [esi]
 0005FFFB    cmp         byte ptr [eax+70],0
>0005FFFF    je          000602F0
 00060005    mov         eax,dword ptr [esi]
 00060007    cmp         dword ptr [eax+48],0
>0006000B    je          000602F0
 00060011    call        ForegroundTask
 00060016    test        al,al
>00060018    je          000602F0
 0006001E    lea         eax,[ebp-0C]
 00060021    mov         dl,1
 00060023    call        FindDragTarget
 00060028    call        GetHintControl
 0006002D    mov         edx,dword ptr [esi]
 0006002F    cmp         eax,dword ptr [edx+48]
>00060032    jne         000602F0
 00060038    mov         eax,dword ptr [esi]
 0006003A    mov         eax,dword ptr [eax+48]
 0006003D    mov         dword ptr [ebp-60],eax
 00060040    mov         eax,dword ptr [ebp-0C]
 00060043    mov         dword ptr [ebp-58],eax
 00060046    mov         eax,dword ptr [ebp-8]
 00060049    mov         dword ptr [ebp-54],eax
 0006004C    call        GetCursorHeightMargin
 00060051    add         dword ptr [ebp-54],eax
 00060054    mov         eax,[000B67B4];Screen:TScreen
 00060059    call        TScreen.GetWidth
 0006005E    mov         dword ptr [ebp-50],eax
 00060061    mov         eax,dword ptr [esi]
 00060063    mov         eax,dword ptr [eax+44]
 00060066    mov         dword ptr [ebp-4C],eax
 00060069    lea         edx,[ebp-80]
 0006006C    mov         eax,dword ptr [esi]
 0006006E    mov         eax,dword ptr [eax+48]
 00060071    call        TControl.GetBoundsRect
 00060076    push        esi
 00060077    lea         esi,[ebp-80]
 0006007A    lea         edi,[ebp-48]
 0006007D    mov         ecx,4
 00060082    rep movs    dword ptr [edi],dword ptr [esi]
 00060084    pop         esi
 00060085    lea         edx,[ebp-14]
 00060088    mov         eax,dword ptr [esi]
 0006008A    mov         eax,dword ptr [eax+48]
 0006008D    mov         ecx,dword ptr [eax]
 0006008F    call        dword ptr [ecx+40]
 00060092    xor         eax,eax
 00060094    mov         dword ptr [ebp-1C],eax
 00060097    xor         eax,eax
 00060099    mov         dword ptr [ebp-18],eax
 0006009C    mov         eax,dword ptr [esi]
 0006009E    mov         eax,dword ptr [eax+48]
 000600A1    mov         ebx,dword ptr [eax+24]
 000600A4    test        ebx,ebx
>000600A6    je          000600B4
 000600A8    lea         edx,[ebp-1C]
 000600AB    mov         eax,ebx
 000600AD    mov         ecx,dword ptr [eax]
 000600AF    call        dword ptr [ecx+40]
>000600B2    jmp         000600E3
 000600B4    mov         eax,dword ptr [esi]
 000600B6    mov         ebx,dword ptr [eax+48]
 000600B9    mov         eax,ebx
 000600BB    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000600C1    call        @IsClass
 000600C6    test        al,al
>000600C8    je          000600E3
 000600CA    cmp         dword ptr [ebx+168],0
>000600D1    je          000600E3
 000600D3    lea         eax,[ebp-1C]
 000600D6    push        eax
 000600D7    mov         eax,dword ptr [ebx+168]
 000600DD    push        eax
 000600DE    call        user32.ClientToScreen
 000600E3    mov         eax,dword ptr [ebp-18]
 000600E6    sub         eax,dword ptr [ebp-10]
 000600E9    push        eax
 000600EA    mov         eax,dword ptr [ebp-1C]
 000600ED    sub         eax,dword ptr [ebp-14]
 000600F0    push        eax
 000600F1    lea         eax,[ebp-48]
 000600F4    push        eax
 000600F5    call        user32.OffsetRect
 000600FA    lea         ecx,[ebp-88]
 00060100    lea         edx,[ebp-0C]
 00060103    mov         eax,dword ptr [esi]
 00060105    mov         eax,dword ptr [eax+48]
 00060108    call        TControl.ScreenToClient
 0006010D    mov         eax,dword ptr [ebp-88]
 00060113    mov         dword ptr [ebp-38],eax
 00060116    mov         eax,dword ptr [ebp-84]
 0006011C    mov         dword ptr [ebp-34],eax
 0006011F    lea         edx,[ebp-90]
 00060125    mov         eax,dword ptr [esi]
 00060127    mov         eax,dword ptr [eax+48]
 0006012A    call        GetHint
 0006012F    mov         eax,dword ptr [ebp-90]
 00060135    lea         edx,[ebp-8C]
 0006013B    call        GetShortHint
 00060140    mov         edx,dword ptr [ebp-8C]
 00060146    lea         eax,[ebp-28]
 00060149    call        @LStrLAsg
 0006014E    xor         eax,eax
 00060150    mov         dword ptr [ebp-30],eax
 00060153    mov         eax,dword ptr [esi]
 00060155    mov         eax,dword ptr [eax+5C]
 00060158    mov         dword ptr [ebp-2C],eax
 0006015B    mov         eax,[000B49A8]
 00060160    mov         dword ptr [ebp-5C],eax
 00060163    xor         eax,eax
 00060165    mov         dword ptr [ebp-24],eax
 00060168    lea         eax,[ebp-60]
 0006016B    push        eax
 0006016C    mov         eax,dword ptr [esi]
 0006016E    mov         eax,dword ptr [eax+48]
 00060171    xor         ecx,ecx
 00060173    mov         edx,0B030
 00060178    call        TControl.Perform
 0006017D    test        eax,eax
 0006017F    sete        byte ptr [ebp-1D]
 00060183    cmp         byte ptr [ebp-1D],0
>00060187    je          000601AD
 00060189    mov         eax,dword ptr [esi]
 0006018B    cmp         word ptr [eax+11A],0
>00060193    je          000601AD
 00060195    lea         eax,[ebp-60]
 00060198    push        eax
 00060199    lea         ecx,[ebp-1D]
 0006019C    lea         edx,[ebp-28]
 0006019F    mov         ebx,dword ptr [esi]
 000601A1    mov         eax,dword ptr [ebx+11C]
 000601A7    call        dword ptr [ebx+118]
 000601AD    mov         eax,dword ptr [esi]
 000601AF    mov         dl,byte ptr [ebp-1D]
 000601B2    mov         byte ptr [eax+40],dl
 000601B5    mov         eax,dword ptr [esi]
 000601B7    cmp         byte ptr [eax+40],0
>000601BB    je          000602F0
 000601C1    cmp         dword ptr [ebp-28],0
>000601C5    je          000602F0
 000601CB    push        ebp
 000601CC    mov         eax,dword ptr [ebp-5C]
 000601CF    call        ValidateHintWindow
 000601D4    pop         ecx
 000601D5    mov         eax,dword ptr [esi]
 000601D7    mov         eax,dword ptr [eax+48]
 000601DA    mov         dl,byte ptr [eax+4F]
 000601DD    mov         eax,dword ptr [esi]
 000601DF    mov         eax,dword ptr [eax+6C]
 000601E2    mov         ecx,dword ptr [eax]
 000601E4    call        dword ptr [ecx+6C]
 000601E7    mov         eax,dword ptr [ebp-24]
 000601EA    push        eax
 000601EB    lea         eax,[ebp-70]
 000601EE    push        eax
 000601EF    mov         eax,dword ptr [esi]
 000601F1    mov         eax,dword ptr [eax+6C]
 000601F4    mov         ecx,dword ptr [ebp-28]
 000601F7    mov         edx,dword ptr [ebp-50]
 000601FA    mov         ebx,dword ptr [eax]
 000601FC    call        dword ptr [ebx+0C4]
 00060202    mov         eax,dword ptr [ebp-54]
 00060205    push        eax
 00060206    mov         eax,dword ptr [ebp-58]
 00060209    push        eax
 0006020A    lea         eax,[ebp-70]
 0006020D    push        eax
 0006020E    call        user32.OffsetRect
 00060213    mov         eax,dword ptr [esi]
 00060215    mov         eax,dword ptr [eax+6C]
 00060218    mov         bx,0FFCF
 0006021C    call        @CallDynaInst
 00060221    test        al,al
>00060223    je          00060257
 00060225    mov         eax,dword ptr [esi]
 00060227    mov         eax,dword ptr [eax+6C]
 0006022A    mov         eax,dword ptr [eax+1EC]
 00060230    mov         edx,dword ptr [ebp-28]
 00060233    call        TCanvas.TextWidth
 00060238    add         eax,5
 0006023B    sub         dword ptr [ebp-70],eax
 0006023E    mov         eax,dword ptr [esi]
 00060240    mov         eax,dword ptr [eax+6C]
 00060243    mov         eax,dword ptr [eax+1EC]
 00060249    mov         edx,dword ptr [ebp-28]
 0006024C    call        TCanvas.TextWidth
 00060251    add         eax,5
 00060254    sub         dword ptr [ebp-68],eax
 00060257    lea         ecx,[ebp-88]
 0006025D    lea         edx,[ebp-48]
 00060260    mov         eax,dword ptr [esi]
 00060262    mov         eax,dword ptr [eax+48]
 00060265    call        TControl.ClientToScreen
 0006026A    mov         eax,dword ptr [esi]
 0006026C    mov         edx,dword ptr [ebp-88]
 00060272    mov         dword ptr [eax+4C],edx
 00060275    mov         edx,dword ptr [ebp-84]
 0006027B    mov         dword ptr [eax+50],edx
 0006027E    lea         ecx,[ebp-88]
 00060284    lea         edx,[ebp-40]
 00060287    mov         eax,dword ptr [esi]
 00060289    mov         eax,dword ptr [eax+48]
 0006028C    call        TControl.ClientToScreen
 00060291    mov         eax,dword ptr [esi]
 00060293    mov         edx,dword ptr [ebp-88]
 00060299    mov         dword ptr [eax+54],edx
 0006029C    mov         edx,dword ptr [ebp-84]
 000602A2    mov         dword ptr [eax+58],edx
 000602A5    mov         eax,dword ptr [esi]
 000602A7    mov         eax,dword ptr [eax+6C]
 000602AA    mov         edx,dword ptr [ebp-4C]
 000602AD    call        TControl.SetColor
 000602B2    mov         eax,dword ptr [ebp-24]
 000602B5    push        eax
 000602B6    mov         eax,dword ptr [esi]
 000602B8    mov         eax,dword ptr [eax+6C]
 000602BB    mov         ecx,dword ptr [ebp-28]
 000602BE    lea         edx,[ebp-70]
 000602C1    mov         ebx,dword ptr [eax]
 000602C3    call        dword ptr [ebx+0C0]
 000602C9    call        HookHintHooks
 000602CE    mov         eax,dword ptr [ebp-30]
 000602D1    test        eax,eax
>000602D3    jle         000602E2
 000602D5    xor         ecx,ecx
 000602D7    mov         edx,eax
 000602D9    mov         eax,dword ptr [esi]
 000602DB    call        TApplication.StartHintTimer
>000602E0    jmp         0006030B
 000602E2    mov         cl,1
 000602E4    mov         edx,dword ptr [ebp-2C]
 000602E7    mov         eax,dword ptr [esi]
 000602E9    call        TApplication.StartHintTimer
>000602EE    jmp         0006030B
 000602F0    mov         eax,dword ptr [ebp-30]
 000602F3    test        eax,eax
>000602F5    jle         00060304
 000602F7    xor         ecx,ecx
 000602F9    mov         edx,eax
 000602FB    mov         eax,dword ptr [esi]
 000602FD    call        TApplication.StartHintTimer
>00060302    jmp         0006030B
 00060304    mov         eax,dword ptr [esi]
 00060306    call        TApplication.CancelHint
 0006030B    xor         eax,eax
 0006030D    pop         edx
 0006030E    pop         ecx
 0006030F    pop         ecx
 00060310    mov         dword ptr fs:[eax],edx
 00060313    push        6033E
 00060318    lea         eax,[ebp-90]
 0006031E    mov         edx,2
 00060323    call        @LStrArrayClr
 00060328    lea         eax,[ebp-60]
 0006032B    mov         edx,dword ptr ds:[56410];THintInfo
 00060331    call        @FinalizeRecord
 00060336    ret
>00060337    jmp         @HandleFinally
>0006033C    jmp         00060318
 0006033E    pop         edi
 0006033F    pop         esi
 00060340    pop         ebx
 00060341    mov         esp,ebp
 00060343    pop         ebp
 00060344    ret
*}
end;

//00060348
function TApplication.DispatchAction(Msg:Longint; Action:TBasicAction):Boolean;
begin
{*
 00060348    push        ebx
 00060349    push        esi
 0006034A    push        edi
 0006034B    push        ebp
 0006034C    add         esp,0FFFFFFF8
 0006034F    mov         ebx,ecx
 00060351    mov         dword ptr [esp],edx
 00060354    mov         esi,eax
 00060356    mov         eax,[000B67B4];Screen:TScreen
 0006035B    mov         edi,dword ptr [eax+60]
 0006035E    test        edi,edi
>00060360    je          00060373
 00060362    push        ebx
 00060363    xor         ecx,ecx
 00060365    mov         edx,dword ptr [esp+4]
 00060369    mov         eax,edi
 0006036B    call        TControl.Perform
 00060370    dec         eax
>00060371    je          00060393
 00060373    mov         ebp,dword ptr [esi+30]
 00060376    cmp         edi,ebp
>00060378    je          0006038F
 0006037A    test        ebp,ebp
>0006037C    je          0006038F
 0006037E    push        ebx
 0006037F    xor         ecx,ecx
 00060381    mov         edx,dword ptr [esp+4]
 00060385    mov         eax,ebp
 00060387    call        TControl.Perform
 0006038C    dec         eax
>0006038D    je          00060393
 0006038F    xor         eax,eax
>00060391    jmp         00060395
 00060393    mov         al,1
 00060395    mov         byte ptr [esp+4],al
 00060399    cmp         byte ptr [esp+4],0
>0006039E    jne         000603CC
 000603A0    mov         eax,ebx
 000603A2    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 000603A8    call        @IsClass
 000603AD    test        al,al
>000603AF    je          000603CC
 000603B1    cmp         byte ptr [ebx+51],0
>000603B5    je          000603CC
 000603B7    cmp         byte ptr [ebx+48],0
>000603BB    je          000603CC
 000603BD    cmp         word ptr [ebx+2E],0
 000603C2    setne       dl
 000603C5    mov         eax,ebx
 000603C7    call        TCustomAction.SetEnabled
 000603CC    mov         al,byte ptr [esp+4]
 000603D0    pop         ecx
 000603D1    pop         edx
 000603D2    pop         ebp
 000603D3    pop         edi
 000603D4    pop         esi
 000603D5    pop         ebx
 000603D6    ret
*}
end;

//000603D8
function TApplication.ExecuteAction(Action:TBasicAction):Boolean;
begin
{*
 000603D8    push        ebx
 000603D9    push        ecx
 000603DA    mov         byte ptr [esp],0
 000603DE    cmp         word ptr [eax+0BA],0
>000603E6    je          000603F8
 000603E8    mov         ecx,esp
 000603EA    mov         ebx,eax
 000603EC    mov         eax,dword ptr [ebx+0BC]
 000603F2    call        dword ptr [ebx+0B8]
 000603F8    mov         al,byte ptr [esp]
 000603FB    pop         edx
 000603FC    pop         ebx
 000603FD    ret
*}
end;

//00060400
function TApplication.UpdateAction(Action:TBasicAction):Boolean;
begin
{*
 00060400    push        ebx
 00060401    push        ecx
 00060402    mov         byte ptr [esp],0
 00060406    cmp         word ptr [eax+0C2],0
>0006040E    je          00060420
 00060410    mov         ecx,esp
 00060412    mov         ebx,eax
 00060414    mov         eax,dword ptr [ebx+0C4]
 0006041A    call        dword ptr [ebx+0C0]
 00060420    mov         al,byte ptr [esp]
 00060423    pop         edx
 00060424    pop         ebx
 00060425    ret
*}
end;

//00060428
procedure _NF__AF2;
begin
{*
 00060428    add         dword ptr [eax],eax
 0006042A    add         byte ptr [eax],al
 0006042C    test        al,49
 0006042E    or          eax,dword ptr [eax]
 00060430    and         bh,dh
 00060432    add         eax,dword ptr [eax]
 00060434    add         byte ptr [eax],al
 00060436    add         byte ptr [eax],al
*}
end;

Initialization
//0006048C
{*
 0006048C    sub         dword ptr ds:[0B67B8],1
>00060493    jae         000604AA
 00060495    mov         eax,60428;_NF__AF2
 0006049A    call        @InitImports
 0006049F    mov         eax,[000B5718]
 000604A4    mov         dword ptr [eax],567CC;FindGlobalComponent:TComponent
 000604AA    ret
*}
Finalization
//00060438
{*
 00060438    push        ebp
 00060439    mov         ebp,esp
 0006043B    xor         eax,eax
 0006043D    push        ebp
 0006043E    push        60481
 00060443    push        dword ptr fs:[eax]
 00060446    mov         dword ptr fs:[eax],esp
 00060449    inc         dword ptr ds:[0B67B8]
>0006044F    jne         00060473
 00060451    cmp         dword ptr ds:[0B67B0],0;Application:TApplication
>00060458    je          0006045F
 0006045A    call        DoneApplication
 0006045F    cmp         dword ptr ds:[0B67E8],0
>00060466    je          00060473
 00060468    mov         eax,[000B67E8]
 0006046D    push        eax
 0006046E    call        kernel32.CloseHandle
 00060473    xor         eax,eax
 00060475    pop         edx
 00060476    pop         ecx
 00060477    pop         ecx
 00060478    mov         dword ptr fs:[eax],edx
 0006047B    push        60488
 00060480    ret
>00060481    jmp         @HandleFinally
>00060486    jmp         00060480
 00060488    pop         ebp
 00060489    ret
*}
end.