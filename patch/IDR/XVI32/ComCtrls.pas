//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ComCtrls;

interface

uses
  SysUtils, Classes, Graphics, ImgList, ComCtrls, Controls;

type
  TTabChangingEvent = procedure(Sender:TObject; var AllowChange:Boolean) of object;;
  TTabPosition = (tpTop, tpBottom, tpLeft, tpRight);
  TTabStyle = (tsTabs, tsButtons, tsFlatButtons);
  TDrawTabEvent = procedure(Control:TCustomTabControl; TabIndex:Integer; const Rect:TRect; Active:Boolean) of object;;
  TTabGetImageEvent = procedure(Sender:TObject; TabIndex:Integer; var ImageIndex:Integer) of object;;
  TCustomTabControl = class(TWinControl)
  public
    FCanvas:TCanvas;//f1EC
    FHotTrack:Boolean;//f1F0
    FImageChangeLink:TChangeLink;//f1F4
    FImages:TCustomImageList;//f1F8
    FMultiLine:Boolean;//f1FC
    FMultiSelect:Boolean;//f1FD
    FOwnerDraw:Boolean;//f1FE
    FRaggedRight:Boolean;//f1FF
    FSaveTabIndex:Integer;//f200
    FSaveTabs:TStringList;//f204
    FScrollOpposite:Boolean;//f208
    FStyle:TTabStyle;//f209
    FTabPosition:TTabPosition;//f20A
    FTabs:TStrings;//f20C
    FTabSize:TSmallPoint;//f210
    FTabSize:Smallint;//f212
    FUpdating:Boolean;//f214
    FOnChange:TNotifyEvent;//f218
    FOnChanging:TTabChangingEvent;//f220
    FOnDrawTab:TDrawTabEvent;//f228
    FOnGetImageIndex:TTabGetImageEvent;//f230
    destructor Destroy; virtual;//00069F3C
    procedure Loaded; virtual;//vC//0006A25C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0006A28C
    constructor Create(AOwner:TComponent); virtual;//v2C//00069E7C
    procedure AdjustClientRect(var Rect:TRect); virtual;//v88//0006AAD0
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00069FDC
    procedure CreateWnd; virtual;//v9C//0006A0E0
    procedure DestroyWnd; virtual;//vA4//0006A164
    //function vB8:?; virtual;//vB8//00069FB8
    procedure DrawTab(TabIndex:Integer; const Rect:TRect; Active:Boolean); virtual;//vBC//0006A1B0
    function GetImageIndex(TabIndex:Integer):Integer; virtual;//vC0//0006A218
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//0006A8D0
    procedure WMSize(var Message:TMessage); message WM_SIZE;//0006A938
    procedure CMDialogChar(Message:TWMKey); message CM_DIALOGCHAR;//0006A9F8
    procedure CMFontChanged(var Message:void ); message CM_FONTCHANGED;//0006A958
    procedure CMTabStopChanged(var Message:TMessage); message CM_TABSTOPCHANGED;//0006A9A8
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//0006A84C
    procedure CNNotify(var Message:TWMNotify); dynamic;//0006A9B4
    procedure Change; dynamic;//00069FBC
    procedure CanChange; dynamic;//00069F90
    function GetDisplayRect:TRect;//0006A1EC
    function GetTabIndex:Integer;//0006A240
    procedure SetImages(Value:TCustomImageList);//0006A2BC
    procedure ImageListChange(Sender:TObject);//0006A32C
    function InternalSetMultiLine(Value:Boolean):Boolean;//0006A34C
    procedure SetMultiLine(Value:Boolean);//0006A3DC
    procedure SetOwnerDraw(Value:Boolean);//0006A3FC
    procedure SetRaggedRight(Value:Boolean);//0006A410
    procedure SetScrollOpposite(Value:Boolean);//0006A42C
    procedure SetStyle(Value:TTabStyle);//0006A44C
    procedure SetTabHeight(Value:Smallint);//0006A4C0
    procedure SetTabIndex(Value:Integer);//0006A56C
    procedure SetTabPosition(Value:TTabPosition);//0006A58C
    procedure SetTabWidth(Value:Smallint);//0006A624
    procedure TabsChanged;//0006A6E8
    procedure UpdateTabSize;//0006A728
    procedure UpdateTabImages;//0006A750
    procedure SetHotTrack(Value:Boolean);//0006F1E4
  end;
  TTabSheet = class(TWinControl)
  public
    ImageIndex:Integer;//f1EC
    FPageControl:TPageControl;//f1F0
    TabVisible:Boolean;//f1F4
    FTabShowing:Boolean;//f1F5
    OnHide:TNotifyEvent;//f1F8
    OnShow:TNotifyEvent;//f200
    destructor Destroy; virtual;//0006AB64
    procedure ReadState(Reader:TReader); virtual;//v14//0006AC6C
    constructor Create(AOwner:TComponent); virtual;//v2C//0006AB04
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0006AC5C
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//0006AE4C
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//0006AE64
    procedure DoShow; dynamic;//0006ABD0
    procedure DoHide; dynamic;//0006ABB0
    function GetPageIndex:Integer;//0006ABF0
    function GetTabIndex:Integer;//0006AC0C
    procedure SetImageIndex(Value:Integer);//0006ACA0
    procedure SetPageControl(APageControl:TPageControl);//0006ACC8
    procedure SetPageIndex(Value:Integer);//0006ACFC
    procedure SetTabShowing(Value:Boolean);//0006ADD0
    procedure SetTabVisible(Value:Boolean);//0006AE14
    procedure UpdateTabShowing;//0006AE28
  end;
  TPageControl = class(TCustomTabControl)
  public
    FPages:TList;//f238
    ActivePage:TTabSheet;//f23C
    FNewDockSheet:TTabSheet;//f240
    FUndockingPage:TTabSheet;//f244
    destructor Destroy; virtual;//0006AF60
    constructor Create(AOwner:TComponent); virtual;//v2C//0006AF0C
    procedure ShowControl(AControl:TControl); virtual;//vB0//0006B550
    function CanShowTab(TabIndex:Integer):Boolean; virtual;//vB8//0006AFC0
    function GetImageIndex(TabIndex:Integer):Integer; virtual;//vC0//0006B2CC
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//0006B9CC
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//0006BA04
    procedure CMDialogKey(Message:TWMKey); message CM_DIALOGKEY;//0006B678
    procedure CMDesignHitTest(var Message:TCMDesignHitTest); message CM_DESIGNHITTEST;//0006B61C
    procedure CMDockClient(var Message:TCMDockClient); message CM_DOCKCLIENT;//0006B6E4
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//0006B908
    //procedure sub_0006B82C(?:?); dynamic;//0006B82C
    procedure Change; dynamic;//0006AFDC
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//0006B370
    procedure DoRemoveDockClient(Client:TControl); dynamic;//0006B1D4
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//0006B17C
    procedure DoAddDockClient(Client:TControl; const ARect:TRect); dynamic;//0006B168
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//0006B544
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//0006B28C
    procedure ChangeActivePage(Page:TTabSheet);//0006B014
    procedure DeleteTab(Page:TTabSheet; Index:Integer);//0006B114
    function FindNextPage(CurPage:TTabSheet; GoForward:Boolean; CheckTabVisible:Boolean):TTabSheet;//0006B204
    function GetPageFromDockClient(Client:TControl):TTabSheet;//0006B2FC
    function GetPage(Index:Integer):TTabSheet;//0006B34C
    function GetPageCount:Integer;//0006B364
    procedure InsertPage(Page:TTabSheet);//0006B3B4
    procedure InsertTab(Page:TTabSheet);//0006B3D8
    procedure MoveTab(CurIndex:Integer; NewIndex:Integer);//0006B440
    procedure RemovePage(Page:TTabSheet);//0006B458
    procedure SelectNextPage(GoForward:Boolean);//0006B4A8
    procedure SetActivePage(Page:TTabSheet);//0006B4FC
    procedure UpdateTab(Page:TTabSheet);//0006B584
    procedure UpdateActivePage;//0006B5E4
    function GetDockClientFromMousePos(MousePos:TPoint):TControl;//0006B934
  end;
  TStatusPanelStyle = (psText, psOwnerDraw);
  TStatusPanelBevel = (pbNone, pbLowered, pbRaised);
  TStatusPanel = class(TCollectionItem)
  public
    Text:String;//fC
    Width:Integer;//f10
    Alignment:TAlignment;//f14
    Bevel:TStatusPanelBevel;//f15
    BiDiMode:TBiDiMode;//f16
    ParentBiDiMode:Boolean;//f17
    Style:TStatusPanelStyle;//f18
    FUpdateNeeded:Boolean;//f19
    procedure Assign(Source:TPersistent); virtual;//v8//0006BA8C
    constructor Create(Collection:TCollection); virtual;//v18//0006BA40
    procedure SetBiDiMode(Value:TBiDiMode);//0006BAE8
    procedure IsStoredBiDiMode(Value:TBiDiMode);//0006BAFC
    procedure SetParentBiDiMode(Value:Boolean);//0006BB04
    procedure ParentBiDiModeChanged;//0006BB14
    function UseRightToLeftReading:Boolean;//0006BB4C
    function UseRightToLeftAlignment:Boolean;//0006BB64
    procedure SetAlignment(Value:TAlignment);//0006BBA0
    procedure SetBevel(Value:TStatusPanelBevel);//0006BBB0
    procedure SetStyle(Value:TStatusPanelStyle);//0006BBC0
    procedure SetText(const Value:AnsiString);//0006BBD0
    procedure SetWidth(Value:Integer);//0006BBF8
  end;
  TStatusPanels = class(TCollection)
  public
    .FStatusBar:TStatusBar;//f18
    procedure Update(Item:TCollectionItem); virtual;//v10//0006BC70
    procedure sub_0002114C; dynamic;//0006BC6C
    constructor Create(StatusBar:TStatusBar);//0006BC08
  end;
  TDrawPanelEvent = procedure(StatusBar:TStatusBar; Panel:TStatusPanel; const Rect:TRect) of object;;
  TStatusBar = class(TWinControl)
  public
    Panels:TStatusPanels;//f1EC
    FCanvas:TCanvas;//f1F0
    SimpleText:String;//f1F4
    SimplePanel:Boolean;//f1F8
    SizeGrip:Boolean;//f1F9
    UseSystemFont:Boolean;//f1FA
    AutoHint:Boolean;//f1FB
    OnDrawPanel:TDrawPanelEvent;//f1FC
    OnHint:TNotifyEvent;//f204
    constructor Create(AOwner:TComponent); virtual;//v2C//0006BCA0
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0006BD98
    procedure CreateWnd; virtual;//v9C//0006BE1C
    function DoHint:Boolean; virtual;//vB8//0006BE9C
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//0006C664
    procedure WMGetTextLength(var Message:TWMGetTextLength); message WM_GETTEXTLENGTH;//0006C62C
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//0006C644
    procedure CMParentFontChanged(var Message:TMessage); message CM_PARENTFONTCHANGED;//0006C6E4
    procedure CMWinIniChange(var Message:TMessage); message CM_WININICHANGE;//0006C568
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//0006C030
    //procedure sub_0006C590(?:?); dynamic;//0006C590
    procedure DrawPanel(Panel:TStatusPanel; const Rect:TRect); dynamic;//0006BEC0
    procedure FlipChildren(AllLevels:Boolean); dynamic;//0006C0A8
    procedure ExecuteAction(Action:TBasicAction); dynamic;//0006C708
    procedure SetSimplePanel(Value:Boolean);//0006BEFC
    procedure DoRightToLeftAlignment(var Str:AnsiString; AAlignment:TAlignment; ARTLAlignment:Boolean);//0006BF38
    procedure UpdateSimpleText;//0006BFA0
    procedure SetSimpleText(const Value:AnsiString);//0006C004
    procedure SetSizeGrip(Value:Boolean);//0006C268
    procedure SyncToSystemFont;//0006C27C
    procedure UpdatePanel(Index:Integer; Repaint:Boolean);//0006C2C8
    procedure UpdatePanels(UpdateRects:Boolean; UpdateText:Boolean);//0006C450
    function IsFontStored(Value:TFont):Boolean;//0006C684
    procedure SetUseSystemFont(const Value:Boolean);//0006C6A0
  end;
  TSortType = (stNone, stData, stText, stBoth);
  TProgressBarOrientation = (pbHorizontal, pbVertical);
  TProgressBar = class(TWinControl)
  public
    F32BitMode:Boolean;//f1EC
    FMin:Integer;//f1F0
    FMax:Integer;//f1F4
    FPosition:Integer;//f1F8
    Step:Integer;//f1FC
    Orientation:TProgressBarOrientation;//f200
    Smooth:Boolean;//f201
    constructor Create(AOwner:TComponent); virtual;//v2C//0006C7F8
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0006C884
    procedure CreateWnd; virtual;//v9C//0006C8F0
    function GetMin:Integer;//0006C978
    function GetMax:Integer;//0006C9B0
    function GetPosition:Integer;//0006C9E8
    procedure SetParams(AMin:Integer; AMax:Integer);//0006CA38
    procedure SetMin(Value:Integer);//0006CB7C
    procedure SetMax(Value:Integer);//0006CB88
    procedure SetPosition(Value:Integer);//0006CB98
    procedure SetStep(Value:Integer);//0006CBE4
    procedure SetSmooth(Value:Boolean);//0006CC34
  end;
  TConversion = class(TObject)
  public
    function ConvertReadStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer; virtual;//v0//0006CC48
    function ConvertWriteStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer; virtual;//v4//0006CC5C
  end;
  TConversionFormat = TConversionFormat = record//size=C
f4:String;//f4
end;;
  TListColumn = class(TCollectionItem)
  public
    Alignment:TAlignment;//fC
    AutoSize:Boolean;//fD
    Caption:String;//f10
    MaxWidth:TWidth;//f14
    MinWidth:TWidth;//f18
    ImageIndex:Integer;//f1C
    FPrivateWidth:TWidth;//f20
    FWidth:TWidth;//f24
    destructor Destroy; virtual;//0006CD04
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0006CD54
    procedure Assign(Source:TPersistent); virtual;//v8//0006D000
    function GetDisplayName:AnsiString; virtual;//vC//0006D074
    constructor Create(Collection:TCollection); virtual;//v18//0006CC70
    procedure ReadData(Reader:TReader);//0006CD98
    procedure WriteData(Writer:TWriter);//0006CDC0
    procedure DoChange;//0006CED4
    procedure SetCaption(const Value:AnsiString);//0006CF30
    function GetWidth:TWidth;//0006CF58
    procedure IsStoredWidth(Value:TWidth);//0006CF5C
    procedure SetWidth(Value:TWidth);//0006CF64
    procedure SetAlignment(Value:TAlignment);//0006CF74
    procedure SetAutoSize(Value:Boolean);//0006CFA4
    procedure SetImageIndex(Value:Integer);//0006CFD0
    procedure SetMinWidth(Value:TWidth);//0006CFF0
  end;
  TListColumns = class(TCollection)
  public
    .FOwner:TCustomListView;//f18
    procedure sub_0002114C; dynamic;//0006D0F0
    constructor Create(AOwner:TCustomListView);//0006D098
  end;
  TListItem = class(TPersistent)
  public
    FOwner:TListItems;//f4
    FSubItems:TStrings;//f8
    FData:Pointer;//fC
    FImageIndex:Integer;//f10
    FIndent:Integer;//f14
    FIndex:Integer;//f18
    FOverlayIndex:Integer;//f1C
    FStateIndex:Integer;//f20
    FCaption:String;//f24
    FDeleting:Boolean;//f28
    FProcessedDeleting:Boolean;//f29
    FChecked:Boolean;//f2A
    destructor Destroy; virtual;//0006D3B0
    procedure Assign(Source:TPersistent); virtual;//v8//0006D868
    constructor Create(AOwner:TListItems);//0006D360
    function GetListView:TCustomListView;//0006D41C
    procedure Delete;//0006D424
    function GetHandle:HWND;//0006D448
    function GetChecked:Boolean;//0006D45C
    procedure SetChecked(Value:Boolean);//0006D4C0
    procedure Update;//0006D528
    procedure SetCaption(const Value:AnsiString);//0006D544
    procedure SetData(Value:Pointer);//0006D5E4
    function GetState(Index:Integer):Boolean;//0006D610
    procedure SetState(Index:Integer; State:Boolean);//0006D678
    procedure SetImage(Index:Integer; Value:Integer);//0006D6E8
    procedure SetIndent(Value:Integer);//0006D7FC
    function IsEqual(Item:TListItem):Boolean;//0006D900
    procedure SetSubItems(Value:TStrings);//0006D928
    function GetIndex:Integer;//0006D93C
    function DisplayRect(Code:TDisplayCode):TRect;//0006D958
  end;
  TListItems = class(TPersistent)
  public
    FOwner:TCustomListView;//f4
    FUpdateCount:Integer;//f8
    FNoRedraw:Boolean;//fC
    destructor Destroy; virtual;//0006D9C4
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0006DE08
    procedure Assign(Source:TPersistent); virtual;//v8//0006DD18
    constructor Create(AOwner:TCustomListView);//0006D988
    function Add:TListItem;//0006D9F0
    function GetCount:Integer;//0006DA30
    function GetHandle:HWND;//0006DA54
    function GetItem(Index:Integer):TListItem;//0006DA60
    function IndexOf(Value:TListItem):Integer;//0006DAE0
    procedure Clear;//0006DB08
    procedure BeginUpdate;//0006DB28
    procedure SetUpdateState(Updating:Boolean);//0006DB40
    procedure EndUpdate;//0006DD04
    procedure ReadData(Stream:TStream);//0006DE60
    procedure WriteData(Stream:TStream);//0006DFF8
    function CreateItem(Index:Integer; ListItem:TListItem):TLVItem;//0006E238
  end;
  TIconArrangement = (iaTop, iaLeft);
  TIconOptions = class(TPersistent)
  public
    FListView:TCustomListView;//f4
    Arrangement:TIconArrangement;//f8
    AutoArrange:Boolean;//f9
    WrapText:Boolean;//fA
    constructor Create(AOwner:TCustomListView);//0006E25C
    procedure SetArrangement(Value:TIconArrangement);//0006E30C
    procedure SetAutoArrange(Value:Boolean);//0006E320
    procedure SetWrapText(Value:Boolean);//0006E334
  end;
  TViewStyle = (vsIcon, vsSmallIcon, vsList, vsReport);
  TListHotTrackStyle = (htHandPoint, htUnderlineCold, htUnderlineHot);
  TListHotTrackStyles = set of TListHotTrackStyle;
  TLVDeletedEvent = procedure(Sender:TObject; Item:TListItem) of object;;
  TLVEditingEvent = procedure(Sender:TObject; Item:TListItem; var AllowEdit:Boolean) of object;;
  TLVEditedEvent = procedure(Sender:TObject; Item:TListItem; var S:String) of object;;
  TLVChangeEvent = procedure(Sender:TObject; Item:TListItem; Change:TItemChange) of object;;
  TLVChangingEvent = procedure(Sender:TObject; Item:TListItem; Change:TItemChange; var AllowChange:Boolean) of object;;
  TLVColumnClickEvent = procedure(Sender:TObject; Column:TListColumn) of object;;
  TLVCompareEvent = procedure(Sender:TObject; Item1:TListItem; Item2:TListItem; Data:Integer; var Compare:Integer) of object;;
  TLVNotifyEvent = procedure(Sender:TObject; Item:TListItem) of object;;
  TLVSelectItemEvent = procedure(Sender:TObject; Item:TListItem; Selected:Boolean) of object;;
  TLVDrawItemEvent = procedure(Sender:TCustomListView; Item:TListItem; Rect:TRect; State:TOwnerDrawState) of object;;
  TLVCustomDrawEvent = procedure(Sender:TCustomListView; const ARect:TRect; var DefaultDraw:Boolean) of object;;
  TLVCustomDrawItemEvent = procedure(Sender:TCustomListView; Item:TListItem; State:TCustomDrawState; var DefaultDraw:Boolean) of object;;
  TLVCustomDrawSubItemEvent = procedure(Sender:TCustomListView; Item:TListItem; SubItem:Integer; State:TCustomDrawState; var DefaultDraw:Boolean) of object;;
  TLVOwnerDataEvent = procedure(Sender:TObject; Item:TListItem) of object;;
  TLVOwnerDataFindEvent = procedure(Sender:TObject; Find:TItemFind; const FindString:String; const FindPosition:TPoint; FindData:Pointer; StartIndex:Integer; Direction:TSearchDirection; Wrap:Boolean; var Index:Integer) of object;;
  TLVOwnerDataHintEvent = procedure(Sender:TObject; StartIndex:Integer; EndIndex:Integer) of object;;
  TLVOwnerDataStateChangeEvent = procedure(Sender:TObject; StartIndex:Integer; EndIndex:Integer; OldState:TItemStates; NewState:TItemStates) of object;;
  TCustomListView = class(TWinControl)
  public
    FCanvas:TCanvas;//f1EC
    FBorderStyle:TBorderStyle;//f1F0
    FViewStyle:TViewStyle;//f1F1
    FReadOnly:Boolean;//f1F2
    FLargeImages:TCustomImageList;//f1F4
    FSmallImages:TCustomImageList;//f1F8
    FStateImages:TCustomImageList;//f1FC
    FDragImage:TDragImageList;//f200
    FMultiSelect:Boolean;//f204
    FSortType:TSortType;//f205
    FColumnClick:Boolean;//f206
    FShowColumnHeaders:Boolean;//f207
    FListItems:TListItems;//f208
    FClicked:Boolean;//f20C
    FRClicked:Boolean;//f20D
    FIconOptions:TIconOptions;//f210
    FHideSelection:Boolean;//f214
    FListColumns:TListColumns;//f218
    FMemStream:TMemoryStream;//f21C
    FOwnerData:Boolean;//f220
    FOwnerDraw:Boolean;//f221
    FColStream:TMemoryStream;//f224
    FCheckStream:TMemoryStream;//f228
    FEditInstance:Pointer;//f22C
    FDefEditProc:Pointer;//f230
    FEditHandle:HWND;//f234
    FHeaderInstance:Pointer;//f238
    FDefHeaderProc:Pointer;//f23C
    FHeaderHandle:HWND;//f240
    FAllocBy:Integer;//f244
    FDragIndex:Integer;//f248
    FLastDropTarget:TListItem;//f24C
    FCheckboxes:Boolean;//f250
    FFlatScrollBars:Boolean;//f251
    FFullDrag:Boolean;//f252
    FGridLines:Boolean;//f253
    FHotTrack:Boolean;//f254
    FHotTrackStyles:TListHotTrackStyles;//f255
    FRowSelect:Boolean;//f256
    FLargeChangeLink:TChangeLink;//f258
    FSmallChangeLink:TChangeLink;//f25C
    FStateChangeLink:TChangeLink;//f260
    FSavedSort:TSortType;//f264
    FReading:Boolean;//f265
    FCanvasChanged:Boolean;//f266
    FTempItem:TListItem;//f268
    FOnChange:TLVChangeEvent;//f26C
    FOnChanging:TLVChangingEvent;//f274
    FOnColumnClick:TLVColumnClickEvent;//f27C
    FOnCustomDraw:TLVCustomDrawEvent;//f284
    FOnCustomDrawItem:TLVCustomDrawItemEvent;//f28C
    FOnCustomDrawSubItem:TLVCustomDrawSubItemEvent;//f294
    FOnData:TLVOwnerDataEvent;//f29C
    FOnDataFind:TLVOwnerDataFindEvent;//f2A4
    FOnDataHint:TLVOwnerDataHintEvent;//f2AC
    FOnDataStateChange:TLVOwnerDataStateChangeEvent;//f2B4
    FOnDeletion:TLVDeletedEvent;//f2BC
    FOnDrawItem:TLVDrawItemEvent;//f2C4
    FOnEditing:TLVEditingEvent;//f2CC
    FOnEdited:TLVEditedEvent;//f2D4
    FOnGetImageIndex:TLVNotifyEvent;//f2DC
    FOnInsert:TLVDeletedEvent;//f2E4
    FOnCompare:TLVCompareEvent;//f2EC
    FOnSelectItem:TLVSelectItemEvent;//f2F4
    f2F6:word;//f2F6
    f2F8:dword;//f2F8
    destructor Destroy; virtual;//0006E56C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0006EB74
    constructor Create(AOwner:TComponent); virtual;//v2C//0006E3B4
    function GetDragImages:TDragImageList; virtual;//v4C//000700B0
    procedure WndProc(var Message:TMessage); virtual;//v70//000700CC
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0006E65C
    procedure CreateWnd; virtual;//v9C//0006E8BC
    procedure DestroyWnd; virtual;//vA4//0006EA7C
    function CreateListItem:TListItem; virtual;//vB8//0006F5B8
    function CustomDraw(const ARect:TRect; Stage:TCustomDrawStage):Boolean; virtual;//vBC//00070D18
    function CustomDrawItem(Item:TListItem; State:TCustomDrawState; Stage:TCustomDrawStage):Boolean; virtual;//vC0//00070D44
    function CustomDrawSubItem(Item:TListItem; SubItem:Integer; State:TCustomDrawState; Stage:TCustomDrawStage):Boolean; virtual;//vC4//00070D80
    procedure DrawItem(Item:TListItem; Rect:TRect; State:TOwnerDrawState); virtual;//vC8//00070DB8
    function OwnerDataFetch(Item:TListItem; Request:TItemRequest):Boolean; virtual;//vCC//0006F4E8
    function OwnerDataFind(Find:TItemFind; const FindString:AnsiString; const FindPosition:TPoint; FindData:Pointer; StartIndex:Integer; Direction:TSearchDirection; Wrap:Boolean):Integer; virtual;//vD0//0006F510
    function OwnerDataHint(StartIndex:Integer; EndIndex:Integer):Boolean; virtual;//vD4//0006F55C
    function OwnerDataStateChange(StartIndex:Integer; EndIndex:Integer; OldState:TItemStates; NewState:TItemStates):Boolean; virtual;//vD8//0006F584
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//00070BF4
    procedure WMNotify(Message:TWMNotify); message WM_NOTIFY;//0006F300
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//00070904
    procedure WMRButtonDown(var Message:TWMRButtonDown); message WM_RBUTTONDOWN;//000708A4
    procedure WMParentNotify(var Message:TWMParentNotify); message WM_PARENTNOTIFY;//0006F498
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//0006F2B8
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//0006F380
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0006F2DC
    procedure CMDrag(var Message:TCMDrag); message CM_DRAG;//00070240
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//00070C28
    //procedure sub_0006F7CC(?:?); dynamic;//0006F7CC
    procedure InsertItem(Item:TListItem); dynamic;//0006FF2C
    procedure Edit(const Item:TLVItem); dynamic;//00070030
    procedure Delete(Item:TListItem); dynamic;//0006FFCC
    procedure ColClick(Column:TListColumn); dynamic;//0006FF0C
    procedure Change(Item:TListItem; Change:Integer); dynamic;//0006FF94
    procedure CanEdit(Item:TListItem); dynamic;//00070004
    procedure CanChange(Item:TListItem; Change:Integer); dynamic;//0006FF4C
    procedure DoStartDrag(var DragObject:TDragObject); dynamic;//0007014C
    procedure DoEndDrag(Target:TObject; X:Integer; Y:Integer); dynamic;//00070220
    procedure SetBorderStyle(Value:TBorderStyle);//0006A278
    procedure SetImageList(Value:HIMAGELIST; Flags:Integer);//0006EAD8
    procedure ImageListChange(Sender:TObject);//0006EB00
    procedure HeaderWndProc(var Message:TMessage);//0006ECF0
    procedure EditWndProc(var Message:TMessage);//0006EDE8
    procedure UpdateItems(FirstIndex:Integer; LastIndex:Integer);//0006EEE8
    procedure ResetExStyles;//0006EF08
    procedure RestoreChecks;//0006EFF0
    procedure SaveChecks;//0006F06C
    procedure SetCheckboxes(Value:Boolean);//0006F0EC
    procedure SetGridLines(Value:Boolean);//0006F118
    procedure SetHotTrack(Value:Boolean);//0006F12C
    procedure SetHotTrackStyles(Value:TListHotTrackStyles);//0006F140
    procedure SetOwnerDraw(Value:Boolean);//0006F194
    procedure SetRowSelect(Value:Boolean);//0006F1A8
    procedure SetFlatScrollBars(Value:Boolean);//0006F1BC
    procedure SetFullDrag(Value:Boolean);//0006F1D0
    procedure SetColumnClick(Value:Boolean);//0006F1F8
    procedure SetMultiSelect(Value:Boolean);//0006F20C
    procedure SetColumnHeaders(Value:Boolean);//0006F220
    procedure SetTextColor(Value:TColor);//0006F234
    procedure SetTextBkColor(Value:TColor);//0006F254
    procedure SetAllocBy(Value:Integer);//0006F288
    function ColumnsShowing:Boolean;//0006F368
    function ValidHeaderHandle:Boolean;//0006F374
    procedure SetHideSelection(Value:Boolean);//0006F3C0
    procedure SetReadOnly(Value:Boolean);//0006F3D4
    procedure SetIconOptions(Value:TIconOptions);//0006F3E8
    procedure SetViewStyle(Value:TViewStyle);//0006F414
    function GetItem(Value:TLVItem):TListItem;//0006F618
    function GetSelCount:Integer;//0006F748
    procedure DoDragOver(Source:TDragObject; X:Integer; Y:Integer; CanDrop:Boolean);//000702D0
    procedure SetItems(Value:TListItems);//00070358
    procedure SetListColumns(Value:TListColumns);//00070364
    function AlphaSort:Boolean;//00070370
    procedure SetSortType(Value:TSortType);//000703A0
    procedure SetLargeImages(Value:TCustomImageList);//000703D8
    procedure SetSmallImages(Value:TCustomImageList);//00070440
    procedure SetStateImages(Value:TCustomImageList);//000704AC
    function GetColumnFromIndex(Index:Integer):TListColumn;//00070558
    function GetDropTarget:TListItem;//00070564
    procedure SetDropTarget(Value:TListItem);//00070588
    procedure GetImageIndex(Item:TListItem);//000705CC
    function GetNextItem(StartItem:TListItem; Direction:TSearchDirection; States:TItemStates):TListItem;//000705EC
    function GetItemAt(X:Integer; Y:Integer):TListItem;//000706C0
    procedure Arrange(Code:TListArrangement);//00070724
    procedure DoAutoSize;//00070A60
    procedure CanvasChanged(Sender:TObject);//00070CD8
    function IsCustomDrawn(Target:TCustomDrawTarget; Stage:TCustomDrawStage):Boolean;//00070CE0
  end;
  TListView = class(TCustomListView)
    procedure SetOwnerData(Value:Boolean);//0006F168
  end;
  TTabStrings = class(TStrings)
  public
    FTabControl:TCustomTabControl;//fC
    function Get(Index:Integer):AnsiString; virtual;//vC//00069A24
    function GetCount:Integer; virtual;//v14//00069B1C
    function GetObject(Index:Integer):TObject; virtual;//v18//00069B38
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//00069BD8
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//00069CB8
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//00069E38
    procedure Clear; virtual;//v40//00069918
    procedure Delete(Index:Integer); virtual;//v44//00069988
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//00069D58
  end;
  TSubItems = class(TStringList)
  public
    FOwner:TListItem;//f2C
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//0006D30C
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//0006D354
    function Add(const S:AnsiString):Integer; virtual;//v34//0006D258
    procedure Delete(Index:Integer); virtual;//v44//0006D274
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//0006D2D8
    constructor Create(AOwner:TListItem);//0006D21C
    function GetHandle:HWND;//0006D288
    procedure SetColumnWidth(Index:Integer);//0006D294
    procedure RefreshItem(Index:Integer);//0006D328
  end;
  _DynArr_34_75 = array of ?;
//elSize = 4
//varType equivalent: varInteger;
    function InitCommonControl(CC:Integer):Boolean;//0006979C
    procedure SetComCtlStyle(Ctl:TWinControl; Value:Integer; UseStyle:Boolean);//000697C8
    procedure TabControlError(const S:AnsiString);//00069900
    procedure Clear;//00069918
    procedure Delete(Index:Integer);//00069988
    function Get(Index:Integer):AnsiString;//00069A24
    function GetCount:Integer;//00069B1C
    function GetObject(Index:Integer):TObject;//00069B38
    procedure Put(Index:Integer; const S:AnsiString);//00069BD8
    procedure PutObject(Index:Integer; AObject:TObject);//00069CB8
    procedure Insert(Index:Integer; const S:AnsiString);//00069D58
    procedure SetUpdateState(Updating:Boolean);//00069E38
    constructor Create(AOwner:TComponent);//00069E7C
    destructor Destroy;//00069F3C
    procedure CanChange;//00069F90
    //function sub_00069FB8:?;//00069FB8
    procedure Change;//00069FBC
    procedure CreateParams(var Params:TCreateParams);//00069FDC
    procedure CreateWnd;//0006A0E0
    procedure DestroyWnd;//0006A164
    procedure DrawTab(TabIndex:Integer; const Rect:TRect; Active:Boolean);//0006A1B0
    function GetImageIndex(TabIndex:Integer):Integer;//0006A218
    procedure Loaded;//0006A25C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0006A28C
    procedure CNDrawItem(var Message:TWMDrawItem);//0006A84C
    procedure WMDestroy(var Message:TWMDestroy);//0006A8D0
    procedure WMNotifyFormat(var Message:TMessage);//0006A914
    procedure WMSize(var Message:TMessage);//0006A938
    procedure CMFontChanged(var Message:void );//0006A958
    procedure CMSysColorChange(var Message:TMessage);//0006A980
    procedure CMTabStopChanged(var Message:TMessage);//0006A9A8
    procedure CNNotify(var Message:TWMNotify);//0006A9B4
    procedure CMDialogChar(Message:TWMKey);//0006A9F8
    procedure AdjustClientRect(var Rect:TRect);//0006AAD0
    constructor Create(AOwner:TComponent);//0006AB04
    destructor Destroy;//0006AB64
    procedure DoHide;//0006ABB0
    procedure DoShow;//0006ABD0
    procedure CreateParams(var Params:TCreateParams);//0006AC5C
    procedure ReadState(Reader:TReader);//0006AC6C
    procedure CMTextChanged(var Message:TMessage);//0006AE4C
    procedure CMShowingChanged(var Message:TMessage);//0006AE64
    constructor Create(AOwner:TComponent);//0006AF0C
    destructor Destroy;//0006AF60
    function CanShowTab(TabIndex:Integer):Boolean;//0006AFC0
    procedure Change;//0006AFDC
    procedure DoAddDockClient(Client:TControl; const ARect:TRect);//0006B168
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//0006B17C
    procedure DoRemoveDockClient(Client:TControl);//0006B1D4
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//0006B28C
    function GetImageIndex(TabIndex:Integer):Integer;//0006B2CC
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//0006B370
    procedure SetChildOrder(Child:TComponent; Order:Integer);//0006B544
    procedure ShowControl(AControl:TControl);//0006B550
    procedure CMDesignHitTest(var Message:TCMDesignHitTest);//0006B61C
    procedure CMDialogKey(Message:TWMKey);//0006B678
    procedure CMDockClient(var Message:TCMDockClient);//0006B6E4
    //procedure sub_0006B82C(?:?);//0006B82C
    procedure CMUnDockClient(var Message:TCMUnDockClient);//0006B908
    procedure WMLButtonDown(var Message:TWMLButtonDown);//0006B9CC
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//0006BA04
    constructor Create(Collection:TCollection);//0006BA40
    procedure Assign(Source:TPersistent);//0006BA8C
    function GetDisplayName:AnsiString;//0006BB7C
    function Add:TCoolBand;//0006BC4C
    function GetItem(Index:Integer):TCoolBand;//0006BC58
    procedure sub_0002114C;//0006BC6C
    procedure Update(Item:TCollectionItem);//0006BC70
    constructor Create(AOwner:TComponent);//0006BCA0
    destructor Destroy;//0006BD5C
    procedure CreateParams(var Params:TCreateParams);//0006BD98
    procedure CreateWnd;//0006BE1C
    function DoHint:Boolean;//0006BE9C
    procedure DrawPanel(Panel:TStatusPanel; const Rect:TRect);//0006BEC0
    procedure SetSections(Value:THeaderSections);//0006BEF0
    procedure CMBiDiModeChanged(var Message:TMessage);//0006C030
    procedure FlipChildren(AllLevels:Boolean);//0006C0A8
    procedure CMWinIniChange(var Message:TMessage);//0006C568
    //procedure sub_0006C590(?:?);//0006C590
    procedure WMGetTextLength(var Message:TWMGetTextLength);//0006C62C
    procedure WMPaint(var Message:TWMPaint);//0006C644
    procedure WMSize(var Message:TWMSize);//0006C664
    procedure CMColorChanged(var Message:TMessage);//0006C6D0
    procedure CMParentFontChanged(var Message:TMessage);//0006C6E4
    procedure ExecuteAction(Action:TBasicAction);//0006C708
    procedure ProgressLimitError;//0006C780
    constructor Create(AOwner:TComponent);//0006C7F8
    procedure CreateParams(var Params:TCreateParams);//0006C884
    procedure CreateWnd;//0006C8F0
    procedure SetOrientation(Value:TPageScrollerOrientation);//0006CC20
    function ConvertReadStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;//0006CC48
    function ConvertWriteStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;//0006CC5C
    constructor Create(Collection:TCollection);//0006CC70
    destructor Destroy;//0006CD04
    procedure DefineProperties(Filer:TFiler);//0006CD54
    procedure WriteCols;//0006CDE4
    procedure SetImageIndex(Value:Integer);//0006CFE0
    procedure Assign(Source:TPersistent);//0006D000
    function GetDisplayName:AnsiString;//0006D074
    function GetItem(Index:Integer):THeaderSection;//0006D0DC
    procedure sub_0002114C;//0006D0F0
    procedure Update(Item:TCollectionItem);//0006D0F4
    function Add(const S:AnsiString):Integer;//0006D258
    procedure Delete(Index:Integer);//0006D274
    procedure Insert(Index:Integer; const S:AnsiString);//0006D2D8
    procedure Put(Index:Integer; const S:AnsiString);//0006D30C
    procedure SetUpdateState(Updating:Boolean);//0006D354
    destructor Destroy;//0006D3B0
    procedure Assign(Source:TPersistent);//0006D868
    destructor Destroy;//0006D9C4
    procedure Assign(Source:TPersistent);//0006DD18
    function WriteItems:Boolean;//0006DD78
    procedure DefineProperties(Filer:TFiler);//0006DE08
    function GetLength(const S:AnsiString):Integer;//0006DFE4
    function DefaultListViewSort(Item1:TListItem; Item2:TListItem; lParam:Integer):Integer; stdcall;//0006E348
    constructor Create(AOwner:TComponent);//0006E3B4
    destructor Destroy;//0006E56C
    procedure CreateParams(var Params:TCreateParams);//0006E65C
    procedure ReadCols;//0006E788
    procedure UpdateCols;//0006E83C
    procedure CreateWnd;//0006E8BC
    procedure DestroyWnd;//0006EA7C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0006EB74
    //procedure sub_0006EBDC(?:?);//0006EBDC
    procedure CMColorChanged(var Message:TMessage);//0006F2B8
    procedure CMCtl3DChanged(var Message:TMessage);//0006F2DC
    procedure WMNotify(Message:TWMNotify);//0006F300
    procedure CMFontChanged(var Message:TMessage);//0006F380
    procedure WMParentNotify(var Message:TWMParentNotify);//0006F498
    function OwnerDataFetch(Item:TListItem; Request:TItemRequest):Boolean;//0006F4E8
    function OwnerDataFind(Find:TItemFind; const FindString:AnsiString; const FindPosition:TPoint; FindData:Pointer; StartIndex:Integer; Direction:TSearchDirection; Wrap:Boolean):Integer;//0006F510
    function OwnerDataHint(StartIndex:Integer; EndIndex:Integer):Boolean;//0006F55C
    function OwnerDataStateChange(StartIndex:Integer; EndIndex:Integer; OldState:TItemStates; NewState:TItemStates):Boolean;//0006F584
    function CreateListItem:TListItem;//0006F5B8
    function ConvertMask(Mask:Longint):TItemRequest;//0006F5CC
    function ConvertFlags(Flags:Integer):TItemFind;//0006F75C
    function ConvertStates(State:Integer):TItemStates;//0006F780
    //procedure sub_0006F7CC(?:?);//0006F7CC
    procedure ColClick(Column:TListColumn);//0006FF0C
    procedure InsertItem(Item:TListItem);//0006FF2C
    procedure CanChange(Item:TListItem; Change:Integer);//0006FF4C
    procedure Change(Item:TListItem; Change:Integer);//0006FF94
    procedure Delete(Item:TListItem);//0006FFCC
    procedure CanEdit(Item:TListItem);//00070004
    procedure Edit(const Item:TLVItem);//00070030
    function GetDragImages:TDragImageList;//000700B0
    procedure WndProc(var Message:TMessage);//000700CC
    procedure DoStartDrag(var DragObject:TDragObject);//0007014C
    procedure DoEndDrag(Target:TObject; X:Integer; Y:Integer);//00070220
    procedure CMDrag(var Message:TCMDrag);//00070240
    procedure UpdateBands;//00070744
    procedure UpdateBand(Index:Integer);//00070784
    procedure WMRButtonDown(var Message:TWMRButtonDown);//000708A4
    procedure WMLButtonDown(var Message:TWMLButtonDown);//00070904
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//00070BF4
    procedure CNDrawItem(var Message:TWMDrawItem);//00070C28
    function CustomDraw(const ARect:TRect; Stage:TCustomDrawStage):Boolean;//00070D18
    function CustomDrawItem(Item:TListItem; State:TCustomDrawState; Stage:TCustomDrawStage):Boolean;//00070D44
    function CustomDrawSubItem(Item:TListItem; SubItem:Integer; State:TCustomDrawState; Stage:TCustomDrawStage):Boolean;//00070D80
    procedure DrawItem(Item:TListItem; Rect:TRect; State:TOwnerDrawState);//00070DB8

implementation

//0006979C
function InitCommonControl(CC:Integer):Boolean;
begin
{*
 0006979C    push        ebx
 0006979D    add         esp,0FFFFFFF8
 000697A0    mov         dword ptr [esp],8
 000697A7    mov         dword ptr [esp+4],eax
 000697AB    mov         eax,esp
 000697AD    call        InitCommonControlsEx
 000697B2    neg         eax
 000697B4    sbb         ebx,ebx
 000697B6    neg         ebx
 000697B8    test        bl,bl
>000697BA    jne         000697C1
 000697BC    call        comctl32.InitCommonControls
 000697C1    mov         eax,ebx
 000697C3    pop         ecx
 000697C4    pop         edx
 000697C5    pop         ebx
 000697C6    ret
*}
end;

//000697C8
procedure SetComCtlStyle(Ctl:TWinControl; Value:Integer; UseStyle:Boolean);
begin
{*
 000697C8    push        ebx
 000697C9    push        esi
 000697CA    push        edi
 000697CB    push        ebp
 000697CC    mov         ebx,ecx
 000697CE    mov         edi,edx
 000697D0    mov         ebp,eax
 000697D2    mov         eax,ebp
 000697D4    call        TWinControl.HandleAllocated
 000697D9    test        al,al
>000697DB    je          0006980A
 000697DD    push        0F0
 000697DF    mov         eax,ebp
 000697E1    call        TWinControl.GetHandle
 000697E6    push        eax
 000697E7    call        user32.GetWindowLongA
 000697EC    mov         esi,eax
 000697EE    test        bl,bl
>000697F0    jne         000697F8
 000697F2    not         edi
 000697F4    and         esi,edi
>000697F6    jmp         000697FA
 000697F8    or          esi,edi
 000697FA    push        esi
 000697FB    push        0F0
 000697FD    mov         eax,ebp
 000697FF    call        TWinControl.GetHandle
 00069804    push        eax
 00069805    call        user32.SetWindowLongA
 0006980A    pop         ebp
 0006980B    pop         edi
 0006980C    pop         esi
 0006980D    pop         ebx
 0006980E    ret
*}
end;

//00069900
procedure TabControlError(const S:AnsiString);
begin
{*
 00069900    push        ebx
 00069901    mov         ebx,eax
 00069903    mov         ecx,ebx
 00069905    mov         dl,1
 00069907    mov         eax,[0001EC9C];EListError
 0006990C    call        Exception.Create
 00069911    call        @RaiseExcept
 00069916    pop         ebx
 00069917    ret
*}
end;

//00069918
procedure TTabStrings.Clear;
begin
{*
 00069918    push        ebp
 00069919    mov         ebp,esp
 0006991B    push        0
 0006991D    push        ebx
 0006991E    mov         ebx,eax
 00069920    xor         eax,eax
 00069922    push        ebp
 00069923    push        6997C
 00069928    push        dword ptr fs:[eax]
 0006992B    mov         dword ptr fs:[eax],esp
 0006992E    push        0
 00069930    push        0
 00069932    push        1309
 00069937    mov         eax,dword ptr [ebx+0C]
 0006993A    call        TWinControl.GetHandle
 0006993F    push        eax
 00069940    call        user32.SendMessageA
 00069945    test        eax,eax
>00069947    jne         0006995E
 00069949    lea         edx,[ebp-4]
 0006994C    mov         eax,[000B59F4];^sTabFailClear:TResStringRec
 00069951    call        LoadResString
 00069956    mov         eax,dword ptr [ebp-4]
 00069959    call        TabControlError
 0006995E    mov         eax,dword ptr [ebx+0C]
 00069961    call        TCustomTabControl.TabsChanged
 00069966    xor         eax,eax
 00069968    pop         edx
 00069969    pop         ecx
 0006996A    pop         ecx
 0006996B    mov         dword ptr fs:[eax],edx
 0006996E    push        69983
 00069973    lea         eax,[ebp-4]
 00069976    call        @LStrClr
 0006997B    ret
>0006997C    jmp         @HandleFinally
>00069981    jmp         00069973
 00069983    pop         ebx
 00069984    pop         ecx
 00069985    pop         ebp
 00069986    ret
*}
end;

//00069988
procedure TTabStrings.Delete(Index:Integer);
begin
{*
 00069988    push        ebp
 00069989    mov         ebp,esp
 0006998B    add         esp,0FFFFFFF0
 0006998E    push        ebx
 0006998F    push        esi
 00069990    xor         ecx,ecx
 00069992    mov         dword ptr [ebp-4],ecx
 00069995    mov         dword ptr [ebp-8],ecx
 00069998    mov         esi,edx
 0006999A    mov         ebx,eax
 0006999C    xor         eax,eax
 0006999E    push        ebp
 0006999F    push        69A14
 000699A4    push        dword ptr fs:[eax]
 000699A7    mov         dword ptr fs:[eax],esp
 000699AA    push        0
 000699AC    push        esi
 000699AD    push        1308
 000699B2    mov         eax,dword ptr [ebx+0C]
 000699B5    call        TWinControl.GetHandle
 000699BA    push        eax
 000699BB    call        user32.SendMessageA
 000699C0    test        eax,eax
>000699C2    jne         000699F1
 000699C4    lea         eax,[ebp-4]
 000699C7    push        eax
 000699C8    lea         edx,[ebp-8]
 000699CB    mov         eax,[000B59B4];^sTabFailDelete:TResStringRec
 000699D0    call        LoadResString
 000699D5    mov         eax,dword ptr [ebp-8]
 000699D8    mov         dword ptr [ebp-10],esi
 000699DB    mov         byte ptr [ebp-0C],0
 000699DF    lea         edx,[ebp-10]
 000699E2    xor         ecx,ecx
 000699E4    call        Format
 000699E9    mov         eax,dword ptr [ebp-4]
 000699EC    call        TabControlError
 000699F1    mov         eax,dword ptr [ebx+0C]
 000699F4    call        TCustomTabControl.TabsChanged
 000699F9    xor         eax,eax
 000699FB    pop         edx
 000699FC    pop         ecx
 000699FD    pop         ecx
 000699FE    mov         dword ptr fs:[eax],edx
 00069A01    push        69A1B
 00069A06    lea         eax,[ebp-8]
 00069A09    mov         edx,2
 00069A0E    call        @LStrArrayClr
 00069A13    ret
>00069A14    jmp         @HandleFinally
>00069A19    jmp         00069A06
 00069A1B    pop         esi
 00069A1C    pop         ebx
 00069A1D    mov         esp,ebp
 00069A1F    pop         ebp
 00069A20    ret
*}
end;

//00069A24
function TTabStrings.Get(Index:Integer):AnsiString;
begin
{*
 00069A24    push        ebp
 00069A25    mov         ebp,esp
 00069A27    add         esp,0FFFFF004
 00069A2D    push        eax
 00069A2E    add         esp,0FFFFFFD4
 00069A31    push        ebx
 00069A32    push        esi
 00069A33    push        edi
 00069A34    xor         ebx,ebx
 00069A36    mov         dword ptr [ebp-1020],ebx
 00069A3C    mov         dword ptr [ebp-1024],ebx
 00069A42    mov         edi,ecx
 00069A44    mov         esi,edx
 00069A46    mov         ebx,eax
 00069A48    xor         eax,eax
 00069A4A    push        ebp
 00069A4B    push        69B0C
 00069A50    push        dword ptr fs:[eax]
 00069A53    mov         dword ptr fs:[eax],esp
 00069A56    mov         eax,dword ptr [ebx+0C]
 00069A59    call        TControl.UseRightToLeftReading
 00069A5E    and         eax,7F
 00069A61    mov         eax,dword ptr [eax*4+0B4C14]
 00069A68    or          eax,1
 00069A6B    mov         dword ptr [ebp-1C],eax
 00069A6E    lea         eax,[ebp-101C]
 00069A74    mov         dword ptr [ebp-10],eax
 00069A77    mov         dword ptr [ebp-0C],1000
 00069A7E    lea         eax,[ebp-1C]
 00069A81    push        eax
 00069A82    push        esi
 00069A83    push        1305
 00069A88    mov         eax,dword ptr [ebx+0C]
 00069A8B    call        TWinControl.GetHandle
 00069A90    push        eax
 00069A91    call        user32.SendMessageA
 00069A96    test        eax,eax
>00069A98    jne         00069ADC
 00069A9A    lea         eax,[ebp-1020]
 00069AA0    push        eax
 00069AA1    lea         edx,[ebp-1024]
 00069AA7    mov         eax,[000B5934];^sTabFailRetrieve:TResStringRec
 00069AAC    call        LoadResString
 00069AB1    mov         eax,dword ptr [ebp-1024]
 00069AB7    mov         dword ptr [ebp-102C],esi
 00069ABD    mov         byte ptr [ebp-1028],0
 00069AC4    lea         edx,[ebp-102C]
 00069ACA    xor         ecx,ecx
 00069ACC    call        Format
 00069AD1    mov         eax,dword ptr [ebp-1020]
 00069AD7    call        TabControlError
 00069ADC    mov         eax,edi
 00069ADE    lea         edx,[ebp-101C]
 00069AE4    mov         ecx,1000
 00069AE9    call        @LStrFromArray
 00069AEE    xor         eax,eax
 00069AF0    pop         edx
 00069AF1    pop         ecx
 00069AF2    pop         ecx
 00069AF3    mov         dword ptr fs:[eax],edx
 00069AF6    push        69B13
 00069AFB    lea         eax,[ebp-1024]
 00069B01    mov         edx,2
 00069B06    call        @LStrArrayClr
 00069B0B    ret
>00069B0C    jmp         @HandleFinally
>00069B11    jmp         00069AFB
 00069B13    pop         edi
 00069B14    pop         esi
 00069B15    pop         ebx
 00069B16    mov         esp,ebp
 00069B18    pop         ebp
 00069B19    ret
*}
end;

//00069B1C
function TTabStrings.GetCount:Integer;
begin
{*
 00069B1C    push        ebx
 00069B1D    mov         ebx,eax
 00069B1F    push        0
 00069B21    push        0
 00069B23    push        1304
 00069B28    mov         eax,dword ptr [ebx+0C]
 00069B2B    call        TWinControl.GetHandle
 00069B30    push        eax
 00069B31    call        user32.SendMessageA
 00069B36    pop         ebx
 00069B37    ret
*}
end;

//00069B38
function TTabStrings.GetObject(Index:Integer):TObject;
begin
{*
 00069B38    push        ebp
 00069B39    mov         ebp,esp
 00069B3B    add         esp,0FFFFFFD4
 00069B3E    push        ebx
 00069B3F    push        esi
 00069B40    xor         ecx,ecx
 00069B42    mov         dword ptr [ebp-20],ecx
 00069B45    mov         dword ptr [ebp-24],ecx
 00069B48    mov         esi,edx
 00069B4A    mov         ebx,eax
 00069B4C    xor         eax,eax
 00069B4E    push        ebp
 00069B4F    push        69BC8
 00069B54    push        dword ptr fs:[eax]
 00069B57    mov         dword ptr fs:[eax],esp
 00069B5A    mov         dword ptr [ebp-1C],8
 00069B61    lea         eax,[ebp-1C]
 00069B64    push        eax
 00069B65    push        esi
 00069B66    push        1305
 00069B6B    mov         eax,dword ptr [ebx+0C]
 00069B6E    call        TWinControl.GetHandle
 00069B73    push        eax
 00069B74    call        user32.SendMessageA
 00069B79    test        eax,eax
>00069B7B    jne         00069BAA
 00069B7D    lea         eax,[ebp-20]
 00069B80    push        eax
 00069B81    lea         edx,[ebp-24]
 00069B84    mov         eax,[000B5974];^sTabFailGetObject:TResStringRec
 00069B89    call        LoadResString
 00069B8E    mov         eax,dword ptr [ebp-24]
 00069B91    mov         dword ptr [ebp-2C],esi
 00069B94    mov         byte ptr [ebp-28],0
 00069B98    lea         edx,[ebp-2C]
 00069B9B    xor         ecx,ecx
 00069B9D    call        Format
 00069BA2    mov         eax,dword ptr [ebp-20]
 00069BA5    call        TabControlError
 00069BAA    mov         ebx,dword ptr [ebp-4]
 00069BAD    xor         eax,eax
 00069BAF    pop         edx
 00069BB0    pop         ecx
 00069BB1    pop         ecx
 00069BB2    mov         dword ptr fs:[eax],edx
 00069BB5    push        69BCF
 00069BBA    lea         eax,[ebp-24]
 00069BBD    mov         edx,2
 00069BC2    call        @LStrArrayClr
 00069BC7    ret
>00069BC8    jmp         @HandleFinally
>00069BCD    jmp         00069BBA
 00069BCF    mov         eax,ebx
 00069BD1    pop         esi
 00069BD2    pop         ebx
 00069BD3    mov         esp,ebp
 00069BD5    pop         ebp
 00069BD6    ret
*}
end;

//00069BD8
procedure TTabStrings.Put(Index:Integer; const S:AnsiString);
begin
{*
 00069BD8    push        ebp
 00069BD9    mov         ebp,esp
 00069BDB    add         esp,0FFFFFFCC
 00069BDE    push        ebx
 00069BDF    push        esi
 00069BE0    push        edi
 00069BE1    xor         ebx,ebx
 00069BE3    mov         dword ptr [ebp-20],ebx
 00069BE6    mov         dword ptr [ebp-24],ebx
 00069BE9    mov         edi,ecx
 00069BEB    mov         esi,edx
 00069BED    mov         ebx,eax
 00069BEF    xor         eax,eax
 00069BF1    push        ebp
 00069BF2    push        69CAA
 00069BF7    push        dword ptr fs:[eax]
 00069BFA    mov         dword ptr fs:[eax],esp
 00069BFD    mov         eax,dword ptr [ebx+0C]
 00069C00    call        TControl.UseRightToLeftReading
 00069C05    and         eax,7F
 00069C08    mov         eax,dword ptr [eax*4+0B4C1C]
 00069C0F    or          eax,1
 00069C12    or          eax,2
 00069C15    mov         dword ptr [ebp-1C],eax
 00069C18    mov         eax,edi
 00069C1A    call        @LStrToPChar
 00069C1F    mov         dword ptr [ebp-10],eax
 00069C22    mov         edx,esi
 00069C24    mov         eax,dword ptr [ebx+0C]
 00069C27    mov         ecx,dword ptr [eax]
 00069C29    call        dword ptr [ecx+0C0]
 00069C2F    mov         dword ptr [ebp-8],eax
 00069C32    lea         eax,[ebp-1C]
 00069C35    push        eax
 00069C36    push        esi
 00069C37    push        1306
 00069C3C    mov         eax,dword ptr [ebx+0C]
 00069C3F    call        TWinControl.GetHandle
 00069C44    push        eax
 00069C45    call        user32.SendMessageA
 00069C4A    test        eax,eax
>00069C4C    jne         00069C87
 00069C4E    lea         eax,[ebp-20]
 00069C51    push        eax
 00069C52    lea         edx,[ebp-24]
 00069C55    mov         eax,[000B5AD0];^sTabFailSet:TResStringRec
 00069C5A    call        LoadResString
 00069C5F    mov         eax,dword ptr [ebp-24]
 00069C62    push        eax
 00069C63    mov         dword ptr [ebp-34],edi
 00069C66    mov         byte ptr [ebp-30],0B
 00069C6A    mov         dword ptr [ebp-2C],esi
 00069C6D    mov         byte ptr [ebp-28],0
 00069C71    lea         edx,[ebp-34]
 00069C74    mov         ecx,1
 00069C79    pop         eax
 00069C7A    call        Format
 00069C7F    mov         eax,dword ptr [ebp-20]
 00069C82    call        TabControlError
 00069C87    mov         eax,dword ptr [ebx+0C]
 00069C8A    call        TCustomTabControl.TabsChanged
 00069C8F    xor         eax,eax
 00069C91    pop         edx
 00069C92    pop         ecx
 00069C93    pop         ecx
 00069C94    mov         dword ptr fs:[eax],edx
 00069C97    push        69CB1
 00069C9C    lea         eax,[ebp-24]
 00069C9F    mov         edx,2
 00069CA4    call        @LStrArrayClr
 00069CA9    ret
>00069CAA    jmp         @HandleFinally
>00069CAF    jmp         00069C9C
 00069CB1    pop         edi
 00069CB2    pop         esi
 00069CB3    pop         ebx
 00069CB4    mov         esp,ebp
 00069CB6    pop         ebp
 00069CB7    ret
*}
end;

//00069CB8
procedure TTabStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 00069CB8    push        ebp
 00069CB9    mov         ebp,esp
 00069CBB    add         esp,0FFFFFFD4
 00069CBE    push        ebx
 00069CBF    push        esi
 00069CC0    xor         ebx,ebx
 00069CC2    mov         dword ptr [ebp-20],ebx
 00069CC5    mov         dword ptr [ebp-24],ebx
 00069CC8    mov         esi,edx
 00069CCA    mov         ebx,eax
 00069CCC    xor         eax,eax
 00069CCE    push        ebp
 00069CCF    push        69D48
 00069CD4    push        dword ptr fs:[eax]
 00069CD7    mov         dword ptr fs:[eax],esp
 00069CDA    mov         dword ptr [ebp-1C],8
 00069CE1    mov         dword ptr [ebp-4],ecx
 00069CE4    lea         eax,[ebp-1C]
 00069CE7    push        eax
 00069CE8    push        esi
 00069CE9    push        1306
 00069CEE    mov         eax,dword ptr [ebx+0C]
 00069CF1    call        TWinControl.GetHandle
 00069CF6    push        eax
 00069CF7    call        user32.SendMessageA
 00069CFC    test        eax,eax
>00069CFE    jne         00069D2D
 00069D00    lea         eax,[ebp-20]
 00069D03    push        eax
 00069D04    lea         edx,[ebp-24]
 00069D07    mov         eax,[000B5698];^sTabFailSetObject:TResStringRec
 00069D0C    call        LoadResString
 00069D11    mov         eax,dword ptr [ebp-24]
 00069D14    mov         dword ptr [ebp-2C],esi
 00069D17    mov         byte ptr [ebp-28],0
 00069D1B    lea         edx,[ebp-2C]
 00069D1E    xor         ecx,ecx
 00069D20    call        Format
 00069D25    mov         eax,dword ptr [ebp-20]
 00069D28    call        TabControlError
 00069D2D    xor         eax,eax
 00069D2F    pop         edx
 00069D30    pop         ecx
 00069D31    pop         ecx
 00069D32    mov         dword ptr fs:[eax],edx
 00069D35    push        69D4F
 00069D3A    lea         eax,[ebp-24]
 00069D3D    mov         edx,2
 00069D42    call        @LStrArrayClr
 00069D47    ret
>00069D48    jmp         @HandleFinally
>00069D4D    jmp         00069D3A
 00069D4F    pop         esi
 00069D50    pop         ebx
 00069D51    mov         esp,ebp
 00069D53    pop         ebp
 00069D54    ret
*}
end;

//00069D58
procedure TTabStrings.Insert(Index:Integer; const S:AnsiString);
begin
{*
 00069D58    push        ebp
 00069D59    mov         ebp,esp
 00069D5B    add         esp,0FFFFFFCC
 00069D5E    push        ebx
 00069D5F    push        esi
 00069D60    push        edi
 00069D61    xor         ebx,ebx
 00069D63    mov         dword ptr [ebp-20],ebx
 00069D66    mov         dword ptr [ebp-24],ebx
 00069D69    mov         edi,ecx
 00069D6B    mov         esi,edx
 00069D6D    mov         ebx,eax
 00069D6F    xor         eax,eax
 00069D71    push        ebp
 00069D72    push        69E2A
 00069D77    push        dword ptr fs:[eax]
 00069D7A    mov         dword ptr fs:[eax],esp
 00069D7D    mov         eax,dword ptr [ebx+0C]
 00069D80    call        TControl.UseRightToLeftReading
 00069D85    and         eax,7F
 00069D88    mov         eax,dword ptr [eax*4+0B4C24]
 00069D8F    or          eax,1
 00069D92    or          eax,2
 00069D95    mov         dword ptr [ebp-1C],eax
 00069D98    mov         eax,edi
 00069D9A    call        @LStrToPChar
 00069D9F    mov         dword ptr [ebp-10],eax
 00069DA2    mov         edx,esi
 00069DA4    mov         eax,dword ptr [ebx+0C]
 00069DA7    mov         ecx,dword ptr [eax]
 00069DA9    call        dword ptr [ecx+0C0]
 00069DAF    mov         dword ptr [ebp-8],eax
 00069DB2    lea         eax,[ebp-1C]
 00069DB5    push        eax
 00069DB6    push        esi
 00069DB7    push        1307
 00069DBC    mov         eax,dword ptr [ebx+0C]
 00069DBF    call        TWinControl.GetHandle
 00069DC4    push        eax
 00069DC5    call        user32.SendMessageA
 00069DCA    test        eax,eax
>00069DCC    jge         00069E07
 00069DCE    lea         eax,[ebp-20]
 00069DD1    push        eax
 00069DD2    lea         edx,[ebp-24]
 00069DD5    mov         eax,[000B5AD0];^sTabFailSet:TResStringRec
 00069DDA    call        LoadResString
 00069DDF    mov         eax,dword ptr [ebp-24]
 00069DE2    push        eax
 00069DE3    mov         dword ptr [ebp-34],edi
 00069DE6    mov         byte ptr [ebp-30],0B
 00069DEA    mov         dword ptr [ebp-2C],esi
 00069DED    mov         byte ptr [ebp-28],0
 00069DF1    lea         edx,[ebp-34]
 00069DF4    mov         ecx,1
 00069DF9    pop         eax
 00069DFA    call        Format
 00069DFF    mov         eax,dword ptr [ebp-20]
 00069E02    call        TabControlError
 00069E07    mov         eax,dword ptr [ebx+0C]
 00069E0A    call        TCustomTabControl.TabsChanged
 00069E0F    xor         eax,eax
 00069E11    pop         edx
 00069E12    pop         ecx
 00069E13    pop         ecx
 00069E14    mov         dword ptr fs:[eax],edx
 00069E17    push        69E31
 00069E1C    lea         eax,[ebp-24]
 00069E1F    mov         edx,2
 00069E24    call        @LStrArrayClr
 00069E29    ret
>00069E2A    jmp         @HandleFinally
>00069E2F    jmp         00069E1C
 00069E31    pop         edi
 00069E32    pop         esi
 00069E33    pop         ebx
 00069E34    mov         esp,ebp
 00069E36    pop         ebp
 00069E37    ret
*}
end;

//00069E38
procedure TTabStrings.SetUpdateState(Updating:Boolean);
begin
{*
 00069E38    push        ebx
 00069E39    push        esi
 00069E3A    push        edi
 00069E3B    mov         ebx,edx
 00069E3D    mov         esi,eax
 00069E3F    mov         edi,dword ptr [esi+0C]
 00069E42    mov         byte ptr [edi+214],bl
 00069E48    push        0
 00069E4A    mov         eax,ebx
 00069E4C    xor         al,1
 00069E4E    and         eax,7F
 00069E51    push        eax
 00069E52    push        0B
 00069E54    mov         eax,edi
 00069E56    call        TWinControl.GetHandle
 00069E5B    push        eax
 00069E5C    call        user32.SendMessageA
 00069E61    xor         bl,1
 00069E64    test        bl,bl
>00069E66    je          00069E78
 00069E68    mov         eax,dword ptr [esi+0C]
 00069E6B    mov         edx,dword ptr [eax]
 00069E6D    call        dword ptr [edx+78]
 00069E70    mov         eax,dword ptr [esi+0C]
 00069E73    call        TCustomTabControl.TabsChanged
 00069E78    pop         edi
 00069E79    pop         esi
 00069E7A    pop         ebx
 00069E7B    ret
*}
end;

//00069E7C
constructor TCustomTabControl.Create(AOwner:TComponent);
begin
{*
 00069E7C    push        ebp
 00069E7D    mov         ebp,esp
 00069E7F    push        ecx
 00069E80    push        ebx
 00069E81    push        esi
 00069E82    test        dl,dl
>00069E84    je          00069E8E
 00069E86    add         esp,0FFFFFFF0
 00069E89    call        @ClassCreate
 00069E8E    mov         byte ptr [ebp-1],dl
 00069E91    mov         ebx,eax
 00069E93    xor         edx,edx
 00069E95    mov         eax,ebx
 00069E97    call        TWinControl.Create
 00069E9C    mov         edx,121
 00069EA1    mov         eax,ebx
 00069EA3    call        TControl.SetWidth
 00069EA8    mov         edx,0C1
 00069EAD    mov         eax,ebx
 00069EAF    call        TControl.SetHeight
 00069EB4    mov         dl,1
 00069EB6    mov         eax,ebx
 00069EB8    call        TWinControl.SetTabStop
 00069EBD    mov         eax,[00069F38]
 00069EC2    mov         dword ptr [ebx+40],eax
 00069EC5    mov         dl,1
 00069EC7    mov         eax,[00069810];TTabStrings
 00069ECC    call        TObject.Create
 00069ED1    mov         esi,eax
 00069ED3    mov         dword ptr [ebx+20C],esi
 00069ED9    mov         dword ptr [esi+0C],ebx
 00069EDC    mov         dl,1
 00069EDE    mov         eax,[0003E18C];TControlCanvas
 00069EE3    call        TCanvas.Create
 00069EE8    mov         esi,eax
 00069EEA    mov         dword ptr [ebx+1EC],esi
 00069EF0    mov         edx,ebx
 00069EF2    mov         eax,esi
 00069EF4    call        TControlCanvas.SetControl
 00069EF9    mov         dl,1
 00069EFB    mov         eax,[0004E008];TChangeLink
 00069F00    call        TObject.Create
 00069F05    mov         esi,eax
 00069F07    mov         dword ptr [ebx+1F4],esi
 00069F0D    mov         dword ptr [esi+0C],ebx
 00069F10    mov         dword ptr [esi+8],6A32C;TCustomTabControl.ImageListChange
 00069F17    mov         eax,ebx
 00069F19    cmp         byte ptr [ebp-1],0
>00069F1D    je          00069F2E
 00069F1F    call        @AfterConstruction
 00069F24    pop         dword ptr fs:[0]
 00069F2B    add         esp,0C
 00069F2E    mov         eax,ebx
 00069F30    pop         esi
 00069F31    pop         ebx
 00069F32    pop         ecx
 00069F33    pop         ebp
 00069F34    ret
*}
end;

//00069F3C
destructor TCustomTabControl.Destroy;
begin
{*
 00069F3C    push        ebx
 00069F3D    push        esi
 00069F3E    call        @BeforeDestruction
 00069F43    mov         ebx,edx
 00069F45    mov         esi,eax
 00069F47    mov         eax,dword ptr [esi+1EC]
 00069F4D    call        TObject.Free
 00069F52    mov         eax,dword ptr [esi+20C]
 00069F58    call        TObject.Free
 00069F5D    mov         eax,dword ptr [esi+204]
 00069F63    call        TObject.Free
 00069F68    mov         eax,dword ptr [esi+1F4]
 00069F6E    call        TObject.Free
 00069F73    mov         edx,ebx
 00069F75    and         dl,0FC
 00069F78    mov         eax,esi
 00069F7A    call        TWinControl.Destroy
 00069F7F    test        bl,bl
>00069F81    jle         00069F8A
 00069F83    mov         eax,esi
 00069F85    call        @ClassDestroy
 00069F8A    pop         esi
 00069F8B    pop         ebx
 00069F8C    ret
*}
end;

//00069F90
procedure TCustomTabControl.CanChange;
begin
{*
 00069F90    push        ebx
 00069F91    push        ecx
 00069F92    mov         byte ptr [esp],1
 00069F96    cmp         word ptr [eax+222],0
>00069F9E    je          00069FB2
 00069FA0    mov         ecx,esp
 00069FA2    mov         ebx,eax
 00069FA4    mov         edx,eax
 00069FA6    mov         eax,dword ptr [ebx+224]
 00069FAC    call        dword ptr [ebx+220]
 00069FB2    mov         al,byte ptr [esp]
 00069FB5    pop         edx
 00069FB6    pop         ebx
 00069FB7    ret
*}
end;

//00069FB8
{*function sub_00069FB8:?;
begin
 00069FB8    mov         al,1
 00069FBA    ret
end;*}

//00069FBC
procedure TCustomTabControl.Change;
begin
{*
 00069FBC    push        ebx
 00069FBD    cmp         word ptr [eax+21A],0
>00069FC5    je          00069FD7
 00069FC7    mov         ebx,eax
 00069FC9    mov         edx,eax
 00069FCB    mov         eax,dword ptr [ebx+21C]
 00069FD1    call        dword ptr [ebx+218]
 00069FD7    pop         ebx
 00069FD8    ret
*}
end;

//00069FDC
procedure TCustomTabControl.CreateParams(var Params:TCreateParams);
begin
{*
 00069FDC    push        ebx
 00069FDD    push        esi
 00069FDE    push        edi
 00069FDF    mov         edi,edx
 00069FE1    mov         esi,eax
 00069FE3    mov         eax,8
 00069FE8    call        InitCommonControl
 00069FED    mov         edx,edi
 00069FEF    mov         eax,esi
 00069FF1    call        TWinControl.CreateParams
 00069FF6    mov         ecx,6A0D0
 00069FFB    mov         edx,edi
 00069FFD    mov         eax,esi
 00069FFF    call        TWinControl.CreateSubClass
 0006A004    mov         eax,esi
 0006A006    mov         bx,0FFCF
 0006A00A    call        @CallDynaInst
 0006A00F    and         eax,7F
 0006A012    add         eax,eax
 0006A014    lea         eax,[eax*8+0B4C2C]
 0006A01B    xor         edx,edx
 0006A01D    mov         dl,byte ptr [esi+20A]
 0006A023    mov         eax,dword ptr [eax+edx*4]
 0006A026    mov         edx,dword ptr [edi+4]
 0006A029    or          edx,2000000
 0006A02F    or          eax,edx
 0006A031    xor         edx,edx
 0006A033    mov         dl,byte ptr [esi+209]
 0006A039    or          eax,dword ptr [edx*4+0B4C4C]
 0006A040    xor         edx,edx
 0006A042    mov         dl,byte ptr [esi+1FF]
 0006A048    or          eax,dword ptr [edx*4+0B4C58]
 0006A04F    mov         dword ptr [edi+4],eax
 0006A052    cmp         byte ptr [esi+178],0
>0006A059    jne         0006A062
 0006A05B    or          dword ptr [edi+4],8000
 0006A062    cmp         byte ptr [esi+1FC],0
>0006A069    je          0006A072
 0006A06B    or          dword ptr [edi+4],200
 0006A072    cmp         byte ptr [esi+1FD],0
>0006A079    je          0006A07F
 0006A07B    or          dword ptr [edi+4],4
 0006A07F    cmp         byte ptr [esi+1FE],0
>0006A086    je          0006A08F
 0006A088    or          dword ptr [edi+4],2000
 0006A08F    cmp         word ptr [esi+210],0
>0006A097    je          0006A0A0
 0006A099    or          dword ptr [edi+4],400
 0006A0A0    cmp         byte ptr [esi+1F0],0
>0006A0A7    je          0006A0B3
 0006A0A9    test        byte ptr [esi+20],10
>0006A0AD    jne         0006A0B3
 0006A0AF    or          dword ptr [edi+4],40
 0006A0B3    cmp         byte ptr [esi+208],0
>0006A0BA    je          0006A0C0
 0006A0BC    or          dword ptr [edi+4],1
 0006A0C0    mov         eax,dword ptr [edi+24]
 0006A0C3    and         eax,0FFFFFFFC
 0006A0C6    or          eax,8
 0006A0C9    mov         dword ptr [edi+24],eax
 0006A0CC    pop         edi
 0006A0CD    pop         esi
 0006A0CE    pop         ebx
 0006A0CF    ret
*}
end;

//0006A0E0
procedure TCustomTabControl.CreateWnd;
begin
{*
 0006A0E0    push        ebx
 0006A0E1    push        esi
 0006A0E2    mov         ebx,eax
 0006A0E4    mov         eax,ebx
 0006A0E6    call        TWinControl.CreateWnd
 0006A0EB    mov         esi,dword ptr [ebx+1F8]
 0006A0F1    test        esi,esi
>0006A0F3    je          0006A11A
 0006A0F5    mov         eax,esi
 0006A0F7    call        TCustomImageList.HandleAllocated
 0006A0FC    test        al,al
>0006A0FE    je          0006A11A
 0006A100    mov         eax,dword ptr [ebx+1F8]
 0006A106    call        TCustomImageList.GetHandle
 0006A10B    push        eax
 0006A10C    xor         ecx,ecx
 0006A10E    mov         edx,1303
 0006A113    mov         eax,ebx
 0006A115    call        TControl.Perform
 0006A11A    cmp         dword ptr [ebx+210],0
>0006A121    je          0006A12A
 0006A123    mov         eax,ebx
 0006A125    call        TCustomTabControl.UpdateTabSize
 0006A12A    mov         esi,dword ptr [ebx+204]
 0006A130    test        esi,esi
>0006A132    je          0006A161
 0006A134    mov         edx,esi
 0006A136    mov         eax,dword ptr [ebx+20C]
 0006A13C    mov         ecx,dword ptr [eax]
 0006A13E    call        dword ptr [ecx+8]
 0006A141    mov         edx,dword ptr [ebx+200]
 0006A147    mov         eax,ebx
 0006A149    call        TCustomTabControl.SetTabIndex
 0006A14E    mov         eax,dword ptr [ebx+204]
 0006A154    call        TObject.Free
 0006A159    xor         eax,eax
 0006A15B    mov         dword ptr [ebx+204],eax
 0006A161    pop         esi
 0006A162    pop         ebx
 0006A163    ret
*}
end;

//0006A164
procedure TCustomTabControl.DestroyWnd;
begin
{*
 0006A164    push        ebx
 0006A165    push        esi
 0006A166    mov         ebx,eax
 0006A168    mov         eax,dword ptr [ebx+20C]
 0006A16E    mov         edx,dword ptr [eax]
 0006A170    call        dword ptr [edx+14]
 0006A173    test        eax,eax
>0006A175    jle         0006A1A5
 0006A177    mov         dl,1
 0006A179    mov         eax,[0001F340];TStringList
 0006A17E    call        TObject.Create
 0006A183    mov         esi,eax
 0006A185    mov         dword ptr [ebx+204],esi
 0006A18B    mov         edx,dword ptr [ebx+20C]
 0006A191    mov         eax,esi
 0006A193    mov         ecx,dword ptr [eax]
 0006A195    call        dword ptr [ecx+8]
 0006A198    mov         eax,ebx
 0006A19A    call        TCustomTabControl.GetTabIndex
 0006A19F    mov         dword ptr [ebx+200],eax
 0006A1A5    mov         eax,ebx
 0006A1A7    call        TWinControl.DestroyWnd
 0006A1AC    pop         esi
 0006A1AD    pop         ebx
 0006A1AE    ret
*}
end;

//0006A1B0
procedure TCustomTabControl.DrawTab(TabIndex:Integer; const Rect:TRect; Active:Boolean);
begin
{*
 0006A1B0    push        ebp
 0006A1B1    mov         ebp,esp
 0006A1B3    push        ebx
 0006A1B4    cmp         word ptr [eax+22A],0
>0006A1BC    je          0006A1D7
 0006A1BE    push        ecx
 0006A1BF    mov         cl,byte ptr [ebp+8]
 0006A1C2    push        ecx
 0006A1C3    mov         ebx,eax
 0006A1C5    mov         ecx,edx
 0006A1C7    mov         edx,eax
 0006A1C9    mov         eax,dword ptr [ebx+22C]
 0006A1CF    call        dword ptr [ebx+228]
>0006A1D5    jmp         0006A1E4
 0006A1D7    mov         edx,ecx
 0006A1D9    mov         eax,dword ptr [eax+1EC]
 0006A1DF    call        TCanvas.FillRect
 0006A1E4    pop         ebx
 0006A1E5    pop         ebp
 0006A1E6    ret         4
*}
end;

//0006A1EC
function TCustomTabControl.GetDisplayRect:TRect;
begin
{*
 0006A1EC    push        ebx
 0006A1ED    push        esi
 0006A1EE    mov         esi,edx
 0006A1F0    mov         ebx,eax
 0006A1F2    mov         edx,esi
 0006A1F4    mov         eax,ebx
 0006A1F6    mov         ecx,dword ptr [eax]
 0006A1F8    call        dword ptr [ecx+44]
 0006A1FB    push        esi
 0006A1FC    push        0
 0006A1FE    push        1328
 0006A203    mov         eax,ebx
 0006A205    call        TWinControl.GetHandle
 0006A20A    push        eax
 0006A20B    call        user32.SendMessageA
 0006A210    add         dword ptr [esi+4],2
 0006A214    pop         esi
 0006A215    pop         ebx
 0006A216    ret
*}
end;

//0006A218
function TCustomTabControl.GetImageIndex(TabIndex:Integer):Integer;
begin
{*
 0006A218    push        ebx
 0006A219    push        ecx
 0006A21A    mov         dword ptr [esp],edx
 0006A21D    cmp         word ptr [eax+232],0
>0006A225    je          0006A23A
 0006A227    push        esp
 0006A228    mov         ebx,eax
 0006A22A    mov         ecx,edx
 0006A22C    mov         edx,eax
 0006A22E    mov         eax,dword ptr [ebx+234]
 0006A234    call        dword ptr [ebx+230]
 0006A23A    mov         eax,dword ptr [esp]
 0006A23D    pop         edx
 0006A23E    pop         ebx
 0006A23F    ret
*}
end;

//0006A240
function TCustomTabControl.GetTabIndex:Integer;
begin
{*
 0006A240    push        ebx
 0006A241    mov         ebx,eax
 0006A243    push        0
 0006A245    push        0
 0006A247    push        130B
 0006A24C    mov         eax,ebx
 0006A24E    call        TWinControl.GetHandle
 0006A253    push        eax
 0006A254    call        user32.SendMessageA
 0006A259    pop         ebx
 0006A25A    ret
*}
end;

//0006A25C
procedure TCustomTabControl.Loaded;
begin
{*
 0006A25C    push        ebx
 0006A25D    mov         ebx,eax
 0006A25F    mov         eax,ebx
 0006A261    call        TControl.Loaded
 0006A266    cmp         dword ptr [ebx+1F8],0
>0006A26D    je          0006A276
 0006A26F    mov         eax,ebx
 0006A271    call        TCustomTabControl.UpdateTabImages
 0006A276    pop         ebx
 0006A277    ret
*}
end;

//0006A278
procedure TCustomListView.SetBorderStyle(Value:TBorderStyle);
begin
{*
 0006A278    cmp         dl,byte ptr [eax+1F0]
>0006A27E    je          0006A28B
 0006A280    mov         byte ptr [eax+1F0],dl
 0006A286    call        TWinControl.RecreateWnd
 0006A28B    ret
*}
end;

//0006A28C
procedure TCustomTabControl.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0006A28C    push        ebx
 0006A28D    push        esi
 0006A28E    push        edi
 0006A28F    mov         ebx,ecx
 0006A291    mov         esi,edx
 0006A293    mov         edi,eax
 0006A295    mov         ecx,ebx
 0006A297    mov         edx,esi
 0006A299    mov         eax,edi
 0006A29B    call        TControl.Notification
 0006A2A0    cmp         bl,1
>0006A2A3    jne         0006A2B6
 0006A2A5    cmp         esi,dword ptr [edi+1F8]
>0006A2AB    jne         0006A2B6
 0006A2AD    xor         edx,edx
 0006A2AF    mov         eax,edi
 0006A2B1    call        TCustomTabControl.SetImages
 0006A2B6    pop         edi
 0006A2B7    pop         esi
 0006A2B8    pop         ebx
 0006A2B9    ret
*}
end;

//0006A2BC
procedure TCustomTabControl.SetImages(Value:TCustomImageList);
begin
{*
 0006A2BC    push        ebx
 0006A2BD    push        esi
 0006A2BE    mov         esi,edx
 0006A2C0    mov         ebx,eax
 0006A2C2    mov         eax,dword ptr [ebx+1F8]
 0006A2C8    test        eax,eax
>0006A2CA    je          0006A2D7
 0006A2CC    mov         edx,dword ptr [ebx+1F4]
 0006A2D2    call        TCustomImageList.UnRegisterChanges
 0006A2D7    mov         eax,esi
 0006A2D9    mov         dword ptr [ebx+1F8],eax
 0006A2DF    test        eax,eax
>0006A2E1    je          0006A318
 0006A2E3    mov         edx,dword ptr [ebx+1F4]
 0006A2E9    call        TCustomImageList.RegisterChanges
 0006A2EE    mov         edx,ebx
 0006A2F0    mov         eax,dword ptr [ebx+1F8]
 0006A2F6    call        TComponent.FreeNotification
 0006A2FB    mov         eax,dword ptr [ebx+1F8]
 0006A301    call        TCustomImageList.GetHandle
 0006A306    push        eax
 0006A307    xor         ecx,ecx
 0006A309    mov         edx,1303
 0006A30E    mov         eax,ebx
 0006A310    call        TControl.Perform
 0006A315    pop         esi
 0006A316    pop         ebx
 0006A317    ret
 0006A318    push        0
 0006A31A    xor         ecx,ecx
 0006A31C    mov         edx,1303
 0006A321    mov         eax,ebx
 0006A323    call        TControl.Perform
 0006A328    pop         esi
 0006A329    pop         ebx
 0006A32A    ret
*}
end;

//0006A32C
procedure TCustomTabControl.ImageListChange(Sender:TObject);
begin
{*
 0006A32C    push        ebx
 0006A32D    push        esi
 0006A32E    mov         esi,edx
 0006A330    mov         ebx,eax
 0006A332    mov         eax,esi
 0006A334    call        TCustomImageList.GetHandle
 0006A339    push        eax
 0006A33A    xor         ecx,ecx
 0006A33C    mov         edx,1303
 0006A341    mov         eax,ebx
 0006A343    call        TControl.Perform
 0006A348    pop         esi
 0006A349    pop         ebx
 0006A34A    ret
*}
end;

//0006A34C
function TCustomTabControl.InternalSetMultiLine(Value:Boolean):Boolean;
begin
{*
 0006A34C    push        ebp
 0006A34D    mov         ebp,esp
 0006A34F    add         esp,0FFFFFFF8
 0006A352    push        ebx
 0006A353    push        esi
 0006A354    xor         ecx,ecx
 0006A356    mov         dword ptr [ebp-8],ecx
 0006A359    mov         ebx,edx
 0006A35B    mov         esi,eax
 0006A35D    xor         eax,eax
 0006A35F    push        ebp
 0006A360    push        6A3C9
 0006A365    push        dword ptr fs:[eax]
 0006A368    mov         dword ptr fs:[eax],esp
 0006A36B    cmp         bl,byte ptr [esi+1FC]
 0006A371    setne       byte ptr [ebp-1]
 0006A375    cmp         byte ptr [ebp-1],0
>0006A379    je          0006A3B3
 0006A37B    test        bl,bl
>0006A37D    jne         0006A3A2
 0006A37F    mov         al,byte ptr [esi+20A]
 0006A385    cmp         al,2
>0006A387    je          0006A38D
 0006A389    cmp         al,3
>0006A38B    jne         0006A3A2
 0006A38D    lea         edx,[ebp-8]
 0006A390    mov         eax,[000B5ACC];^sTabMustBeMultiLine:TResStringRec
 0006A395    call        LoadResString
 0006A39A    mov         eax,dword ptr [ebp-8]
 0006A39D    call        TabControlError
 0006A3A2    mov         byte ptr [esi+1FC],bl
 0006A3A8    test        bl,bl
>0006A3AA    jne         0006A3B3
 0006A3AC    mov         byte ptr [esi+208],0
 0006A3B3    xor         eax,eax
 0006A3B5    pop         edx
 0006A3B6    pop         ecx
 0006A3B7    pop         ecx
 0006A3B8    mov         dword ptr fs:[eax],edx
 0006A3BB    push        6A3D0
 0006A3C0    lea         eax,[ebp-8]
 0006A3C3    call        @LStrClr
 0006A3C8    ret
>0006A3C9    jmp         @HandleFinally
>0006A3CE    jmp         0006A3C0
 0006A3D0    mov         al,byte ptr [ebp-1]
 0006A3D3    pop         esi
 0006A3D4    pop         ebx
 0006A3D5    pop         ecx
 0006A3D6    pop         ecx
 0006A3D7    pop         ebp
 0006A3D8    ret
*}
end;

//0006A3DC
procedure TCustomTabControl.SetMultiLine(Value:Boolean);
begin
{*
 0006A3DC    push        ebx
 0006A3DD    push        esi
 0006A3DE    mov         ebx,edx
 0006A3E0    mov         esi,eax
 0006A3E2    mov         edx,ebx
 0006A3E4    mov         eax,esi
 0006A3E6    call        TCustomTabControl.InternalSetMultiLine
 0006A3EB    test        al,al
>0006A3ED    je          0006A3F6
 0006A3EF    mov         eax,esi
 0006A3F1    call        TWinControl.RecreateWnd
 0006A3F6    pop         esi
 0006A3F7    pop         ebx
 0006A3F8    ret
*}
end;

//0006A3FC
procedure TCustomTabControl.SetOwnerDraw(Value:Boolean);
begin
{*
 0006A3FC    cmp         dl,byte ptr [eax+1FE]
>0006A402    je          0006A40F
 0006A404    mov         byte ptr [eax+1FE],dl
 0006A40A    call        TWinControl.RecreateWnd
 0006A40F    ret
*}
end;

//0006A410
procedure TCustomTabControl.SetRaggedRight(Value:Boolean);
begin
{*
 0006A410    cmp         dl,byte ptr [eax+1FF]
>0006A416    je          0006A42A
 0006A418    mov         byte ptr [eax+1FF],dl
 0006A41E    mov         ecx,edx
 0006A420    mov         edx,800
 0006A425    call        SetComCtlStyle
 0006A42A    ret
*}
end;

//0006A42C
procedure TCustomTabControl.SetScrollOpposite(Value:Boolean);
begin
{*
 0006A42C    cmp         dl,byte ptr [eax+208]
>0006A432    je          0006A449
 0006A434    mov         byte ptr [eax+208],dl
 0006A43A    test        dl,dl
>0006A43C    je          0006A444
 0006A43E    mov         byte ptr [eax+1FC],dl
 0006A444    call        TWinControl.RecreateWnd
 0006A449    ret
*}
end;

//0006A44C
procedure TCustomTabControl.SetStyle(Value:TTabStyle);
begin
{*
 0006A44C    push        ebp
 0006A44D    mov         ebp,esp
 0006A44F    push        0
 0006A451    xor         ecx,ecx
 0006A453    push        ebp
 0006A454    push        6A4B6
 0006A459    push        dword ptr fs:[ecx]
 0006A45C    mov         dword ptr fs:[ecx],esp
 0006A45F    cmp         dl,byte ptr [eax+209]
>0006A465    je          0006A4A0
 0006A467    test        dl,dl
>0006A469    je          0006A495
 0006A46B    cmp         byte ptr [eax+20A],0
>0006A472    je          0006A495
 0006A474    lea         edx,[ebp-4]
 0006A477    mov         eax,[000B592C];^SInvalidTabStyle:TResStringRec
 0006A47C    call        LoadResString
 0006A481    mov         ecx,dword ptr [ebp-4]
 0006A484    mov         dl,1
 0006A486    mov         eax,[0001EE64];EInvalidOperation
 0006A48B    call        Exception.Create
 0006A490    call        @RaiseExcept
 0006A495    mov         byte ptr [eax+209],dl
 0006A49B    call        TWinControl.RecreateWnd
 0006A4A0    xor         eax,eax
 0006A4A2    pop         edx
 0006A4A3    pop         ecx
 0006A4A4    pop         ecx
 0006A4A5    mov         dword ptr fs:[eax],edx
 0006A4A8    push        6A4BD
 0006A4AD    lea         eax,[ebp-4]
 0006A4B0    call        @LStrClr
 0006A4B5    ret
>0006A4B6    jmp         @HandleFinally
>0006A4BB    jmp         0006A4AD
 0006A4BD    pop         ecx
 0006A4BE    pop         ebp
 0006A4BF    ret
*}
end;

//0006A4C0
procedure TCustomTabControl.SetTabHeight(Value:Smallint);
begin
{*
 0006A4C0    push        ebp
 0006A4C1    mov         ebp,esp
 0006A4C3    add         esp,0FFFFFEF4
 0006A4C9    push        ebx
 0006A4CA    xor         ecx,ecx
 0006A4CC    mov         dword ptr [ebp-10C],ecx
 0006A4D2    mov         ebx,eax
 0006A4D4    xor         eax,eax
 0006A4D6    push        ebp
 0006A4D7    push        6A55E
 0006A4DC    push        dword ptr fs:[eax]
 0006A4DF    mov         dword ptr fs:[eax],esp
 0006A4E2    cmp         dx,word ptr [ebx+212]
>0006A4E9    je          0006A545
 0006A4EB    test        dx,dx
>0006A4EE    jge         0006A537
 0006A4F0    lea         edx,[ebp-108]
 0006A4F6    mov         eax,dword ptr [ebx]
 0006A4F8    call        TObject.ClassName
 0006A4FD    lea         eax,[ebp-108]
 0006A503    mov         dword ptr [ebp-8],eax
 0006A506    mov         byte ptr [ebp-4],4
 0006A50A    lea         eax,[ebp-8]
 0006A50D    push        eax
 0006A50E    push        0
 0006A510    lea         edx,[ebp-10C]
 0006A516    mov         eax,[000B5820];^SPropertyOutOfRange:TResStringRec
 0006A51B    call        LoadResString
 0006A520    mov         ecx,dword ptr [ebp-10C]
 0006A526    mov         dl,1
 0006A528    mov         eax,[0001EE64];EInvalidOperation
 0006A52D    call        Exception.CreateFmt
 0006A532    call        @RaiseExcept
 0006A537    mov         word ptr [ebx+212],dx
 0006A53E    mov         eax,ebx
 0006A540    call        TCustomTabControl.UpdateTabSize
 0006A545    xor         eax,eax
 0006A547    pop         edx
 0006A548    pop         ecx
 0006A549    pop         ecx
 0006A54A    mov         dword ptr fs:[eax],edx
 0006A54D    push        6A565
 0006A552    lea         eax,[ebp-10C]
 0006A558    call        @LStrClr
 0006A55D    ret
>0006A55E    jmp         @HandleFinally
>0006A563    jmp         0006A552
 0006A565    pop         ebx
 0006A566    mov         esp,ebp
 0006A568    pop         ebp
 0006A569    ret
*}
end;

//0006A56C
procedure TCustomTabControl.SetTabIndex(Value:Integer);
begin
{*
 0006A56C    push        ebx
 0006A56D    push        esi
 0006A56E    mov         esi,edx
 0006A570    mov         ebx,eax
 0006A572    push        0
 0006A574    push        esi
 0006A575    push        130C
 0006A57A    mov         eax,ebx
 0006A57C    call        TWinControl.GetHandle
 0006A581    push        eax
 0006A582    call        user32.SendMessageA
 0006A587    pop         esi
 0006A588    pop         ebx
 0006A589    ret
*}
end;

//0006A58C
procedure TCustomTabControl.SetTabPosition(Value:TTabPosition);
begin
{*
 0006A58C    push        ebp
 0006A58D    mov         ebp,esp
 0006A58F    push        0
 0006A591    push        ebx
 0006A592    mov         ebx,eax
 0006A594    xor         eax,eax
 0006A596    push        ebp
 0006A597    push        6A617
 0006A59C    push        dword ptr fs:[eax]
 0006A59F    mov         dword ptr fs:[eax],esp
 0006A5A2    cmp         dl,byte ptr [ebx+20A]
>0006A5A8    je          0006A601
 0006A5AA    test        dl,dl
>0006A5AC    je          0006A5D8
 0006A5AE    cmp         byte ptr [ebx+209],0
>0006A5B5    je          0006A5D8
 0006A5B7    lea         edx,[ebp-4]
 0006A5BA    mov         eax,[000B56A4];^SInvalidTabPosition:TResStringRec
 0006A5BF    call        LoadResString
 0006A5C4    mov         ecx,dword ptr [ebp-4]
 0006A5C7    mov         dl,1
 0006A5C9    mov         eax,[0001EE64];EInvalidOperation
 0006A5CE    call        Exception.Create
 0006A5D3    call        @RaiseExcept
 0006A5D8    mov         byte ptr [ebx+20A],dl
 0006A5DE    cmp         byte ptr [ebx+1FC],0
>0006A5E5    jne         0006A5FA
 0006A5E7    cmp         dl,2
>0006A5EA    je          0006A5F1
 0006A5EC    cmp         dl,3
>0006A5EF    jne         0006A5FA
 0006A5F1    mov         dl,1
 0006A5F3    mov         eax,ebx
 0006A5F5    call        TCustomTabControl.InternalSetMultiLine
 0006A5FA    mov         eax,ebx
 0006A5FC    call        TWinControl.RecreateWnd
 0006A601    xor         eax,eax
 0006A603    pop         edx
 0006A604    pop         ecx
 0006A605    pop         ecx
 0006A606    mov         dword ptr fs:[eax],edx
 0006A609    push        6A61E
 0006A60E    lea         eax,[ebp-4]
 0006A611    call        @LStrClr
 0006A616    ret
>0006A617    jmp         @HandleFinally
>0006A61C    jmp         0006A60E
 0006A61E    pop         ebx
 0006A61F    pop         ecx
 0006A620    pop         ebp
 0006A621    ret
*}
end;

//0006A624
procedure TCustomTabControl.SetTabWidth(Value:Smallint);
begin
{*
 0006A624    push        ebp
 0006A625    mov         ebp,esp
 0006A627    add         esp,0FFFFFEF4
 0006A62D    push        ebx
 0006A62E    xor         ecx,ecx
 0006A630    mov         dword ptr [ebp-10C],ecx
 0006A636    mov         ebx,eax
 0006A638    xor         eax,eax
 0006A63A    push        ebp
 0006A63B    push        6A6DC
 0006A640    push        dword ptr fs:[eax]
 0006A643    mov         dword ptr fs:[eax],esp
 0006A646    cmp         dx,word ptr [ebx+210]
>0006A64D    je          0006A6C3
 0006A64F    test        dx,dx
>0006A652    jge         0006A69B
 0006A654    lea         edx,[ebp-108]
 0006A65A    mov         eax,dword ptr [ebx]
 0006A65C    call        TObject.ClassName
 0006A661    lea         eax,[ebp-108]
 0006A667    mov         dword ptr [ebp-8],eax
 0006A66A    mov         byte ptr [ebp-4],4
 0006A66E    lea         eax,[ebp-8]
 0006A671    push        eax
 0006A672    push        0
 0006A674    lea         edx,[ebp-10C]
 0006A67A    mov         eax,[000B5820];^SPropertyOutOfRange:TResStringRec
 0006A67F    call        LoadResString
 0006A684    mov         ecx,dword ptr [ebp-10C]
 0006A68A    mov         dl,1
 0006A68C    mov         eax,[0001EE64];EInvalidOperation
 0006A691    call        Exception.CreateFmt
 0006A696    call        @RaiseExcept
 0006A69B    mov         ax,word ptr [ebx+210]
 0006A6A2    mov         word ptr [ebx+210],dx
 0006A6A9    test        ax,ax
>0006A6AC    je          0006A6B3
 0006A6AE    test        dx,dx
>0006A6B1    jne         0006A6BC
 0006A6B3    mov         eax,ebx
 0006A6B5    call        TWinControl.RecreateWnd
>0006A6BA    jmp         0006A6C3
 0006A6BC    mov         eax,ebx
 0006A6BE    call        TCustomTabControl.UpdateTabSize
 0006A6C3    xor         eax,eax
 0006A6C5    pop         edx
 0006A6C6    pop         ecx
 0006A6C7    pop         ecx
 0006A6C8    mov         dword ptr fs:[eax],edx
 0006A6CB    push        6A6E3
 0006A6D0    lea         eax,[ebp-10C]
 0006A6D6    call        @LStrClr
 0006A6DB    ret
>0006A6DC    jmp         @HandleFinally
>0006A6E1    jmp         0006A6D0
 0006A6E3    pop         ebx
 0006A6E4    mov         esp,ebp
 0006A6E6    pop         ebp
 0006A6E7    ret
*}
end;

//0006A6E8
procedure TCustomTabControl.TabsChanged;
begin
{*
 0006A6E8    push        ebx
 0006A6E9    mov         ebx,eax
 0006A6EB    cmp         byte ptr [ebx+214],0
>0006A6F2    jne         0006A725
 0006A6F4    mov         eax,ebx
 0006A6F6    call        TWinControl.HandleAllocated
 0006A6FB    test        al,al
>0006A6FD    je          0006A71E
 0006A6FF    movzx       eax,word ptr [ebx+38]
 0006A703    movzx       edx,word ptr [ebx+3C]
 0006A707    shl         edx,10
 0006A70A    or          eax,edx
 0006A70C    push        eax
 0006A70D    push        0
 0006A70F    push        5
 0006A711    mov         eax,ebx
 0006A713    call        TWinControl.GetHandle
 0006A718    push        eax
 0006A719    call        user32.SendMessageA
 0006A71E    mov         eax,ebx
 0006A720    call        TWinControl.Realign
 0006A725    pop         ebx
 0006A726    ret
*}
end;

//0006A728
procedure TCustomTabControl.UpdateTabSize;
begin
{*
 0006A728    push        ebx
 0006A729    mov         ebx,eax
 0006A72B    mov         eax,dword ptr [ebx+210]
 0006A731    push        eax
 0006A732    push        0
 0006A734    push        1329
 0006A739    mov         eax,ebx
 0006A73B    call        TWinControl.GetHandle
 0006A740    push        eax
 0006A741    call        user32.SendMessageA
 0006A746    mov         eax,ebx
 0006A748    call        TCustomTabControl.TabsChanged
 0006A74D    pop         ebx
 0006A74E    ret
*}
end;

//0006A750
procedure TCustomTabControl.UpdateTabImages;
begin
{*
 0006A750    push        ebp
 0006A751    mov         ebp,esp
 0006A753    add         esp,0FFFFFFC4
 0006A756    push        ebx
 0006A757    push        esi
 0006A758    push        edi
 0006A759    xor         edx,edx
 0006A75B    mov         dword ptr [ebp-24],edx
 0006A75E    mov         dword ptr [ebp-38],edx
 0006A761    mov         dword ptr [ebp-3C],edx
 0006A764    mov         esi,eax
 0006A766    xor         eax,eax
 0006A768    push        ebp
 0006A769    push        6A83B
 0006A76E    push        dword ptr fs:[eax]
 0006A771    mov         dword ptr fs:[eax],esp
 0006A774    mov         dword ptr [ebp-20],2
 0006A77B    mov         eax,dword ptr [esi+20C]
 0006A781    mov         edx,dword ptr [eax]
 0006A783    call        dword ptr [edx+14]
 0006A786    dec         eax
 0006A787    test        eax,eax
>0006A789    jl          0006A811
 0006A78F    inc         eax
 0006A790    mov         dword ptr [ebp-4],eax
 0006A793    xor         ebx,ebx
 0006A795    mov         edx,ebx
 0006A797    mov         eax,esi
 0006A799    mov         ecx,dword ptr [eax]
 0006A79B    call        dword ptr [ecx+0C0]
 0006A7A1    mov         dword ptr [ebp-0C],eax
 0006A7A4    lea         eax,[ebp-20]
 0006A7A7    push        eax
 0006A7A8    push        ebx
 0006A7A9    push        1306
 0006A7AE    mov         eax,esi
 0006A7B0    call        TWinControl.GetHandle
 0006A7B5    push        eax
 0006A7B6    call        user32.SendMessageA
 0006A7BB    test        eax,eax
>0006A7BD    jne         0006A80B
 0006A7BF    lea         eax,[ebp-24]
 0006A7C2    push        eax
 0006A7C3    lea         ecx,[ebp-38]
 0006A7C6    mov         edx,ebx
 0006A7C8    mov         eax,dword ptr [esi+20C]
 0006A7CE    mov         edi,dword ptr [eax]
 0006A7D0    call        dword ptr [edi+0C]
 0006A7D3    mov         eax,dword ptr [ebp-38]
 0006A7D6    mov         dword ptr [ebp-34],eax
 0006A7D9    mov         byte ptr [ebp-30],0B
 0006A7DD    mov         dword ptr [ebp-2C],ebx
 0006A7E0    mov         byte ptr [ebp-28],0
 0006A7E4    lea         eax,[ebp-34]
 0006A7E7    push        eax
 0006A7E8    lea         edx,[ebp-3C]
 0006A7EB    mov         eax,[000B5AD0];^sTabFailSet:TResStringRec
 0006A7F0    call        LoadResString
 0006A7F5    mov         eax,dword ptr [ebp-3C]
 0006A7F8    mov         ecx,1
 0006A7FD    pop         edx
 0006A7FE    call        Format
 0006A803    mov         eax,dword ptr [ebp-24]
 0006A806    call        TabControlError
 0006A80B    inc         ebx
 0006A80C    dec         dword ptr [ebp-4]
>0006A80F    jne         0006A795
 0006A811    mov         eax,esi
 0006A813    call        TCustomTabControl.TabsChanged
 0006A818    xor         eax,eax
 0006A81A    pop         edx
 0006A81B    pop         ecx
 0006A81C    pop         ecx
 0006A81D    mov         dword ptr fs:[eax],edx
 0006A820    push        6A842
 0006A825    lea         eax,[ebp-3C]
 0006A828    mov         edx,2
 0006A82D    call        @LStrArrayClr
 0006A832    lea         eax,[ebp-24]
 0006A835    call        @LStrClr
 0006A83A    ret
>0006A83B    jmp         @HandleFinally
>0006A840    jmp         0006A825
 0006A842    pop         edi
 0006A843    pop         esi
 0006A844    pop         ebx
 0006A845    mov         esp,ebp
 0006A847    pop         ebp
 0006A848    ret
*}
end;

//0006A84C
procedure TCustomTabControl.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 0006A84C    push        ebx
 0006A84D    push        esi
 0006A84E    push        edi
 0006A84F    push        ebp
 0006A850    push        ecx
 0006A851    mov         edi,edx
 0006A853    mov         ebx,eax
 0006A855    mov         esi,dword ptr [edi+8]
 0006A858    mov         eax,dword ptr [esi+18]
 0006A85B    push        eax
 0006A85C    call        gdi32.SaveDC
 0006A861    mov         dword ptr [esp],eax
 0006A864    mov         edx,dword ptr [esi+18]
 0006A867    mov         eax,dword ptr [ebx+1EC]
 0006A86D    call        TCanvas.SetHandle
 0006A872    mov         edx,dword ptr [ebx+58]
 0006A875    mov         eax,dword ptr [ebx+1EC]
 0006A87B    call        TCanvas.SetFont
 0006A880    mov         edx,dword ptr [ebx+124]
 0006A886    mov         eax,dword ptr [ebx+1EC]
 0006A88C    call        TCanvas.SetBrush
 0006A891    test        byte ptr [esi+10],1
 0006A895    setne       al
 0006A898    push        eax
 0006A899    lea         ecx,[esi+1C]
 0006A89C    mov         edx,dword ptr [esi+8]
 0006A89F    mov         eax,ebx
 0006A8A1    mov         ebp,dword ptr [eax]
 0006A8A3    call        dword ptr [ebp+0BC]
 0006A8A9    xor         edx,edx
 0006A8AB    mov         eax,dword ptr [ebx+1EC]
 0006A8B1    call        TCanvas.SetHandle
 0006A8B6    mov         eax,dword ptr [esp]
 0006A8B9    push        eax
 0006A8BA    mov         eax,dword ptr [esi+18]
 0006A8BD    push        eax
 0006A8BE    call        gdi32.RestoreDC
 0006A8C3    mov         dword ptr [edi+0C],1
 0006A8CA    pop         edx
 0006A8CB    pop         ebp
 0006A8CC    pop         edi
 0006A8CD    pop         esi
 0006A8CE    pop         ebx
 0006A8CF    ret
*}
end;

//0006A8D0
procedure TCustomTabControl.WMDestroy(var Message:TWMDestroy);
begin
{*
 0006A8D0    push        ebx
 0006A8D1    push        esi
 0006A8D2    push        edi
 0006A8D3    mov         edi,edx
 0006A8D5    mov         ebx,eax
 0006A8D7    call        user32.GetFocus
 0006A8DC    mov         esi,eax
 0006A8DE    test        esi,esi
>0006A8E0    je          0006A906
 0006A8E2    mov         eax,ebx
 0006A8E4    call        TWinControl.GetHandle
 0006A8E9    cmp         esi,eax
>0006A8EB    je          0006A8FF
 0006A8ED    push        esi
 0006A8EE    mov         eax,ebx
 0006A8F0    call        TWinControl.GetHandle
 0006A8F5    push        eax
 0006A8F6    call        user32.IsChild
 0006A8FB    test        eax,eax
>0006A8FD    je          0006A906
 0006A8FF    push        0
 0006A901    call        user32.SetFocus
 0006A906    mov         edx,edi
 0006A908    mov         eax,ebx
 0006A90A    call        TWinControl.WMDestroy
 0006A90F    pop         edi
 0006A910    pop         esi
 0006A911    pop         ebx
 0006A912    ret
*}
end;

//0006A914
procedure TCoolBar.WMNotifyFormat(var Message:TMessage);
begin
{*
 0006A914    push        ebx
 0006A915    push        esi
 0006A916    mov         ebx,edx
 0006A918    mov         esi,eax
 0006A91A    mov         eax,dword ptr [ebx+8]
 0006A91D    push        eax
 0006A91E    mov         eax,dword ptr [ebx+4]
 0006A921    push        eax
 0006A922    mov         eax,dword ptr [ebx]
 0006A924    push        eax
 0006A925    mov         eax,esi
 0006A927    call        TWinControl.GetHandle
 0006A92C    push        eax
 0006A92D    call        user32.DefWindowProcA
 0006A932    mov         dword ptr [ebx+0C],eax
 0006A935    pop         esi
 0006A936    pop         ebx
 0006A937    ret
*}
end;

//0006A938
procedure TCustomTabControl.WMSize(var Message:TMessage);
begin
{*
 0006A938    push        ebx
 0006A939    mov         ebx,eax
 0006A93B    mov         eax,ebx
 0006A93D    call        TWinControl.WMSize
 0006A942    push        5
 0006A944    push        0
 0006A946    push        0
 0006A948    mov         eax,ebx
 0006A94A    call        TWinControl.GetHandle
 0006A94F    push        eax
 0006A950    call        user32.RedrawWindow
 0006A955    pop         ebx
 0006A956    ret
*}
end;

//0006A958
procedure TCustomTabControl.CMFontChanged(var Message:void );
begin
{*
 0006A958    push        ebx
 0006A959    mov         ebx,eax
 0006A95B    mov         eax,ebx
 0006A95D    call        TWinControl.CMFontChanged
 0006A962    mov         eax,ebx
 0006A964    call        TWinControl.HandleAllocated
 0006A969    test        al,al
>0006A96B    je          0006A97D
 0006A96D    push        0
 0006A96F    xor         ecx,ecx
 0006A971    mov         edx,5
 0006A976    mov         eax,ebx
 0006A978    call        TControl.Perform
 0006A97D    pop         ebx
 0006A97E    ret
*}
end;

//0006A980
procedure TCoolBar.CMSysColorChange(var Message:TMessage);
begin
{*
 0006A980    push        ebx
 0006A981    push        esi
 0006A982    mov         esi,edx
 0006A984    mov         ebx,eax
 0006A986    mov         edx,esi
 0006A988    mov         eax,ebx
 0006A98A    call        TWinControl.CMSysColorChange
 0006A98F    test        byte ptr [ebx+20],1
>0006A993    jne         0006A9A4
 0006A995    mov         dword ptr [esi],15
 0006A99B    mov         edx,esi
 0006A99D    mov         eax,ebx
 0006A99F    mov         ecx,dword ptr [eax]
 0006A9A1    call        dword ptr [ecx-10]
 0006A9A4    pop         esi
 0006A9A5    pop         ebx
 0006A9A6    ret
*}
end;

//0006A9A8
procedure TCustomTabControl.CMTabStopChanged(var Message:TMessage);
begin
{*
 0006A9A8    test        byte ptr [eax+20],10
>0006A9AC    jne         0006A9B3
 0006A9AE    call        TWinControl.RecreateWnd
 0006A9B3    ret
*}
end;

//0006A9B4
procedure TCustomTabControl.CNNotify(var Message:TWMNotify);
begin
{*
 0006A9B4    push        ebx
 0006A9B5    push        esi
 0006A9B6    push        edi
 0006A9B7    mov         edi,edx
 0006A9B9    mov         esi,eax
 0006A9BB    mov         eax,dword ptr [edi+8]
 0006A9BE    mov         eax,dword ptr [eax+8]
 0006A9C1    sub         eax,0FFFFFDD8
>0006A9C6    je          0006A9D8
 0006A9C8    dec         eax
>0006A9C9    jne         0006A9F3
 0006A9CB    mov         eax,esi
 0006A9CD    mov         bx,0FFB7
 0006A9D1    call        @CallDynaInst
>0006A9D6    jmp         0006A9F3
 0006A9D8    mov         dword ptr [edi+0C],1
 0006A9DF    mov         eax,esi
 0006A9E1    mov         bx,0FFB8
 0006A9E5    call        @CallDynaInst
 0006A9EA    test        al,al
>0006A9EC    je          0006A9F3
 0006A9EE    xor         eax,eax
 0006A9F0    mov         dword ptr [edi+0C],eax
 0006A9F3    pop         edi
 0006A9F4    pop         esi
 0006A9F5    pop         ebx
 0006A9F6    ret
*}
end;

//0006A9F8
procedure TCustomTabControl.CMDialogChar(Message:TWMKey);
begin
{*
 0006A9F8    push        ebp
 0006A9F9    mov         ebp,esp
 0006A9FB    add         esp,0FFFFFFF4
 0006A9FE    push        ebx
 0006A9FF    push        esi
 0006AA00    push        edi
 0006AA01    xor         ecx,ecx
 0006AA03    mov         dword ptr [ebp-0C],ecx
 0006AA06    mov         dword ptr [ebp-4],edx
 0006AA09    mov         esi,eax
 0006AA0B    xor         eax,eax
 0006AA0D    push        ebp
 0006AA0E    push        6AAC2
 0006AA13    push        dword ptr fs:[eax]
 0006AA16    mov         dword ptr fs:[eax],esp
 0006AA19    mov         eax,dword ptr [esi+20C];TCustomTabControl.FTabs:TStrings
 0006AA1F    mov         edx,dword ptr [eax]
 0006AA21    call        dword ptr [edx+14];TStrings.GetCount
 0006AA24    dec         eax
 0006AA25    test        eax,eax
>0006AA27    jl          0006AAA2
 0006AA29    inc         eax
 0006AA2A    mov         dword ptr [ebp-8],eax
 0006AA2D    xor         edi,edi
 0006AA2F    lea         ecx,[ebp-0C]
 0006AA32    mov         edx,edi
 0006AA34    mov         eax,dword ptr [esi+20C];TCustomTabControl.FTabs:TStrings
 0006AA3A    mov         ebx,dword ptr [eax]
 0006AA3C    call        dword ptr [ebx+0C];TStrings.Get
 0006AA3F    mov         edx,dword ptr [ebp-0C]
 0006AA42    mov         eax,dword ptr [ebp-4]
 0006AA45    mov         ax,word ptr [eax+4]
 0006AA49    call        IsAccel
 0006AA4E    test        al,al
>0006AA50    je          0006AA9C
 0006AA52    mov         edx,edi
 0006AA54    mov         eax,esi
 0006AA56    mov         ecx,dword ptr [eax]
 0006AA58    call        dword ptr [ecx+0B8];TCustomTabControl.sub_00069FB8
 0006AA5E    test        al,al
>0006AA60    je          0006AA9C
 0006AA62    mov         eax,esi
 0006AA64    call        TWinControl.CanFocus
 0006AA69    test        al,al
>0006AA6B    je          0006AA9C
 0006AA6D    mov         eax,dword ptr [ebp-4]
 0006AA70    mov         dword ptr [eax+0C],1
 0006AA77    mov         eax,esi
 0006AA79    mov         bx,0FFB8
 0006AA7D    call        @CallDynaInst;TCustomTabControl.CanChange
 0006AA82    test        al,al
>0006AA84    je          0006AAAC
 0006AA86    mov         edx,edi
 0006AA88    mov         eax,esi
 0006AA8A    call        TCustomTabControl.SetTabIndex
 0006AA8F    mov         eax,esi
 0006AA91    mov         bx,0FFB7
 0006AA95    call        @CallDynaInst;TCustomTabControl.Change
>0006AA9A    jmp         0006AAAC
 0006AA9C    inc         edi
 0006AA9D    dec         dword ptr [ebp-8]
>0006AAA0    jne         0006AA2F
 0006AAA2    mov         edx,dword ptr [ebp-4]
 0006AAA5    mov         eax,esi
 0006AAA7    call        TWinControl.CMDialogChar
 0006AAAC    xor         eax,eax
 0006AAAE    pop         edx
 0006AAAF    pop         ecx
 0006AAB0    pop         ecx
 0006AAB1    mov         dword ptr fs:[eax],edx
 0006AAB4    push        6AAC9
 0006AAB9    lea         eax,[ebp-0C]
 0006AABC    call        @LStrClr
 0006AAC1    ret
>0006AAC2    jmp         @HandleFinally
>0006AAC7    jmp         0006AAB9
 0006AAC9    pop         edi
 0006AACA    pop         esi
 0006AACB    pop         ebx
 0006AACC    mov         esp,ebp
 0006AACE    pop         ebp
 0006AACF    ret
*}
end;

//0006AAD0
procedure TCustomTabControl.AdjustClientRect(var Rect:TRect);
begin
{*
 0006AAD0    push        ebx
 0006AAD1    push        esi
 0006AAD2    push        edi
 0006AAD3    add         esp,0FFFFFFF0
 0006AAD6    mov         esi,edx
 0006AAD8    mov         ebx,eax
 0006AADA    mov         edx,esp
 0006AADC    mov         eax,ebx
 0006AADE    call        TCustomTabControl.GetDisplayRect
 0006AAE3    push        esi
 0006AAE4    mov         edi,esi
 0006AAE6    lea         esi,[esp+4]
 0006AAEA    mov         ecx,4
 0006AAEF    rep movs    dword ptr [edi],dword ptr [esi]
 0006AAF1    pop         esi
 0006AAF2    mov         edx,esi
 0006AAF4    mov         eax,ebx
 0006AAF6    call        TWinControl.AdjustClientRect
 0006AAFB    add         esp,10
 0006AAFE    pop         edi
 0006AAFF    pop         esi
 0006AB00    pop         ebx
 0006AB01    ret
*}
end;

//0006AB04
constructor TTabSheet.Create(AOwner:TComponent);
begin
{*
 0006AB04    push        ebx
 0006AB05    push        esi
 0006AB06    test        dl,dl
>0006AB08    je          0006AB12
 0006AB0A    add         esp,0FFFFFFF0
 0006AB0D    call        @ClassCreate
 0006AB12    mov         ebx,edx
 0006AB14    mov         esi,eax
 0006AB16    xor         edx,edx
 0006AB18    mov         eax,esi
 0006AB1A    call        TWinControl.Create
 0006AB1F    mov         dl,5
 0006AB21    mov         eax,esi
 0006AB23    call        TControl.SetAlign
 0006AB28    mov         eax,[0006AB60]
 0006AB2D    or          eax,dword ptr [esi+40]
 0006AB30    mov         dword ptr [esi+40],eax
 0006AB33    xor         edx,edx
 0006AB35    mov         eax,esi
 0006AB37    call        TControl.SetVisible
 0006AB3C    mov         byte ptr [esi+1F4],1
 0006AB43    mov         eax,esi
 0006AB45    test        bl,bl
>0006AB47    je          0006AB58
 0006AB49    call        @AfterConstruction
 0006AB4E    pop         dword ptr fs:[0]
 0006AB55    add         esp,0C
 0006AB58    mov         eax,esi
 0006AB5A    pop         esi
 0006AB5B    pop         ebx
 0006AB5C    ret
*}
end;

//0006AB64
destructor TTabSheet.Destroy;
begin
{*
 0006AB64    push        ebx
 0006AB65    push        esi
 0006AB66    call        @BeforeDestruction
 0006AB6B    mov         ebx,edx
 0006AB6D    mov         esi,eax
 0006AB6F    mov         eax,dword ptr [esi+1F0]
 0006AB75    test        eax,eax
>0006AB77    je          0006AB96
 0006AB79    cmp         esi,dword ptr [eax+244]
>0006AB7F    jne         0006AB89
 0006AB81    xor         edx,edx
 0006AB83    mov         dword ptr [eax+244],edx
 0006AB89    mov         edx,esi
 0006AB8B    mov         eax,dword ptr [esi+1F0]
 0006AB91    call        TPageControl.RemovePage
 0006AB96    mov         edx,ebx
 0006AB98    and         dl,0FC
 0006AB9B    mov         eax,esi
 0006AB9D    call        TWinControl.Destroy
 0006ABA2    test        bl,bl
>0006ABA4    jle         0006ABAD
 0006ABA6    mov         eax,esi
 0006ABA8    call        @ClassDestroy
 0006ABAD    pop         esi
 0006ABAE    pop         ebx
 0006ABAF    ret
*}
end;

//0006ABB0
procedure TTabSheet.DoHide;
begin
{*
 0006ABB0    push        ebx
 0006ABB1    cmp         word ptr [eax+1FA],0
>0006ABB9    je          0006ABCB
 0006ABBB    mov         ebx,eax
 0006ABBD    mov         edx,eax
 0006ABBF    mov         eax,dword ptr [ebx+1FC]
 0006ABC5    call        dword ptr [ebx+1F8]
 0006ABCB    pop         ebx
 0006ABCC    ret
*}
end;

//0006ABD0
procedure TTabSheet.DoShow;
begin
{*
 0006ABD0    push        ebx
 0006ABD1    cmp         word ptr [eax+202],0
>0006ABD9    je          0006ABEB
 0006ABDB    mov         ebx,eax
 0006ABDD    mov         edx,eax
 0006ABDF    mov         eax,dword ptr [ebx+204]
 0006ABE5    call        dword ptr [ebx+200]
 0006ABEB    pop         ebx
 0006ABEC    ret
*}
end;

//0006ABF0
function TTabSheet.GetPageIndex:Integer;
begin
{*
 0006ABF0    mov         edx,dword ptr [eax+1F0]
 0006ABF6    test        edx,edx
>0006ABF8    je          0006AC07
 0006ABFA    mov         edx,dword ptr [edx+238]
 0006AC00    xchg        eax,edx
 0006AC01    call        TList.IndexOf
 0006AC06    ret
 0006AC07    or          eax,0FFFFFFFF
 0006AC0A    ret
*}
end;

//0006AC0C
function TTabSheet.GetTabIndex:Integer;
begin
{*
 0006AC0C    push        ebx
 0006AC0D    push        esi
 0006AC0E    push        edi
 0006AC0F    push        ebp
 0006AC10    mov         esi,eax
 0006AC12    xor         ebp,ebp
 0006AC14    cmp         byte ptr [esi+1F5],0
>0006AC1B    jne         0006AC20
 0006AC1D    dec         ebp
>0006AC1E    jmp         0006AC52
 0006AC20    mov         eax,esi
 0006AC22    call        TTabSheet.GetPageIndex
 0006AC27    mov         ebx,eax
 0006AC29    dec         ebx
 0006AC2A    test        ebx,ebx
>0006AC2C    jl          0006AC52
 0006AC2E    inc         ebx
 0006AC2F    xor         edi,edi
 0006AC31    mov         eax,dword ptr [esi+1F0]
 0006AC37    mov         eax,dword ptr [eax+238]
 0006AC3D    mov         edx,edi
 0006AC3F    call        TList.Get
 0006AC44    cmp         byte ptr [eax+1F5],0
>0006AC4B    je          0006AC4E
 0006AC4D    inc         ebp
 0006AC4E    inc         edi
 0006AC4F    dec         ebx
>0006AC50    jne         0006AC31
 0006AC52    mov         eax,ebp
 0006AC54    pop         ebp
 0006AC55    pop         edi
 0006AC56    pop         esi
 0006AC57    pop         ebx
 0006AC58    ret
*}
end;

//0006AC5C
procedure TTabSheet.CreateParams(var Params:TCreateParams);
begin
{*
 0006AC5C    push        ebx
 0006AC5D    mov         ebx,edx
 0006AC5F    mov         edx,ebx
 0006AC61    call        TWinControl.CreateParams
 0006AC66    and         dword ptr [ebx+24],0FFFFFFFC
 0006AC6A    pop         ebx
 0006AC6B    ret
*}
end;

//0006AC6C
procedure TTabSheet.ReadState(Reader:TReader);
begin
{*
 0006AC6C    push        ebx
 0006AC6D    push        esi
 0006AC6E    push        edi
 0006AC6F    mov         esi,edx
 0006AC71    mov         ebx,eax
 0006AC73    mov         edx,esi
 0006AC75    mov         eax,ebx
 0006AC77    call        TWinControl.ReadState
 0006AC7C    mov         edi,dword ptr [esi+28]
 0006AC7F    mov         eax,edi
 0006AC81    mov         edx,dword ptr ds:[663EC];TPageControl
 0006AC87    call        @IsClass
 0006AC8C    test        al,al
>0006AC8E    je          0006AC99
 0006AC90    mov         edx,edi
 0006AC92    mov         eax,ebx
 0006AC94    call        TTabSheet.SetPageControl
 0006AC99    pop         edi
 0006AC9A    pop         esi
 0006AC9B    pop         ebx
 0006AC9C    ret
*}
end;

//0006ACA0
procedure TTabSheet.SetImageIndex(Value:Integer);
begin
{*
 0006ACA0    cmp         edx,dword ptr [eax+1EC]
>0006ACA6    je          0006ACC4
 0006ACA8    mov         dword ptr [eax+1EC],edx
 0006ACAE    cmp         byte ptr [eax+1F5],0
>0006ACB5    je          0006ACC4
 0006ACB7    mov         edx,eax
 0006ACB9    mov         eax,dword ptr [eax+1F0]
 0006ACBF    call        TPageControl.UpdateTab
 0006ACC4    ret
*}
end;

//0006ACC8
procedure TTabSheet.SetPageControl(APageControl:TPageControl);
begin
{*
 0006ACC8    push        ebx
 0006ACC9    push        esi
 0006ACCA    mov         esi,edx
 0006ACCC    mov         ebx,eax
 0006ACCE    mov         eax,dword ptr [ebx+1F0]
 0006ACD4    cmp         esi,eax
>0006ACD6    je          0006ACF9
 0006ACD8    test        eax,eax
>0006ACDA    je          0006ACE3
 0006ACDC    mov         edx,ebx
 0006ACDE    call        TPageControl.RemovePage
 0006ACE3    mov         edx,esi
 0006ACE5    mov         eax,ebx
 0006ACE7    mov         ecx,dword ptr [eax]
 0006ACE9    call        dword ptr [ecx+64]
 0006ACEC    test        esi,esi
>0006ACEE    je          0006ACF9
 0006ACF0    mov         edx,ebx
 0006ACF2    mov         eax,esi
 0006ACF4    call        TPageControl.InsertPage
 0006ACF9    pop         esi
 0006ACFA    pop         ebx
 0006ACFB    ret
*}
end;

//0006ACFC
procedure TTabSheet.SetPageIndex(Value:Integer);
begin
{*
 0006ACFC    push        ebp
 0006ACFD    mov         ebp,esp
 0006ACFF    add         esp,0FFFFFFEC
 0006AD02    push        ebx
 0006AD03    push        esi
 0006AD04    push        edi
 0006AD05    xor         ecx,ecx
 0006AD07    mov         dword ptr [ebp-14],ecx
 0006AD0A    mov         esi,edx
 0006AD0C    mov         ebx,eax
 0006AD0E    xor         eax,eax
 0006AD10    push        ebp
 0006AD11    push        6ADC2
 0006AD16    push        dword ptr fs:[eax]
 0006AD19    mov         dword ptr fs:[eax],esp
 0006AD1C    mov         eax,dword ptr [ebx+1F0]
 0006AD22    test        eax,eax
>0006AD24    je          0006ADAC
 0006AD2A    mov         eax,dword ptr [eax+238]
 0006AD30    mov         edi,dword ptr [eax+8]
 0006AD33    dec         edi
 0006AD34    cmp         edi,esi
>0006AD36    jge         0006AD6D
 0006AD38    mov         dword ptr [ebp-10],esi
 0006AD3B    mov         byte ptr [ebp-0C],0
 0006AD3F    mov         dword ptr [ebp-8],edi
 0006AD42    mov         byte ptr [ebp-4],0
 0006AD46    lea         eax,[ebp-10]
 0006AD49    push        eax
 0006AD4A    push        1
 0006AD4C    lea         edx,[ebp-14]
 0006AD4F    mov         eax,[000B5714];^sPageIndexError:TResStringRec
 0006AD54    call        LoadResString
 0006AD59    mov         ecx,dword ptr [ebp-14]
 0006AD5C    mov         dl,1
 0006AD5E    mov         eax,[0001EC9C];EListError
 0006AD63    call        Exception.CreateFmt
 0006AD68    call        @RaiseExcept
 0006AD6D    mov         eax,ebx
 0006AD6F    call        TTabSheet.GetTabIndex
 0006AD74    mov         edi,eax
 0006AD76    mov         eax,ebx
 0006AD78    call        TTabSheet.GetPageIndex
 0006AD7D    mov         edx,eax
 0006AD7F    mov         eax,dword ptr [ebx+1F0]
 0006AD85    mov         eax,dword ptr [eax+238]
 0006AD8B    mov         ecx,esi
 0006AD8D    call        TList.Move
 0006AD92    test        edi,edi
>0006AD94    jl          0006ADAC
 0006AD96    mov         eax,ebx
 0006AD98    call        TTabSheet.GetTabIndex
 0006AD9D    mov         ecx,eax
 0006AD9F    mov         edx,edi
 0006ADA1    mov         eax,dword ptr [ebx+1F0]
 0006ADA7    call        TPageControl.MoveTab
 0006ADAC    xor         eax,eax
 0006ADAE    pop         edx
 0006ADAF    pop         ecx
 0006ADB0    pop         ecx
 0006ADB1    mov         dword ptr fs:[eax],edx
 0006ADB4    push        6ADC9
 0006ADB9    lea         eax,[ebp-14]
 0006ADBC    call        @LStrClr
 0006ADC1    ret
>0006ADC2    jmp         @HandleFinally
>0006ADC7    jmp         0006ADB9
 0006ADC9    pop         edi
 0006ADCA    pop         esi
 0006ADCB    pop         ebx
 0006ADCC    mov         esp,ebp
 0006ADCE    pop         ebp
 0006ADCF    ret
*}
end;

//0006ADD0
procedure TTabSheet.SetTabShowing(Value:Boolean);
begin
{*
 0006ADD0    push        ebx
 0006ADD1    mov         ebx,eax
 0006ADD3    cmp         dl,byte ptr [ebx+1F5]
>0006ADD9    je          0006AE12
 0006ADDB    test        dl,dl
>0006ADDD    je          0006ADF5
 0006ADDF    mov         byte ptr [ebx+1F5],1
 0006ADE6    mov         edx,ebx
 0006ADE8    mov         eax,dword ptr [ebx+1F0]
 0006ADEE    call        TPageControl.InsertTab
>0006ADF3    jmp         0006AE12
 0006ADF5    mov         eax,ebx
 0006ADF7    call        TTabSheet.GetTabIndex
 0006ADFC    mov         byte ptr [ebx+1F5],0
 0006AE03    mov         ecx,eax
 0006AE05    mov         edx,ebx
 0006AE07    mov         eax,dword ptr [ebx+1F0]
 0006AE0D    call        TPageControl.DeleteTab
 0006AE12    pop         ebx
 0006AE13    ret
*}
end;

//0006AE14
procedure TTabSheet.SetTabVisible(Value:Boolean);
begin
{*
 0006AE14    cmp         dl,byte ptr [eax+1F4]
>0006AE1A    je          0006AE27
 0006AE1C    mov         byte ptr [eax+1F4],dl
 0006AE22    call        TTabSheet.UpdateTabShowing
 0006AE27    ret
*}
end;

//0006AE28
procedure TTabSheet.UpdateTabShowing;
begin
{*
 0006AE28    cmp         dword ptr [eax+1F0],0
>0006AE2F    je          0006AE40
 0006AE31    cmp         byte ptr [eax+1F4],0
>0006AE38    jne         0006AE44
 0006AE3A    test        byte ptr [eax+20],10
>0006AE3E    jne         0006AE44
 0006AE40    xor         edx,edx
>0006AE42    jmp         0006AE46
 0006AE44    mov         dl,1
 0006AE46    call        TTabSheet.SetTabShowing
 0006AE4B    ret
*}
end;

//0006AE4C
procedure TTabSheet.CMTextChanged(var Message:TMessage);
begin
{*
 0006AE4C    cmp         byte ptr [eax+1F5],0
>0006AE53    je          0006AE62
 0006AE55    mov         edx,eax
 0006AE57    mov         eax,dword ptr [eax+1F0]
 0006AE5D    call        TPageControl.UpdateTab
 0006AE62    ret
*}
end;

//0006AE64
procedure TTabSheet.CMShowingChanged(var Message:TMessage);
begin
{*
 0006AE64    push        ebp
 0006AE65    mov         ebp,esp
 0006AE67    push        ecx
 0006AE68    push        ebx
 0006AE69    push        esi
 0006AE6A    push        edi
 0006AE6B    mov         dword ptr [ebp-4],eax
 0006AE6E    mov         eax,dword ptr [ebp-4]
 0006AE71    call        TWinControl.CMShowingChanged
 0006AE76    mov         eax,dword ptr [ebp-4]
 0006AE79    mov         al,byte ptr [eax+16C]
 0006AE7F    test        al,al
>0006AE81    je          0006AEC2
 0006AE83    xor         eax,eax
 0006AE85    push        ebp
 0006AE86    push        6AEA7
 0006AE8B    push        dword ptr fs:[eax]
 0006AE8E    mov         dword ptr fs:[eax],esp
 0006AE91    mov         eax,dword ptr [ebp-4]
 0006AE94    mov         bx,0FFB7
 0006AE98    call        @CallDynaInst
 0006AE9D    xor         eax,eax
 0006AE9F    pop         edx
 0006AEA0    pop         ecx
 0006AEA1    pop         ecx
 0006AEA2    mov         dword ptr fs:[eax],edx
>0006AEA5    jmp         0006AF03
>0006AEA7    jmp         @HandleAnyException
 0006AEAC    mov         eax,[000B59E8];^Application:TApplication
 0006AEB1    mov         eax,dword ptr [eax]
 0006AEB3    mov         edx,dword ptr [ebp-4]
 0006AEB6    call        TApplication.HandleException
 0006AEBB    call        @DoneExcept
>0006AEC0    jmp         0006AF03
 0006AEC2    test        al,al
>0006AEC4    jne         0006AF03
 0006AEC6    xor         eax,eax
 0006AEC8    push        ebp
 0006AEC9    push        6AEEA
 0006AECE    push        dword ptr fs:[eax]
 0006AED1    mov         dword ptr fs:[eax],esp
 0006AED4    mov         eax,dword ptr [ebp-4]
 0006AED7    mov         bx,0FFB8
 0006AEDB    call        @CallDynaInst
 0006AEE0    xor         eax,eax
 0006AEE2    pop         edx
 0006AEE3    pop         ecx
 0006AEE4    pop         ecx
 0006AEE5    mov         dword ptr fs:[eax],edx
>0006AEE8    jmp         0006AF03
>0006AEEA    jmp         @HandleAnyException
 0006AEEF    mov         eax,[000B59E8];^Application:TApplication
 0006AEF4    mov         eax,dword ptr [eax]
 0006AEF6    mov         edx,dword ptr [ebp-4]
 0006AEF9    call        TApplication.HandleException
 0006AEFE    call        @DoneExcept
 0006AF03    pop         edi
 0006AF04    pop         esi
 0006AF05    pop         ebx
 0006AF06    pop         ecx
 0006AF07    pop         ebp
 0006AF08    ret
*}
end;

//0006AF0C
constructor TPageControl.Create(AOwner:TComponent);
begin
{*
 0006AF0C    push        ebx
 0006AF0D    push        esi
 0006AF0E    test        dl,dl
>0006AF10    je          0006AF1A
 0006AF12    add         esp,0FFFFFFF0
 0006AF15    call        @ClassCreate
 0006AF1A    mov         ebx,edx
 0006AF1C    mov         esi,eax
 0006AF1E    xor         edx,edx
 0006AF20    mov         eax,esi
 0006AF22    call        TCustomTabControl.Create
 0006AF27    mov         eax,[0006AF5C]
 0006AF2C    mov         dword ptr [esi+40],eax
 0006AF2F    mov         dl,1
 0006AF31    mov         eax,[0001EEC4];TList
 0006AF36    call        TObject.Create
 0006AF3B    mov         dword ptr [esi+238],eax
 0006AF41    mov         eax,esi
 0006AF43    test        bl,bl
>0006AF45    je          0006AF56
 0006AF47    call        @AfterConstruction
 0006AF4C    pop         dword ptr fs:[0]
 0006AF53    add         esp,0C
 0006AF56    mov         eax,esi
 0006AF58    pop         esi
 0006AF59    pop         ebx
 0006AF5A    ret
*}
end;

//0006AF60
destructor TPageControl.Destroy;
begin
{*
 0006AF60    push        ebx
 0006AF61    push        esi
 0006AF62    push        edi
 0006AF63    push        ebp
 0006AF64    call        @BeforeDestruction
 0006AF69    mov         ebx,edx
 0006AF6B    mov         esi,eax
 0006AF6D    mov         eax,dword ptr [esi+238]
 0006AF73    mov         ebp,dword ptr [eax+8]
 0006AF76    dec         ebp
 0006AF77    test        ebp,ebp
>0006AF79    jl          0006AF97
 0006AF7B    inc         ebp
 0006AF7C    xor         edi,edi
 0006AF7E    mov         edx,edi
 0006AF80    mov         eax,dword ptr [esi+238]
 0006AF86    call        TList.Get
 0006AF8B    xor         edx,edx
 0006AF8D    mov         dword ptr [eax+1F0],edx
 0006AF93    inc         edi
 0006AF94    dec         ebp
>0006AF95    jne         0006AF7E
 0006AF97    mov         eax,dword ptr [esi+238]
 0006AF9D    call        TObject.Free
 0006AFA2    mov         edx,ebx
 0006AFA4    and         dl,0FC
 0006AFA7    mov         eax,esi
 0006AFA9    call        TCustomTabControl.Destroy
 0006AFAE    test        bl,bl
>0006AFB0    jle         0006AFB9
 0006AFB2    mov         eax,esi
 0006AFB4    call        @ClassDestroy
 0006AFB9    pop         ebp
 0006AFBA    pop         edi
 0006AFBB    pop         esi
 0006AFBC    pop         ebx
 0006AFBD    ret
*}
end;

//0006AFC0
function TPageControl.CanShowTab(TabIndex:Integer):Boolean;
begin
{*
 0006AFC0    push        ebx
 0006AFC1    push        esi
 0006AFC2    mov         esi,edx
 0006AFC4    mov         ebx,eax
 0006AFC6    mov         edx,esi
 0006AFC8    mov         eax,dword ptr [ebx+238]
 0006AFCE    call        TList.Get
 0006AFD3    mov         edx,dword ptr [eax]
 0006AFD5    call        dword ptr [edx+50]
 0006AFD8    pop         esi
 0006AFD9    pop         ebx
 0006AFDA    ret
*}
end;

//0006AFDC
procedure TPageControl.Change;
begin
{*
 0006AFDC    push        ebx
 0006AFDD    mov         ebx,eax
 0006AFDF    mov         eax,ebx
 0006AFE1    call        TPageControl.UpdateActivePage
 0006AFE6    test        byte ptr [ebx+20],10
>0006AFEA    je          0006B00B
 0006AFEC    mov         eax,ebx
 0006AFEE    call        GetParentForm
 0006AFF3    test        eax,eax
>0006AFF5    je          0006B00B
 0006AFF7    cmp         dword ptr [eax+230],0
>0006AFFE    je          0006B00B
 0006B000    mov         eax,dword ptr [eax+230]
 0006B006    mov         edx,dword ptr [eax]
 0006B008    call        dword ptr [edx+0C]
 0006B00B    mov         eax,ebx
 0006B00D    call        TCustomTabControl.Change
 0006B012    pop         ebx
 0006B013    ret
*}
end;

//0006B014
procedure TPageControl.ChangeActivePage(Page:TTabSheet);
begin
{*
 0006B014    push        ebx
 0006B015    push        esi
 0006B016    push        edi
 0006B017    push        ebp
 0006B018    mov         edi,edx
 0006B01A    mov         ebx,eax
 0006B01C    cmp         edi,dword ptr [ebx+23C]
>0006B022    je          0006B10E
 0006B028    mov         eax,ebx
 0006B02A    call        GetParentForm
 0006B02F    mov         esi,eax
 0006B031    test        esi,esi
>0006B033    je          0006B083
 0006B035    cmp         dword ptr [ebx+23C],0
>0006B03C    je          0006B083
 0006B03E    mov         edx,dword ptr [esi+200]
 0006B044    mov         eax,dword ptr [ebx+23C]
 0006B04A    call        TWinControl.ContainsControl
 0006B04F    test        al,al
>0006B051    je          0006B083
 0006B053    mov         edx,dword ptr [ebx+23C]
 0006B059    mov         eax,esi
 0006B05B    call        TCustomForm.SetActiveControl
 0006B060    mov         ebp,dword ptr [ebx+23C]
 0006B066    cmp         ebp,dword ptr [esi+200]
>0006B06C    je          0006B083
 0006B06E    mov         eax,ebp
 0006B070    call        TTabSheet.GetTabIndex
 0006B075    mov         edx,eax
 0006B077    mov         eax,ebx
 0006B079    call        TCustomTabControl.SetTabIndex
>0006B07E    jmp         0006B10E
 0006B083    test        edi,edi
>0006B085    je          0006B0D1
 0006B087    mov         eax,edi
 0006B089    call        TControl.BringToFront
 0006B08E    mov         dl,1
 0006B090    mov         eax,edi
 0006B092    call        TControl.SetVisible
 0006B097    test        esi,esi
>0006B099    je          0006B0D1
 0006B09B    cmp         dword ptr [ebx+23C],0
>0006B0A2    je          0006B0D1
 0006B0A4    mov         eax,dword ptr [esi+200]
 0006B0AA    cmp         eax,dword ptr [ebx+23C]
>0006B0B0    jne         0006B0D1
 0006B0B2    mov         eax,edi
 0006B0B4    call        TWinControl.CanFocus
 0006B0B9    test        al,al
>0006B0BB    je          0006B0C8
 0006B0BD    mov         edx,edi
 0006B0BF    mov         eax,esi
 0006B0C1    call        TCustomForm.SetActiveControl
>0006B0C6    jmp         0006B0D1
 0006B0C8    mov         edx,ebx
 0006B0CA    mov         eax,esi
 0006B0CC    call        TCustomForm.SetActiveControl
 0006B0D1    mov         eax,dword ptr [ebx+23C]
 0006B0D7    test        eax,eax
>0006B0D9    je          0006B0E2
 0006B0DB    xor         edx,edx
 0006B0DD    call        TControl.SetVisible
 0006B0E2    mov         dword ptr [ebx+23C],edi
 0006B0E8    test        esi,esi
>0006B0EA    je          0006B10E
 0006B0EC    cmp         dword ptr [ebx+23C],0
>0006B0F3    je          0006B10E
 0006B0F5    mov         eax,dword ptr [esi+200]
 0006B0FB    cmp         eax,dword ptr [ebx+23C]
>0006B101    jne         0006B10E
 0006B103    mov         eax,dword ptr [ebx+23C]
 0006B109    call        TWinControl.SelectFirst
 0006B10E    pop         ebp
 0006B10F    pop         edi
 0006B110    pop         esi
 0006B111    pop         ebx
 0006B112    ret
*}
end;

//0006B114
procedure TPageControl.DeleteTab(Page:TTabSheet; Index:Integer);
begin
{*
 0006B114    push        ebx
 0006B115    push        esi
 0006B116    push        edi
 0006B117    mov         esi,ecx
 0006B119    mov         edi,eax
 0006B11B    cmp         edx,dword ptr [edi+23C]
 0006B121    sete        bl
 0006B124    mov         edx,esi
 0006B126    mov         eax,dword ptr [edi+20C]
 0006B12C    mov         ecx,dword ptr [eax]
 0006B12E    call        dword ptr [ecx+44]
 0006B131    test        bl,bl
>0006B133    je          0006B15B
 0006B135    mov         eax,dword ptr [edi+20C]
 0006B13B    mov         edx,dword ptr [eax]
 0006B13D    call        dword ptr [edx+14]
 0006B140    cmp         esi,eax
>0006B142    jl          0006B152
 0006B144    mov         eax,dword ptr [edi+20C]
 0006B14A    mov         edx,dword ptr [eax]
 0006B14C    call        dword ptr [edx+14]
 0006B14F    mov         esi,eax
 0006B151    dec         esi
 0006B152    mov         edx,esi
 0006B154    mov         eax,edi
 0006B156    call        TCustomTabControl.SetTabIndex
 0006B15B    mov         eax,edi
 0006B15D    call        TPageControl.UpdateActivePage
 0006B162    pop         edi
 0006B163    pop         esi
 0006B164    pop         ebx
 0006B165    ret
*}
end;

//0006B168
procedure TPageControl.DoAddDockClient(Client:TControl; const ARect:TRect);
begin
{*
 0006B168    mov         ecx,dword ptr [eax+240]
 0006B16E    test        ecx,ecx
>0006B170    je          0006B17A
 0006B172    mov         eax,ecx
 0006B174    xchg        eax,edx
 0006B175    mov         ecx,dword ptr [eax]
 0006B177    call        dword ptr [ecx+64]
 0006B17A    ret
*}
end;

//0006B17C
procedure TPageControl.DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 0006B17C    push        ebp
 0006B17D    mov         ebp,esp
 0006B17F    add         esp,0FFFFFFF0
 0006B182    push        ebx
 0006B183    push        esi
 0006B184    push        edi
 0006B185    mov         edi,ecx
 0006B187    mov         esi,edx
 0006B189    mov         ebx,eax
 0006B18B    lea         eax,[ebp-10]
 0006B18E    push        eax
 0006B18F    mov         eax,ebx
 0006B191    call        TWinControl.GetHandle
 0006B196    push        eax
 0006B197    call        user32.GetWindowRect
 0006B19C    push        esi
 0006B19D    push        edi
 0006B19E    lea         edi,[esi+38]
 0006B1A1    lea         esi,[ebp-10]
 0006B1A4    mov         ecx,4
 0006B1A9    rep movs    dword ptr [edi],dword ptr [esi]
 0006B1AB    pop         edi
 0006B1AC    pop         esi
 0006B1AD    mov         eax,dword ptr [ebp+10]
 0006B1B0    push        eax
 0006B1B1    mov         al,byte ptr [ebp+0C]
 0006B1B4    push        eax
 0006B1B5    mov         eax,dword ptr [ebp+8]
 0006B1B8    push        eax
 0006B1B9    mov         ecx,edi
 0006B1BB    mov         edx,esi
 0006B1BD    mov         eax,ebx
 0006B1BF    mov         bx,0FFCB
 0006B1C3    call        @CallDynaInst
 0006B1C8    pop         edi
 0006B1C9    pop         esi
 0006B1CA    pop         ebx
 0006B1CB    mov         esp,ebp
 0006B1CD    pop         ebp
 0006B1CE    ret         0C
*}
end;

//0006B1D4
procedure TPageControl.DoRemoveDockClient(Client:TControl);
begin
{*
 0006B1D4    push        ebx
 0006B1D5    mov         ebx,eax
 0006B1D7    cmp         dword ptr [ebx+244],0
>0006B1DE    je          0006B202
 0006B1E0    test        byte ptr [ebx+20],8
>0006B1E4    jne         0006B202
 0006B1E6    mov         dl,1
 0006B1E8    mov         eax,ebx
 0006B1EA    call        TPageControl.SelectNextPage
 0006B1EF    mov         eax,dword ptr [ebx+244]
 0006B1F5    call        TObject.Free
 0006B1FA    xor         eax,eax
 0006B1FC    mov         dword ptr [ebx+244],eax
 0006B202    pop         ebx
 0006B203    ret
*}
end;

//0006B204
function TPageControl.FindNextPage(CurPage:TTabSheet; GoForward:Boolean; CheckTabVisible:Boolean):TTabSheet;
begin
{*
 0006B204    push        ebp
 0006B205    mov         ebp,esp
 0006B207    push        ecx
 0006B208    push        ebx
 0006B209    push        esi
 0006B20A    push        edi
 0006B20B    mov         byte ptr [ebp-1],cl
 0006B20E    mov         esi,eax
 0006B210    mov         eax,dword ptr [esi+238]
 0006B216    cmp         dword ptr [eax+8],0
>0006B21A    je          0006B282
 0006B21C    call        TList.IndexOf
 0006B221    mov         edi,eax
 0006B223    cmp         edi,0FFFFFFFF
>0006B226    jne         0006B23C
 0006B228    cmp         byte ptr [ebp-1],0
>0006B22C    je          0006B23A
 0006B22E    mov         eax,dword ptr [esi+238]
 0006B234    mov         edi,dword ptr [eax+8]
 0006B237    dec         edi
>0006B238    jmp         0006B23C
 0006B23A    xor         edi,edi
 0006B23C    mov         ebx,edi
 0006B23E    cmp         byte ptr [ebp-1],0
>0006B242    je          0006B254
 0006B244    inc         ebx
 0006B245    mov         eax,dword ptr [esi+238]
 0006B24B    cmp         ebx,dword ptr [eax+8]
>0006B24E    jne         0006B262
 0006B250    xor         ebx,ebx
>0006B252    jmp         0006B262
 0006B254    test        ebx,ebx
>0006B256    jne         0006B261
 0006B258    mov         eax,dword ptr [esi+238]
 0006B25E    mov         ebx,dword ptr [eax+8]
 0006B261    dec         ebx
 0006B262    mov         edx,ebx
 0006B264    mov         eax,dword ptr [esi+238]
 0006B26A    call        TList.Get
 0006B26F    cmp         byte ptr [ebp+8],0
>0006B273    je          0006B284
 0006B275    cmp         byte ptr [eax+1F4],0
>0006B27C    jne         0006B284
 0006B27E    cmp         edi,ebx
>0006B280    jne         0006B23E
 0006B282    xor         eax,eax
 0006B284    pop         edi
 0006B285    pop         esi
 0006B286    pop         ebx
 0006B287    pop         ecx
 0006B288    pop         ebp
 0006B289    ret         4
*}
end;

//0006B28C
procedure TPageControl.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 0006B28C    push        ebp
 0006B28D    mov         ebp,esp
 0006B28F    push        ecx
 0006B290    push        ebx
 0006B291    push        esi
 0006B292    mov         dword ptr [ebp-4],eax
 0006B295    mov         eax,dword ptr [ebp-4]
 0006B298    mov         eax,dword ptr [eax+238]
 0006B29E    mov         ebx,dword ptr [eax+8]
 0006B2A1    dec         ebx
 0006B2A2    test        ebx,ebx
>0006B2A4    jl          0006B2C5
 0006B2A6    inc         ebx
 0006B2A7    xor         esi,esi
 0006B2A9    mov         eax,dword ptr [ebp-4]
 0006B2AC    mov         eax,dword ptr [eax+238]
 0006B2B2    mov         edx,esi
 0006B2B4    call        TList.Get
 0006B2B9    mov         edx,eax
 0006B2BB    mov         eax,dword ptr [ebp+0C]
 0006B2BE    call        dword ptr [ebp+8]
 0006B2C1    inc         esi
 0006B2C2    dec         ebx
>0006B2C3    jne         0006B2A9
 0006B2C5    pop         esi
 0006B2C6    pop         ebx
 0006B2C7    pop         ecx
 0006B2C8    pop         ebp
 0006B2C9    ret         8
*}
end;

//0006B2CC
function TPageControl.GetImageIndex(TabIndex:Integer):Integer;
begin
{*
 0006B2CC    push        ebx
 0006B2CD    push        esi
 0006B2CE    mov         esi,edx
 0006B2D0    mov         ebx,eax
 0006B2D2    cmp         word ptr [ebx+232],0
>0006B2DA    je          0006B2E8
 0006B2DC    mov         edx,esi
 0006B2DE    mov         eax,ebx
 0006B2E0    call        TCustomTabControl.GetImageIndex
 0006B2E5    pop         esi
 0006B2E6    pop         ebx
 0006B2E7    ret
 0006B2E8    mov         edx,esi
 0006B2EA    mov         eax,ebx
 0006B2EC    call        TPageControl.GetPage
 0006B2F1    mov         eax,dword ptr [eax+1EC]
 0006B2F7    pop         esi
 0006B2F8    pop         ebx
 0006B2F9    ret
*}
end;

//0006B2FC
function TPageControl.GetPageFromDockClient(Client:TControl):TTabSheet;
begin
{*
 0006B2FC    push        ebx
 0006B2FD    push        esi
 0006B2FE    push        edi
 0006B2FF    push        ebp
 0006B300    push        ecx
 0006B301    mov         ebp,edx
 0006B303    mov         ebx,eax
 0006B305    xor         eax,eax
 0006B307    mov         dword ptr [esp],eax
 0006B30A    mov         eax,ebx
 0006B30C    call        TPageControl.GetPageCount
 0006B311    mov         edi,eax
 0006B313    dec         edi
 0006B314    test        edi,edi
>0006B316    jl          0006B343
 0006B318    inc         edi
 0006B319    xor         esi,esi
 0006B31B    mov         edx,esi
 0006B31D    mov         eax,ebx
 0006B31F    call        TPageControl.GetPage
 0006B324    cmp         eax,dword ptr [ebp+24]
>0006B327    jne         0006B33F
 0006B329    cmp         ebx,dword ptr [ebp+8C]
>0006B32F    jne         0006B33F
 0006B331    mov         edx,esi
 0006B333    mov         eax,ebx
 0006B335    call        TPageControl.GetPage
 0006B33A    mov         dword ptr [esp],eax
>0006B33D    jmp         0006B343
 0006B33F    inc         esi
 0006B340    dec         edi
>0006B341    jne         0006B31B
 0006B343    mov         eax,dword ptr [esp]
 0006B346    pop         edx
 0006B347    pop         ebp
 0006B348    pop         edi
 0006B349    pop         esi
 0006B34A    pop         ebx
 0006B34B    ret
*}
end;

//0006B34C
function TPageControl.GetPage(Index:Integer):TTabSheet;
begin
{*
 0006B34C    push        ebx
 0006B34D    push        esi
 0006B34E    mov         esi,edx
 0006B350    mov         ebx,eax
 0006B352    mov         edx,esi
 0006B354    mov         eax,dword ptr [ebx+238]
 0006B35A    call        TList.Get
 0006B35F    pop         esi
 0006B360    pop         ebx
 0006B361    ret
*}
end;

//0006B364
function TPageControl.GetPageCount:Integer;
begin
{*
 0006B364    mov         eax,dword ptr [eax+238]
 0006B36A    mov         eax,dword ptr [eax+8]
 0006B36D    ret
*}
end;

//0006B370
procedure TPageControl.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 0006B370    push        ebp
 0006B371    mov         ebp,esp
 0006B373    add         esp,0FFFFFFF4
 0006B376    push        ebx
 0006B377    push        esi
 0006B378    push        edi
 0006B379    mov         esi,dword ptr [ebp+0C]
 0006B37C    lea         edi,[ebp-0C]
 0006B37F    movs        dword ptr [edi],dword ptr [esi]
 0006B380    movs        dword ptr [edi],dword ptr [esi]
 0006B381    mov         dword ptr [ebp-4],ecx
 0006B384    mov         esi,edx
 0006B386    mov         ebx,eax
 0006B388    mov         edi,dword ptr [ebp+8]
 0006B38B    mov         edx,esi
 0006B38D    mov         eax,ebx
 0006B38F    call        TPageControl.GetPageFromDockClient
 0006B394    test        eax,eax
 0006B396    sete        byte ptr [edi]
 0006B399    lea         eax,[ebp-0C]
 0006B39C    push        eax
 0006B39D    push        edi
 0006B39E    mov         ecx,dword ptr [ebp-4]
 0006B3A1    mov         edx,esi
 0006B3A3    mov         eax,ebx
 0006B3A5    call        TWinControl.GetSiteInfo
 0006B3AA    pop         edi
 0006B3AB    pop         esi
 0006B3AC    pop         ebx
 0006B3AD    mov         esp,ebp
 0006B3AF    pop         ebp
 0006B3B0    ret         8
*}
end;

//0006B3B4
procedure TPageControl.InsertPage(Page:TTabSheet);
begin
{*
 0006B3B4    push        ebx
 0006B3B5    push        esi
 0006B3B6    mov         esi,edx
 0006B3B8    mov         ebx,eax
 0006B3BA    mov         edx,esi
 0006B3BC    mov         eax,dword ptr [ebx+238]
 0006B3C2    call        TList.Add
 0006B3C7    mov         dword ptr [esi+1F0],ebx
 0006B3CD    mov         eax,esi
 0006B3CF    call        TTabSheet.UpdateTabShowing
 0006B3D4    pop         esi
 0006B3D5    pop         ebx
 0006B3D6    ret
*}
end;

//0006B3D8
procedure TPageControl.InsertTab(Page:TTabSheet);
begin
{*
 0006B3D8    push        ebp
 0006B3D9    mov         ebp,esp
 0006B3DB    push        0
 0006B3DD    push        ebx
 0006B3DE    push        esi
 0006B3DF    mov         esi,edx
 0006B3E1    mov         ebx,eax
 0006B3E3    xor         eax,eax
 0006B3E5    push        ebp
 0006B3E6    push        6B432
 0006B3EB    push        dword ptr fs:[eax]
 0006B3EE    mov         dword ptr fs:[eax],esp
 0006B3F1    push        esi
 0006B3F2    lea         edx,[ebp-4]
 0006B3F5    mov         eax,esi
 0006B3F7    call        TControl.GetText
 0006B3FC    mov         eax,dword ptr [ebp-4]
 0006B3FF    push        eax
 0006B400    mov         eax,esi
 0006B402    call        TTabSheet.GetTabIndex
 0006B407    mov         edx,eax
 0006B409    mov         eax,dword ptr [ebx+20C]
 0006B40F    pop         ecx
 0006B410    call        TStrings.InsertObject
 0006B415    mov         eax,ebx
 0006B417    call        TPageControl.UpdateActivePage
 0006B41C    xor         eax,eax
 0006B41E    pop         edx
 0006B41F    pop         ecx
 0006B420    pop         ecx
 0006B421    mov         dword ptr fs:[eax],edx
 0006B424    push        6B439
 0006B429    lea         eax,[ebp-4]
 0006B42C    call        @LStrClr
 0006B431    ret
>0006B432    jmp         @HandleFinally
>0006B437    jmp         0006B429
 0006B439    pop         esi
 0006B43A    pop         ebx
 0006B43B    pop         ecx
 0006B43C    pop         ebp
 0006B43D    ret
*}
end;

//0006B440
procedure TPageControl.MoveTab(CurIndex:Integer; NewIndex:Integer);
begin
{*
 0006B440    push        ebx
 0006B441    push        esi
 0006B442    push        edi
 0006B443    mov         edi,edx
 0006B445    mov         esi,eax
 0006B447    mov         edx,edi
 0006B449    mov         eax,dword ptr [esi+20C]
 0006B44F    mov         ebx,dword ptr [eax]
 0006B451    call        dword ptr [ebx+60]
 0006B454    pop         edi
 0006B455    pop         esi
 0006B456    pop         ebx
 0006B457    ret
*}
end;

//0006B458
procedure TPageControl.RemovePage(Page:TTabSheet);
begin
{*
 0006B458    push        ebx
 0006B459    push        esi
 0006B45A    push        edi
 0006B45B    mov         esi,edx
 0006B45D    mov         ebx,eax
 0006B45F    test        byte ptr [ebx+20],10
 0006B463    setne       al
 0006B466    xor         al,1
 0006B468    push        eax
 0006B469    mov         cl,1
 0006B46B    mov         edx,esi
 0006B46D    mov         eax,ebx
 0006B46F    call        TPageControl.FindNextPage
 0006B474    mov         edi,eax
 0006B476    cmp         esi,edi
>0006B478    jne         0006B47C
 0006B47A    xor         edi,edi
 0006B47C    xor         edx,edx
 0006B47E    mov         eax,esi
 0006B480    call        TTabSheet.SetTabShowing
 0006B485    xor         eax,eax
 0006B487    mov         dword ptr [esi+1F0],eax
 0006B48D    mov         edx,esi
 0006B48F    mov         eax,dword ptr [ebx+238]
 0006B495    call        TList.Remove
 0006B49A    mov         edx,edi
 0006B49C    mov         eax,ebx
 0006B49E    call        TPageControl.SetActivePage
 0006B4A3    pop         edi
 0006B4A4    pop         esi
 0006B4A5    pop         ebx
 0006B4A6    ret
*}
end;

//0006B4A8
procedure TPageControl.SelectNextPage(GoForward:Boolean);
begin
{*
 0006B4A8    push        ebx
 0006B4A9    push        esi
 0006B4AA    push        edi
 0006B4AB    mov         esi,eax
 0006B4AD    push        1
 0006B4AF    mov         ecx,edx
 0006B4B1    mov         eax,esi
 0006B4B3    mov         edx,dword ptr [esi+23C]
 0006B4B9    call        TPageControl.FindNextPage
 0006B4BE    mov         edi,eax
 0006B4C0    test        edi,edi
>0006B4C2    je          0006B4F6
 0006B4C4    cmp         edi,dword ptr [esi+23C]
>0006B4CA    je          0006B4F6
 0006B4CC    mov         eax,esi
 0006B4CE    mov         bx,0FFB8
 0006B4D2    call        @CallDynaInst
 0006B4D7    test        al,al
>0006B4D9    je          0006B4F6
 0006B4DB    mov         eax,edi
 0006B4DD    call        TTabSheet.GetTabIndex
 0006B4E2    mov         edx,eax
 0006B4E4    mov         eax,esi
 0006B4E6    call        TCustomTabControl.SetTabIndex
 0006B4EB    mov         eax,esi
 0006B4ED    mov         bx,0FFB7
 0006B4F1    call        @CallDynaInst
 0006B4F6    pop         edi
 0006B4F7    pop         esi
 0006B4F8    pop         ebx
 0006B4F9    ret
*}
end;

//0006B4FC
procedure TPageControl.SetActivePage(Page:TTabSheet);
begin
{*
 0006B4FC    push        ebx
 0006B4FD    push        esi
 0006B4FE    mov         ebx,edx
 0006B500    mov         esi,eax
 0006B502    test        ebx,ebx
>0006B504    je          0006B50E
 0006B506    cmp         esi,dword ptr [ebx+1F0]
>0006B50C    jne         0006B53F
 0006B50E    mov         edx,ebx
 0006B510    mov         eax,esi
 0006B512    call        TPageControl.ChangeActivePage
 0006B517    test        ebx,ebx
>0006B519    jne         0006B527
 0006B51B    or          edx,0FFFFFFFF
 0006B51E    mov         eax,esi
 0006B520    call        TCustomTabControl.SetTabIndex
>0006B525    jmp         0006B53F
 0006B527    cmp         ebx,dword ptr [esi+23C]
>0006B52D    jne         0006B53F
 0006B52F    mov         eax,ebx
 0006B531    call        TTabSheet.GetTabIndex
 0006B536    mov         edx,eax
 0006B538    mov         eax,esi
 0006B53A    call        TCustomTabControl.SetTabIndex
 0006B53F    pop         esi
 0006B540    pop         ebx
 0006B541    ret
*}
end;

//0006B544
procedure TPageControl.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 0006B544    mov         eax,edx
 0006B546    mov         edx,ecx
 0006B548    call        TTabSheet.SetPageIndex
 0006B54D    ret
*}
end;

//0006B550
procedure TPageControl.ShowControl(AControl:TControl);
begin
{*
 0006B550    push        ebx
 0006B551    push        esi
 0006B552    mov         esi,edx
 0006B554    mov         ebx,eax
 0006B556    mov         eax,esi
 0006B558    mov         edx,dword ptr ds:[65E7C];TTabSheet
 0006B55E    call        @IsClass
 0006B563    test        al,al
>0006B565    je          0006B578
 0006B567    cmp         ebx,dword ptr [esi+1F0]
>0006B56D    jne         0006B578
 0006B56F    mov         edx,esi
 0006B571    mov         eax,ebx
 0006B573    call        TPageControl.SetActivePage
 0006B578    mov         edx,esi
 0006B57A    mov         eax,ebx
 0006B57C    call        TWinControl.ShowControl
 0006B581    pop         esi
 0006B582    pop         ebx
 0006B583    ret
*}
end;

//0006B584
procedure TPageControl.UpdateTab(Page:TTabSheet);
begin
{*
 0006B584    push        ebp
 0006B585    mov         ebp,esp
 0006B587    push        0
 0006B589    push        ebx
 0006B58A    push        esi
 0006B58B    mov         esi,edx
 0006B58D    mov         ebx,eax
 0006B58F    xor         eax,eax
 0006B591    push        ebp
 0006B592    push        6B5D6
 0006B597    push        dword ptr fs:[eax]
 0006B59A    mov         dword ptr fs:[eax],esp
 0006B59D    lea         edx,[ebp-4]
 0006B5A0    mov         eax,esi
 0006B5A2    call        TControl.GetText
 0006B5A7    mov         eax,dword ptr [ebp-4]
 0006B5AA    push        eax
 0006B5AB    mov         eax,esi
 0006B5AD    call        TTabSheet.GetTabIndex
 0006B5B2    mov         edx,eax
 0006B5B4    mov         eax,dword ptr [ebx+20C]
 0006B5BA    pop         ecx
 0006B5BB    mov         ebx,dword ptr [eax]
 0006B5BD    call        dword ptr [ebx+20]
 0006B5C0    xor         eax,eax
 0006B5C2    pop         edx
 0006B5C3    pop         ecx
 0006B5C4    pop         ecx
 0006B5C5    mov         dword ptr fs:[eax],edx
 0006B5C8    push        6B5DD
 0006B5CD    lea         eax,[ebp-4]
 0006B5D0    call        @LStrClr
 0006B5D5    ret
>0006B5D6    jmp         @HandleFinally
>0006B5DB    jmp         0006B5CD
 0006B5DD    pop         esi
 0006B5DE    pop         ebx
 0006B5DF    pop         ecx
 0006B5E0    pop         ebp
 0006B5E1    ret
*}
end;

//0006B5E4
procedure TPageControl.UpdateActivePage;
begin
{*
 0006B5E4    push        ebx
 0006B5E5    mov         ebx,eax
 0006B5E7    mov         eax,ebx
 0006B5E9    call        TCustomTabControl.GetTabIndex
 0006B5EE    test        eax,eax
>0006B5F0    jl          0006B611
 0006B5F2    mov         eax,ebx
 0006B5F4    call        TCustomTabControl.GetTabIndex
 0006B5F9    mov         edx,eax
 0006B5FB    mov         eax,dword ptr [ebx+20C]
 0006B601    mov         ecx,dword ptr [eax]
 0006B603    call        dword ptr [ecx+18]
 0006B606    mov         edx,eax
 0006B608    mov         eax,ebx
 0006B60A    call        TPageControl.SetActivePage
 0006B60F    pop         ebx
 0006B610    ret
 0006B611    xor         edx,edx
 0006B613    mov         eax,ebx
 0006B615    call        TPageControl.SetActivePage
 0006B61A    pop         ebx
 0006B61B    ret
*}
end;

//0006B61C
procedure TPageControl.CMDesignHitTest(var Message:TCMDesignHitTest);
begin
{*
 0006B61C    push        ebx
 0006B61D    push        esi
 0006B61E    push        edi
 0006B61F    add         esp,0FFFFFFEC
 0006B622    mov         edi,edx
 0006B624    mov         ebx,eax
 0006B626    lea         edx,[esp+0C]
 0006B62A    mov         eax,dword ptr [edi+8]
 0006B62D    call        SmallPointToPoint
 0006B632    mov         eax,dword ptr [esp+0C]
 0006B636    mov         dword ptr [esp],eax
 0006B639    mov         eax,dword ptr [esp+10]
 0006B63D    mov         dword ptr [esp+4],eax
 0006B641    mov         eax,esp
 0006B643    push        eax
 0006B644    push        0
 0006B646    push        130D
 0006B64B    mov         eax,ebx
 0006B64D    call        TWinControl.GetHandle
 0006B652    push        eax
 0006B653    call        user32.SendMessageA
 0006B658    mov         esi,eax
 0006B65A    test        esi,esi
>0006B65C    jl          0006B670
 0006B65E    mov         eax,ebx
 0006B660    call        TCustomTabControl.GetTabIndex
 0006B665    cmp         esi,eax
>0006B667    je          0006B670
 0006B669    mov         dword ptr [edi+0C],1
 0006B670    add         esp,14
 0006B673    pop         edi
 0006B674    pop         esi
 0006B675    pop         ebx
 0006B676    ret
*}
end;

//0006B678
procedure TPageControl.CMDialogKey(Message:TWMKey);
begin
{*
 0006B678    push        ebx
 0006B679    push        esi
 0006B67A    push        edi
 0006B67B    mov         edi,edx
 0006B67D    mov         esi,eax
 0006B67F    mov         eax,esi
 0006B681    mov         bx,0FFBB
 0006B685    call        @CallDynaInst;TWinControl.Focused
 0006B68A    test        al,al
>0006B68C    jne         0006B6A5
 0006B68E    call        user32.GetFocus
 0006B693    push        eax
 0006B694    mov         eax,esi
 0006B696    call        TWinControl.GetHandle
 0006B69B    push        eax
 0006B69C    call        user32.IsChild
 0006B6A1    test        eax,eax
>0006B6A3    je          0006B6D5
 0006B6A5    cmp         word ptr [edi+4],9
>0006B6AA    jne         0006B6D5
 0006B6AC    push        11
 0006B6AE    call        user32.GetKeyState
 0006B6B3    test        ax,ax
>0006B6B6    jge         0006B6D5
 0006B6B8    push        10
 0006B6BA    call        user32.GetKeyState
 0006B6BF    test        ax,ax
 0006B6C2    setge       dl
 0006B6C5    mov         eax,esi
 0006B6C7    call        TPageControl.SelectNextPage
 0006B6CC    mov         dword ptr [edi+0C],1
>0006B6D3    jmp         0006B6DE
 0006B6D5    mov         edx,edi
 0006B6D7    mov         eax,esi
 0006B6D9    call        TWinControl.CMDialogKey
 0006B6DE    pop         edi
 0006B6DF    pop         esi
 0006B6E0    pop         ebx
 0006B6E1    ret
*}
end;

//0006B6E4
procedure TPageControl.CMDockClient(var Message:TCMDockClient);
begin
{*
 0006B6E4    push        ebp
 0006B6E5    mov         ebp,esp
 0006B6E7    add         esp,0FFFFFFF8
 0006B6EA    push        ebx
 0006B6EB    push        esi
 0006B6EC    push        edi
 0006B6ED    xor         ecx,ecx
 0006B6EF    mov         dword ptr [ebp-8],ecx
 0006B6F2    mov         edi,edx
 0006B6F4    mov         dword ptr [ebp-4],eax
 0006B6F7    xor         eax,eax
 0006B6F9    push        ebp
 0006B6FA    push        6B81E
 0006B6FF    push        dword ptr fs:[eax]
 0006B702    mov         dword ptr fs:[eax],esp
 0006B705    xor         eax,eax
 0006B707    mov         dword ptr [edi+0C],eax
 0006B70A    mov         ecx,dword ptr [ebp-4]
 0006B70D    mov         dl,1
 0006B70F    mov         eax,[00065E7C];TTabSheet
 0006B714    call        TTabSheet.Create
 0006B719    mov         ebx,eax
 0006B71B    mov         eax,dword ptr [ebp-4]
 0006B71E    mov         dword ptr [eax+240],ebx
 0006B724    xor         eax,eax
 0006B726    push        ebp
 0006B727    push        6B801
 0006B72C    push        dword ptr fs:[eax]
 0006B72F    mov         dword ptr fs:[eax],esp
 0006B732    xor         eax,eax
 0006B734    push        ebp
 0006B735    push        6B79A
 0006B73A    push        dword ptr fs:[eax]
 0006B73D    mov         dword ptr fs:[eax],esp
 0006B740    mov         eax,dword ptr [edi+4]
 0006B743    mov         esi,dword ptr [eax+30]
 0006B746    mov         eax,esi
 0006B748    mov         edx,dword ptr ds:[55208];TCustomForm
 0006B74E    call        @IsClass
 0006B753    test        al,al
>0006B755    je          0006B76B
 0006B757    lea         edx,[ebp-8]
 0006B75A    mov         eax,esi
 0006B75C    call        TControl.GetText
 0006B761    mov         edx,dword ptr [ebp-8]
 0006B764    mov         eax,ebx
 0006B766    call        TControl.SetText
 0006B76B    mov         eax,dword ptr [ebp-4]
 0006B76E    mov         eax,dword ptr [eax+240]
 0006B774    mov         edx,dword ptr [ebp-4]
 0006B777    call        TTabSheet.SetPageControl
 0006B77C    mov         eax,dword ptr [edi+4]
 0006B77F    lea         ecx,[eax+38]
 0006B782    mov         edx,dword ptr [ebp-4]
 0006B785    mov         eax,esi
 0006B787    mov         bx,0FFD2
 0006B78B    call        @CallDynaInst
 0006B790    xor         eax,eax
 0006B792    pop         edx
 0006B793    pop         ecx
 0006B794    pop         ecx
 0006B795    mov         dword ptr fs:[eax],edx
>0006B798    jmp         0006B7B7
>0006B79A    jmp         @HandleAnyException
 0006B79F    mov         eax,dword ptr [ebp-4]
 0006B7A2    mov         eax,dword ptr [eax+240]
 0006B7A8    call        TObject.Free
 0006B7AD    call        @RaiseAgain
 0006B7B2    call        @DoneExcept
 0006B7B7    mov         bl,byte ptr [esi+47]
 0006B7BA    mov         eax,dword ptr [ebp-4]
 0006B7BD    mov         eax,dword ptr [eax+240]
 0006B7C3    mov         edx,ebx
 0006B7C5    call        TTabSheet.SetTabVisible
 0006B7CA    test        bl,bl
>0006B7CC    je          0006B7DF
 0006B7CE    mov         eax,dword ptr [ebp-4]
 0006B7D1    mov         edx,dword ptr [eax+240]
 0006B7D7    mov         eax,dword ptr [ebp-4]
 0006B7DA    call        TPageControl.SetActivePage
 0006B7DF    mov         dl,5
 0006B7E1    mov         eax,esi
 0006B7E3    call        TControl.SetAlign
 0006B7E8    xor         eax,eax
 0006B7EA    pop         edx
 0006B7EB    pop         ecx
 0006B7EC    pop         ecx
 0006B7ED    mov         dword ptr fs:[eax],edx
 0006B7F0    push        6B808
 0006B7F5    mov         eax,dword ptr [ebp-4]
 0006B7F8    xor         edx,edx
 0006B7FA    mov         dword ptr [eax+240],edx
 0006B800    ret
>0006B801    jmp         @HandleFinally
>0006B806    jmp         0006B7F5
 0006B808    xor         eax,eax
 0006B80A    pop         edx
 0006B80B    pop         ecx
 0006B80C    pop         ecx
 0006B80D    mov         dword ptr fs:[eax],edx
 0006B810    push        6B825
 0006B815    lea         eax,[ebp-8]
 0006B818    call        @LStrClr
 0006B81D    ret
>0006B81E    jmp         @HandleFinally
>0006B823    jmp         0006B815
 0006B825    pop         edi
 0006B826    pop         esi
 0006B827    pop         ebx
 0006B828    pop         ecx
 0006B829    pop         ecx
 0006B82A    pop         ebp
 0006B82B    ret
*}
end;

//0006B82C
{*procedure TPageControl.sub_0006B82C(?:?);
begin
 0006B82C    push        ebp
 0006B82D    mov         ebp,esp
 0006B82F    add         esp,0FFFFFFF8
 0006B832    push        ebx
 0006B833    push        esi
 0006B834    push        edi
 0006B835    xor         ecx,ecx
 0006B837    mov         dword ptr [ebp-4],ecx
 0006B83A    mov         ebx,edx
 0006B83C    mov         esi,eax
 0006B83E    xor         eax,eax
 0006B840    push        ebp
 0006B841    push        6B8FA
 0006B846    push        dword ptr fs:[eax]
 0006B849    mov         dword ptr fs:[eax],esp
 0006B84C    mov         edx,dword ptr [ebx+4]
 0006B84F    mov         eax,esi
 0006B851    call        TPageControl.GetPageFromDockClient
 0006B856    mov         edi,eax
 0006B858    test        edi,edi
>0006B85A    je          0006B8DB
 0006B85C    mov         eax,dword ptr [ebx+8]
 0006B85F    mov         eax,dword ptr [eax]
 0006B861    sub         eax,0C
>0006B864    je          0006B86F
 0006B866    sub         eax,0AFFF
>0006B86B    je          0006B8C1
>0006B86D    jmp         0006B8DB
 0006B86F    lea         eax,[ebp-4]
 0006B872    mov         edx,dword ptr [ebx+8]
 0006B875    mov         edx,dword ptr [edx+8]
 0006B878    call        @LStrFromPChar
 0006B87D    mov         eax,dword ptr [ebp-4]
 0006B880    call        @LStrLen
 0006B885    test        eax,eax
>0006B887    jle         0006B8B5
 0006B889    mov         dword ptr [ebp-8],eax
 0006B88C    mov         eax,1
 0006B891    mov         edx,dword ptr [ebp-4]
 0006B894    mov         dl,byte ptr [edx+eax-1]
 0006B898    sub         dl,0A
>0006B89B    je          0006B8A2
 0006B89D    sub         dl,3
>0006B8A0    jne         0006B8AF
 0006B8A2    mov         edx,eax
 0006B8A4    dec         edx
 0006B8A5    lea         eax,[ebp-4]
 0006B8A8    call        @LStrSetLength
>0006B8AD    jmp         0006B8B5
 0006B8AF    inc         eax
 0006B8B0    dec         dword ptr [ebp-8]
>0006B8B3    jne         0006B891
 0006B8B5    mov         edx,dword ptr [ebp-4]
 0006B8B8    mov         eax,edi
 0006B8BA    call        TControl.SetText
>0006B8BF    jmp         0006B8DB
 0006B8C1    mov         eax,dword ptr [ebx+8]
 0006B8C4    mov         dl,byte ptr [eax+4]
 0006B8C7    mov         eax,edi
 0006B8C9    call        TControl.SetVisible
 0006B8CE    mov         eax,dword ptr [ebx+8]
 0006B8D1    mov         dl,byte ptr [eax+4]
 0006B8D4    mov         eax,edi
 0006B8D6    call        TTabSheet.SetTabVisible
 0006B8DB    mov         edx,ebx
 0006B8DD    mov         eax,esi
 0006B8DF    mov         ecx,dword ptr [eax]
 0006B8E1    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 0006B8E4    xor         eax,eax
 0006B8E6    pop         edx
 0006B8E7    pop         ecx
 0006B8E8    pop         ecx
 0006B8E9    mov         dword ptr fs:[eax],edx
 0006B8EC    push        6B901
 0006B8F1    lea         eax,[ebp-4]
 0006B8F4    call        @LStrClr
 0006B8F9    ret
>0006B8FA    jmp         @HandleFinally
>0006B8FF    jmp         0006B8F1
 0006B901    pop         edi
 0006B902    pop         esi
 0006B903    pop         ebx
 0006B904    pop         ecx
 0006B905    pop         ecx
 0006B906    pop         ebp
 0006B907    ret
end;*}

//0006B908
procedure TPageControl.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 0006B908    push        ebx
 0006B909    push        esi
 0006B90A    mov         esi,edx
 0006B90C    mov         ebx,eax
 0006B90E    xor         eax,eax
 0006B910    mov         dword ptr [esi+0C],eax
 0006B913    mov         edx,dword ptr [esi+8]
 0006B916    mov         eax,ebx
 0006B918    call        TPageControl.GetPageFromDockClient
 0006B91D    test        eax,eax
>0006B91F    je          0006B931
 0006B921    mov         dword ptr [ebx+244],eax
 0006B927    mov         eax,dword ptr [esi+8]
 0006B92A    xor         edx,edx
 0006B92C    call        TControl.SetAlign
 0006B931    pop         esi
 0006B932    pop         ebx
 0006B933    ret
*}
end;

//0006B934
function TPageControl.GetDockClientFromMousePos(MousePos:TPoint):TControl;
begin
{*
 0006B934    push        ebx
 0006B935    push        esi
 0006B936    push        edi
 0006B937    add         esp,0FFFFFFEC
 0006B93A    mov         esi,edx
 0006B93C    lea         edi,[esp]
 0006B93F    movs        dword ptr [edi],dword ptr [esi]
 0006B940    movs        dword ptr [edi],dword ptr [esi]
 0006B941    mov         ebx,eax
 0006B943    xor         edi,edi
 0006B945    cmp         byte ptr [ebx+138],0
>0006B94C    je          0006B9C1
 0006B94E    mov         eax,dword ptr [esp]
 0006B951    mov         dword ptr [esp+8],eax
 0006B955    mov         eax,dword ptr [esp+4]
 0006B959    mov         dword ptr [esp+0C],eax
 0006B95D    lea         eax,[esp+8]
 0006B961    push        eax
 0006B962    push        0
 0006B964    push        130D
 0006B969    mov         eax,ebx
 0006B96B    call        TWinControl.GetHandle
 0006B970    push        eax
 0006B971    call        user32.SendMessageA
 0006B976    test        eax,eax
>0006B978    jl          0006B9C1
 0006B97A    mov         edx,eax
 0006B97C    mov         eax,ebx
 0006B97E    call        TPageControl.GetPage
 0006B983    mov         esi,eax
 0006B985    cmp         byte ptr [esi+1F4],0
>0006B98C    jne         0006B99D
 0006B98E    push        1
 0006B990    mov         cl,1
 0006B992    mov         edx,esi
 0006B994    mov         eax,ebx
 0006B996    call        TPageControl.FindNextPage
 0006B99B    mov         esi,eax
 0006B99D    test        esi,esi
>0006B99F    je          0006B9C1
 0006B9A1    mov         eax,esi
 0006B9A3    call        TWinControl.GetControlCount
 0006B9A8    test        eax,eax
>0006B9AA    jle         0006B9C1
 0006B9AC    xor         edx,edx
 0006B9AE    mov         eax,esi
 0006B9B0    call        TWinControl.GetControl
 0006B9B5    mov         edi,eax
 0006B9B7    cmp         ebx,dword ptr [edi+8C]
>0006B9BD    je          0006B9C1
 0006B9BF    xor         edi,edi
 0006B9C1    mov         eax,edi
 0006B9C3    add         esp,14
 0006B9C6    pop         edi
 0006B9C7    pop         esi
 0006B9C8    pop         ebx
 0006B9C9    ret
*}
end;

//0006B9CC
procedure TPageControl.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 0006B9CC    push        ebx
 0006B9CD    push        esi
 0006B9CE    add         esp,0FFFFFFF8
 0006B9D1    mov         esi,edx
 0006B9D3    mov         ebx,eax
 0006B9D5    mov         edx,esi
 0006B9D7    mov         eax,ebx
 0006B9D9    call        TControl.WMLButtonDown
 0006B9DE    mov         edx,esp
 0006B9E0    mov         eax,dword ptr [esi+8]
 0006B9E3    call        SmallPointToPoint
 0006B9E8    mov         edx,esp
 0006B9EA    mov         eax,ebx
 0006B9EC    call        TPageControl.GetDockClientFromMousePos
 0006B9F1    test        eax,eax
>0006B9F3    je          0006B9FF
 0006B9F5    or          ecx,0FFFFFFFF
 0006B9F8    xor         edx,edx
 0006B9FA    call        TControl.BeginDrag
 0006B9FF    pop         ecx
 0006BA00    pop         edx
 0006BA01    pop         esi
 0006BA02    pop         ebx
 0006BA03    ret
*}
end;

//0006BA04
procedure TPageControl.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 0006BA04    push        ebx
 0006BA05    push        esi
 0006BA06    add         esp,0FFFFFFF8
 0006BA09    mov         esi,edx
 0006BA0B    mov         ebx,eax
 0006BA0D    mov         edx,esi
 0006BA0F    mov         eax,ebx
 0006BA11    call        TControl.WMLButtonDblClk
 0006BA16    mov         edx,esp
 0006BA18    mov         eax,dword ptr [esi+8]
 0006BA1B    call        SmallPointToPoint
 0006BA20    mov         edx,esp
 0006BA22    mov         eax,ebx
 0006BA24    call        TPageControl.GetDockClientFromMousePos
 0006BA29    test        eax,eax
>0006BA2B    je          0006BA38
 0006BA2D    push        0
 0006BA2F    xor         ecx,ecx
 0006BA31    xor         edx,edx
 0006BA33    call        TControl.ManualDock
 0006BA38    pop         ecx
 0006BA39    pop         edx
 0006BA3A    pop         esi
 0006BA3B    pop         ebx
 0006BA3C    ret
*}
end;

//0006BA40
constructor TStatusPanel.Create(Collection:TCollection);
begin
{*
 0006BA40    push        ebx
 0006BA41    push        esi
 0006BA42    test        dl,dl
>0006BA44    je          0006BA4E
 0006BA46    add         esp,0FFFFFFF0
 0006BA49    call        @ClassCreate
 0006BA4E    mov         ebx,edx
 0006BA50    mov         esi,eax
 0006BA52    mov         dword ptr [esi+10],32
 0006BA59    mov         byte ptr [esi+15],1
 0006BA5D    mov         byte ptr [esi+17],1
 0006BA61    xor         edx,edx
 0006BA63    mov         eax,esi
 0006BA65    call        TCollectionItem.Create
 0006BA6A    mov         eax,esi
 0006BA6C    call        TStatusPanel.ParentBiDiModeChanged
 0006BA71    mov         eax,esi
 0006BA73    test        bl,bl
>0006BA75    je          0006BA86
 0006BA77    call        @AfterConstruction
 0006BA7C    pop         dword ptr fs:[0]
 0006BA83    add         esp,0C
 0006BA86    mov         eax,esi
 0006BA88    pop         esi
 0006BA89    pop         ebx
 0006BA8A    ret
*}
end;

//0006BA8C
procedure TStatusPanel.Assign(Source:TPersistent);
begin
{*
 0006BA8C    push        ebx
 0006BA8D    push        esi
 0006BA8E    push        edi
 0006BA8F    mov         esi,edx
 0006BA91    mov         ebx,eax
 0006BA93    mov         eax,esi
 0006BA95    mov         edx,dword ptr ds:[66CEC];TStatusPanel
 0006BA9B    call        @IsClass
 0006BAA0    test        al,al
>0006BAA2    je          0006BADA
 0006BAA4    mov         edi,esi
 0006BAA6    mov         edx,dword ptr [edi+0C]
 0006BAA9    mov         eax,ebx
 0006BAAB    call        TStatusPanel.SetText
 0006BAB0    mov         edx,dword ptr [edi+10]
 0006BAB3    mov         eax,ebx
 0006BAB5    call        TStatusPanel.SetWidth
 0006BABA    mov         dl,byte ptr [edi+14]
 0006BABD    mov         eax,ebx
 0006BABF    call        TStatusPanel.SetAlignment
 0006BAC4    mov         dl,byte ptr [edi+15]
 0006BAC7    mov         eax,ebx
 0006BAC9    call        TStatusPanel.SetBevel
 0006BACE    mov         dl,byte ptr [edi+18]
 0006BAD1    mov         eax,ebx
 0006BAD3    call        TStatusPanel.SetStyle
>0006BAD8    jmp         0006BAE3
 0006BADA    mov         edx,esi
 0006BADC    mov         eax,ebx
 0006BADE    call        TPersistent.Assign
 0006BAE3    pop         edi
 0006BAE4    pop         esi
 0006BAE5    pop         ebx
 0006BAE6    ret
*}
end;

//0006BAE8
procedure TStatusPanel.SetBiDiMode(Value:TBiDiMode);
begin
{*
 0006BAE8    cmp         dl,byte ptr [eax+16]
>0006BAEB    je          0006BAFB
 0006BAED    mov         byte ptr [eax+16],dl
 0006BAF0    mov         byte ptr [eax+17],0
 0006BAF4    xor         edx,edx
 0006BAF6    call        TCollectionItem.Changed
 0006BAFB    ret
*}
end;

//0006BAFC
procedure TStatusPanel.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 0006BAFC    mov         al,byte ptr [eax+17];TStatusPanel.ParentBiDiMode:Boolean
 0006BAFF    xor         al,1
 0006BB01    ret
*}
end;

//0006BB04
procedure TStatusPanel.SetParentBiDiMode(Value:Boolean);
begin
{*
 0006BB04    cmp         dl,byte ptr [eax+17]
>0006BB07    je          0006BB11
 0006BB09    mov         byte ptr [eax+17],dl
 0006BB0C    call        TStatusPanel.ParentBiDiModeChanged
 0006BB11    ret
*}
end;

//0006BB14
procedure TStatusPanel.ParentBiDiModeChanged;
begin
{*
 0006BB14    push        ebx
 0006BB15    push        esi
 0006BB16    mov         esi,eax
 0006BB18    cmp         byte ptr [esi+17],0
>0006BB1C    je          0006BB49
 0006BB1E    mov         eax,esi
 0006BB20    mov         bx,0FFFF
 0006BB24    call        @CallDynaInst
 0006BB29    test        eax,eax
>0006BB2B    je          0006BB49
 0006BB2D    mov         eax,esi
 0006BB2F    mov         bx,0FFFF
 0006BB33    call        @CallDynaInst
 0006BB38    mov         eax,dword ptr [eax+18]
 0006BB3B    mov         dl,byte ptr [eax+4F]
 0006BB3E    mov         eax,esi
 0006BB40    call        TStatusPanel.SetBiDiMode
 0006BB45    mov         byte ptr [esi+17],1
 0006BB49    pop         esi
 0006BB4A    pop         ebx
 0006BB4B    ret
*}
end;

//0006BB4C
function TStatusPanel.UseRightToLeftReading:Boolean;
begin
{*
 0006BB4C    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 0006BB52    cmp         byte ptr [edx+9],0
>0006BB56    je          0006BB5E
 0006BB58    cmp         byte ptr [eax+16],0
>0006BB5C    jne         0006BB61
 0006BB5E    xor         eax,eax
 0006BB60    ret
 0006BB61    mov         al,1
 0006BB63    ret
*}
end;

//0006BB64
function TStatusPanel.UseRightToLeftAlignment:Boolean;
begin
{*
 0006BB64    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 0006BB6A    cmp         byte ptr [edx+9],0
>0006BB6E    je          0006BB76
 0006BB70    cmp         byte ptr [eax+16],1
>0006BB74    je          0006BB79
 0006BB76    xor         eax,eax
 0006BB78    ret
 0006BB79    mov         al,1
 0006BB7B    ret
*}
end;

//0006BB7C
function THeaderSection.GetDisplayName:AnsiString;
begin
{*
 0006BB7C    push        ebx
 0006BB7D    push        esi
 0006BB7E    mov         esi,edx
 0006BB80    mov         ebx,eax
 0006BB82    mov         eax,esi
 0006BB84    mov         edx,dword ptr [ebx+0C]
 0006BB87    call        @LStrLAsg
 0006BB8C    cmp         dword ptr [esi],0
>0006BB8F    jne         0006BB9A
 0006BB91    mov         edx,esi
 0006BB93    mov         eax,ebx
 0006BB95    call        TCollectionItem.GetDisplayName
 0006BB9A    pop         esi
 0006BB9B    pop         ebx
 0006BB9C    ret
*}
end;

//0006BBA0
procedure TStatusPanel.SetAlignment(Value:TAlignment);
begin
{*
 0006BBA0    cmp         dl,byte ptr [eax+14]
>0006BBA3    je          0006BBAF
 0006BBA5    mov         byte ptr [eax+14],dl
 0006BBA8    xor         edx,edx
 0006BBAA    call        TCollectionItem.Changed
 0006BBAF    ret
*}
end;

//0006BBB0
procedure TStatusPanel.SetBevel(Value:TStatusPanelBevel);
begin
{*
 0006BBB0    cmp         dl,byte ptr [eax+15]
>0006BBB3    je          0006BBBF
 0006BBB5    mov         byte ptr [eax+15],dl
 0006BBB8    xor         edx,edx
 0006BBBA    call        TCollectionItem.Changed
 0006BBBF    ret
*}
end;

//0006BBC0
procedure TStatusPanel.SetStyle(Value:TStatusPanelStyle);
begin
{*
 0006BBC0    cmp         dl,byte ptr [eax+18]
>0006BBC3    je          0006BBCF
 0006BBC5    mov         byte ptr [eax+18],dl
 0006BBC8    xor         edx,edx
 0006BBCA    call        TCollectionItem.Changed
 0006BBCF    ret
*}
end;

//0006BBD0
procedure TStatusPanel.SetText(const Value:AnsiString);
begin
{*
 0006BBD0    push        ebx
 0006BBD1    push        esi
 0006BBD2    mov         esi,edx
 0006BBD4    mov         ebx,eax
 0006BBD6    mov         eax,dword ptr [ebx+0C]
 0006BBD9    mov         edx,esi
 0006BBDB    call        @LStrCmp
>0006BBE0    je          0006BBF5
 0006BBE2    lea         eax,[ebx+0C]
 0006BBE5    mov         edx,esi
 0006BBE7    call        @LStrAsg
 0006BBEC    xor         edx,edx
 0006BBEE    mov         eax,ebx
 0006BBF0    call        TCollectionItem.Changed
 0006BBF5    pop         esi
 0006BBF6    pop         ebx
 0006BBF7    ret
*}
end;

//0006BBF8
procedure TStatusPanel.SetWidth(Value:Integer);
begin
{*
 0006BBF8    cmp         edx,dword ptr [eax+10]
>0006BBFB    je          0006BC07
 0006BBFD    mov         dword ptr [eax+10],edx
 0006BC00    mov         dl,1
 0006BC02    call        TCollectionItem.Changed
 0006BC07    ret
*}
end;

//0006BC08
constructor TStatusPanels.Create(StatusBar:TStatusBar);
begin
{*
 0006BC08    push        ebx
 0006BC09    push        esi
 0006BC0A    push        edi
 0006BC0B    test        dl,dl
>0006BC0D    je          0006BC17
 0006BC0F    add         esp,0FFFFFFF0
 0006BC12    call        @ClassCreate
 0006BC17    mov         esi,ecx
 0006BC19    mov         ebx,edx
 0006BC1B    mov         edi,eax
 0006BC1D    mov         ecx,dword ptr ds:[66CEC];TStatusPanel
 0006BC23    xor         edx,edx
 0006BC25    mov         eax,edi
 0006BC27    call        TCollection.Create
 0006BC2C    mov         dword ptr [edi+18],esi
 0006BC2F    mov         eax,edi
 0006BC31    test        bl,bl
>0006BC33    je          0006BC44
 0006BC35    call        @AfterConstruction
 0006BC3A    pop         dword ptr fs:[0]
 0006BC41    add         esp,0C
 0006BC44    mov         eax,edi
 0006BC46    pop         edi
 0006BC47    pop         esi
 0006BC48    pop         ebx
 0006BC49    ret
*}
end;

//0006BC4C
function TCoolBands.Add:TCoolBand;
begin
{*
 0006BC4C    push        ebx
 0006BC4D    mov         ebx,eax
 0006BC4F    mov         eax,ebx
 0006BC51    call        TCollection.Add
 0006BC56    pop         ebx
 0006BC57    ret
*}
end;

//0006BC58
function TCoolBands.GetItem(Index:Integer):TCoolBand;
begin
{*
 0006BC58    push        ebx
 0006BC59    push        esi
 0006BC5A    mov         esi,edx
 0006BC5C    mov         ebx,eax
 0006BC5E    mov         edx,esi
 0006BC60    mov         eax,ebx
 0006BC62    call        TCollection.GetItem
 0006BC67    pop         esi
 0006BC68    pop         ebx
 0006BC69    ret
*}
end;

//0006BC6C
procedure TStatusPanels.sub_0002114C;
begin
{*
 0006BC6C    mov         eax,dword ptr [eax+18];TStatusPanels...FStatusBar:TStatusBar
 0006BC6F    ret
*}
end;

//0006BC70
procedure TStatusPanels.Update(Item:TCollectionItem);
begin
{*
 0006BC70    push        ebx
 0006BC71    push        esi
 0006BC72    mov         esi,edx
 0006BC74    mov         ebx,eax
 0006BC76    test        esi,esi
>0006BC78    je          0006BC90
 0006BC7A    mov         eax,esi
 0006BC7C    call        TCollectionItem.GetIndex
 0006BC81    mov         edx,eax
 0006BC83    xor         ecx,ecx
 0006BC85    mov         eax,dword ptr [ebx+18]
 0006BC88    call        TStatusBar.UpdatePanel
 0006BC8D    pop         esi
 0006BC8E    pop         ebx
 0006BC8F    ret
 0006BC90    xor         ecx,ecx
 0006BC92    mov         dl,1
 0006BC94    mov         eax,dword ptr [ebx+18]
 0006BC97    call        TStatusBar.UpdatePanels
 0006BC9C    pop         esi
 0006BC9D    pop         ebx
 0006BC9E    ret
*}
end;

//0006BCA0
constructor TStatusBar.Create(AOwner:TComponent);
begin
{*
 0006BCA0    push        ebp
 0006BCA1    mov         ebp,esp
 0006BCA3    push        ecx
 0006BCA4    push        ebx
 0006BCA5    push        esi
 0006BCA6    test        dl,dl
>0006BCA8    je          0006BCB2
 0006BCAA    add         esp,0FFFFFFF0
 0006BCAD    call        @ClassCreate
 0006BCB2    mov         byte ptr [ebp-1],dl
 0006BCB5    mov         ebx,eax
 0006BCB7    xor         edx,edx
 0006BCB9    mov         eax,ebx
 0006BCBB    call        TWinControl.Create
 0006BCC0    mov         eax,[0006BD58]
 0006BCC5    mov         dword ptr [ebx+40],eax
 0006BCC8    mov         edx,8000000F
 0006BCCD    mov         eax,ebx
 0006BCCF    call        TControl.SetColor
 0006BCD4    mov         edx,13
 0006BCD9    mov         eax,ebx
 0006BCDB    call        TControl.SetHeight
 0006BCE0    mov         dl,2
 0006BCE2    mov         eax,ebx
 0006BCE4    call        TControl.SetAlign
 0006BCE9    mov         ecx,ebx
 0006BCEB    mov         dl,1
 0006BCED    mov         eax,[00066E8C];TStatusPanels
 0006BCF2    call        TStatusPanels.Create
 0006BCF7    mov         dword ptr [ebx+1EC],eax
 0006BCFD    mov         dl,1
 0006BCFF    mov         eax,[0003E18C];TControlCanvas
 0006BD04    call        TCanvas.Create
 0006BD09    mov         esi,eax
 0006BD0B    mov         dword ptr [ebx+1F0],esi
 0006BD11    mov         edx,ebx
 0006BD13    mov         eax,esi
 0006BD15    call        TControlCanvas.SetControl
 0006BD1A    mov         byte ptr [ebx+1F9],1
 0006BD21    xor         edx,edx
 0006BD23    mov         eax,ebx
 0006BD25    call        TControl.SetParentFont
 0006BD2A    mov         byte ptr [ebx+1FA],1
 0006BD31    mov         eax,ebx
 0006BD33    call        TStatusBar.SyncToSystemFont
 0006BD38    mov         eax,ebx
 0006BD3A    cmp         byte ptr [ebp-1],0
>0006BD3E    je          0006BD4F
 0006BD40    call        @AfterConstruction
 0006BD45    pop         dword ptr fs:[0]
 0006BD4C    add         esp,0C
 0006BD4F    mov         eax,ebx
 0006BD51    pop         esi
 0006BD52    pop         ebx
 0006BD53    pop         ecx
 0006BD54    pop         ebp
 0006BD55    ret
*}
end;

//0006BD5C
destructor THeaderControl.Destroy;
begin
{*
 0006BD5C    push        ebx
 0006BD5D    push        esi
 0006BD5E    call        @BeforeDestruction
 0006BD63    mov         ebx,edx
 0006BD65    mov         esi,eax
 0006BD67    mov         eax,dword ptr [esi+1F0]
 0006BD6D    call        TObject.Free
 0006BD72    mov         eax,dword ptr [esi+1EC]
 0006BD78    call        TObject.Free
 0006BD7D    mov         edx,ebx
 0006BD7F    and         dl,0FC
 0006BD82    mov         eax,esi
 0006BD84    call        TWinControl.Destroy
 0006BD89    test        bl,bl
>0006BD8B    jle         0006BD94
 0006BD8D    mov         eax,esi
 0006BD8F    call        @ClassDestroy
 0006BD94    pop         esi
 0006BD95    pop         ebx
 0006BD96    ret
*}
end;

//0006BD98
procedure TStatusBar.CreateParams(var Params:TCreateParams);
begin
{*
 0006BD98    push        ebx
 0006BD99    push        esi
 0006BD9A    mov         esi,edx
 0006BD9C    mov         ebx,eax
 0006BD9E    mov         eax,4
 0006BDA3    call        InitCommonControl
 0006BDA8    mov         edx,esi
 0006BDAA    mov         eax,ebx
 0006BDAC    call        TWinControl.CreateParams
 0006BDB1    mov         ecx,6BE08
 0006BDB6    mov         edx,esi
 0006BDB8    mov         eax,ebx
 0006BDBA    call        TWinControl.CreateSubClass
 0006BDBF    cmp         byte ptr [ebx+1F9],0
>0006BDC6    je          0006BDEB
 0006BDC8    mov         eax,dword ptr [ebx+24]
 0006BDCB    mov         edx,dword ptr ds:[55208];TCustomForm
 0006BDD1    call        @IsClass
 0006BDD6    test        al,al
>0006BDD8    je          0006BDEB
 0006BDDA    mov         eax,dword ptr [ebx+24]
 0006BDDD    mov         al,byte ptr [eax+209]
 0006BDE3    sub         al,2
>0006BDE5    je          0006BDEF
 0006BDE7    sub         al,3
>0006BDE9    je          0006BDEF
 0006BDEB    xor         eax,eax
>0006BDED    jmp         0006BDF1
 0006BDEF    mov         al,1
 0006BDF1    and         eax,7F
 0006BDF4    mov         eax,dword ptr [eax*4+0B4C60]
 0006BDFB    or          dword ptr [esi+4],eax
 0006BDFE    and         dword ptr [esi+24],0FFFFFFFD
 0006BE02    pop         esi
 0006BE03    pop         ebx
 0006BE04    ret
*}
end;

//0006BE1C
procedure TStatusBar.CreateWnd;
begin
{*
 0006BE1C    push        ebx
 0006BE1D    mov         ebx,eax
 0006BE1F    mov         eax,ebx
 0006BE21    call        TWinControl.CreateWnd
 0006BE26    mov         eax,dword ptr [ebx+64]
 0006BE29    call        ColorToRGB
 0006BE2E    push        eax
 0006BE2F    push        0
 0006BE31    push        2001
 0006BE36    mov         eax,ebx
 0006BE38    call        TWinControl.GetHandle
 0006BE3D    push        eax
 0006BE3E    call        user32.SendMessageA
 0006BE43    xor         ecx,ecx
 0006BE45    mov         dl,1
 0006BE47    mov         eax,ebx
 0006BE49    call        TStatusBar.UpdatePanels
 0006BE4E    cmp         dword ptr [ebx+1F4],0
>0006BE55    je          0006BE7A
 0006BE57    mov         eax,dword ptr [ebx+1F4]
 0006BE5D    call        @LStrToPChar
 0006BE62    push        eax
 0006BE63    push        0FF
 0006BE68    push        401
 0006BE6D    mov         eax,ebx
 0006BE6F    call        TWinControl.GetHandle
 0006BE74    push        eax
 0006BE75    call        user32.SendMessageA
 0006BE7A    cmp         byte ptr [ebx+1F8],0
>0006BE81    je          0006BE99
 0006BE83    push        0
 0006BE85    push        1
 0006BE87    push        409
 0006BE8C    mov         eax,ebx
 0006BE8E    call        TWinControl.GetHandle
 0006BE93    push        eax
 0006BE94    call        user32.SendMessageA
 0006BE99    pop         ebx
 0006BE9A    ret
*}
end;

//0006BE9C
function TStatusBar.DoHint:Boolean;
begin
{*
 0006BE9C    push        ebx
 0006BE9D    cmp         word ptr [eax+206],0
>0006BEA5    je          0006BEBB
 0006BEA7    mov         ebx,eax
 0006BEA9    mov         edx,eax
 0006BEAB    mov         eax,dword ptr [ebx+208]
 0006BEB1    call        dword ptr [ebx+204]
 0006BEB7    mov         al,1
 0006BEB9    pop         ebx
 0006BEBA    ret
 0006BEBB    xor         eax,eax
 0006BEBD    pop         ebx
 0006BEBE    ret
*}
end;

//0006BEC0
procedure TStatusBar.DrawPanel(Panel:TStatusPanel; const Rect:TRect);
begin
{*
 0006BEC0    push        ebx
 0006BEC1    cmp         word ptr [eax+1FE],0
>0006BEC9    je          0006BEE0
 0006BECB    push        ecx
 0006BECC    mov         ebx,eax
 0006BECE    mov         ecx,edx
 0006BED0    mov         edx,eax
 0006BED2    mov         eax,dword ptr [ebx+200]
 0006BED8    call        dword ptr [ebx+1FC]
 0006BEDE    pop         ebx
 0006BEDF    ret
 0006BEE0    mov         edx,ecx
 0006BEE2    mov         eax,dword ptr [eax+1F0]
 0006BEE8    call        TCanvas.FillRect
 0006BEED    pop         ebx
 0006BEEE    ret
*}
end;

//0006BEF0
procedure THeaderControl.SetSections(Value:THeaderSections);
begin
{*
 0006BEF0    mov         eax,dword ptr [eax+1EC]
 0006BEF6    mov         ecx,dword ptr [eax]
 0006BEF8    call        dword ptr [ecx+8]
 0006BEFB    ret
*}
end;

//0006BEFC
procedure TStatusBar.SetSimplePanel(Value:Boolean);
begin
{*
 0006BEFC    push        ebx
 0006BEFD    mov         ebx,eax
 0006BEFF    cmp         dl,byte ptr [ebx+1F8]
>0006BF05    je          0006BF35
 0006BF07    mov         byte ptr [ebx+1F8],dl
 0006BF0D    mov         eax,ebx
 0006BF0F    call        TWinControl.HandleAllocated
 0006BF14    test        al,al
>0006BF16    je          0006BF35
 0006BF18    push        0
 0006BF1A    xor         eax,eax
 0006BF1C    mov         al,byte ptr [ebx+1F8]
 0006BF22    push        eax
 0006BF23    push        409
 0006BF28    mov         eax,ebx
 0006BF2A    call        TWinControl.GetHandle
 0006BF2F    push        eax
 0006BF30    call        user32.SendMessageA
 0006BF35    pop         ebx
 0006BF36    ret
*}
end;

//0006BF38
procedure TStatusBar.DoRightToLeftAlignment(var Str:AnsiString; AAlignment:TAlignment; ARTLAlignment:Boolean);
begin
{*
 0006BF38    push        ebp
 0006BF39    mov         ebp,esp
 0006BF3B    push        ecx
 0006BF3C    push        ebx
 0006BF3D    mov         byte ptr [ebp-1],cl
 0006BF40    mov         ebx,edx
 0006BF42    cmp         byte ptr [ebp+8],0
>0006BF46    je          0006BF50
 0006BF48    lea         eax,[ebp-1]
 0006BF4B    call        ChangeBiDiModeAlignment
 0006BF50    mov         al,byte ptr [ebp-1]
 0006BF53    dec         al
>0006BF55    je          0006BF6E
 0006BF57    dec         al
>0006BF59    jne         0006BF7F
 0006BF5B    mov         edx,ebx
 0006BF5D    mov         ecx,1
 0006BF62    mov         eax,6BF90;#9
 0006BF67    call        @LStrInsert
>0006BF6C    jmp         0006BF7F
 0006BF6E    mov         edx,ebx
 0006BF70    mov         ecx,1
 0006BF75    mov         eax,6BF9C;#9+#9
 0006BF7A    call        @LStrInsert
 0006BF7F    pop         ebx
 0006BF80    pop         ecx
 0006BF81    pop         ebp
 0006BF82    ret         4
*}
end;

//0006BFA0
procedure TStatusBar.UpdateSimpleText;
begin
{*
 0006BFA0    push        ebx
 0006BFA1    push        esi
 0006BFA2    mov         esi,eax
 0006BFA4    mov         eax,esi
 0006BFA6    mov         bx,0FFCF
 0006BFAA    call        @CallDynaInst
 0006BFAF    push        eax
 0006BFB0    lea         edx,[esi+1F4]
 0006BFB6    xor         ecx,ecx
 0006BFB8    mov         eax,esi
 0006BFBA    call        TStatusBar.DoRightToLeftAlignment
 0006BFBF    mov         eax,esi
 0006BFC1    call        TWinControl.HandleAllocated
 0006BFC6    test        al,al
>0006BFC8    je          0006BFFF
 0006BFCA    mov         eax,dword ptr [esi+1F4]
 0006BFD0    call        @LStrToPChar
 0006BFD5    push        eax
 0006BFD6    mov         eax,esi
 0006BFD8    call        TControl.UseRightToLeftReading
 0006BFDD    and         eax,7F
 0006BFE0    mov         eax,dword ptr [eax*4+0B4C68]
 0006BFE7    or          eax,0FF
 0006BFEC    push        eax
 0006BFED    push        401
 0006BFF2    mov         eax,esi
 0006BFF4    call        TWinControl.GetHandle
 0006BFF9    push        eax
 0006BFFA    call        user32.SendMessageA
 0006BFFF    pop         esi
 0006C000    pop         ebx
 0006C001    ret
*}
end;

//0006C004
procedure TStatusBar.SetSimpleText(const Value:AnsiString);
begin
{*
 0006C004    push        ebx
 0006C005    push        esi
 0006C006    mov         esi,edx
 0006C008    mov         ebx,eax
 0006C00A    mov         eax,dword ptr [ebx+1F4]
 0006C010    mov         edx,esi
 0006C012    call        @LStrCmp
>0006C017    je          0006C02D
 0006C019    lea         eax,[ebx+1F4]
 0006C01F    mov         edx,esi
 0006C021    call        @LStrAsg
 0006C026    mov         eax,ebx
 0006C028    call        TStatusBar.UpdateSimpleText
 0006C02D    pop         esi
 0006C02E    pop         ebx
 0006C02F    ret
*}
end;

//0006C030
procedure TStatusBar.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 0006C030    push        ebx
 0006C031    push        esi
 0006C032    push        edi
 0006C033    mov         ebx,eax
 0006C035    mov         eax,ebx
 0006C037    call        TWinControl.CMBiDiModeChanged
 0006C03C    mov         eax,ebx
 0006C03E    call        TWinControl.HandleAllocated
 0006C043    test        al,al
>0006C045    je          0006C0A2
 0006C047    cmp         byte ptr [ebx+1F8],0;TStatusBar.SimplePanel:Boolean
>0006C04E    jne         0006C09B
 0006C050    mov         eax,dword ptr [ebx+1EC];TStatusBar.Panels:TStatusPanels
 0006C056    call        TCollection.GetCount
 0006C05B    mov         edi,eax
 0006C05D    dec         edi
 0006C05E    test        edi,edi
>0006C060    jl          0006C08E
 0006C062    inc         edi
 0006C063    xor         esi,esi
 0006C065    mov         edx,esi
 0006C067    mov         eax,dword ptr [ebx+1EC];TStatusBar.Panels:TStatusPanels
 0006C06D    call        TCoolBands.GetItem
 0006C072    cmp         byte ptr [eax+17],0;TCoolBand.FImageIndex:Integer
>0006C076    je          0006C08A
 0006C078    mov         edx,esi
 0006C07A    mov         eax,dword ptr [ebx+1EC];TStatusBar.Panels:TStatusPanels
 0006C080    call        TCoolBands.GetItem
 0006C085    call        TStatusPanel.ParentBiDiModeChanged
 0006C08A    inc         esi
 0006C08B    dec         edi
>0006C08C    jne         0006C065
 0006C08E    mov         cl,1
 0006C090    mov         dl,1
 0006C092    mov         eax,ebx
 0006C094    call        TStatusBar.UpdatePanels
>0006C099    jmp         0006C0A2
 0006C09B    mov         eax,ebx
 0006C09D    call        TStatusBar.UpdateSimpleText
 0006C0A2    pop         edi
 0006C0A3    pop         esi
 0006C0A4    pop         ebx
 0006C0A5    ret
*}
end;

//0006C0A8
procedure TStatusBar.FlipChildren(AllLevels:Boolean);
begin
{*
 0006C0A8    push        ebp
 0006C0A9    mov         ebp,esp
 0006C0AB    add         esp,0FFFFFFF0
 0006C0AE    push        ebx
 0006C0AF    push        esi
 0006C0B0    push        edi
 0006C0B1    mov         dword ptr [ebp-4],eax
 0006C0B4    mov         eax,dword ptr [ebp-4]
 0006C0B7    call        TWinControl.HandleAllocated
 0006C0BC    test        al,al
>0006C0BE    je          0006C260
 0006C0C4    mov         eax,dword ptr [ebp-4]
 0006C0C7    cmp         byte ptr [eax+1F8],0;TStatusBar.SimplePanel:Boolean
>0006C0CE    jne         0006C260
 0006C0D4    mov         eax,dword ptr [ebp-4]
 0006C0D7    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C0DD    call        TCollection.GetCount
 0006C0E2    test        eax,eax
>0006C0E4    jle         0006C260
 0006C0EA    mov         eax,dword ptr [ebp-4]
 0006C0ED    call        TControl.GetClientWidth
 0006C0F2    mov         dword ptr [ebp-0C],eax
 0006C0F5    mov         eax,dword ptr [ebp-4]
 0006C0F8    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C0FE    xor         edx,edx
 0006C100    call        TCoolBands.GetItem
 0006C105    mov         eax,dword ptr [eax+10];TCoolBand.FHorizontalOnly:Boolean
 0006C108    mov         dword ptr [ebp-8],eax
 0006C10B    mov         eax,dword ptr [ebp-4]
 0006C10E    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C114    call        TCollection.GetCount
 0006C119    mov         ebx,eax
 0006C11B    sub         ebx,2
 0006C11E    test        ebx,ebx
>0006C120    jl          0006C13F
 0006C122    inc         ebx
 0006C123    xor         esi,esi
 0006C125    mov         eax,dword ptr [ebp-4]
 0006C128    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C12E    mov         edx,esi
 0006C130    call        TCoolBands.GetItem
 0006C135    mov         eax,dword ptr [eax+10];TCoolBand.FHorizontalOnly:Boolean
 0006C138    sub         dword ptr [ebp-0C],eax
 0006C13B    inc         esi
 0006C13C    dec         ebx
>0006C13D    jne         0006C125
 0006C13F    mov         ecx,dword ptr [ebp-4]
 0006C142    mov         dl,1
 0006C144    mov         eax,[00066E8C];TStatusPanels
 0006C149    call        TStatusPanels.Create;TStatusPanels.Create
 0006C14E    mov         dword ptr [ebp-10],eax
 0006C151    xor         eax,eax
 0006C153    push        ebp
 0006C154    push        6C202
 0006C159    push        dword ptr fs:[eax]
 0006C15C    mov         dword ptr fs:[eax],esp
 0006C15F    mov         eax,dword ptr [ebp-4]
 0006C162    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C168    call        TCollection.GetCount
 0006C16D    mov         ebx,eax
 0006C16F    dec         ebx
 0006C170    test        ebx,ebx
>0006C172    jl          0006C19E
 0006C174    inc         ebx
 0006C175    xor         esi,esi
 0006C177    mov         eax,dword ptr [ebp-10]
 0006C17A    call        TCoolBands.Add
 0006C17F    mov         edi,eax
 0006C181    mov         eax,dword ptr [ebp-4]
 0006C184    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C18A    mov         edx,esi
 0006C18C    call        TCoolBands.GetItem
 0006C191    mov         edx,eax
 0006C193    mov         eax,edi
 0006C195    mov         ecx,dword ptr [eax]
 0006C197    call        dword ptr [ecx+8]
 0006C19A    inc         esi
 0006C19B    dec         ebx
>0006C19C    jne         0006C177
 0006C19E    mov         eax,dword ptr [ebp-4]
 0006C1A1    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C1A7    call        TCollection.GetCount
 0006C1AC    mov         ebx,eax
 0006C1AE    dec         ebx
 0006C1AF    test        ebx,ebx
>0006C1B1    jl          0006C1EC
 0006C1B3    inc         ebx
 0006C1B4    xor         esi,esi
 0006C1B6    mov         eax,dword ptr [ebp-4]
 0006C1B9    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C1BF    call        TCollection.GetCount
 0006C1C4    mov         edx,eax
 0006C1C6    sub         edx,esi
 0006C1C8    dec         edx
 0006C1C9    mov         eax,dword ptr [ebp-10]
 0006C1CC    call        TCoolBands.GetItem
 0006C1D1    push        eax
 0006C1D2    mov         eax,dword ptr [ebp-4]
 0006C1D5    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C1DB    mov         edx,esi
 0006C1DD    call        TCoolBands.GetItem
 0006C1E2    pop         edx
 0006C1E3    mov         ecx,dword ptr [eax]
 0006C1E5    call        dword ptr [ecx+8]
 0006C1E8    inc         esi
 0006C1E9    dec         ebx
>0006C1EA    jne         0006C1B6
 0006C1EC    xor         eax,eax
 0006C1EE    pop         edx
 0006C1EF    pop         ecx
 0006C1F0    pop         ecx
 0006C1F1    mov         dword ptr fs:[eax],edx
 0006C1F4    push        6C209
 0006C1F9    mov         eax,dword ptr [ebp-10]
 0006C1FC    call        TObject.Free
 0006C201    ret
>0006C202    jmp         @HandleFinally
>0006C207    jmp         0006C1F9
 0006C209    mov         eax,dword ptr [ebp-4]
 0006C20C    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C212    call        TCollection.GetCount
 0006C217    dec         eax
>0006C218    jle         0006C254
 0006C21A    mov         eax,dword ptr [ebp-4]
 0006C21D    mov         ebx,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C223    mov         eax,ebx
 0006C225    call        TCollection.GetCount
 0006C22A    mov         edx,eax
 0006C22C    dec         edx
 0006C22D    mov         eax,ebx
 0006C22F    call        TCoolBands.GetItem
 0006C234    mov         edx,dword ptr [ebp-8]
 0006C237    call        TStatusPanel.SetWidth
 0006C23C    mov         eax,dword ptr [ebp-4]
 0006C23F    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 0006C245    xor         edx,edx
 0006C247    call        TCoolBands.GetItem
 0006C24C    mov         edx,dword ptr [ebp-0C]
 0006C24F    call        TStatusPanel.SetWidth
 0006C254    mov         cl,1
 0006C256    mov         dl,1
 0006C258    mov         eax,dword ptr [ebp-4]
 0006C25B    call        TStatusBar.UpdatePanels
 0006C260    pop         edi
 0006C261    pop         esi
 0006C262    pop         ebx
 0006C263    mov         esp,ebp
 0006C265    pop         ebp
 0006C266    ret
*}
end;

//0006C268
procedure TStatusBar.SetSizeGrip(Value:Boolean);
begin
{*
 0006C268    cmp         dl,byte ptr [eax+1F9]
>0006C26E    je          0006C27B
 0006C270    mov         byte ptr [eax+1F9],dl
 0006C276    call        TWinControl.RecreateWnd
 0006C27B    ret
*}
end;

//0006C27C
procedure TStatusBar.SyncToSystemFont;
begin
{*
 0006C27C    push        ebx
 0006C27D    add         esp,0FFFFFEAC
 0006C283    mov         ebx,eax
 0006C285    cmp         byte ptr [ebx+1FA],0
>0006C28C    je          0006C2C0
 0006C28E    mov         dword ptr [esp],154
 0006C295    push        0
 0006C297    lea         eax,[esp+4]
 0006C29B    push        eax
 0006C29C    push        0
 0006C29E    push        29
 0006C2A0    call        user32.SystemParametersInfoA
 0006C2A5    test        eax,eax
>0006C2A7    je          0006C2C0
 0006C2A9    lea         eax,[esp+0DC]
 0006C2B0    push        eax
 0006C2B1    call        gdi32.CreateFontIndirectA
 0006C2B6    mov         edx,eax
 0006C2B8    mov         eax,dword ptr [ebx+58]
 0006C2BB    call        TFont.SetHandle
 0006C2C0    add         esp,154
 0006C2C6    pop         ebx
 0006C2C7    ret
*}
end;

//0006C2C8
procedure TStatusBar.UpdatePanel(Index:Integer; Repaint:Boolean);
begin
{*
 0006C2C8    push        ebp
 0006C2C9    mov         ebp,esp
 0006C2CB    add         esp,0FFFFFFE8
 0006C2CE    push        ebx
 0006C2CF    push        esi
 0006C2D0    push        edi
 0006C2D1    xor         ebx,ebx
 0006C2D3    mov         dword ptr [ebp-8],ebx
 0006C2D6    mov         byte ptr [ebp-1],cl
 0006C2D9    mov         ebx,edx
 0006C2DB    mov         esi,eax
 0006C2DD    xor         eax,eax
 0006C2DF    push        ebp
 0006C2E0    push        6C428
 0006C2E5    push        dword ptr fs:[eax]
 0006C2E8    mov         dword ptr fs:[eax],esp
 0006C2EB    mov         eax,esi
 0006C2ED    call        TWinControl.HandleAllocated
 0006C2F2    test        al,al
>0006C2F4    je          0006C412
 0006C2FA    mov         edx,ebx
 0006C2FC    mov         eax,dword ptr [esi+1EC]
 0006C302    call        TCoolBands.GetItem
 0006C307    mov         ebx,eax
 0006C309    cmp         byte ptr [ebp-1],0
>0006C30D    jne         0006C349
 0006C30F    mov         byte ptr [ebx+19],1
 0006C313    lea         eax,[ebp-18]
 0006C316    push        eax
 0006C317    mov         eax,ebx
 0006C319    call        TCollectionItem.GetIndex
 0006C31E    push        eax
 0006C31F    push        40A
 0006C324    mov         eax,esi
 0006C326    call        TWinControl.GetHandle
 0006C32B    push        eax
 0006C32C    call        user32.SendMessageA
 0006C331    push        0FF
 0006C333    lea         eax,[ebp-18]
 0006C336    push        eax
 0006C337    mov         eax,esi
 0006C339    call        TWinControl.GetHandle
 0006C33E    push        eax
 0006C33F    call        user32.InvalidateRect
>0006C344    jmp         0006C412
 0006C349    cmp         byte ptr [ebx+19],0
>0006C34D    je          0006C412
 0006C353    mov         byte ptr [ebx+19],0
 0006C357    xor         edi,edi
 0006C359    mov         al,byte ptr [ebx+15]
 0006C35C    sub         al,1
>0006C35E    jb          0006C366
 0006C360    dec         al
>0006C362    je          0006C36D
>0006C364    jmp         0006C372
 0006C366    mov         edi,100
>0006C36B    jmp         0006C372
 0006C36D    mov         edi,200
 0006C372    mov         eax,ebx
 0006C374    call        TStatusPanel.UseRightToLeftReading
 0006C379    test        al,al
>0006C37B    je          0006C383
 0006C37D    or          edi,400
 0006C383    cmp         byte ptr [ebx+18],1
>0006C387    jne         0006C38F
 0006C389    or          edi,1000
 0006C38F    lea         eax,[ebp-8]
 0006C392    mov         edx,dword ptr [ebx+0C]
 0006C395    call        @LStrLAsg
 0006C39A    mov         eax,ebx
 0006C39C    call        TStatusPanel.UseRightToLeftAlignment
 0006C3A1    test        al,al
>0006C3A3    je          0006C3BC
 0006C3A5    mov         eax,ebx
 0006C3A7    call        TStatusPanel.UseRightToLeftAlignment
 0006C3AC    push        eax
 0006C3AD    lea         edx,[ebp-8]
 0006C3B0    mov         cl,byte ptr [ebx+14]
 0006C3B3    mov         eax,esi
 0006C3B5    call        TStatusBar.DoRightToLeftAlignment
>0006C3BA    jmp         0006C3ED
 0006C3BC    mov         al,byte ptr [ebx+14]
 0006C3BF    dec         al
>0006C3C1    je          0006C3DB
 0006C3C3    dec         al
>0006C3C5    jne         0006C3ED
 0006C3C7    lea         edx,[ebp-8]
 0006C3CA    mov         ecx,1
 0006C3CF    mov         eax,6C440;#9
 0006C3D4    call        @LStrInsert
>0006C3D9    jmp         0006C3ED
 0006C3DB    lea         edx,[ebp-8]
 0006C3DE    mov         ecx,1
 0006C3E3    mov         eax,6C44C;#9+#9
 0006C3E8    call        @LStrInsert
 0006C3ED    mov         eax,dword ptr [ebp-8]
 0006C3F0    call        @LStrToPChar
 0006C3F5    push        eax
 0006C3F6    mov         eax,ebx
 0006C3F8    call        TCollectionItem.GetIndex
 0006C3FD    or          edi,eax
 0006C3FF    push        edi
 0006C400    push        401
 0006C405    mov         eax,esi
 0006C407    call        TWinControl.GetHandle
 0006C40C    push        eax
 0006C40D    call        user32.SendMessageA
 0006C412    xor         eax,eax
 0006C414    pop         edx
 0006C415    pop         ecx
 0006C416    pop         ecx
 0006C417    mov         dword ptr fs:[eax],edx
 0006C41A    push        6C42F
 0006C41F    lea         eax,[ebp-8]
 0006C422    call        @LStrClr
 0006C427    ret
>0006C428    jmp         @HandleFinally
>0006C42D    jmp         0006C41F
 0006C42F    pop         edi
 0006C430    pop         esi
 0006C431    pop         ebx
 0006C432    mov         esp,ebp
 0006C434    pop         ebp
 0006C435    ret
*}
end;

//0006C450
procedure TStatusBar.UpdatePanels(UpdateRects:Boolean; UpdateText:Boolean);
begin
{*
 0006C450    push        ebx
 0006C451    push        esi
 0006C452    push        edi
 0006C453    push        ebp
 0006C454    add         esp,0FFFFFDF4
 0006C45A    mov         byte ptr [esp],cl
 0006C45D    mov         ebx,edx
 0006C45F    mov         esi,eax
 0006C461    mov         eax,esi
 0006C463    call        TWinControl.HandleAllocated
 0006C468    test        al,al
>0006C46A    je          0006C559
 0006C470    mov         eax,dword ptr [esi+1EC]
 0006C476    call        TCollection.GetCount
 0006C47B    mov         dword ptr [esp+4],eax
 0006C47F    test        bl,bl
>0006C481    je          0006C53D
 0006C487    cmp         dword ptr [esp+4],80
>0006C48F    jle         0006C499
 0006C491    mov         dword ptr [esp+4],80
 0006C499    cmp         dword ptr [esp+4],0
>0006C49E    jne         0006C4DC
 0006C4A0    mov         dword ptr [esp+0C],0FFFFFFFF
 0006C4A8    lea         eax,[esp+0C]
 0006C4AC    push        eax
 0006C4AD    push        1
 0006C4AF    push        404
 0006C4B4    mov         eax,esi
 0006C4B6    call        TWinControl.GetHandle
 0006C4BB    push        eax
 0006C4BC    call        user32.SendMessageA
 0006C4C1    push        6C564
 0006C4C6    push        0
 0006C4C8    push        401
 0006C4CD    mov         eax,esi
 0006C4CF    call        TWinControl.GetHandle
 0006C4D4    push        eax
 0006C4D5    call        user32.SendMessageA
>0006C4DA    jmp         0006C53D
 0006C4DC    xor         eax,eax
 0006C4DE    mov         dword ptr [esp+8],eax
 0006C4E2    mov         ebp,dword ptr [esp+4]
 0006C4E6    sub         ebp,2
 0006C4E9    test        ebp,ebp
>0006C4EB    jl          0006C515
 0006C4ED    inc         ebp
 0006C4EE    xor         edi,edi
 0006C4F0    lea         ebx,[esp+0C]
 0006C4F4    mov         edx,edi
 0006C4F6    mov         eax,dword ptr [esi+1EC]
 0006C4FC    call        TCoolBands.GetItem
 0006C501    mov         eax,dword ptr [eax+10]
 0006C504    add         dword ptr [esp+8],eax
 0006C508    mov         eax,dword ptr [esp+8]
 0006C50C    mov         dword ptr [ebx],eax
 0006C50E    inc         edi
 0006C50F    add         ebx,4
 0006C512    dec         ebp
>0006C513    jne         0006C4F4
 0006C515    mov         eax,dword ptr [esp+4]
 0006C519    mov         dword ptr [esp+eax*4+8],0FFFFFFFF
 0006C521    lea         eax,[esp+0C]
 0006C525    push        eax
 0006C526    mov         eax,dword ptr [esp+8]
 0006C52A    push        eax
 0006C52B    push        404
 0006C530    mov         eax,esi
 0006C532    call        TWinControl.GetHandle
 0006C537    push        eax
 0006C538    call        user32.SendMessageA
 0006C53D    mov         ebp,dword ptr [esp+4]
 0006C541    dec         ebp
 0006C542    test        ebp,ebp
>0006C544    jl          0006C559
 0006C546    inc         ebp
 0006C547    xor         edi,edi
 0006C549    mov         cl,byte ptr [esp]
 0006C54C    mov         edx,edi
 0006C54E    mov         eax,esi
 0006C550    call        TStatusBar.UpdatePanel
 0006C555    inc         edi
 0006C556    dec         ebp
>0006C557    jne         0006C549
 0006C559    add         esp,20C
 0006C55F    pop         ebp
 0006C560    pop         edi
 0006C561    pop         esi
 0006C562    pop         ebx
 0006C563    ret
*}
end;

//0006C568
procedure TStatusBar.CMWinIniChange(var Message:TMessage);
begin
{*
 0006C568    push        ebx
 0006C569    push        esi
 0006C56A    mov         ebx,edx
 0006C56C    mov         esi,eax
 0006C56E    mov         edx,ebx
 0006C570    mov         eax,esi
 0006C572    call        TWinControl.CMWinIniChange
 0006C577    mov         eax,dword ptr [ebx+4]
 0006C57A    test        eax,eax
>0006C57C    je          0006C583
 0006C57E    cmp         eax,2A
>0006C581    jne         0006C58A
 0006C583    mov         eax,esi
 0006C585    call        TStatusBar.SyncToSystemFont
 0006C58A    pop         esi
 0006C58B    pop         ebx
 0006C58C    ret
*}
end;

//0006C590
{*procedure TStatusBar.sub_0006C590(?:?);
begin
 0006C590    push        ebx
 0006C591    push        esi
 0006C592    push        edi
 0006C593    push        ebp
 0006C594    push        ecx
 0006C595    mov         ebp,edx
 0006C597    mov         esi,eax
 0006C599    mov         edi,dword ptr [ebp+8]
 0006C59C    mov         eax,dword ptr [edi+18]
 0006C59F    push        eax
 0006C5A0    call        gdi32.SaveDC
 0006C5A5    mov         dword ptr [esp],eax
 0006C5A8    mov         edx,dword ptr [edi+18]
 0006C5AB    mov         eax,dword ptr [esi+1F0];TStatusBar.FCanvas:TCanvas
 0006C5B1    call        TCanvas.SetHandle
 0006C5B6    mov         edx,dword ptr [esi+58];TStatusBar.FFont:TFont
 0006C5B9    mov         eax,dword ptr [esi+1F0];TStatusBar.FCanvas:TCanvas
 0006C5BF    call        TCanvas.SetFont
 0006C5C4    mov         eax,dword ptr [esi+1F0];TStatusBar.FCanvas:TCanvas
 0006C5CA    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0006C5CD    mov         edx,8000000F
 0006C5D2    call        TBrush.SetColor
 0006C5D7    mov         eax,dword ptr [esi+1F0];TStatusBar.FCanvas:TCanvas
 0006C5DD    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0006C5E0    xor         edx,edx
 0006C5E2    call        TBrush.SetStyle
 0006C5E7    mov         edx,dword ptr [edi+8]
 0006C5EA    mov         eax,dword ptr [esi+1EC];TStatusBar.Panels:TStatusPanels
 0006C5F0    call        TCoolBands.GetItem
 0006C5F5    mov         edx,eax
 0006C5F7    lea         ecx,[edi+1C]
 0006C5FA    mov         eax,esi
 0006C5FC    mov         bx,0FFB8
 0006C600    call        @CallDynaInst;TStatusBar.DrawPanel
 0006C605    xor         edx,edx
 0006C607    mov         eax,dword ptr [esi+1F0];TStatusBar.FCanvas:TCanvas
 0006C60D    call        TCanvas.SetHandle
 0006C612    mov         eax,dword ptr [esp]
 0006C615    push        eax
 0006C616    mov         eax,dword ptr [edi+18]
 0006C619    push        eax
 0006C61A    call        gdi32.RestoreDC
 0006C61F    mov         dword ptr [ebp+0C],1
 0006C626    pop         edx
 0006C627    pop         ebp
 0006C628    pop         edi
 0006C629    pop         esi
 0006C62A    pop         ebx
 0006C62B    ret
end;*}

//0006C62C
procedure TStatusBar.WMGetTextLength(var Message:TWMGetTextLength);
begin
{*
 0006C62C    push        ebx
 0006C62D    push        esi
 0006C62E    mov         esi,edx
 0006C630    mov         ebx,eax
 0006C632    mov         eax,dword ptr [ebx+1F4]
 0006C638    call        @LStrLen
 0006C63D    mov         dword ptr [esi+0C],eax
 0006C640    pop         esi
 0006C641    pop         ebx
 0006C642    ret
*}
end;

//0006C644
procedure TStatusBar.WMPaint(var Message:TWMPaint);
begin
{*
 0006C644    push        ebx
 0006C645    push        esi
 0006C646    mov         esi,edx
 0006C648    mov         ebx,eax
 0006C64A    mov         cl,1
 0006C64C    xor         edx,edx
 0006C64E    mov         eax,ebx
 0006C650    call        TStatusBar.UpdatePanels
 0006C655    mov         edx,esi
 0006C657    mov         eax,ebx
 0006C659    call        TWinControl.WMPaint
 0006C65E    pop         esi
 0006C65F    pop         ebx
 0006C660    ret
*}
end;

//0006C664
procedure TStatusBar.WMSize(var Message:TWMSize);
begin
{*
 0006C664    push        ebx
 0006C665    push        esi
 0006C666    mov         esi,eax
 0006C668    test        byte ptr [esi+20],1
>0006C66C    jne         0006C679
 0006C66E    mov         eax,esi
 0006C670    mov         bx,0FFD5
 0006C674    call        @CallDynaInst
 0006C679    mov         eax,esi
 0006C67B    mov         edx,dword ptr [eax]
 0006C67D    call        dword ptr [edx+7C]
 0006C680    pop         esi
 0006C681    pop         ebx
 0006C682    ret
*}
end;

//0006C684
function TStatusBar.IsFontStored(Value:TFont):Boolean;
begin
{*
 0006C684    cmp         byte ptr [eax+1FA],0
>0006C68B    jne         0006C699
 0006C68D    cmp         byte ptr [eax+49],0
>0006C691    jne         0006C699
 0006C693    cmp         byte ptr [eax+46],0
>0006C697    je          0006C69C
 0006C699    xor         eax,eax
 0006C69B    ret
 0006C69C    mov         al,1
 0006C69E    ret
*}
end;

//0006C6A0
procedure TStatusBar.SetUseSystemFont(const Value:Boolean);
begin
{*
 0006C6A0    push        ebx
 0006C6A1    mov         ebx,eax
 0006C6A3    cmp         dl,byte ptr [ebx+1FA]
>0006C6A9    je          0006C6CB
 0006C6AB    mov         byte ptr [ebx+1FA],dl
 0006C6B1    test        dl,dl
>0006C6B3    je          0006C6CB
 0006C6B5    cmp         byte ptr [ebx+49],0
>0006C6B9    je          0006C6C4
 0006C6BB    xor         edx,edx
 0006C6BD    mov         eax,ebx
 0006C6BF    call        TControl.SetParentFont
 0006C6C4    mov         eax,ebx
 0006C6C6    call        TStatusBar.SyncToSystemFont
 0006C6CB    pop         ebx
 0006C6CC    ret
*}
end;

//0006C6D0
procedure TCustomTreeView.CMColorChanged(var Message:TMessage);
begin
{*
 0006C6D0    push        ebx
 0006C6D1    mov         ebx,eax
 0006C6D3    mov         eax,ebx
 0006C6D5    call        TWinControl.CMColorChanged
 0006C6DA    mov         eax,ebx
 0006C6DC    call        TWinControl.RecreateWnd
 0006C6E1    pop         ebx
 0006C6E2    ret
*}
end;

//0006C6E4
procedure TStatusBar.CMParentFontChanged(var Message:TMessage);
begin
{*
 0006C6E4    push        ebx
 0006C6E5    mov         ebx,eax
 0006C6E7    mov         eax,ebx
 0006C6E9    call        TControl.CMParentFontChanged
 0006C6EE    cmp         byte ptr [ebx+1FA],0
>0006C6F5    je          0006C704
 0006C6F7    cmp         byte ptr [ebx+49],0
>0006C6FB    je          0006C704
 0006C6FD    mov         byte ptr [ebx+1FA],0
 0006C704    pop         ebx
 0006C705    ret
*}
end;

//0006C708
procedure TStatusBar.ExecuteAction(Action:TBasicAction);
begin
{*
 0006C708    push        ebx
 0006C709    push        esi
 0006C70A    mov         esi,edx
 0006C70C    mov         ebx,eax
 0006C70E    cmp         byte ptr [ebx+1FB],0;TStatusBar.AutoHint:Boolean
>0006C715    je          0006C774
 0006C717    mov         eax,esi
 0006C719    mov         edx,dword ptr ds:[3DDB0];THintAction
 0006C71F    call        @IsClass
 0006C724    test        al,al
>0006C726    je          0006C774
 0006C728    mov         eax,ebx
 0006C72A    mov         edx,dword ptr [eax]
 0006C72C    call        dword ptr [edx+0B8];TStatusBar.DoHint
 0006C732    test        al,al
>0006C734    jne         0006C774
 0006C736    cmp         byte ptr [ebx+1F8],0;TStatusBar.SimplePanel:Boolean
>0006C73D    jne         0006C74E
 0006C73F    mov         eax,dword ptr [ebx+1EC];TStatusBar.Panels:TStatusPanels
 0006C745    call        TCollection.GetCount
 0006C74A    test        eax,eax
>0006C74C    jne         0006C75A
 0006C74E    mov         edx,dword ptr [esi+58]
 0006C751    mov         eax,ebx
 0006C753    call        TStatusBar.SetSimpleText
>0006C758    jmp         0006C76F
 0006C75A    xor         edx,edx
 0006C75C    mov         eax,dword ptr [ebx+1EC];TStatusBar.Panels:TStatusPanels
 0006C762    call        TCoolBands.GetItem
 0006C767    mov         edx,dword ptr [esi+58]
 0006C76A    call        TStatusPanel.SetText
 0006C76F    mov         al,1
 0006C771    pop         esi
 0006C772    pop         ebx
 0006C773    ret
 0006C774    mov         edx,esi
 0006C776    mov         eax,ebx
 0006C778    call        TComponent.ExecuteAction
 0006C77D    pop         esi
 0006C77E    pop         ebx
 0006C77F    ret
*}
end;

//0006C780
procedure ProgressLimitError;
begin
{*
 0006C780    push        ebp
 0006C781    mov         ebp,esp
 0006C783    add         esp,0FFFFFFEC
 0006C786    xor         eax,eax
 0006C788    mov         dword ptr [ebp-14],eax
 0006C78B    xor         eax,eax
 0006C78D    push        ebp
 0006C78E    push        6C7EA
 0006C793    push        dword ptr fs:[eax]
 0006C796    mov         dword ptr fs:[eax],esp
 0006C799    xor         eax,eax
 0006C79B    mov         dword ptr [ebp-10],eax
 0006C79E    mov         byte ptr [ebp-0C],0
 0006C7A2    mov         dword ptr [ebp-8],0FFFF
 0006C7A9    mov         byte ptr [ebp-4],0
 0006C7AD    lea         eax,[ebp-10]
 0006C7B0    push        eax
 0006C7B1    push        1
 0006C7B3    lea         edx,[ebp-14]
 0006C7B6    mov         eax,[000B5898];^SOutOfRange:TResStringRec
 0006C7BB    call        LoadResString
 0006C7C0    mov         ecx,dword ptr [ebp-14]
 0006C7C3    mov         dl,1
 0006C7C5    mov         eax,[000176E8];Exception
 0006C7CA    call        Exception.CreateFmt
 0006C7CF    call        @RaiseExcept
 0006C7D4    xor         eax,eax
 0006C7D6    pop         edx
 0006C7D7    pop         ecx
 0006C7D8    pop         ecx
 0006C7D9    mov         dword ptr fs:[eax],edx
 0006C7DC    push        6C7F1
 0006C7E1    lea         eax,[ebp-14]
 0006C7E4    call        @LStrClr
 0006C7E9    ret
>0006C7EA    jmp         @HandleFinally
>0006C7EF    jmp         0006C7E1
 0006C7F1    mov         esp,ebp
 0006C7F3    pop         ebp
 0006C7F4    ret
*}
end;

//0006C7F8
constructor TProgressBar.Create(AOwner:TComponent);
begin
{*
 0006C7F8    push        ebx
 0006C7F9    push        esi
 0006C7FA    push        edi
 0006C7FB    test        dl,dl
>0006C7FD    je          0006C807
 0006C7FF    add         esp,0FFFFFFF0
 0006C802    call        @ClassCreate
 0006C807    mov         esi,ecx
 0006C809    mov         ebx,edx
 0006C80B    mov         edi,eax
 0006C80D    mov         eax,20
 0006C812    call        InitCommonControl
 0006C817    mov         byte ptr [edi+1EC],al
 0006C81D    mov         ecx,esi
 0006C81F    xor         edx,edx
 0006C821    mov         eax,edi
 0006C823    call        TWinControl.Create
 0006C828    mov         edx,96
 0006C82D    mov         eax,edi
 0006C82F    call        TControl.SetWidth
 0006C834    push        14
 0006C836    call        user32.GetSystemMetrics
 0006C83B    mov         edx,eax
 0006C83D    mov         eax,edi
 0006C83F    call        TControl.SetHeight
 0006C844    xor         eax,eax
 0006C846    mov         dword ptr [edi+1F0],eax
 0006C84C    mov         dword ptr [edi+1F4],64
 0006C856    mov         dword ptr [edi+1FC],0A
 0006C860    mov         byte ptr [edi+200],0
 0006C867    mov         eax,edi
 0006C869    test        bl,bl
>0006C86B    je          0006C87C
 0006C86D    call        @AfterConstruction
 0006C872    pop         dword ptr fs:[0]
 0006C879    add         esp,0C
 0006C87C    mov         eax,edi
 0006C87E    pop         edi
 0006C87F    pop         esi
 0006C880    pop         ebx
 0006C881    ret
*}
end;

//0006C884
procedure TProgressBar.CreateParams(var Params:TCreateParams);
begin
{*
 0006C884    push        ebx
 0006C885    push        esi
 0006C886    mov         esi,edx
 0006C888    mov         ebx,eax
 0006C88A    cmp         byte ptr [ebx+1EC],0
>0006C891    jne         0006C898
 0006C893    call        comctl32.InitCommonControls
 0006C898    mov         edx,esi
 0006C89A    mov         eax,ebx
 0006C89C    call        TWinControl.CreateParams
 0006C8A1    mov         ecx,6C8DC
 0006C8A6    mov         edx,esi
 0006C8A8    mov         eax,ebx
 0006C8AA    call        TWinControl.CreateSubClass
 0006C8AF    cmp         byte ptr [ebx+200],1
>0006C8B6    jne         0006C8BC
 0006C8B8    or          dword ptr [esi+4],4
 0006C8BC    cmp         byte ptr [ebx+201],0
>0006C8C3    je          0006C8C9
 0006C8C5    or          dword ptr [esi+4],1
 0006C8C9    mov         edx,dword ptr [ebx+1F8]
 0006C8CF    mov         eax,ebx
 0006C8D1    call        TProgressBar.SetPosition
 0006C8D6    pop         esi
 0006C8D7    pop         ebx
 0006C8D8    ret
*}
end;

//0006C8F0
procedure TProgressBar.CreateWnd;
begin
{*
 0006C8F0    push        ebx
 0006C8F1    mov         ebx,eax
 0006C8F3    mov         eax,ebx
 0006C8F5    call        TWinControl.CreateWnd
 0006C8FA    cmp         byte ptr [ebx+1EC],0
>0006C901    je          0006C925
 0006C903    mov         eax,dword ptr [ebx+1F4]
 0006C909    push        eax
 0006C90A    mov         eax,dword ptr [ebx+1F0]
 0006C910    push        eax
 0006C911    push        406
 0006C916    mov         eax,ebx
 0006C918    call        TWinControl.GetHandle
 0006C91D    push        eax
 0006C91E    call        user32.SendMessageA
>0006C923    jmp         0006C94D
 0006C925    mov         dx,word ptr [ebx+1F4]
 0006C92C    mov         ax,word ptr [ebx+1F0]
 0006C933    call        MakeLong
 0006C938    push        eax
 0006C939    push        0
 0006C93B    push        401
 0006C940    mov         eax,ebx
 0006C942    call        TWinControl.GetHandle
 0006C947    push        eax
 0006C948    call        user32.SendMessageA
 0006C94D    push        0
 0006C94F    mov         eax,dword ptr [ebx+1FC]
 0006C955    push        eax
 0006C956    push        404
 0006C95B    mov         eax,ebx
 0006C95D    call        TWinControl.GetHandle
 0006C962    push        eax
 0006C963    call        user32.SendMessageA
 0006C968    mov         edx,dword ptr [ebx+1F8]
 0006C96E    mov         eax,ebx
 0006C970    call        TProgressBar.SetPosition
 0006C975    pop         ebx
 0006C976    ret
*}
end;

//0006C978
function TProgressBar.GetMin:Integer;
begin
{*
 0006C978    push        ebx
 0006C979    mov         ebx,eax
 0006C97B    mov         eax,ebx
 0006C97D    call        TWinControl.HandleAllocated
 0006C982    test        al,al
>0006C984    je          0006C9A7
 0006C986    cmp         byte ptr [ebx+1EC],0
>0006C98D    je          0006C9A7
 0006C98F    push        0
 0006C991    push        1
 0006C993    push        407
 0006C998    mov         eax,ebx
 0006C99A    call        TWinControl.GetHandle
 0006C99F    push        eax
 0006C9A0    call        user32.SendMessageA
 0006C9A5    pop         ebx
 0006C9A6    ret
 0006C9A7    mov         eax,dword ptr [ebx+1F0]
 0006C9AD    pop         ebx
 0006C9AE    ret
*}
end;

//0006C9B0
function TProgressBar.GetMax:Integer;
begin
{*
 0006C9B0    push        ebx
 0006C9B1    mov         ebx,eax
 0006C9B3    mov         eax,ebx
 0006C9B5    call        TWinControl.HandleAllocated
 0006C9BA    test        al,al
>0006C9BC    je          0006C9DF
 0006C9BE    cmp         byte ptr [ebx+1EC],0
>0006C9C5    je          0006C9DF
 0006C9C7    push        0
 0006C9C9    push        0
 0006C9CB    push        407
 0006C9D0    mov         eax,ebx
 0006C9D2    call        TWinControl.GetHandle
 0006C9D7    push        eax
 0006C9D8    call        user32.SendMessageA
 0006C9DD    pop         ebx
 0006C9DE    ret
 0006C9DF    mov         eax,dword ptr [ebx+1F4]
 0006C9E5    pop         ebx
 0006C9E6    ret
*}
end;

//0006C9E8
function TProgressBar.GetPosition:Integer;
begin
{*
 0006C9E8    push        ebx
 0006C9E9    mov         ebx,eax
 0006C9EB    mov         eax,ebx
 0006C9ED    call        TWinControl.HandleAllocated
 0006C9F2    test        al,al
>0006C9F4    je          0006CA2F
 0006C9F6    cmp         byte ptr [ebx+1EC],0
>0006C9FD    je          0006CA17
 0006C9FF    push        0
 0006CA01    push        0
 0006CA03    push        408
 0006CA08    mov         eax,ebx
 0006CA0A    call        TWinControl.GetHandle
 0006CA0F    push        eax
 0006CA10    call        user32.SendMessageA
>0006CA15    jmp         0006CA35
 0006CA17    push        0
 0006CA19    push        0
 0006CA1B    push        403
 0006CA20    mov         eax,ebx
 0006CA22    call        TWinControl.GetHandle
 0006CA27    push        eax
 0006CA28    call        user32.SendMessageA
 0006CA2D    pop         ebx
 0006CA2E    ret
 0006CA2F    mov         eax,dword ptr [ebx+1F8]
 0006CA35    pop         ebx
 0006CA36    ret
*}
end;

//0006CA38
procedure TProgressBar.SetParams(AMin:Integer; AMax:Integer);
begin
{*
 0006CA38    push        ebp
 0006CA39    mov         ebp,esp
 0006CA3B    add         esp,0FFFFFEF4
 0006CA41    push        ebx
 0006CA42    push        esi
 0006CA43    push        edi
 0006CA44    xor         ebx,ebx
 0006CA46    mov         dword ptr [ebp-10C],ebx
 0006CA4C    mov         edi,ecx
 0006CA4E    mov         esi,edx
 0006CA50    mov         ebx,eax
 0006CA52    xor         eax,eax
 0006CA54    push        ebp
 0006CA55    push        6CB6B
 0006CA5A    push        dword ptr fs:[eax]
 0006CA5D    mov         dword ptr fs:[eax],esp
 0006CA60    cmp         esi,edi
>0006CA62    jle         0006CAAB
 0006CA64    lea         edx,[ebp-108]
 0006CA6A    mov         eax,dword ptr [ebx]
 0006CA6C    call        TObject.ClassName
 0006CA71    lea         eax,[ebp-108]
 0006CA77    mov         dword ptr [ebp-8],eax
 0006CA7A    mov         byte ptr [ebp-4],4
 0006CA7E    lea         eax,[ebp-8]
 0006CA81    push        eax
 0006CA82    push        0
 0006CA84    lea         edx,[ebp-10C]
 0006CA8A    mov         eax,[000B5820];^SPropertyOutOfRange:TResStringRec
 0006CA8F    call        LoadResString
 0006CA94    mov         ecx,dword ptr [ebp-10C]
 0006CA9A    mov         dl,1
 0006CA9C    mov         eax,[0001EE64];EInvalidOperation
 0006CAA1    call        Exception.CreateFmt
 0006CAA6    call        @RaiseExcept
 0006CAAB    cmp         byte ptr [ebx+1EC],0
>0006CAB2    jne         0006CAD1
 0006CAB4    test        esi,esi
>0006CAB6    jl          0006CACC
 0006CAB8    cmp         esi,0FFFF
>0006CABE    jg          0006CACC
 0006CAC0    test        edi,edi
>0006CAC2    jl          0006CACC
 0006CAC4    cmp         edi,0FFFF
>0006CACA    jle         0006CAD1
 0006CACC    call        ProgressLimitError
 0006CAD1    cmp         esi,dword ptr [ebx+1F0]
>0006CAD7    jne         0006CAE1
 0006CAD9    cmp         edi,dword ptr [ebx+1F4]
>0006CADF    je          0006CB52
 0006CAE1    mov         eax,ebx
 0006CAE3    call        TWinControl.HandleAllocated
 0006CAE8    test        al,al
>0006CAEA    je          0006CB46
 0006CAEC    cmp         byte ptr [ebx+1EC],0
>0006CAF3    je          0006CB0B
 0006CAF5    push        edi
 0006CAF6    push        esi
 0006CAF7    push        406
 0006CAFC    mov         eax,ebx
 0006CAFE    call        TWinControl.GetHandle
 0006CB03    push        eax
 0006CB04    call        user32.SendMessageA
>0006CB09    jmp         0006CB29
 0006CB0B    mov         edx,edi
 0006CB0D    mov         eax,esi
 0006CB0F    call        MakeLong
 0006CB14    push        eax
 0006CB15    push        0
 0006CB17    push        401
 0006CB1C    mov         eax,ebx
 0006CB1E    call        TWinControl.GetHandle
 0006CB23    push        eax
 0006CB24    call        user32.SendMessageA
 0006CB29    cmp         esi,dword ptr [ebx+1F0]
>0006CB2F    jge         0006CB46
 0006CB31    push        0
 0006CB33    push        esi
 0006CB34    push        402
 0006CB39    mov         eax,ebx
 0006CB3B    call        TWinControl.GetHandle
 0006CB40    push        eax
 0006CB41    call        user32.SendMessageA
 0006CB46    mov         dword ptr [ebx+1F0],esi
 0006CB4C    mov         dword ptr [ebx+1F4],edi
 0006CB52    xor         eax,eax
 0006CB54    pop         edx
 0006CB55    pop         ecx
 0006CB56    pop         ecx
 0006CB57    mov         dword ptr fs:[eax],edx
 0006CB5A    push        6CB72
 0006CB5F    lea         eax,[ebp-10C]
 0006CB65    call        @LStrClr
 0006CB6A    ret
>0006CB6B    jmp         @HandleFinally
>0006CB70    jmp         0006CB5F
 0006CB72    pop         edi
 0006CB73    pop         esi
 0006CB74    pop         ebx
 0006CB75    mov         esp,ebp
 0006CB77    pop         ebp
 0006CB78    ret
*}
end;

//0006CB7C
procedure TProgressBar.SetMin(Value:Integer);
begin
{*
 0006CB7C    mov         ecx,dword ptr [eax+1F4]
 0006CB82    call        TProgressBar.SetParams
 0006CB87    ret
*}
end;

//0006CB88
procedure TProgressBar.SetMax(Value:Integer);
begin
{*
 0006CB88    mov         ecx,edx
 0006CB8A    mov         edx,dword ptr [eax+1F0]
 0006CB90    call        TProgressBar.SetParams
 0006CB95    ret
*}
end;

//0006CB98
procedure TProgressBar.SetPosition(Value:Integer);
begin
{*
 0006CB98    push        ebx
 0006CB99    push        esi
 0006CB9A    mov         esi,edx
 0006CB9C    mov         ebx,eax
 0006CB9E    cmp         byte ptr [ebx+1EC],0
>0006CBA5    jne         0006CBB8
 0006CBA7    test        esi,esi
>0006CBA9    jl          0006CBB3
 0006CBAB    cmp         esi,0FFFF
>0006CBB1    jle         0006CBB8
 0006CBB3    call        ProgressLimitError
 0006CBB8    mov         eax,ebx
 0006CBBA    call        TWinControl.HandleAllocated
 0006CBBF    test        al,al
>0006CBC1    je          0006CBDB
 0006CBC3    push        0
 0006CBC5    push        esi
 0006CBC6    push        402
 0006CBCB    mov         eax,ebx
 0006CBCD    call        TWinControl.GetHandle
 0006CBD2    push        eax
 0006CBD3    call        user32.SendMessageA
 0006CBD8    pop         esi
 0006CBD9    pop         ebx
 0006CBDA    ret
 0006CBDB    mov         dword ptr [ebx+1F8],esi
 0006CBE1    pop         esi
 0006CBE2    pop         ebx
 0006CBE3    ret
*}
end;

//0006CBE4
procedure TProgressBar.SetStep(Value:Integer);
begin
{*
 0006CBE4    push        ebx
 0006CBE5    mov         ebx,eax
 0006CBE7    cmp         edx,dword ptr [ebx+1FC]
>0006CBED    je          0006CC1B
 0006CBEF    mov         dword ptr [ebx+1FC],edx
 0006CBF5    mov         eax,ebx
 0006CBF7    call        TWinControl.HandleAllocated
 0006CBFC    test        al,al
>0006CBFE    je          0006CC1B
 0006CC00    push        0
 0006CC02    mov         eax,dword ptr [ebx+1FC]
 0006CC08    push        eax
 0006CC09    push        404
 0006CC0E    mov         eax,ebx
 0006CC10    call        TWinControl.GetHandle
 0006CC15    push        eax
 0006CC16    call        user32.SendMessageA
 0006CC1B    pop         ebx
 0006CC1C    ret
*}
end;

//0006CC20
procedure TPageScroller.SetOrientation(Value:TPageScrollerOrientation);
begin
{*
 0006CC20    cmp         dl,byte ptr [eax+200]
>0006CC26    je          0006CC33
 0006CC28    mov         byte ptr [eax+200],dl
 0006CC2E    call        TWinControl.RecreateWnd
 0006CC33    ret
*}
end;

//0006CC34
procedure TProgressBar.SetSmooth(Value:Boolean);
begin
{*
 0006CC34    cmp         dl,byte ptr [eax+201]
>0006CC3A    je          0006CC47
 0006CC3C    mov         byte ptr [eax+201],dl
 0006CC42    call        TWinControl.RecreateWnd
 0006CC47    ret
*}
end;

//0006CC48
function TConversion.ConvertReadStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 0006CC48    push        ebp
 0006CC49    mov         ebp,esp
 0006CC4B    push        ebx
 0006CC4C    mov         eax,ecx
 0006CC4E    mov         ecx,dword ptr [ebp+8]
 0006CC51    xchg        eax,edx
 0006CC52    mov         ebx,dword ptr [eax]
 0006CC54    call        dword ptr [ebx+4]
 0006CC57    pop         ebx
 0006CC58    pop         ebp
 0006CC59    ret         4
*}
end;

//0006CC5C
function TConversion.ConvertWriteStream(Stream:TStream; Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 0006CC5C    push        ebp
 0006CC5D    mov         ebp,esp
 0006CC5F    push        ebx
 0006CC60    mov         eax,ecx
 0006CC62    mov         ecx,dword ptr [ebp+8]
 0006CC65    xchg        eax,edx
 0006CC66    mov         ebx,dword ptr [eax]
 0006CC68    call        dword ptr [ebx+8]
 0006CC6B    pop         ebx
 0006CC6C    pop         ebp
 0006CC6D    ret         4
*}
end;

//0006CC70
constructor TListColumn.Create(Collection:TCollection);
begin
{*
 0006CC70    push        ebp
 0006CC71    mov         ebp,esp
 0006CC73    add         esp,0FFFFFFDC
 0006CC76    push        ebx
 0006CC77    push        esi
 0006CC78    push        edi
 0006CC79    test        dl,dl
>0006CC7B    je          0006CC85
 0006CC7D    add         esp,0FFFFFFF0
 0006CC80    call        @ClassCreate
 0006CC85    mov         esi,ecx
 0006CC87    mov         byte ptr [ebp-1],dl
 0006CC8A    mov         ebx,eax
 0006CC8C    mov         ecx,esi
 0006CC8E    xor         edx,edx
 0006CC90    mov         eax,ebx
 0006CC92    call        TCollectionItem.Create
 0006CC97    mov         dword ptr [ebx+24],32
 0006CC9E    mov         byte ptr [ebx+0C],0
 0006CCA2    or          eax,0FFFFFFFF
 0006CCA5    mov         dword ptr [ebx+1C],eax
 0006CCA8    mov         dword ptr [ebp-21],13
 0006CCAF    xor         edx,edx
 0006CCB1    mov         dword ptr [ebp-1D],edx
 0006CCB4    mov         edx,dword ptr [ebx+24]
 0006CCB7    mov         dword ptr [ebp-19],edx
 0006CCBA    mov         dword ptr [ebp-9],eax
 0006CCBD    mov         edi,esi
 0006CCBF    mov         eax,dword ptr [edi+18]
 0006CCC2    call        TWinControl.HandleAllocated
 0006CCC7    test        al,al
>0006CCC9    je          0006CCE4
 0006CCCB    mov         eax,ebx
 0006CCCD    call        TCollectionItem.GetIndex
 0006CCD2    push        eax
 0006CCD3    mov         eax,dword ptr [edi+18]
 0006CCD6    call        TWinControl.GetHandle
 0006CCDB    lea         ecx,[ebp-21]
 0006CCDE    pop         edx
 0006CCDF    call        ListView_InsertColumn
 0006CCE4    mov         eax,ebx
 0006CCE6    cmp         byte ptr [ebp-1],0
>0006CCEA    je          0006CCFB
 0006CCEC    call        @AfterConstruction
 0006CCF1    pop         dword ptr fs:[0]
 0006CCF8    add         esp,0C
 0006CCFB    mov         eax,ebx
 0006CCFD    pop         edi
 0006CCFE    pop         esi
 0006CCFF    pop         ebx
 0006CD00    mov         esp,ebp
 0006CD02    pop         ebp
 0006CD03    ret
*}
end;

//0006CD04
destructor TListColumn.Destroy;
begin
{*
 0006CD04    push        ebx
 0006CD05    push        esi
 0006CD06    call        @BeforeDestruction
 0006CD0B    mov         ebx,edx
 0006CD0D    mov         esi,eax
 0006CD0F    mov         eax,dword ptr [esi+4]
 0006CD12    mov         eax,dword ptr [eax+18]
 0006CD15    call        TWinControl.HandleAllocated
 0006CD1A    test        al,al
>0006CD1C    je          0006CD37
 0006CD1E    mov         eax,esi
 0006CD20    call        TCollectionItem.GetIndex
 0006CD25    push        eax
 0006CD26    mov         eax,dword ptr [esi+4]
 0006CD29    mov         eax,dword ptr [eax+18]
 0006CD2C    call        TWinControl.GetHandle
 0006CD31    pop         edx
 0006CD32    call        ListView_DeleteColumn
 0006CD37    mov         edx,ebx
 0006CD39    and         dl,0FC
 0006CD3C    mov         eax,esi
 0006CD3E    call        TCollectionItem.Destroy
 0006CD43    test        bl,bl
>0006CD45    jle         0006CD4E
 0006CD47    mov         eax,esi
 0006CD49    call        @ClassDestroy
 0006CD4E    pop         esi
 0006CD4F    pop         ebx
 0006CD50    ret
*}
end;

//0006CD54
procedure TListColumn.DefineProperties(Filer:TFiler);
begin
{*
 0006CD54    push        ebx
 0006CD55    push        esi
 0006CD56    mov         esi,edx
 0006CD58    mov         ebx,eax
 0006CD5A    mov         edx,esi
 0006CD5C    mov         eax,ebx
 0006CD5E    call        TPersistent.DefineProperties
 0006CD63    push        ebx
 0006CD64    push        6CD98;TListColumn.ReadData
 0006CD69    push        ebx
 0006CD6A    push        6CDC0;TListColumn.WriteData
 0006CD6F    cmp         dword ptr [ebx+24],0FFFFFFFF
 0006CD73    setle       cl
 0006CD76    mov         edx,6CD8C;'WidthType'
 0006CD7B    mov         eax,esi
 0006CD7D    mov         ebx,dword ptr [eax]
 0006CD7F    call        dword ptr [ebx]
 0006CD81    pop         esi
 0006CD82    pop         ebx
 0006CD83    ret
*}
end;

//0006CD98
procedure TListColumn.ReadData(Reader:TReader);
begin
{*
 0006CD98    push        ebx
 0006CD99    push        esi
 0006CD9A    mov         ebx,edx
 0006CD9C    mov         esi,eax
 0006CD9E    mov         eax,ebx
 0006CDA0    call        TReader.ReadListBegin
 0006CDA5    mov         eax,ebx
 0006CDA7    call        TReader.ReadInteger
 0006CDAC    mov         edx,eax
 0006CDAE    mov         eax,esi
 0006CDB0    call        TListColumn.SetWidth
 0006CDB5    mov         eax,ebx
 0006CDB7    call        TReader.ReadListEnd
 0006CDBC    pop         esi
 0006CDBD    pop         ebx
 0006CDBE    ret
*}
end;

//0006CDC0
procedure TListColumn.WriteData(Writer:TWriter);
begin
{*
 0006CDC0    push        ebx
 0006CDC1    push        esi
 0006CDC2    mov         ebx,edx
 0006CDC4    mov         esi,eax
 0006CDC6    mov         eax,ebx
 0006CDC8    call        TWriter.WriteListBegin
 0006CDCD    mov         edx,dword ptr [esi+24]
 0006CDD0    mov         eax,ebx
 0006CDD2    call        TWriter.WriteInteger
 0006CDD7    mov         eax,ebx
 0006CDD9    call        TWriter.WriteListEnd
 0006CDDE    pop         esi
 0006CDDF    pop         ebx
 0006CDE0    ret
*}
end;

//0006CDE4
procedure WriteCols;
begin
{*
 0006CDE4    push        ebp
 0006CDE5    mov         ebp,esp
 0006CDE7    add         esp,0FFFFFFF8
 0006CDEA    mov         eax,dword ptr [ebp+8]
 0006CDED    mov         eax,dword ptr [eax-4]
 0006CDF0    mov         eax,dword ptr [eax+4]
 0006CDF3    mov         eax,dword ptr [eax+18]
 0006CDF6    mov         dword ptr [ebp-8],eax
 0006CDF9    mov         eax,dword ptr [ebp-8]
 0006CDFC    call        TWinControl.HandleAllocated
 0006CE01    test        al,al
>0006CE03    jne         0006CEC6
 0006CE09    mov         eax,dword ptr [ebp-8]
 0006CE0C    mov         al,byte ptr [eax+20]
 0006CE0F    and         al,byte ptr ds:[6CECC]
 0006CE15    mov         dl,byte ptr ds:[6CED0]
 0006CE1B    cmp         dl,al
>0006CE1D    jne         0006CEC6
 0006CE23    mov         eax,dword ptr [ebp-8]
 0006CE26    cmp         byte ptr [eax+265],0
>0006CE2D    jne         0006CEC6
 0006CE33    mov         eax,dword ptr [ebp-8]
 0006CE36    mov         eax,dword ptr [eax+224]
 0006CE3C    test        eax,eax
>0006CE3E    jne         0006CE57
 0006CE40    mov         dl,1
 0006CE42    mov         eax,[0001F5E8];TMemoryStream
 0006CE47    call        TObject.Create
 0006CE4C    mov         edx,dword ptr [ebp-8]
 0006CE4F    mov         dword ptr [edx+224],eax
>0006CE55    jmp         0006CE5D
 0006CE57    xor         edx,edx
 0006CE59    mov         ecx,dword ptr [eax]
 0006CE5B    call        dword ptr [ecx]
 0006CE5D    push        400
 0006CE62    mov         eax,dword ptr [ebp-8]
 0006CE65    mov         ecx,dword ptr [eax+224]
 0006CE6B    mov         dl,1
 0006CE6D    mov         eax,[0001F94C];TWriter
 0006CE72    call        TFiler.Create
 0006CE77    mov         dword ptr [ebp-4],eax
 0006CE7A    xor         eax,eax
 0006CE7C    push        ebp
 0006CE7D    push        6CEBF
 0006CE82    push        dword ptr fs:[eax]
 0006CE85    mov         dword ptr fs:[eax],esp
 0006CE88    mov         eax,dword ptr [ebp+8]
 0006CE8B    mov         eax,dword ptr [eax-4]
 0006CE8E    mov         edx,dword ptr [eax+4]
 0006CE91    mov         eax,dword ptr [ebp-4]
 0006CE94    call        TWriter.WriteCollection
 0006CE99    xor         eax,eax
 0006CE9B    pop         edx
 0006CE9C    pop         ecx
 0006CE9D    pop         ecx
 0006CE9E    mov         dword ptr fs:[eax],edx
 0006CEA1    push        6CEC6
 0006CEA6    mov         eax,dword ptr [ebp-4]
 0006CEA9    call        TObject.Free
 0006CEAE    mov         eax,dword ptr [ebp-8]
 0006CEB1    mov         eax,dword ptr [eax+224]
 0006CEB7    xor         edx,edx
 0006CEB9    call        TStream.SetPosition
 0006CEBE    ret
>0006CEBF    jmp         @HandleFinally
>0006CEC4    jmp         0006CEA6
 0006CEC6    pop         ecx
 0006CEC7    pop         ecx
 0006CEC8    pop         ebp
 0006CEC9    ret
*}
end;

//0006CED4
procedure TListColumn.DoChange;
begin
{*
 0006CED4    push        ebp
 0006CED5    mov         ebp,esp
 0006CED7    push        ecx
 0006CED8    push        ebx
 0006CED9    push        esi
 0006CEDA    mov         dword ptr [ebp-4],eax
 0006CEDD    mov         eax,dword ptr [ebp-4]
 0006CEE0    mov         eax,dword ptr [eax+4]
 0006CEE3    call        TCollection.GetCount
 0006CEE8    mov         ebx,eax
 0006CEEA    dec         ebx
 0006CEEB    test        ebx,ebx
>0006CEED    jl          0006CF09
 0006CEEF    inc         ebx
 0006CEF0    xor         esi,esi
 0006CEF2    mov         eax,dword ptr [ebp-4]
 0006CEF5    mov         eax,dword ptr [eax+4]
 0006CEF8    mov         edx,esi
 0006CEFA    call        TCollection.GetItem
 0006CEFF    cmp         dword ptr [eax+24],0FFFFFFFF
>0006CF03    jle         0006CF09
 0006CF05    inc         esi
 0006CF06    dec         ebx
>0006CF07    jne         0006CEF2
 0006CF09    mov         eax,dword ptr [ebp-4]
 0006CF0C    mov         eax,dword ptr [eax+4]
 0006CF0F    call        TCollection.GetCount
 0006CF14    cmp         esi,eax
 0006CF16    setne       dl
 0006CF19    mov         eax,dword ptr [ebp-4]
 0006CF1C    call        TCollectionItem.Changed
 0006CF21    push        ebp
 0006CF22    call        WriteCols
 0006CF27    pop         ecx
 0006CF28    pop         esi
 0006CF29    pop         ebx
 0006CF2A    pop         ecx
 0006CF2B    pop         ebp
 0006CF2C    ret
*}
end;

//0006CF30
procedure TListColumn.SetCaption(const Value:AnsiString);
begin
{*
 0006CF30    push        ebx
 0006CF31    push        esi
 0006CF32    mov         esi,edx
 0006CF34    mov         ebx,eax
 0006CF36    mov         eax,dword ptr [ebx+10]
 0006CF39    mov         edx,esi
 0006CF3B    call        @LStrCmp
>0006CF40    je          0006CF53
 0006CF42    lea         eax,[ebx+10]
 0006CF45    mov         edx,esi
 0006CF47    call        @LStrAsg
 0006CF4C    mov         eax,ebx
 0006CF4E    call        TListColumn.DoChange
 0006CF53    pop         esi
 0006CF54    pop         ebx
 0006CF55    ret
*}
end;

//0006CF58
function TListColumn.GetWidth:TWidth;
begin
{*
 0006CF58    mov         eax,dword ptr [eax+24]
 0006CF5B    ret
*}
end;

//0006CF5C
procedure TListColumn.IsStoredWidth(Value:TWidth);
begin
{*
 0006CF5C    mov         al,byte ptr [eax+0D];TListColumn.AutoSize:Boolean
 0006CF5F    xor         al,1
 0006CF61    ret
*}
end;

//0006CF64
procedure TListColumn.SetWidth(Value:TWidth);
begin
{*
 0006CF64    cmp         edx,dword ptr [eax+24]
>0006CF67    je          0006CF71
 0006CF69    mov         dword ptr [eax+24],edx
 0006CF6C    call        TListColumn.DoChange
 0006CF71    ret
*}
end;

//0006CF74
procedure TListColumn.SetAlignment(Value:TAlignment);
begin
{*
 0006CF74    push        ebx
 0006CF75    push        esi
 0006CF76    mov         ebx,edx
 0006CF78    mov         esi,eax
 0006CF7A    cmp         bl,byte ptr [esi+0C]
>0006CF7D    je          0006CFA1
 0006CF7F    mov         eax,esi
 0006CF81    call        TCollectionItem.GetIndex
 0006CF86    test        eax,eax
>0006CF88    je          0006CFA1
 0006CF8A    mov         byte ptr [esi+0C],bl
 0006CF8D    xor         edx,edx
 0006CF8F    mov         eax,esi
 0006CF91    call        TCollectionItem.Changed
 0006CF96    mov         eax,dword ptr [esi+4]
 0006CF99    mov         eax,dword ptr [eax+18]
 0006CF9C    mov         edx,dword ptr [eax]
 0006CF9E    call        dword ptr [edx+7C]
 0006CFA1    pop         esi
 0006CFA2    pop         ebx
 0006CFA3    ret
*}
end;

//0006CFA4
procedure TListColumn.SetAutoSize(Value:Boolean);
begin
{*
 0006CFA4    push        ebx
 0006CFA5    push        esi
 0006CFA6    mov         esi,eax
 0006CFA8    cmp         dl,byte ptr [esi+0D]
>0006CFAB    je          0006CFCA
 0006CFAD    mov         byte ptr [esi+0D],dl
 0006CFB0    mov         eax,dword ptr [esi+4]
 0006CFB3    mov         eax,dword ptr [eax+18]
 0006CFB6    test        eax,eax
>0006CFB8    je          0006CFC3
 0006CFBA    mov         bx,0FFEF
 0006CFBE    call        @CallDynaInst
 0006CFC3    mov         eax,esi
 0006CFC5    call        TListColumn.DoChange
 0006CFCA    pop         esi
 0006CFCB    pop         ebx
 0006CFCC    ret
*}
end;

//0006CFD0
procedure TListColumn.SetImageIndex(Value:Integer);
begin
{*
 0006CFD0    cmp         edx,dword ptr [eax+1C]
>0006CFD3    je          0006CFDD
 0006CFD5    mov         dword ptr [eax+1C],edx
 0006CFD8    call        TListColumn.DoChange
 0006CFDD    ret
*}
end;

//0006CFE0
procedure TCoolBand.SetImageIndex(Value:Integer);
begin
{*
 0006CFE0    cmp         edx,dword ptr [eax+14]
>0006CFE3    je          0006CFEF
 0006CFE5    mov         dword ptr [eax+14],edx
 0006CFE8    xor         edx,edx
 0006CFEA    call        TCollectionItem.Changed
 0006CFEF    ret
*}
end;

//0006CFF0
procedure TListColumn.SetMinWidth(Value:TWidth);
begin
{*
 0006CFF0    cmp         edx,dword ptr [eax+18]
>0006CFF3    je          0006CFFF
 0006CFF5    mov         dword ptr [eax+18],edx
 0006CFF8    xor         edx,edx
 0006CFFA    call        TCollectionItem.Changed
 0006CFFF    ret
*}
end;

//0006D000
procedure TListColumn.Assign(Source:TPersistent);
begin
{*
 0006D000    push        ebx
 0006D001    push        esi
 0006D002    mov         esi,edx
 0006D004    mov         ebx,eax
 0006D006    mov         eax,esi
 0006D008    mov         edx,dword ptr ds:[67D54];TListColumn
 0006D00E    call        @IsClass
 0006D013    test        al,al
>0006D015    je          0006D066
 0006D017    mov         dl,byte ptr [esi+0C]
 0006D01A    mov         eax,ebx
 0006D01C    call        TListColumn.SetAlignment
 0006D021    mov         dl,byte ptr [esi+0D]
 0006D024    mov         eax,ebx
 0006D026    call        TListColumn.SetAutoSize
 0006D02B    mov         edx,dword ptr [esi+10]
 0006D02E    mov         eax,ebx
 0006D030    call        TListColumn.SetCaption
 0006D035    mov         edx,dword ptr [esi+1C]
 0006D038    mov         eax,ebx
 0006D03A    call        TListColumn.SetImageIndex
 0006D03F    mov         edx,dword ptr [esi+14]
 0006D042    mov         eax,ebx
 0006D044    call        TCoolBand.SetImageIndex
 0006D049    mov         edx,dword ptr [esi+18]
 0006D04C    mov         eax,ebx
 0006D04E    call        TListColumn.SetMinWidth
 0006D053    mov         eax,esi
 0006D055    call        TListColumn.GetWidth
 0006D05A    mov         edx,eax
 0006D05C    mov         eax,ebx
 0006D05E    call        TListColumn.SetWidth
 0006D063    pop         esi
 0006D064    pop         ebx
 0006D065    ret
 0006D066    mov         edx,esi
 0006D068    mov         eax,ebx
 0006D06A    call        TPersistent.Assign
 0006D06F    pop         esi
 0006D070    pop         ebx
 0006D071    ret
*}
end;

//0006D074
function TListColumn.GetDisplayName:AnsiString;
begin
{*
 0006D074    push        ebx
 0006D075    push        esi
 0006D076    mov         esi,edx
 0006D078    mov         ebx,eax
 0006D07A    mov         eax,esi
 0006D07C    mov         edx,dword ptr [ebx+10]
 0006D07F    call        @LStrLAsg
 0006D084    cmp         dword ptr [esi],0
>0006D087    jne         0006D092
 0006D089    mov         edx,esi
 0006D08B    mov         eax,ebx
 0006D08D    call        TCollectionItem.GetDisplayName
 0006D092    pop         esi
 0006D093    pop         ebx
 0006D094    ret
*}
end;

//0006D098
constructor TListColumns.Create(AOwner:TCustomListView);
begin
{*
 0006D098    push        ebx
 0006D099    push        esi
 0006D09A    push        edi
 0006D09B    test        dl,dl
>0006D09D    je          0006D0A7
 0006D09F    add         esp,0FFFFFFF0
 0006D0A2    call        @ClassCreate
 0006D0A7    mov         esi,ecx
 0006D0A9    mov         ebx,edx
 0006D0AB    mov         edi,eax
 0006D0AD    mov         ecx,dword ptr ds:[67D54];TListColumn
 0006D0B3    xor         edx,edx
 0006D0B5    mov         eax,edi
 0006D0B7    call        TCollection.Create
 0006D0BC    mov         dword ptr [edi+18],esi
 0006D0BF    mov         eax,edi
 0006D0C1    test        bl,bl
>0006D0C3    je          0006D0D4
 0006D0C5    call        @AfterConstruction
 0006D0CA    pop         dword ptr fs:[0]
 0006D0D1    add         esp,0C
 0006D0D4    mov         eax,edi
 0006D0D6    pop         edi
 0006D0D7    pop         esi
 0006D0D8    pop         ebx
 0006D0D9    ret
*}
end;

//0006D0DC
function THeaderSections.GetItem(Index:Integer):THeaderSection;
begin
{*
 0006D0DC    push        ebx
 0006D0DD    push        esi
 0006D0DE    mov         esi,edx
 0006D0E0    mov         ebx,eax
 0006D0E2    mov         edx,esi
 0006D0E4    mov         eax,ebx
 0006D0E6    call        TCollection.GetItem
 0006D0EB    pop         esi
 0006D0EC    pop         ebx
 0006D0ED    ret
*}
end;

//0006D0F0
procedure TListColumns.sub_0002114C;
begin
{*
 0006D0F0    mov         eax,dword ptr [eax+18];TListColumns...FOwner:TCustomListView
 0006D0F3    ret
*}
end;

//0006D0F4
procedure TCoolBands.Update(Item:TCollectionItem);
begin
{*
 0006D0F4    push        ebx
 0006D0F5    push        esi
 0006D0F6    mov         esi,edx
 0006D0F8    mov         ebx,eax
 0006D0FA    test        esi,esi
>0006D0FC    je          0006D112
 0006D0FE    mov         eax,esi
 0006D100    call        TCollectionItem.GetIndex
 0006D105    mov         edx,eax
 0006D107    mov         eax,dword ptr [ebx+18]
 0006D10A    call        TCoolBar.UpdateBand
 0006D10F    pop         esi
 0006D110    pop         ebx
 0006D111    ret
 0006D112    mov         eax,dword ptr [ebx+18]
 0006D115    call        TCoolBar.UpdateBands
 0006D11A    pop         esi
 0006D11B    pop         ebx
 0006D11C    ret
*}
end;

//0006D21C
constructor TSubItems.Create(AOwner:TListItem);
begin
{*
 0006D21C    push        ebx
 0006D21D    push        esi
 0006D21E    push        edi
 0006D21F    test        dl,dl
>0006D221    je          0006D22B
 0006D223    add         esp,0FFFFFFF0
 0006D226    call        @ClassCreate
 0006D22B    mov         esi,ecx
 0006D22D    mov         ebx,edx
 0006D22F    mov         edi,eax
 0006D231    xor         edx,edx
 0006D233    mov         eax,edi
 0006D235    call        TObject.Create
 0006D23A    mov         dword ptr [edi+2C],esi
 0006D23D    mov         eax,edi
 0006D23F    test        bl,bl
>0006D241    je          0006D252
 0006D243    call        @AfterConstruction
 0006D248    pop         dword ptr fs:[0]
 0006D24F    add         esp,0C
 0006D252    mov         eax,edi
 0006D254    pop         edi
 0006D255    pop         esi
 0006D256    pop         ebx
 0006D257    ret
*}
end;

//0006D258
function TSubItems.Add(const S:AnsiString):Integer;
begin
{*
 0006D258    push        ebx
 0006D259    push        esi
 0006D25A    mov         ebx,eax
 0006D25C    mov         eax,ebx
 0006D25E    call        TStringList.Add
 0006D263    mov         esi,eax
 0006D265    lea         edx,[esi+1]
 0006D268    mov         eax,ebx
 0006D26A    call        TSubItems.RefreshItem
 0006D26F    mov         eax,esi
 0006D271    pop         esi
 0006D272    pop         ebx
 0006D273    ret
*}
end;

//0006D274
procedure TSubItems.Delete(Index:Integer);
begin
{*
 0006D274    push        ebx
 0006D275    mov         ebx,eax
 0006D277    mov         eax,ebx
 0006D279    call        TStringList.Delete
 0006D27E    mov         eax,dword ptr [ebx+2C]
 0006D281    call        TListItem.Update
 0006D286    pop         ebx
 0006D287    ret
*}
end;

//0006D288
function TSubItems.GetHandle:HWND;
begin
{*
 0006D288    mov         eax,dword ptr [eax+2C]
 0006D28B    mov         eax,dword ptr [eax+4]
 0006D28E    call        TListItems.GetHandle
 0006D293    ret
*}
end;

//0006D294
procedure TSubItems.SetColumnWidth(Index:Integer);
begin
{*
 0006D294    push        ebx
 0006D295    push        esi
 0006D296    mov         esi,edx
 0006D298    mov         eax,dword ptr [eax+2C]
 0006D29B    call        TListItem.GetListView
 0006D2A0    mov         ebx,eax
 0006D2A2    mov         eax,ebx
 0006D2A4    call        TCustomListView.ColumnsShowing
 0006D2A9    test        al,al
>0006D2AB    je          0006D2D4
 0006D2AD    mov         eax,dword ptr [ebx+218]
 0006D2B3    call        TCollection.GetCount
 0006D2B8    cmp         esi,eax
>0006D2BA    jge         0006D2D4
 0006D2BC    mov         edx,esi
 0006D2BE    mov         eax,ebx
 0006D2C0    call        TCustomListView.GetColumnFromIndex
 0006D2C5    cmp         dword ptr [eax+24],0FFFFFFFF
>0006D2C9    jne         0006D2D4
 0006D2CB    mov         edx,esi
 0006D2CD    mov         eax,ebx
 0006D2CF    call        TCoolBar.UpdateBand
 0006D2D4    pop         esi
 0006D2D5    pop         ebx
 0006D2D6    ret
*}
end;

//0006D2D8
procedure TSubItems.Insert(Index:Integer; const S:AnsiString);
begin
{*
 0006D2D8    push        ebx
 0006D2D9    push        esi
 0006D2DA    push        edi
 0006D2DB    mov         ebx,edx
 0006D2DD    mov         edi,eax
 0006D2DF    mov         edx,ebx
 0006D2E1    mov         eax,edi
 0006D2E3    call        TStringList.Insert
 0006D2E8    lea         esi,[ebx+1]
 0006D2EB    mov         eax,edi
 0006D2ED    mov         edx,dword ptr [eax]
 0006D2EF    call        dword ptr [edx+14]
 0006D2F2    mov         ebx,eax
 0006D2F4    sub         ebx,esi
>0006D2F6    jl          0006D306
 0006D2F8    inc         ebx
 0006D2F9    mov         edx,esi
 0006D2FB    mov         eax,edi
 0006D2FD    call        TSubItems.RefreshItem
 0006D302    inc         esi
 0006D303    dec         ebx
>0006D304    jne         0006D2F9
 0006D306    pop         edi
 0006D307    pop         esi
 0006D308    pop         ebx
 0006D309    ret
*}
end;

//0006D30C
procedure TSubItems.Put(Index:Integer; const S:AnsiString);
begin
{*
 0006D30C    push        ebx
 0006D30D    push        esi
 0006D30E    mov         esi,edx
 0006D310    mov         ebx,eax
 0006D312    mov         edx,esi
 0006D314    mov         eax,ebx
 0006D316    call        TStringList.Put
 0006D31B    lea         edx,[esi+1]
 0006D31E    mov         eax,ebx
 0006D320    call        TSubItems.RefreshItem
 0006D325    pop         esi
 0006D326    pop         ebx
 0006D327    ret
*}
end;

//0006D328
procedure TSubItems.RefreshItem(Index:Integer);
begin
{*
 0006D328    push        ebx
 0006D329    push        esi
 0006D32A    mov         esi,edx
 0006D32C    mov         ebx,eax
 0006D32E    push        0FF
 0006D330    mov         eax,dword ptr [ebx+2C]
 0006D333    call        TListItem.GetIndex
 0006D338    push        eax
 0006D339    mov         eax,ebx
 0006D33B    call        TSubItems.GetHandle
 0006D340    mov         ecx,esi
 0006D342    pop         edx
 0006D343    call        ListView_SetItemText
 0006D348    mov         edx,esi
 0006D34A    mov         eax,ebx
 0006D34C    call        TSubItems.SetColumnWidth
 0006D351    pop         esi
 0006D352    pop         ebx
 0006D353    ret
*}
end;

//0006D354
procedure TSubItems.SetUpdateState(Updating:Boolean);
begin
{*
 0006D354    mov         eax,dword ptr [eax+2C]
 0006D357    mov         eax,dword ptr [eax+4]
 0006D35A    call        TListItems.SetUpdateState
 0006D35F    ret
*}
end;

//0006D360
constructor TListItem.Create(AOwner:TListItems);
begin
{*
 0006D360    push        ebx
 0006D361    push        esi
 0006D362    test        dl,dl
>0006D364    je          0006D36E
 0006D366    add         esp,0FFFFFFF0
 0006D369    call        @ClassCreate
 0006D36E    mov         ebx,edx
 0006D370    mov         esi,eax
 0006D372    mov         dword ptr [esi+4],ecx
 0006D375    mov         ecx,esi
 0006D377    mov         dl,1
 0006D379    mov         eax,[0006D120];TSubItems
 0006D37E    call        TSubItems.Create
 0006D383    mov         dword ptr [esi+8],eax
 0006D386    mov         dword ptr [esi+1C],0FFFFFFFF
 0006D38D    mov         dword ptr [esi+20],0FFFFFFFF
 0006D394    mov         eax,esi
 0006D396    test        bl,bl
>0006D398    je          0006D3A9
 0006D39A    call        @AfterConstruction
 0006D39F    pop         dword ptr fs:[0]
 0006D3A6    add         esp,0C
 0006D3A9    mov         eax,esi
 0006D3AB    pop         esi
 0006D3AC    pop         ebx
 0006D3AD    ret
*}
end;

//0006D3B0
destructor TListItem.Destroy;
begin
{*
 0006D3B0    push        ebx
 0006D3B1    push        esi
 0006D3B2    call        @BeforeDestruction
 0006D3B7    mov         ebx,edx
 0006D3B9    mov         esi,eax
 0006D3BB    mov         byte ptr [esi+28],1;TListItem.FDeleting:Boolean
 0006D3BF    mov         eax,dword ptr [esi+4];TListItem.FOwner:TListItems
 0006D3C2    mov         eax,dword ptr [eax+4];TListItems.FOwner:TCustomListView
 0006D3C5    cmp         esi,dword ptr [eax+24C];TCustomListView.FLastDropTarget:TListItem
>0006D3CB    jne         0006D3D5
 0006D3CD    xor         edx,edx
 0006D3CF    mov         dword ptr [eax+24C],edx;TCustomListView.FLastDropTarget:TListItem
 0006D3D5    mov         eax,esi
 0006D3D7    call        TListItem.GetListView
 0006D3DC    call        TWinControl.HandleAllocated
 0006D3E1    test        al,al
>0006D3E3    je          0006D3FA
 0006D3E5    mov         eax,esi
 0006D3E7    call        TListItem.GetIndex
 0006D3EC    push        eax
 0006D3ED    mov         eax,esi
 0006D3EF    call        TListItem.GetHandle
 0006D3F4    pop         edx
 0006D3F5    call        ListView_DeleteItem
 0006D3FA    mov         eax,dword ptr [esi+8];TListItem.FSubItems:TStrings
 0006D3FD    call        TObject.Free
 0006D402    mov         edx,ebx
 0006D404    and         dl,0FC
 0006D407    mov         eax,esi
 0006D409    call        TMemoryStream.Destroy
 0006D40E    test        bl,bl
>0006D410    jle         0006D419
 0006D412    mov         eax,esi
 0006D414    call        @ClassDestroy
 0006D419    pop         esi
 0006D41A    pop         ebx
 0006D41B    ret
*}
end;

//0006D41C
function TListItem.GetListView:TCustomListView;
begin
{*
 0006D41C    mov         eax,dword ptr [eax+4]
 0006D41F    mov         eax,dword ptr [eax+4]
 0006D422    ret
*}
end;

//0006D424
procedure TListItem.Delete;
begin
{*
 0006D424    push        ebx
 0006D425    mov         ebx,eax
 0006D427    cmp         byte ptr [ebx+28],0
>0006D42B    jne         0006D443
 0006D42D    mov         eax,ebx
 0006D42F    call        TListItem.GetListView
 0006D434    cmp         ebx,dword ptr [eax+268]
>0006D43A    je          0006D443
 0006D43C    mov         eax,ebx
 0006D43E    call        TObject.Free
 0006D443    pop         ebx
 0006D444    ret
*}
end;

//0006D448
function TListItem.GetHandle:HWND;
begin
{*
 0006D448    push        ebx
 0006D449    mov         ebx,eax
 0006D44B    mov         eax,ebx
 0006D44D    call        TListItem.GetListView
 0006D452    call        TWinControl.GetHandle
 0006D457    pop         ebx
 0006D458    ret
*}
end;

//0006D45C
function TListItem.GetChecked:Boolean;
begin
{*
 0006D45C    push        ebx
 0006D45D    push        esi
 0006D45E    mov         esi,eax
 0006D460    mov         eax,dword ptr [esi+4]
 0006D463    mov         ebx,dword ptr [eax+4]
 0006D466    cmp         byte ptr [ebx+220],0
>0006D46D    jne         0006D4A5
 0006D46F    mov         eax,ebx
 0006D471    call        TWinControl.HandleAllocated
 0006D476    test        al,al
>0006D478    je          0006D4A5
 0006D47A    cmp         byte ptr [ebx+250],0
>0006D481    je          0006D49C
 0006D483    mov         eax,esi
 0006D485    call        TListItem.GetIndex
 0006D48A    push        eax
 0006D48B    mov         eax,ebx
 0006D48D    call        TWinControl.GetHandle
 0006D492    pop         edx
 0006D493    call        ListView_GetCheckState
 0006D498    test        eax,eax
>0006D49A    jne         0006D4A0
 0006D49C    xor         eax,eax
>0006D49E    jmp         0006D4BA
 0006D4A0    mov         al,1
 0006D4A2    pop         esi
 0006D4A3    pop         ebx
 0006D4A4    ret
 0006D4A5    cmp         byte ptr [ebx+250],0
>0006D4AC    je          0006D4B4
 0006D4AE    cmp         byte ptr [esi+2A],0
>0006D4B2    jne         0006D4B8
 0006D4B4    xor         eax,eax
>0006D4B6    jmp         0006D4BA
 0006D4B8    mov         al,1
 0006D4BA    pop         esi
 0006D4BB    pop         ebx
 0006D4BC    ret
*}
end;

//0006D4C0
procedure TListItem.SetChecked(Value:Boolean);
begin
{*
 0006D4C0    push        ebx
 0006D4C1    push        esi
 0006D4C2    push        edi
 0006D4C3    push        ebp
 0006D4C4    mov         ebx,edx
 0006D4C6    mov         esi,eax
 0006D4C8    mov         byte ptr [esi+2A],bl
 0006D4CB    mov         eax,dword ptr [esi+4]
 0006D4CE    mov         edi,dword ptr [eax+4]
 0006D4D1    cmp         byte ptr [edi+220],0
>0006D4D8    jne         0006D522
 0006D4DA    mov         eax,edi
 0006D4DC    call        TWinControl.HandleAllocated
 0006D4E1    test        al,al
>0006D4E3    je          0006D522
 0006D4E5    mov         byte ptr [edi+250],1
 0006D4EC    mov         eax,esi
 0006D4EE    call        TListItem.GetHandle
 0006D4F3    call        ListView_GetExtendedListViewStyle
 0006D4F8    mov         ebp,eax
 0006D4FA    mov         eax,edi
 0006D4FC    call        TWinControl.GetHandle
 0006D501    mov         edx,ebp
 0006D503    or          edx,4
 0006D506    call        ListView_SetExtendedListViewStyle
 0006D50B    mov         eax,esi
 0006D50D    call        TListItem.GetIndex
 0006D512    push        eax
 0006D513    mov         eax,edi
 0006D515    call        TWinControl.GetHandle
 0006D51A    mov         ecx,ebx
 0006D51C    pop         edx
 0006D51D    call        ListView_SetCheckState
 0006D522    pop         ebp
 0006D523    pop         edi
 0006D524    pop         esi
 0006D525    pop         ebx
 0006D526    ret
*}
end;

//0006D528
procedure TListItem.Update;
begin
{*
 0006D528    push        ebx
 0006D529    mov         ebx,eax
 0006D52B    mov         eax,ebx
 0006D52D    call        TListItem.GetIndex
 0006D532    push        eax
 0006D533    mov         eax,ebx
 0006D535    call        TListItem.GetHandle
 0006D53A    pop         edx
 0006D53B    call        ListView_Update
 0006D540    pop         ebx
 0006D541    ret
*}
end;

//0006D544
procedure TListItem.SetCaption(const Value:AnsiString);
begin
{*
 0006D544    push        ebx
 0006D545    push        esi
 0006D546    mov         esi,edx
 0006D548    mov         ebx,eax
 0006D54A    lea         eax,[ebx+24]
 0006D54D    mov         edx,esi
 0006D54F    call        @LStrAsg
 0006D554    mov         eax,dword ptr [ebx+4]
 0006D557    mov         eax,dword ptr [eax+4]
 0006D55A    cmp         byte ptr [eax+220],0
>0006D561    jne         0006D57C
 0006D563    push        0FF
 0006D565    mov         eax,ebx
 0006D567    call        TListItem.GetIndex
 0006D56C    push        eax
 0006D56D    mov         eax,ebx
 0006D56F    call        TListItem.GetHandle
 0006D574    xor         ecx,ecx
 0006D576    pop         edx
 0006D577    call        ListView_SetItemText
 0006D57C    mov         eax,ebx
 0006D57E    call        TListItem.GetListView
 0006D583    call        TCustomListView.ColumnsShowing
 0006D588    test        al,al
>0006D58A    je          0006D5C2
 0006D58C    mov         eax,ebx
 0006D58E    call        TListItem.GetListView
 0006D593    mov         eax,dword ptr [eax+218]
 0006D599    call        TCollection.GetCount
 0006D59E    test        eax,eax
>0006D5A0    jle         0006D5C2
 0006D5A2    mov         eax,ebx
 0006D5A4    call        TListItem.GetListView
 0006D5A9    xor         edx,edx
 0006D5AB    call        TCustomListView.GetColumnFromIndex
 0006D5B0    cmp         dword ptr [eax+24],0FFFFFFFF
>0006D5B4    jg          0006D5C2
 0006D5B6    mov         eax,ebx
 0006D5B8    call        TListItem.GetListView
 0006D5BD    call        TCoolBar.UpdateBands
 0006D5C2    mov         eax,ebx
 0006D5C4    call        TListItem.GetListView
 0006D5C9    mov         al,byte ptr [eax+205]
 0006D5CF    add         al,0FE
 0006D5D1    sub         al,2
>0006D5D3    jae         0006D5E1
 0006D5D5    mov         eax,ebx
 0006D5D7    call        TListItem.GetListView
 0006D5DC    call        TCustomListView.AlphaSort
 0006D5E1    pop         esi
 0006D5E2    pop         ebx
 0006D5E3    ret
*}
end;

//0006D5E4
procedure TListItem.SetData(Value:Pointer);
begin
{*
 0006D5E4    push        ebx
 0006D5E5    mov         ebx,eax
 0006D5E7    mov         dword ptr [ebx+0C],edx
 0006D5EA    mov         eax,ebx
 0006D5EC    call        TListItem.GetListView
 0006D5F1    mov         al,byte ptr [eax+205]
 0006D5F7    sub         al,1
>0006D5F9    je          0006D5FF
 0006D5FB    sub         al,2
>0006D5FD    jne         0006D60B
 0006D5FF    mov         eax,ebx
 0006D601    call        TListItem.GetListView
 0006D606    call        TCustomListView.AlphaSort
 0006D60B    pop         ebx
 0006D60C    ret
*}
end;

//0006D610
function TListItem.GetState(Index:Integer):Boolean;
begin
{*
 0006D610    push        ebx
 0006D611    push        esi
 0006D612    mov         esi,eax
 0006D614    cmp         edx,4
>0006D617    ja          0006D657
 0006D619    jmp         dword ptr [edx*4+6D620]
 0006D619    dd          0006D634
 0006D619    dd          0006D63B
 0006D619    dd          0006D642
 0006D619    dd          0006D649
 0006D619    dd          0006D650
 0006D634    mov         ebx,4
>0006D639    jmp         0006D659
 0006D63B    mov         ebx,8
>0006D640    jmp         0006D659
 0006D642    mov         ebx,1
>0006D647    jmp         0006D659
 0006D649    mov         ebx,2
>0006D64E    jmp         0006D659
 0006D650    mov         ebx,20
>0006D655    jmp         0006D659
 0006D657    xor         ebx,ebx
 0006D659    mov         eax,esi
 0006D65B    call        TListItem.GetIndex
 0006D660    push        eax
 0006D661    mov         eax,esi
 0006D663    call        TListItem.GetHandle
 0006D668    mov         ecx,ebx
 0006D66A    pop         edx
 0006D66B    call        ListView_GetItemState
 0006D670    test        eax,ebx
 0006D672    setne       al
 0006D675    pop         esi
 0006D676    pop         ebx
 0006D677    ret
*}
end;

//0006D678
procedure TListItem.SetState(Index:Integer; State:Boolean);
begin
{*
 0006D678    push        ebx
 0006D679    push        esi
 0006D67A    push        edi
 0006D67B    mov         ebx,eax
 0006D67D    cmp         edx,4
>0006D680    ja          0006D6C0
 0006D682    jmp         dword ptr [edx*4+6D689]
 0006D682    dd          0006D69D
 0006D682    dd          0006D6A4
 0006D682    dd          0006D6AB
 0006D682    dd          0006D6B2
 0006D682    dd          0006D6B9
 0006D69D    mov         esi,4
>0006D6A2    jmp         0006D6C2
 0006D6A4    mov         esi,8
>0006D6A9    jmp         0006D6C2
 0006D6AB    mov         esi,1
>0006D6B0    jmp         0006D6C2
 0006D6B2    mov         esi,2
>0006D6B7    jmp         0006D6C2
 0006D6B9    mov         esi,20
>0006D6BE    jmp         0006D6C2
 0006D6C0    xor         esi,esi
 0006D6C2    test        cl,cl
>0006D6C4    je          0006D6CA
 0006D6C6    mov         edi,esi
>0006D6C8    jmp         0006D6CC
 0006D6CA    xor         edi,edi
 0006D6CC    push        esi
 0006D6CD    mov         eax,ebx
 0006D6CF    call        TListItem.GetIndex
 0006D6D4    push        eax
 0006D6D5    mov         eax,ebx
 0006D6D7    call        TListItem.GetHandle
 0006D6DC    mov         ecx,edi
 0006D6DE    pop         edx
 0006D6DF    call        ListView_SetItemState
 0006D6E4    pop         edi
 0006D6E5    pop         esi
 0006D6E6    pop         ebx
 0006D6E7    ret
*}
end;

//0006D6E8
procedure TListItem.SetImage(Index:Integer; Value:Integer);
begin
{*
 0006D6E8    push        ebx
 0006D6E9    push        esi
 0006D6EA    add         esp,0FFFFFFD8
 0006D6ED    mov         esi,ecx
 0006D6EF    mov         ebx,eax
 0006D6F1    sub         edx,1
>0006D6F4    jb          0006D704
>0006D6F6    je          0006D74A
 0006D6F8    dec         edx
>0006D6F9    je          0006D783
>0006D6FF    jmp         0006D7C9
 0006D704    mov         dword ptr [ebx+10],esi
 0006D707    mov         eax,dword ptr [ebx+4]
 0006D70A    mov         eax,dword ptr [eax+4]
 0006D70D    cmp         byte ptr [eax+220],0
>0006D714    jne         0006D7C9
 0006D71A    mov         dword ptr [esp],2
 0006D721    mov         dword ptr [esp+1C],0FFFFFFFF
 0006D729    mov         eax,ebx
 0006D72B    call        TListItem.GetIndex
 0006D730    mov         dword ptr [esp+4],eax
 0006D734    xor         eax,eax
 0006D736    mov         dword ptr [esp+8],eax
 0006D73A    mov         eax,ebx
 0006D73C    call        TListItem.GetHandle
 0006D741    mov         edx,esp
 0006D743    call        ListView_SetItem
>0006D748    jmp         0006D7C9
 0006D74A    mov         dword ptr [ebx+1C],esi
 0006D74D    mov         eax,dword ptr [ebx+4]
 0006D750    mov         eax,dword ptr [eax+4]
 0006D753    cmp         byte ptr [eax+220],0
>0006D75A    jne         0006D7C9
 0006D75C    push        0F00
 0006D761    mov         eax,dword ptr [ebx+1C]
 0006D764    inc         eax
 0006D765    call        IndexToOverlayMask
 0006D76A    push        eax
 0006D76B    mov         eax,ebx
 0006D76D    call        TListItem.GetIndex
 0006D772    push        eax
 0006D773    mov         eax,ebx
 0006D775    call        TListItem.GetHandle
 0006D77A    pop         edx
 0006D77B    pop         ecx
 0006D77C    call        ListView_SetItemState
>0006D781    jmp         0006D7C9
 0006D783    mov         dword ptr [ebx+20],esi
 0006D786    mov         eax,dword ptr [ebx+4]
 0006D789    mov         eax,dword ptr [eax+4]
 0006D78C    cmp         byte ptr [eax+250],0
>0006D793    je          0006D79C
 0006D795    cmp         esi,0FFFFFFFF
>0006D798    jne         0006D79C
 0006D79A    xor         esi,esi
 0006D79C    cmp         byte ptr [eax+220],0
>0006D7A3    jne         0006D7C9
 0006D7A5    push        0F000
 0006D7AA    lea         eax,[esi+1]
 0006D7AD    call        IndexToStateImageMask
 0006D7B2    push        eax
 0006D7B3    mov         eax,ebx
 0006D7B5    call        TListItem.GetIndex
 0006D7BA    push        eax
 0006D7BB    mov         eax,ebx
 0006D7BD    call        TListItem.GetHandle
 0006D7C2    pop         edx
 0006D7C3    pop         ecx
 0006D7C4    call        ListView_SetItemState
 0006D7C9    mov         eax,dword ptr [ebx+4]
 0006D7CC    mov         eax,dword ptr [eax+4]
 0006D7CF    cmp         byte ptr [eax+220],0
>0006D7D6    jne         0006D7F6
 0006D7D8    mov         eax,ebx
 0006D7DA    call        TListItem.GetIndex
 0006D7DF    push        eax
 0006D7E0    mov         eax,ebx
 0006D7E2    call        TListItem.GetIndex
 0006D7E7    push        eax
 0006D7E8    mov         eax,ebx
 0006D7EA    call        TListItem.GetListView
 0006D7EF    pop         edx
 0006D7F0    pop         ecx
 0006D7F1    call        TCustomListView.UpdateItems
 0006D7F6    add         esp,28
 0006D7F9    pop         esi
 0006D7FA    pop         ebx
 0006D7FB    ret
*}
end;

//0006D7FC
procedure TListItem.SetIndent(Value:Integer);
begin
{*
 0006D7FC    push        ebx
 0006D7FD    add         esp,0FFFFFFD8
 0006D800    mov         ebx,eax
 0006D802    cmp         edx,dword ptr [ebx+14]
>0006D805    je          0006D861
 0006D807    mov         dword ptr [ebx+14],edx
 0006D80A    mov         eax,dword ptr [ebx+4]
 0006D80D    mov         eax,dword ptr [eax+4]
 0006D810    cmp         byte ptr [eax+220],0
>0006D817    jne         0006D861
 0006D819    mov         dword ptr [esp],10
 0006D820    mov         dword ptr [esp+24],edx
 0006D824    mov         eax,ebx
 0006D826    call        TListItem.GetIndex
 0006D82B    mov         dword ptr [esp+4],eax
 0006D82F    xor         eax,eax
 0006D831    mov         dword ptr [esp+8],eax
 0006D835    mov         eax,ebx
 0006D837    call        TListItem.GetHandle
 0006D83C    mov         edx,esp
 0006D83E    call        ListView_SetItem
 0006D843    mov         eax,ebx
 0006D845    call        TListItem.GetIndex
 0006D84A    push        eax
 0006D84B    mov         eax,ebx
 0006D84D    call        TListItem.GetIndex
 0006D852    push        eax
 0006D853    mov         eax,ebx
 0006D855    call        TListItem.GetListView
 0006D85A    pop         edx
 0006D85B    pop         ecx
 0006D85C    call        TCustomListView.UpdateItems
 0006D861    add         esp,28
 0006D864    pop         ebx
 0006D865    ret
*}
end;

//0006D868
procedure TListItem.Assign(Source:TPersistent);
begin
{*
 0006D868    push        ebx
 0006D869    push        esi
 0006D86A    mov         esi,edx
 0006D86C    mov         ebx,eax
 0006D86E    mov         eax,esi
 0006D870    mov         edx,dword ptr ds:[67FA0];TListItem
 0006D876    call        @IsClass
 0006D87B    test        al,al
>0006D87D    je          0006D8F3
 0006D87F    mov         eax,esi
 0006D881    mov         edx,dword ptr ds:[67FA0];TListItem
 0006D887    call        @AsClass
 0006D88C    mov         esi,eax
 0006D88E    mov         edx,dword ptr [esi+24]
 0006D891    mov         eax,ebx
 0006D893    call        TListItem.SetCaption
 0006D898    mov         edx,dword ptr [esi+0C]
 0006D89B    mov         eax,ebx
 0006D89D    call        TListItem.SetData
 0006D8A2    mov         ecx,dword ptr [esi+10]
 0006D8A5    xor         edx,edx
 0006D8A7    mov         eax,ebx
 0006D8A9    call        TListItem.SetImage
 0006D8AE    mov         edx,dword ptr [esi+14]
 0006D8B1    mov         eax,ebx
 0006D8B3    call        TListItem.SetIndent
 0006D8B8    mov         ecx,dword ptr [esi+1C]
 0006D8BB    mov         edx,1
 0006D8C0    mov         eax,ebx
 0006D8C2    call        TListItem.SetImage
 0006D8C7    mov         ecx,dword ptr [esi+20]
 0006D8CA    mov         edx,2
 0006D8CF    mov         eax,ebx
 0006D8D1    call        TListItem.SetImage
 0006D8D6    mov         edx,dword ptr [esi+8]
 0006D8D9    mov         eax,ebx
 0006D8DB    call        TListItem.SetSubItems
 0006D8E0    mov         eax,esi
 0006D8E2    call        TListItem.GetChecked
 0006D8E7    mov         edx,eax
 0006D8E9    mov         eax,ebx
 0006D8EB    call        TListItem.SetChecked
 0006D8F0    pop         esi
 0006D8F1    pop         ebx
 0006D8F2    ret
 0006D8F3    mov         edx,esi
 0006D8F5    mov         eax,ebx
 0006D8F7    call        TPersistent.Assign
 0006D8FC    pop         esi
 0006D8FD    pop         ebx
 0006D8FE    ret
*}
end;

//0006D900
function TListItem.IsEqual(Item:TListItem):Boolean;
begin
{*
 0006D900    push        ebx
 0006D901    push        esi
 0006D902    mov         esi,edx
 0006D904    mov         ebx,eax
 0006D906    mov         eax,dword ptr [ebx+24]
 0006D909    mov         edx,dword ptr [esi+24]
 0006D90C    call        @LStrCmp
>0006D911    jne         0006D91B
 0006D913    mov         eax,dword ptr [ebx+0C]
 0006D916    cmp         eax,dword ptr [esi+0C]
>0006D919    je          0006D920
 0006D91B    xor         eax,eax
 0006D91D    pop         esi
 0006D91E    pop         ebx
 0006D91F    ret
 0006D920    mov         al,1
 0006D922    pop         esi
 0006D923    pop         ebx
 0006D924    ret
*}
end;

//0006D928
procedure TListItem.SetSubItems(Value:TStrings);
begin
{*
 0006D928    push        esi
 0006D929    mov         esi,eax
 0006D92B    test        edx,edx
>0006D92D    je          0006D937
 0006D92F    mov         eax,dword ptr [esi+8]
 0006D932    mov         ecx,dword ptr [eax]
 0006D934    call        dword ptr [ecx+8]
 0006D937    pop         esi
 0006D938    ret
*}
end;

//0006D93C
function TListItem.GetIndex:Integer;
begin
{*
 0006D93C    mov         edx,dword ptr [eax+4]
 0006D93F    mov         ecx,dword ptr [edx+4]
 0006D942    cmp         byte ptr [ecx+220],0
>0006D949    je          0006D94F
 0006D94B    mov         eax,dword ptr [eax+18]
 0006D94E    ret
 0006D94F    xchg        eax,edx
 0006D950    call        TListItems.IndexOf
 0006D955    ret
*}
end;

//0006D958
function TListItem.DisplayRect(Code:TDisplayCode):TRect;
begin
{*
 0006D958    push        ebx
 0006D959    push        esi
 0006D95A    push        edi
 0006D95B    mov         edi,ecx
 0006D95D    mov         ebx,edx
 0006D95F    mov         esi,eax
 0006D961    xor         eax,eax
 0006D963    mov         al,bl
 0006D965    mov         eax,dword ptr [eax*4+0B4C70]
 0006D96C    push        eax
 0006D96D    mov         eax,esi
 0006D96F    call        TListItem.GetIndex
 0006D974    push        eax
 0006D975    mov         eax,esi
 0006D977    call        TListItem.GetHandle
 0006D97C    mov         ecx,edi
 0006D97E    pop         edx
 0006D97F    call        ListView_GetItemRect
 0006D984    pop         edi
 0006D985    pop         esi
 0006D986    pop         ebx
 0006D987    ret
*}
end;

//0006D988
constructor TListItems.Create(AOwner:TCustomListView);
begin
{*
 0006D988    push        ebx
 0006D989    push        esi
 0006D98A    push        edi
 0006D98B    test        dl,dl
>0006D98D    je          0006D997
 0006D98F    add         esp,0FFFFFFF0
 0006D992    call        @ClassCreate
 0006D997    mov         esi,ecx
 0006D999    mov         ebx,edx
 0006D99B    mov         edi,eax
 0006D99D    xor         edx,edx
 0006D99F    mov         eax,edi
 0006D9A1    call        TObject.Create
 0006D9A6    mov         dword ptr [edi+4],esi
 0006D9A9    mov         eax,edi
 0006D9AB    test        bl,bl
>0006D9AD    je          0006D9BE
 0006D9AF    call        @AfterConstruction
 0006D9B4    pop         dword ptr fs:[0]
 0006D9BB    add         esp,0C
 0006D9BE    mov         eax,edi
 0006D9C0    pop         edi
 0006D9C1    pop         esi
 0006D9C2    pop         ebx
 0006D9C3    ret
*}
end;

//0006D9C4
destructor TListItems.Destroy;
begin
{*
 0006D9C4    push        ebx
 0006D9C5    push        esi
 0006D9C6    call        @BeforeDestruction
 0006D9CB    mov         ebx,edx
 0006D9CD    mov         esi,eax
 0006D9CF    mov         eax,esi
 0006D9D1    call        TListItems.Clear
 0006D9D6    mov         edx,ebx
 0006D9D8    and         dl,0FC
 0006D9DB    mov         eax,esi
 0006D9DD    call        TMemoryStream.Destroy
 0006D9E2    test        bl,bl
>0006D9E4    jle         0006D9ED
 0006D9E6    mov         eax,esi
 0006D9E8    call        @ClassDestroy
 0006D9ED    pop         esi
 0006D9EE    pop         ebx
 0006D9EF    ret
*}
end;

//0006D9F0
function TListItems.Add:TListItem;
begin
{*
 0006D9F0    push        ebx
 0006D9F1    push        esi
 0006D9F2    add         esp,0FFFFFFD8
 0006D9F5    mov         ebx,eax
 0006D9F7    mov         eax,dword ptr [ebx+4]
 0006D9FA    mov         edx,dword ptr [eax]
 0006D9FC    call        dword ptr [edx+0B8]
 0006DA02    mov         esi,eax
 0006DA04    push        esp
 0006DA05    mov         eax,ebx
 0006DA07    call        TListItems.GetCount
 0006DA0C    mov         edx,eax
 0006DA0E    mov         ecx,esi
 0006DA10    mov         eax,ebx
 0006DA12    call        TListItems.CreateItem
 0006DA17    push        esp
 0006DA18    mov         eax,ebx
 0006DA1A    call        TListItems.GetHandle
 0006DA1F    pop         edx
 0006DA20    call        ListView_InsertItem
 0006DA25    mov         eax,esi
 0006DA27    add         esp,28
 0006DA2A    pop         esi
 0006DA2B    pop         ebx
 0006DA2C    ret
*}
end;

//0006DA30
function TListItems.GetCount:Integer;
begin
{*
 0006DA30    push        ebx
 0006DA31    mov         ebx,eax
 0006DA33    mov         eax,dword ptr [ebx+4]
 0006DA36    call        TWinControl.HandleAllocated
 0006DA3B    test        al,al
>0006DA3D    je          0006DA4D
 0006DA3F    mov         eax,ebx
 0006DA41    call        TListItems.GetHandle
 0006DA46    call        ListView_GetItemCount
 0006DA4B    pop         ebx
 0006DA4C    ret
 0006DA4D    xor         eax,eax
 0006DA4F    pop         ebx
 0006DA50    ret
*}
end;

//0006DA54
function TListItems.GetHandle:HWND;
begin
{*
 0006DA54    mov         eax,dword ptr [eax+4]
 0006DA57    call        TWinControl.GetHandle
 0006DA5C    ret
*}
end;

//0006DA60
function TListItems.GetItem(Index:Integer):TListItem;
begin
{*
 0006DA60    push        ebx
 0006DA61    push        esi
 0006DA62    push        edi
 0006DA63    add         esp,0FFFFFFD8
 0006DA66    mov         edi,edx
 0006DA68    mov         ebx,eax
 0006DA6A    xor         esi,esi
 0006DA6C    mov         eax,dword ptr [ebx+4]
 0006DA6F    call        TWinControl.HandleAllocated
 0006DA74    test        al,al
>0006DA76    je          0006DAD6
 0006DA78    mov         eax,dword ptr [ebx+4]
 0006DA7B    cmp         byte ptr [eax+220],0
>0006DA82    je          0006DAAF
 0006DA84    mov         eax,esp
 0006DA86    xor         ecx,ecx
 0006DA88    mov         edx,28
 0006DA8D    call        @FillChar
 0006DA92    xor         eax,eax
 0006DA94    mov         dword ptr [esp],eax
 0006DA97    mov         dword ptr [esp+4],edi
 0006DA9B    xor         eax,eax
 0006DA9D    mov         dword ptr [esp+8],eax
 0006DAA1    mov         edx,esp
 0006DAA3    mov         eax,dword ptr [ebx+4]
 0006DAA6    call        TCustomListView.GetItem
 0006DAAB    mov         esi,eax
>0006DAAD    jmp         0006DAD6
 0006DAAF    mov         dword ptr [esp],4
 0006DAB6    mov         dword ptr [esp+4],edi
 0006DABA    xor         eax,eax
 0006DABC    mov         dword ptr [esp+8],eax
 0006DAC0    mov         eax,ebx
 0006DAC2    call        TListItems.GetHandle
 0006DAC7    mov         edx,esp
 0006DAC9    call        ListView_GetItem
 0006DACE    test        eax,eax
>0006DAD0    je          0006DAD6
 0006DAD2    mov         esi,dword ptr [esp+20]
 0006DAD6    mov         eax,esi
 0006DAD8    add         esp,28
 0006DADB    pop         edi
 0006DADC    pop         esi
 0006DADD    pop         ebx
 0006DADE    ret
*}
end;

//0006DAE0
function TListItems.IndexOf(Value:TListItem):Integer;
begin
{*
 0006DAE0    push        ebx
 0006DAE1    add         esp,0FFFFFFE8
 0006DAE4    mov         ebx,eax
 0006DAE6    mov         dword ptr [esp],1
 0006DAED    mov         dword ptr [esp+8],edx
 0006DAF1    mov         eax,ebx
 0006DAF3    call        TListItems.GetHandle
 0006DAF8    mov         ecx,esp
 0006DAFA    or          edx,0FFFFFFFF
 0006DAFD    call        ListView_FindItem
 0006DB02    add         esp,18
 0006DB05    pop         ebx
 0006DB06    ret
*}
end;

//0006DB08
procedure TListItems.Clear;
begin
{*
 0006DB08    push        ebx
 0006DB09    mov         ebx,eax
 0006DB0B    mov         eax,dword ptr [ebx+4]
 0006DB0E    call        TWinControl.HandleAllocated
 0006DB13    test        al,al
>0006DB15    je          0006DB23
 0006DB17    mov         eax,ebx
 0006DB19    call        TListItems.GetHandle
 0006DB1E    call        ListView_DeleteAllItems
 0006DB23    pop         ebx
 0006DB24    ret
*}
end;

//0006DB28
procedure TListItems.BeginUpdate;
begin
{*
 0006DB28    push        ebx
 0006DB29    mov         ebx,eax
 0006DB2B    cmp         dword ptr [ebx+8],0
>0006DB2F    jne         0006DB3A
 0006DB31    mov         dl,1
 0006DB33    mov         eax,ebx
 0006DB35    call        TListItems.SetUpdateState
 0006DB3A    inc         dword ptr [ebx+8]
 0006DB3D    pop         ebx
 0006DB3E    ret
*}
end;

//0006DB40
procedure TListItems.SetUpdateState(Updating:Boolean);
begin
{*
 0006DB40    push        ebp
 0006DB41    mov         ebp,esp
 0006DB43    push        ecx
 0006DB44    push        ebx
 0006DB45    push        esi
 0006DB46    push        edi
 0006DB47    mov         dword ptr [ebp-4],eax
 0006DB4A    test        dl,dl
>0006DB4C    je          0006DC11
 0006DB52    mov         eax,dword ptr [ebp-4]
 0006DB55    mov         eax,dword ptr [eax+4]
 0006DB58    mov         dl,byte ptr [eax+205]
 0006DB5E    mov         byte ptr [eax+264],dl
 0006DB64    xor         edx,edx
 0006DB66    call        TCustomListView.SetSortType
 0006DB6B    mov         eax,dword ptr [ebp-4]
 0006DB6E    mov         eax,dword ptr [eax+4]
 0006DB71    mov         eax,dword ptr [eax+218]
 0006DB77    call        TCollection.GetCount
 0006DB7C    mov         esi,eax
 0006DB7E    dec         esi
 0006DB7F    test        esi,esi
>0006DB81    jl          0006DBBA
 0006DB83    inc         esi
 0006DB84    xor         edi,edi
 0006DB86    mov         eax,dword ptr [ebp-4]
 0006DB89    mov         eax,dword ptr [eax+4]
 0006DB8C    mov         eax,dword ptr [eax+218]
 0006DB92    mov         edx,edi
 0006DB94    call        THeaderSections.GetItem
 0006DB99    mov         ebx,eax
 0006DB9B    mov         eax,dword ptr [ebx+24]
 0006DB9E    test        eax,eax
>0006DBA0    jge         0006DBB6
 0006DBA2    mov         dword ptr [ebx+20],eax
 0006DBA5    mov         eax,ebx
 0006DBA7    call        TListColumn.GetWidth
 0006DBAC    mov         dword ptr [ebx+24],eax
 0006DBAF    mov         eax,ebx
 0006DBB1    call        TListColumn.DoChange
 0006DBB6    inc         edi
 0006DBB7    dec         esi
>0006DBB8    jne         0006DB86
 0006DBBA    push        0
 0006DBBC    push        0
 0006DBBE    push        0B
 0006DBC0    mov         eax,dword ptr [ebp-4]
 0006DBC3    call        TListItems.GetHandle
 0006DBC8    push        eax
 0006DBC9    call        user32.SendMessageA
 0006DBCE    mov         eax,dword ptr [ebp-4]
 0006DBD1    mov         eax,dword ptr [eax+4]
 0006DBD4    call        TCustomListView.ColumnsShowing
 0006DBD9    test        al,al
>0006DBDB    je          0006DCFE
 0006DBE1    mov         eax,dword ptr [ebp-4]
 0006DBE4    mov         eax,dword ptr [eax+4]
 0006DBE7    call        TCustomListView.ValidHeaderHandle
 0006DBEC    test        al,al
>0006DBEE    je          0006DCFE
 0006DBF4    push        0
 0006DBF6    push        0
 0006DBF8    push        0B
 0006DBFA    mov         eax,dword ptr [ebp-4]
 0006DBFD    mov         eax,dword ptr [eax+4]
 0006DC00    mov         eax,dword ptr [eax+240]
 0006DC06    push        eax
 0006DC07    call        user32.SendMessageA
>0006DC0C    jmp         0006DCFE
 0006DC11    mov         eax,dword ptr [ebp-4]
 0006DC14    cmp         dword ptr [eax+8],0
>0006DC18    jne         0006DCFE
 0006DC1E    mov         eax,dword ptr [ebp-4]
 0006DC21    mov         eax,dword ptr [eax+4]
 0006DC24    mov         dl,byte ptr [eax+264]
 0006DC2A    call        TCustomListView.SetSortType
 0006DC2F    mov         eax,dword ptr [ebp-4]
 0006DC32    mov         eax,dword ptr [eax+4]
 0006DC35    mov         eax,dword ptr [eax+218]
 0006DC3B    call        TCollection.GetCount
 0006DC40    mov         esi,eax
 0006DC42    dec         esi
 0006DC43    test        esi,esi
>0006DC45    jl          0006DC78
 0006DC47    inc         esi
 0006DC48    xor         edi,edi
 0006DC4A    mov         eax,dword ptr [ebp-4]
 0006DC4D    mov         eax,dword ptr [eax+4]
 0006DC50    mov         eax,dword ptr [eax+218]
 0006DC56    mov         edx,edi
 0006DC58    call        THeaderSections.GetItem
 0006DC5D    mov         ebx,eax
 0006DC5F    mov         eax,dword ptr [ebx+20]
 0006DC62    test        eax,eax
>0006DC64    jge         0006DC74
 0006DC66    mov         edx,eax
 0006DC68    mov         eax,ebx
 0006DC6A    call        TListColumn.SetWidth
 0006DC6F    xor         eax,eax
 0006DC71    mov         dword ptr [ebx+20],eax
 0006DC74    inc         edi
 0006DC75    dec         esi
>0006DC76    jne         0006DC4A
 0006DC78    mov         eax,dword ptr [ebp-4]
 0006DC7B    mov         byte ptr [eax+0C],1
 0006DC7F    xor         eax,eax
 0006DC81    push        ebp
 0006DC82    push        6DCC1
 0006DC87    push        dword ptr fs:[eax]
 0006DC8A    mov         dword ptr fs:[eax],esp
 0006DC8D    push        0
 0006DC8F    push        1
 0006DC91    push        0B
 0006DC93    mov         eax,dword ptr [ebp-4]
 0006DC96    call        TListItems.GetHandle
 0006DC9B    push        eax
 0006DC9C    call        user32.SendMessageA
 0006DCA1    mov         eax,dword ptr [ebp-4]
 0006DCA4    mov         eax,dword ptr [eax+4]
 0006DCA7    mov         edx,dword ptr [eax]
 0006DCA9    call        dword ptr [edx+78]
 0006DCAC    xor         eax,eax
 0006DCAE    pop         edx
 0006DCAF    pop         ecx
 0006DCB0    pop         ecx
 0006DCB1    mov         dword ptr fs:[eax],edx
 0006DCB4    push        6DCC8
 0006DCB9    mov         eax,dword ptr [ebp-4]
 0006DCBC    mov         byte ptr [eax+0C],0
 0006DCC0    ret
>0006DCC1    jmp         @HandleFinally
>0006DCC6    jmp         0006DCB9
 0006DCC8    mov         eax,dword ptr [ebp-4]
 0006DCCB    mov         eax,dword ptr [eax+4]
 0006DCCE    call        TCustomListView.ColumnsShowing
 0006DCD3    test        al,al
>0006DCD5    je          0006DCFE
 0006DCD7    mov         eax,dword ptr [ebp-4]
 0006DCDA    mov         eax,dword ptr [eax+4]
 0006DCDD    call        TCustomListView.ValidHeaderHandle
 0006DCE2    test        al,al
>0006DCE4    je          0006DCFE
 0006DCE6    push        0
 0006DCE8    push        1
 0006DCEA    push        0B
 0006DCEC    mov         eax,dword ptr [ebp-4]
 0006DCEF    mov         eax,dword ptr [eax+4]
 0006DCF2    mov         eax,dword ptr [eax+240]
 0006DCF8    push        eax
 0006DCF9    call        user32.SendMessageA
 0006DCFE    pop         edi
 0006DCFF    pop         esi
 0006DD00    pop         ebx
 0006DD01    pop         ecx
 0006DD02    pop         ebp
 0006DD03    ret
*}
end;

//0006DD04
procedure TListItems.EndUpdate;
begin
{*
 0006DD04    dec         dword ptr [eax+8]
 0006DD07    cmp         dword ptr [eax+8],0
>0006DD0B    jne         0006DD14
 0006DD0D    xor         edx,edx
 0006DD0F    call        TListItems.SetUpdateState
 0006DD14    ret
*}
end;

//0006DD18
procedure TListItems.Assign(Source:TPersistent);
begin
{*
 0006DD18    push        ebx
 0006DD19    push        esi
 0006DD1A    push        edi
 0006DD1B    push        ebp
 0006DD1C    mov         ebx,edx
 0006DD1E    mov         edi,eax
 0006DD20    mov         eax,ebx
 0006DD22    mov         edx,dword ptr ds:[68038];TListItems
 0006DD28    call        @IsClass
 0006DD2D    test        al,al
>0006DD2F    je          0006DD68
 0006DD31    mov         eax,edi
 0006DD33    call        TListItems.Clear
 0006DD38    mov         ebp,ebx
 0006DD3A    mov         eax,ebp
 0006DD3C    call        TListItems.GetCount
 0006DD41    mov         ebx,eax
 0006DD43    dec         ebx
 0006DD44    test        ebx,ebx
>0006DD46    jl          0006DD71
 0006DD48    inc         ebx
 0006DD49    xor         esi,esi
 0006DD4B    mov         edx,esi
 0006DD4D    mov         eax,ebp
 0006DD4F    call        TListItems.GetItem
 0006DD54    push        eax
 0006DD55    mov         eax,edi
 0006DD57    call        TListItems.Add
 0006DD5C    pop         edx
 0006DD5D    mov         ecx,dword ptr [eax]
 0006DD5F    call        dword ptr [ecx+8]
 0006DD62    inc         esi
 0006DD63    dec         ebx
>0006DD64    jne         0006DD4B
>0006DD66    jmp         0006DD71
 0006DD68    mov         edx,ebx
 0006DD6A    mov         eax,edi
 0006DD6C    call        TPersistent.Assign
 0006DD71    pop         ebp
 0006DD72    pop         edi
 0006DD73    pop         esi
 0006DD74    pop         ebx
 0006DD75    ret
*}
end;

//0006DD78
function WriteItems:Boolean;
begin
{*
 0006DD78    push        ebp
 0006DD79    mov         ebp,esp
 0006DD7B    push        ecx
 0006DD7C    push        ebx
 0006DD7D    push        esi
 0006DD7E    push        edi
 0006DD7F    mov         eax,dword ptr [ebp+8]
 0006DD82    mov         eax,dword ptr [eax-4]
 0006DD85    mov         edi,dword ptr [eax+1C]
 0006DD88    test        edi,edi
>0006DD8A    jne         0006DD9E
 0006DD8C    mov         eax,dword ptr [ebp+8]
 0006DD8F    mov         eax,dword ptr [eax-8]
 0006DD92    call        TListItems.GetCount
 0006DD97    test        eax,eax
 0006DD99    setg        bl
>0006DD9C    jmp         0006DDFE
 0006DD9E    mov         eax,edi
 0006DDA0    call        TListItems.GetCount
 0006DDA5    mov         ebx,eax
 0006DDA7    mov         eax,dword ptr [ebp+8]
 0006DDAA    mov         eax,dword ptr [eax-8]
 0006DDAD    call        TListItems.GetCount
 0006DDB2    cmp         ebx,eax
>0006DDB4    je          0006DDBA
 0006DDB6    mov         bl,1
>0006DDB8    jmp         0006DDFE
 0006DDBA    xor         ebx,ebx
 0006DDBC    mov         eax,dword ptr [ebp+8]
 0006DDBF    mov         eax,dword ptr [eax-8]
 0006DDC2    call        TListItems.GetCount
 0006DDC7    dec         eax
 0006DDC8    test        eax,eax
>0006DDCA    jl          0006DDFE
 0006DDCC    inc         eax
 0006DDCD    mov         dword ptr [ebp-4],eax
 0006DDD0    xor         esi,esi
 0006DDD2    mov         edx,esi
 0006DDD4    mov         eax,edi
 0006DDD6    call        TListItems.GetItem
 0006DDDB    push        eax
 0006DDDC    mov         eax,dword ptr [ebp+8]
 0006DDDF    mov         eax,dword ptr [eax-8]
 0006DDE2    mov         edx,esi
 0006DDE4    call        TListItems.GetItem
 0006DDE9    pop         edx
 0006DDEA    call        TListItem.IsEqual
 0006DDEF    mov         ebx,eax
 0006DDF1    xor         bl,1
 0006DDF4    test        bl,bl
>0006DDF6    jne         0006DDFE
 0006DDF8    inc         esi
 0006DDF9    dec         dword ptr [ebp-4]
>0006DDFC    jne         0006DDD2
 0006DDFE    mov         eax,ebx
 0006DE00    pop         edi
 0006DE01    pop         esi
 0006DE02    pop         ebx
 0006DE03    pop         ecx
 0006DE04    pop         ebp
 0006DE05    ret
*}
end;

//0006DE08
procedure TListItems.DefineProperties(Filer:TFiler);
begin
{*
 0006DE08    push        ebp
 0006DE09    mov         ebp,esp
 0006DE0B    add         esp,0FFFFFFF8
 0006DE0E    push        ebx
 0006DE0F    mov         dword ptr [ebp-4],edx
 0006DE12    mov         dword ptr [ebp-8],eax
 0006DE15    mov         edx,dword ptr [ebp-4]
 0006DE18    mov         eax,dword ptr [ebp-8]
 0006DE1B    call        TPersistent.DefineProperties
 0006DE20    mov         eax,dword ptr [ebp-8]
 0006DE23    push        eax
 0006DE24    push        6DE60;TListItems.ReadData
 0006DE29    mov         eax,dword ptr [ebp-8]
 0006DE2C    push        eax
 0006DE2D    push        6DFF8;TListItems.WriteData
 0006DE32    push        ebp
 0006DE33    call        WriteItems
 0006DE38    pop         ecx
 0006DE39    mov         ecx,eax
 0006DE3B    mov         edx,6DE58;'Data'
 0006DE40    mov         eax,dword ptr [ebp-4]
 0006DE43    mov         ebx,dword ptr [eax]
 0006DE45    call        dword ptr [ebx+4]
 0006DE48    pop         ebx
 0006DE49    pop         ecx
 0006DE4A    pop         ecx
 0006DE4B    pop         ebp
 0006DE4C    ret
*}
end;

//0006DE60
procedure TListItems.ReadData(Stream:TStream);
begin
{*
 0006DE60    push        ebp
 0006DE61    mov         ebp,esp
 0006DE63    add         esp,0FFFFFFE0
 0006DE66    push        ebx
 0006DE67    push        esi
 0006DE68    xor         ecx,ecx
 0006DE6A    mov         dword ptr [ebp-20],ecx
 0006DE6D    mov         ebx,edx
 0006DE6F    mov         dword ptr [ebp-4],eax
 0006DE72    xor         eax,eax
 0006DE74    push        ebp
 0006DE75    push        6DFD6
 0006DE7A    push        dword ptr fs:[eax]
 0006DE7D    mov         dword ptr fs:[eax],esp
 0006DE80    mov         eax,dword ptr [ebp-4]
 0006DE83    call        TListItems.Clear
 0006DE88    lea         edx,[ebp-8]
 0006DE8B    mov         ecx,4
 0006DE90    mov         eax,ebx
 0006DE92    call        TStream.ReadBuffer
 0006DE97    mov         eax,dword ptr [ebp-8]
 0006DE9A    call        AllocMem
 0006DE9F    mov         dword ptr [ebp-10],eax
 0006DEA2    xor         ecx,ecx
 0006DEA4    push        ebp
 0006DEA5    push        6DFB9
 0006DEAA    push        dword ptr fs:[ecx]
 0006DEAD    mov         dword ptr fs:[ecx],esp
 0006DEB0    mov         ecx,dword ptr [ebp-8]
 0006DEB3    sub         ecx,4
 0006DEB6    mov         eax,dword ptr [ebp-10]
 0006DEB9    lea         edx,[eax+4]
 0006DEBC    mov         eax,ebx
 0006DEBE    call        TStream.ReadBuffer
 0006DEC3    mov         eax,dword ptr [ebp-10]
 0006DEC6    add         eax,8
 0006DEC9    mov         dword ptr [ebp-14],eax
 0006DECC    mov         eax,dword ptr [ebp-10]
 0006DECF    mov         eax,dword ptr [eax+4]
 0006DED2    dec         eax
 0006DED3    test        eax,eax
>0006DED5    jl          0006DFA0
 0006DEDB    inc         eax
 0006DEDC    mov         dword ptr [ebp-18],eax
 0006DEDF    mov         eax,dword ptr [ebp-4]
 0006DEE2    call        TListItems.Add
 0006DEE7    mov         esi,eax
 0006DEE9    lea         eax,[ebp-20]
 0006DEEC    mov         edx,dword ptr [ebp-14]
 0006DEEF    add         edx,14
 0006DEF2    call        @LStrFromString
 0006DEF7    mov         edx,dword ptr [ebp-20]
 0006DEFA    mov         eax,esi
 0006DEFC    call        TListItem.SetCaption
 0006DF01    mov         eax,dword ptr [ebp-14]
 0006DF04    mov         ecx,dword ptr [eax]
 0006DF06    xor         edx,edx
 0006DF08    mov         eax,esi
 0006DF0A    call        TListItem.SetImage
 0006DF0F    mov         eax,dword ptr [ebp-14]
 0006DF12    mov         ecx,dword ptr [eax+8]
 0006DF15    mov         edx,1
 0006DF1A    mov         eax,esi
 0006DF1C    call        TListItem.SetImage
 0006DF21    mov         eax,dword ptr [ebp-14]
 0006DF24    mov         ecx,dword ptr [eax+4]
 0006DF27    mov         edx,2
 0006DF2C    mov         eax,esi
 0006DF2E    call        TListItem.SetImage
 0006DF33    mov         eax,dword ptr [ebp-14]
 0006DF36    mov         edx,dword ptr [eax+10]
 0006DF39    mov         eax,esi
 0006DF3B    call        TListItem.SetData
 0006DF40    mov         eax,dword ptr [ebp-14]
 0006DF43    lea         ebx,[eax+14]
 0006DF46    xor         eax,eax
 0006DF48    mov         al,byte ptr [ebx]
 0006DF4A    inc         eax
 0006DF4B    add         ebx,eax
 0006DF4D    xor         eax,eax
 0006DF4F    mov         dword ptr [ebp-0C],eax
 0006DF52    mov         eax,dword ptr [ebp-14]
 0006DF55    mov         eax,dword ptr [eax+0C]
 0006DF58    dec         eax
 0006DF59    test        eax,eax
>0006DF5B    jl          0006DF87
 0006DF5D    inc         eax
 0006DF5E    mov         dword ptr [ebp-1C],eax
 0006DF61    lea         eax,[ebp-20]
 0006DF64    mov         edx,ebx
 0006DF66    call        @LStrFromString
 0006DF6B    mov         edx,dword ptr [ebp-20]
 0006DF6E    mov         eax,dword ptr [esi+8]
 0006DF71    mov         ecx,dword ptr [eax]
 0006DF73    call        dword ptr [ecx+34]
 0006DF76    xor         eax,eax
 0006DF78    mov         al,byte ptr [ebx]
 0006DF7A    lea         edx,[eax+1]
 0006DF7D    add         dword ptr [ebp-0C],edx
 0006DF80    add         ebx,edx
 0006DF82    dec         dword ptr [ebp-1C]
>0006DF85    jne         0006DF61
 0006DF87    mov         eax,dword ptr [ebp-14]
 0006DF8A    movzx       eax,byte ptr [eax+14]
 0006DF8E    add         eax,15
 0006DF91    add         eax,dword ptr [ebp-0C]
 0006DF94    add         dword ptr [ebp-14],eax
 0006DF97    dec         dword ptr [ebp-18]
>0006DF9A    jne         0006DEDF
 0006DFA0    xor         eax,eax
 0006DFA2    pop         edx
 0006DFA3    pop         ecx
 0006DFA4    pop         ecx
 0006DFA5    mov         dword ptr fs:[eax],edx
 0006DFA8    push        6DFC0
 0006DFAD    mov         edx,dword ptr [ebp-8]
 0006DFB0    mov         eax,dword ptr [ebp-10]
 0006DFB3    call        @FreeMem
 0006DFB8    ret
>0006DFB9    jmp         @HandleFinally
>0006DFBE    jmp         0006DFAD
 0006DFC0    xor         eax,eax
 0006DFC2    pop         edx
 0006DFC3    pop         ecx
 0006DFC4    pop         ecx
 0006DFC5    mov         dword ptr fs:[eax],edx
 0006DFC8    push        6DFDD
 0006DFCD    lea         eax,[ebp-20]
 0006DFD0    call        @LStrClr
 0006DFD5    ret
>0006DFD6    jmp         @HandleFinally
>0006DFDB    jmp         0006DFCD
 0006DFDD    pop         esi
 0006DFDE    pop         ebx
 0006DFDF    mov         esp,ebp
 0006DFE1    pop         ebp
 0006DFE2    ret
*}
end;

//0006DFE4
function GetLength(const S:AnsiString):Integer;
begin
{*
 0006DFE4    call        @LStrLen
 0006DFE9    cmp         eax,0FF
>0006DFEE    jle         0006DFF5
 0006DFF0    mov         eax,0FF
 0006DFF5    ret
*}
end;

//0006DFF8
procedure TListItems.WriteData(Stream:TStream);
begin
{*
 0006DFF8    push        ebp
 0006DFF9    mov         ebp,esp
 0006DFFB    add         esp,0FFFFFFD0
 0006DFFE    push        ebx
 0006DFFF    push        esi
 0006E000    push        edi
 0006E001    xor         ecx,ecx
 0006E003    mov         dword ptr [ebp-30],ecx
 0006E006    mov         dword ptr [ebp-8],edx
 0006E009    mov         dword ptr [ebp-4],eax
 0006E00C    xor         eax,eax
 0006E00E    push        ebp
 0006E00F    push        6E229
 0006E014    push        dword ptr fs:[eax]
 0006E017    mov         dword ptr fs:[eax],esp
 0006E01A    mov         dword ptr [ebp-14],8
 0006E021    mov         eax,dword ptr [ebp-4]
 0006E024    call        TListItems.GetCount
 0006E029    dec         eax
 0006E02A    test        eax,eax
>0006E02C    jl          0006E0A8
 0006E02E    inc         eax
 0006E02F    mov         dword ptr [ebp-28],eax
 0006E032    mov         dword ptr [ebp-0C],0
 0006E039    mov         edx,dword ptr [ebp-0C]
 0006E03C    mov         eax,dword ptr [ebp-4]
 0006E03F    call        TListItems.GetItem
 0006E044    mov         eax,dword ptr [eax+24]
 0006E047    call        GetLength
 0006E04C    mov         esi,eax
 0006E04E    mov         edx,dword ptr [ebp-0C]
 0006E051    mov         eax,dword ptr [ebp-4]
 0006E054    call        TListItems.GetItem
 0006E059    mov         eax,dword ptr [eax+8]
 0006E05C    mov         edx,dword ptr [eax]
 0006E05E    call        dword ptr [edx+14]
 0006E061    mov         ebx,eax
 0006E063    dec         ebx
 0006E064    test        ebx,ebx
>0006E066    jl          0006E09A
 0006E068    inc         ebx
 0006E069    mov         dword ptr [ebp-10],0
 0006E070    mov         edx,dword ptr [ebp-0C]
 0006E073    mov         eax,dword ptr [ebp-4]
 0006E076    call        TListItems.GetItem
 0006E07B    mov         eax,dword ptr [eax+8]
 0006E07E    lea         ecx,[ebp-30]
 0006E081    mov         edx,dword ptr [ebp-10]
 0006E084    mov         edi,dword ptr [eax]
 0006E086    call        dword ptr [edi+0C]
 0006E089    mov         eax,dword ptr [ebp-30]
 0006E08C    call        GetLength
 0006E091    inc         eax
 0006E092    add         esi,eax
 0006E094    inc         dword ptr [ebp-10]
 0006E097    dec         ebx
>0006E098    jne         0006E070
 0006E09A    add         esi,15
 0006E09D    add         dword ptr [ebp-14],esi
 0006E0A0    inc         dword ptr [ebp-0C]
 0006E0A3    dec         dword ptr [ebp-28]
>0006E0A6    jne         0006E039
 0006E0A8    mov         eax,dword ptr [ebp-14]
 0006E0AB    call        AllocMem
 0006E0B0    mov         dword ptr [ebp-1C],eax
 0006E0B3    xor         edx,edx
 0006E0B5    push        ebp
 0006E0B6    push        6E20C
 0006E0BB    push        dword ptr fs:[edx]
 0006E0BE    mov         dword ptr fs:[edx],esp
 0006E0C1    mov         eax,dword ptr [ebp-1C]
 0006E0C4    mov         edx,dword ptr [ebp-14]
 0006E0C7    mov         dword ptr [eax],edx
 0006E0C9    mov         eax,dword ptr [ebp-4]
 0006E0CC    call        TListItems.GetCount
 0006E0D1    mov         edx,dword ptr [ebp-1C]
 0006E0D4    mov         dword ptr [edx+4],eax
 0006E0D7    mov         eax,dword ptr [ebp-1C]
 0006E0DA    add         eax,8
 0006E0DD    mov         dword ptr [ebp-20],eax
 0006E0E0    mov         eax,dword ptr [ebp-4]
 0006E0E3    call        TListItems.GetCount
 0006E0E8    dec         eax
 0006E0E9    test        eax,eax
>0006E0EB    jl          0006E1E5
 0006E0F1    inc         eax
 0006E0F2    mov         dword ptr [ebp-28],eax
 0006E0F5    mov         dword ptr [ebp-0C],0
 0006E0FC    mov         edx,dword ptr [ebp-0C]
 0006E0FF    mov         eax,dword ptr [ebp-4]
 0006E102    call        TListItems.GetItem
 0006E107    mov         dword ptr [ebp-2C],eax
 0006E10A    mov         eax,dword ptr [ebp-20]
 0006E10D    add         eax,14
 0006E110    mov         edx,dword ptr [ebp-2C]
 0006E113    mov         edx,dword ptr [edx+24]
 0006E116    mov         ecx,0FF
 0006E11B    call        @LStrToString
 0006E120    mov         eax,dword ptr [ebp-2C]
 0006E123    mov         eax,dword ptr [eax+10]
 0006E126    mov         edx,dword ptr [ebp-20]
 0006E129    mov         dword ptr [edx],eax
 0006E12B    mov         eax,dword ptr [ebp-2C]
 0006E12E    mov         eax,dword ptr [eax+1C]
 0006E131    mov         edx,dword ptr [ebp-20]
 0006E134    mov         dword ptr [edx+8],eax
 0006E137    mov         eax,dword ptr [ebp-2C]
 0006E13A    mov         eax,dword ptr [eax+20]
 0006E13D    mov         edx,dword ptr [ebp-20]
 0006E140    mov         dword ptr [edx+4],eax
 0006E143    mov         eax,dword ptr [ebp-2C]
 0006E146    mov         eax,dword ptr [eax+0C]
 0006E149    mov         edx,dword ptr [ebp-20]
 0006E14C    mov         dword ptr [edx+10],eax
 0006E14F    mov         eax,dword ptr [ebp-2C]
 0006E152    mov         eax,dword ptr [eax+8]
 0006E155    mov         edx,dword ptr [eax]
 0006E157    call        dword ptr [edx+14]
 0006E15A    mov         edx,dword ptr [ebp-20]
 0006E15D    mov         dword ptr [edx+0C],eax
 0006E160    mov         eax,dword ptr [ebp-20]
 0006E163    add         eax,14
 0006E166    mov         dword ptr [ebp-24],eax
 0006E169    mov         eax,dword ptr [ebp-20]
 0006E16C    movzx       eax,byte ptr [eax+14]
 0006E170    inc         eax
 0006E171    add         dword ptr [ebp-24],eax
 0006E174    xor         eax,eax
 0006E176    mov         dword ptr [ebp-18],eax
 0006E179    mov         eax,dword ptr [ebp-2C]
 0006E17C    mov         eax,dword ptr [eax+8]
 0006E17F    mov         edx,dword ptr [eax]
 0006E181    call        dword ptr [edx+14]
 0006E184    mov         ebx,eax
 0006E186    dec         ebx
 0006E187    test        ebx,ebx
>0006E189    jl          0006E1C9
 0006E18B    inc         ebx
 0006E18C    mov         dword ptr [ebp-10],0
 0006E193    lea         ecx,[ebp-30]
 0006E196    mov         eax,dword ptr [ebp-2C]
 0006E199    mov         eax,dword ptr [eax+8]
 0006E19C    mov         edx,dword ptr [ebp-10]
 0006E19F    mov         esi,dword ptr [eax]
 0006E1A1    call        dword ptr [esi+0C]
 0006E1A4    mov         edx,dword ptr [ebp-30]
 0006E1A7    mov         eax,dword ptr [ebp-24]
 0006E1AA    mov         ecx,0FF
 0006E1AF    call        @LStrToString
 0006E1B4    mov         eax,dword ptr [ebp-24]
 0006E1B7    movzx       esi,byte ptr [eax]
 0006E1BA    lea         eax,[esi+1]
 0006E1BD    add         dword ptr [ebp-18],eax
 0006E1C0    add         dword ptr [ebp-24],eax
 0006E1C3    inc         dword ptr [ebp-10]
 0006E1C6    dec         ebx
>0006E1C7    jne         0006E193
 0006E1C9    mov         eax,dword ptr [ebp-20]
 0006E1CC    movzx       eax,byte ptr [eax+14]
 0006E1D0    add         eax,15
 0006E1D3    add         eax,dword ptr [ebp-18]
 0006E1D6    add         dword ptr [ebp-20],eax
 0006E1D9    inc         dword ptr [ebp-0C]
 0006E1DC    dec         dword ptr [ebp-28]
>0006E1DF    jne         0006E0FC
 0006E1E5    mov         edx,dword ptr [ebp-1C]
 0006E1E8    mov         ecx,dword ptr [ebp-14]
 0006E1EB    mov         eax,dword ptr [ebp-8]
 0006E1EE    call        TStream.WriteBuffer
 0006E1F3    xor         eax,eax
 0006E1F5    pop         edx
 0006E1F6    pop         ecx
 0006E1F7    pop         ecx
 0006E1F8    mov         dword ptr fs:[eax],edx
 0006E1FB    push        6E213
 0006E200    mov         edx,dword ptr [ebp-14]
 0006E203    mov         eax,dword ptr [ebp-1C]
 0006E206    call        @FreeMem
 0006E20B    ret
>0006E20C    jmp         @HandleFinally
>0006E211    jmp         0006E200
 0006E213    xor         eax,eax
 0006E215    pop         edx
 0006E216    pop         ecx
 0006E217    pop         ecx
 0006E218    mov         dword ptr fs:[eax],edx
 0006E21B    push        6E230
 0006E220    lea         eax,[ebp-30]
 0006E223    call        @LStrClr
 0006E228    ret
>0006E229    jmp         @HandleFinally
>0006E22E    jmp         0006E220
 0006E230    pop         edi
 0006E231    pop         esi
 0006E232    pop         ebx
 0006E233    mov         esp,ebp
 0006E235    pop         ebp
 0006E236    ret
*}
end;

//0006E238
function TListItems.CreateItem(Index:Integer; ListItem:TListItem):TLVItem;
begin
{*
 0006E238    push        ebp
 0006E239    mov         ebp,esp
 0006E23B    mov         eax,dword ptr [ebp+8]
 0006E23E    mov         dword ptr [eax],6
 0006E244    mov         dword ptr [eax+4],edx
 0006E247    xor         edx,edx
 0006E249    mov         dword ptr [eax+8],edx
 0006E24C    mov         dword ptr [eax+1C],0FFFFFFFF
 0006E253    mov         dword ptr [eax+20],ecx
 0006E256    pop         ebp
 0006E257    ret         4
*}
end;

//0006E25C
constructor TIconOptions.Create(AOwner:TCustomListView);
begin
{*
 0006E25C    push        ebp
 0006E25D    mov         ebp,esp
 0006E25F    push        0
 0006E261    push        ebx
 0006E262    push        esi
 0006E263    push        edi
 0006E264    test        dl,dl
>0006E266    je          0006E270
 0006E268    add         esp,0FFFFFFF0
 0006E26B    call        @ClassCreate
 0006E270    mov         esi,ecx
 0006E272    mov         ebx,edx
 0006E274    mov         edi,eax
 0006E276    xor         eax,eax
 0006E278    push        ebp
 0006E279    push        6E2E6
 0006E27E    push        dword ptr fs:[eax]
 0006E281    mov         dword ptr fs:[eax],esp
 0006E284    xor         edx,edx
 0006E286    mov         eax,edi
 0006E288    call        TObject.Create
 0006E28D    test        esi,esi
>0006E28F    jne         0006E2B2
 0006E291    lea         edx,[ebp-4]
 0006E294    mov         eax,[000B5A04];^sInvalidOwner:TResStringRec
 0006E299    call        LoadResString
 0006E29E    mov         ecx,dword ptr [ebp-4]
 0006E2A1    mov         dl,1
 0006E2A3    mov         eax,[000176E8];Exception
 0006E2A8    call        Exception.Create
 0006E2AD    call        @RaiseExcept
 0006E2B2    mov         dword ptr [edi+4],esi
 0006E2B5    xor         edx,edx
 0006E2B7    mov         eax,edi
 0006E2B9    call        TIconOptions.SetArrangement
 0006E2BE    xor         edx,edx
 0006E2C0    mov         eax,edi
 0006E2C2    call        TIconOptions.SetAutoArrange
 0006E2C7    mov         dl,1
 0006E2C9    mov         eax,edi
 0006E2CB    call        TIconOptions.SetWrapText
 0006E2D0    xor         eax,eax
 0006E2D2    pop         edx
 0006E2D3    pop         ecx
 0006E2D4    pop         ecx
 0006E2D5    mov         dword ptr fs:[eax],edx
 0006E2D8    push        6E2ED
 0006E2DD    lea         eax,[ebp-4]
 0006E2E0    call        @LStrClr
 0006E2E5    ret
>0006E2E6    jmp         @HandleFinally
>0006E2EB    jmp         0006E2DD
 0006E2ED    mov         eax,edi
 0006E2EF    test        bl,bl
>0006E2F1    je          0006E302
 0006E2F3    call        @AfterConstruction
 0006E2F8    pop         dword ptr fs:[0]
 0006E2FF    add         esp,0C
 0006E302    mov         eax,edi
 0006E304    pop         edi
 0006E305    pop         esi
 0006E306    pop         ebx
 0006E307    pop         ecx
 0006E308    pop         ebp
 0006E309    ret
*}
end;

//0006E30C
procedure TIconOptions.SetArrangement(Value:TIconArrangement);
begin
{*
 0006E30C    cmp         dl,byte ptr [eax+8]
>0006E30F    je          0006E31C
 0006E311    mov         byte ptr [eax+8],dl
 0006E314    mov         eax,dword ptr [eax+4]
 0006E317    call        TWinControl.RecreateWnd
 0006E31C    ret
*}
end;

//0006E320
procedure TIconOptions.SetAutoArrange(Value:Boolean);
begin
{*
 0006E320    cmp         dl,byte ptr [eax+9]
>0006E323    je          0006E330
 0006E325    mov         byte ptr [eax+9],dl
 0006E328    mov         eax,dword ptr [eax+4]
 0006E32B    call        TWinControl.RecreateWnd
 0006E330    ret
*}
end;

//0006E334
procedure TIconOptions.SetWrapText(Value:Boolean);
begin
{*
 0006E334    cmp         dl,byte ptr [eax+0A]
>0006E337    je          0006E344
 0006E339    mov         byte ptr [eax+0A],dl
 0006E33C    mov         eax,dword ptr [eax+4]
 0006E33F    call        TWinControl.RecreateWnd
 0006E344    ret
*}
end;

//0006E348
function DefaultListViewSort(Item1:TListItem; Item2:TListItem; lParam:Integer):Integer; stdcall;
begin
{*
 0006E348    push        ebp
 0006E349    mov         ebp,esp
 0006E34B    push        ecx
 0006E34C    push        ebx
 0006E34D    push        esi
 0006E34E    mov         esi,dword ptr [ebp+0C]
 0006E351    mov         ebx,dword ptr [ebp+8]
 0006E354    mov         eax,ebx
 0006E356    call        TListItem.GetListView
 0006E35B    cmp         word ptr [eax+2EE],0
>0006E363    je          0006E390
 0006E365    push        esi
 0006E366    mov         eax,dword ptr [ebp+10]
 0006E369    push        eax
 0006E36A    lea         eax,[ebp-4]
 0006E36D    push        eax
 0006E36E    mov         eax,ebx
 0006E370    call        TListItem.GetListView
 0006E375    mov         esi,eax
 0006E377    mov         eax,ebx
 0006E379    call        TListItem.GetListView
 0006E37E    mov         edx,eax
 0006E380    mov         ecx,ebx
 0006E382    mov         eax,dword ptr [esi+2F0]
 0006E388    call        dword ptr [esi+2EC]
>0006E38E    jmp         0006E3AA
 0006E390    mov         eax,dword ptr [esi+24]
 0006E393    call        @LStrToPChar
 0006E398    push        eax
 0006E399    mov         eax,dword ptr [ebx+24]
 0006E39C    call        @LStrToPChar
 0006E3A1    push        eax
 0006E3A2    call        kernel32.lstrcmpA
 0006E3A7    mov         dword ptr [ebp-4],eax
 0006E3AA    mov         eax,dword ptr [ebp-4]
 0006E3AD    pop         esi
 0006E3AE    pop         ebx
 0006E3AF    pop         ecx
 0006E3B0    pop         ebp
 0006E3B1    ret         0C
*}
end;

//0006E3B4
constructor TCustomListView.Create(AOwner:TComponent);
begin
{*
 0006E3B4    push        ebp
 0006E3B5    mov         ebp,esp
 0006E3B7    push        ecx
 0006E3B8    push        ebx
 0006E3B9    push        esi
 0006E3BA    test        dl,dl
>0006E3BC    je          0006E3C6
 0006E3BE    add         esp,0FFFFFFF0
 0006E3C1    call        @ClassCreate
 0006E3C6    mov         byte ptr [ebp-1],dl
 0006E3C9    mov         ebx,eax
 0006E3CB    xor         edx,edx
 0006E3CD    mov         eax,ebx
 0006E3CF    call        TWinControl.Create
 0006E3D4    mov         eax,[0006E564]
 0006E3D9    not         eax
 0006E3DB    and         eax,dword ptr [ebx+40]
 0006E3DE    or          eax,dword ptr ds:[6E568]
 0006E3E4    mov         dword ptr [ebx+40],eax
 0006E3E7    mov         edx,0FA
 0006E3EC    mov         eax,ebx
 0006E3EE    call        TControl.SetWidth
 0006E3F3    mov         edx,96
 0006E3F8    mov         eax,ebx
 0006E3FA    call        TControl.SetHeight
 0006E3FF    mov         dl,1
 0006E401    mov         eax,ebx
 0006E403    call        TCustomTabControl.SetHotTrack
 0006E408    xor         edx,edx
 0006E40A    mov         eax,ebx
 0006E40C    call        TCustomListView.SetViewStyle
 0006E411    xor         edx,edx
 0006E413    mov         eax,ebx
 0006E415    call        TControl.SetParentColor
 0006E41A    mov         dl,1
 0006E41C    mov         eax,ebx
 0006E41E    call        TWinControl.SetTabStop
 0006E423    mov         dl,1
 0006E425    mov         eax,ebx
 0006E427    call        TCustomListView.SetHideSelection
 0006E42C    mov         dl,1
 0006E42E    mov         eax,ebx
 0006E430    call        TCustomListView.SetColumnHeaders
 0006E435    mov         dl,1
 0006E437    mov         eax,ebx
 0006E439    call        TCustomListView.SetColumnClick
 0006E43E    mov         dl,1
 0006E440    mov         eax,[0003E18C];TControlCanvas
 0006E445    call        TCanvas.Create
 0006E44A    mov         esi,eax
 0006E44C    mov         dword ptr [ebx+1EC],esi
 0006E452    mov         edx,ebx
 0006E454    mov         eax,esi
 0006E456    call        TControlCanvas.SetControl
 0006E45B    mov         dword ptr [ebx+248],0FFFFFFFF
 0006E465    mov         ecx,ebx
 0006E467    mov         dl,1
 0006E469    mov         eax,[00067EF8];TListColumns
 0006E46E    call        TListColumns.Create
 0006E473    mov         dword ptr [ebx+218],eax
 0006E479    mov         ecx,ebx
 0006E47B    mov         dl,1
 0006E47D    mov         eax,[00068038];TListItems
 0006E482    call        TListItems.Create
 0006E487    mov         dword ptr [ebx+208],eax
 0006E48D    mov         eax,ebx
 0006E48F    mov         edx,dword ptr [eax]
 0006E491    call        dword ptr [edx+0B8]
 0006E497    mov         dword ptr [ebx+268],eax
 0006E49D    mov         ecx,ebx
 0006E49F    mov         dl,1
 0006E4A1    mov         eax,[000680F4];TIconOptions
 0006E4A6    call        TIconOptions.Create
 0006E4AB    mov         dword ptr [ebx+210],eax
 0006E4B1    push        20
 0006E4B3    mov         ecx,20
 0006E4B8    mov         dl,1
 0006E4BA    mov         eax,[0003F880];TDragImageList
 0006E4BF    call        TCustomImageList.CreateSize
 0006E4C4    mov         dword ptr [ebx+200],eax
 0006E4CA    push        ebx
 0006E4CB    push        6EDE8;TCustomListView.EditWndProc
 0006E4D0    call        MakeObjectInstance
 0006E4D5    mov         dword ptr [ebx+22C],eax
 0006E4DB    push        ebx
 0006E4DC    push        6ECF0;TCustomListView.HeaderWndProc
 0006E4E1    call        MakeObjectInstance
 0006E4E6    mov         dword ptr [ebx+238],eax
 0006E4EC    mov         dl,1
 0006E4EE    mov         eax,[0004E008];TChangeLink
 0006E4F3    call        TObject.Create
 0006E4F8    mov         esi,eax
 0006E4FA    mov         dword ptr [ebx+258],esi
 0006E500    mov         dword ptr [esi+0C],ebx
 0006E503    mov         dword ptr [esi+8],6EB00;TCustomListView.ImageListChange
 0006E50A    mov         dl,1
 0006E50C    mov         eax,[0004E008];TChangeLink
 0006E511    call        TObject.Create
 0006E516    mov         esi,eax
 0006E518    mov         dword ptr [ebx+25C],esi
 0006E51E    mov         dword ptr [esi+0C],ebx
 0006E521    mov         dword ptr [esi+8],6EB00;TCustomListView.ImageListChange
 0006E528    mov         dl,1
 0006E52A    mov         eax,[0004E008];TChangeLink
 0006E52F    call        TObject.Create
 0006E534    mov         esi,eax
 0006E536    mov         dword ptr [ebx+260],esi
 0006E53C    mov         dword ptr [esi+0C],ebx
 0006E53F    mov         dword ptr [esi+8],6EB00;TCustomListView.ImageListChange
 0006E546    mov         eax,ebx
 0006E548    cmp         byte ptr [ebp-1],0
>0006E54C    je          0006E55D
 0006E54E    call        @AfterConstruction
 0006E553    pop         dword ptr fs:[0]
 0006E55A    add         esp,0C
 0006E55D    mov         eax,ebx
 0006E55F    pop         esi
 0006E560    pop         ebx
 0006E561    pop         ecx
 0006E562    pop         ebp
 0006E563    ret
*}
end;

//0006E56C
destructor TCustomListView.Destroy;
begin
{*
 0006E56C    push        ebx
 0006E56D    push        esi
 0006E56E    call        @BeforeDestruction
 0006E573    mov         ebx,edx
 0006E575    mov         esi,eax
 0006E577    mov         eax,esi
 0006E579    call        TWinControl.HandleAllocated
 0006E57E    test        al,al
>0006E580    je          0006E58C
 0006E582    mov         eax,esi
 0006E584    mov         edx,dword ptr [eax]
 0006E586    call        dword ptr [edx+0A0]
 0006E58C    mov         eax,dword ptr [esi+200]
 0006E592    call        TObject.Free
 0006E597    mov         eax,dword ptr [esi+218]
 0006E59D    call        TObject.Free
 0006E5A2    mov         eax,dword ptr [esi+268]
 0006E5A8    call        TObject.Free
 0006E5AD    mov         eax,dword ptr [esi+208]
 0006E5B3    call        TObject.Free
 0006E5B8    mov         eax,dword ptr [esi+210]
 0006E5BE    call        TObject.Free
 0006E5C3    mov         eax,dword ptr [esi+21C]
 0006E5C9    call        TObject.Free
 0006E5CE    mov         eax,dword ptr [esi+224]
 0006E5D4    call        TObject.Free
 0006E5D9    mov         eax,dword ptr [esi+228]
 0006E5DF    call        TObject.Free
 0006E5E4    mov         eax,dword ptr [esi+22C]
 0006E5EA    call        FreeObjectInstance
 0006E5EF    mov         eax,dword ptr [esi+240]
 0006E5F5    test        eax,eax
>0006E5F7    je          0006E608
 0006E5F9    mov         edx,dword ptr [esi+23C]
 0006E5FF    push        edx
 0006E600    push        0FC
 0006E602    push        eax
 0006E603    call        user32.SetWindowLongA
 0006E608    mov         eax,dword ptr [esi+238]
 0006E60E    call        FreeObjectInstance
 0006E613    mov         eax,dword ptr [esi+258]
 0006E619    call        TObject.Free
 0006E61E    mov         eax,dword ptr [esi+25C]
 0006E624    call        TObject.Free
 0006E629    mov         eax,dword ptr [esi+260]
 0006E62F    call        TObject.Free
 0006E634    mov         eax,dword ptr [esi+1EC]
 0006E63A    call        TObject.Free
 0006E63F    mov         edx,ebx
 0006E641    and         dl,0FC
 0006E644    mov         eax,esi
 0006E646    call        TWinControl.Destroy
 0006E64B    test        bl,bl
>0006E64D    jle         0006E656
 0006E64F    mov         eax,esi
 0006E651    call        @ClassDestroy
 0006E656    pop         esi
 0006E657    pop         ebx
 0006E658    ret
*}
end;

//0006E65C
procedure TCustomListView.CreateParams(var Params:TCreateParams);
begin
{*
 0006E65C    push        ebx
 0006E65D    push        esi
 0006E65E    mov         esi,edx
 0006E660    mov         ebx,eax
 0006E662    mov         eax,1
 0006E667    call        InitCommonControl
 0006E66C    mov         edx,esi
 0006E66E    mov         eax,ebx
 0006E670    call        TWinControl.CreateParams
 0006E675    mov         ecx,6E778
 0006E67A    mov         edx,esi
 0006E67C    mov         eax,ebx
 0006E67E    call        TWinControl.CreateSubClass
 0006E683    mov         edx,dword ptr [esi+4]
 0006E686    or          edx,2000000
 0006E68C    xor         ecx,ecx
 0006E68E    mov         cl,byte ptr [ebx+1F1]
 0006E694    or          edx,dword ptr [ecx*4+0B4CB8]
 0006E69B    xor         ecx,ecx
 0006E69D    mov         cl,byte ptr [ebx+1F0]
 0006E6A3    or          edx,dword ptr [ecx*4+0B4C80]
 0006E6AA    mov         eax,dword ptr [ebx+210]
 0006E6B0    xor         ecx,ecx
 0006E6B2    mov         cl,byte ptr [eax+8]
 0006E6B5    or          edx,dword ptr [ecx*4+0B4CA0]
 0006E6BC    xor         ecx,ecx
 0006E6BE    mov         cl,byte ptr [ebx+1F2]
 0006E6C4    or          edx,dword ptr [ecx*4+0B4C88]
 0006E6CB    xor         ecx,ecx
 0006E6CD    mov         cl,byte ptr [ebx+204]
 0006E6D3    or          edx,dword ptr [ecx*4+0B4C90]
 0006E6DA    xor         ecx,ecx
 0006E6DC    mov         cl,byte ptr [ebx+214]
 0006E6E2    or          edx,dword ptr [ecx*4+0B4C98]
 0006E6E9    xor         ecx,ecx
 0006E6EB    mov         cl,byte ptr [eax+9]
 0006E6EE    or          edx,dword ptr [ecx*4+0B4CA8]
 0006E6F5    movzx       eax,byte ptr [eax+0A]
 0006E6F9    or          edx,dword ptr [eax*4+0B4CB0];WrapText:AnsiString
 0006E700    xor         eax,eax
 0006E702    mov         al,byte ptr [ebx+207]
 0006E708    or          edx,dword ptr [eax*4+0B4CC8]
 0006E70F    xor         eax,eax
 0006E711    mov         al,byte ptr [ebx+206]
 0006E717    or          edx,dword ptr [eax*4+0B4CD0]
 0006E71E    or          edx,40
 0006E721    mov         dword ptr [esi+4],edx
 0006E724    cmp         byte ptr [ebx+220],0
>0006E72B    je          0006E734
 0006E72D    or          dword ptr [esi+4],1000
 0006E734    cmp         byte ptr [ebx+221],0
>0006E73B    je          0006E744
 0006E73D    or          dword ptr [esi+4],400
 0006E744    cmp         byte ptr [ebx+12C],0
>0006E74B    je          0006E76E
 0006E74D    mov         eax,[000B58C0];NewStyleControls:Boolean
 0006E752    cmp         byte ptr [eax],0
>0006E755    je          0006E76E
 0006E757    cmp         byte ptr [ebx+1F0],1
>0006E75E    jne         0006E76E
 0006E760    and         dword ptr [esi+4],0FF7FFFFF
 0006E767    or          dword ptr [esi+8],200
 0006E76E    and         dword ptr [esi+24],0FFFFFFFC
 0006E772    pop         esi
 0006E773    pop         ebx
 0006E774    ret
*}
end;

//0006E788
procedure ReadCols;
begin
{*
 0006E788    push        ebp
 0006E789    mov         ebp,esp
 0006E78B    push        ecx
 0006E78C    mov         eax,dword ptr [ebp+8]
 0006E78F    mov         eax,dword ptr [eax-4]
 0006E792    cmp         dword ptr [eax+224],0
>0006E799    je          0006E838
 0006E79F    mov         eax,dword ptr [ebp+8]
 0006E7A2    mov         eax,dword ptr [eax-4]
 0006E7A5    mov         eax,dword ptr [eax+218]
 0006E7AB    call        TCollection.Clear
 0006E7B0    push        400
 0006E7B5    mov         eax,dword ptr [ebp+8]
 0006E7B8    mov         eax,dword ptr [eax-4]
 0006E7BB    mov         ecx,dword ptr [eax+224]
 0006E7C1    mov         dl,1
 0006E7C3    mov         eax,[0001F8C0];TReader
 0006E7C8    call        TFiler.Create
 0006E7CD    mov         dword ptr [ebp-4],eax
 0006E7D0    xor         eax,eax
 0006E7D2    push        ebp
 0006E7D3    push        6E810
 0006E7D8    push        dword ptr fs:[eax]
 0006E7DB    mov         dword ptr fs:[eax],esp
 0006E7DE    mov         eax,dword ptr [ebp-4]
 0006E7E1    call        TReader.ReadValue
 0006E7E6    mov         eax,dword ptr [ebp+8]
 0006E7E9    mov         eax,dword ptr [eax-4]
 0006E7EC    mov         edx,dword ptr [eax+218]
 0006E7F2    mov         eax,dword ptr [ebp-4]
 0006E7F5    call        TReader.ReadCollection
 0006E7FA    xor         eax,eax
 0006E7FC    pop         edx
 0006E7FD    pop         ecx
 0006E7FE    pop         ecx
 0006E7FF    mov         dword ptr fs:[eax],edx
 0006E802    push        6E817
 0006E807    mov         eax,dword ptr [ebp-4]
 0006E80A    call        TObject.Free
 0006E80F    ret
>0006E810    jmp         @HandleFinally
>0006E815    jmp         0006E807
 0006E817    mov         eax,dword ptr [ebp+8]
 0006E81A    mov         eax,dword ptr [eax-4]
 0006E81D    mov         eax,dword ptr [eax+224]
 0006E823    mov         dl,1
 0006E825    mov         ecx,dword ptr [eax]
 0006E827    call        dword ptr [ecx-4]
 0006E82A    mov         eax,dword ptr [ebp+8]
 0006E82D    mov         eax,dword ptr [eax-4]
 0006E830    xor         edx,edx
 0006E832    mov         dword ptr [eax+224],edx
 0006E838    pop         ecx
 0006E839    pop         ebp
 0006E83A    ret
*}
end;

//0006E83C
procedure UpdateCols;
begin
{*
 0006E83C    push        ebp
 0006E83D    mov         ebp,esp
 0006E83F    add         esp,0FFFFFFE0
 0006E842    push        ebx
 0006E843    push        esi
 0006E844    push        edi
 0006E845    mov         edi,dword ptr [ebp+8]
 0006E848    add         edi,0FFFFFFFC
 0006E84B    mov         eax,dword ptr [edi]
 0006E84D    mov         eax,dword ptr [eax+218]
 0006E853    call        TCollection.GetCount
 0006E858    mov         esi,eax
 0006E85A    dec         esi
 0006E85B    test        esi,esi
>0006E85D    jl          0006E8B5
 0006E85F    inc         esi
 0006E860    xor         ebx,ebx
 0006E862    mov         dword ptr [ebp-20],3
 0006E869    xor         eax,eax
 0006E86B    mov         dword ptr [ebp-1C],eax
 0006E86E    mov         eax,dword ptr [edi]
 0006E870    mov         eax,dword ptr [eax+218]
 0006E876    mov         edx,ebx
 0006E878    call        THeaderSections.GetItem
 0006E87D    mov         eax,dword ptr [eax+24]
 0006E880    mov         dword ptr [ebp-18],eax
 0006E883    mov         eax,dword ptr [edi]
 0006E885    mov         eax,dword ptr [eax+218]
 0006E88B    mov         edx,ebx
 0006E88D    call        THeaderSections.GetItem
 0006E892    call        TCollectionItem.GetIndex
 0006E897    push        eax
 0006E898    mov         eax,dword ptr [edi]
 0006E89A    call        TWinControl.GetHandle
 0006E89F    lea         ecx,[ebp-20]
 0006E8A2    pop         edx
 0006E8A3    call        ListView_InsertColumn
 0006E8A8    mov         eax,dword ptr [edi]
 0006E8AA    mov         edx,ebx
 0006E8AC    call        TCoolBar.UpdateBand
 0006E8B1    inc         ebx
 0006E8B2    dec         esi
>0006E8B3    jne         0006E862
 0006E8B5    pop         edi
 0006E8B6    pop         esi
 0006E8B7    pop         ebx
 0006E8B8    mov         esp,ebp
 0006E8BA    pop         ebp
 0006E8BB    ret
*}
end;

//0006E8BC
procedure TCustomListView.CreateWnd;
begin
{*
 0006E8BC    push        ebp
 0006E8BD    mov         ebp,esp
 0006E8BF    push        ecx
 0006E8C0    push        ebx
 0006E8C1    mov         dword ptr [ebp-4],eax
 0006E8C4    mov         eax,dword ptr [ebp-4]
 0006E8C7    call        TWinControl.CreateWnd
 0006E8CC    mov         eax,dword ptr [ebp-4]
 0006E8CF    call        TCustomListView.ResetExStyles
 0006E8D4    mov         eax,dword ptr [ebp-4]
 0006E8D7    mov         edx,dword ptr [eax+64]
 0006E8DA    mov         eax,dword ptr [ebp-4]
 0006E8DD    call        TCustomListView.SetTextBkColor
 0006E8E2    mov         eax,dword ptr [ebp-4]
 0006E8E5    mov         eax,dword ptr [eax+58]
 0006E8E8    mov         edx,dword ptr [eax+14]
 0006E8EB    mov         eax,dword ptr [ebp-4]
 0006E8EE    call        TCustomListView.SetTextColor
 0006E8F3    mov         eax,dword ptr [ebp-4]
 0006E8F6    mov         edx,dword ptr [eax+244]
 0006E8FC    mov         eax,dword ptr [ebp-4]
 0006E8FF    call        TCustomListView.SetAllocBy
 0006E904    mov         eax,dword ptr [ebp-4]
 0006E907    cmp         dword ptr [eax+21C],0
>0006E90E    je          0006E9CA
 0006E914    mov         eax,dword ptr [ebp-4]
 0006E917    mov         eax,dword ptr [eax+208]
 0006E91D    call        TListItems.BeginUpdate
 0006E922    mov         eax,dword ptr [ebp-4]
 0006E925    mov         byte ptr [eax+265],1
 0006E92C    xor         eax,eax
 0006E92E    push        ebp
 0006E92F    push        6E9C3
 0006E934    push        dword ptr fs:[eax]
 0006E937    mov         dword ptr fs:[eax],esp
 0006E93A    mov         eax,dword ptr [ebp-4]
 0006E93D    mov         eax,dword ptr [eax+218]
 0006E943    call        TCollection.Clear
 0006E948    mov         eax,dword ptr [ebp-4]
 0006E94B    mov         eax,dword ptr [eax+21C]
 0006E951    mov         edx,dword ptr [ebp-4]
 0006E954    call        TStream.ReadComponent
 0006E959    mov         eax,dword ptr [ebp-4]
 0006E95C    mov         eax,dword ptr [eax+21C]
 0006E962    mov         dl,1
 0006E964    mov         ecx,dword ptr [eax]
 0006E966    call        dword ptr [ecx-4]
 0006E969    mov         eax,dword ptr [ebp-4]
 0006E96C    xor         edx,edx
 0006E96E    mov         dword ptr [eax+21C],edx
 0006E974    mov         eax,dword ptr [ebp-4]
 0006E977    cmp         byte ptr [eax+250],0
>0006E97E    je          0006E988
 0006E980    mov         eax,dword ptr [ebp-4]
 0006E983    call        TCustomListView.RestoreChecks
 0006E988    push        ebp
 0006E989    call        ReadCols
 0006E98E    pop         ecx
 0006E98F    mov         eax,dword ptr [ebp-4]
 0006E992    mov         edx,dword ptr [eax+58]
 0006E995    mov         eax,dword ptr [ebp-4]
 0006E998    call        TControl.SetFont
 0006E99D    xor         eax,eax
 0006E99F    pop         edx
 0006E9A0    pop         ecx
 0006E9A1    pop         ecx
 0006E9A2    mov         dword ptr fs:[eax],edx
 0006E9A5    push        6E9D1
 0006E9AA    mov         eax,dword ptr [ebp-4]
 0006E9AD    mov         eax,dword ptr [eax+208]
 0006E9B3    call        TListItems.EndUpdate
 0006E9B8    mov         eax,dword ptr [ebp-4]
 0006E9BB    mov         byte ptr [eax+265],0
 0006E9C2    ret
>0006E9C3    jmp         @HandleFinally
>0006E9C8    jmp         0006E9AA
 0006E9CA    push        ebp
 0006E9CB    call        UpdateCols
 0006E9D0    pop         ecx
 0006E9D1    mov         eax,dword ptr [ebp-4]
 0006E9D4    mov         ebx,dword ptr [eax+1F4]
 0006E9DA    test        ebx,ebx
>0006E9DC    je          0006EA03
 0006E9DE    mov         eax,ebx
 0006E9E0    call        TCustomImageList.HandleAllocated
 0006E9E5    test        al,al
>0006E9E7    je          0006EA03
 0006E9E9    mov         eax,dword ptr [ebp-4]
 0006E9EC    mov         eax,dword ptr [eax+1F4]
 0006E9F2    call        TCustomImageList.GetHandle
 0006E9F7    mov         edx,eax
 0006E9F9    xor         ecx,ecx
 0006E9FB    mov         eax,dword ptr [ebp-4]
 0006E9FE    call        TCustomListView.SetImageList
 0006EA03    mov         eax,dword ptr [ebp-4]
 0006EA06    mov         ebx,dword ptr [eax+1F8]
 0006EA0C    test        ebx,ebx
>0006EA0E    je          0006EA38
 0006EA10    mov         eax,ebx
 0006EA12    call        TCustomImageList.HandleAllocated
 0006EA17    test        al,al
>0006EA19    je          0006EA38
 0006EA1B    mov         eax,dword ptr [ebp-4]
 0006EA1E    mov         eax,dword ptr [eax+1F8]
 0006EA24    call        TCustomImageList.GetHandle
 0006EA29    mov         edx,eax
 0006EA2B    mov         ecx,1
 0006EA30    mov         eax,dword ptr [ebp-4]
 0006EA33    call        TCustomListView.SetImageList
 0006EA38    mov         eax,dword ptr [ebp-4]
 0006EA3B    mov         ebx,dword ptr [eax+1FC]
 0006EA41    test        ebx,ebx
>0006EA43    je          0006EA6D
 0006EA45    mov         eax,ebx
 0006EA47    call        TCustomImageList.HandleAllocated
 0006EA4C    test        al,al
>0006EA4E    je          0006EA6D
 0006EA50    mov         eax,dword ptr [ebp-4]
 0006EA53    mov         eax,dword ptr [eax+1FC]
 0006EA59    call        TCustomImageList.GetHandle
 0006EA5E    mov         edx,eax
 0006EA60    mov         ecx,2
 0006EA65    mov         eax,dword ptr [ebp-4]
 0006EA68    call        TCustomListView.SetImageList
 0006EA6D    mov         eax,dword ptr [ebp-4]
 0006EA70    call        TCustomListView.DoAutoSize
 0006EA75    pop         ebx
 0006EA76    pop         ecx
 0006EA77    pop         ebp
 0006EA78    ret
*}
end;

//0006EA7C
procedure TCustomListView.DestroyWnd;
begin
{*
 0006EA7C    push        ebx
 0006EA7D    mov         ebx,eax
 0006EA7F    mov         eax,dword ptr [ebx+21C]
 0006EA85    test        eax,eax
>0006EA87    jne         0006EA9D
 0006EA89    mov         dl,1
 0006EA8B    mov         eax,[0001F5E8];TMemoryStream
 0006EA90    call        TObject.Create
 0006EA95    mov         dword ptr [ebx+21C],eax
>0006EA9B    jmp         0006EAA3
 0006EA9D    xor         edx,edx
 0006EA9F    mov         ecx,dword ptr [eax]
 0006EAA1    call        dword ptr [ecx]
 0006EAA3    mov         edx,ebx
 0006EAA5    mov         eax,dword ptr [ebx+21C]
 0006EAAB    call        TStream.WriteComponent
 0006EAB0    xor         edx,edx
 0006EAB2    mov         eax,dword ptr [ebx+21C]
 0006EAB8    call        TStream.SetPosition
 0006EABD    cmp         byte ptr [ebx+250],0
>0006EAC4    je          0006EACD
 0006EAC6    mov         eax,ebx
 0006EAC8    call        TCustomListView.SaveChecks
 0006EACD    mov         eax,ebx
 0006EACF    call        TWinControl.DestroyWnd
 0006EAD4    pop         ebx
 0006EAD5    ret
*}
end;

//0006EAD8
procedure TCustomListView.SetImageList(Value:HIMAGELIST; Flags:Integer);
begin
{*
 0006EAD8    push        ebx
 0006EAD9    push        esi
 0006EADA    push        edi
 0006EADB    mov         edi,ecx
 0006EADD    mov         esi,edx
 0006EADF    mov         ebx,eax
 0006EAE1    mov         eax,ebx
 0006EAE3    call        TWinControl.HandleAllocated
 0006EAE8    test        al,al
>0006EAEA    je          0006EAFC
 0006EAEC    mov         eax,ebx
 0006EAEE    call        TWinControl.GetHandle
 0006EAF3    mov         ecx,edi
 0006EAF5    mov         edx,esi
 0006EAF7    call        ListView_SetImageList
 0006EAFC    pop         edi
 0006EAFD    pop         esi
 0006EAFE    pop         ebx
 0006EAFF    ret
*}
end;

//0006EB00
procedure TCustomListView.ImageListChange(Sender:TObject);
begin
{*
 0006EB00    push        ebx
 0006EB01    push        esi
 0006EB02    push        edi
 0006EB03    mov         esi,edx
 0006EB05    mov         ebx,eax
 0006EB07    mov         eax,ebx
 0006EB09    call        TWinControl.HandleAllocated
 0006EB0E    test        al,al
>0006EB10    je          0006EB6D
 0006EB12    mov         edi,esi
 0006EB14    mov         eax,edi
 0006EB16    call        TCustomImageList.HandleAllocated
 0006EB1B    test        al,al
>0006EB1D    je          0006EB28
 0006EB1F    mov         eax,edi
 0006EB21    call        TCustomImageList.GetHandle
>0006EB26    jmp         0006EB2A
 0006EB28    xor         eax,eax
 0006EB2A    cmp         esi,dword ptr [ebx+1F4]
>0006EB30    jne         0006EB3F
 0006EB32    xor         ecx,ecx
 0006EB34    mov         edx,eax
 0006EB36    mov         eax,ebx
 0006EB38    call        TCustomListView.SetImageList
>0006EB3D    jmp         0006EB6D
 0006EB3F    cmp         esi,dword ptr [ebx+1F8]
>0006EB45    jne         0006EB57
 0006EB47    mov         ecx,1
 0006EB4C    mov         edx,eax
 0006EB4E    mov         eax,ebx
 0006EB50    call        TCustomListView.SetImageList
>0006EB55    jmp         0006EB6D
 0006EB57    cmp         esi,dword ptr [ebx+1FC]
>0006EB5D    jne         0006EB6D
 0006EB5F    mov         ecx,2
 0006EB64    mov         edx,eax
 0006EB66    mov         eax,ebx
 0006EB68    call        TCustomListView.SetImageList
 0006EB6D    pop         edi
 0006EB6E    pop         esi
 0006EB6F    pop         ebx
 0006EB70    ret
*}
end;

//0006EB74
procedure TCustomListView.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0006EB74    push        ebx
 0006EB75    push        esi
 0006EB76    push        edi
 0006EB77    mov         ebx,ecx
 0006EB79    mov         esi,edx
 0006EB7B    mov         edi,eax
 0006EB7D    mov         ecx,ebx
 0006EB7F    mov         edx,esi
 0006EB81    mov         eax,edi
 0006EB83    call        TControl.Notification
 0006EB88    cmp         bl,1
>0006EB8B    jne         0006EBC0
 0006EB8D    cmp         esi,dword ptr [edi+1F4]
>0006EB93    jne         0006EB9E
 0006EB95    xor         edx,edx
 0006EB97    mov         eax,edi
 0006EB99    call        TCustomListView.SetLargeImages
 0006EB9E    cmp         esi,dword ptr [edi+1F8]
>0006EBA4    jne         0006EBAF
 0006EBA6    xor         edx,edx
 0006EBA8    mov         eax,edi
 0006EBAA    call        TCustomListView.SetSmallImages
 0006EBAF    cmp         esi,dword ptr [edi+1FC]
>0006EBB5    jne         0006EBC0
 0006EBB7    xor         edx,edx
 0006EBB9    mov         eax,edi
 0006EBBB    call        TCustomListView.SetStateImages
 0006EBC0    pop         edi
 0006EBC1    pop         esi
 0006EBC2    pop         ebx
 0006EBC3    ret
*}
end;

//0006EBDC
{*procedure sub_0006EBDC(?:?);
begin
 0006EBDC    push        ebp
 0006EBDD    mov         ebp,esp
 0006EBDF    push        0
 0006EBE1    push        ebx
 0006EBE2    push        esi
 0006EBE3    xor         eax,eax
 0006EBE5    push        ebp
 0006EBE6    push        6ECE4
 0006EBEB    push        dword ptr fs:[eax]
 0006EBEE    mov         dword ptr fs:[eax],esp
 0006EBF1    mov         eax,dword ptr [ebp+8]
 0006EBF4    mov         eax,dword ptr [eax-4]
 0006EBF7    mov         eax,dword ptr [eax+218]
 0006EBFD    call        TCollection.GetCount
 0006EC02    push        eax
 0006EC03    lea         eax,[ebp-4]
 0006EC06    mov         ecx,1
 0006EC0B    mov         edx,dword ptr ds:[6EBC4];_DynArr_34_75
 0006EC11    call        @DynArraySetLength
 0006EC16    add         esp,4
 0006EC19    mov         eax,dword ptr [ebp+8]
 0006EC1C    mov         eax,dword ptr [eax-4]
 0006EC1F    mov         eax,dword ptr [eax+218]
 0006EC25    call        TCollection.GetCount
 0006EC2A    push        eax
 0006EC2B    mov         eax,dword ptr [ebp+8]
 0006EC2E    mov         eax,dword ptr [eax-4]
 0006EC31    call        TWinControl.GetHandle
 0006EC36    mov         ecx,dword ptr [ebp-4]
 0006EC39    pop         edx
 0006EC3A    call        ListView_GetColumnOrderArray
 0006EC3F    mov         eax,dword ptr [ebp+8]
 0006EC42    mov         eax,dword ptr [eax-4]
 0006EC45    mov         eax,dword ptr [eax+218]
 0006EC4B    mov         edx,dword ptr [eax]
 0006EC4D    call        dword ptr [edx+14]
 0006EC50    xor         eax,eax
 0006EC52    push        ebp
 0006EC53    push        6ECC1
 0006EC58    push        dword ptr fs:[eax]
 0006EC5B    mov         dword ptr fs:[eax],esp
 0006EC5E    mov         eax,dword ptr [ebp+8]
 0006EC61    mov         eax,dword ptr [eax-4]
 0006EC64    mov         eax,dword ptr [eax+218]
 0006EC6A    call        TCollection.GetCount
 0006EC6F    mov         esi,eax
 0006EC71    dec         esi
 0006EC72    test        esi,esi
>0006EC74    jl          0006EC9B
 0006EC76    inc         esi
 0006EC77    xor         ebx,ebx
 0006EC79    mov         eax,dword ptr [ebp-4]
 0006EC7C    mov         edx,dword ptr [eax+ebx*4]
 0006EC7F    mov         eax,dword ptr [ebp+8]
 0006EC82    mov         eax,dword ptr [eax-4]
 0006EC85    mov         eax,dword ptr [eax+218]
 0006EC8B    call        TCollection.FindItemID
 0006EC90    mov         edx,ebx
 0006EC92    mov         ecx,dword ptr [eax]
 0006EC94    call        dword ptr [ecx+10];TCollectionItem.SetIndex
 0006EC97    inc         ebx
 0006EC98    dec         esi
>0006EC99    jne         0006EC79
 0006EC9B    xor         eax,eax
 0006EC9D    pop         edx
 0006EC9E    pop         ecx
 0006EC9F    pop         ecx
 0006ECA0    mov         dword ptr fs:[eax],edx
 0006ECA3    push        6ECC8
 0006ECA8    mov         eax,dword ptr [ebp+8]
 0006ECAB    mov         eax,dword ptr [eax-4]
 0006ECAE    mov         eax,dword ptr [eax+218]
 0006ECB4    mov         edx,dword ptr [eax]
 0006ECB6    call        dword ptr [edx+18]
 0006ECB9    mov         byte ptr ds:[0B6850],0;gvar_000B6850
 0006ECC0    ret
>0006ECC1    jmp         @HandleFinally
>0006ECC6    jmp         0006ECA8
 0006ECC8    xor         eax,eax
 0006ECCA    pop         edx
 0006ECCB    pop         ecx
 0006ECCC    pop         ecx
 0006ECCD    mov         dword ptr fs:[eax],edx
 0006ECD0    push        6ECEB
 0006ECD5    lea         eax,[ebp-4]
 0006ECD8    mov         edx,dword ptr ds:[6EBC4];_DynArr_34_75
 0006ECDE    call        @DynArrayClear
 0006ECE3    ret
>0006ECE4    jmp         @HandleFinally
>0006ECE9    jmp         0006ECD5
 0006ECEB    pop         esi
 0006ECEC    pop         ebx
 0006ECED    pop         ecx
 0006ECEE    pop         ebp
 0006ECEF    ret
end;*}

//0006ECF0
procedure TCustomListView.HeaderWndProc(var Message:TMessage);
begin
{*
 0006ECF0    push        ebp
 0006ECF1    mov         ebp,esp
 0006ECF3    push        ecx
 0006ECF4    push        ebx
 0006ECF5    push        esi
 0006ECF6    push        edi
 0006ECF7    mov         ebx,edx
 0006ECF9    mov         dword ptr [ebp-4],eax
 0006ECFC    xor         eax,eax
 0006ECFE    push        ebp
 0006ECFF    push        6EDC6
 0006ED04    push        dword ptr fs:[eax]
 0006ED07    mov         dword ptr fs:[eax],esp
 0006ED0A    mov         esi,dword ptr [ebx]
 0006ED0C    mov         eax,esi
 0006ED0E    sub         eax,82
>0006ED13    je          0006ED50
 0006ED15    sub         eax,2
>0006ED18    je          0006ED33
 0006ED1A    sub         eax,191
>0006ED1F    jne         0006ED95
 0006ED21    cmp         byte ptr ds:[0B6850],0;gvar_000B6850
>0006ED28    je          0006ED95
 0006ED2A    push        ebp
 0006ED2B    call        0006EBDC
 0006ED30    pop         ecx
>0006ED31    jmp         0006ED95
 0006ED33    mov         eax,dword ptr [ebp-4]
 0006ED36    test        byte ptr [eax+20],10
>0006ED3A    je          0006ED95
 0006ED3C    mov         dword ptr [ebx+0C],0FFFFFFFF
 0006ED43    xor         eax,eax
 0006ED45    pop         edx
 0006ED46    pop         ecx
 0006ED47    pop         ecx
 0006ED48    mov         dword ptr fs:[eax],edx
>0006ED4B    jmp         0006EDDF
 0006ED50    mov         eax,dword ptr [ebx+8]
 0006ED53    push        eax
 0006ED54    mov         eax,dword ptr [ebx+4]
 0006ED57    push        eax
 0006ED58    push        esi
 0006ED59    mov         eax,dword ptr [ebp-4]
 0006ED5C    mov         eax,dword ptr [eax+240]
 0006ED62    push        eax
 0006ED63    mov         eax,dword ptr [ebp-4]
 0006ED66    mov         eax,dword ptr [eax+23C]
 0006ED6C    push        eax
 0006ED6D    call        user32.CallWindowProcA
 0006ED72    mov         dword ptr [ebx+0C],eax
 0006ED75    mov         eax,dword ptr [ebp-4]
 0006ED78    xor         edx,edx
 0006ED7A    mov         dword ptr [eax+240],edx
 0006ED80    mov         eax,dword ptr [ebp-4]
 0006ED83    xor         edx,edx
 0006ED85    mov         dword ptr [eax+23C],edx
 0006ED8B    xor         eax,eax
 0006ED8D    pop         edx
 0006ED8E    pop         ecx
 0006ED8F    pop         ecx
 0006ED90    mov         dword ptr fs:[eax],edx
>0006ED93    jmp         0006EDDF
 0006ED95    mov         eax,dword ptr [ebx+8]
 0006ED98    push        eax
 0006ED99    mov         eax,dword ptr [ebx+4]
 0006ED9C    push        eax
 0006ED9D    mov         eax,dword ptr [ebx]
 0006ED9F    push        eax
 0006EDA0    mov         eax,dword ptr [ebp-4]
 0006EDA3    mov         eax,dword ptr [eax+240]
 0006EDA9    push        eax
 0006EDAA    mov         eax,dword ptr [ebp-4]
 0006EDAD    mov         eax,dword ptr [eax+23C]
 0006EDB3    push        eax
 0006EDB4    call        user32.CallWindowProcA
 0006EDB9    mov         dword ptr [ebx+0C],eax
 0006EDBC    xor         eax,eax
 0006EDBE    pop         edx
 0006EDBF    pop         ecx
 0006EDC0    pop         ecx
 0006EDC1    mov         dword ptr fs:[eax],edx
>0006EDC4    jmp         0006EDDF
>0006EDC6    jmp         @HandleAnyException
 0006EDCB    mov         eax,[000B59E8];^Application:TApplication
 0006EDD0    mov         eax,dword ptr [eax]
 0006EDD2    mov         edx,dword ptr [ebp-4]
 0006EDD5    call        TApplication.HandleException
 0006EDDA    call        @DoneExcept
 0006EDDF    pop         edi
 0006EDE0    pop         esi
 0006EDE1    pop         ebx
 0006EDE2    pop         ecx
 0006EDE3    pop         ebp
 0006EDE4    ret
*}
end;

//0006EDE8
procedure TCustomListView.EditWndProc(var Message:TMessage);
begin
{*
 0006EDE8    push        ebp
 0006EDE9    mov         ebp,esp
 0006EDEB    push        ecx
 0006EDEC    push        ebx
 0006EDED    push        esi
 0006EDEE    push        edi
 0006EDEF    mov         ebx,edx
 0006EDF1    mov         dword ptr [ebp-4],eax
 0006EDF4    xor         eax,eax
 0006EDF6    push        ebp
 0006EDF7    push        6EEC9
 0006EDFC    push        dword ptr fs:[eax]
 0006EDFF    mov         dword ptr fs:[eax],esp
 0006EE02    mov         eax,dword ptr [ebx]
 0006EE04    cmp         eax,105
>0006EE09    jg          0006EE21
>0006EE0B    je          0006EE6C
 0006EE0D    sub         eax,100
>0006EE12    je          0006EE39
 0006EE14    dec         eax
>0006EE15    je          0006EE6C
 0006EE17    dec         eax
>0006EE18    je          0006EE54
 0006EE1A    sub         eax,2
>0006EE1D    je          0006EE39
>0006EE1F    jmp         0006EE98
 0006EE21    sub         eax,0BD00
>0006EE26    je          0006EE84
 0006EE28    sub         eax,2
>0006EE2B    je          0006EE84
 0006EE2D    sub         eax,2
>0006EE30    je          0006EE84
 0006EE32    sub         eax,2
>0006EE35    je          0006EE84
>0006EE37    jmp         0006EE98
 0006EE39    mov         edx,ebx
 0006EE3B    mov         eax,dword ptr [ebp-4]
 0006EE3E    call        TWinControl.DoKeyDown
 0006EE43    test        al,al
>0006EE45    je          0006EE98
 0006EE47    xor         eax,eax
 0006EE49    pop         edx
 0006EE4A    pop         ecx
 0006EE4B    pop         ecx
 0006EE4C    mov         dword ptr fs:[eax],edx
>0006EE4F    jmp         0006EEE2
 0006EE54    mov         edx,ebx
 0006EE56    mov         eax,dword ptr [ebp-4]
 0006EE59    call        TWinControl.DoKeyPress
 0006EE5E    test        al,al
>0006EE60    je          0006EE98
 0006EE62    xor         eax,eax
 0006EE64    pop         edx
 0006EE65    pop         ecx
 0006EE66    pop         ecx
 0006EE67    mov         dword ptr fs:[eax],edx
>0006EE6A    jmp         0006EEE2
 0006EE6C    mov         edx,ebx
 0006EE6E    mov         eax,dword ptr [ebp-4]
 0006EE71    call        TWinControl.DoKeyUp
 0006EE76    test        al,al
>0006EE78    je          0006EE98
 0006EE7A    xor         eax,eax
 0006EE7C    pop         edx
 0006EE7D    pop         ecx
 0006EE7E    pop         ecx
 0006EE7F    mov         dword ptr fs:[eax],edx
>0006EE82    jmp         0006EEE2
 0006EE84    mov         edx,ebx
 0006EE86    mov         eax,dword ptr [ebp-4]
 0006EE89    mov         ecx,dword ptr [eax]
 0006EE8B    call        dword ptr [ecx+70]
 0006EE8E    xor         eax,eax
 0006EE90    pop         edx
 0006EE91    pop         ecx
 0006EE92    pop         ecx
 0006EE93    mov         dword ptr fs:[eax],edx
>0006EE96    jmp         0006EEE2
 0006EE98    mov         eax,dword ptr [ebx+8]
 0006EE9B    push        eax
 0006EE9C    mov         eax,dword ptr [ebx+4]
 0006EE9F    push        eax
 0006EEA0    mov         eax,dword ptr [ebx]
 0006EEA2    push        eax
 0006EEA3    mov         eax,dword ptr [ebp-4]
 0006EEA6    mov         eax,dword ptr [eax+234]
 0006EEAC    push        eax
 0006EEAD    mov         eax,dword ptr [ebp-4]
 0006EEB0    mov         eax,dword ptr [eax+230]
 0006EEB6    push        eax
 0006EEB7    call        user32.CallWindowProcA
 0006EEBC    mov         dword ptr [ebx+0C],eax
 0006EEBF    xor         eax,eax
 0006EEC1    pop         edx
 0006EEC2    pop         ecx
 0006EEC3    pop         ecx
 0006EEC4    mov         dword ptr fs:[eax],edx
>0006EEC7    jmp         0006EEE2
>0006EEC9    jmp         @HandleAnyException
 0006EECE    mov         eax,[000B59E8];^Application:TApplication
 0006EED3    mov         eax,dword ptr [eax]
 0006EED5    mov         edx,dword ptr [ebp-4]
 0006EED8    call        TApplication.HandleException
 0006EEDD    call        @DoneExcept
 0006EEE2    pop         edi
 0006EEE3    pop         esi
 0006EEE4    pop         ebx
 0006EEE5    pop         ecx
 0006EEE6    pop         ebp
 0006EEE7    ret
*}
end;

//0006EEE8
procedure TCustomListView.UpdateItems(FirstIndex:Integer; LastIndex:Integer);
begin
{*
 0006EEE8    push        ebx
 0006EEE9    push        esi
 0006EEEA    push        edi
 0006EEEB    mov         edi,ecx
 0006EEED    mov         esi,edx
 0006EEEF    mov         ebx,eax
 0006EEF1    mov         eax,ebx
 0006EEF3    call        TWinControl.GetHandle
 0006EEF8    mov         ecx,edi
 0006EEFA    mov         edx,esi
 0006EEFC    call        ListView_RedrawItems
 0006EF01    pop         edi
 0006EF02    pop         esi
 0006EF03    pop         ebx
 0006EF04    ret
*}
end;

//0006EF08
procedure TCustomListView.ResetExStyles;
begin
{*
 0006EF08    push        ebx
 0006EF09    push        esi
 0006EF0A    push        edi
 0006EF0B    mov         ebx,eax
 0006EF0D    mov         eax,ebx
 0006EF0F    call        TWinControl.HandleAllocated
 0006EF14    test        al,al
>0006EF16    je          0006EFE4
 0006EF1C    xor         edi,edi
 0006EF1E    mov         eax,dword ptr [ebx+1FC]
 0006EF24    test        eax,eax
>0006EF26    je          0006EF33
 0006EF28    mov         edi,eax
 0006EF2A    xor         edx,edx
 0006EF2C    mov         eax,ebx
 0006EF2E    call        TCustomListView.SetStateImages
 0006EF33    xor         esi,esi
 0006EF35    cmp         byte ptr [ebx+250],0
>0006EF3C    je          0006EF43
 0006EF3E    mov         esi,4
 0006EF43    cmp         byte ptr [ebx+253],0
>0006EF4A    je          0006EF4F
 0006EF4C    or          esi,1
 0006EF4F    cmp         byte ptr [ebx+254],0
>0006EF56    je          0006EF5B
 0006EF58    or          esi,8
 0006EF5B    cmp         byte ptr [ebx+256],0
>0006EF62    je          0006EF67
 0006EF64    or          esi,20
 0006EF67    cmp         byte ptr [ebx+251],0
>0006EF6E    je          0006EF76
 0006EF70    or          esi,100
 0006EF76    cmp         byte ptr [ebx+252],0
>0006EF7D    je          0006EF82
 0006EF7F    or          esi,10
 0006EF82    test        byte ptr [ebx+255],1
>0006EF89    je          0006EF90
 0006EF8B    or          esi,40
>0006EF8E    jmp         0006EFAB
 0006EF90    mov         al,[0006EFE8]
 0006EF95    and         al,byte ptr [ebx+255]
 0006EF9B    mov         dl,byte ptr ds:[6EFEC]
 0006EFA1    cmp         dl,al
>0006EFA3    je          0006EFAB
 0006EFA5    or          esi,80
 0006EFAB    test        byte ptr [ebx+255],4
>0006EFB2    je          0006EFBA
 0006EFB4    or          esi,800
 0006EFBA    test        byte ptr [ebx+255],2
>0006EFC1    je          0006EFC9
 0006EFC3    or          esi,1000
 0006EFC9    mov         eax,ebx
 0006EFCB    call        TWinControl.GetHandle
 0006EFD0    mov         edx,esi
 0006EFD2    call        ListView_SetExtendedListViewStyle
 0006EFD7    test        edi,edi
>0006EFD9    je          0006EFE4
 0006EFDB    mov         edx,edi
 0006EFDD    mov         eax,ebx
 0006EFDF    call        TCustomListView.SetStateImages
 0006EFE4    pop         edi
 0006EFE5    pop         esi
 0006EFE6    pop         ebx
 0006EFE7    ret
*}
end;

//0006EFF0
procedure TCustomListView.RestoreChecks;
begin
{*
 0006EFF0    push        ebx
 0006EFF1    push        esi
 0006EFF2    push        edi
 0006EFF3    push        ebp
 0006EFF4    push        ecx
 0006EFF5    mov         ebx,eax
 0006EFF7    mov         eax,dword ptr [ebx+208]
 0006EFFD    call        TListItems.GetCount
 0006F002    mov         esi,eax
 0006F004    dec         esi
 0006F005    test        esi,esi
>0006F007    jl          0006F051
 0006F009    inc         esi
 0006F00A    xor         edi,edi
 0006F00C    mov         eax,dword ptr [ebx+228]
 0006F012    test        eax,eax
>0006F014    je          0006F039
 0006F016    mov         edx,esp
 0006F018    mov         ecx,1
 0006F01D    mov         ebp,dword ptr [eax]
 0006F01F    call        dword ptr [ebp+4]
 0006F022    mov         edx,edi
 0006F024    mov         eax,dword ptr [ebx+208]
 0006F02A    call        TListItems.GetItem
 0006F02F    mov         dl,byte ptr [esp]
 0006F032    call        TListItem.SetChecked
>0006F037    jmp         0006F04D
 0006F039    mov         edx,edi
 0006F03B    mov         eax,dword ptr [ebx+208]
 0006F041    call        TListItems.GetItem
 0006F046    xor         edx,edx
 0006F048    call        TListItem.SetChecked
 0006F04D    inc         edi
 0006F04E    dec         esi
>0006F04F    jne         0006F00C
 0006F051    mov         eax,dword ptr [ebx+228]
 0006F057    call        TObject.Free
 0006F05C    xor         eax,eax
 0006F05E    mov         dword ptr [ebx+228],eax
 0006F064    pop         edx
 0006F065    pop         ebp
 0006F066    pop         edi
 0006F067    pop         esi
 0006F068    pop         ebx
 0006F069    ret
*}
end;

//0006F06C
procedure TCustomListView.SaveChecks;
begin
{*
 0006F06C    push        ebx
 0006F06D    push        esi
 0006F06E    push        edi
 0006F06F    push        ebp
 0006F070    push        ecx
 0006F071    mov         ebx,eax
 0006F073    mov         eax,dword ptr [ebx+228]
 0006F079    test        eax,eax
>0006F07B    jne         0006F091
 0006F07D    mov         dl,1
 0006F07F    mov         eax,[0001F5E8];TMemoryStream
 0006F084    call        TObject.Create
 0006F089    mov         dword ptr [ebx+228],eax
>0006F08F    jmp         0006F097
 0006F091    xor         edx,edx
 0006F093    mov         ecx,dword ptr [eax]
 0006F095    call        dword ptr [ecx]
 0006F097    mov         eax,dword ptr [ebx+208]
 0006F09D    call        TListItems.GetCount
 0006F0A2    mov         esi,eax
 0006F0A4    dec         esi
 0006F0A5    test        esi,esi
>0006F0A7    jl          0006F0D7
 0006F0A9    inc         esi
 0006F0AA    xor         edi,edi
 0006F0AC    mov         edx,edi
 0006F0AE    mov         eax,dword ptr [ebx+208]
 0006F0B4    call        TListItems.GetItem
 0006F0B9    call        TListItem.GetChecked
 0006F0BE    mov         byte ptr [esp],al
 0006F0C1    mov         edx,esp
 0006F0C3    mov         ecx,1
 0006F0C8    mov         eax,dword ptr [ebx+228]
 0006F0CE    mov         ebp,dword ptr [eax]
 0006F0D0    call        dword ptr [ebp+8]
 0006F0D3    inc         edi
 0006F0D4    dec         esi
>0006F0D5    jne         0006F0AC
 0006F0D7    xor         edx,edx
 0006F0D9    mov         eax,dword ptr [ebx+228]
 0006F0DF    call        TStream.SetPosition
 0006F0E4    pop         edx
 0006F0E5    pop         ebp
 0006F0E6    pop         edi
 0006F0E7    pop         esi
 0006F0E8    pop         ebx
 0006F0E9    ret
*}
end;

//0006F0EC
procedure TCustomListView.SetCheckboxes(Value:Boolean);
begin
{*
 0006F0EC    push        ebx
 0006F0ED    mov         ebx,eax
 0006F0EF    cmp         dl,byte ptr [ebx+250]
>0006F0F5    je          0006F114
 0006F0F7    mov         byte ptr [ebx+250],dl
 0006F0FD    mov         eax,ebx
 0006F0FF    call        TCustomListView.ResetExStyles
 0006F104    cmp         byte ptr [ebx+250],0
>0006F10B    je          0006F114
 0006F10D    mov         eax,ebx
 0006F10F    call        TCustomListView.RestoreChecks
 0006F114    pop         ebx
 0006F115    ret
*}
end;

//0006F118
procedure TCustomListView.SetGridLines(Value:Boolean);
begin
{*
 0006F118    cmp         dl,byte ptr [eax+253]
>0006F11E    je          0006F12B
 0006F120    mov         byte ptr [eax+253],dl
 0006F126    call        TCustomListView.ResetExStyles
 0006F12B    ret
*}
end;

//0006F12C
procedure TCustomListView.SetHotTrack(Value:Boolean);
begin
{*
 0006F12C    cmp         dl,byte ptr [eax+254]
>0006F132    je          0006F13F
 0006F134    mov         byte ptr [eax+254],dl
 0006F13A    call        TCustomListView.ResetExStyles
 0006F13F    ret
*}
end;

//0006F140
procedure TCustomListView.SetHotTrackStyles(Value:TListHotTrackStyles);
begin
{*
 0006F140    push        ebx
 0006F141    push        ecx
 0006F142    mov         byte ptr [esp],dl
 0006F145    mov         ebx,eax
 0006F147    mov         al,byte ptr [esp]
 0006F14A    cmp         al,byte ptr [ebx+255]
>0006F150    je          0006F162
 0006F152    mov         al,byte ptr [esp]
 0006F155    mov         byte ptr [ebx+255],al
 0006F15B    mov         eax,ebx
 0006F15D    call        TCustomListView.ResetExStyles
 0006F162    pop         edx
 0006F163    pop         ebx
 0006F164    ret
*}
end;

//0006F168
procedure TListView.SetOwnerData(Value:Boolean);
begin
{*
 0006F168    push        ebx
 0006F169    push        esi
 0006F16A    mov         ebx,edx
 0006F16C    mov         esi,eax
 0006F16E    cmp         bl,byte ptr [esi+220];TListView.FOwnerData:Boolean
>0006F174    je          0006F18E
 0006F176    mov         eax,dword ptr [esi+208];TListView.FListItems:TListItems
 0006F17C    call        TListItems.Clear
 0006F181    mov         byte ptr [esi+220],bl;TListView.FOwnerData:Boolean
 0006F187    mov         eax,esi
 0006F189    call        TWinControl.RecreateWnd
 0006F18E    pop         esi
 0006F18F    pop         ebx
 0006F190    ret
*}
end;

//0006F194
procedure TCustomListView.SetOwnerDraw(Value:Boolean);
begin
{*
 0006F194    cmp         dl,byte ptr [eax+221]
>0006F19A    je          0006F1A7
 0006F19C    mov         byte ptr [eax+221],dl
 0006F1A2    call        TWinControl.RecreateWnd
 0006F1A7    ret
*}
end;

//0006F1A8
procedure TCustomListView.SetRowSelect(Value:Boolean);
begin
{*
 0006F1A8    cmp         dl,byte ptr [eax+256]
>0006F1AE    je          0006F1BB
 0006F1B0    mov         byte ptr [eax+256],dl
 0006F1B6    call        TCustomListView.ResetExStyles
 0006F1BB    ret
*}
end;

//0006F1BC
procedure TCustomListView.SetFlatScrollBars(Value:Boolean);
begin
{*
 0006F1BC    cmp         dl,byte ptr [eax+251]
>0006F1C2    je          0006F1CF
 0006F1C4    mov         byte ptr [eax+251],dl
 0006F1CA    call        TCustomListView.ResetExStyles
 0006F1CF    ret
*}
end;

//0006F1D0
procedure TCustomListView.SetFullDrag(Value:Boolean);
begin
{*
 0006F1D0    cmp         dl,byte ptr [eax+252]
>0006F1D6    je          0006F1E3
 0006F1D8    mov         byte ptr [eax+252],dl
 0006F1DE    call        TCustomListView.ResetExStyles
 0006F1E3    ret
*}
end;

//0006F1E4
procedure TCustomTabControl.SetHotTrack(Value:Boolean);
begin
{*
 0006F1E4    cmp         dl,byte ptr [eax+1F0]
>0006F1EA    je          0006F1F7
 0006F1EC    mov         byte ptr [eax+1F0],dl
 0006F1F2    call        TWinControl.RecreateWnd
 0006F1F7    ret
*}
end;

//0006F1F8
procedure TCustomListView.SetColumnClick(Value:Boolean);
begin
{*
 0006F1F8    cmp         dl,byte ptr [eax+206]
>0006F1FE    je          0006F20B
 0006F200    mov         byte ptr [eax+206],dl
 0006F206    call        TWinControl.RecreateWnd
 0006F20B    ret
*}
end;

//0006F20C
procedure TCustomListView.SetMultiSelect(Value:Boolean);
begin
{*
 0006F20C    cmp         dl,byte ptr [eax+204]
>0006F212    je          0006F21F
 0006F214    mov         byte ptr [eax+204],dl
 0006F21A    call        TWinControl.RecreateWnd
 0006F21F    ret
*}
end;

//0006F220
procedure TCustomListView.SetColumnHeaders(Value:Boolean);
begin
{*
 0006F220    cmp         dl,byte ptr [eax+207]
>0006F226    je          0006F233
 0006F228    mov         byte ptr [eax+207],dl
 0006F22E    call        TWinControl.RecreateWnd
 0006F233    ret
*}
end;

//0006F234
procedure TCustomListView.SetTextColor(Value:TColor);
begin
{*
 0006F234    push        ebx
 0006F235    mov         ebx,eax
 0006F237    mov         eax,dword ptr [ebx+58]
 0006F23A    mov         eax,dword ptr [eax+14]
 0006F23D    call        ColorToRGB
 0006F242    push        eax
 0006F243    mov         eax,ebx
 0006F245    call        TWinControl.GetHandle
 0006F24A    pop         edx
 0006F24B    call        ListView_SetTextColor
 0006F250    pop         ebx
 0006F251    ret
*}
end;

//0006F254
procedure TCustomListView.SetTextBkColor(Value:TColor);
begin
{*
 0006F254    push        ebx
 0006F255    mov         ebx,eax
 0006F257    mov         eax,dword ptr [ebx+64]
 0006F25A    call        ColorToRGB
 0006F25F    push        eax
 0006F260    mov         eax,ebx
 0006F262    call        TWinControl.GetHandle
 0006F267    pop         edx
 0006F268    call        ListView_SetTextBkColor
 0006F26D    mov         eax,dword ptr [ebx+64]
 0006F270    call        ColorToRGB
 0006F275    push        eax
 0006F276    mov         eax,ebx
 0006F278    call        TWinControl.GetHandle
 0006F27D    pop         edx
 0006F27E    call        ListView_SetBkColor
 0006F283    pop         ebx
 0006F284    ret
*}
end;

//0006F288
procedure TCustomListView.SetAllocBy(Value:Integer);
begin
{*
 0006F288    push        ebx
 0006F289    push        esi
 0006F28A    mov         esi,edx
 0006F28C    mov         ebx,eax
 0006F28E    cmp         esi,dword ptr [ebx+244]
>0006F294    je          0006F2B5
 0006F296    mov         dword ptr [ebx+244],esi
 0006F29C    mov         eax,ebx
 0006F29E    call        TWinControl.HandleAllocated
 0006F2A3    test        al,al
>0006F2A5    je          0006F2B5
 0006F2A7    mov         eax,ebx
 0006F2A9    call        TWinControl.GetHandle
 0006F2AE    mov         edx,esi
 0006F2B0    call        ListView_SetItemCount
 0006F2B5    pop         esi
 0006F2B6    pop         ebx
 0006F2B7    ret
*}
end;

//0006F2B8
procedure TCustomListView.CMColorChanged(var Message:TMessage);
begin
{*
 0006F2B8    push        ebx
 0006F2B9    mov         ebx,eax
 0006F2BB    mov         eax,ebx
 0006F2BD    call        TWinControl.CMColorChanged
 0006F2C2    mov         eax,ebx
 0006F2C4    call        TWinControl.HandleAllocated
 0006F2C9    test        al,al
>0006F2CB    je          0006F2D7
 0006F2CD    mov         edx,dword ptr [ebx+64]
 0006F2D0    mov         eax,ebx
 0006F2D2    call        TCustomListView.SetTextBkColor
 0006F2D7    pop         ebx
 0006F2D8    ret
*}
end;

//0006F2DC
procedure TCustomListView.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0006F2DC    push        ebx
 0006F2DD    push        esi
 0006F2DE    mov         esi,edx
 0006F2E0    mov         ebx,eax
 0006F2E2    cmp         byte ptr [ebx+1F0],1
>0006F2E9    jne         0006F2F2
 0006F2EB    mov         eax,ebx
 0006F2ED    call        TWinControl.RecreateWnd
 0006F2F2    mov         edx,esi
 0006F2F4    mov         eax,ebx
 0006F2F6    call        TWinControl.CMCtl3DChanged
 0006F2FB    pop         esi
 0006F2FC    pop         ebx
 0006F2FD    ret
*}
end;

//0006F300
procedure TCustomListView.WMNotify(Message:TWMNotify);
begin
{*
 0006F300    push        ebx
 0006F301    push        esi
 0006F302    push        edi
 0006F303    mov         esi,edx
 0006F305    mov         ebx,eax
 0006F307    mov         edx,esi
 0006F309    mov         eax,ebx
 0006F30B    call        TWinControl.WMNotify
 0006F310    mov         eax,ebx
 0006F312    call        TCustomListView.ValidHeaderHandle
 0006F317    test        al,al
>0006F319    je          0006F361
 0006F31B    mov         eax,dword ptr [esi+8]
 0006F31E    mov         eax,dword ptr [eax]
 0006F320    cmp         eax,dword ptr [ebx+240];TCustomListView.FHeaderHandle:HWND
>0006F326    jne         0006F361
 0006F328    mov         edx,dword ptr [esi+8]
 0006F32B    mov         eax,edx
 0006F32D    mov         eax,dword ptr [eax+8]
 0006F330    sub         eax,0FFFFFEC9
>0006F335    je          0006F35A
 0006F337    sub         eax,4
>0006F33A    jne         0006F361
 0006F33C    mov         esi,edx
 0006F33E    mov         edi,dword ptr [esi+14]
 0006F341    test        byte ptr [edi],1
>0006F344    je          0006F361
 0006F346    mov         edx,dword ptr [esi+0C]
 0006F349    mov         eax,ebx
 0006F34B    call        TCustomListView.GetColumnFromIndex
 0006F350    mov         edx,dword ptr [edi+4]
 0006F353    call        TListColumn.SetWidth
>0006F358    jmp         0006F361
 0006F35A    mov         byte ptr ds:[0B6850],1;gvar_000B6850
 0006F361    pop         edi
 0006F362    pop         esi
 0006F363    pop         ebx
 0006F364    ret
*}
end;

//0006F368
function TCustomListView.ColumnsShowing:Boolean;
begin
{*
 0006F368    cmp         byte ptr [eax+1F1],3
 0006F36F    sete        al
 0006F372    ret
*}
end;

//0006F374
function TCustomListView.ValidHeaderHandle:Boolean;
begin
{*
 0006F374    cmp         dword ptr [eax+240],0
 0006F37B    setne       al
 0006F37E    ret
*}
end;

//0006F380
procedure TCustomListView.CMFontChanged(var Message:TMessage);
begin
{*
 0006F380    push        ebx
 0006F381    mov         ebx,eax
 0006F383    mov         eax,ebx
 0006F385    call        TWinControl.CMFontChanged
 0006F38A    mov         eax,ebx
 0006F38C    call        TWinControl.HandleAllocated
 0006F391    test        al,al
>0006F393    je          0006F3BD
 0006F395    mov         eax,dword ptr [ebx+58]
 0006F398    mov         edx,dword ptr [eax+14]
 0006F39B    mov         eax,ebx
 0006F39D    call        TCustomListView.SetTextColor
 0006F3A2    mov         eax,ebx
 0006F3A4    call        TCustomListView.ValidHeaderHandle
 0006F3A9    test        al,al
>0006F3AB    je          0006F3BD
 0006F3AD    push        0FF
 0006F3AF    push        0
 0006F3B1    mov         eax,dword ptr [ebx+240]
 0006F3B7    push        eax
 0006F3B8    call        user32.InvalidateRect
 0006F3BD    pop         ebx
 0006F3BE    ret
*}
end;

//0006F3C0
procedure TCustomListView.SetHideSelection(Value:Boolean);
begin
{*
 0006F3C0    cmp         dl,byte ptr [eax+214]
>0006F3C6    je          0006F3D3
 0006F3C8    mov         byte ptr [eax+214],dl
 0006F3CE    call        TWinControl.RecreateWnd
 0006F3D3    ret
*}
end;

//0006F3D4
procedure TCustomListView.SetReadOnly(Value:Boolean);
begin
{*
 0006F3D4    cmp         dl,byte ptr [eax+1F2]
>0006F3DA    je          0006F3E7
 0006F3DC    mov         byte ptr [eax+1F2],dl
 0006F3E2    call        TWinControl.RecreateWnd
 0006F3E7    ret
*}
end;

//0006F3E8
procedure TCustomListView.SetIconOptions(Value:TIconOptions);
begin
{*
 0006F3E8    push        ebx
 0006F3E9    push        esi
 0006F3EA    mov         esi,edx
 0006F3EC    mov         ebx,dword ptr [eax+210]
 0006F3F2    mov         dl,byte ptr [esi+8]
 0006F3F5    mov         eax,ebx
 0006F3F7    call        TIconOptions.SetArrangement
 0006F3FC    mov         dl,byte ptr [esi+9]
 0006F3FF    mov         eax,ebx
 0006F401    call        TIconOptions.SetAutoArrange
 0006F406    mov         dl,byte ptr [esi+0A]
 0006F409    mov         eax,ebx
 0006F40B    call        TIconOptions.SetWrapText
 0006F410    pop         esi
 0006F411    pop         ebx
 0006F412    ret
*}
end;

//0006F414
procedure TCustomListView.SetViewStyle(Value:TViewStyle);
begin
{*
 0006F414    push        ebx
 0006F415    push        esi
 0006F416    mov         ebx,eax
 0006F418    cmp         dl,byte ptr [ebx+1F1]
>0006F41E    je          0006F495
 0006F420    mov         byte ptr [ebx+1F1],dl
 0006F426    mov         eax,ebx
 0006F428    call        TWinControl.HandleAllocated
 0006F42D    test        al,al
>0006F42F    je          0006F495
 0006F431    push        0F0
 0006F433    mov         eax,ebx
 0006F435    call        TWinControl.GetHandle
 0006F43A    push        eax
 0006F43B    call        user32.GetWindowLongA
 0006F440    mov         esi,eax
 0006F442    and         esi,0FFFFFFFC
 0006F445    xor         eax,eax
 0006F447    mov         al,byte ptr [ebx+1F1]
 0006F44D    or          esi,dword ptr [eax*4+0B4CD8]
 0006F454    push        esi
 0006F455    push        0F0
 0006F457    mov         eax,ebx
 0006F459    call        TWinControl.GetHandle
 0006F45E    push        eax
 0006F45F    call        user32.SetWindowLongA
 0006F464    mov         eax,ebx
 0006F466    call        TCoolBar.UpdateBands
 0006F46B    mov         al,byte ptr [ebx+1F1]
 0006F471    sub         al,2
>0006F473    jae         0006F495
 0006F475    mov         eax,dword ptr [ebx+210]
 0006F47B    cmp         byte ptr [eax+8],0
>0006F47F    jne         0006F48C
 0006F481    mov         dl,3
 0006F483    mov         eax,ebx
 0006F485    call        TCustomListView.Arrange
>0006F48A    jmp         0006F495
 0006F48C    mov         dl,1
 0006F48E    mov         eax,ebx
 0006F490    call        TCustomListView.Arrange
 0006F495    pop         esi
 0006F496    pop         ebx
 0006F497    ret
*}
end;

//0006F498
procedure TCustomListView.WMParentNotify(var Message:TWMParentNotify);
begin
{*
 0006F498    push        ebx
 0006F499    push        esi
 0006F49A    push        edi
 0006F49B    mov         esi,edx
 0006F49D    mov         ebx,eax
 0006F49F    cmp         word ptr [esi+4],1
>0006F4A4    jne         0006F4DB
 0006F4A6    cmp         dword ptr [ebx+240],0
>0006F4AD    jne         0006F4DB
 0006F4AF    mov         edi,dword ptr [esi+8]
 0006F4B2    mov         dword ptr [ebx+240],edi
 0006F4B8    push        0FC
 0006F4BA    push        edi
 0006F4BB    call        user32.GetWindowLongA
 0006F4C0    mov         dword ptr [ebx+23C],eax
 0006F4C6    mov         eax,dword ptr [ebx+238]
 0006F4CC    push        eax
 0006F4CD    push        0FC
 0006F4CF    mov         eax,dword ptr [ebx+240]
 0006F4D5    push        eax
 0006F4D6    call        user32.SetWindowLongA
 0006F4DB    mov         edx,esi
 0006F4DD    mov         eax,ebx
 0006F4DF    call        TWinControl.WMParentNotify
 0006F4E4    pop         edi
 0006F4E5    pop         esi
 0006F4E6    pop         ebx
 0006F4E7    ret
*}
end;

//0006F4E8
function TCustomListView.OwnerDataFetch(Item:TListItem; Request:TItemRequest):Boolean;
begin
{*
 0006F4E8    push        ebx
 0006F4E9    cmp         word ptr [eax+29E],0
>0006F4F1    je          0006F509
 0006F4F3    mov         ebx,eax
 0006F4F5    mov         ecx,edx
 0006F4F7    mov         edx,eax
 0006F4F9    mov         eax,dword ptr [ebx+2A0]
 0006F4FF    call        dword ptr [ebx+29C]
 0006F505    mov         al,1
 0006F507    pop         ebx
 0006F508    ret
 0006F509    xor         eax,eax
 0006F50B    pop         ebx
 0006F50C    ret
*}
end;

//0006F510
function TCustomListView.OwnerDataFind(Find:TItemFind; const FindString:AnsiString; const FindPosition:TPoint; FindData:Pointer; StartIndex:Integer; Direction:TSearchDirection; Wrap:Boolean):Integer;
begin
{*
 0006F510    push        ebp
 0006F511    mov         ebp,esp
 0006F513    push        ecx
 0006F514    push        ebx
 0006F515    mov         dword ptr [ebp-4],0FFFFFFFF
 0006F51C    cmp         word ptr [eax+2A6],0
>0006F524    je          0006F551
 0006F526    push        ecx
 0006F527    mov         ecx,dword ptr [ebp+18]
 0006F52A    push        ecx
 0006F52B    mov         ecx,dword ptr [ebp+14]
 0006F52E    push        ecx
 0006F52F    mov         ecx,dword ptr [ebp+10]
 0006F532    push        ecx
 0006F533    mov         cl,byte ptr [ebp+0C]
 0006F536    push        ecx
 0006F537    mov         cl,byte ptr [ebp+8]
 0006F53A    push        ecx
 0006F53B    lea         ecx,[ebp-4]
 0006F53E    push        ecx
 0006F53F    mov         ebx,eax
 0006F541    mov         ecx,edx
 0006F543    mov         edx,eax
 0006F545    mov         eax,dword ptr [ebx+2A8]
 0006F54B    call        dword ptr [ebx+2A4]
 0006F551    mov         eax,dword ptr [ebp-4]
 0006F554    pop         ebx
 0006F555    pop         ecx
 0006F556    pop         ebp
 0006F557    ret         14
*}
end;

//0006F55C
function TCustomListView.OwnerDataHint(StartIndex:Integer; EndIndex:Integer):Boolean;
begin
{*
 0006F55C    push        ebx
 0006F55D    cmp         word ptr [eax+2AE],0
>0006F565    je          0006F57E
 0006F567    push        ecx
 0006F568    mov         ebx,eax
 0006F56A    mov         ecx,edx
 0006F56C    mov         edx,eax
 0006F56E    mov         eax,dword ptr [ebx+2B0]
 0006F574    call        dword ptr [ebx+2AC]
 0006F57A    mov         al,1
 0006F57C    pop         ebx
 0006F57D    ret
 0006F57E    xor         eax,eax
 0006F580    pop         ebx
 0006F581    ret
*}
end;

//0006F584
function TCustomListView.OwnerDataStateChange(StartIndex:Integer; EndIndex:Integer; OldState:TItemStates; NewState:TItemStates):Boolean;
begin
{*
 0006F584    push        ebp
 0006F585    mov         ebp,esp
 0006F587    push        ebx
 0006F588    cmp         word ptr [eax+2B6],0
>0006F590    je          0006F5B1
 0006F592    push        ecx
 0006F593    mov         cl,byte ptr [ebp+0C]
 0006F596    push        ecx
 0006F597    mov         cl,byte ptr [ebp+8]
 0006F59A    push        ecx
 0006F59B    mov         ebx,eax
 0006F59D    mov         ecx,edx
 0006F59F    mov         edx,eax
 0006F5A1    mov         eax,dword ptr [ebx+2B8]
 0006F5A7    call        dword ptr [ebx+2B4]
 0006F5AD    mov         al,1
>0006F5AF    jmp         0006F5B3
 0006F5B1    xor         eax,eax
 0006F5B3    pop         ebx
 0006F5B4    pop         ebp
 0006F5B5    ret         8
*}
end;

//0006F5B8
function TCustomListView.CreateListItem:TListItem;
begin
{*
 0006F5B8    mov         ecx,dword ptr [eax+208]
 0006F5BE    mov         dl,1
 0006F5C0    mov         eax,[00067FA0];TListItem
 0006F5C5    call        TListItem.Create
 0006F5CA    ret
*}
end;

//0006F5CC
function ConvertMask(Mask:Longint):TItemRequest;
begin
{*
 0006F5CC    push        ebx
 0006F5CD    push        esi
 0006F5CE    mov         esi,eax
 0006F5D0    mov         bl,byte ptr ds:[6F614]
 0006F5D6    test        esi,1
>0006F5DC    je          0006F5E1
 0006F5DE    or          bl,1
 0006F5E1    test        esi,2
>0006F5E7    je          0006F5EC
 0006F5E9    or          bl,2
 0006F5EC    test        esi,4
>0006F5F2    je          0006F5F7
 0006F5F4    or          bl,4
 0006F5F7    test        esi,8
>0006F5FD    je          0006F602
 0006F5FF    or          bl,8
 0006F602    test        esi,10
>0006F608    je          0006F60D
 0006F60A    or          bl,10
 0006F60D    mov         eax,ebx
 0006F60F    pop         esi
 0006F610    pop         ebx
 0006F611    ret
*}
end;

//0006F618
function TCustomListView.GetItem(Value:TLVItem):TListItem;
begin
{*
 0006F618    push        ebp
 0006F619    mov         ebp,esp
 0006F61B    add         esp,0FFFFFFD4
 0006F61E    push        ebx
 0006F61F    push        esi
 0006F620    push        edi
 0006F621    xor         ecx,ecx
 0006F623    mov         dword ptr [ebp-4],ecx
 0006F626    mov         esi,edx
 0006F628    lea         edi,[ebp-2C]
 0006F62B    mov         ecx,0A
 0006F630    rep movs    dword ptr [edi],dword ptr [esi]
 0006F632    mov         esi,eax
 0006F634    xor         eax,eax
 0006F636    push        ebp
 0006F637    push        6F737
 0006F63C    push        dword ptr fs:[eax]
 0006F63F    mov         dword ptr fs:[eax],esp
 0006F642    mov         edi,dword ptr [ebp-2C]
 0006F645    test        edi,4
>0006F64B    je          0006F655
 0006F64D    mov         ebx,dword ptr [ebp-0C]
>0006F650    jmp         0006F721
 0006F655    cmp         byte ptr [esi+220],0
>0006F65C    je          0006F711
 0006F662    cmp         dword ptr [ebp-28],0
>0006F666    jge         0006F66F
 0006F668    xor         ebx,ebx
>0006F66A    jmp         0006F721
 0006F66F    cmp         dword ptr [ebp-24],0
>0006F673    jne         0006F709
 0006F679    mov         eax,edi
 0006F67B    call        ConvertMask
 0006F680    mov         ebx,eax
 0006F682    mov         edi,dword ptr [esi+268]
 0006F688    mov         eax,dword ptr [ebp-28]
 0006F68B    mov         dword ptr [edi+18],eax
 0006F68E    mov         eax,dword ptr [ebp-0C]
 0006F691    mov         dword ptr [edi+0C],eax
 0006F694    mov         eax,dword ptr [edi+8]
 0006F697    mov         edx,dword ptr [eax]
 0006F699    call        dword ptr [edx+40]
 0006F69C    test        bl,1
>0006F69F    je          0006F6B4
 0006F6A1    cmp         dword ptr [ebp-18],0
>0006F6A5    je          0006F6B4
 0006F6A7    lea         edx,[ebp-4]
 0006F6AA    mov         eax,dword ptr [ebp-18]
 0006F6AD    call        StrPas
>0006F6B2    jmp         0006F6BC
 0006F6B4    lea         eax,[ebp-4]
 0006F6B7    call        @LStrClr
 0006F6BC    mov         eax,dword ptr [esi+268]
 0006F6C2    add         eax,24
 0006F6C5    mov         edx,dword ptr [ebp-4]
 0006F6C8    call        @LStrAsg
 0006F6CD    test        bl,2
>0006F6D0    je          0006F6DE
 0006F6D2    mov         eax,dword ptr [esi+268]
 0006F6D8    mov         edx,dword ptr [ebp-10]
 0006F6DB    mov         dword ptr [eax+10],edx
 0006F6DE    test        bl,10
>0006F6E1    je          0006F6EF
 0006F6E3    mov         eax,dword ptr [esi+268]
 0006F6E9    mov         edx,dword ptr [ebp-8]
 0006F6EC    mov         dword ptr [eax+14],edx
 0006F6EF    mov         ecx,ebx
 0006F6F1    mov         edx,dword ptr [esi+268]
 0006F6F7    mov         eax,esi
 0006F6F9    mov         ebx,dword ptr [eax]
 0006F6FB    call        dword ptr [ebx+0CC]
 0006F701    mov         ebx,dword ptr [esi+268]
>0006F707    jmp         0006F721
 0006F709    mov         ebx,dword ptr [esi+268]
>0006F70F    jmp         0006F721
 0006F711    mov         edx,dword ptr [ebp-28]
 0006F714    mov         eax,dword ptr [esi+208]
 0006F71A    call        TListItems.GetItem
 0006F71F    mov         ebx,eax
 0006F721    xor         eax,eax
 0006F723    pop         edx
 0006F724    pop         ecx
 0006F725    pop         ecx
 0006F726    mov         dword ptr fs:[eax],edx
 0006F729    push        6F73E
 0006F72E    lea         eax,[ebp-4]
 0006F731    call        @LStrClr
 0006F736    ret
>0006F737    jmp         @HandleFinally
>0006F73C    jmp         0006F72E
 0006F73E    mov         eax,ebx
 0006F740    pop         edi
 0006F741    pop         esi
 0006F742    pop         ebx
 0006F743    mov         esp,ebp
 0006F745    pop         ebp
 0006F746    ret
*}
end;

//0006F748
function TCustomListView.GetSelCount:Integer;
begin
{*
 0006F748    push        ebx
 0006F749    mov         ebx,eax
 0006F74B    mov         eax,ebx
 0006F74D    call        TWinControl.GetHandle
 0006F752    call        ListView_GetSelectedCount
 0006F757    pop         ebx
 0006F758    ret
*}
end;

//0006F75C
function ConvertFlags(Flags:Integer):TItemFind;
begin
{*
 0006F75C    test        al,1
>0006F75E    je          0006F763
 0006F760    xor         eax,eax
 0006F762    ret
 0006F763    test        al,8
>0006F765    je          0006F76B
 0006F767    mov         al,1
>0006F769    jmp         0006F77D
 0006F76B    test        al,2
>0006F76D    je          0006F773
 0006F76F    mov         al,2
>0006F771    jmp         0006F77D
 0006F773    test        al,40
>0006F775    je          0006F77B
 0006F777    mov         al,3
>0006F779    jmp         0006F77D
 0006F77B    xor         eax,eax
 0006F77D    ret
*}
end;

//0006F780
function ConvertStates(State:Integer):TItemStates;
begin
{*
 0006F780    push        ebx
 0006F781    push        esi
 0006F782    mov         esi,eax
 0006F784    mov         bl,byte ptr ds:[6F7C8]
 0006F78A    test        esi,20
>0006F790    je          0006F795
 0006F792    or          bl,20
 0006F795    test        esi,4
>0006F79B    je          0006F7A0
 0006F79D    or          bl,2
 0006F7A0    test        esi,8
>0006F7A6    je          0006F7AB
 0006F7A8    or          bl,4
 0006F7AB    test        esi,1
>0006F7B1    je          0006F7B6
 0006F7B3    or          bl,8
 0006F7B6    test        esi,2
>0006F7BC    je          0006F7C1
 0006F7BE    or          bl,10
 0006F7C1    mov         eax,ebx
 0006F7C3    pop         esi
 0006F7C4    pop         ebx
 0006F7C5    ret
*}
end;

//0006F7CC
{*procedure TCustomListView.sub_0006F7CC(?:?);
begin
 0006F7CC    push        ebp
 0006F7CD    mov         ebp,esp
 0006F7CF    add         esp,0FFFFFF9C
 0006F7D2    push        ebx
 0006F7D3    push        esi
 0006F7D4    push        edi
 0006F7D5    xor         ecx,ecx
 0006F7D7    mov         dword ptr [ebp-64],ecx
 0006F7DA    mov         dword ptr [ebp-8],ecx
 0006F7DD    mov         edi,edx
 0006F7DF    mov         esi,eax
 0006F7E1    xor         eax,eax
 0006F7E3    push        ebp
 0006F7E4    push        6FEFD
 0006F7E9    push        dword ptr fs:[eax]
 0006F7EC    mov         dword ptr fs:[eax],esp
 0006F7EF    mov         ebx,dword ptr [edi+8]
 0006F7F2    mov         eax,dword ptr [ebx+8]
 0006F7F5    cmp         eax,0FFFFFF98
>0006F7F8    jg          0006F854
>0006F7FA    je          0006FB4E
 0006F800    cmp         eax,0FFFFFF93
>0006F803    jg          0006F836
>0006F805    je          0006FB27
 0006F80B    sub         eax,0FFFFFF68
>0006F810    je          0006FC3F
 0006F816    sub         eax,2
>0006F819    je          0006FB8A
 0006F81F    sub         eax,23
>0006F822    je          0006FD20
 0006F828    sub         eax,2
>0006F82B    je          0006FC28
>0006F831    jmp         0006FEDF
 0006F836    sub         eax,0FFFFFF94
>0006F839    je          0006FDE2
 0006F83F    sub         eax,2
>0006F842    je          0006FDB9
 0006F848    dec         eax
>0006F849    je          0006FD4A
>0006F84F    jmp         0006FEDF
 0006F854    cmp         eax,0FFFFFF9C
>0006F857    jg          0006F87B
>0006F859    je          0006FE1E
 0006F85F    sub         eax,0FFFFFF99
>0006F862    je          0006FB38
 0006F868    dec         eax
>0006F869    je          0006FDFE
 0006F86F    dec         eax
>0006F870    je          0006FE59
>0006F876    jmp         0006FEDF
 0006F87B    sub         eax,0FFFFFFF4
>0006F87E    je          0006F897
 0006F880    sub         eax,7
>0006F883    je          0006FED8
 0006F889    sub         eax,3
>0006F88C    je          0006FECF
>0006F892    jmp         0006FEDF
 0006F897    mov         dword ptr [ebp-1C],ebx
 0006F89A    xor         eax,eax
 0006F89C    mov         dword ptr [edi+0C],eax
 0006F89F    mov         eax,dword ptr [ebp-1C]
 0006F8A2    mov         eax,dword ptr [eax+0C]
 0006F8A5    cmp         eax,1
>0006F8A8    jne         0006F95C
 0006F8AE    xor         ecx,ecx
 0006F8B0    xor         edx,edx
 0006F8B2    mov         eax,esi
 0006F8B4    call        TCustomListView.IsCustomDrawn
 0006F8B9    test        al,al
>0006F8BB    je          0006F925
 0006F8BD    mov         eax,dword ptr [ebp-1C]
 0006F8C0    mov         edx,dword ptr [eax+10]
 0006F8C3    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F8C9    call        TCanvas.SetHandle
 0006F8CE    mov         edx,dword ptr [esi+58];TCustomListView.FFont:TFont
 0006F8D1    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F8D7    call        TCanvas.SetFont
 0006F8DC    mov         edx,dword ptr [esi+124];TCustomListView.FBrush:TBrush
 0006F8E2    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F8E8    call        TCanvas.SetBrush
 0006F8ED    lea         edx,[ebp-38]
 0006F8F0    mov         eax,esi
 0006F8F2    mov         ecx,dword ptr [eax]
 0006F8F4    call        dword ptr [ecx+44];TWinControl.GetClientRect
 0006F8F7    lea         edx,[ebp-38]
 0006F8FA    xor         ecx,ecx
 0006F8FC    mov         eax,esi
 0006F8FE    mov         ebx,dword ptr [eax]
 0006F900    call        dword ptr [ebx+0BC];TCustomListView.CustomDraw
 0006F906    mov         ebx,eax
 0006F908    xor         edx,edx
 0006F90A    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F910    call        TCanvas.SetHandle
 0006F915    test        bl,bl
>0006F917    jne         0006F925
 0006F919    mov         dword ptr [edi+0C],4
>0006F920    jmp         0006FEDF
 0006F925    mov         cl,1
 0006F927    xor         edx,edx
 0006F929    mov         eax,esi
 0006F92B    call        TCustomListView.IsCustomDrawn
 0006F930    test        al,al
>0006F932    je          0006F93B
 0006F934    mov         dword ptr [edi+0C],10
 0006F93B    xor         ecx,ecx
 0006F93D    mov         dl,1
 0006F93F    mov         eax,esi
 0006F941    call        TCustomListView.IsCustomDrawn
 0006F946    test        al,al
>0006F948    je          0006F953
 0006F94A    or          dword ptr [edi+0C],20
>0006F94E    jmp         0006FEDF
 0006F953    or          dword ptr [edi+0C],0
>0006F957    jmp         0006FEDF
 0006F95C    test        eax,10001
>0006F961    je          0006FEDF
 0006F967    test        eax,20000
 0006F96C    setne       byte ptr [ebp-16]
 0006F970    cmp         byte ptr [ebp-16],0
>0006F974    je          0006F983
 0006F976    mov         eax,dword ptr [edi+8]
 0006F979    cmp         dword ptr [eax+38],0
>0006F97D    je          0006FEDF
 0006F983    mov         eax,dword ptr [ebp-1C]
 0006F986    mov         edx,dword ptr [eax+10]
 0006F989    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F98F    call        TCanvas.SetHandle
 0006F994    mov         edx,dword ptr [esi+58];TCustomListView.FFont:TFont
 0006F997    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F99D    call        TCanvas.SetFont
 0006F9A2    mov         edx,dword ptr [esi+124];TCustomListView.FBrush:TBrush
 0006F9A8    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F9AE    call        TCanvas.SetBrush
 0006F9B3    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006F9B9    mov         edx,dword ptr [eax+0C];TCanvas.Font:TFont
 0006F9BC    mov         dword ptr [edx+8],esi;TFont.?f8:TCustomListView
 0006F9BF    mov         dword ptr [edx+4],70CD8;TFont.FOnChange:TNotifyEvent TCustomListView.CanvasChanged
 0006F9C6    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0006F9C9    mov         dword ptr [eax+8],esi;TBrush.?f8:TCustomListView
 0006F9CC    mov         dword ptr [eax+4],70CD8;TBrush.FOnChange:TNotifyEvent TCustomListView.CanvasChanged
 0006F9D3    lea         eax,[ebp-60]
 0006F9D6    xor         ecx,ecx
 0006F9D8    mov         edx,28
 0006F9DD    call        @FillChar
 0006F9E2    mov         eax,dword ptr [ebp-1C]
 0006F9E5    mov         eax,dword ptr [eax+24]
 0006F9E8    mov         dword ptr [ebp-5C],eax
 0006F9EB    cmp         byte ptr [ebp-16],0
>0006F9EF    je          0006FA1B
 0006F9F1    mov         eax,dword ptr [ebp-1C]
 0006F9F4    mov         ax,word ptr [eax+28]
 0006F9F8    push        eax
 0006F9F9    push        0
 0006F9FB    lea         edx,[ebp-60]
 0006F9FE    mov         eax,esi
 0006FA00    call        TCustomListView.GetItem
 0006FA05    mov         edx,eax
 0006FA07    mov         eax,dword ptr [edi+8]
 0006FA0A    mov         ecx,dword ptr [eax+38]
 0006FA0D    mov         eax,esi
 0006FA0F    mov         ebx,dword ptr [eax]
 0006FA11    call        dword ptr [ebx+0C4];TCustomListView.CustomDrawSubItem
 0006FA17    mov         ebx,eax
>0006FA19    jmp         0006FA3C
 0006FA1B    push        0
 0006FA1D    lea         edx,[ebp-60]
 0006FA20    mov         eax,esi
 0006FA22    call        TCustomListView.GetItem
 0006FA27    mov         edx,eax
 0006FA29    mov         eax,dword ptr [ebp-1C]
 0006FA2C    mov         cx,word ptr [eax+28]
 0006FA30    mov         eax,esi
 0006FA32    mov         ebx,dword ptr [eax]
 0006FA34    call        dword ptr [ebx+0C0];TCustomListView.CustomDrawItem
 0006FA3A    mov         ebx,eax
 0006FA3C    test        bl,bl
>0006FA3E    jne         0006FA46
 0006FA40    or          dword ptr [edi+0C],4
>0006FA44    jmp         0006FAC4
 0006FA46    cmp         byte ptr [esi+266],0;TCustomListView.FCanvasChanged:Boolean
>0006FA4D    je          0006FAC4
 0006FA4F    mov         byte ptr [esi+266],0;TCustomListView.FCanvasChanged:Boolean
 0006FA56    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006FA5C    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 0006FA5F    xor         edx,edx
 0006FA61    mov         dword ptr [eax+4],edx;TFont.FOnChange:TNotifyEvent
 0006FA64    mov         dword ptr [eax+8],edx;TFont.?f8:TCustomListView
 0006FA67    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006FA6D    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0006FA70    xor         edx,edx
 0006FA72    mov         dword ptr [eax+4],edx;TBrush.FOnChange:TNotifyEvent
 0006FA75    mov         dword ptr [eax+8],edx;TBrush.?f8:TCustomListView
 0006FA78    mov         ebx,dword ptr [edi+8]
 0006FA7B    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006FA81    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 0006FA84    mov         eax,dword ptr [eax+14];TFont.Color:TColor
 0006FA87    call        ColorToRGB
 0006FA8C    mov         dword ptr [ebx+30],eax
 0006FA8F    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006FA95    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0006FA98    call        TBrush.GetColor
 0006FA9D    call        ColorToRGB
 0006FAA2    mov         dword ptr [ebx+34],eax
 0006FAA5    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006FAAB    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 0006FAAE    call        TFont.GetHandle
 0006FAB3    push        eax
 0006FAB4    mov         eax,dword ptr [ebp-1C]
 0006FAB7    mov         eax,dword ptr [eax+10]
 0006FABA    push        eax
 0006FABB    call        gdi32.SelectObject
 0006FAC0    or          dword ptr [edi+0C],2
 0006FAC4    xor         edx,edx
 0006FAC6    mov         eax,dword ptr [esi+1EC];TCustomListView.FCanvas:TCanvas
 0006FACC    call        TCanvas.SetHandle
 0006FAD1    cmp         byte ptr [ebp-16],0
>0006FAD5    jne         0006FB0B
 0006FAD7    mov         cl,1
 0006FAD9    mov         dl,1
 0006FADB    mov         eax,esi
 0006FADD    call        TCustomListView.IsCustomDrawn
 0006FAE2    test        al,al
>0006FAE4    je          0006FAEA
 0006FAE6    or          dword ptr [edi+0C],10
 0006FAEA    xor         ecx,ecx
 0006FAEC    mov         dl,2
 0006FAEE    mov         eax,esi
 0006FAF0    call        TCustomListView.IsCustomDrawn
 0006FAF5    test        al,al
>0006FAF7    je          0006FB02
 0006FAF9    or          dword ptr [edi+0C],20
>0006FAFD    jmp         0006FEDF
 0006FB02    or          dword ptr [edi+0C],0
>0006FB06    jmp         0006FEDF
 0006FB0B    mov         cl,1
 0006FB0D    mov         dl,2
 0006FB0F    mov         eax,esi
 0006FB11    call        TCustomListView.IsCustomDrawn
 0006FB16    test        al,al
>0006FB18    je          0006FEDF
 0006FB1E    or          dword ptr [edi+0C],10
>0006FB22    jmp         0006FEDF
 0006FB27    mov         eax,dword ptr [edi+8]
 0006FB2A    mov         eax,dword ptr [eax+0C]
 0006FB2D    mov         dword ptr [esi+248],eax;TCustomListView.FDragIndex:Integer
>0006FB33    jmp         0006FEDF
 0006FB38    mov         eax,dword ptr [edi+8]
 0006FB3B    mov         edx,dword ptr [eax+28]
 0006FB3E    mov         eax,esi
 0006FB40    mov         bx,0FFB4
 0006FB44    call        @CallDynaInst;TCustomListView.Delete
>0006FB49    jmp         0006FEDF
 0006FB4E    mov         eax,dword ptr [esi+208];TCustomListView.FListItems:TListItems
 0006FB54    call        TListItems.GetCount
 0006FB59    mov         edi,eax
 0006FB5B    dec         edi
 0006FB5C    cmp         edi,0
>0006FB5F    jl          0006FEDF
 0006FB65    mov         edx,edi
 0006FB67    mov         eax,dword ptr [esi+208];TCustomListView.FListItems:TListItems
 0006FB6D    call        TListItems.GetItem
 0006FB72    mov         edx,eax
 0006FB74    mov         eax,esi
 0006FB76    mov         bx,0FFB4
 0006FB7A    call        @CallDynaInst;TCustomListView.Delete
 0006FB7F    dec         edi
 0006FB80    cmp         edi,0FFFFFFFF
>0006FB83    jne         0006FB65
>0006FB85    jmp         0006FEDF
 0006FB8A    mov         eax,dword ptr [edi+8]
 0006FB8D    lea         edx,[eax+0C]
 0006FB90    mov         eax,esi
 0006FB92    call        TCustomListView.GetItem
 0006FB97    mov         dword ptr [ebp-4],eax
 0006FB9A    mov         eax,dword ptr [edi+8]
 0006FB9D    lea         ebx,[eax+0C]
 0006FBA0    test        byte ptr [ebx],1
>0006FBA3    je          0006FBF9
 0006FBA5    mov         edi,dword ptr [ebx+8]
 0006FBA8    test        edi,edi
>0006FBAA    jne         0006FBBF
 0006FBAC    mov         ecx,dword ptr [ebx+18]
 0006FBAF    mov         eax,dword ptr [ebp-4]
 0006FBB2    mov         edx,dword ptr [eax+24];TListItem.FCaption:String
 0006FBB5    mov         eax,dword ptr [ebx+14]
 0006FBB8    call        StrPLCopy
>0006FBBD    jmp         0006FBF9
 0006FBBF    mov         eax,dword ptr [ebp-4]
 0006FBC2    mov         eax,dword ptr [eax+8];TListItem.FSubItems:TStrings
 0006FBC5    mov         dword ptr [ebp-20],eax
 0006FBC8    mov         eax,dword ptr [ebp-20]
 0006FBCB    mov         edx,dword ptr [eax]
 0006FBCD    call        dword ptr [edx+14];TStrings.GetCount
 0006FBD0    cmp         edi,eax
>0006FBD2    jg          0006FBF3
 0006FBD4    lea         ecx,[ebp-64]
 0006FBD7    mov         edx,dword ptr [ebx+8]
 0006FBDA    dec         edx
 0006FBDB    mov         eax,dword ptr [ebp-20]
 0006FBDE    mov         edi,dword ptr [eax]
 0006FBE0    call        dword ptr [edi+0C];TStrings.Get
 0006FBE3    mov         edx,dword ptr [ebp-64]
 0006FBE6    mov         ecx,dword ptr [ebx+18]
 0006FBE9    mov         eax,dword ptr [ebx+14]
 0006FBEC    call        StrPLCopy
>0006FBF1    jmp         0006FBF9
 0006FBF3    mov         eax,dword ptr [ebx+14]
 0006FBF6    mov         byte ptr [eax],0
 0006FBF9    test        byte ptr [ebx],2
>0006FBFC    je          0006FC11
 0006FBFE    mov         edx,dword ptr [ebp-4]
 0006FC01    mov         eax,esi
 0006FC03    call        TCustomListView.GetImageIndex
 0006FC08    mov         eax,dword ptr [ebp-4]
 0006FC0B    mov         eax,dword ptr [eax+10];TListItem.FImageIndex:Integer
 0006FC0E    mov         dword ptr [ebx+1C],eax
 0006FC11    test        byte ptr [ebx],10
>0006FC14    je          0006FEDF
 0006FC1A    mov         eax,dword ptr [ebp-4]
 0006FC1D    mov         eax,dword ptr [eax+14];TListItem.FIndent:Integer
 0006FC20    mov         dword ptr [ebx+24],eax
>0006FC23    jmp         0006FEDF
 0006FC28    mov         eax,ebx
 0006FC2A    mov         ecx,dword ptr [eax+10]
 0006FC2D    mov         edx,dword ptr [eax+0C]
 0006FC30    mov         eax,esi
 0006FC32    mov         ebx,dword ptr [eax]
 0006FC34    call        dword ptr [ebx+0D4];TCustomListView.OwnerDataHint
>0006FC3A    jmp         0006FEDF
 0006FC3F    mov         dword ptr [ebp-24],ebx
 0006FC42    mov         eax,dword ptr [ebp-24]
 0006FC45    mov         eax,dword ptr [eax+10]
 0006FC48    call        ConvertFlags
 0006FC4D    mov         ebx,eax
 0006FC4F    xor         eax,eax
 0006FC51    mov         dword ptr [ebp-14],eax
 0006FC54    lea         eax,[ebp-8]
 0006FC57    call        @LStrClr
 0006FC5C    lea         ecx,[ebp-10]
 0006FC5F    xor         edx,edx
 0006FC61    xor         eax,eax
 0006FC63    call        Point
 0006FC68    mov         byte ptr [ebp-15],4
 0006FC6C    sub         bl,1
>0006FC6F    jb          0006FC7A
 0006FC71    sub         bl,2
>0006FC74    jb          0006FC85
>0006FC76    je          0006FCA5
>0006FC78    jmp         0006FCE0
 0006FC7A    mov         eax,dword ptr [ebp-24]
 0006FC7D    mov         eax,dword ptr [eax+18]
 0006FC80    mov         dword ptr [ebp-14],eax
>0006FC83    jmp         0006FCE0
 0006FC85    mov         eax,dword ptr [ebp-24]
 0006FC88    mov         ebx,dword ptr [eax+14]
 0006FC8B    test        ebx,ebx
>0006FC8D    je          0006FC9B
 0006FC8F    lea         edx,[ebp-8]
 0006FC92    mov         eax,ebx
 0006FC94    call        StrPas
>0006FC99    jmp         0006FCE0
 0006FC9B    lea         eax,[ebp-8]
 0006FC9E    call        @LStrClr
>0006FCA3    jmp         0006FCE0
 0006FCA5    mov         eax,dword ptr [ebp-24]
 0006FCA8    mov         edx,dword ptr [eax+1C]
 0006FCAB    mov         dword ptr [ebp-10],edx
 0006FCAE    mov         edx,dword ptr [eax+20]
 0006FCB1    mov         dword ptr [ebp-0C],edx
 0006FCB4    mov         eax,dword ptr [ebp-24]
 0006FCB7    mov         eax,dword ptr [eax+24]
 0006FCBA    sub         eax,25
>0006FCBD    je          0006FCCA
 0006FCBF    dec         eax
>0006FCC0    je          0006FCD0
 0006FCC2    dec         eax
>0006FCC3    je          0006FCD6
 0006FCC5    dec         eax
>0006FCC6    je          0006FCDC
>0006FCC8    jmp         0006FCE0
 0006FCCA    mov         byte ptr [ebp-15],0
>0006FCCE    jmp         0006FCE0
 0006FCD0    mov         byte ptr [ebp-15],2
>0006FCD4    jmp         0006FCE0
 0006FCD6    mov         byte ptr [ebp-15],1
>0006FCDA    jmp         0006FCE0
 0006FCDC    mov         byte ptr [ebp-15],3
 0006FCE0    lea         eax,[ebp-10]
 0006FCE3    push        eax
 0006FCE4    mov         eax,dword ptr [ebp-14]
 0006FCE7    push        eax
 0006FCE8    mov         eax,dword ptr [ebp-24]
 0006FCEB    mov         eax,dword ptr [eax+0C]
 0006FCEE    push        eax
 0006FCEF    mov         al,byte ptr [ebp-15]
 0006FCF2    push        eax
 0006FCF3    mov         eax,dword ptr [ebp-24]
 0006FCF6    test        byte ptr [eax+10],20
 0006FCFA    setne       al
 0006FCFD    push        eax
 0006FCFE    mov         eax,dword ptr [ebp-24]
 0006FD01    mov         eax,dword ptr [eax+10]
 0006FD04    call        ConvertFlags
 0006FD09    mov         edx,eax
 0006FD0B    mov         ecx,dword ptr [ebp-8]
 0006FD0E    mov         eax,esi
 0006FD10    mov         ebx,dword ptr [eax]
 0006FD12    call        dword ptr [ebx+0D0];TCustomListView.OwnerDataFind
 0006FD18    mov         dword ptr [edi+0C],eax
>0006FD1B    jmp         0006FEDF
 0006FD20    mov         ebx,dword ptr [edi+8]
 0006FD23    mov         eax,dword ptr [ebx+14]
 0006FD26    call        ConvertStates
 0006FD2B    push        eax
 0006FD2C    mov         eax,dword ptr [ebx+18]
 0006FD2F    call        ConvertStates
 0006FD34    push        eax
 0006FD35    mov         ecx,dword ptr [ebx+10]
 0006FD38    mov         edx,dword ptr [ebx+0C]
 0006FD3B    mov         eax,esi
 0006FD3D    mov         ebx,dword ptr [eax]
 0006FD3F    call        dword ptr [ebx+0D8];TCustomListView.OwnerDataStateChange
>0006FD45    jmp         0006FEDF
 0006FD4A    mov         eax,dword ptr [edi+8]
 0006FD4D    lea         edx,[eax+0C]
 0006FD50    mov         eax,esi
 0006FD52    call        TCustomListView.GetItem
 0006FD57    mov         dword ptr [ebp-4],eax
 0006FD5A    mov         edx,dword ptr [ebp-4]
 0006FD5D    mov         eax,esi
 0006FD5F    mov         bx,0FFB7
 0006FD63    call        @CallDynaInst;TCustomListView.CanEdit
 0006FD68    test        al,al
>0006FD6A    jne         0006FD73
 0006FD6C    mov         dword ptr [edi+0C],1
 0006FD73    cmp         dword ptr [edi+0C],0
>0006FD77    jne         0006FEDF
 0006FD7D    mov         eax,esi
 0006FD7F    call        TWinControl.GetHandle
 0006FD84    call        ListView_GetEditControl
 0006FD89    mov         ebx,eax
 0006FD8B    mov         dword ptr [esi+234],ebx;TCustomListView.FEditHandle:HWND
 0006FD91    push        0FC
 0006FD93    push        ebx
 0006FD94    call        user32.GetWindowLongA
 0006FD99    mov         dword ptr [esi+230],eax;TCustomListView.FDefEditProc:Pointer
 0006FD9F    mov         eax,dword ptr [esi+22C];TCustomListView.FEditInstance:Pointer
 0006FDA5    push        eax
 0006FDA6    push        0FC
 0006FDA8    mov         eax,dword ptr [esi+234];TCustomListView.FEditHandle:HWND
 0006FDAE    push        eax
 0006FDAF    call        user32.SetWindowLongA
>0006FDB4    jmp         0006FEDF
 0006FDB9    mov         eax,ebx
 0006FDBB    cmp         dword ptr [eax+20],0
>0006FDBF    je          0006FEDF
 0006FDC5    cmp         dword ptr [eax+10],0FFFFFFFF
>0006FDC9    je          0006FEDF
 0006FDCF    lea         edx,[eax+0C]
 0006FDD2    mov         eax,esi
 0006FDD4    mov         bx,0FFB3
 0006FDD8    call        @CallDynaInst;TCustomListView.Edit
>0006FDDD    jmp         0006FEDF
 0006FDE2    mov         edx,dword ptr [ebx+10]
 0006FDE5    mov         eax,esi
 0006FDE7    call        TCustomListView.GetColumnFromIndex
 0006FDEC    mov         edx,eax
 0006FDEE    mov         eax,esi
 0006FDF0    mov         bx,0FFB5
 0006FDF4    call        @CallDynaInst;TCustomListView.ColClick
>0006FDF9    jmp         0006FEDF
 0006FDFE    mov         edx,dword ptr [ebx+0C]
 0006FE01    mov         eax,dword ptr [esi+208];TCustomListView.FListItems:TListItems
 0006FE07    call        TListItems.GetItem
 0006FE0C    mov         edx,eax
 0006FE0E    mov         eax,esi
 0006FE10    mov         bx,0FFB2
 0006FE14    call        @CallDynaInst;TCustomListView.InsertItem
>0006FE19    jmp         0006FEDF
 0006FE1E    mov         dword ptr [ebp-28],ebx
 0006FE21    mov         eax,dword ptr [ebp-28]
 0006FE24    mov         edx,dword ptr [eax+0C]
 0006FE27    mov         eax,dword ptr [esi+208];TCustomListView.FListItems:TListItems
 0006FE2D    call        TListItems.GetItem
 0006FE32    mov         edx,eax
 0006FE34    mov         eax,dword ptr [ebp-28]
 0006FE37    mov         ecx,dword ptr [eax+1C]
 0006FE3A    mov         eax,esi
 0006FE3C    mov         bx,0FFB8
 0006FE40    call        @CallDynaInst;TCustomListView.CanChange
 0006FE45    test        al,al
>0006FE47    jne         0006FEDF
 0006FE4D    mov         dword ptr [edi+0C],1
>0006FE54    jmp         0006FEDF
 0006FE59    mov         edi,ebx
 0006FE5B    mov         edx,dword ptr [edi+0C]
 0006FE5E    mov         eax,dword ptr [esi+208];TCustomListView.FListItems:TListItems
 0006FE64    call        TListItems.GetItem
 0006FE69    mov         dword ptr [ebp-4],eax
 0006FE6C    mov         ecx,dword ptr [edi+1C]
 0006FE6F    mov         edx,dword ptr [ebp-4]
 0006FE72    mov         eax,esi
 0006FE74    mov         bx,0FFB6
 0006FE78    call        @CallDynaInst;TCustomListView.Change
 0006FE7D    cmp         word ptr [esi+2F6],0;TCustomListView.?f2F6:word
>0006FE85    je          0006FEDF
 0006FE87    cmp         dword ptr [edi+1C],8
>0006FE8B    jne         0006FEDF
 0006FE8D    test        byte ptr [edi+18],2
>0006FE91    je          0006FEAE
 0006FE93    test        byte ptr [edi+14],2
>0006FE97    jne         0006FEAE
 0006FE99    push        0
 0006FE9B    mov         ecx,dword ptr [ebp-4]
 0006FE9E    mov         edx,esi
 0006FEA0    mov         eax,dword ptr [esi+2F8];TCustomListView.?f2F8:dword
 0006FEA6    call        dword ptr [esi+2F4];TCustomListView.FOnSelectItem
>0006FEAC    jmp         0006FEDF
 0006FEAE    test        byte ptr [edi+18],2
>0006FEB2    jne         0006FEDF
 0006FEB4    test        byte ptr [edi+14],2
>0006FEB8    je          0006FEDF
 0006FEBA    push        1
 0006FEBC    mov         ecx,dword ptr [ebp-4]
 0006FEBF    mov         edx,esi
 0006FEC1    mov         eax,dword ptr [esi+2F8];TCustomListView.?f2F8:dword
 0006FEC7    call        dword ptr [esi+2F4];TCustomListView.FOnSelectItem
>0006FECD    jmp         0006FEDF
 0006FECF    mov         byte ptr [esi+20C],1;TCustomListView.FClicked:Boolean
>0006FED6    jmp         0006FEDF
 0006FED8    mov         byte ptr [esi+20D],1;TCustomListView.FRClicked:Boolean
 0006FEDF    xor         eax,eax
 0006FEE1    pop         edx
 0006FEE2    pop         ecx
 0006FEE3    pop         ecx
 0006FEE4    mov         dword ptr fs:[eax],edx
 0006FEE7    push        6FF04
 0006FEEC    lea         eax,[ebp-64]
 0006FEEF    call        @LStrClr
 0006FEF4    lea         eax,[ebp-8]
 0006FEF7    call        @LStrClr
 0006FEFC    ret
>0006FEFD    jmp         @HandleFinally
>0006FF02    jmp         0006FEEC
 0006FF04    pop         edi
 0006FF05    pop         esi
 0006FF06    pop         ebx
 0006FF07    mov         esp,ebp
 0006FF09    pop         ebp
 0006FF0A    ret
end;*}

//0006FF0C
procedure TCustomListView.ColClick(Column:TListColumn);
begin
{*
 0006FF0C    push        ebx
 0006FF0D    cmp         word ptr [eax+27E],0
>0006FF15    je          0006FF29
 0006FF17    mov         ebx,eax
 0006FF19    mov         ecx,edx
 0006FF1B    mov         edx,eax
 0006FF1D    mov         eax,dword ptr [ebx+280]
 0006FF23    call        dword ptr [ebx+27C]
 0006FF29    pop         ebx
 0006FF2A    ret
*}
end;

//0006FF2C
procedure TCustomListView.InsertItem(Item:TListItem);
begin
{*
 0006FF2C    push        ebx
 0006FF2D    cmp         word ptr [eax+2E6],0
>0006FF35    je          0006FF49
 0006FF37    mov         ebx,eax
 0006FF39    mov         ecx,edx
 0006FF3B    mov         edx,eax
 0006FF3D    mov         eax,dword ptr [ebx+2E8]
 0006FF43    call        dword ptr [ebx+2E4]
 0006FF49    pop         ebx
 0006FF4A    ret
*}
end;

//0006FF4C
procedure TCustomListView.CanChange(Item:TListItem; Change:Integer);
begin
{*
 0006FF4C    push        ebx
 0006FF4D    push        ecx
 0006FF4E    mov         byte ptr [esp],1
 0006FF52    dec         ecx
>0006FF53    je          0006FF5F
 0006FF55    dec         ecx
>0006FF56    je          0006FF63
 0006FF58    sub         ecx,6
>0006FF5B    je          0006FF67
>0006FF5D    jmp         0006FF8B
 0006FF5F    xor         ecx,ecx
>0006FF61    jmp         0006FF69
 0006FF63    mov         cl,1
>0006FF65    jmp         0006FF69
 0006FF67    mov         cl,2
 0006FF69    cmp         word ptr [eax+276],0
>0006FF71    je          0006FF8B
 0006FF73    push        ecx
 0006FF74    lea         ecx,[esp+4]
 0006FF78    push        ecx
 0006FF79    mov         ebx,eax
 0006FF7B    mov         ecx,edx
 0006FF7D    mov         edx,eax
 0006FF7F    mov         eax,dword ptr [ebx+278]
 0006FF85    call        dword ptr [ebx+274]
 0006FF8B    mov         al,byte ptr [esp]
 0006FF8E    pop         edx
 0006FF8F    pop         ebx
 0006FF90    ret
*}
end;

//0006FF94
procedure TCustomListView.Change(Item:TListItem; Change:Integer);
begin
{*
 0006FF94    push        ebx
 0006FF95    dec         ecx
>0006FF96    je          0006FFA2
 0006FF98    dec         ecx
>0006FF99    je          0006FFA6
 0006FF9B    sub         ecx,6
>0006FF9E    je          0006FFAA
>0006FFA0    jmp         0006FFC9
 0006FFA2    xor         ecx,ecx
>0006FFA4    jmp         0006FFAC
 0006FFA6    mov         cl,1
>0006FFA8    jmp         0006FFAC
 0006FFAA    mov         cl,2
 0006FFAC    cmp         word ptr [eax+26E],0
>0006FFB4    je          0006FFC9
 0006FFB6    push        ecx
 0006FFB7    mov         ebx,eax
 0006FFB9    mov         ecx,edx
 0006FFBB    mov         edx,eax
 0006FFBD    mov         eax,dword ptr [ebx+270]
 0006FFC3    call        dword ptr [ebx+26C]
 0006FFC9    pop         ebx
 0006FFCA    ret
*}
end;

//0006FFCC
procedure TCustomListView.Delete(Item:TListItem);
begin
{*
 0006FFCC    push        ebx
 0006FFCD    push        esi
 0006FFCE    mov         ebx,edx
 0006FFD0    test        ebx,ebx
>0006FFD2    je          00070001
 0006FFD4    cmp         byte ptr [ebx+29],0
>0006FFD8    jne         00070001
 0006FFDA    cmp         word ptr [eax+2BE],0
>0006FFE2    je          0006FFF6
 0006FFE4    mov         esi,eax
 0006FFE6    mov         ecx,ebx
 0006FFE8    mov         edx,eax
 0006FFEA    mov         eax,dword ptr [esi+2C0]
 0006FFF0    call        dword ptr [esi+2BC]
 0006FFF6    mov         byte ptr [ebx+29],1
 0006FFFA    mov         eax,ebx
 0006FFFC    call        TListItem.Delete
 00070001    pop         esi
 00070002    pop         ebx
 00070003    ret
*}
end;

//00070004
procedure TCustomListView.CanEdit(Item:TListItem);
begin
{*
 00070004    push        ebx
 00070005    push        ecx
 00070006    mov         byte ptr [esp],1
 0007000A    cmp         word ptr [eax+2CE],0
>00070012    je          00070027
 00070014    push        esp
 00070015    mov         ebx,eax
 00070017    mov         ecx,edx
 00070019    mov         edx,eax
 0007001B    mov         eax,dword ptr [ebx+2D0]
 00070021    call        dword ptr [ebx+2CC]
 00070027    mov         al,byte ptr [esp]
 0007002A    pop         edx
 0007002B    pop         ebx
 0007002C    ret
*}
end;

//00070030
procedure TCustomListView.Edit(const Item:TLVItem);
begin
{*
 00070030    push        ebp
 00070031    mov         ebp,esp
 00070033    push        0
 00070035    push        ebx
 00070036    push        esi
 00070037    mov         esi,edx
 00070039    mov         ebx,eax
 0007003B    xor         eax,eax
 0007003D    push        ebp
 0007003E    push        700A1
 00070043    push        dword ptr fs:[eax]
 00070046    mov         dword ptr fs:[eax],esp
 00070049    lea         eax,[ebp-4]
 0007004C    mov         edx,dword ptr [esi+14]
 0007004F    call        @LStrFromPChar
 00070054    mov         edx,esi
 00070056    mov         eax,ebx
 00070058    call        TCustomListView.GetItem
 0007005D    mov         esi,eax
 0007005F    cmp         word ptr [ebx+2D6],0
>00070067    je          0007007D
 00070069    lea         eax,[ebp-4]
 0007006C    push        eax
 0007006D    mov         ecx,esi
 0007006F    mov         edx,ebx
 00070071    mov         eax,dword ptr [ebx+2D8]
 00070077    call        dword ptr [ebx+2D4]
 0007007D    test        esi,esi
>0007007F    je          0007008B
 00070081    mov         edx,dword ptr [ebp-4]
 00070084    mov         eax,esi
 00070086    call        TListItem.SetCaption
 0007008B    xor         eax,eax
 0007008D    pop         edx
 0007008E    pop         ecx
 0007008F    pop         ecx
 00070090    mov         dword ptr fs:[eax],edx
 00070093    push        700A8
 00070098    lea         eax,[ebp-4]
 0007009B    call        @LStrClr
 000700A0    ret
>000700A1    jmp         @HandleFinally
>000700A6    jmp         00070098
 000700A8    pop         esi
 000700A9    pop         ebx
 000700AA    pop         ecx
 000700AB    pop         ebp
 000700AC    ret
*}
end;

//000700B0
function TCustomListView.GetDragImages:TDragImageList;
begin
{*
 000700B0    push        ebx
 000700B1    mov         ebx,eax
 000700B3    mov         eax,ebx
 000700B5    call        TCustomListView.GetSelCount
 000700BA    dec         eax
>000700BB    jne         000700C5
 000700BD    mov         eax,dword ptr [ebx+200]
 000700C3    pop         ebx
 000700C4    ret
 000700C5    xor         eax,eax
 000700C7    pop         ebx
 000700C8    ret
*}
end;

//000700CC
procedure TCustomListView.WndProc(var Message:TMessage);
begin
{*
 000700CC    push        ebx
 000700CD    push        esi
 000700CE    push        edi
 000700CF    mov         esi,edx
 000700D1    mov         ebx,eax
 000700D3    test        byte ptr [ebx+20],10
>000700D7    jne         00070122
 000700D9    mov         edi,dword ptr [esi]
 000700DB    cmp         edi,201
>000700E1    je          000700EB
 000700E3    cmp         edi,203
>000700E9    jne         00070122
 000700EB    mov         eax,ebx
 000700ED    call        TControl.Dragging
 000700F2    test        al,al
>000700F4    jne         00070122
 000700F6    cmp         byte ptr [ebx+4D],1
>000700FA    jne         00070122
 000700FC    mov         edx,esi
 000700FE    mov         eax,ebx
 00070100    call        TWinControl.IsControlMouseMsg
 00070105    test        al,al
>00070107    jne         00070143
 00070109    mov         ax,[00070148]
 0007010F    or          ax,word ptr [ebx+44]
 00070113    mov         word ptr [ebx+44],ax
 00070117    mov         edx,esi
 00070119    mov         eax,ebx
 0007011B    mov         ecx,dword ptr [eax]
 0007011D    call        dword ptr [ecx-14]
>00070120    jmp         00070143
 00070122    mov         eax,dword ptr [esi]
 00070124    cmp         eax,0F
>00070127    je          0007012E
 00070129    cmp         eax,14
>0007012C    jne         0007013A
 0007012E    mov         eax,dword ptr [ebx+208]
 00070134    cmp         byte ptr [eax+0C],0
>00070138    jne         00070143
 0007013A    mov         edx,esi
 0007013C    mov         eax,ebx
 0007013E    call        TWinControl.WndProc
 00070143    pop         edi
 00070144    pop         esi
 00070145    pop         ebx
 00070146    ret
*}
end;

//0007014C
procedure TCustomListView.DoStartDrag(var DragObject:TDragObject);
begin
{*
 0007014C    push        ebx
 0007014D    push        esi
 0007014E    add         esp,0FFFFFFD8
 00070151    mov         ebx,eax
 00070153    mov         eax,ebx
 00070155    call        TControl.DoStartDrag
 0007015A    xor         eax,eax
 0007015C    mov         dword ptr [ebx+24C],eax
 00070162    push        esp
 00070163    call        user32.GetCursorPos
 00070168    lea         ecx,[esp+20]
 0007016C    mov         edx,esp
 0007016E    mov         eax,ebx
 00070170    call        TControl.ScreenToClient
 00070175    mov         eax,dword ptr [esp+20]
 00070179    mov         dword ptr [esp],eax
 0007017C    mov         eax,dword ptr [esp+24]
 00070180    mov         dword ptr [esp+4],eax
 00070184    mov         eax,dword ptr [ebx+248]
 0007018A    cmp         eax,0FFFFFFFF
>0007018D    je          000701A0
 0007018F    mov         edx,eax
 00070191    mov         eax,dword ptr [ebx+208]
 00070197    call        TListItems.GetItem
 0007019C    mov         esi,eax
>0007019E    jmp         000701A2
 000701A0    xor         esi,esi
 000701A2    mov         dword ptr [ebx+248],0FFFFFFFF
 000701AC    test        esi,esi
>000701AE    jne         000701C0
 000701B0    mov         ecx,dword ptr [esp+4]
 000701B4    mov         edx,dword ptr [esp]
 000701B7    mov         eax,ebx
 000701B9    call        TCustomListView.GetItemAt
 000701BE    mov         esi,eax
 000701C0    test        esi,esi
>000701C2    je          00070217
 000701C4    mov         eax,esi
 000701C6    call        TListItem.GetIndex
 000701CB    push        eax
 000701CC    mov         eax,ebx
 000701CE    call        TWinControl.GetHandle
 000701D3    lea         ecx,[esp+0C]
 000701D7    pop         edx
 000701D8    call        ListView_CreateDragImage
 000701DD    test        eax,eax
>000701DF    je          00070217
 000701E1    mov         ebx,dword ptr [ebx+200]
 000701E7    mov         edx,eax
 000701E9    mov         eax,ebx
 000701EB    call        TCustomImageList.SetHandle
 000701F0    lea         ecx,[esp+10]
 000701F4    xor         edx,edx
 000701F6    mov         eax,esi
 000701F8    call        TListItem.DisplayRect
 000701FD    mov         eax,dword ptr [esp+4]
 00070201    sub         eax,dword ptr [esp+14]
 00070205    push        eax
 00070206    mov         ecx,dword ptr [esp+4]
 0007020A    sub         ecx,dword ptr [esp+14]
 0007020E    xor         edx,edx
 00070210    mov         eax,ebx
 00070212    call        TDragImageList.SetDragImage
 00070217    add         esp,28
 0007021A    pop         esi
 0007021B    pop         ebx
 0007021C    ret
*}
end;

//00070220
procedure TCustomListView.DoEndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 00070220    push        ebp
 00070221    mov         ebp,esp
 00070223    push        ebx
 00070224    mov         ebx,eax
 00070226    mov         eax,dword ptr [ebp+8]
 00070229    push        eax
 0007022A    mov         eax,ebx
 0007022C    call        TControl.DoEndDrag
 00070231    xor         eax,eax
 00070233    mov         dword ptr [ebx+24C],eax
 00070239    pop         ebx
 0007023A    pop         ebp
 0007023B    ret         4
*}
end;

//00070240
procedure TCustomListView.CMDrag(var Message:TCMDrag);
begin
{*
 00070240    push        ebx
 00070241    push        esi
 00070242    push        edi
 00070243    add         esp,0FFFFFFF8
 00070246    mov         esi,edx
 00070248    mov         ebx,eax
 0007024A    mov         edx,esi
 0007024C    mov         eax,ebx
 0007024E    call        TWinControl.CMDrag
 00070253    mov         edi,dword ptr [esi+8]
 00070256    mov         al,byte ptr [esi+4]
 00070259    dec         al
>0007025B    je          0007028F
 0007025D    dec         al
>0007025F    je          00070267
 00070261    dec         al
>00070263    je          000702C1
>00070265    jmp         000702C9
 00070267    mov         ecx,esp
 00070269    mov         edx,edi
 0007026B    mov         eax,ebx
 0007026D    call        TControl.ScreenToClient
 00070272    mov         eax,dword ptr [esp+4]
 00070276    push        eax
 00070277    cmp         dword ptr [esi+0C],0
 0007027B    setne       al
 0007027E    push        eax
 0007027F    mov         edx,dword ptr [edi+8]
 00070282    mov         ecx,dword ptr [esp+8]
 00070286    mov         eax,ebx
 00070288    call        TCustomListView.DoDragOver
>0007028D    jmp         000702C9
 0007028F    mov         eax,dword ptr [edi+8]
 00070292    mov         edx,dword ptr [eax]
 00070294    call        dword ptr [edx+14]
 00070297    mov         eax,ebx
 00070299    call        TCustomListView.GetDropTarget
 0007029E    mov         dword ptr [ebx+24C],eax
 000702A4    xor         edx,edx
 000702A6    mov         eax,ebx
 000702A8    call        TCustomListView.SetDropTarget
 000702AD    mov         eax,ebx
 000702AF    mov         edx,dword ptr [eax]
 000702B1    call        dword ptr [edx+84]
 000702B7    mov         eax,dword ptr [edi+8]
 000702BA    mov         edx,dword ptr [eax]
 000702BC    call        dword ptr [edx+1C]
>000702BF    jmp         000702C9
 000702C1    xor         eax,eax
 000702C3    mov         dword ptr [ebx+24C],eax
 000702C9    pop         ecx
 000702CA    pop         edx
 000702CB    pop         edi
 000702CC    pop         esi
 000702CD    pop         ebx
 000702CE    ret
*}
end;

//000702D0
procedure TCustomListView.DoDragOver(Source:TDragObject; X:Integer; Y:Integer; CanDrop:Boolean);
begin
{*
 000702D0    push        ebp
 000702D1    mov         ebp,esp
 000702D3    push        ecx
 000702D4    push        ebx
 000702D5    push        esi
 000702D6    push        edi
 000702D7    mov         dword ptr [ebp-4],edx
 000702DA    mov         esi,eax
 000702DC    mov         edx,ecx
 000702DE    mov         eax,esi
 000702E0    mov         ecx,dword ptr [ebp+0C]
 000702E3    call        TCustomListView.GetItemAt
 000702E8    mov         ebx,eax
 000702EA    test        ebx,ebx
>000702EC    je          00070350
 000702EE    mov         eax,esi
 000702F0    call        TCustomListView.GetDropTarget
 000702F5    mov         edi,eax
 000702F7    cmp         edi,ebx
>000702F9    jne         00070303
 000702FB    cmp         ebx,dword ptr [esi+24C]
>00070301    jne         00070350
 00070303    xor         eax,eax
 00070305    mov         dword ptr [esi+24C],eax
 0007030B    mov         eax,dword ptr [ebp-4]
 0007030E    mov         edx,dword ptr [eax]
 00070310    call        dword ptr [edx+14]
 00070313    mov         eax,esi
 00070315    mov         edx,dword ptr [eax]
 00070317    call        dword ptr [edx+84]
 0007031D    test        edi,edi
>0007031F    je          0007032F
 00070321    xor         ecx,ecx
 00070323    mov         edx,1
 00070328    mov         eax,edi
 0007032A    call        TListItem.SetState
 0007032F    mov         cl,byte ptr [ebp+8]
 00070332    mov         edx,1
 00070337    mov         eax,ebx
 00070339    call        TListItem.SetState
 0007033E    mov         eax,esi
 00070340    mov         edx,dword ptr [eax]
 00070342    call        dword ptr [edx+84]
 00070348    mov         eax,dword ptr [ebp-4]
 0007034B    mov         edx,dword ptr [eax]
 0007034D    call        dword ptr [edx+1C]
 00070350    pop         edi
 00070351    pop         esi
 00070352    pop         ebx
 00070353    pop         ecx
 00070354    pop         ebp
 00070355    ret         8
*}
end;

//00070358
procedure TCustomListView.SetItems(Value:TListItems);
begin
{*
 00070358    mov         eax,dword ptr [eax+208]
 0007035E    mov         ecx,dword ptr [eax]
 00070360    call        dword ptr [ecx+8]
 00070363    ret
*}
end;

//00070364
procedure TCustomListView.SetListColumns(Value:TListColumns);
begin
{*
 00070364    mov         eax,dword ptr [eax+218]
 0007036A    mov         ecx,dword ptr [eax]
 0007036C    call        dword ptr [ecx+8]
 0007036F    ret
*}
end;

//00070370
function TCustomListView.AlphaSort:Boolean;
begin
{*
 00070370    push        ebx
 00070371    mov         ebx,eax
 00070373    mov         eax,ebx
 00070375    call        TWinControl.HandleAllocated
 0007037A    test        al,al
>0007037C    je          00070399
 0007037E    mov         eax,ebx
 00070380    call        TWinControl.GetHandle
 00070385    mov         edx,6E348;DefaultListViewSort:Integer
 0007038A    xor         ecx,ecx
 0007038C    call        ListView_SortItems
 00070391    neg         eax
 00070393    sbb         eax,eax
 00070395    neg         eax
 00070397    pop         ebx
 00070398    ret
 00070399    xor         eax,eax
 0007039B    pop         ebx
 0007039C    ret
*}
end;

//000703A0
procedure TCustomListView.SetSortType(Value:TSortType);
begin
{*
 000703A0    cmp         dl,byte ptr [eax+205]
>000703A6    je          000703D7
 000703A8    mov         byte ptr [eax+205],dl
 000703AE    mov         dl,byte ptr [eax+205]
 000703B4    mov         ecx,edx
 000703B6    sub         cl,1
>000703B9    je          000703C0
 000703BB    sub         cl,2
>000703BE    jne         000703CA
 000703C0    cmp         word ptr [eax+2EE],0
>000703C8    jne         000703D2
 000703CA    add         dl,0FE
 000703CD    sub         dl,2
>000703D0    jae         000703D7
 000703D2    call        TCustomListView.AlphaSort
 000703D7    ret
*}
end;

//000703D8
procedure TCustomListView.SetLargeImages(Value:TCustomImageList);
begin
{*
 000703D8    push        ebx
 000703D9    push        esi
 000703DA    mov         esi,edx
 000703DC    mov         ebx,eax
 000703DE    mov         eax,dword ptr [ebx+1F4]
 000703E4    test        eax,eax
>000703E6    je          000703F3
 000703E8    mov         edx,dword ptr [ebx+258]
 000703EE    call        TCustomImageList.UnRegisterChanges
 000703F3    mov         eax,esi
 000703F5    mov         dword ptr [ebx+1F4],eax
 000703FB    test        eax,eax
>000703FD    je          00070430
 000703FF    mov         edx,dword ptr [ebx+258]
 00070405    call        TCustomImageList.RegisterChanges
 0007040A    mov         edx,ebx
 0007040C    mov         eax,dword ptr [ebx+1F4]
 00070412    call        TComponent.FreeNotification
 00070417    mov         eax,dword ptr [ebx+1F4]
 0007041D    call        TCustomImageList.GetHandle
 00070422    mov         edx,eax
 00070424    xor         ecx,ecx
 00070426    mov         eax,ebx
 00070428    call        TCustomListView.SetImageList
 0007042D    pop         esi
 0007042E    pop         ebx
 0007042F    ret
 00070430    xor         ecx,ecx
 00070432    xor         edx,edx
 00070434    mov         eax,ebx
 00070436    call        TCustomListView.SetImageList
 0007043B    pop         esi
 0007043C    pop         ebx
 0007043D    ret
*}
end;

//00070440
procedure TCustomListView.SetSmallImages(Value:TCustomImageList);
begin
{*
 00070440    push        ebx
 00070441    push        esi
 00070442    mov         esi,edx
 00070444    mov         ebx,eax
 00070446    mov         eax,dword ptr [ebx+1F8]
 0007044C    test        eax,eax
>0007044E    je          0007045B
 00070450    mov         edx,dword ptr [ebx+25C]
 00070456    call        TCustomImageList.UnRegisterChanges
 0007045B    mov         eax,esi
 0007045D    mov         dword ptr [ebx+1F8],eax
 00070463    test        eax,eax
>00070465    je          0007049B
 00070467    mov         edx,dword ptr [ebx+25C]
 0007046D    call        TCustomImageList.RegisterChanges
 00070472    mov         edx,ebx
 00070474    mov         eax,dword ptr [ebx+1F8]
 0007047A    call        TComponent.FreeNotification
 0007047F    mov         eax,dword ptr [ebx+1F8]
 00070485    call        TCustomImageList.GetHandle
 0007048A    mov         edx,eax
 0007048C    mov         ecx,1
 00070491    mov         eax,ebx
 00070493    call        TCustomListView.SetImageList
 00070498    pop         esi
 00070499    pop         ebx
 0007049A    ret
 0007049B    mov         ecx,1
 000704A0    xor         edx,edx
 000704A2    mov         eax,ebx
 000704A4    call        TCustomListView.SetImageList
 000704A9    pop         esi
 000704AA    pop         ebx
 000704AB    ret
*}
end;

//000704AC
procedure TCustomListView.SetStateImages(Value:TCustomImageList);
begin
{*
 000704AC    push        ebx
 000704AD    push        esi
 000704AE    mov         esi,edx
 000704B0    mov         ebx,eax
 000704B2    mov         eax,dword ptr [ebx+1FC]
 000704B8    test        eax,eax
>000704BA    je          000704C7
 000704BC    mov         edx,dword ptr [ebx+260]
 000704C2    call        TCustomImageList.UnRegisterChanges
 000704C7    mov         dword ptr [ebx+1FC],esi
 000704CD    cmp         byte ptr [ebx+250],0
>000704D4    je          000704DD
 000704D6    mov         eax,ebx
 000704D8    call        TCustomListView.SaveChecks
 000704DD    mov         eax,dword ptr [ebx+1FC]
 000704E3    test        eax,eax
>000704E5    je          0007052B
 000704E7    mov         edx,dword ptr [ebx+260]
 000704ED    call        TCustomImageList.RegisterChanges
 000704F2    mov         edx,ebx
 000704F4    mov         eax,dword ptr [ebx+1FC]
 000704FA    call        TComponent.FreeNotification
 000704FF    mov         eax,dword ptr [ebx+1FC]
 00070505    call        TCustomImageList.GetHandle
 0007050A    mov         edx,eax
 0007050C    mov         ecx,2
 00070511    mov         eax,ebx
 00070513    call        TCustomListView.SetImageList
 00070518    cmp         byte ptr [ebx+250],0
>0007051F    je          00070554
 00070521    mov         eax,ebx
 00070523    call        TCustomListView.RestoreChecks
 00070528    pop         esi
 00070529    pop         ebx
 0007052A    ret
 0007052B    mov         ecx,2
 00070530    xor         edx,edx
 00070532    mov         eax,ebx
 00070534    call        TCustomListView.SetImageList
 00070539    cmp         byte ptr [ebx+250],0
>00070540    je          00070554
 00070542    xor         edx,edx
 00070544    mov         eax,ebx
 00070546    call        TCustomListView.SetCheckboxes
 0007054B    mov         dl,1
 0007054D    mov         eax,ebx
 0007054F    call        TCustomListView.SetCheckboxes
 00070554    pop         esi
 00070555    pop         ebx
 00070556    ret
*}
end;

//00070558
function TCustomListView.GetColumnFromIndex(Index:Integer):TListColumn;
begin
{*
 00070558    mov         eax,dword ptr [eax+218]
 0007055E    call        THeaderSections.GetItem
 00070563    ret
*}
end;

//00070564
function TCustomListView.GetDropTarget:TListItem;
begin
{*
 00070564    push        ebx
 00070565    mov         ebx,eax
 00070567    mov         al,[00070584]
 0007056C    push        eax
 0007056D    mov         cl,4
 0007056F    xor         edx,edx
 00070571    mov         eax,ebx
 00070573    call        TCustomListView.GetNextItem
 00070578    test        eax,eax
>0007057A    jne         00070582
 0007057C    mov         eax,dword ptr [ebx+24C]
 00070582    pop         ebx
 00070583    ret
*}
end;

//00070588
procedure TCustomListView.SetDropTarget(Value:TListItem);
begin
{*
 00070588    push        ebx
 00070589    push        esi
 0007058A    mov         esi,edx
 0007058C    mov         ebx,eax
 0007058E    mov         eax,ebx
 00070590    call        TWinControl.HandleAllocated
 00070595    test        al,al
>00070597    je          000705C8
 00070599    test        esi,esi
>0007059B    je          000705AD
 0007059D    mov         cl,1
 0007059F    mov         edx,1
 000705A4    mov         eax,esi
 000705A6    call        TListItem.SetState
>000705AB    jmp         000705C8
 000705AD    mov         eax,ebx
 000705AF    call        TCustomListView.GetDropTarget
 000705B4    mov         esi,eax
 000705B6    test        esi,esi
>000705B8    je          000705C8
 000705BA    xor         ecx,ecx
 000705BC    mov         edx,1
 000705C1    mov         eax,esi
 000705C3    call        TListItem.SetState
 000705C8    pop         esi
 000705C9    pop         ebx
 000705CA    ret
*}
end;

//000705CC
procedure TCustomListView.GetImageIndex(Item:TListItem);
begin
{*
 000705CC    push        ebx
 000705CD    cmp         word ptr [eax+2DE],0
>000705D5    je          000705E9
 000705D7    mov         ebx,eax
 000705D9    mov         ecx,edx
 000705DB    mov         edx,eax
 000705DD    mov         eax,dword ptr [ebx+2E0]
 000705E3    call        dword ptr [ebx+2DC]
 000705E9    pop         ebx
 000705EA    ret
*}
end;

//000705EC
function TCustomListView.GetNextItem(StartItem:TListItem; Direction:TSearchDirection; States:TItemStates):TListItem;
begin
{*
 000705EC    push        ebp
 000705ED    mov         ebp,esp
 000705EF    add         esp,0FFFFFFF8
 000705F2    push        ebx
 000705F3    push        esi
 000705F4    push        edi
 000705F5    mov         byte ptr [ebp-1],cl
 000705F8    mov         edi,edx
 000705FA    mov         ebx,eax
 000705FC    xor         eax,eax
 000705FE    mov         dword ptr [ebp-8],eax
 00070601    mov         eax,ebx
 00070603    call        TWinControl.HandleAllocated
 00070608    test        al,al
>0007060A    je          000706B2
 00070610    xor         esi,esi
 00070612    xor         eax,eax
 00070614    mov         al,byte ptr [ebp-1]
 00070617    cmp         eax,4
>0007061A    ja          00070655
 0007061C    jmp         dword ptr [eax*4+70623]
 0007061C    dd          00070645
 0007061C    dd          0007064C
 0007061C    dd          00070637
 0007061C    dd          0007063E
 0007061C    dd          00070653
 00070637    mov         esi,100
>0007063C    jmp         00070655
 0007063E    mov         esi,200
>00070643    jmp         00070655
 00070645    mov         esi,400
>0007064A    jmp         00070655
 0007064C    mov         esi,800
>00070651    jmp         00070655
 00070653    xor         esi,esi
 00070655    test        edi,edi
>00070657    je          00070664
 00070659    mov         eax,edi
 0007065B    call        TListItem.GetIndex
 00070660    mov         edi,eax
>00070662    jmp         00070667
 00070664    or          edi,0FFFFFFFF
 00070667    test        byte ptr [ebp+8],2
>0007066B    je          00070670
 0007066D    or          esi,4
 00070670    test        byte ptr [ebp+8],4
>00070674    je          00070679
 00070676    or          esi,8
 00070679    test        byte ptr [ebp+8],8
>0007067D    je          00070682
 0007067F    or          esi,1
 00070682    test        byte ptr [ebp+8],10
>00070686    je          0007068B
 00070688    or          esi,2
 0007068B    mov         eax,ebx
 0007068D    call        TWinControl.GetHandle
 00070692    mov         ecx,esi
 00070694    mov         edx,edi
 00070696    call        ListView_GetNextItem
 0007069B    mov         edi,eax
 0007069D    cmp         edi,0FFFFFFFF
>000706A0    je          000706B2
 000706A2    mov         edx,edi
 000706A4    mov         eax,dword ptr [ebx+208]
 000706AA    call        TListItems.GetItem
 000706AF    mov         dword ptr [ebp-8],eax
 000706B2    mov         eax,dword ptr [ebp-8]
 000706B5    pop         edi
 000706B6    pop         esi
 000706B7    pop         ebx
 000706B8    pop         ecx
 000706B9    pop         ecx
 000706BA    pop         ebp
 000706BB    ret         4
*}
end;

//000706C0
function TCustomListView.GetItemAt(X:Integer; Y:Integer):TListItem;
begin
{*
 000706C0    push        ebx
 000706C1    push        esi
 000706C2    push        edi
 000706C3    push        ebp
 000706C4    add         esp,0FFFFFFE4
 000706C7    mov         ebp,ecx
 000706C9    mov         edi,edx
 000706CB    mov         ebx,eax
 000706CD    xor         esi,esi
 000706CF    mov         eax,ebx
 000706D1    call        TWinControl.HandleAllocated
 000706D6    test        al,al
>000706D8    je          00070718
 000706DA    lea         ecx,[esp+14]
 000706DE    mov         edx,ebp
 000706E0    mov         eax,edi
 000706E2    call        Point
 000706E7    mov         eax,dword ptr [esp+14]
 000706EB    mov         dword ptr [esp],eax
 000706EE    mov         eax,dword ptr [esp+18]
 000706F2    mov         dword ptr [esp+4],eax
 000706F6    mov         eax,ebx
 000706F8    call        TWinControl.GetHandle
 000706FD    mov         edx,esp
 000706FF    call        ListView_HitTest
 00070704    cmp         eax,0FFFFFFFF
>00070707    je          00070718
 00070709    mov         edx,eax
 0007070B    mov         eax,dword ptr [ebx+208]
 00070711    call        TListItems.GetItem
 00070716    mov         esi,eax
 00070718    mov         eax,esi
 0007071A    add         esp,1C
 0007071D    pop         ebp
 0007071E    pop         edi
 0007071F    pop         esi
 00070720    pop         ebx
 00070721    ret
*}
end;

//00070724
procedure TCustomListView.Arrange(Code:TListArrangement);
begin
{*
 00070724    push        ebx
 00070725    push        esi
 00070726    mov         ebx,edx
 00070728    mov         esi,eax
 0007072A    mov         eax,esi
 0007072C    call        TWinControl.GetHandle
 00070731    xor         edx,edx
 00070733    mov         dl,bl
 00070735    mov         edx,dword ptr [edx*4+0B4CE8]
 0007073C    call        ListView_Arrange
 00070741    pop         esi
 00070742    pop         ebx
 00070743    ret
*}
end;

//00070744
procedure TCoolBar.UpdateBands;
begin
{*
 00070744    push        ebx
 00070745    push        esi
 00070746    push        edi
 00070747    mov         esi,eax
 00070749    mov         eax,esi
 0007074B    call        TWinControl.HandleAllocated
 00070750    test        al,al
>00070752    je          0007077F
 00070754    cmp         byte ptr ds:[0B6850],0;gvar_000B6850
>0007075B    jne         0007077F
 0007075D    mov         eax,dword ptr [esi+218]
 00070763    call        TCollection.GetCount
 00070768    mov         ebx,eax
 0007076A    dec         ebx
 0007076B    test        ebx,ebx
>0007076D    jl          0007077F
 0007076F    inc         ebx
 00070770    xor         edi,edi
 00070772    mov         edx,edi
 00070774    mov         eax,esi
 00070776    call        TCoolBar.UpdateBand
 0007077B    inc         edi
 0007077C    dec         ebx
>0007077D    jne         00070772
 0007077F    pop         edi
 00070780    pop         esi
 00070781    pop         ebx
 00070782    ret
*}
end;

//00070784
procedure TCoolBar.UpdateBand(Index:Integer);
begin
{*
 00070784    push        ebx
 00070785    push        esi
 00070786    push        edi
 00070787    add         esp,0FFFFFFDC
 0007078A    mov         ebx,edx
 0007078C    mov         edi,eax
 0007078E    mov         eax,edi
 00070790    call        TWinControl.HandleAllocated
 00070795    test        al,al
>00070797    je          0007089B
 0007079D    mov         edx,ebx
 0007079F    mov         eax,dword ptr [edi+218]
 000707A5    call        THeaderSections.GetItem
 000707AA    mov         esi,eax
 000707AC    mov         dword ptr [esp+1],15
 000707B4    mov         eax,dword ptr [esi+1C]
 000707B7    mov         dword ptr [esp+19],eax
 000707BB    mov         eax,dword ptr [esi+10]
 000707BE    call        @LStrToPChar
 000707C3    mov         dword ptr [esp+0D],eax
 000707C7    mov         al,byte ptr [esi+0C]
 000707CA    mov         byte ptr [esp],al
 000707CD    mov         eax,esi
 000707CF    call        TCollectionItem.GetIndex
 000707D4    test        eax,eax
>000707D6    je          000707FE
 000707D8    mov         eax,edi
 000707DA    mov         bx,0FFCF
 000707DE    call        @CallDynaInst
 000707E3    and         eax,7F
 000707E6    lea         eax,[eax+eax*2]
 000707E9    lea         eax,[eax*4+0B4D00]
 000707F0    xor         edx,edx
 000707F2    mov         dl,byte ptr [esp]
 000707F5    mov         eax,dword ptr [eax+edx*4]
 000707F8    mov         dword ptr [esp+5],eax
>000707FC    jmp         00070804
 000707FE    xor         eax,eax
 00070800    mov         dword ptr [esp+5],eax
 00070804    cmp         dword ptr [esi+1C],0FFFFFFFF
>00070808    je          0007081C
 0007080A    mov         eax,dword ptr [esp+5]
 0007080E    or          eax,800
 00070813    or          eax,8000
 00070818    mov         dword ptr [esp+5],eax
 0007081C    mov         eax,dword ptr [esi+24]
 0007081F    cmp         eax,0FFFFFFFF
>00070822    jle         00070848
 00070824    or          dword ptr [esp+1],2
 00070829    mov         dword ptr [esp+9],eax
 0007082D    mov         eax,esi
 0007082F    call        TCollectionItem.GetIndex
 00070834    push        eax
 00070835    mov         eax,edi
 00070837    call        TWinControl.GetHandle
 0007083C    lea         ecx,[esp+5]
 00070840    pop         edx
 00070841    call        ListView_SetColumn
>00070846    jmp         0007089B
 00070848    mov         eax,esi
 0007084A    call        TCollectionItem.GetIndex
 0007084F    push        eax
 00070850    mov         eax,edi
 00070852    call        TWinControl.GetHandle
 00070857    lea         ecx,[esp+5]
 0007085B    pop         edx
 0007085C    call        ListView_SetColumn
 00070861    mov         al,byte ptr [edi+1F1]
 00070867    cmp         al,2
>00070869    jne         0007087F
 0007086B    mov         eax,edi
 0007086D    call        TWinControl.GetHandle
 00070872    mov         ecx,dword ptr [esi+24]
 00070875    or          edx,0FFFFFFFF
 00070878    call        ListView_SetColumnWidth
>0007087D    jmp         0007089B
 0007087F    cmp         al,3
>00070881    jne         0007089B
 00070883    mov         eax,esi
 00070885    call        TCollectionItem.GetIndex
 0007088A    push        eax
 0007088B    mov         eax,edi
 0007088D    call        TWinControl.GetHandle
 00070892    mov         ecx,dword ptr [esi+24]
 00070895    pop         edx
 00070896    call        ListView_SetColumnWidth
 0007089B    add         esp,24
 0007089E    pop         edi
 0007089F    pop         esi
 000708A0    pop         ebx
 000708A1    ret
*}
end;

//000708A4
procedure TCustomListView.WMRButtonDown(var Message:TWMRButtonDown);
begin
{*
 000708A4    push        ebx
 000708A5    add         esp,0FFFFFFEC
 000708A8    mov         ebx,eax
 000708AA    mov         byte ptr [ebx+20D],0
 000708B1    mov         eax,ebx
 000708B3    call        TControl.WMRButtonDown
 000708B8    cmp         byte ptr [ebx+20D],0
>000708BF    je          000708FF
 000708C1    push        esp
 000708C2    call        user32.GetCursorPos
 000708C7    lea         ecx,[esp+0C]
 000708CB    mov         edx,esp
 000708CD    mov         eax,ebx
 000708CF    call        TControl.ScreenToClient
 000708D4    lea         eax,[esp+0C]
 000708D8    call        PointToSmallPoint
 000708DD    mov         dword ptr [esp+8],eax
 000708E1    mov         dx,word ptr [esp+0A]
 000708E6    mov         ax,word ptr [esp+8]
 000708EB    call        MakeLong
 000708F0    push        eax
 000708F1    xor         ecx,ecx
 000708F3    mov         edx,205
 000708F8    mov         eax,ebx
 000708FA    call        TControl.Perform
 000708FF    add         esp,14
 00070902    pop         ebx
 00070903    ret
*}
end;

//00070904
procedure TCustomListView.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 00070904    push        ebx
 00070905    push        esi
 00070906    push        edi
 00070907    push        ebp
 00070908    add         esp,0FFFFFFEC
 0007090B    mov         edi,edx
 0007090D    mov         esi,eax
 0007090F    mov         eax,esi
 00070911    mov         edx,dword ptr [eax]
 00070913    call        dword ptr [edx+0B4]
 00070919    mov         ax,word ptr [edi+4]
 0007091D    call        KeysToShiftState
 00070922    mov         ebx,eax
 00070924    mov         byte ptr [esi+20C],0
 0007092B    mov         dword ptr [esi+248],0FFFFFFFF
 00070935    mov         edx,edi
 00070937    mov         eax,esi
 00070939    call        TControl.WMLButtonDown
 0007093E    cmp         byte ptr [esi+4D],1
>00070942    jne         00070996
 00070944    cmp         byte ptr [esi+204],0
>0007094B    je          00070996
 0007094D    test        bl,1
>00070950    jne         00070996
 00070952    test        bl,4
>00070955    jne         00070996
 00070957    cmp         byte ptr [esi+20C],0
>0007095E    jne         00070996
 00070960    movsx       ecx,word ptr [edi+0A]
 00070964    movsx       edx,word ptr [edi+8]
 00070968    mov         eax,esi
 0007096A    call        TCustomListView.GetItemAt
 0007096F    mov         ebp,eax
 00070971    test        ebp,ebp
>00070973    je          00070996
 00070975    mov         edx,3
 0007097A    mov         eax,ebp
 0007097C    call        TListItem.GetState
 00070981    test        al,al
>00070983    je          00070996
 00070985    or          ecx,0FFFFFFFF
 00070988    xor         edx,edx
 0007098A    mov         eax,esi
 0007098C    call        TControl.BeginDrag
>00070991    jmp         00070A58
 00070996    cmp         byte ptr [esi+20C],0
>0007099D    je          00070A0E
 0007099F    push        esp
 000709A0    call        user32.GetCursorPos
 000709A5    lea         ecx,[esp+0C]
 000709A9    mov         edx,esp
 000709AB    mov         eax,esi
 000709AD    call        TControl.ScreenToClient
 000709B2    lea         eax,[esp+0C]
 000709B6    call        PointToSmallPoint
 000709BB    mov         dword ptr [esp+8],eax
 000709BF    mov         eax,esi
 000709C1    call        TControl.Dragging
 000709C6    test        al,al
>000709C8    jne         000709EA
 000709CA    mov         dx,word ptr [esp+0A]
 000709CF    mov         ax,word ptr [esp+8]
 000709D4    call        MakeLong
 000709D9    push        eax
 000709DA    xor         ecx,ecx
 000709DC    mov         edx,202
 000709E1    mov         eax,esi
 000709E3    call        TControl.Perform
>000709E8    jmp         00070A58
 000709EA    mov         dx,word ptr [esp+0A]
 000709EF    mov         ax,word ptr [esp+8]
 000709F4    call        MakeLong
 000709F9    push        eax
 000709FA    push        0
 000709FC    push        202
 00070A01    call        user32.GetCapture
 00070A06    push        eax
 00070A07    call        user32.SendMessageA
>00070A0C    jmp         00070A58
 00070A0E    cmp         byte ptr [esi+4D],1
>00070A12    jne         00070A58
 00070A14    cmp         byte ptr [esi+204],0
>00070A1B    je          00070A27
 00070A1D    test        bl,1
>00070A20    jne         00070A58
 00070A22    test        bl,4
>00070A25    jne         00070A58
 00070A27    movsx       ecx,word ptr [edi+0A]
 00070A2B    movsx       edx,word ptr [edi+8]
 00070A2F    mov         eax,esi
 00070A31    call        TCustomListView.GetItemAt
 00070A36    mov         ebp,eax
 00070A38    test        ebp,ebp
>00070A3A    je          00070A58
 00070A3C    mov         edx,3
 00070A41    mov         eax,ebp
 00070A43    call        TListItem.GetState
 00070A48    test        al,al
>00070A4A    je          00070A58
 00070A4C    or          ecx,0FFFFFFFF
 00070A4F    xor         edx,edx
 00070A51    mov         eax,esi
 00070A53    call        TControl.BeginDrag
 00070A58    add         esp,14
 00070A5B    pop         ebp
 00070A5C    pop         edi
 00070A5D    pop         esi
 00070A5E    pop         ebx
 00070A5F    ret
*}
end;

//00070A60
procedure TCustomListView.DoAutoSize;
begin
{*
 00070A60    push        ebp
 00070A61    mov         ebp,esp
 00070A63    add         esp,0FFFFFFEC
 00070A66    push        ebx
 00070A67    push        esi
 00070A68    push        edi
 00070A69    mov         dword ptr [ebp-4],eax
 00070A6C    mov         dl,1
 00070A6E    mov         eax,[0001EEC4];TList
 00070A73    call        TObject.Create
 00070A78    mov         dword ptr [ebp-14],eax
 00070A7B    xor         edx,edx
 00070A7D    push        ebp
 00070A7E    push        70BE4
 00070A83    push        dword ptr fs:[edx]
 00070A86    mov         dword ptr fs:[edx],esp
 00070A89    mov         eax,dword ptr [ebp-4]
 00070A8C    call        TControl.GetClientWidth
 00070A91    mov         dword ptr [ebp-0C],eax
 00070A94    mov         eax,dword ptr [ebp-4]
 00070A97    mov         eax,dword ptr [eax+218]
 00070A9D    call        TCollection.GetCount
 00070AA2    mov         edi,eax
 00070AA4    dec         edi
 00070AA5    test        edi,edi
>00070AA7    jl          00070ADE
 00070AA9    inc         edi
 00070AAA    xor         ebx,ebx
 00070AAC    mov         eax,dword ptr [ebp-4]
 00070AAF    mov         eax,dword ptr [eax+218]
 00070AB5    mov         edx,ebx
 00070AB7    call        THeaderSections.GetItem
 00070ABC    mov         esi,eax
 00070ABE    cmp         byte ptr [esi+0D],0
>00070AC2    je          00070AD0
 00070AC4    mov         edx,esi
 00070AC6    mov         eax,dword ptr [ebp-14]
 00070AC9    call        TList.Add
>00070ACE    jmp         00070ADA
 00070AD0    mov         eax,esi
 00070AD2    call        TListColumn.GetWidth
 00070AD7    sub         dword ptr [ebp-0C],eax
 00070ADA    inc         ebx
 00070ADB    dec         edi
>00070ADC    jne         00070AAC
 00070ADE    mov         eax,dword ptr [ebp-14]
 00070AE1    cmp         dword ptr [eax+8],0
>00070AE5    jle         00070BCE
 00070AEB    mov         eax,dword ptr [ebp-4]
 00070AEE    mov         eax,dword ptr [eax+218]
 00070AF4    mov         edx,dword ptr [eax]
 00070AF6    call        dword ptr [edx+14]
 00070AF9    xor         edx,edx
 00070AFB    push        ebp
 00070AFC    push        70BC7
 00070B01    push        dword ptr fs:[edx]
 00070B04    mov         dword ptr fs:[edx],esp
 00070B07    mov         eax,dword ptr [ebp-14]
 00070B0A    mov         eax,dword ptr [eax+8]
 00070B0D    mov         dword ptr [ebp-8],eax
 00070B10    mov         eax,dword ptr [ebp-0C]
 00070B13    cdq
 00070B14    idiv        eax,dword ptr [ebp-8]
 00070B17    mov         dword ptr [ebp-10],edx
 00070B1A    mov         eax,dword ptr [ebp-0C]
 00070B1D    cdq
 00070B1E    idiv        eax,dword ptr [ebp-8]
 00070B21    mov         edi,eax
 00070B23    mov         ebx,dword ptr [ebp-8]
 00070B26    dec         ebx
 00070B27    cmp         ebx,0
>00070B2A    jl          00070B4E
 00070B2C    mov         edx,ebx
 00070B2E    mov         eax,dword ptr [ebp-14]
 00070B31    call        TList.Get
 00070B36    mov         esi,eax
 00070B38    test        ebx,ebx
>00070B3A    jne         00070B3F
 00070B3C    add         edi,dword ptr [ebp-10]
 00070B3F    mov         edx,edi
 00070B41    mov         eax,esi
 00070B43    call        TListColumn.SetWidth
 00070B48    dec         ebx
 00070B49    cmp         ebx,0FFFFFFFF
>00070B4C    jne         00070B2C
 00070B4E    mov         eax,dword ptr [ebp-0C]
 00070B51    cdq
 00070B52    idiv        eax,dword ptr [ebp-8]
 00070B55    mov         edi,eax
 00070B57    mov         ebx,dword ptr [ebp-8]
 00070B5A    dec         ebx
 00070B5B    cmp         ebx,0
>00070B5E    jl          00070B98
 00070B60    mov         edx,ebx
 00070B62    mov         eax,dword ptr [ebp-14]
 00070B65    call        TList.Get
 00070B6A    mov         esi,eax
 00070B6C    test        ebx,ebx
>00070B6E    jne         00070B73
 00070B70    add         edi,dword ptr [ebp-10]
 00070B73    mov         eax,esi
 00070B75    call        TListColumn.GetWidth
 00070B7A    cmp         edi,eax
>00070B7C    je          00070B92
 00070B7E    mov         edx,ebx
 00070B80    mov         eax,dword ptr [ebp-14]
 00070B83    call        TList.Delete
 00070B88    mov         eax,esi
 00070B8A    call        TListColumn.GetWidth
 00070B8F    sub         dword ptr [ebp-0C],eax
 00070B92    dec         ebx
 00070B93    cmp         ebx,0FFFFFFFF
>00070B96    jne         00070B60
 00070B98    mov         eax,dword ptr [ebp-14]
 00070B9B    mov         eax,dword ptr [eax+8]
 00070B9E    test        eax,eax
>00070BA0    je          00070BAB
 00070BA2    cmp         eax,dword ptr [ebp-8]
>00070BA5    jne         00070B07
 00070BAB    xor         eax,eax
 00070BAD    pop         edx
 00070BAE    pop         ecx
 00070BAF    pop         ecx
 00070BB0    mov         dword ptr fs:[eax],edx
 00070BB3    push        70BCE
 00070BB8    mov         eax,dword ptr [ebp-4]
 00070BBB    mov         eax,dword ptr [eax+218]
 00070BC1    mov         edx,dword ptr [eax]
 00070BC3    call        dword ptr [edx+18]
 00070BC6    ret
>00070BC7    jmp         @HandleFinally
>00070BCC    jmp         00070BB8
 00070BCE    xor         eax,eax
 00070BD0    pop         edx
 00070BD1    pop         ecx
 00070BD2    pop         ecx
 00070BD3    mov         dword ptr fs:[eax],edx
 00070BD6    push        70BEB
 00070BDB    mov         eax,dword ptr [ebp-14]
 00070BDE    call        TObject.Free
 00070BE3    ret
>00070BE4    jmp         @HandleFinally
>00070BE9    jmp         00070BDB
 00070BEB    pop         edi
 00070BEC    pop         esi
 00070BED    pop         ebx
 00070BEE    mov         esp,ebp
 00070BF0    pop         ebp
 00070BF1    ret
*}
end;

//00070BF4
procedure TCustomListView.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 00070BF4    push        ebx
 00070BF5    push        esi
 00070BF6    mov         esi,edx
 00070BF8    mov         ebx,eax
 00070BFA    test        byte ptr [ebx+20],2
>00070BFE    jne         00070C1B
 00070C00    mov         eax,dword ptr [esi+8]
 00070C03    test        byte ptr [eax+18],1
>00070C07    jne         00070C1B
 00070C09    mov         eax,ebx
 00070C0B    call        TWinControl.HandleAllocated
 00070C10    test        al,al
>00070C12    je          00070C1B
 00070C14    mov         eax,ebx
 00070C16    call        TCustomListView.DoAutoSize
 00070C1B    mov         edx,esi
 00070C1D    mov         eax,ebx
 00070C1F    call        TWinControl.WMWindowPosChanged
 00070C24    pop         esi
 00070C25    pop         ebx
 00070C26    ret
*}
end;

//00070C28
procedure TCustomListView.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 00070C28    push        ebx
 00070C29    push        esi
 00070C2A    push        edi
 00070C2B    push        ebp
 00070C2C    add         esp,0FFFFFFF8
 00070C2F    mov         edi,edx
 00070C31    mov         ebx,eax
 00070C33    mov         esi,dword ptr [edi+8]
 00070C36    mov         al,byte ptr [esi+10]
 00070C39    mov         byte ptr [esp],al
 00070C3C    mov         eax,dword ptr [esi+18]
 00070C3F    push        eax
 00070C40    call        gdi32.SaveDC
 00070C45    mov         dword ptr [esp+4],eax
 00070C49    mov         edx,dword ptr [esi+18]
 00070C4C    mov         eax,dword ptr [ebx+1EC]
 00070C52    call        TCanvas.SetHandle
 00070C57    mov         edx,dword ptr [ebx+58]
 00070C5A    mov         eax,dword ptr [ebx+1EC]
 00070C60    call        TCanvas.SetFont
 00070C65    mov         edx,dword ptr [ebx+124]
 00070C6B    mov         eax,dword ptr [ebx+1EC]
 00070C71    call        TCanvas.SetBrush
 00070C76    mov         ebp,dword ptr [esi+8]
 00070C79    cmp         ebp,0FFFFFFFF
>00070C7C    jne         00070C8E
 00070C7E    lea         edx,[esi+1C]
 00070C81    mov         eax,dword ptr [ebx+1EC]
 00070C87    call        TCanvas.FillRect
>00070C8C    jmp         00070CAE
 00070C8E    mov         al,byte ptr [esp]
 00070C91    push        eax
 00070C92    mov         edx,ebp
 00070C94    mov         eax,dword ptr [ebx+208]
 00070C9A    call        TListItems.GetItem
 00070C9F    mov         edx,eax
 00070CA1    lea         ecx,[esi+1C]
 00070CA4    mov         eax,ebx
 00070CA6    mov         ebp,dword ptr [eax]
 00070CA8    call        dword ptr [ebp+0C8]
 00070CAE    xor         edx,edx
 00070CB0    mov         eax,dword ptr [ebx+1EC]
 00070CB6    call        TCanvas.SetHandle
 00070CBB    mov         eax,dword ptr [esp+4]
 00070CBF    push        eax
 00070CC0    mov         eax,dword ptr [esi+18]
 00070CC3    push        eax
 00070CC4    call        gdi32.RestoreDC
 00070CC9    mov         dword ptr [edi+0C],1
 00070CD0    pop         ecx
 00070CD1    pop         edx
 00070CD2    pop         ebp
 00070CD3    pop         edi
 00070CD4    pop         esi
 00070CD5    pop         ebx
 00070CD6    ret
*}
end;

//00070CD8
procedure TCustomListView.CanvasChanged(Sender:TObject);
begin
{*
 00070CD8    mov         byte ptr [eax+266],1
 00070CDF    ret
*}
end;

//00070CE0
function TCustomListView.IsCustomDrawn(Target:TCustomDrawTarget; Stage:TCustomDrawStage):Boolean;
begin
{*
 00070CE0    test        cl,cl
>00070CE2    jne         00070D14
 00070CE4    cmp         dl,2
>00070CE7    jne         00070CF6
 00070CE9    cmp         word ptr [eax+296],0
 00070CF1    setne       al
>00070CF4    jmp         00070D16
 00070CF6    cmp         dl,1
>00070CF9    jne         00070D08
 00070CFB    cmp         word ptr [eax+28E],0
 00070D03    setne       al
>00070D06    jmp         00070D16
 00070D08    cmp         word ptr [eax+286],0
 00070D10    setne       al
 00070D13    ret
 00070D14    xor         eax,eax
 00070D16    ret
*}
end;

//00070D18
function TCustomListView.CustomDraw(const ARect:TRect; Stage:TCustomDrawStage):Boolean;
begin
{*
 00070D18    push        ebx
 00070D19    push        ecx
 00070D1A    mov         byte ptr [esp],1
 00070D1E    cmp         word ptr [eax+286],0
>00070D26    je          00070D3B
 00070D28    push        esp
 00070D29    mov         ecx,edx
 00070D2B    mov         ebx,eax
 00070D2D    mov         edx,eax
 00070D2F    mov         eax,dword ptr [ebx+288]
 00070D35    call        dword ptr [ebx+284]
 00070D3B    mov         al,byte ptr [esp]
 00070D3E    pop         edx
 00070D3F    pop         ebx
 00070D40    ret
*}
end;

//00070D44
function TCustomListView.CustomDrawItem(Item:TListItem; State:TCustomDrawState; Stage:TCustomDrawStage):Boolean;
begin
{*
 00070D44    push        ebp
 00070D45    mov         ebp,esp
 00070D47    push        ecx
 00070D48    push        ebx
 00070D49    mov         word ptr [ebp-2],cx
 00070D4D    mov         byte ptr [ebp-3],1
 00070D51    cmp         word ptr [eax+28E],0
>00070D59    je          00070D76
 00070D5B    mov         cx,word ptr [ebp-2]
 00070D5F    push        ecx
 00070D60    lea         ecx,[ebp-3]
 00070D63    push        ecx
 00070D64    mov         ebx,eax
 00070D66    mov         ecx,edx
 00070D68    mov         edx,eax
 00070D6A    mov         eax,dword ptr [ebx+290]
 00070D70    call        dword ptr [ebx+28C]
 00070D76    mov         al,byte ptr [ebp-3]
 00070D79    pop         ebx
 00070D7A    pop         ecx
 00070D7B    pop         ebp
 00070D7C    ret         4
*}
end;

//00070D80
function TCustomListView.CustomDrawSubItem(Item:TListItem; SubItem:Integer; State:TCustomDrawState; Stage:TCustomDrawStage):Boolean;
begin
{*
 00070D80    push        ebp
 00070D81    mov         ebp,esp
 00070D83    push        ecx
 00070D84    push        ebx
 00070D85    mov         byte ptr [ebp-1],1
 00070D89    cmp         word ptr [eax+296],0
>00070D91    je          00070DAF
 00070D93    push        ecx
 00070D94    mov         cx,word ptr [ebp+0C]
 00070D98    push        ecx
 00070D99    lea         ecx,[ebp-1]
 00070D9C    push        ecx
 00070D9D    mov         ebx,eax
 00070D9F    mov         ecx,edx
 00070DA1    mov         edx,eax
 00070DA3    mov         eax,dword ptr [ebx+298]
 00070DA9    call        dword ptr [ebx+294]
 00070DAF    mov         al,byte ptr [ebp-1]
 00070DB2    pop         ebx
 00070DB3    pop         ecx
 00070DB4    pop         ebp
 00070DB5    ret         8
*}
end;

//00070DB8
procedure TCustomListView.DrawItem(Item:TListItem; Rect:TRect; State:TOwnerDrawState);
begin
{*
 00070DB8    push        ebp
 00070DB9    mov         ebp,esp
 00070DBB    add         esp,0FFFFFFF0
 00070DBE    push        ebx
 00070DBF    push        esi
 00070DC0    push        edi
 00070DC1    mov         esi,ecx
 00070DC3    lea         edi,[ebp-10]
 00070DC6    mov         ecx,4
 00070DCB    rep movs    dword ptr [edi],dword ptr [esi]
 00070DCD    mov         esi,edx
 00070DCF    mov         ebx,eax
 00070DD1    mov         eax,dword ptr [ebx+1EC]
 00070DD7    call        TControlCanvas.UpdateTextFlags
 00070DDC    cmp         word ptr [ebx+2C6],0
>00070DE4    je          00070E00
 00070DE6    lea         eax,[ebp-10]
 00070DE9    push        eax
 00070DEA    mov         al,byte ptr [ebp+8]
 00070DED    push        eax
 00070DEE    mov         ecx,esi
 00070DF0    mov         edx,ebx
 00070DF2    mov         eax,dword ptr [ebx+2C8]
 00070DF8    call        dword ptr [ebx+2C4]
>00070DFE    jmp         00070E26
 00070E00    lea         edx,[ebp-10]
 00070E03    mov         eax,dword ptr [ebx+1EC]
 00070E09    call        TCanvas.FillRect
 00070E0E    mov         eax,dword ptr [esi+24]
 00070E11    push        eax
 00070E12    mov         edx,dword ptr [ebp-10]
 00070E15    add         edx,2
 00070E18    mov         ecx,dword ptr [ebp-0C]
 00070E1B    mov         eax,dword ptr [ebx+1EC]
 00070E21    call        TCanvas.TextOut
 00070E26    pop         edi
 00070E27    pop         esi
 00070E28    pop         ebx
 00070E29    mov         esp,ebp
 00070E2B    pop         ebp
 00070E2C    ret         4
*}
end;

Initialization
Finalization
//00070E30
{*
 00070E30    push        ebp
 00070E31    mov         ebp,esp
 00070E33    xor         eax,eax
 00070E35    push        ebp
 00070E36    push        70E8B
 00070E3B    push        dword ptr fs:[eax]
 00070E3E    mov         dword ptr fs:[eax],esp
 00070E41    inc         dword ptr ds:[0B6848]
>00070E47    jne         00070E7D
 00070E49    cmp         dword ptr ds:[0B684C],0
>00070E50    je          00070E5D
 00070E52    mov         eax,[000B684C]
 00070E57    push        eax
 00070E58    call        kernel32.FreeLibrary
 00070E5D    mov         eax,0B4C08
 00070E62    mov         edx,dword ptr ds:[67D14];TConversionFormat
 00070E68    call        @FinalizeRecord
 00070E6D    mov         eax,0B4BFC
 00070E72    mov         edx,dword ptr ds:[67D14];TConversionFormat
 00070E78    call        @FinalizeRecord
 00070E7D    xor         eax,eax
 00070E7F    pop         edx
 00070E80    pop         ecx
 00070E81    pop         ecx
 00070E82    mov         dword ptr fs:[eax],edx
 00070E85    push        70E92
 00070E8A    ret
>00070E8B    jmp         @HandleFinally
>00070E90    jmp         00070E8A
 00070E92    pop         ebp
 00070E93    ret
*}
end.