//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit StdCtrls;

interface

uses
  SysUtils, Classes, Controls, Graphics, StdCtrls;

type
  TCustomGroupBox = class(TCustomControl)
  public
    constructor Create(AOwner:TComponent); virtual;//v2C//00038D6C
    procedure AdjustClientRect(var Rect:TRect); virtual;//v88//00038DC8
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00038E24
    procedure Paint; virtual;//vB8//00038E34
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//00039028
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//000390B8
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//000390A4
  end;
  TGroupBox = class(TCustomGroupBox)
  end;
  TTextLayout = (tlTop, tlCenter, tlBottom);
  TCustomLabel = class(TGraphicControl)
  public
    FFocusControl:TWinControl;//f118
    FAlignment:TAlignment;//f11C
    FAutoSize:Boolean;//f11D
    FLayout:TTextLayout;//f11E
    FWordWrap:Boolean;//f11F
    FShowAccelChar:Boolean;//f120
    procedure Loaded; virtual;//vC//000393DC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//000395A4
    constructor Create(AOwner:TComponent); virtual;//v2C//000390E8
    procedure Paint; virtual;//v88//000392D8
    function GetLabelText:AnsiString; virtual;//v8C//00039154
    procedure SetAutoSize(Value:Boolean); virtual;//v90//000394D8
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//00039608
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//000395EC
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//000395D4
    procedure DoDrawText(var Rect:TRect; Flags:Longint); dynamic;//00039168
    procedure AdjustBounds; dynamic;//000393F4
    procedure SetAlignment(Value:TAlignment);//000394C4
    function GetTransparent:Boolean;//000394F4
    procedure SetFocusControl(Value:TWinControl);//00039500
    procedure SetShowAccelChar(Value:Boolean);//00039514
    procedure SetTransparent(Value:Boolean);//00039528
    procedure SetLayout(Value:TTextLayout);//00039568
    procedure SetWordWrap(Value:Boolean);//0003957C
  end;
  TLabel = class(TCustomLabel)
  end;
  TEditCharCase = (ecNormal, ecUpperCase, ecLowerCase);
  TCustomEdit = class(TWinControl)
  public
    FMaxLength:Integer;//f1EC
    FBorderStyle:TBorderStyle;//f1F0
    FPasswordChar:Char;//f1F1
    FReadOnly:Boolean;//f1F2
    FAutoSize:Boolean;//f1F3
    FAutoSelect:Boolean;//f1F4
    FHideSelection:Boolean;//f1F5
    FOEMConvert:Boolean;//f1F6
    FCharCase:TEditCharCase;//f1F7
    FCreating:Boolean;//f1F8
    FModified:Boolean;//f1F9
    FOnChange:TNotifyEvent;//f1FC
    procedure DefaultHandler(var Message:void ); virtual;//00039EBC
    constructor Create(AOwner:TComponent); virtual;//v2C//0003969C
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00039BC8
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v98//00039C84
    procedure CreateWnd; virtual;//v9C//00039CF4
    procedure DestroyWnd; virtual;//vA4//00039D98
    procedure DoSetMaxLength(Value:Integer); virtual;//vB8//00039744
    function GetSelLength:Integer; virtual;//vBC//00039980
    function GetSelStart:Integer; virtual;//vC0//0003993C
    function GetSelText:AnsiString; virtual;//vC4//00039B04
    procedure SetSelLength(Value:Integer); virtual;//vC8//000399B0
    procedure SetSelStart(Value:Integer); virtual;//vCC//00039960
    procedure Clear; virtual;//vD0//00039A14
    function GetSelTextBuf(Buffer:PChar; BufSize:Integer):Integer; virtual;//vD4//00039A68
    procedure WMSetFont(var Message:TWMSetFont); message WM_SETFONT;//00039F08
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00039F7C
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//00039F48
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//0003A000
    procedure CMEnter(var Message:TCMGotFocus); message CM_ENTER;//00039FC4
    procedure CNCommand(var Message:TWMCommand); dynamic;//00039FA4
    procedure Change; dynamic;//00039E98
    procedure SetAutoSize(Value:Boolean);//00039764
    procedure SetBorderStyle(Value:TBorderStyle);//00039778
    procedure SetCharCase(Value:TEditCharCase);//0003979C
    procedure SetMaxLength(Value:Integer);//000397C4
    procedure SetOEMConvert(Value:Boolean);//000397F4
    function GetModified:Boolean;//00039808
    procedure SetModified(Value:Boolean);//00039840
    procedure SetPasswordChar(Value:Char);//00039878
    procedure SetReadOnly(Value:Boolean);//00039900
    procedure CopyToClipboard;//00039A30
    procedure SelectAll;//00039A4C
    procedure SetSelText(const Value:AnsiString);//00039BA0
    procedure UpdateHeight;//00039DB4
    procedure AdjustHeight;//00039DF0
    procedure SetHideSelection(Value:Boolean);//0003AC24
  end;
  TEdit = class(TCustomEdit)
  end;
  TScrollStyle = (ssNone, ssHorizontal, ssVertical, ssBoth);
  TCustomMemo = class(TCustomEdit)
  public
    FLines:TStrings;//f204
    FAlignment:TAlignment;//f208
    FScrollBars:TScrollStyle;//f209
    FWordWrap:Boolean;//f20A
    FWantReturns:Boolean;//f20B
    FWantTabs:Boolean;//f20C
    destructor Destroy; virtual;//0003A4BC
    procedure Loaded; virtual;//vC//0003A68C
    constructor Create(AOwner:TComponent); virtual;//v2C//0003A438
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0003A4EC
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v98//0003A550
    function GetCaretPos:TPoint; virtual;//vD8//0003A628
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//0003A724
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//0003A6F0
    procedure KeyPress(var Key:Char); dynamic;//0003A72C
    procedure sub_0003A684; dynamic;//0003A684
    procedure SetAlignment(Value:TAlignment);//0003A6A4
    procedure SetLines(Value:TStrings);//0003A6B8
    procedure SetScrollBars(Value:TScrollStyle);//0003A6C8
    procedure SetWordWrap(Value:Boolean);//0003A6DC
  end;
  TMemo = class(TCustomMemo)
  end;
  TComboBoxStyle = (csDropDown, csSimple, csDropDownList, csOwnerDrawFixed, csOwnerDrawVariable);
  TDrawItemEvent = procedure(Control:TWinControl; Index:Integer; Rect:TRect; State:TOwnerDrawState) of object;;
  TMeasureItemEvent = procedure(Control:TWinControl; Index:Integer; var Height:Integer) of object;;
  TCustomComboBox = class(TWinControl)
  public
    FItems:TStrings;//f1EC
    FCanvas:TCanvas;//f1F0
    FCharCase:TEditCharCase;//f1F4
    FSorted:Boolean;//f1F5
    FStyle:TComboBoxStyle;//f1F6
    FItemHeight:Integer;//f1F8
    FMaxLength:Integer;//f1FC
    FDropDownCount:Integer;//f200
    FEditHandle:HWND;//f204
    FListHandle:HWND;//f208
    FEditInstance:Pointer;//f20C
    FListInstance:Pointer;//f210
    FDefEditProc:Pointer;//f214
    FDefListProc:Pointer;//f218
    FIsFocused:Boolean;//f21C
    FFocusChanged:Boolean;//f21D
    FSaveItems:TStringList;//f220
    FSaveIndex:Integer;//f224
    FDroppingDown:Boolean;//f228
    FOnChange:TNotifyEvent;//f22C
    FOnDropDown:TNotifyEvent;//f234
    FOnDrawItem:TDrawItemEvent;//f23C
    FOnMeasureItem:TMeasureItemEvent;//f244
    destructor Destroy; virtual;//0003AAE0
    constructor Create(AOwner:TComponent); virtual;//v2C//0003A9E4
    procedure WndProc(var Message:TMessage); virtual;//v70//0003B3E0
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0003ACB8
    procedure CreateWnd; virtual;//v9C//0003AD1C
    procedure DestroyWnd; virtual;//vA4//0003AE80
    procedure ComboWndProc(var Message:TMessage; ComboWnd:HWND; ComboProc:Pointer); virtual;//vB8//0003B104
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState); virtual;//vBC//0003B758
    procedure vC0; virtual;//vC0//0003B0FC
    procedure MeasureItem(Index:Integer; var Height:Integer); virtual;//vC4//0003B830
    procedure SetStyle(Value:TComboBoxStyle); virtual;//vC8//0003AC38
    procedure WMCreate(var Message:TWMCreate); message WM_CREATE;//0003AECC
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//0003AEF0
    procedure WMDrawItem(var Message:TWMDrawItem); message WM_DRAWITEM;//0003AF44
    procedure WMMeasureItem(var Message:TWMMeasureItem); message WM_MEASUREITEM;//0003AF4C
    procedure WMDeleteItem(var Message:TWMDeleteItem); message WM_DELETEITEM;//0003AF54
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//0003AF5C
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//0003B940
    procedure CMCancelMode(var Message:TCMCancelMode); message CM_CANCELMODE;//0003AF80
    procedure CMParentColorChanged(var Message:TMessage); message CM_PARENTCOLORCHANGED;//0003AFB8
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0003AF94
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//0003B850
    procedure CNMeasureItem(var Message:TWMMeasureItem); dynamic;//0003B910
    procedure CNCommand(var Message:TWMCommand); dynamic;//0003B5E8
    procedure DropDown; dynamic;//0003B810
    procedure Change; dynamic;//0003B734
    procedure Focused; dynamic;//0003B9B8
    procedure SetSorted(Value:Boolean);//000397B0
    function GetDroppedDown:Boolean;//0003AB54
    procedure SetDroppedDown(Value:Boolean);//0003AB78
    function GetItemIndex:Integer;//0003AB9C
    procedure SetItemIndex(Value:Integer);//0003ABB8
    procedure SetMaxLength(Value:Integer);//0003ABE4
    function GetItemHeight:Integer;//0003AC78
    procedure SetItemHeight(Value:Integer);//0003AC9C
    procedure SetItems(Value:TStrings);//0003ACA8
    procedure EditWndProc(var Message:TMessage);//0003AFE0
    procedure ListWndProc(var Message:TMessage);//0003B0D8
    procedure AdjustDropDown;//0003B52C
  end;
  TComboBox = class(TCustomComboBox)
  end;
  TButtonActionLink = class(TWinControlActionLink)
  public
    FClient:TButtonControl;//f18
    procedure AssignClient(AClient:TObject); virtual;//v0//0003B9EC
    function IsCheckedLinked:Boolean; virtual;//v20//0003BA10
    procedure SetChecked(Value:Boolean); virtual;//v40//0003BA48
  end;
  TButtonControl = class(TWinControl)
  public
    FClicksDisabled:Boolean;//f1EC
    constructor Create(AOwner:TComponent); virtual;//v2C//0003BAAC
    procedure WndProc(var Message:TMessage); virtual;//v70//0003BB60
    //function vB8:?; virtual;//vB8//0003BB38
    procedure vBC; virtual;//vBC//0003BB5C
    procedure sub_0003BB30; dynamic;//0003BB30
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//0003BAE8
    function IsCheckedStored(Value:Boolean):Boolean;//0003BB3C
  end;
  TButton = class(TButtonControl)
  public
    Default:Boolean;//f1F0
    Cancel:Boolean;//f1F1
    FActive:Boolean;//f1F2
    ModalResult:TModalResult;//f1F4
    constructor Create(AOwner:TComponent); virtual;//v2C//0003BBD8
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0003BCEC
    procedure CreateWnd; virtual;//v9C//0003BD28
    procedure SetButtonStyle(ADefault:Boolean); virtual;//vC0//0003BC64
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//0003BE90
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//0003BD54
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//0003BDBC
    procedure CMFocusChanged(var Message:TCMFocusChanged); message CM_FOCUSCHANGED;//0003BE3C
    procedure CNCommand(var Message:TWMCommand); dynamic;//0003BD40
    procedure UseRightToLeftAlignment; dynamic;//0003BC60
    procedure Click; dynamic;//0003BC3C
    procedure SetDefault(Value:Boolean);//0003BCB8
  end;
  TCheckBoxState = (cbUnchecked, cbChecked, cbGrayed);
  TCustomCheckBox = class(TButtonControl)
  public
    FAlignment:TLeftRight;//f1F0
    FAllowGrayed:Boolean;//f1F1
    FState:TCheckBoxState;//f1F2
    constructor Create(AOwner:TComponent); virtual;//v2C//0003BE98
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0003C008
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v98//0003C090
    procedure CreateWnd; virtual;//v9C//0003C064
    function GetChecked:Boolean; virtual;//vB8//0003BF84
    procedure SetChecked(Value:Boolean); virtual;//vBC//0003BFA4
    procedure Toggle; virtual;//vC0//0003BF30
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//0003C214
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//0003C16C
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0003C164
    procedure CNCommand(var Message:TWMCommand); dynamic;//0003C204
    procedure GetControlsAlignment; dynamic;//0003BF04
    procedure Click; dynamic;//0003BF70
    procedure SetAlignment(Value:TLeftRight);//0003BF90
    procedure SetState(Value:TCheckBoxState);//0003BFB8
  end;
  TCheckBox = class(TCustomCheckBox)
  end;
  TRadioButton = class(TButtonControl)
  public
    Alignment:TLeftRight;//f1F0
    FChecked:Boolean;//f1F1
    constructor Create(AOwner:TComponent); virtual;//v2C//0003C248
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0003C3E0
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v98//0003C464
    procedure CreateWnd; virtual;//v9C//0003C438
    function GetChecked:Boolean; virtual;//vB8//0003C2A8
    procedure SetChecked(Value:Boolean); virtual;//vBC//0003C358
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//0003C5DC
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//0003C52C
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0003C524
    procedure CNCommand(var Message:TWMCommand); dynamic;//0003C5A8
    procedure GetControlsAlignment; dynamic;//0003C2B0
    procedure SetAlignment(Value:TLeftRight);//0003CDB8
  end;
  TListBoxStyle = (lbStandard, lbOwnerDrawFixed, lbOwnerDrawVariable);
  TCustomListBox = class(TWinControl)
  public
    FItems:TStrings;//f1EC
    FBorderStyle:TBorderStyle;//f1F0
    FCanvas:TCanvas;//f1F4
    FColumns:Integer;//f1F8
    FItemHeight:Integer;//f1FC
    FStyle:TListBoxStyle;//f200
    FIntegralHeight:Boolean;//f201
    FMultiSelect:Boolean;//f202
    FSorted:Boolean;//f203
    FExtendedSelect:Boolean;//f204
    FTabWidth:Integer;//f208
    FSaveItems:TStringList;//f20C
    FSaveTopIndex:Integer;//f210
    FSaveItemIndex:Integer;//f214
    FOnDrawItem:TDrawItemEvent;//f218
    FOnMeasureItem:TMeasureItemEvent;//f220
    FMoving:Boolean;//f228
    destructor Destroy; virtual;//0003CA54
    constructor Create(AOwner:TComponent); virtual;//v2C//0003C97C
    procedure WndProc(var Message:TMessage); virtual;//v70//0003D070
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0003CE94
    procedure CreateWnd; virtual;//v9C//0003CF78
    procedure DestroyWnd; virtual;//vA4//0003D018
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState); virtual;//vB8//0003D3B4
    procedure MeasureItem(Index:Integer; var Height:Integer); virtual;//vBC//0003D4C0
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//0003D340
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//0003D310
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//0003D0D8
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//0003D5CC
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//0003D4E0
    procedure CNMeasureItem(var Message:TWMMeasureItem); dynamic;//0003D5A0
    procedure CNCommand(var Message:TWMCommand); dynamic;//0003D174
    procedure DeleteString(Index:Integer); dynamic;//0003CAE0
    procedure ResetContent; dynamic;//0003CB00
    procedure SetItemData(Index:Integer; AData:Longint); dynamic;//0003CABC
    procedure GetItemData(Index:Integer); dynamic;//0003CA9C
    procedure DragCanceled; dynamic;//0003D354
    procedure SetBorderStyle(Value:TBorderStyle);//0003C2DC
    procedure SetColumnWidth;//0003CB1C
    procedure SetColumns(Value:Integer);//0003CB60
    function GetItemIndex:Integer;//0003CBA4
    procedure SetItemIndex(Value:Integer);//0003CBE0
    procedure SetExtendedSelect(Value:Boolean);//0003CC2C
    procedure SetIntegralHeight(Value:Boolean);//0003CC40
    function GetItemHeight:Integer;//0003CC54
    procedure SetItemHeight(Value:Integer);//0003CC98
    procedure SetTabWidth(Value:Integer);//0003CCB0
    procedure SetMultiSelect(Value:Boolean);//0003CCCC
    function GetSelected(Index:Integer):Boolean;//0003CCE0
    procedure SetSorted(Value:Boolean);//0003CD74
    procedure SetStyle(Value:TListBoxStyle);//0003CD88
    function GetTopIndex:Integer;//0003CD9C
    procedure SetTopIndex(Value:Integer);//0003CDCC
    procedure SetItems(Value:TStrings);//0003CDF8
    function ItemAtPos(Pos:TPoint; Existing:Boolean):Integer;//0003CE08
  end;
  TListBox = class(TCustomListBox)
  end;
  TScrollEvent = procedure(Sender:TObject; ScrollCode:TScrollCode; var ScrollPos:Integer) of object;;
  TMemoStrings = class(TStrings)
  public
    Memo:TCustomMemo;//fC
    function Get(Index:Integer):AnsiString; virtual;//vC//0003A09C
    function GetCount:Integer; virtual;//v14//0003A038
    function GetTextStr:AnsiString; virtual;//v1C//0003A350
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//0003A0E0
    procedure SetTextStr(const Value:AnsiString); virtual;//v2C//0003A364
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//0003A300
    procedure Clear; virtual;//v40//0003A2F0
    procedure Delete(Index:Integer); virtual;//v44//0003A260
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//0003A154
  end;
  TComboBoxStrings = class(TStrings)
  public
    ComboBox:TCustomComboBox;//fC
    function Get(Index:Integer):AnsiString; virtual;//vC//0003A76C
    function GetCount:Integer; virtual;//v14//0003A750
    function GetObject(Index:Integer):TObject; virtual;//v18//0003A7B0
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//0003A7D0
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//0003A988
    function Add(const S:AnsiString):Integer; virtual;//v34//0003A7F4
    procedure Clear; virtual;//v40//0003A918
    procedure Delete(Index:Integer); virtual;//v44//0003A8F8
    function IndexOf(const S:AnsiString):Integer; virtual;//v50//0003A9BC
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//0003A878
  end;
  TListBoxStrings = class(TStrings)
  public
    ListBox:TCustomListBox;//fC
    function Get(Index:Integer):AnsiString; virtual;//vC//0003C62C
    function GetCount:Integer; virtual;//v14//0003C610
    function GetObject(Index:Integer):TObject; virtual;//v18//0003C6D0
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//0003C740
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//0003C770
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//0003C8B4
    function Add(const S:AnsiString):Integer; virtual;//v34//0003C78C
    procedure Clear; virtual;//v40//0003C8A4
    procedure Delete(Index:Integer); virtual;//v44//0003C890
    function IndexOf(const S:AnsiString):Integer; virtual;//v50//0003C8E8
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//0003C810
    procedure Move(CurIndex:Integer; NewIndex:Integer); virtual;//v60//0003C910
  end;
    function HasPopup(Control:TControl):Boolean;//00038A6C
    constructor Create(AOwner:TComponent);//00038D6C
    procedure AdjustClientRect(var Rect:TRect);//00038DC8
    procedure CreateParams(var Params:TCreateParams);//00038E24
    procedure Paint;//00038E34
    procedure CMDialogChar(var Message:TCMDialogChar);//00039028
    procedure CMTextChanged(var Message:TMessage);//000390A4
    procedure CMCtl3DChanged(var Message:TMessage);//000390B8
    procedure WMSize(var Message:TMessage);//000390D4
    constructor Create(AOwner:TComponent);//000390E8
    function GetLabelText:AnsiString;//00039154
    procedure DoDrawText(var Rect:TRect; Flags:Longint);//00039168
    procedure Paint;//000392D8
    procedure Loaded;//000393DC
    procedure AdjustBounds;//000393F4
    procedure SetAutoSize(Value:Boolean);//000394D8
    procedure Notification(AComponent:TComponent; Operation:TOperation);//000395A4
    procedure CMTextChanged(var Message:TMessage);//000395D4
    procedure CMFontChanged(var Message:TMessage);//000395EC
    procedure CMDialogChar(var Message:TCMDialogChar);//00039608
    constructor Create(AOwner:TComponent);//0003969C
    procedure DoSetMaxLength(Value:Integer);//00039744
    function GetSelStart:Integer;//0003993C
    procedure SetSelStart(Value:Integer);//00039960
    function GetSelLength:Integer;//00039980
    procedure SetSelLength(Value:Integer);//000399B0
    procedure Clear;//00039A14
    function GetSelTextBuf(Buffer:PChar; BufSize:Integer):Integer;//00039A68
    function GetSelText:AnsiString;//00039B04
    procedure CreateParams(var Params:TCreateParams);//00039BC8
    procedure CreateWindowHandle(const Params:TCreateParams);//00039C84
    procedure CreateWnd;//00039CF4
    procedure DestroyWnd;//00039D98
    procedure Change;//00039E98
    procedure DefaultHandler(var Message:void );//00039EBC
    procedure WMSetFont(var Message:TWMSetFont);//00039F08
    procedure CMCtl3DChanged(var Message:TMessage);//00039F48
    procedure CMFontChanged(var Message:TMessage);//00039F7C
    procedure CNCommand(var Message:TWMCommand);//00039FA4
    procedure CMEnter(var Message:TCMGotFocus);//00039FC4
    procedure CMTextChanged(var Message:TMessage);//0003A000
    function GetCount:Integer;//0003A038
    function Get(Index:Integer):AnsiString;//0003A09C
    procedure Put(Index:Integer; const S:AnsiString);//0003A0E0
    procedure Insert(Index:Integer; const S:AnsiString);//0003A154
    procedure Delete(Index:Integer);//0003A260
    procedure Clear;//0003A2F0
    procedure SetUpdateState(Updating:Boolean);//0003A300
    function GetTextStr:AnsiString;//0003A350
    procedure SetTextStr(const Value:AnsiString);//0003A364
    constructor Create(AOwner:TComponent);//0003A438
    destructor Destroy;//0003A4BC
    procedure CreateParams(var Params:TCreateParams);//0003A4EC
    procedure CreateWindowHandle(const Params:TCreateParams);//0003A550
    function GetCaretPos:TPoint;//0003A628
    procedure sub_0003A684;//0003A684
    procedure Loaded;//0003A68C
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//0003A6F0
    procedure WMNCDestroy(var Message:TWMNCDestroy);//0003A724
    procedure KeyPress(var Key:Char);//0003A72C
    function GetCount:Integer;//0003A750
    function Get(Index:Integer):AnsiString;//0003A76C
    function GetObject(Index:Integer):TObject;//0003A7B0
    procedure PutObject(Index:Integer; AObject:TObject);//0003A7D0
    function Add(const S:AnsiString):Integer;//0003A7F4
    procedure Insert(Index:Integer; const S:AnsiString);//0003A878
    procedure Delete(Index:Integer);//0003A8F8
    procedure Clear;//0003A918
    procedure SetUpdateState(Updating:Boolean);//0003A988
    function IndexOf(const S:AnsiString):Integer;//0003A9BC
    constructor Create(AOwner:TComponent);//0003A9E4
    destructor Destroy;//0003AAE0
    procedure SetStyle(Value:TComboBoxStyle);//0003AC38
    procedure CreateParams(var Params:TCreateParams);//0003ACB8
    procedure CreateWnd;//0003AD1C
    procedure DestroyWnd;//0003AE80
    procedure WMCreate(var Message:TWMCreate);//0003AECC
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//0003AEF0
    procedure WMDrawItem(var Message:TWMDrawItem);//0003AF44
    procedure WMMeasureItem(var Message:TWMMeasureItem);//0003AF4C
    procedure WMDeleteItem(var Message:TWMDeleteItem);//0003AF54
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//0003AF5C
    procedure CMCancelMode(var Message:TCMCancelMode);//0003AF80
    procedure CMCtl3DChanged(var Message:TMessage);//0003AF94
    procedure CMParentColorChanged(var Message:TMessage);//0003AFB8
    procedure sub_0003B0FC;//0003B0FC
    procedure ComboWndProc(var Message:TMessage; ComboWnd:HWND; ComboProc:Pointer);//0003B104
    procedure WndProc(var Message:TMessage);//0003B3E0
    procedure CNCommand(var Message:TWMCommand);//0003B5E8
    procedure Change;//0003B734
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);//0003B758
    procedure DropDown;//0003B810
    procedure MeasureItem(Index:Integer; var Height:Integer);//0003B830
    procedure CNDrawItem(var Message:TWMDrawItem);//0003B850
    procedure CNMeasureItem(var Message:TWMMeasureItem);//0003B910
    procedure WMLButtonDown(var Message:TWMLButtonDown);//0003B940
    procedure Focused;//0003B9B8
    procedure AssignClient(AClient:TObject);//0003B9EC
    function IsCheckedLinked:Boolean;//0003BA10
    procedure SetChecked(Value:Boolean);//0003BA48
    constructor Create(AOwner:TComponent);//0003BAAC
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//0003BAE8
    procedure sub_0003BB30;//0003BB30
    //function sub_0003BB38:?;//0003BB38
    procedure sub_0003BB5C;//0003BB5C
    procedure WndProc(var Message:TMessage);//0003BB60
    constructor Create(AOwner:TComponent);//0003BBD8
    procedure Click;//0003BC3C
    procedure UseRightToLeftAlignment;//0003BC60
    procedure SetButtonStyle(ADefault:Boolean);//0003BC64
    procedure CreateParams(var Params:TCreateParams);//0003BCEC
    procedure CreateWnd;//0003BD28
    procedure CNCommand(var Message:TWMCommand);//0003BD40
    procedure CMDialogKey(var Message:TCMDialogKey);//0003BD54
    procedure CMDialogChar(var Message:TCMDialogChar);//0003BDBC
    procedure CMFocusChanged(var Message:TCMFocusChanged);//0003BE3C
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//0003BE90
    constructor Create(AOwner:TComponent);//0003BE98
    procedure GetControlsAlignment;//0003BF04
    procedure Toggle;//0003BF30
    procedure Click;//0003BF70
    function GetChecked:Boolean;//0003BF84
    procedure SetChecked(Value:Boolean);//0003BFA4
    procedure CreateParams(var Params:TCreateParams);//0003C008
    procedure CreateWnd;//0003C064
    procedure CreateWindowHandle(const Params:TCreateParams);//0003C090
    procedure WMSize(var Message:TMessage);//0003C150
    procedure CMCtl3DChanged(var Message:TMessage);//0003C164
    procedure CMDialogChar(var Message:TCMDialogChar);//0003C16C
    procedure CNCommand(var Message:TWMCommand);//0003C204
    procedure WMSetFocus(var Message:TWMSetFocus);//0003C214
    constructor Create(AOwner:TComponent);//0003C248
    function GetChecked:Boolean;//0003C2A8
    procedure GetControlsAlignment;//0003C2B0
    procedure TurnSiblingsOff;//0003C2F0
    procedure SetChecked(Value:Boolean);//0003C358
    procedure CreateParams(var Params:TCreateParams);//0003C3E0
    procedure CreateWnd;//0003C438
    procedure CreateWindowHandle(const Params:TCreateParams);//0003C464
    procedure CMCtl3DChanged(var Message:TMessage);//0003C524
    procedure CMDialogChar(var Message:TCMDialogChar);//0003C52C
    procedure CNCommand(var Message:TWMCommand);//0003C5A8
    procedure WMSetFocus(var Message:TWMSetFocus);//0003C5DC
    function GetCount:Integer;//0003C610
    function Get(Index:Integer):AnsiString;//0003C62C
    function GetObject(Index:Integer):TObject;//0003C6D0
    procedure Put(Index:Integer; const S:AnsiString);//0003C740
    procedure PutObject(Index:Integer; AObject:TObject);//0003C770
    function Add(const S:AnsiString):Integer;//0003C78C
    procedure Insert(Index:Integer; const S:AnsiString);//0003C810
    procedure Delete(Index:Integer);//0003C890
    procedure Clear;//0003C8A4
    procedure SetUpdateState(Updating:Boolean);//0003C8B4
    function IndexOf(const S:AnsiString):Integer;//0003C8E8
    procedure Move(CurIndex:Integer; NewIndex:Integer);//0003C910
    constructor Create(AOwner:TComponent);//0003C97C
    destructor Destroy;//0003CA54
    procedure GetItemData(Index:Integer);//0003CA9C
    procedure SetItemData(Index:Integer; AData:Longint);//0003CABC
    procedure DeleteString(Index:Integer);//0003CAE0
    procedure ResetContent;//0003CB00
    procedure CreateParams(var Params:TCreateParams);//0003CE94
    procedure CreateWnd;//0003CF78
    procedure DestroyWnd;//0003D018
    procedure WndProc(var Message:TMessage);//0003D070
    procedure WMLButtonDown(var Message:TWMLButtonDown);//0003D0D8
    procedure CNCommand(var Message:TWMCommand);//0003D174
    procedure PaintListBox;//0003D1AC
    procedure WMPaint(var Message:TWMPaint);//0003D310
    procedure WMSize(var Message:TWMSize);//0003D340
    procedure DragCanceled;//0003D354
    procedure DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);//0003D3B4
    procedure MeasureItem(Index:Integer; var Height:Integer);//0003D4C0
    procedure CNDrawItem(var Message:TWMDrawItem);//0003D4E0
    procedure CNMeasureItem(var Message:TWMMeasureItem);//0003D5A0
    procedure CMCtl3DChanged(var Message:TMessage);//0003D5CC

implementation

//00038A6C
function HasPopup(Control:TControl):Boolean;
begin
{*
 00038A6C    mov         dl,1
 00038A6E    test        eax,eax
>00038A70    je          00038A7F
 00038A72    cmp         dword ptr [eax+70],0
>00038A76    jne         00038A81
 00038A78    mov         eax,dword ptr [eax+24]
 00038A7B    test        eax,eax
>00038A7D    jne         00038A72
 00038A7F    xor         edx,edx
 00038A81    mov         eax,edx
 00038A83    ret
*}
end;

//00038D6C
constructor TCustomGroupBox.Create(AOwner:TComponent);
begin
{*
 00038D6C    push        ebx
 00038D6D    push        esi
 00038D6E    test        dl,dl
>00038D70    je          00038D7A
 00038D72    add         esp,0FFFFFFF0
 00038D75    call        @ClassCreate
 00038D7A    mov         ebx,edx
 00038D7C    mov         esi,eax
 00038D7E    xor         edx,edx
 00038D80    mov         eax,esi
 00038D82    call        TCustomControl.Create
 00038D87    mov         eax,[00038DC4]
 00038D8C    mov         dword ptr [esi+40],eax
 00038D8F    mov         edx,0B9
 00038D94    mov         eax,esi
 00038D96    call        TControl.SetWidth
 00038D9B    mov         edx,69
 00038DA0    mov         eax,esi
 00038DA2    call        TControl.SetHeight
 00038DA7    mov         eax,esi
 00038DA9    test        bl,bl
>00038DAB    je          00038DBC
 00038DAD    call        @AfterConstruction
 00038DB2    pop         dword ptr fs:[0]
 00038DB9    add         esp,0C
 00038DBC    mov         eax,esi
 00038DBE    pop         esi
 00038DBF    pop         ebx
 00038DC0    ret
*}
end;

//00038DC8
procedure TCustomGroupBox.AdjustClientRect(var Rect:TRect);
begin
{*
 00038DC8    push        ebx
 00038DC9    push        esi
 00038DCA    mov         esi,edx
 00038DCC    mov         ebx,eax
 00038DCE    mov         edx,esi
 00038DD0    mov         eax,ebx
 00038DD2    call        TWinControl.AdjustClientRect
 00038DD7    mov         edx,dword ptr [ebx+58]
 00038DDA    mov         eax,dword ptr [ebx+1EC]
 00038DE0    call        TCanvas.SetFont
 00038DE5    mov         edx,38E20;'0'
 00038DEA    mov         eax,dword ptr [ebx+1EC]
 00038DF0    call        TCanvas.TextHeight
 00038DF5    add         dword ptr [esi+4],eax
 00038DF8    push        0FF
 00038DFA    push        0FF
 00038DFC    push        esi
 00038DFD    call        user32.InflateRect
 00038E02    cmp         byte ptr [ebx+12C],0
>00038E09    je          00038E15
 00038E0B    push        0FF
 00038E0D    push        0FF
 00038E0F    push        esi
 00038E10    call        user32.InflateRect
 00038E15    pop         esi
 00038E16    pop         ebx
 00038E17    ret
*}
end;

//00038E24
procedure TCustomGroupBox.CreateParams(var Params:TCreateParams);
begin
{*
 00038E24    push        ebx
 00038E25    mov         ebx,edx
 00038E27    mov         edx,ebx
 00038E29    call        TWinControl.CreateParams
 00038E2E    and         dword ptr [ebx+24],0FFFFFFFC
 00038E32    pop         ebx
 00038E33    ret
*}
end;

//00038E34
procedure TCustomGroupBox.Paint;
begin
{*
 00038E34    push        ebp
 00038E35    mov         ebp,esp
 00038E37    add         esp,0FFFFFFD8
 00038E3A    push        ebx
 00038E3B    push        esi
 00038E3C    push        edi
 00038E3D    xor         edx,edx
 00038E3F    mov         dword ptr [ebp-18],edx
 00038E42    mov         esi,eax
 00038E44    xor         eax,eax
 00038E46    push        ebp
 00038E47    push        3900C
 00038E4C    push        dword ptr fs:[eax]
 00038E4F    mov         dword ptr fs:[eax],esp
 00038E52    mov         edi,dword ptr [esi+1EC]
 00038E58    mov         edx,dword ptr [esi+58]
 00038E5B    mov         eax,edi
 00038E5D    call        TCanvas.SetFont
 00038E62    mov         edx,39024;'0'
 00038E67    mov         eax,edi
 00038E69    call        TCanvas.TextHeight
 00038E6E    mov         dword ptr [ebp-4],eax
 00038E71    mov         eax,dword ptr [esi+3C]
 00038E74    push        eax
 00038E75    lea         eax,[ebp-14]
 00038E78    push        eax
 00038E79    mov         edx,dword ptr [ebp-4]
 00038E7C    sar         edx,1
>00038E7E    jns         00038E83
 00038E80    adc         edx,0
 00038E83    dec         edx
 00038E84    mov         ecx,dword ptr [esi+38]
 00038E87    xor         eax,eax
 00038E89    call        Rect
 00038E8E    cmp         byte ptr [esi+12C],0
>00038E95    je          00038ED0
 00038E97    inc         dword ptr [ebp-14]
 00038E9A    inc         dword ptr [ebp-10]
 00038E9D    mov         edx,80000014
 00038EA2    mov         eax,dword ptr [edi+14]
 00038EA5    call        TBrush.SetColor
 00038EAA    lea         edx,[ebp-14]
 00038EAD    mov         eax,edi
 00038EAF    call        TCanvas.FrameRect
 00038EB4    push        0FF
 00038EB6    push        0FF
 00038EB8    lea         eax,[ebp-14]
 00038EBB    push        eax
 00038EBC    call        user32.OffsetRect
 00038EC1    mov         edx,80000010
 00038EC6    mov         eax,dword ptr [edi+14]
 00038EC9    call        TBrush.SetColor
>00038ECE    jmp         00038EDD
 00038ED0    mov         edx,80000006
 00038ED5    mov         eax,dword ptr [edi+14]
 00038ED8    call        TBrush.SetColor
 00038EDD    lea         edx,[ebp-14]
 00038EE0    mov         eax,edi
 00038EE2    call        TCanvas.FrameRect
 00038EE7    lea         edx,[ebp-18]
 00038EEA    mov         eax,esi
 00038EEC    call        TControl.GetText
 00038EF1    cmp         dword ptr [ebp-18],0
>00038EF5    je          00038FF6
 00038EFB    mov         eax,esi
 00038EFD    mov         bx,0FFCF
 00038F01    call        @CallDynaInst
 00038F06    test        al,al
>00038F08    jne         00038F22
 00038F0A    mov         eax,dword ptr [ebp-4]
 00038F0D    push        eax
 00038F0E    lea         eax,[ebp-14]
 00038F11    push        eax
 00038F12    xor         ecx,ecx
 00038F14    xor         edx,edx
 00038F16    mov         eax,8
 00038F1B    call        Rect
>00038F20    jmp         00038F66
 00038F22    mov         eax,dword ptr [ebp-4]
 00038F25    push        eax
 00038F26    lea         eax,[ebp-28]
 00038F29    push        eax
 00038F2A    lea         edx,[ebp-18]
 00038F2D    mov         eax,esi
 00038F2F    call        TControl.GetText
 00038F34    mov         edx,dword ptr [ebp-18]
 00038F37    mov         eax,dword ptr [esi+1EC]
 00038F3D    call        TCanvas.TextWidth
 00038F42    push        eax
 00038F43    mov         eax,dword ptr [ebp-0C]
 00038F46    pop         edx
 00038F47    sub         eax,edx
 00038F49    sub         eax,8
 00038F4C    xor         ecx,ecx
 00038F4E    xor         edx,edx
 00038F50    call        Rect
 00038F55    push        esi
 00038F56    push        edi
 00038F57    lea         esi,[ebp-28]
 00038F5A    lea         edi,[ebp-14]
 00038F5D    mov         ecx,4
 00038F62    rep movs    dword ptr [edi],dword ptr [esi]
 00038F64    pop         edi
 00038F65    pop         esi
 00038F66    mov         edx,20
 00038F6B    mov         eax,esi
 00038F6D    call        TControl.DrawTextBiDiModeFlags
 00038F72    mov         ebx,eax
 00038F74    mov         eax,ebx
 00038F76    or          eax,400
 00038F7B    push        eax
 00038F7C    lea         eax,[ebp-14]
 00038F7F    push        eax
 00038F80    lea         edx,[ebp-18]
 00038F83    mov         eax,esi
 00038F85    call        TControl.GetText
 00038F8A    mov         eax,dword ptr [ebp-18]
 00038F8D    call        @LStrLen
 00038F92    push        eax
 00038F93    lea         edx,[ebp-18]
 00038F96    mov         eax,esi
 00038F98    call        TControl.GetText
 00038F9D    mov         eax,dword ptr [ebp-18]
 00038FA0    call        @LStrToPChar
 00038FA5    push        eax
 00038FA6    mov         eax,edi
 00038FA8    call        TCanvas.GetHandle
 00038FAD    push        eax
 00038FAE    call        user32.DrawTextA
 00038FB3    mov         edx,dword ptr [esi+64]
 00038FB6    mov         eax,dword ptr [edi+14]
 00038FB9    call        TBrush.SetColor
 00038FBE    push        ebx
 00038FBF    lea         eax,[ebp-14]
 00038FC2    push        eax
 00038FC3    lea         edx,[ebp-18]
 00038FC6    mov         eax,esi
 00038FC8    call        TControl.GetText
 00038FCD    mov         eax,dword ptr [ebp-18]
 00038FD0    call        @LStrLen
 00038FD5    push        eax
 00038FD6    lea         edx,[ebp-18]
 00038FD9    mov         eax,esi
 00038FDB    call        TControl.GetText
 00038FE0    mov         eax,dword ptr [ebp-18]
 00038FE3    call        @LStrToPChar
 00038FE8    push        eax
 00038FE9    mov         eax,edi
 00038FEB    call        TCanvas.GetHandle
 00038FF0    push        eax
 00038FF1    call        user32.DrawTextA
 00038FF6    xor         eax,eax
 00038FF8    pop         edx
 00038FF9    pop         ecx
 00038FFA    pop         ecx
 00038FFB    mov         dword ptr fs:[eax],edx
 00038FFE    push        39013
 00039003    lea         eax,[ebp-18]
 00039006    call        @LStrClr
 0003900B    ret
>0003900C    jmp         @HandleFinally
>00039011    jmp         00039003
 00039013    pop         edi
 00039014    pop         esi
 00039015    pop         ebx
 00039016    mov         esp,ebp
 00039018    pop         ebp
 00039019    ret
*}
end;

//00039028
procedure TCustomGroupBox.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 00039028    push        ebp
 00039029    mov         ebp,esp
 0003902B    push        0
 0003902D    push        ebx
 0003902E    push        esi
 0003902F    mov         esi,edx
 00039031    mov         ebx,eax
 00039033    xor         eax,eax
 00039035    push        ebp
 00039036    push        39095
 0003903B    push        dword ptr fs:[eax]
 0003903E    mov         dword ptr fs:[eax],esp
 00039041    lea         edx,[ebp-4]
 00039044    mov         eax,ebx
 00039046    call        TControl.GetText
 0003904B    mov         edx,dword ptr [ebp-4]
 0003904E    mov         ax,word ptr [esi+4]
 00039052    call        IsAccel
 00039057    test        al,al
>00039059    je          00039076
 0003905B    mov         eax,ebx
 0003905D    call        TWinControl.CanFocus
 00039062    test        al,al
>00039064    je          00039076
 00039066    mov         eax,ebx
 00039068    call        TWinControl.SelectFirst
 0003906D    mov         dword ptr [esi+0C],1
>00039074    jmp         0003907F
 00039076    mov         edx,esi
 00039078    mov         eax,ebx
 0003907A    call        TWinControl.CMDialogChar
 0003907F    xor         eax,eax
 00039081    pop         edx
 00039082    pop         ecx
 00039083    pop         ecx
 00039084    mov         dword ptr fs:[eax],edx
 00039087    push        3909C
 0003908C    lea         eax,[ebp-4]
 0003908F    call        @LStrClr
 00039094    ret
>00039095    jmp         @HandleFinally
>0003909A    jmp         0003908C
 0003909C    pop         esi
 0003909D    pop         ebx
 0003909E    pop         ecx
 0003909F    pop         ebp
 000390A0    ret
*}
end;

//000390A4
procedure TCustomGroupBox.CMTextChanged(var Message:TMessage);
begin
{*
 000390A4    push        ebx
 000390A5    mov         ebx,eax
 000390A7    mov         eax,ebx
 000390A9    mov         edx,dword ptr [eax]
 000390AB    call        dword ptr [edx+78]
 000390AE    mov         eax,ebx
 000390B0    call        TWinControl.Realign
 000390B5    pop         ebx
 000390B6    ret
*}
end;

//000390B8
procedure TCustomGroupBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 000390B8    push        ebx
 000390B9    mov         ebx,eax
 000390BB    mov         eax,ebx
 000390BD    call        TWinControl.CMCtl3DChanged
 000390C2    mov         eax,ebx
 000390C4    mov         edx,dword ptr [eax]
 000390C6    call        dword ptr [edx+78]
 000390C9    mov         eax,ebx
 000390CB    call        TWinControl.Realign
 000390D0    pop         ebx
 000390D1    ret
*}
end;

//000390D4
procedure TCustomCheckBox.WMSize(var Message:TMessage);
begin
{*
 000390D4    push        esi
 000390D5    mov         esi,eax
 000390D7    mov         eax,esi
 000390D9    call        TWinControl.WMSize
 000390DE    mov         eax,esi
 000390E0    mov         edx,dword ptr [eax]
 000390E2    call        dword ptr [edx+78]
 000390E5    pop         esi
 000390E6    ret
*}
end;

//000390E8
constructor TCustomLabel.Create(AOwner:TComponent);
begin
{*
 000390E8    push        ebx
 000390E9    push        esi
 000390EA    test        dl,dl
>000390EC    je          000390F6
 000390EE    add         esp,0FFFFFFF0
 000390F1    call        @ClassCreate
 000390F6    mov         ebx,edx
 000390F8    mov         esi,eax
 000390FA    xor         edx,edx
 000390FC    mov         eax,esi
 000390FE    call        TGraphicControl.Create
 00039103    mov         eax,[00039150]
 00039108    or          eax,dword ptr [esi+40]
 0003910B    mov         dword ptr [esi+40],eax
 0003910E    mov         edx,41
 00039113    mov         eax,esi
 00039115    call        TControl.SetWidth
 0003911A    mov         edx,11
 0003911F    mov         eax,esi
 00039121    call        TControl.SetHeight
 00039126    mov         byte ptr [esi+11D],1
 0003912D    mov         byte ptr [esi+120],1
 00039134    mov         eax,esi
 00039136    test        bl,bl
>00039138    je          00039149
 0003913A    call        @AfterConstruction
 0003913F    pop         dword ptr fs:[0]
 00039146    add         esp,0C
 00039149    mov         eax,esi
 0003914B    pop         esi
 0003914C    pop         ebx
 0003914D    ret
*}
end;

//00039154
function TCustomLabel.GetLabelText:AnsiString;
begin
{*
 00039154    push        ebx
 00039155    push        esi
 00039156    mov         esi,edx
 00039158    mov         ebx,eax
 0003915A    mov         edx,esi
 0003915C    mov         eax,ebx
 0003915E    call        TControl.GetText
 00039163    pop         esi
 00039164    pop         ebx
 00039165    ret
*}
end;

//00039168
procedure TCustomLabel.DoDrawText(var Rect:TRect; Flags:Longint);
begin
{*
 00039168    push        ebp
 00039169    mov         ebp,esp
 0003916B    push        0
 0003916D    push        ebx
 0003916E    push        esi
 0003916F    push        edi
 00039170    mov         esi,ecx
 00039172    mov         edi,edx
 00039174    mov         ebx,eax
 00039176    xor         eax,eax
 00039178    push        ebp
 00039179    push        392BE
 0003917E    push        dword ptr fs:[eax]
 00039181    mov         dword ptr fs:[eax],esp
 00039184    lea         edx,[ebp-4]
 00039187    mov         eax,ebx
 00039189    mov         ecx,dword ptr [eax]
 0003918B    call        dword ptr [ecx+8C]
 00039191    test        esi,400
>00039197    je          000391C6
 00039199    cmp         dword ptr [ebp-4],0
>0003919D    je          000391B9
 0003919F    cmp         byte ptr [ebx+120],0
>000391A6    je          000391C6
 000391A8    mov         eax,dword ptr [ebp-4]
 000391AB    cmp         byte ptr [eax],26
>000391AE    jne         000391C6
 000391B0    mov         eax,dword ptr [ebp-4]
 000391B3    cmp         byte ptr [eax+1],0
>000391B7    jne         000391C6
 000391B9    lea         eax,[ebp-4]
 000391BC    mov         edx,392D4;' '
 000391C1    call        @LStrCat
 000391C6    cmp         byte ptr [ebx+120],0
>000391CD    jne         000391D5
 000391CF    or          esi,800
 000391D5    mov         edx,esi
 000391D7    mov         eax,ebx
 000391D9    call        TControl.DrawTextBiDiModeFlags
 000391DE    mov         esi,eax
 000391E0    mov         edx,dword ptr [ebx+58]
 000391E3    mov         eax,dword ptr [ebx+114]
 000391E9    call        TCanvas.SetFont
 000391EE    mov         eax,ebx
 000391F0    mov         edx,dword ptr [eax]
 000391F2    call        dword ptr [edx+50]
 000391F5    test        al,al
>000391F7    jne         00039283
 000391FD    push        1
 000391FF    push        1
 00039201    push        edi
 00039202    call        user32.OffsetRect
 00039207    mov         eax,dword ptr [ebx+114]
 0003920D    mov         eax,dword ptr [eax+0C]
 00039210    mov         edx,80000014
 00039215    call        TFont.SetColor
 0003921A    push        esi
 0003921B    push        edi
 0003921C    mov         eax,dword ptr [ebp-4]
 0003921F    call        @LStrLen
 00039224    push        eax
 00039225    mov         eax,dword ptr [ebp-4]
 00039228    call        @LStrToPChar
 0003922D    push        eax
 0003922E    mov         eax,dword ptr [ebx+114]
 00039234    call        TCanvas.GetHandle
 00039239    push        eax
 0003923A    call        user32.DrawTextA
 0003923F    push        0FF
 00039241    push        0FF
 00039243    push        edi
 00039244    call        user32.OffsetRect
 00039249    mov         eax,dword ptr [ebx+114]
 0003924F    mov         eax,dword ptr [eax+0C]
 00039252    mov         edx,80000010
 00039257    call        TFont.SetColor
 0003925C    push        esi
 0003925D    push        edi
 0003925E    mov         eax,dword ptr [ebp-4]
 00039261    call        @LStrLen
 00039266    push        eax
 00039267    mov         eax,dword ptr [ebp-4]
 0003926A    call        @LStrToPChar
 0003926F    push        eax
 00039270    mov         eax,dword ptr [ebx+114]
 00039276    call        TCanvas.GetHandle
 0003927B    push        eax
 0003927C    call        user32.DrawTextA
>00039281    jmp         000392A8
 00039283    push        esi
 00039284    push        edi
 00039285    mov         eax,dword ptr [ebp-4]
 00039288    call        @LStrLen
 0003928D    push        eax
 0003928E    mov         eax,dword ptr [ebp-4]
 00039291    call        @LStrToPChar
 00039296    push        eax
 00039297    mov         eax,dword ptr [ebx+114]
 0003929D    call        TCanvas.GetHandle
 000392A2    push        eax
 000392A3    call        user32.DrawTextA
 000392A8    xor         eax,eax
 000392AA    pop         edx
 000392AB    pop         ecx
 000392AC    pop         ecx
 000392AD    mov         dword ptr fs:[eax],edx
 000392B0    push        392C5
 000392B5    lea         eax,[ebp-4]
 000392B8    call        @LStrClr
 000392BD    ret
>000392BE    jmp         @HandleFinally
>000392C3    jmp         000392B5
 000392C5    pop         edi
 000392C6    pop         esi
 000392C7    pop         ebx
 000392C8    pop         ecx
 000392C9    pop         ebp
 000392CA    ret
*}
end;

//000392D8
procedure TCustomLabel.Paint;
begin
{*
 000392D8    push        ebx
 000392D9    push        esi
 000392DA    push        edi
 000392DB    add         esp,0FFFFFFD0
 000392DE    mov         esi,eax
 000392E0    mov         ebx,dword ptr [esi+114]
 000392E6    mov         eax,esi
 000392E8    call        TCustomLabel.GetTransparent
 000392ED    test        al,al
>000392EF    jne         0003931C
 000392F1    mov         edx,dword ptr [esi+64]
 000392F4    mov         eax,dword ptr [ebx+14]
 000392F7    call        TBrush.SetColor
 000392FC    xor         edx,edx
 000392FE    mov         eax,dword ptr [ebx+14]
 00039301    call        TBrush.SetStyle
 00039306    lea         edx,[esp+20]
 0003930A    mov         eax,esi
 0003930C    mov         ecx,dword ptr [eax]
 0003930E    call        dword ptr [ecx+44]
 00039311    lea         edx,[esp+20]
 00039315    mov         eax,ebx
 00039317    call        TCanvas.FillRect
 0003931C    mov         dl,1
 0003931E    mov         eax,dword ptr [ebx+14]
 00039321    call        TBrush.SetStyle
 00039326    mov         edx,esp
 00039328    mov         eax,esi
 0003932A    mov         ecx,dword ptr [eax]
 0003932C    call        dword ptr [ecx+44]
 0003932F    xor         eax,eax
 00039331    mov         al,byte ptr [esi+11F]
 00039337    mov         di,word ptr [eax*2+0B4688]
 0003933F    or          di,40
 00039343    xor         eax,eax
 00039345    mov         al,byte ptr [esi+11C]
 0003934B    or          di,word ptr [eax*2+0B4680]
 00039353    movzx       edi,di
 00039356    cmp         byte ptr [esi+11E],0
>0003935D    je          000393C3
 0003935F    push        esi
 00039360    push        edi
 00039361    lea         esi,[esp+8]
 00039365    lea         edi,[esp+18]
 00039369    mov         ecx,4
 0003936E    rep movs    dword ptr [edi],dword ptr [esi]
 00039370    pop         edi
 00039371    pop         esi
 00039372    mov         ecx,edi
 00039374    or          ecx,400
 0003937A    lea         edx,[esp+10]
 0003937E    mov         eax,esi
 00039380    mov         bx,0FFCD
 00039384    call        @CallDynaInst
 00039389    cmp         byte ptr [esi+11E],2
>00039390    jne         000393A8
 00039392    mov         eax,dword ptr [esi+3C]
 00039395    sub         eax,dword ptr [esp+1C]
 00039399    push        eax
 0003939A    push        0
 0003939C    lea         eax,[esp+8]
 000393A0    push        eax
 000393A1    call        user32.OffsetRect
>000393A6    jmp         000393C3
 000393A8    mov         eax,dword ptr [esi+3C]
 000393AB    sub         eax,dword ptr [esp+1C]
 000393AF    sar         eax,1
>000393B1    jns         000393B6
 000393B3    adc         eax,0
 000393B6    push        eax
 000393B7    push        0
 000393B9    lea         eax,[esp+8]
 000393BD    push        eax
 000393BE    call        user32.OffsetRect
 000393C3    mov         edx,esp
 000393C5    mov         ecx,edi
 000393C7    mov         eax,esi
 000393C9    mov         bx,0FFCD
 000393CD    call        @CallDynaInst
 000393D2    add         esp,30
 000393D5    pop         edi
 000393D6    pop         esi
 000393D7    pop         ebx
 000393D8    ret
*}
end;

//000393DC
procedure TCustomLabel.Loaded;
begin
{*
 000393DC    push        ebx
 000393DD    mov         ebx,eax
 000393DF    mov         eax,ebx
 000393E1    call        TControl.Loaded
 000393E6    mov         eax,ebx
 000393E8    mov         bx,0FFCE
 000393EC    call        @CallDynaInst
 000393F1    pop         ebx
 000393F2    ret
*}
end;

//000393F4
procedure TCustomLabel.AdjustBounds;
begin
{*
 000393F4    push        ebx
 000393F5    push        esi
 000393F6    push        edi
 000393F7    add         esp,0FFFFFFEC
 000393FA    mov         esi,eax
 000393FC    test        byte ptr [esi+20],2
>00039400    jne         000394BA
 00039406    cmp         byte ptr [esi+11D],0
>0003940D    je          000394BA
 00039413    lea         edx,[esp+4]
 00039417    mov         eax,esi
 00039419    mov         ecx,dword ptr [eax]
 0003941B    call        dword ptr [ecx+44]
 0003941E    push        0
 00039420    call        user32.GetDC
 00039425    mov         edi,eax
 00039427    mov         edx,edi
 00039429    mov         eax,dword ptr [esi+114]
 0003942F    call        TCanvas.SetHandle
 00039434    xor         eax,eax
 00039436    mov         al,byte ptr [esi+11F]
 0003943C    mov         cx,word ptr [eax*2+0B468C]
 00039444    or          cx,440
 00039449    movzx       ecx,cx
 0003944C    lea         edx,[esp+4]
 00039450    mov         eax,esi
 00039452    mov         bx,0FFCD
 00039456    call        @CallDynaInst
 0003945B    xor         edx,edx
 0003945D    mov         eax,dword ptr [esi+114]
 00039463    call        TCanvas.SetHandle
 00039468    push        edi
 00039469    push        0
 0003946B    call        user32.ReleaseDC
 00039470    mov         edi,dword ptr [esi+30]
 00039473    mov         al,byte ptr [esi+11C]
 00039479    mov         byte ptr [esp],al
 0003947C    mov         eax,esi
 0003947E    mov         bx,0FFCF
 00039482    call        @CallDynaInst
 00039487    test        al,al
>00039489    je          00039492
 0003948B    mov         eax,esp
 0003948D    call        ChangeBiDiModeAlignment
 00039492    cmp         byte ptr [esp],1
>00039496    jne         000394A1
 00039498    mov         eax,dword ptr [esi+38]
 0003949B    sub         eax,dword ptr [esp+0C]
 0003949F    add         edi,eax
 000394A1    mov         eax,dword ptr [esp+0C]
 000394A5    push        eax
 000394A6    mov         eax,dword ptr [esp+14]
 000394AA    push        eax
 000394AB    mov         ecx,dword ptr [esi+34]
 000394AE    mov         edx,edi
 000394B0    mov         eax,esi
 000394B2    mov         ebx,dword ptr [eax]
 000394B4    call        dword ptr [ebx+80]
 000394BA    add         esp,14
 000394BD    pop         edi
 000394BE    pop         esi
 000394BF    pop         ebx
 000394C0    ret
*}
end;

//000394C4
procedure TCustomLabel.SetAlignment(Value:TAlignment);
begin
{*
 000394C4    cmp         dl,byte ptr [eax+11C]
>000394CA    je          000394D7
 000394CC    mov         byte ptr [eax+11C],dl
 000394D2    mov         edx,dword ptr [eax]
 000394D4    call        dword ptr [edx+78]
 000394D7    ret
*}
end;

//000394D8
procedure TCustomLabel.SetAutoSize(Value:Boolean);
begin
{*
 000394D8    push        ebx
 000394D9    cmp         dl,byte ptr [eax+11D]
>000394DF    je          000394F0
 000394E1    mov         byte ptr [eax+11D],dl
 000394E7    mov         bx,0FFCE
 000394EB    call        @CallDynaInst
 000394F0    pop         ebx
 000394F1    ret
*}
end;

//000394F4
function TCustomLabel.GetTransparent:Boolean;
begin
{*
 000394F4    test        byte ptr [eax+40],40
 000394F8    setne       al
 000394FB    xor         al,1
 000394FD    ret
*}
end;

//00039500
procedure TCustomLabel.SetFocusControl(Value:TWinControl);
begin
{*
 00039500    mov         dword ptr [eax+118],edx
 00039506    test        edx,edx
>00039508    je          00039510
 0003950A    xchg        eax,edx
 0003950B    call        TComponent.FreeNotification
 00039510    ret
*}
end;

//00039514
procedure TCustomLabel.SetShowAccelChar(Value:Boolean);
begin
{*
 00039514    cmp         dl,byte ptr [eax+120]
>0003951A    je          00039527
 0003951C    mov         byte ptr [eax+120],dl
 00039522    mov         edx,dword ptr [eax]
 00039524    call        dword ptr [edx+78]
 00039527    ret
*}
end;

//00039528
procedure TCustomLabel.SetTransparent(Value:Boolean);
begin
{*
 00039528    push        ebx
 00039529    push        esi
 0003952A    mov         ebx,edx
 0003952C    mov         esi,eax
 0003952E    mov         eax,esi
 00039530    call        TCustomLabel.GetTransparent
 00039535    cmp         bl,al
>00039537    je          0003955E
 00039539    test        bl,bl
>0003953B    je          0003954C
 0003953D    mov         eax,[00039564]
 00039542    not         eax
 00039544    and         eax,dword ptr [esi+40]
 00039547    mov         dword ptr [esi+40],eax
>0003954A    jmp         00039557
 0003954C    mov         eax,[00039564]
 00039551    or          eax,dword ptr [esi+40]
 00039554    mov         dword ptr [esi+40],eax
 00039557    mov         eax,esi
 00039559    mov         edx,dword ptr [eax]
 0003955B    call        dword ptr [edx+78]
 0003955E    pop         esi
 0003955F    pop         ebx
 00039560    ret
*}
end;

//00039568
procedure TCustomLabel.SetLayout(Value:TTextLayout);
begin
{*
 00039568    cmp         dl,byte ptr [eax+11E]
>0003956E    je          0003957B
 00039570    mov         byte ptr [eax+11E],dl
 00039576    mov         edx,dword ptr [eax]
 00039578    call        dword ptr [edx+78]
 0003957B    ret
*}
end;

//0003957C
procedure TCustomLabel.SetWordWrap(Value:Boolean);
begin
{*
 0003957C    push        ebx
 0003957D    push        esi
 0003957E    mov         esi,eax
 00039580    cmp         dl,byte ptr [esi+11F]
>00039586    je          000395A0
 00039588    mov         byte ptr [esi+11F],dl
 0003958E    mov         eax,esi
 00039590    mov         bx,0FFCE
 00039594    call        @CallDynaInst
 00039599    mov         eax,esi
 0003959B    mov         edx,dword ptr [eax]
 0003959D    call        dword ptr [edx+78]
 000395A0    pop         esi
 000395A1    pop         ebx
 000395A2    ret
*}
end;

//000395A4
procedure TCustomLabel.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 000395A4    push        ebx
 000395A5    push        esi
 000395A6    push        edi
 000395A7    mov         ebx,ecx
 000395A9    mov         esi,edx
 000395AB    mov         edi,eax
 000395AD    mov         ecx,ebx
 000395AF    mov         edx,esi
 000395B1    mov         eax,edi
 000395B3    call        TControl.Notification
 000395B8    cmp         bl,1
>000395BB    jne         000395CD
 000395BD    cmp         esi,dword ptr [edi+118]
>000395C3    jne         000395CD
 000395C5    xor         eax,eax
 000395C7    mov         dword ptr [edi+118],eax
 000395CD    pop         edi
 000395CE    pop         esi
 000395CF    pop         ebx
 000395D0    ret
*}
end;

//000395D4
procedure TCustomLabel.CMTextChanged(var Message:TMessage);
begin
{*
 000395D4    push        ebx
 000395D5    mov         ebx,eax
 000395D7    mov         eax,ebx
 000395D9    mov         edx,dword ptr [eax]
 000395DB    call        dword ptr [edx+78]
 000395DE    mov         eax,ebx
 000395E0    mov         bx,0FFCE
 000395E4    call        @CallDynaInst
 000395E9    pop         ebx
 000395EA    ret
*}
end;

//000395EC
procedure TCustomLabel.CMFontChanged(var Message:TMessage);
begin
{*
 000395EC    push        ebx
 000395ED    push        esi
 000395EE    mov         esi,eax
 000395F0    mov         eax,esi
 000395F2    call        TControl.CMFontChanged
 000395F7    mov         eax,esi
 000395F9    mov         bx,0FFCE
 000395FD    call        @CallDynaInst
 00039602    pop         esi
 00039603    pop         ebx
 00039604    ret
*}
end;

//00039608
procedure TCustomLabel.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 00039608    push        ebp
 00039609    mov         ebp,esp
 0003960B    push        0
 0003960D    push        ebx
 0003960E    push        esi
 0003960F    mov         esi,edx
 00039611    mov         ebx,eax
 00039613    xor         eax,eax
 00039615    push        ebp
 00039616    push        39690
 0003961B    push        dword ptr fs:[eax]
 0003961E    mov         dword ptr fs:[eax],esp
 00039621    cmp         dword ptr [ebx+118],0
>00039628    je          0003967A
 0003962A    mov         eax,ebx
 0003962C    mov         edx,dword ptr [eax]
 0003962E    call        dword ptr [edx+50]
 00039631    test        al,al
>00039633    je          0003967A
 00039635    cmp         byte ptr [ebx+120],0
>0003963C    je          0003967A
 0003963E    lea         edx,[ebp-4]
 00039641    mov         eax,ebx
 00039643    call        TControl.GetText
 00039648    mov         edx,dword ptr [ebp-4]
 0003964B    mov         ax,word ptr [esi+4]
 0003964F    call        IsAccel
 00039654    test        al,al
>00039656    je          0003967A
 00039658    mov         ebx,dword ptr [ebx+118]
 0003965E    mov         eax,ebx
 00039660    call        TWinControl.CanFocus
 00039665    test        al,al
>00039667    je          0003967A
 00039669    mov         eax,ebx
 0003966B    mov         edx,dword ptr [eax]
 0003966D    call        dword ptr [edx+0B4]
 00039673    mov         dword ptr [esi+0C],1
 0003967A    xor         eax,eax
 0003967C    pop         edx
 0003967D    pop         ecx
 0003967E    pop         ecx
 0003967F    mov         dword ptr fs:[eax],edx
 00039682    push        39697
 00039687    lea         eax,[ebp-4]
 0003968A    call        @LStrClr
 0003968F    ret
>00039690    jmp         @HandleFinally
>00039695    jmp         00039687
 00039697    pop         esi
 00039698    pop         ebx
 00039699    pop         ecx
 0003969A    pop         ebp
 0003969B    ret
*}
end;

//0003969C
constructor TCustomEdit.Create(AOwner:TComponent);
begin
{*
 0003969C    push        ebx
 0003969D    push        esi
 0003969E    test        dl,dl
>000396A0    je          000396AA
 000396A2    add         esp,0FFFFFFF0
 000396A5    call        @ClassCreate
 000396AA    mov         ebx,edx
 000396AC    mov         esi,eax
 000396AE    xor         edx,edx
 000396B0    mov         eax,esi
 000396B2    call        TWinControl.Create
 000396B7    mov         eax,[000B58C0];NewStyleControls:Boolean
 000396BC    cmp         byte ptr [eax],0
>000396BF    je          000396CB
 000396C1    mov         eax,[0003973C]
 000396C6    mov         dword ptr [esi+40],eax
>000396C9    jmp         000396D3
 000396CB    mov         eax,[00039740]
 000396D0    mov         dword ptr [esi+40],eax
 000396D3    mov         edx,79
 000396D8    mov         eax,esi
 000396DA    call        TControl.SetWidth
 000396DF    mov         edx,19
 000396E4    mov         eax,esi
 000396E6    call        TControl.SetHeight
 000396EB    mov         dl,1
 000396ED    mov         eax,esi
 000396EF    call        TWinControl.SetTabStop
 000396F4    xor         edx,edx
 000396F6    mov         eax,esi
 000396F8    call        TControl.SetParentColor
 000396FD    mov         byte ptr [esi+1F0],1
 00039704    mov         byte ptr [esi+1F3],1
 0003970B    mov         byte ptr [esi+1F4],1
 00039712    mov         byte ptr [esi+1F5],1
 00039719    mov         eax,esi
 0003971B    call        TCustomEdit.AdjustHeight
 00039720    mov         eax,esi
 00039722    test        bl,bl
>00039724    je          00039735
 00039726    call        @AfterConstruction
 0003972B    pop         dword ptr fs:[0]
 00039732    add         esp,0C
 00039735    mov         eax,esi
 00039737    pop         esi
 00039738    pop         ebx
 00039739    ret
*}
end;

//00039744
procedure TCustomEdit.DoSetMaxLength(Value:Integer);
begin
{*
 00039744    push        ebx
 00039745    push        esi
 00039746    mov         esi,edx
 00039748    mov         ebx,eax
 0003974A    push        0
 0003974C    push        esi
 0003974D    push        0C5
 00039752    mov         eax,ebx
 00039754    call        TWinControl.GetHandle
 00039759    push        eax
 0003975A    call        user32.SendMessageA
 0003975F    pop         esi
 00039760    pop         ebx
 00039761    ret
*}
end;

//00039764
procedure TCustomEdit.SetAutoSize(Value:Boolean);
begin
{*
 00039764    cmp         dl,byte ptr [eax+1F3]
>0003976A    je          00039777
 0003976C    mov         byte ptr [eax+1F3],dl
 00039772    call        TCustomEdit.UpdateHeight
 00039777    ret
*}
end;

//00039778
procedure TCustomEdit.SetBorderStyle(Value:TBorderStyle);
begin
{*
 00039778    push        ebx
 00039779    mov         ebx,eax
 0003977B    cmp         dl,byte ptr [ebx+1F0]
>00039781    je          00039797
 00039783    mov         byte ptr [ebx+1F0],dl
 00039789    mov         eax,ebx
 0003978B    call        TCustomEdit.UpdateHeight
 00039790    mov         eax,ebx
 00039792    call        TWinControl.RecreateWnd
 00039797    pop         ebx
 00039798    ret
*}
end;

//0003979C
procedure TCustomEdit.SetCharCase(Value:TEditCharCase);
begin
{*
 0003979C    cmp         dl,byte ptr [eax+1F7]
>000397A2    je          000397AF
 000397A4    mov         byte ptr [eax+1F7],dl
 000397AA    call        TWinControl.RecreateWnd
 000397AF    ret
*}
end;

//000397B0
procedure TCustomComboBox.SetSorted(Value:Boolean);
begin
{*
 000397B0    cmp         dl,byte ptr [eax+1F5]
>000397B6    je          000397C3
 000397B8    mov         byte ptr [eax+1F5],dl
 000397BE    call        TWinControl.RecreateWnd
 000397C3    ret
*}
end;

//000397C4
procedure TCustomEdit.SetMaxLength(Value:Integer);
begin
{*
 000397C4    push        ebx
 000397C5    push        esi
 000397C6    mov         esi,edx
 000397C8    mov         ebx,eax
 000397CA    cmp         esi,dword ptr [ebx+1EC]
>000397D0    je          000397EF
 000397D2    mov         dword ptr [ebx+1EC],esi
 000397D8    mov         eax,ebx
 000397DA    call        TWinControl.HandleAllocated
 000397DF    test        al,al
>000397E1    je          000397EF
 000397E3    mov         edx,esi
 000397E5    mov         eax,ebx
 000397E7    mov         ecx,dword ptr [eax]
 000397E9    call        dword ptr [ecx+0B8]
 000397EF    pop         esi
 000397F0    pop         ebx
 000397F1    ret
*}
end;

//000397F4
procedure TCustomEdit.SetOEMConvert(Value:Boolean);
begin
{*
 000397F4    cmp         dl,byte ptr [eax+1F6]
>000397FA    je          00039807
 000397FC    mov         byte ptr [eax+1F6],dl
 00039802    call        TWinControl.RecreateWnd
 00039807    ret
*}
end;

//00039808
function TCustomEdit.GetModified:Boolean;
begin
{*
 00039808    push        ebx
 00039809    push        esi
 0003980A    mov         esi,eax
 0003980C    mov         bl,byte ptr [esi+1F9]
 00039812    mov         eax,esi
 00039814    call        TWinControl.HandleAllocated
 00039819    test        al,al
>0003981B    je          00039838
 0003981D    push        0
 0003981F    push        0
 00039821    push        0B8
 00039826    mov         eax,esi
 00039828    call        TWinControl.GetHandle
 0003982D    push        eax
 0003982E    call        user32.SendMessageA
 00039833    test        eax,eax
 00039835    setne       bl
 00039838    mov         eax,ebx
 0003983A    pop         esi
 0003983B    pop         ebx
 0003983C    ret
*}
end;

//00039840
procedure TCustomEdit.SetModified(Value:Boolean);
begin
{*
 00039840    push        ebx
 00039841    push        esi
 00039842    mov         ebx,edx
 00039844    mov         esi,eax
 00039846    mov         eax,esi
 00039848    call        TWinControl.HandleAllocated
 0003984D    test        al,al
>0003984F    je          0003986D
 00039851    push        0
 00039853    xor         eax,eax
 00039855    mov         al,bl
 00039857    push        eax
 00039858    push        0B9
 0003985D    mov         eax,esi
 0003985F    call        TWinControl.GetHandle
 00039864    push        eax
 00039865    call        user32.SendMessageA
 0003986A    pop         esi
 0003986B    pop         ebx
 0003986C    ret
 0003986D    mov         byte ptr [esi+1F9],bl
 00039873    pop         esi
 00039874    pop         ebx
 00039875    ret
*}
end;

//00039878
procedure TCustomEdit.SetPasswordChar(Value:Char);
begin
{*
 00039878    push        ebp
 00039879    mov         ebp,esp
 0003987B    push        0
 0003987D    push        ebx
 0003987E    mov         ebx,eax
 00039880    xor         eax,eax
 00039882    push        ebp
 00039883    push        398F5
 00039888    push        dword ptr fs:[eax]
 0003988B    mov         dword ptr fs:[eax],esp
 0003988E    cmp         dl,byte ptr [ebx+1F1]
>00039894    je          000398DF
 00039896    mov         byte ptr [ebx+1F1],dl
 0003989C    mov         eax,ebx
 0003989E    call        TWinControl.HandleAllocated
 000398A3    test        al,al
>000398A5    je          000398DF
 000398A7    push        0
 000398A9    xor         eax,eax
 000398AB    mov         al,byte ptr [ebx+1F1]
 000398B1    push        eax
 000398B2    push        0CC
 000398B7    mov         eax,ebx
 000398B9    call        TWinControl.GetHandle
 000398BE    push        eax
 000398BF    call        user32.SendMessageA
 000398C4    lea         edx,[ebp-4]
 000398C7    mov         eax,ebx
 000398C9    call        TControl.GetText
 000398CE    mov         eax,dword ptr [ebp-4]
 000398D1    call        @LStrToPChar
 000398D6    mov         edx,eax
 000398D8    mov         eax,ebx
 000398DA    call        TControl.SetTextBuf
 000398DF    xor         eax,eax
 000398E1    pop         edx
 000398E2    pop         ecx
 000398E3    pop         ecx
 000398E4    mov         dword ptr fs:[eax],edx
 000398E7    push        398FC
 000398EC    lea         eax,[ebp-4]
 000398EF    call        @LStrClr
 000398F4    ret
>000398F5    jmp         @HandleFinally
>000398FA    jmp         000398EC
 000398FC    pop         ebx
 000398FD    pop         ecx
 000398FE    pop         ebp
 000398FF    ret
*}
end;

//00039900
procedure TCustomEdit.SetReadOnly(Value:Boolean);
begin
{*
 00039900    push        ebx
 00039901    push        esi
 00039902    mov         ebx,edx
 00039904    mov         esi,eax
 00039906    cmp         bl,byte ptr [esi+1F2]
>0003990C    je          00039938
 0003990E    mov         byte ptr [esi+1F2],bl
 00039914    mov         eax,esi
 00039916    call        TWinControl.HandleAllocated
 0003991B    test        al,al
>0003991D    je          00039938
 0003991F    push        0
 00039921    xor         eax,eax
 00039923    mov         al,bl
 00039925    push        eax
 00039926    push        0CF
 0003992B    mov         eax,esi
 0003992D    call        TWinControl.GetHandle
 00039932    push        eax
 00039933    call        user32.SendMessageA
 00039938    pop         esi
 00039939    pop         ebx
 0003993A    ret
*}
end;

//0003993C
function TCustomEdit.GetSelStart:Integer;
begin
{*
 0003993C    push        ebx
 0003993D    push        ecx
 0003993E    mov         ebx,eax
 00039940    push        0
 00039942    lea         eax,[esp+4]
 00039946    push        eax
 00039947    push        0B0
 0003994C    mov         eax,ebx
 0003994E    call        TWinControl.GetHandle
 00039953    push        eax
 00039954    call        user32.SendMessageA
 00039959    mov         eax,dword ptr [esp]
 0003995C    pop         edx
 0003995D    pop         ebx
 0003995E    ret
*}
end;

//00039960
procedure TCustomEdit.SetSelStart(Value:Integer);
begin
{*
 00039960    push        ebx
 00039961    push        esi
 00039962    mov         esi,edx
 00039964    mov         ebx,eax
 00039966    push        esi
 00039967    push        esi
 00039968    push        0B1
 0003996D    mov         eax,ebx
 0003996F    call        TWinControl.GetHandle
 00039974    push        eax
 00039975    call        user32.SendMessageA
 0003997A    pop         esi
 0003997B    pop         ebx
 0003997C    ret
*}
end;

//00039980
function TCustomEdit.GetSelLength:Integer;
begin
{*
 00039980    push        ebx
 00039981    add         esp,0FFFFFFF8
 00039984    mov         ebx,eax
 00039986    lea         eax,[esp+4]
 0003998A    push        eax
 0003998B    lea         eax,[esp+4]
 0003998F    push        eax
 00039990    push        0B0
 00039995    mov         eax,ebx
 00039997    call        TWinControl.GetHandle
 0003999C    push        eax
 0003999D    call        user32.SendMessageA
 000399A2    mov         eax,dword ptr [esp+4]
 000399A6    sub         eax,dword ptr [esp]
 000399A9    pop         ecx
 000399AA    pop         edx
 000399AB    pop         ebx
 000399AC    ret
*}
end;

//000399B0
procedure TCustomEdit.SetSelLength(Value:Integer);
begin
{*
 000399B0    push        ebx
 000399B1    push        esi
 000399B2    add         esp,0FFFFFFF8
 000399B5    mov         esi,edx
 000399B7    mov         ebx,eax
 000399B9    lea         eax,[esp+4]
 000399BD    push        eax
 000399BE    lea         eax,[esp+4]
 000399C2    push        eax
 000399C3    push        0B0
 000399C8    mov         eax,ebx
 000399CA    call        TWinControl.GetHandle
 000399CF    push        eax
 000399D0    call        user32.SendMessageA
 000399D5    add         esi,dword ptr [esp]
 000399D8    mov         dword ptr [esp+4],esi
 000399DC    mov         eax,dword ptr [esp+4]
 000399E0    push        eax
 000399E1    mov         eax,dword ptr [esp+4]
 000399E5    push        eax
 000399E6    push        0B1
 000399EB    mov         eax,ebx
 000399ED    call        TWinControl.GetHandle
 000399F2    push        eax
 000399F3    call        user32.SendMessageA
 000399F8    push        0
 000399FA    push        0
 000399FC    push        0B7
 00039A01    mov         eax,ebx
 00039A03    call        TWinControl.GetHandle
 00039A08    push        eax
 00039A09    call        user32.SendMessageA
 00039A0E    pop         ecx
 00039A0F    pop         edx
 00039A10    pop         esi
 00039A11    pop         ebx
 00039A12    ret
*}
end;

//00039A14
procedure TCustomEdit.Clear;
begin
{*
 00039A14    push        ebx
 00039A15    mov         ebx,eax
 00039A17    push        39A2C
 00039A1C    mov         eax,ebx
 00039A1E    call        TWinControl.GetHandle
 00039A23    push        eax
 00039A24    call        user32.SetWindowTextA
 00039A29    pop         ebx
 00039A2A    ret
*}
end;

//00039A30
procedure TCustomEdit.CopyToClipboard;
begin
{*
 00039A30    push        ebx
 00039A31    mov         ebx,eax
 00039A33    push        0
 00039A35    push        0
 00039A37    push        301
 00039A3C    mov         eax,ebx
 00039A3E    call        TWinControl.GetHandle
 00039A43    push        eax
 00039A44    call        user32.SendMessageA
 00039A49    pop         ebx
 00039A4A    ret
*}
end;

//00039A4C
procedure TCustomEdit.SelectAll;
begin
{*
 00039A4C    push        ebx
 00039A4D    mov         ebx,eax
 00039A4F    push        0FF
 00039A51    push        0
 00039A53    push        0B1
 00039A58    mov         eax,ebx
 00039A5A    call        TWinControl.GetHandle
 00039A5F    push        eax
 00039A60    call        user32.SendMessageA
 00039A65    pop         ebx
 00039A66    ret
*}
end;

//00039A68
function TCustomEdit.GetSelTextBuf(Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 00039A68    push        ebp
 00039A69    mov         ebp,esp
 00039A6B    add         esp,0FFFFFFF4
 00039A6E    push        ebx
 00039A6F    push        esi
 00039A70    push        edi
 00039A71    mov         edi,ecx
 00039A73    mov         dword ptr [ebp-4],edx
 00039A76    mov         ebx,eax
 00039A78    mov         eax,ebx
 00039A7A    mov         edx,dword ptr [eax]
 00039A7C    call        dword ptr [edx+0C0]
 00039A82    mov         esi,eax
 00039A84    mov         eax,ebx
 00039A86    mov         edx,dword ptr [eax]
 00039A88    call        dword ptr [edx+0BC]
 00039A8E    mov         dword ptr [ebp-8],eax
 00039A91    mov         eax,ebx
 00039A93    call        TControl.GetTextLen
 00039A98    inc         eax
 00039A99    call        StrAlloc
 00039A9E    mov         dword ptr [ebp-0C],eax
 00039AA1    xor         eax,eax
 00039AA3    push        ebp
 00039AA4    push        39AF2
 00039AA9    push        dword ptr fs:[eax]
 00039AAC    mov         dword ptr fs:[eax],esp
 00039AAF    mov         eax,dword ptr [ebp-0C]
 00039AB2    call        StrBufSize
 00039AB7    mov         ecx,eax
 00039AB9    mov         edx,dword ptr [ebp-0C]
 00039ABC    mov         eax,ebx
 00039ABE    call        TControl.GetTextBuf
 00039AC3    cmp         edi,dword ptr [ebp-8]
>00039AC6    jg          00039ACC
 00039AC8    dec         edi
 00039AC9    mov         dword ptr [ebp-8],edi
 00039ACC    mov         edx,dword ptr [ebp-0C]
 00039ACF    add         edx,esi
 00039AD1    mov         ecx,dword ptr [ebp-8]
 00039AD4    mov         eax,dword ptr [ebp-4]
 00039AD7    call        StrLCopy
 00039ADC    xor         eax,eax
 00039ADE    pop         edx
 00039ADF    pop         ecx
 00039AE0    pop         ecx
 00039AE1    mov         dword ptr fs:[eax],edx
 00039AE4    push        39AF9
 00039AE9    mov         eax,dword ptr [ebp-0C]
 00039AEC    call        StrDispose
 00039AF1    ret
>00039AF2    jmp         @HandleFinally
>00039AF7    jmp         00039AE9
 00039AF9    mov         eax,dword ptr [ebp-8]
 00039AFC    pop         edi
 00039AFD    pop         esi
 00039AFE    pop         ebx
 00039AFF    mov         esp,ebp
 00039B01    pop         ebp
 00039B02    ret
*}
end;

//00039B04
function TCustomEdit.GetSelText:AnsiString;
begin
{*
 00039B04    push        ebp
 00039B05    mov         ebp,esp
 00039B07    add         esp,0FFFFFFF8
 00039B0A    push        ebx
 00039B0B    push        esi
 00039B0C    push        edi
 00039B0D    mov         edi,edx
 00039B0F    mov         ebx,eax
 00039B11    mov         eax,ebx
 00039B13    mov         edx,dword ptr [eax]
 00039B15    call        dword ptr [edx+0C0]
 00039B1B    mov         dword ptr [ebp-8],eax
 00039B1E    mov         eax,ebx
 00039B20    mov         edx,dword ptr [eax]
 00039B22    call        dword ptr [edx+0BC]
 00039B28    mov         esi,eax
 00039B2A    mov         eax,edi
 00039B2C    mov         ecx,esi
 00039B2E    xor         edx,edx
 00039B30    call        @LStrFromPCharLen
 00039B35    test        esi,esi
>00039B37    je          00039B99
 00039B39    mov         eax,ebx
 00039B3B    call        TControl.GetTextLen
 00039B40    inc         eax
 00039B41    call        StrAlloc
 00039B46    mov         dword ptr [ebp-4],eax
 00039B49    xor         eax,eax
 00039B4B    push        ebp
 00039B4C    push        39B92
 00039B51    push        dword ptr fs:[eax]
 00039B54    mov         dword ptr fs:[eax],esp
 00039B57    mov         eax,dword ptr [ebp-4]
 00039B5A    call        StrBufSize
 00039B5F    mov         ecx,eax
 00039B61    mov         edx,dword ptr [ebp-4]
 00039B64    mov         eax,ebx
 00039B66    call        TControl.GetTextBuf
 00039B6B    mov         eax,dword ptr [ebp-4]
 00039B6E    mov         edx,dword ptr [ebp-8]
 00039B71    add         eax,edx
 00039B73    mov         edx,dword ptr [edi]
 00039B75    mov         ecx,esi
 00039B77    call        Move
 00039B7C    xor         eax,eax
 00039B7E    pop         edx
 00039B7F    pop         ecx
 00039B80    pop         ecx
 00039B81    mov         dword ptr fs:[eax],edx
 00039B84    push        39B99
 00039B89    mov         eax,dword ptr [ebp-4]
 00039B8C    call        StrDispose
 00039B91    ret
>00039B92    jmp         @HandleFinally
>00039B97    jmp         00039B89
 00039B99    pop         edi
 00039B9A    pop         esi
 00039B9B    pop         ebx
 00039B9C    pop         ecx
 00039B9D    pop         ecx
 00039B9E    pop         ebp
 00039B9F    ret
*}
end;

//00039BA0
procedure TCustomEdit.SetSelText(const Value:AnsiString);
begin
{*
 00039BA0    push        ebx
 00039BA1    push        esi
 00039BA2    mov         esi,edx
 00039BA4    mov         ebx,eax
 00039BA6    mov         eax,esi
 00039BA8    call        @LStrToPChar
 00039BAD    push        eax
 00039BAE    push        0
 00039BB0    push        0C2
 00039BB5    mov         eax,ebx
 00039BB7    call        TWinControl.GetHandle
 00039BBC    push        eax
 00039BBD    call        user32.SendMessageA
 00039BC2    pop         esi
 00039BC3    pop         ebx
 00039BC4    ret
*}
end;

//00039BC8
procedure TCustomEdit.CreateParams(var Params:TCreateParams);
begin
{*
 00039BC8    push        ebx
 00039BC9    push        esi
 00039BCA    mov         esi,edx
 00039BCC    mov         ebx,eax
 00039BCE    mov         edx,esi
 00039BD0    mov         eax,ebx
 00039BD2    call        TWinControl.CreateParams
 00039BD7    mov         ecx,39C7C
 00039BDC    mov         edx,esi
 00039BDE    mov         eax,ebx
 00039BE0    call        TWinControl.CreateSubClass
 00039BE5    mov         eax,dword ptr [esi+4]
 00039BE8    or          eax,0C0
 00039BED    xor         edx,edx
 00039BEF    mov         dl,byte ptr [ebx+1F0]
 00039BF5    or          eax,dword ptr [edx*4+0B4678]
 00039BFC    cmp         byte ptr [ebx+1F1],0
 00039C03    setne       dl
 00039C06    and         edx,7F
 00039C09    or          eax,dword ptr [edx*4+0B4690]
 00039C10    xor         edx,edx
 00039C12    mov         dl,byte ptr [ebx+1F2]
 00039C18    or          eax,dword ptr [edx*4+0B4698]
 00039C1F    xor         edx,edx
 00039C21    mov         dl,byte ptr [ebx+1F7]
 00039C27    or          eax,dword ptr [edx*4+0B46A0]
 00039C2E    xor         edx,edx
 00039C30    mov         dl,byte ptr [ebx+1F5]
 00039C36    or          eax,dword ptr [edx*4+0B46AC]
 00039C3D    xor         edx,edx
 00039C3F    mov         dl,byte ptr [ebx+1F6]
 00039C45    or          eax,dword ptr [edx*4+0B46B4]
 00039C4C    mov         dword ptr [esi+4],eax
 00039C4F    mov         eax,[000B58C0];NewStyleControls:Boolean
 00039C54    cmp         byte ptr [eax],0
>00039C57    je          00039C79
 00039C59    cmp         byte ptr [ebx+12C],0
>00039C60    je          00039C79
 00039C62    cmp         byte ptr [ebx+1F0],1
>00039C69    jne         00039C79
 00039C6B    and         dword ptr [esi+4],0FF7FFFFF
 00039C72    or          dword ptr [esi+8],200
 00039C79    pop         esi
 00039C7A    pop         ebx
 00039C7B    ret
*}
end;

//00039C84
procedure TCustomEdit.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 00039C84    push        ebx
 00039C85    push        esi
 00039C86    push        edi
 00039C87    add         esp,0FFFFFF74
 00039C8D    mov         ebx,eax
 00039C8F    mov         eax,[000B5C08];SysLocale:TSysLocale
 00039C94    cmp         byte ptr [eax+8],0
>00039C98    je          00039CE1
 00039C9A    mov         eax,[000B5C00]
 00039C9F    cmp         dword ptr [eax],2
>00039CA2    je          00039CE1
 00039CA4    test        byte ptr [edx+5],8
>00039CA8    je          00039CE1
 00039CAA    mov         esi,edx
 00039CAC    mov         edi,esp
 00039CAE    mov         ecx,23
 00039CB3    rep movs    dword ptr [edi],dword ptr [esi]
 00039CB5    and         dword ptr [esp+4],0FFFFF7FF
 00039CBD    mov         edx,esp
 00039CBF    mov         eax,ebx
 00039CC1    call        TWinControl.CreateWindowHandle
 00039CC6    mov         eax,dword ptr [ebx+140]
 00039CCC    test        eax,eax
>00039CCE    je          00039CE8
 00039CD0    push        0
 00039CD2    push        1
 00039CD4    push        0CF
 00039CD9    push        eax
 00039CDA    call        user32.SendMessageA
>00039CDF    jmp         00039CE8
 00039CE1    mov         eax,ebx
 00039CE3    call        TWinControl.CreateWindowHandle
 00039CE8    add         esp,8C
 00039CEE    pop         edi
 00039CEF    pop         esi
 00039CF0    pop         ebx
 00039CF1    ret
*}
end;

//00039CF4
procedure TCustomEdit.CreateWnd;
begin
{*
 00039CF4    push        ebp
 00039CF5    mov         ebp,esp
 00039CF7    push        ecx
 00039CF8    mov         dword ptr [ebp-4],eax
 00039CFB    mov         eax,dword ptr [ebp-4]
 00039CFE    mov         byte ptr [eax+1F8],1
 00039D05    xor         eax,eax
 00039D07    push        ebp
 00039D08    push        39D33
 00039D0D    push        dword ptr fs:[eax]
 00039D10    mov         dword ptr fs:[eax],esp
 00039D13    mov         eax,dword ptr [ebp-4]
 00039D16    call        TWinControl.CreateWnd
 00039D1B    xor         eax,eax
 00039D1D    pop         edx
 00039D1E    pop         ecx
 00039D1F    pop         ecx
 00039D20    mov         dword ptr fs:[eax],edx
 00039D23    push        39D3A
 00039D28    mov         eax,dword ptr [ebp-4]
 00039D2B    mov         byte ptr [eax+1F8],0
 00039D32    ret
>00039D33    jmp         @HandleFinally
>00039D38    jmp         00039D28
 00039D3A    mov         eax,dword ptr [ebp-4]
 00039D3D    mov         edx,dword ptr [eax+1EC]
 00039D43    mov         eax,dword ptr [ebp-4]
 00039D46    mov         ecx,dword ptr [eax]
 00039D48    call        dword ptr [ecx+0B8]
 00039D4E    mov         eax,dword ptr [ebp-4]
 00039D51    mov         dl,byte ptr [eax+1F9]
 00039D57    mov         eax,dword ptr [ebp-4]
 00039D5A    call        TCustomEdit.SetModified
 00039D5F    mov         eax,dword ptr [ebp-4]
 00039D62    cmp         byte ptr [eax+1F1],0
>00039D69    je          00039D8B
 00039D6B    push        0
 00039D6D    mov         eax,dword ptr [ebp-4]
 00039D70    movzx       eax,byte ptr [eax+1F1]
 00039D77    push        eax
 00039D78    push        0CC
 00039D7D    mov         eax,dword ptr [ebp-4]
 00039D80    call        TWinControl.GetHandle
 00039D85    push        eax
 00039D86    call        user32.SendMessageA
 00039D8B    mov         eax,dword ptr [ebp-4]
 00039D8E    call        TCustomEdit.UpdateHeight
 00039D93    pop         ecx
 00039D94    pop         ebp
 00039D95    ret
*}
end;

//00039D98
procedure TCustomEdit.DestroyWnd;
begin
{*
 00039D98    push        ebx
 00039D99    mov         ebx,eax
 00039D9B    mov         eax,ebx
 00039D9D    call        TCustomEdit.GetModified
 00039DA2    mov         byte ptr [ebx+1F9],al
 00039DA8    mov         eax,ebx
 00039DAA    call        TWinControl.DestroyWnd
 00039DAF    pop         ebx
 00039DB0    ret
*}
end;

//00039DB4
procedure TCustomEdit.UpdateHeight;
begin
{*
 00039DB4    push        ebx
 00039DB5    mov         ebx,eax
 00039DB7    cmp         byte ptr [ebx+1F3],0
>00039DBE    je          00039DDD
 00039DC0    cmp         byte ptr [ebx+1F0],1
>00039DC7    jne         00039DDD
 00039DC9    mov         eax,[00039DEC]
 00039DCE    or          eax,dword ptr [ebx+40]
 00039DD1    mov         dword ptr [ebx+40],eax
 00039DD4    mov         eax,ebx
 00039DD6    call        TCustomEdit.AdjustHeight
 00039DDB    pop         ebx
 00039DDC    ret
 00039DDD    mov         eax,[00039DEC]
 00039DE2    not         eax
 00039DE4    and         eax,dword ptr [ebx+40]
 00039DE7    mov         dword ptr [ebx+40],eax
 00039DEA    pop         ebx
 00039DEB    ret
*}
end;

//00039DF0
procedure TCustomEdit.AdjustHeight;
begin
{*
 00039DF0    push        ebx
 00039DF1    push        esi
 00039DF2    push        edi
 00039DF3    add         esp,0FFFFFF90
 00039DF6    mov         esi,eax
 00039DF8    push        0
 00039DFA    call        user32.GetDC
 00039DFF    mov         ebx,eax
 00039E01    push        esp
 00039E02    push        ebx
 00039E03    call        gdi32.GetTextMetricsA
 00039E08    mov         eax,dword ptr [esi+58]
 00039E0B    call        TFont.GetHandle
 00039E10    push        eax
 00039E11    push        ebx
 00039E12    call        gdi32.SelectObject
 00039E17    mov         edi,eax
 00039E19    lea         eax,[esp+38]
 00039E1D    push        eax
 00039E1E    push        ebx
 00039E1F    call        gdi32.GetTextMetricsA
 00039E24    push        edi
 00039E25    push        ebx
 00039E26    call        gdi32.SelectObject
 00039E2B    push        ebx
 00039E2C    push        0
 00039E2E    call        user32.ReleaseDC
 00039E33    mov         eax,[000B58C0];NewStyleControls:Boolean
 00039E38    cmp         byte ptr [eax],0
>00039E3B    je          00039E5F
 00039E3D    cmp         byte ptr [esi+12C],0
>00039E44    je          00039E4D
 00039E46    mov         ebx,8
>00039E4B    jmp         00039E52
 00039E4D    mov         ebx,6
 00039E52    push        6
 00039E54    call        user32.GetSystemMetrics
 00039E59    imul        ebx
 00039E5B    mov         ebx,eax
>00039E5D    jmp         00039E84
 00039E5F    mov         ebx,dword ptr [esp]
 00039E62    mov         eax,dword ptr [esp+38]
 00039E66    cmp         ebx,eax
>00039E68    jle         00039E6C
 00039E6A    mov         ebx,eax
 00039E6C    push        6
 00039E6E    call        user32.GetSystemMetrics
 00039E73    shl         eax,2
 00039E76    test        ebx,ebx
>00039E78    jns         00039E7D
 00039E7A    add         ebx,3
 00039E7D    sar         ebx,2
 00039E80    add         eax,ebx
 00039E82    mov         ebx,eax
 00039E84    mov         edx,dword ptr [esp+38]
 00039E88    add         edx,ebx
 00039E8A    mov         eax,esi
 00039E8C    call        TControl.SetHeight
 00039E91    add         esp,70
 00039E94    pop         edi
 00039E95    pop         esi
 00039E96    pop         ebx
 00039E97    ret
*}
end;

//00039E98
procedure TCustomEdit.Change;
begin
{*
 00039E98    push        ebx
 00039E99    mov         ebx,eax
 00039E9B    mov         eax,ebx
 00039E9D    call        TControl.Changed
 00039EA2    cmp         word ptr [ebx+1FE],0
>00039EAA    je          00039EBA
 00039EAC    mov         edx,ebx
 00039EAE    mov         eax,dword ptr [ebx+200]
 00039EB4    call        dword ptr [ebx+1FC]
 00039EBA    pop         ebx
 00039EBB    ret
*}
end;

//00039EBC
procedure TCustomEdit.DefaultHandler(var Message:void );
begin
{*
 00039EBC    push        ebx
 00039EBD    push        esi
 00039EBE    mov         ebx,edx
 00039EC0    mov         esi,eax
 00039EC2    mov         eax,dword ptr [ebx]
 00039EC4    sub         eax,7
>00039EC7    je          00039EDD
 00039EC9    sub         eax,1FE
>00039ECE    jne         00039EF9
 00039ED0    mov         eax,esi
 00039ED2    call        HasPopup
 00039ED7    test        al,al
>00039ED9    jne         00039F02
>00039EDB    jmp         00039EF9
 00039EDD    mov         eax,[000B5C00]
 00039EE2    cmp         dword ptr [eax],1
>00039EE5    jne         00039EF9
 00039EE7    mov         eax,dword ptr [ebx+4]
 00039EEA    push        eax
 00039EEB    call        user32.IsWindow
 00039EF0    test        eax,eax
>00039EF2    jne         00039EF9
 00039EF4    xor         eax,eax
 00039EF6    mov         dword ptr [ebx+4],eax
 00039EF9    mov         edx,ebx
 00039EFB    mov         eax,esi
 00039EFD    call        TWinControl.DefaultHandler
 00039F02    pop         esi
 00039F03    pop         ebx
 00039F04    ret
*}
end;

//00039F08
procedure TCustomEdit.WMSetFont(var Message:TWMSetFont);
begin
{*
 00039F08    push        esi
 00039F09    mov         esi,eax
 00039F0B    mov         eax,esi
 00039F0D    mov         ecx,dword ptr [eax]
 00039F0F    call        dword ptr [ecx-10]
 00039F12    mov         eax,[000B58C0];NewStyleControls:Boolean
 00039F17    cmp         byte ptr [eax],0
>00039F1A    je          00039F45
 00039F1C    push        0F0
 00039F1E    mov         eax,esi
 00039F20    call        TWinControl.GetHandle
 00039F25    push        eax
 00039F26    call        user32.GetWindowLongA
 00039F2B    test        al,4
>00039F2D    jne         00039F45
 00039F2F    push        0
 00039F31    push        3
 00039F33    push        0D3
 00039F38    mov         eax,esi
 00039F3A    call        TWinControl.GetHandle
 00039F3F    push        eax
 00039F40    call        user32.SendMessageA
 00039F45    pop         esi
 00039F46    ret
*}
end;

//00039F48
procedure TCustomEdit.CMCtl3DChanged(var Message:TMessage);
begin
{*
 00039F48    push        ebx
 00039F49    push        esi
 00039F4A    mov         esi,edx
 00039F4C    mov         ebx,eax
 00039F4E    mov         eax,[000B58C0];NewStyleControls:Boolean
 00039F53    cmp         byte ptr [eax],0
>00039F56    je          00039F6F
 00039F58    cmp         byte ptr [ebx+1F0],1
>00039F5F    jne         00039F6F
 00039F61    mov         eax,ebx
 00039F63    call        TCustomEdit.UpdateHeight
 00039F68    mov         eax,ebx
 00039F6A    call        TWinControl.RecreateWnd
 00039F6F    mov         edx,esi
 00039F71    mov         eax,ebx
 00039F73    call        TWinControl.CMCtl3DChanged
 00039F78    pop         esi
 00039F79    pop         ebx
 00039F7A    ret
*}
end;

//00039F7C
procedure TCustomEdit.CMFontChanged(var Message:TMessage);
begin
{*
 00039F7C    push        ebx
 00039F7D    mov         ebx,eax
 00039F7F    mov         eax,ebx
 00039F81    call        TWinControl.CMFontChanged
 00039F86    test        byte ptr [ebx+41],2
>00039F8A    je          00039F9F
 00039F8C    test        byte ptr [ebx+20],10
>00039F90    je          00039F98
 00039F92    test        byte ptr [ebx+20],1
>00039F96    jne         00039F9F
 00039F98    mov         eax,ebx
 00039F9A    call        TCustomEdit.AdjustHeight
 00039F9F    pop         ebx
 00039FA0    ret
*}
end;

//00039FA4
procedure TCustomEdit.CNCommand(var Message:TWMCommand);
begin
{*
 00039FA4    push        ebx
 00039FA5    cmp         word ptr [edx+6],300
>00039FAB    jne         00039FBF
 00039FAD    cmp         byte ptr [eax+1F8],0
>00039FB4    jne         00039FBF
 00039FB6    mov         bx,0FFB8
 00039FBA    call        @CallDynaInst
 00039FBF    pop         ebx
 00039FC0    ret
*}
end;

//00039FC4
procedure TCustomEdit.CMEnter(var Message:TCMGotFocus);
begin
{*
 00039FC4    push        ebx
 00039FC5    push        esi
 00039FC6    mov         esi,edx
 00039FC8    mov         ebx,eax
 00039FCA    cmp         byte ptr [ebx+1F4],0
>00039FD1    je          00039FF3
 00039FD3    test        byte ptr [ebx+44],1
>00039FD7    jne         00039FF3
 00039FD9    push        0F0
 00039FDB    mov         eax,ebx
 00039FDD    call        TWinControl.GetHandle
 00039FE2    push        eax
 00039FE3    call        user32.GetWindowLongA
 00039FE8    test        al,4
>00039FEA    jne         00039FF3
 00039FEC    mov         eax,ebx
 00039FEE    call        TCustomEdit.SelectAll
 00039FF3    mov         edx,esi
 00039FF5    mov         eax,ebx
 00039FF7    call        TWinControl.CMEnter
 00039FFC    pop         esi
 00039FFD    pop         ebx
 00039FFE    ret
*}
end;

//0003A000
procedure TCustomEdit.CMTextChanged(var Message:TMessage);
begin
{*
 0003A000    push        ebx
 0003A001    push        esi
 0003A002    mov         esi,eax
 0003A004    mov         eax,esi
 0003A006    mov         ecx,dword ptr [eax]
 0003A008    call        dword ptr [ecx-10]
 0003A00B    mov         eax,esi
 0003A00D    call        TWinControl.HandleAllocated
 0003A012    test        al,al
>0003A014    je          0003A029
 0003A016    push        0F0
 0003A018    mov         eax,esi
 0003A01A    call        TWinControl.GetHandle
 0003A01F    push        eax
 0003A020    call        user32.GetWindowLongA
 0003A025    test        al,4
>0003A027    je          0003A034
 0003A029    mov         eax,esi
 0003A02B    mov         bx,0FFB8
 0003A02F    call        @CallDynaInst
 0003A034    pop         esi
 0003A035    pop         ebx
 0003A036    ret
*}
end;

//0003A038
function TMemoStrings.GetCount:Integer;
begin
{*
 0003A038    push        ebx
 0003A039    push        esi
 0003A03A    mov         ebx,eax
 0003A03C    xor         esi,esi
 0003A03E    mov         eax,dword ptr [ebx+0C]
 0003A041    call        TWinControl.HandleAllocated
 0003A046    test        al,al
>0003A048    je          0003A097
 0003A04A    push        0
 0003A04C    push        0
 0003A04E    push        0BA
 0003A053    mov         eax,dword ptr [ebx+0C]
 0003A056    call        TWinControl.GetHandle
 0003A05B    push        eax
 0003A05C    call        user32.SendMessageA
 0003A061    mov         esi,eax
 0003A063    push        0
 0003A065    push        0
 0003A067    mov         eax,esi
 0003A069    dec         eax
 0003A06A    push        eax
 0003A06B    push        0BB
 0003A070    mov         eax,dword ptr [ebx+0C]
 0003A073    call        TWinControl.GetHandle
 0003A078    push        eax
 0003A079    call        user32.SendMessageA
 0003A07E    push        eax
 0003A07F    push        0C1
 0003A084    mov         eax,dword ptr [ebx+0C]
 0003A087    call        TWinControl.GetHandle
 0003A08C    push        eax
 0003A08D    call        user32.SendMessageA
 0003A092    test        eax,eax
>0003A094    jne         0003A097
 0003A096    dec         esi
 0003A097    mov         eax,esi
 0003A099    pop         esi
 0003A09A    pop         ebx
 0003A09B    ret
*}
end;

//0003A09C
function TMemoStrings.Get(Index:Integer):AnsiString;
begin
{*
 0003A09C    push        ebx
 0003A09D    push        esi
 0003A09E    push        edi
 0003A09F    add         esp,0FFFFF004
 0003A0A5    push        eax
 0003A0A6    mov         edi,ecx
 0003A0A8    mov         esi,edx
 0003A0AA    mov         ebx,eax
 0003A0AC    mov         eax,esp
 0003A0AE    mov         word ptr [eax],1000
 0003A0B3    mov         eax,esp
 0003A0B5    push        eax
 0003A0B6    push        esi
 0003A0B7    push        0C4
 0003A0BC    mov         eax,dword ptr [ebx+0C]
 0003A0BF    call        TWinControl.GetHandle
 0003A0C4    push        eax
 0003A0C5    call        user32.SendMessageA
 0003A0CA    mov         ecx,eax
 0003A0CC    mov         edx,esp
 0003A0CE    mov         eax,edi
 0003A0D0    call        @LStrFromPCharLen
 0003A0D5    add         esp,1000
 0003A0DB    pop         edi
 0003A0DC    pop         esi
 0003A0DD    pop         ebx
 0003A0DE    ret
*}
end;

//0003A0E0
procedure TMemoStrings.Put(Index:Integer; const S:AnsiString);
begin
{*
 0003A0E0    push        ebx
 0003A0E1    push        esi
 0003A0E2    push        edi
 0003A0E3    mov         edi,ecx
 0003A0E5    mov         esi,edx
 0003A0E7    mov         ebx,eax
 0003A0E9    push        0
 0003A0EB    push        esi
 0003A0EC    push        0BB
 0003A0F1    mov         eax,dword ptr [ebx+0C]
 0003A0F4    call        TWinControl.GetHandle
 0003A0F9    push        eax
 0003A0FA    call        user32.SendMessageA
 0003A0FF    mov         esi,eax
 0003A101    test        esi,esi
>0003A103    jl          0003A14F
 0003A105    push        0
 0003A107    push        esi
 0003A108    push        0C1
 0003A10D    mov         eax,dword ptr [ebx+0C]
 0003A110    call        TWinControl.GetHandle
 0003A115    push        eax
 0003A116    call        user32.SendMessageA
 0003A11B    add         eax,esi
 0003A11D    push        eax
 0003A11E    push        esi
 0003A11F    push        0B1
 0003A124    mov         eax,dword ptr [ebx+0C]
 0003A127    call        TWinControl.GetHandle
 0003A12C    push        eax
 0003A12D    call        user32.SendMessageA
 0003A132    mov         eax,edi
 0003A134    call        @LStrToPChar
 0003A139    push        eax
 0003A13A    push        0
 0003A13C    push        0C2
 0003A141    mov         eax,dword ptr [ebx+0C]
 0003A144    call        TWinControl.GetHandle
 0003A149    push        eax
 0003A14A    call        user32.SendMessageA
 0003A14F    pop         edi
 0003A150    pop         esi
 0003A151    pop         ebx
 0003A152    ret
*}
end;

//0003A154
procedure TMemoStrings.Insert(Index:Integer; const S:AnsiString);
begin
{*
 0003A154    push        ebp
 0003A155    mov         ebp,esp
 0003A157    add         esp,0FFFFFFF8
 0003A15A    push        ebx
 0003A15B    push        esi
 0003A15C    push        edi
 0003A15D    xor         ebx,ebx
 0003A15F    mov         dword ptr [ebp-8],ebx
 0003A162    mov         dword ptr [ebp-4],ecx
 0003A165    mov         edi,edx
 0003A167    mov         esi,eax
 0003A169    xor         eax,eax
 0003A16B    push        ebp
 0003A16C    push        3A23F
 0003A171    push        dword ptr fs:[eax]
 0003A174    mov         dword ptr fs:[eax],esp
 0003A177    test        edi,edi
>0003A179    jl          0003A229
 0003A17F    push        0
 0003A181    push        edi
 0003A182    push        0BB
 0003A187    mov         eax,dword ptr [esi+0C]
 0003A18A    call        TWinControl.GetHandle
 0003A18F    push        eax
 0003A190    call        user32.SendMessageA
 0003A195    mov         ebx,eax
 0003A197    test        ebx,ebx
>0003A199    jl          0003A1AD
 0003A19B    lea         eax,[ebp-8]
 0003A19E    mov         ecx,3A258;#13+#10
 0003A1A3    mov         edx,dword ptr [ebp-4]
 0003A1A6    call        @LStrCat3
>0003A1AB    jmp         0003A1F6
 0003A1AD    push        0
 0003A1AF    dec         edi
 0003A1B0    push        edi
 0003A1B1    push        0BB
 0003A1B6    mov         eax,dword ptr [esi+0C]
 0003A1B9    call        TWinControl.GetHandle
 0003A1BE    push        eax
 0003A1BF    call        user32.SendMessageA
 0003A1C4    mov         ebx,eax
 0003A1C6    test        ebx,ebx
>0003A1C8    jl          0003A229
 0003A1CA    push        0
 0003A1CC    push        ebx
 0003A1CD    push        0C1
 0003A1D2    mov         eax,dword ptr [esi+0C]
 0003A1D5    call        TWinControl.GetHandle
 0003A1DA    push        eax
 0003A1DB    call        user32.SendMessageA
 0003A1E0    test        eax,eax
>0003A1E2    je          0003A229
 0003A1E4    add         ebx,eax
 0003A1E6    lea         eax,[ebp-8]
 0003A1E9    mov         ecx,dword ptr [ebp-4]
 0003A1EC    mov         edx,3A258;#13+#10
 0003A1F1    call        @LStrCat3
 0003A1F6    push        ebx
 0003A1F7    push        ebx
 0003A1F8    push        0B1
 0003A1FD    mov         eax,dword ptr [esi+0C]
 0003A200    call        TWinControl.GetHandle
 0003A205    push        eax
 0003A206    call        user32.SendMessageA
 0003A20B    mov         eax,dword ptr [ebp-8]
 0003A20E    call        @LStrToPChar
 0003A213    push        eax
 0003A214    push        0
 0003A216    push        0C2
 0003A21B    mov         eax,dword ptr [esi+0C]
 0003A21E    call        TWinControl.GetHandle
 0003A223    push        eax
 0003A224    call        user32.SendMessageA
 0003A229    xor         eax,eax
 0003A22B    pop         edx
 0003A22C    pop         ecx
 0003A22D    pop         ecx
 0003A22E    mov         dword ptr fs:[eax],edx
 0003A231    push        3A246
 0003A236    lea         eax,[ebp-8]
 0003A239    call        @LStrClr
 0003A23E    ret
>0003A23F    jmp         @HandleFinally
>0003A244    jmp         0003A236
 0003A246    pop         edi
 0003A247    pop         esi
 0003A248    pop         ebx
 0003A249    pop         ecx
 0003A24A    pop         ecx
 0003A24B    pop         ebp
 0003A24C    ret
*}
end;

//0003A260
procedure TMemoStrings.Delete(Index:Integer);
begin
{*
 0003A260    push        ebx
 0003A261    push        esi
 0003A262    push        edi
 0003A263    mov         edi,edx
 0003A265    mov         ebx,eax
 0003A267    push        0
 0003A269    push        edi
 0003A26A    push        0BB
 0003A26F    mov         eax,dword ptr [ebx+0C]
 0003A272    call        TWinControl.GetHandle
 0003A277    push        eax
 0003A278    call        user32.SendMessageA
 0003A27D    mov         esi,eax
 0003A27F    test        esi,esi
>0003A281    jl          0003A2EA
 0003A283    push        0
 0003A285    inc         edi
 0003A286    push        edi
 0003A287    push        0BB
 0003A28C    mov         eax,dword ptr [ebx+0C]
 0003A28F    call        TWinControl.GetHandle
 0003A294    push        eax
 0003A295    call        user32.SendMessageA
 0003A29A    mov         edi,eax
 0003A29C    test        edi,edi
>0003A29E    jge         0003A2BA
 0003A2A0    push        0
 0003A2A2    push        esi
 0003A2A3    push        0C1
 0003A2A8    mov         eax,dword ptr [ebx+0C]
 0003A2AB    call        TWinControl.GetHandle
 0003A2B0    push        eax
 0003A2B1    call        user32.SendMessageA
 0003A2B6    mov         edi,eax
 0003A2B8    add         edi,esi
 0003A2BA    push        edi
 0003A2BB    push        esi
 0003A2BC    push        0B1
 0003A2C1    mov         eax,dword ptr [ebx+0C]
 0003A2C4    call        TWinControl.GetHandle
 0003A2C9    push        eax
 0003A2CA    call        user32.SendMessageA
 0003A2CF    mov         eax,[000B46BC]
 0003A2D4    push        eax
 0003A2D5    push        0
 0003A2D7    push        0C2
 0003A2DC    mov         eax,dword ptr [ebx+0C]
 0003A2DF    call        TWinControl.GetHandle
 0003A2E4    push        eax
 0003A2E5    call        user32.SendMessageA
 0003A2EA    pop         edi
 0003A2EB    pop         esi
 0003A2EC    pop         ebx
 0003A2ED    ret
*}
end;

//0003A2F0
procedure TMemoStrings.Clear;
begin
{*
 0003A2F0    push        esi
 0003A2F1    mov         esi,eax
 0003A2F3    mov         eax,dword ptr [esi+0C]
 0003A2F6    mov         edx,dword ptr [eax]
 0003A2F8    call        dword ptr [edx+0D0]
 0003A2FE    pop         esi
 0003A2FF    ret
*}
end;

//0003A300
procedure TMemoStrings.SetUpdateState(Updating:Boolean);
begin
{*
 0003A300    push        ebx
 0003A301    push        esi
 0003A302    mov         ebx,edx
 0003A304    mov         esi,eax
 0003A306    mov         eax,dword ptr [esi+0C]
 0003A309    call        TWinControl.HandleAllocated
 0003A30E    test        al,al
>0003A310    je          0003A34C
 0003A312    push        0
 0003A314    mov         eax,ebx
 0003A316    xor         al,1
 0003A318    and         eax,7F
 0003A31B    push        eax
 0003A31C    push        0B
 0003A31E    mov         eax,dword ptr [esi+0C]
 0003A321    call        TWinControl.GetHandle
 0003A326    push        eax
 0003A327    call        user32.SendMessageA
 0003A32C    xor         bl,1
 0003A32F    test        bl,bl
>0003A331    je          0003A34C
 0003A333    push        0
 0003A335    xor         ecx,ecx
 0003A337    mov         edx,0B019
 0003A33C    mov         eax,dword ptr [esi+0C]
 0003A33F    call        TControl.Perform
 0003A344    mov         eax,dword ptr [esi+0C]
 0003A347    call        TControl.Refresh
 0003A34C    pop         esi
 0003A34D    pop         ebx
 0003A34E    ret
*}
end;

//0003A350
function TMemoStrings.GetTextStr:AnsiString;
begin
{*
 0003A350    push        ebx
 0003A351    push        esi
 0003A352    mov         esi,edx
 0003A354    mov         ebx,eax
 0003A356    mov         edx,esi
 0003A358    mov         eax,dword ptr [ebx+0C]
 0003A35B    call        TControl.GetText
 0003A360    pop         esi
 0003A361    pop         ebx
 0003A362    ret
*}
end;

//0003A364
procedure TMemoStrings.SetTextStr(const Value:AnsiString);
begin
{*
 0003A364    push        ebp
 0003A365    mov         ebp,esp
 0003A367    push        0
 0003A369    push        0
 0003A36B    push        0
 0003A36D    push        ebx
 0003A36E    push        esi
 0003A36F    mov         esi,edx
 0003A371    mov         ebx,eax
 0003A373    xor         eax,eax
 0003A375    push        ebp
 0003A376    push        3A42B
 0003A37B    push        dword ptr fs:[eax]
 0003A37E    mov         dword ptr fs:[eax],esp
 0003A381    lea         edx,[ebp-4]
 0003A384    mov         eax,esi
 0003A386    call        AdjustLineBreaks
 0003A38B    mov         eax,dword ptr [ebp-4]
 0003A38E    call        @LStrLen
 0003A393    mov         esi,eax
 0003A395    mov         eax,dword ptr [ebx+0C]
 0003A398    call        TControl.GetTextLen
 0003A39D    cmp         esi,eax
>0003A39F    jne         0003A3B9
 0003A3A1    lea         edx,[ebp-8]
 0003A3A4    mov         eax,dword ptr [ebx+0C]
 0003A3A7    call        TControl.GetText
 0003A3AC    mov         edx,dword ptr [ebp-8]
 0003A3AF    mov         eax,dword ptr [ebp-4]
 0003A3B2    call        @LStrCmp
>0003A3B7    je          0003A405
 0003A3B9    mov         eax,dword ptr [ebp-4]
 0003A3BC    push        eax
 0003A3BD    push        0
 0003A3BF    push        0C
 0003A3C1    mov         eax,dword ptr [ebx+0C]
 0003A3C4    call        TWinControl.GetHandle
 0003A3C9    push        eax
 0003A3CA    call        user32.SendMessageA
 0003A3CF    test        eax,eax
>0003A3D1    jne         0003A3F4
 0003A3D3    lea         edx,[ebp-0C]
 0003A3D6    mov         eax,[000B5A8C];^SInvalidMemoSize:TResStringRec
 0003A3DB    call        LoadResString
 0003A3E0    mov         ecx,dword ptr [ebp-0C]
 0003A3E3    mov         dl,1
 0003A3E5    mov         eax,[0001EE64];EInvalidOperation
 0003A3EA    call        Exception.Create
 0003A3EF    call        @RaiseExcept
 0003A3F4    push        0
 0003A3F6    xor         ecx,ecx
 0003A3F8    mov         edx,0B012
 0003A3FD    mov         eax,dword ptr [ebx+0C]
 0003A400    call        TControl.Perform
 0003A405    xor         eax,eax
 0003A407    pop         edx
 0003A408    pop         ecx
 0003A409    pop         ecx
 0003A40A    mov         dword ptr fs:[eax],edx
 0003A40D    push        3A432
 0003A412    lea         eax,[ebp-0C]
 0003A415    call        @LStrClr
 0003A41A    lea         eax,[ebp-8]
 0003A41D    call        @LStrClr
 0003A422    lea         eax,[ebp-4]
 0003A425    call        @LStrClr
 0003A42A    ret
>0003A42B    jmp         @HandleFinally
>0003A430    jmp         0003A412
 0003A432    pop         esi
 0003A433    pop         ebx
 0003A434    mov         esp,ebp
 0003A436    pop         ebp
 0003A437    ret
*}
end;

//0003A438
constructor TCustomMemo.Create(AOwner:TComponent);
begin
{*
 0003A438    push        ebp
 0003A439    mov         ebp,esp
 0003A43B    push        ecx
 0003A43C    push        ebx
 0003A43D    push        esi
 0003A43E    test        dl,dl
>0003A440    je          0003A44A
 0003A442    add         esp,0FFFFFFF0
 0003A445    call        @ClassCreate
 0003A44A    mov         byte ptr [ebp-1],dl
 0003A44D    mov         ebx,eax
 0003A44F    xor         edx,edx
 0003A451    mov         eax,ebx
 0003A453    call        TCustomEdit.Create
 0003A458    mov         edx,0B9
 0003A45D    mov         eax,ebx
 0003A45F    call        TControl.SetWidth
 0003A464    mov         edx,59
 0003A469    mov         eax,ebx
 0003A46B    call        TControl.SetHeight
 0003A470    xor         edx,edx
 0003A472    mov         eax,ebx
 0003A474    call        TCustomEdit.SetAutoSize
 0003A479    mov         byte ptr [ebx+20A],1
 0003A480    mov         byte ptr [ebx+20B],1
 0003A487    mov         dl,1
 0003A489    mov         eax,[00038A84];TMemoStrings
 0003A48E    call        TObject.Create
 0003A493    mov         esi,eax
 0003A495    mov         dword ptr [ebx+204],esi
 0003A49B    mov         dword ptr [esi+0C],ebx
 0003A49E    mov         eax,ebx
 0003A4A0    cmp         byte ptr [ebp-1],0
>0003A4A4    je          0003A4B5
 0003A4A6    call        @AfterConstruction
 0003A4AB    pop         dword ptr fs:[0]
 0003A4B2    add         esp,0C
 0003A4B5    mov         eax,ebx
 0003A4B7    pop         esi
 0003A4B8    pop         ebx
 0003A4B9    pop         ecx
 0003A4BA    pop         ebp
 0003A4BB    ret
*}
end;

//0003A4BC
destructor TCustomMemo.Destroy;
begin
{*
 0003A4BC    push        ebx
 0003A4BD    push        esi
 0003A4BE    call        @BeforeDestruction
 0003A4C3    mov         ebx,edx
 0003A4C5    mov         esi,eax
 0003A4C7    mov         eax,dword ptr [esi+204]
 0003A4CD    call        TObject.Free
 0003A4D2    mov         edx,ebx
 0003A4D4    and         dl,0FC
 0003A4D7    mov         eax,esi
 0003A4D9    call        TWinControl.Destroy
 0003A4DE    test        bl,bl
>0003A4E0    jle         0003A4E9
 0003A4E2    mov         eax,esi
 0003A4E4    call        @ClassDestroy
 0003A4E9    pop         esi
 0003A4EA    pop         ebx
 0003A4EB    ret
*}
end;

//0003A4EC
procedure TCustomMemo.CreateParams(var Params:TCreateParams);
begin
{*
 0003A4EC    push        ebx
 0003A4ED    push        esi
 0003A4EE    push        edi
 0003A4EF    mov         edi,edx
 0003A4F1    mov         esi,eax
 0003A4F3    mov         edx,edi
 0003A4F5    mov         eax,esi
 0003A4F7    call        TCustomEdit.CreateParams
 0003A4FC    mov         eax,esi
 0003A4FE    mov         bx,0FFCF
 0003A502    call        @CallDynaInst
 0003A507    and         eax,7F
 0003A50A    lea         eax,[eax+eax*2]
 0003A50D    lea         eax,[eax*4+0B46C0]
 0003A514    xor         edx,edx
 0003A516    mov         dl,byte ptr [esi+208]
 0003A51C    mov         eax,dword ptr [eax+edx*4]
 0003A51F    mov         edx,dword ptr [edi+4]
 0003A522    xor         ecx,ecx
 0003A524    mov         cl,byte ptr [esi+20A]
 0003A52A    mov         ecx,dword ptr [ecx*4+0B46E8]
 0003A531    not         ecx
 0003A533    and         edx,ecx
 0003A535    or          edx,4
 0003A538    or          eax,edx
 0003A53A    xor         edx,edx
 0003A53C    mov         dl,byte ptr [esi+209]
 0003A542    or          eax,dword ptr [edx*4+0B46D8]
 0003A549    mov         dword ptr [edi+4],eax
 0003A54C    pop         edi
 0003A54D    pop         esi
 0003A54E    pop         ebx
 0003A54F    ret
*}
end;

//0003A550
procedure TCustomMemo.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 0003A550    push        ebx
 0003A551    push        esi
 0003A552    push        edi
 0003A553    mov         ebx,edx
 0003A555    mov         esi,eax
 0003A557    mov         eax,[000B5C08];SysLocale:TSysLocale
 0003A55C    cmp         byte ptr [eax+8],0
>0003A560    je          0003A5CC
 0003A562    mov         eax,[000B5C00]
 0003A567    cmp         dword ptr [eax],2
>0003A56A    je          0003A5CC
 0003A56C    test        byte ptr [ebx+5],8
>0003A570    je          0003A5CC
 0003A572    mov         eax,dword ptr [ebx+20]
 0003A575    push        eax
 0003A576    mov         eax,[000B5950];^HInstance:Longword
 0003A57B    mov         eax,dword ptr [eax]
 0003A57D    push        eax
 0003A57E    push        0
 0003A580    mov         eax,dword ptr [ebx+1C]
 0003A583    push        eax
 0003A584    mov         eax,dword ptr [ebx+18]
 0003A587    push        eax
 0003A588    mov         eax,dword ptr [ebx+14]
 0003A58B    push        eax
 0003A58C    mov         eax,dword ptr [ebx+10]
 0003A58F    push        eax
 0003A590    mov         eax,dword ptr [ebx+0C]
 0003A593    push        eax
 0003A594    mov         eax,dword ptr [ebx+4]
 0003A597    and         eax,0FFFFF7FF
 0003A59C    push        eax
 0003A59D    push        3A624
 0003A5A2    lea         eax,[ebx+4C]
 0003A5A5    push        eax
 0003A5A6    mov         eax,dword ptr [ebx+8]
 0003A5A9    push        eax
 0003A5AA    call        user32.CreateWindowExA
 0003A5AF    mov         edi,eax
 0003A5B1    mov         dword ptr [esi+140],edi
 0003A5B7    test        edi,edi
>0003A5B9    je          0003A60A
 0003A5BB    push        0
 0003A5BD    push        1
 0003A5BF    push        0CF
 0003A5C4    push        edi
 0003A5C5    call        user32.SendMessageA
>0003A5CA    jmp         0003A60A
 0003A5CC    mov         eax,dword ptr [ebx+20]
 0003A5CF    push        eax
 0003A5D0    mov         eax,[000B5950];^HInstance:Longword
 0003A5D5    mov         eax,dword ptr [eax]
 0003A5D7    push        eax
 0003A5D8    push        0
 0003A5DA    mov         eax,dword ptr [ebx+1C]
 0003A5DD    push        eax
 0003A5DE    mov         eax,dword ptr [ebx+18]
 0003A5E1    push        eax
 0003A5E2    mov         eax,dword ptr [ebx+14]
 0003A5E5    push        eax
 0003A5E6    mov         eax,dword ptr [ebx+10]
 0003A5E9    push        eax
 0003A5EA    mov         eax,dword ptr [ebx+0C]
 0003A5ED    push        eax
 0003A5EE    mov         eax,dword ptr [ebx+4]
 0003A5F1    push        eax
 0003A5F2    push        3A624
 0003A5F7    lea         eax,[ebx+4C]
 0003A5FA    push        eax
 0003A5FB    mov         eax,dword ptr [ebx+8]
 0003A5FE    push        eax
 0003A5FF    call        user32.CreateWindowExA
 0003A604    mov         dword ptr [esi+140],eax
 0003A60A    mov         eax,dword ptr [ebx]
 0003A60C    push        eax
 0003A60D    push        0
 0003A60F    push        0C
 0003A611    mov         eax,dword ptr [esi+140]
 0003A617    push        eax
 0003A618    call        user32.SendMessageA
 0003A61D    pop         edi
 0003A61E    pop         esi
 0003A61F    pop         ebx
 0003A620    ret
*}
end;

//0003A628
function TCustomMemo.GetCaretPos:TPoint;
begin
{*
 0003A628    push        ebx
 0003A629    push        esi
 0003A62A    mov         esi,edx
 0003A62C    mov         ebx,eax
 0003A62E    push        0
 0003A630    push        0
 0003A632    push        0B0
 0003A637    mov         eax,ebx
 0003A639    call        TWinControl.GetHandle
 0003A63E    push        eax
 0003A63F    call        user32.SendMessageA
 0003A644    shr         eax,10
 0003A647    movzx       eax,ax
 0003A64A    mov         dword ptr [esi],eax
 0003A64C    push        0
 0003A64E    mov         eax,dword ptr [esi]
 0003A650    push        eax
 0003A651    push        0C9
 0003A656    mov         eax,ebx
 0003A658    call        TWinControl.GetHandle
 0003A65D    push        eax
 0003A65E    call        user32.SendMessageA
 0003A663    mov         dword ptr [esi+4],eax
 0003A666    push        0
 0003A668    push        0FF
 0003A66A    push        0BB
 0003A66F    mov         eax,ebx
 0003A671    call        TWinControl.GetHandle
 0003A676    push        eax
 0003A677    call        user32.SendMessageA
 0003A67C    sub         dword ptr [esi],eax
 0003A67E    pop         esi
 0003A67F    pop         ebx
 0003A680    ret
*}
end;

//0003A684
procedure TCustomMemo.sub_0003A684;
begin
{*
 0003A684    mov         al,byte ptr [eax+208];TCustomMemo.FAlignment:TAlignment
 0003A68A    ret
*}
end;

//0003A68C
procedure TCustomMemo.Loaded;
begin
{*
 0003A68C    push        ebx
 0003A68D    mov         ebx,eax
 0003A68F    mov         eax,ebx
 0003A691    call        TControl.Loaded
 0003A696    xor         edx,edx
 0003A698    mov         eax,ebx
 0003A69A    call        TCustomEdit.SetModified
 0003A69F    pop         ebx
 0003A6A0    ret
*}
end;

//0003A6A4
procedure TCustomMemo.SetAlignment(Value:TAlignment);
begin
{*
 0003A6A4    cmp         dl,byte ptr [eax+208]
>0003A6AA    je          0003A6B7
 0003A6AC    mov         byte ptr [eax+208],dl
 0003A6B2    call        TWinControl.RecreateWnd
 0003A6B7    ret
*}
end;

//0003A6B8
procedure TCustomMemo.SetLines(Value:TStrings);
begin
{*
 0003A6B8    push        esi
 0003A6B9    mov         esi,eax
 0003A6BB    mov         eax,dword ptr [esi+204]
 0003A6C1    mov         ecx,dword ptr [eax]
 0003A6C3    call        dword ptr [ecx+8]
 0003A6C6    pop         esi
 0003A6C7    ret
*}
end;

//0003A6C8
procedure TCustomMemo.SetScrollBars(Value:TScrollStyle);
begin
{*
 0003A6C8    cmp         dl,byte ptr [eax+209]
>0003A6CE    je          0003A6DB
 0003A6D0    mov         byte ptr [eax+209],dl
 0003A6D6    call        TWinControl.RecreateWnd
 0003A6DB    ret
*}
end;

//0003A6DC
procedure TCustomMemo.SetWordWrap(Value:Boolean);
begin
{*
 0003A6DC    cmp         dl,byte ptr [eax+20A]
>0003A6E2    je          0003A6EF
 0003A6E4    mov         byte ptr [eax+20A],dl
 0003A6EA    call        TWinControl.RecreateWnd
 0003A6EF    ret
*}
end;

//0003A6F0
procedure TCustomMemo.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 0003A6F0    push        ebx
 0003A6F1    push        esi
 0003A6F2    mov         esi,edx
 0003A6F4    mov         ebx,eax
 0003A6F6    mov         edx,esi
 0003A6F8    mov         eax,ebx
 0003A6FA    mov         ecx,dword ptr [eax]
 0003A6FC    call        dword ptr [ecx-10]
 0003A6FF    cmp         byte ptr [ebx+20C],0
>0003A706    je          0003A70E
 0003A708    or          dword ptr [esi+0C],2
>0003A70C    jmp         0003A712
 0003A70E    and         dword ptr [esi+0C],0FFFFFFFD
 0003A712    cmp         byte ptr [ebx+20B],0
>0003A719    jne         0003A71F
 0003A71B    and         dword ptr [esi+0C],0FFFFFFFB
 0003A71F    pop         esi
 0003A720    pop         ebx
 0003A721    ret
*}
end;

//0003A724
procedure TCustomMemo.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 0003A724    call        TWinControl.WMNCDestroy
 0003A729    ret
*}
end;

//0003A72C
procedure TCustomMemo.KeyPress(var Key:Char);
begin
{*
 0003A72C    push        ebx
 0003A72D    push        esi
 0003A72E    mov         esi,edx
 0003A730    mov         ebx,eax
 0003A732    mov         edx,esi
 0003A734    mov         eax,ebx
 0003A736    call        TWinControl.KeyPress
 0003A73B    cmp         byte ptr [esi],0D
>0003A73E    jne         0003A74C
 0003A740    cmp         byte ptr [ebx+20B],0
>0003A747    jne         0003A74C
 0003A749    mov         byte ptr [esi],0
 0003A74C    pop         esi
 0003A74D    pop         ebx
 0003A74E    ret
*}
end;

//0003A750
function TComboBoxStrings.GetCount:Integer;
begin
{*
 0003A750    push        ebx
 0003A751    mov         ebx,eax
 0003A753    push        0
 0003A755    push        0
 0003A757    push        146
 0003A75C    mov         eax,dword ptr [ebx+0C]
 0003A75F    call        TWinControl.GetHandle
 0003A764    push        eax
 0003A765    call        user32.SendMessageA
 0003A76A    pop         ebx
 0003A76B    ret
*}
end;

//0003A76C
function TComboBoxStrings.Get(Index:Integer):AnsiString;
begin
{*
 0003A76C    push        ebx
 0003A76D    push        esi
 0003A76E    push        edi
 0003A76F    add         esp,0FFFFF004
 0003A775    push        eax
 0003A776    mov         edi,ecx
 0003A778    mov         esi,edx
 0003A77A    mov         ebx,eax
 0003A77C    mov         eax,esp
 0003A77E    push        eax
 0003A77F    push        esi
 0003A780    push        148
 0003A785    mov         eax,dword ptr [ebx+0C]
 0003A788    call        TWinControl.GetHandle
 0003A78D    push        eax
 0003A78E    call        user32.SendMessageA
 0003A793    cmp         eax,0FFFFFFFF
>0003A796    jne         0003A79A
 0003A798    xor         eax,eax
 0003A79A    mov         edx,esp
 0003A79C    mov         ecx,edi
 0003A79E    xchg        eax,ecx
 0003A79F    call        @LStrFromPCharLen
 0003A7A4    add         esp,1000
 0003A7AA    pop         edi
 0003A7AB    pop         esi
 0003A7AC    pop         ebx
 0003A7AD    ret
*}
end;

//0003A7B0
function TComboBoxStrings.GetObject(Index:Integer):TObject;
begin
{*
 0003A7B0    push        ebx
 0003A7B1    push        esi
 0003A7B2    mov         esi,edx
 0003A7B4    mov         ebx,eax
 0003A7B6    push        0
 0003A7B8    push        esi
 0003A7B9    push        150
 0003A7BE    mov         eax,dword ptr [ebx+0C]
 0003A7C1    call        TWinControl.GetHandle
 0003A7C6    push        eax
 0003A7C7    call        user32.SendMessageA
 0003A7CC    pop         esi
 0003A7CD    pop         ebx
 0003A7CE    ret
*}
end;

//0003A7D0
procedure TComboBoxStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 0003A7D0    push        ebx
 0003A7D1    push        esi
 0003A7D2    push        edi
 0003A7D3    mov         edi,ecx
 0003A7D5    mov         esi,edx
 0003A7D7    mov         ebx,eax
 0003A7D9    push        edi
 0003A7DA    push        esi
 0003A7DB    push        151
 0003A7E0    mov         eax,dword ptr [ebx+0C]
 0003A7E3    call        TWinControl.GetHandle
 0003A7E8    push        eax
 0003A7E9    call        user32.SendMessageA
 0003A7EE    pop         edi
 0003A7EF    pop         esi
 0003A7F0    pop         ebx
 0003A7F1    ret
*}
end;

//0003A7F4
function TComboBoxStrings.Add(const S:AnsiString):Integer;
begin
{*
 0003A7F4    push        ebp
 0003A7F5    mov         ebp,esp
 0003A7F7    push        0
 0003A7F9    push        ebx
 0003A7FA    push        esi
 0003A7FB    mov         esi,edx
 0003A7FD    mov         ebx,eax
 0003A7FF    xor         eax,eax
 0003A801    push        ebp
 0003A802    push        3A867
 0003A807    push        dword ptr fs:[eax]
 0003A80A    mov         dword ptr fs:[eax],esp
 0003A80D    mov         eax,esi
 0003A80F    call        @LStrToPChar
 0003A814    push        eax
 0003A815    push        0
 0003A817    push        143
 0003A81C    mov         eax,dword ptr [ebx+0C]
 0003A81F    call        TWinControl.GetHandle
 0003A824    push        eax
 0003A825    call        user32.SendMessageA
 0003A82A    mov         ebx,eax
 0003A82C    test        ebx,ebx
>0003A82E    jge         0003A851
 0003A830    lea         edx,[ebp-4]
 0003A833    mov         eax,[000B579C];^SInsertLineError:TResStringRec
 0003A838    call        LoadResString
 0003A83D    mov         ecx,dword ptr [ebp-4]
 0003A840    mov         dl,1
 0003A842    mov         eax,[0001EE08];EOutOfResources
 0003A847    call        Exception.Create
 0003A84C    call        @RaiseExcept
 0003A851    xor         eax,eax
 0003A853    pop         edx
 0003A854    pop         ecx
 0003A855    pop         ecx
 0003A856    mov         dword ptr fs:[eax],edx
 0003A859    push        3A86E
 0003A85E    lea         eax,[ebp-4]
 0003A861    call        @LStrClr
 0003A866    ret
>0003A867    jmp         @HandleFinally
>0003A86C    jmp         0003A85E
 0003A86E    mov         eax,ebx
 0003A870    pop         esi
 0003A871    pop         ebx
 0003A872    pop         ecx
 0003A873    pop         ebp
 0003A874    ret
*}
end;

//0003A878
procedure TComboBoxStrings.Insert(Index:Integer; const S:AnsiString);
begin
{*
 0003A878    push        ebp
 0003A879    mov         ebp,esp
 0003A87B    push        0
 0003A87D    push        ebx
 0003A87E    push        esi
 0003A87F    push        edi
 0003A880    mov         edi,ecx
 0003A882    mov         esi,edx
 0003A884    mov         ebx,eax
 0003A886    xor         eax,eax
 0003A888    push        ebp
 0003A889    push        3A8EB
 0003A88E    push        dword ptr fs:[eax]
 0003A891    mov         dword ptr fs:[eax],esp
 0003A894    mov         eax,edi
 0003A896    call        @LStrToPChar
 0003A89B    push        eax
 0003A89C    push        esi
 0003A89D    push        14A
 0003A8A2    mov         eax,dword ptr [ebx+0C]
 0003A8A5    call        TWinControl.GetHandle
 0003A8AA    push        eax
 0003A8AB    call        user32.SendMessageA
 0003A8B0    test        eax,eax
>0003A8B2    jge         0003A8D5
 0003A8B4    lea         edx,[ebp-4]
 0003A8B7    mov         eax,[000B579C];^SInsertLineError:TResStringRec
 0003A8BC    call        LoadResString
 0003A8C1    mov         ecx,dword ptr [ebp-4]
 0003A8C4    mov         dl,1
 0003A8C6    mov         eax,[0001EE08];EOutOfResources
 0003A8CB    call        Exception.Create
 0003A8D0    call        @RaiseExcept
 0003A8D5    xor         eax,eax
 0003A8D7    pop         edx
 0003A8D8    pop         ecx
 0003A8D9    pop         ecx
 0003A8DA    mov         dword ptr fs:[eax],edx
 0003A8DD    push        3A8F2
 0003A8E2    lea         eax,[ebp-4]
 0003A8E5    call        @LStrClr
 0003A8EA    ret
>0003A8EB    jmp         @HandleFinally
>0003A8F0    jmp         0003A8E2
 0003A8F2    pop         edi
 0003A8F3    pop         esi
 0003A8F4    pop         ebx
 0003A8F5    pop         ecx
 0003A8F6    pop         ebp
 0003A8F7    ret
*}
end;

//0003A8F8
procedure TComboBoxStrings.Delete(Index:Integer);
begin
{*
 0003A8F8    push        ebx
 0003A8F9    push        esi
 0003A8FA    mov         esi,edx
 0003A8FC    mov         ebx,eax
 0003A8FE    push        0
 0003A900    push        esi
 0003A901    push        144
 0003A906    mov         eax,dword ptr [ebx+0C]
 0003A909    call        TWinControl.GetHandle
 0003A90E    push        eax
 0003A90F    call        user32.SendMessageA
 0003A914    pop         esi
 0003A915    pop         ebx
 0003A916    ret
*}
end;

//0003A918
procedure TComboBoxStrings.Clear;
begin
{*
 0003A918    push        ebp
 0003A919    mov         ebp,esp
 0003A91B    push        0
 0003A91D    push        ebx
 0003A91E    mov         ebx,eax
 0003A920    xor         eax,eax
 0003A922    push        ebp
 0003A923    push        3A97C
 0003A928    push        dword ptr fs:[eax]
 0003A92B    mov         dword ptr fs:[eax],esp
 0003A92E    lea         edx,[ebp-4]
 0003A931    mov         eax,dword ptr [ebx+0C]
 0003A934    call        TControl.GetText
 0003A939    push        0
 0003A93B    push        0
 0003A93D    push        14B
 0003A942    mov         eax,dword ptr [ebx+0C]
 0003A945    call        TWinControl.GetHandle
 0003A94A    push        eax
 0003A94B    call        user32.SendMessageA
 0003A950    mov         edx,dword ptr [ebp-4]
 0003A953    mov         eax,dword ptr [ebx+0C]
 0003A956    call        TControl.SetText
 0003A95B    mov         eax,dword ptr [ebx+0C]
 0003A95E    mov         edx,dword ptr [eax]
 0003A960    call        dword ptr [edx+84]
 0003A966    xor         eax,eax
 0003A968    pop         edx
 0003A969    pop         ecx
 0003A96A    pop         ecx
 0003A96B    mov         dword ptr fs:[eax],edx
 0003A96E    push        3A983
 0003A973    lea         eax,[ebp-4]
 0003A976    call        @LStrClr
 0003A97B    ret
>0003A97C    jmp         @HandleFinally
>0003A981    jmp         0003A973
 0003A983    pop         ebx
 0003A984    pop         ecx
 0003A985    pop         ebp
 0003A986    ret
*}
end;

//0003A988
procedure TComboBoxStrings.SetUpdateState(Updating:Boolean);
begin
{*
 0003A988    push        ebx
 0003A989    push        esi
 0003A98A    mov         ebx,edx
 0003A98C    mov         esi,eax
 0003A98E    push        0
 0003A990    mov         eax,ebx
 0003A992    xor         al,1
 0003A994    and         eax,7F
 0003A997    push        eax
 0003A998    push        0B
 0003A99A    mov         eax,dword ptr [esi+0C]
 0003A99D    call        TWinControl.GetHandle
 0003A9A2    push        eax
 0003A9A3    call        user32.SendMessageA
 0003A9A8    xor         bl,1
 0003A9AB    test        bl,bl
>0003A9AD    je          0003A9B7
 0003A9AF    mov         eax,dword ptr [esi+0C]
 0003A9B2    call        TControl.Refresh
 0003A9B7    pop         esi
 0003A9B8    pop         ebx
 0003A9B9    ret
*}
end;

//0003A9BC
function TComboBoxStrings.IndexOf(const S:AnsiString):Integer;
begin
{*
 0003A9BC    push        ebx
 0003A9BD    push        esi
 0003A9BE    mov         esi,edx
 0003A9C0    mov         ebx,eax
 0003A9C2    mov         eax,esi
 0003A9C4    call        @LStrToPChar
 0003A9C9    push        eax
 0003A9CA    push        0FF
 0003A9CC    push        158
 0003A9D1    mov         eax,dword ptr [ebx+0C]
 0003A9D4    call        TWinControl.GetHandle
 0003A9D9    push        eax
 0003A9DA    call        user32.SendMessageA
 0003A9DF    pop         esi
 0003A9E0    pop         ebx
 0003A9E1    ret
*}
end;

//0003A9E4
constructor TCustomComboBox.Create(AOwner:TComponent);
begin
{*
 0003A9E4    push        ebp
 0003A9E5    mov         ebp,esp
 0003A9E7    push        ecx
 0003A9E8    push        ebx
 0003A9E9    push        esi
 0003A9EA    test        dl,dl
>0003A9EC    je          0003A9F6
 0003A9EE    add         esp,0FFFFFFF0
 0003A9F1    call        @ClassCreate
 0003A9F6    mov         byte ptr [ebp-1],dl
 0003A9F9    mov         ebx,eax
 0003A9FB    xor         edx,edx
 0003A9FD    mov         eax,ebx
 0003A9FF    call        TWinControl.Create
 0003AA04    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003AA09    cmp         byte ptr [eax],0
>0003AA0C    je          0003AA18
 0003AA0E    mov         eax,[0003AAD8]
 0003AA13    mov         dword ptr [ebx+40],eax
>0003AA16    jmp         0003AA20
 0003AA18    mov         eax,[0003AADC]
 0003AA1D    mov         dword ptr [ebx+40],eax
 0003AA20    mov         edx,91
 0003AA25    mov         eax,ebx
 0003AA27    call        TControl.SetWidth
 0003AA2C    mov         edx,19
 0003AA31    mov         eax,ebx
 0003AA33    call        TControl.SetHeight
 0003AA38    mov         dl,1
 0003AA3A    mov         eax,ebx
 0003AA3C    call        TWinControl.SetTabStop
 0003AA41    xor         edx,edx
 0003AA43    mov         eax,ebx
 0003AA45    call        TControl.SetParentColor
 0003AA4A    mov         dl,1
 0003AA4C    mov         eax,[00038B78];TComboBoxStrings
 0003AA51    call        TObject.Create
 0003AA56    mov         esi,eax
 0003AA58    mov         dword ptr [ebx+1EC],esi
 0003AA5E    mov         dword ptr [esi+0C],ebx
 0003AA61    mov         dl,1
 0003AA63    mov         eax,[0003E18C];TControlCanvas
 0003AA68    call        TCanvas.Create
 0003AA6D    mov         dword ptr [ebx+1F0],eax
 0003AA73    mov         dword ptr [ebx+1F8],10
 0003AA7D    mov         byte ptr [ebx+1F6],0
 0003AA84    push        ebx
 0003AA85    push        3AFE0;TCustomComboBox.EditWndProc
 0003AA8A    call        MakeObjectInstance
 0003AA8F    mov         dword ptr [ebx+20C],eax
 0003AA95    push        ebx
 0003AA96    push        3B0D8;TCustomComboBox.ListWndProc
 0003AA9B    call        MakeObjectInstance
 0003AAA0    mov         dword ptr [ebx+210],eax
 0003AAA6    mov         dword ptr [ebx+200],8
 0003AAB0    mov         dword ptr [ebx+224],0FFFFFFFF
 0003AABA    mov         eax,ebx
 0003AABC    cmp         byte ptr [ebp-1],0
>0003AAC0    je          0003AAD1
 0003AAC2    call        @AfterConstruction
 0003AAC7    pop         dword ptr fs:[0]
 0003AACE    add         esp,0C
 0003AAD1    mov         eax,ebx
 0003AAD3    pop         esi
 0003AAD4    pop         ebx
 0003AAD5    pop         ecx
 0003AAD6    pop         ebp
 0003AAD7    ret
*}
end;

//0003AAE0
destructor TCustomComboBox.Destroy;
begin
{*
 0003AAE0    push        ebx
 0003AAE1    push        esi
 0003AAE2    call        @BeforeDestruction
 0003AAE7    mov         ebx,edx
 0003AAE9    mov         esi,eax
 0003AAEB    mov         eax,esi
 0003AAED    call        TWinControl.HandleAllocated
 0003AAF2    test        al,al
>0003AAF4    je          0003AB00
 0003AAF6    mov         eax,esi
 0003AAF8    mov         edx,dword ptr [eax]
 0003AAFA    call        dword ptr [edx+0A0]
 0003AB00    mov         eax,dword ptr [esi+210]
 0003AB06    call        FreeObjectInstance
 0003AB0B    mov         eax,dword ptr [esi+20C]
 0003AB11    call        FreeObjectInstance
 0003AB16    mov         eax,dword ptr [esi+1F0]
 0003AB1C    call        TObject.Free
 0003AB21    mov         eax,dword ptr [esi+1EC]
 0003AB27    call        TObject.Free
 0003AB2C    mov         eax,dword ptr [esi+220]
 0003AB32    call        TObject.Free
 0003AB37    mov         edx,ebx
 0003AB39    and         dl,0FC
 0003AB3C    mov         eax,esi
 0003AB3E    call        TWinControl.Destroy
 0003AB43    test        bl,bl
>0003AB45    jle         0003AB4E
 0003AB47    mov         eax,esi
 0003AB49    call        @ClassDestroy
 0003AB4E    pop         esi
 0003AB4F    pop         ebx
 0003AB50    ret
*}
end;

//0003AB54
function TCustomComboBox.GetDroppedDown:Boolean;
begin
{*
 0003AB54    push        ebx
 0003AB55    mov         ebx,eax
 0003AB57    push        0
 0003AB59    push        0
 0003AB5B    push        157
 0003AB60    mov         eax,ebx
 0003AB62    call        TWinControl.GetHandle
 0003AB67    push        eax
 0003AB68    call        user32.SendMessageA
 0003AB6D    neg         eax
 0003AB6F    sbb         eax,eax
 0003AB71    neg         eax
 0003AB73    pop         ebx
 0003AB74    ret
*}
end;

//0003AB78
procedure TCustomComboBox.SetDroppedDown(Value:Boolean);
begin
{*
 0003AB78    push        ebx
 0003AB79    push        esi
 0003AB7A    mov         ebx,edx
 0003AB7C    mov         esi,eax
 0003AB7E    push        0
 0003AB80    xor         eax,eax
 0003AB82    mov         al,bl
 0003AB84    push        eax
 0003AB85    push        14F
 0003AB8A    mov         eax,esi
 0003AB8C    call        TWinControl.GetHandle
 0003AB91    push        eax
 0003AB92    call        user32.SendMessageA
 0003AB97    pop         esi
 0003AB98    pop         ebx
 0003AB99    ret
*}
end;

//0003AB9C
function TCustomComboBox.GetItemIndex:Integer;
begin
{*
 0003AB9C    push        ebx
 0003AB9D    mov         ebx,eax
 0003AB9F    push        0
 0003ABA1    push        0
 0003ABA3    push        147
 0003ABA8    mov         eax,ebx
 0003ABAA    call        TWinControl.GetHandle
 0003ABAF    push        eax
 0003ABB0    call        user32.SendMessageA
 0003ABB5    pop         ebx
 0003ABB6    ret
*}
end;

//0003ABB8
procedure TCustomComboBox.SetItemIndex(Value:Integer);
begin
{*
 0003ABB8    push        ebx
 0003ABB9    push        esi
 0003ABBA    mov         esi,edx
 0003ABBC    mov         ebx,eax
 0003ABBE    mov         eax,ebx
 0003ABC0    call        TCustomComboBox.GetItemIndex
 0003ABC5    cmp         esi,eax
>0003ABC7    je          0003ABDE
 0003ABC9    push        0
 0003ABCB    push        esi
 0003ABCC    push        14E
 0003ABD1    mov         eax,ebx
 0003ABD3    call        TWinControl.GetHandle
 0003ABD8    push        eax
 0003ABD9    call        user32.SendMessageA
 0003ABDE    pop         esi
 0003ABDF    pop         ebx
 0003ABE0    ret
*}
end;

//0003ABE4
procedure TCustomComboBox.SetMaxLength(Value:Integer);
begin
{*
 0003ABE4    push        ebx
 0003ABE5    push        esi
 0003ABE6    mov         esi,edx
 0003ABE8    mov         ebx,eax
 0003ABEA    test        esi,esi
>0003ABEC    jge         0003ABF0
 0003ABEE    xor         esi,esi
 0003ABF0    cmp         esi,dword ptr [ebx+1FC]
>0003ABF6    je          0003AC1E
 0003ABF8    mov         dword ptr [ebx+1FC],esi
 0003ABFE    mov         eax,ebx
 0003AC00    call        TWinControl.HandleAllocated
 0003AC05    test        al,al
>0003AC07    je          0003AC1E
 0003AC09    push        0
 0003AC0B    push        esi
 0003AC0C    push        141
 0003AC11    mov         eax,ebx
 0003AC13    call        TWinControl.GetHandle
 0003AC18    push        eax
 0003AC19    call        user32.SendMessageA
 0003AC1E    pop         esi
 0003AC1F    pop         ebx
 0003AC20    ret
*}
end;

//0003AC24
procedure TCustomEdit.SetHideSelection(Value:Boolean);
begin
{*
 0003AC24    cmp         dl,byte ptr [eax+1F5]
>0003AC2A    je          0003AC37
 0003AC2C    mov         byte ptr [eax+1F5],dl
 0003AC32    call        TWinControl.RecreateWnd
 0003AC37    ret
*}
end;

//0003AC38
procedure TCustomComboBox.SetStyle(Value:TComboBoxStyle);
begin
{*
 0003AC38    push        ebx
 0003AC39    mov         ebx,eax
 0003AC3B    cmp         dl,byte ptr [ebx+1F6]
>0003AC41    je          0003AC6F
 0003AC43    mov         byte ptr [ebx+1F6],dl
 0003AC49    cmp         dl,1
>0003AC4C    jne         0003AC5D
 0003AC4E    mov         eax,[0003AC74]
 0003AC53    not         eax
 0003AC55    and         eax,dword ptr [ebx+40]
 0003AC58    mov         dword ptr [ebx+40],eax
>0003AC5B    jmp         0003AC68
 0003AC5D    mov         eax,[0003AC74]
 0003AC62    or          eax,dword ptr [ebx+40]
 0003AC65    mov         dword ptr [ebx+40],eax
 0003AC68    mov         eax,ebx
 0003AC6A    call        TWinControl.RecreateWnd
 0003AC6F    pop         ebx
 0003AC70    ret
*}
end;

//0003AC78
function TCustomComboBox.GetItemHeight:Integer;
begin
{*
 0003AC78    mov         dl,byte ptr [eax+1F6]
 0003AC7E    add         dl,0FD
 0003AC81    sub         dl,2
>0003AC84    jae         0003AC8D
 0003AC86    mov         eax,dword ptr [eax+1F8]
 0003AC8C    ret
 0003AC8D    push        0
 0003AC8F    xor         ecx,ecx
 0003AC91    mov         edx,154
 0003AC96    call        TControl.Perform
 0003AC9B    ret
*}
end;

//0003AC9C
procedure TCustomComboBox.SetItemHeight(Value:Integer);
begin
{*
 0003AC9C    test        edx,edx
>0003AC9E    jle         0003ACA6
 0003ACA0    mov         dword ptr [eax+1F8],edx
 0003ACA6    ret
*}
end;

//0003ACA8
procedure TCustomComboBox.SetItems(Value:TStrings);
begin
{*
 0003ACA8    push        esi
 0003ACA9    mov         esi,eax
 0003ACAB    mov         eax,dword ptr [esi+1EC]
 0003ACB1    mov         ecx,dword ptr [eax]
 0003ACB3    call        dword ptr [ecx+8]
 0003ACB6    pop         esi
 0003ACB7    ret
*}
end;

//0003ACB8
procedure TCustomComboBox.CreateParams(var Params:TCreateParams);
begin
{*
 0003ACB8    push        ebx
 0003ACB9    push        esi
 0003ACBA    mov         esi,edx
 0003ACBC    mov         ebx,eax
 0003ACBE    mov         edx,esi
 0003ACC0    mov         eax,ebx
 0003ACC2    call        TWinControl.CreateParams
 0003ACC7    mov         ecx,3AD10
 0003ACCC    mov         edx,esi
 0003ACCE    mov         eax,ebx
 0003ACD0    call        TWinControl.CreateSubClass
 0003ACD5    mov         eax,dword ptr [esi+4]
 0003ACD8    or          eax,200240
 0003ACDD    xor         edx,edx
 0003ACDF    mov         dl,byte ptr [ebx+1F6]
 0003ACE5    or          eax,dword ptr [edx*4+0B46F0]
 0003ACEC    xor         edx,edx
 0003ACEE    mov         dl,byte ptr [ebx+1F5]
 0003ACF4    or          eax,dword ptr [edx*4+0B4710]
 0003ACFB    xor         edx,edx
 0003ACFD    mov         dl,byte ptr [ebx+1F4]
 0003AD03    or          eax,dword ptr [edx*4+0B4704]
 0003AD0A    mov         dword ptr [esi+4],eax
 0003AD0D    pop         esi
 0003AD0E    pop         ebx
 0003AD0F    ret
*}
end;

//0003AD1C
procedure TCustomComboBox.CreateWnd;
begin
{*
 0003AD1C    push        ebx
 0003AD1D    push        esi
 0003AD1E    push        edi
 0003AD1F    mov         ebx,eax
 0003AD21    mov         eax,ebx
 0003AD23    call        TWinControl.CreateWnd
 0003AD28    push        0
 0003AD2A    mov         eax,dword ptr [ebx+1FC]
 0003AD30    push        eax
 0003AD31    push        141
 0003AD36    mov         eax,ebx
 0003AD38    call        TWinControl.GetHandle
 0003AD3D    push        eax
 0003AD3E    call        user32.SendMessageA
 0003AD43    mov         esi,dword ptr [ebx+220]
 0003AD49    test        esi,esi
>0003AD4B    je          0003ADB5
 0003AD4D    mov         edx,esi
 0003AD4F    mov         eax,dword ptr [ebx+1EC]
 0003AD55    mov         ecx,dword ptr [eax]
 0003AD57    call        dword ptr [ecx+8]
 0003AD5A    mov         eax,dword ptr [ebx+220]
 0003AD60    call        TObject.Free
 0003AD65    xor         eax,eax
 0003AD67    mov         dword ptr [ebx+220],eax
 0003AD6D    cmp         dword ptr [ebx+224],0FFFFFFFF
>0003AD74    je          0003ADB5
 0003AD76    mov         eax,dword ptr [ebx+1EC]
 0003AD7C    mov         edx,dword ptr [eax]
 0003AD7E    call        dword ptr [edx+14]
 0003AD81    cmp         eax,dword ptr [ebx+224]
>0003AD87    jge         0003AD9A
 0003AD89    mov         eax,dword ptr [ebx+1EC]
 0003AD8F    mov         edx,dword ptr [eax]
 0003AD91    call        dword ptr [edx+14]
 0003AD94    mov         dword ptr [ebx+224],eax
 0003AD9A    push        0
 0003AD9C    mov         eax,dword ptr [ebx+224]
 0003ADA2    push        eax
 0003ADA3    push        14E
 0003ADA8    mov         eax,ebx
 0003ADAA    call        TWinControl.GetHandle
 0003ADAF    push        eax
 0003ADB0    call        user32.SendMessageA
 0003ADB5    xor         eax,eax
 0003ADB7    mov         dword ptr [ebx+204],eax
 0003ADBD    xor         eax,eax
 0003ADBF    mov         dword ptr [ebx+208],eax
 0003ADC5    mov         al,byte ptr [ebx+1F6]
 0003ADCB    sub         al,2
>0003ADCD    jae         0003AE54
 0003ADD3    push        5
 0003ADD5    mov         eax,ebx
 0003ADD7    mov         edx,dword ptr [eax]
 0003ADD9    call        dword ptr [edx+0C0]
 0003ADDF    push        eax
 0003ADE0    call        user32.GetWindow
 0003ADE5    mov         esi,eax
 0003ADE7    test        esi,esi
>0003ADE9    je          0003AE54
 0003ADEB    cmp         byte ptr [ebx+1F6],1
>0003ADF2    jne         0003AE29
 0003ADF4    mov         edi,esi
 0003ADF6    mov         dword ptr [ebx+208],edi
 0003ADFC    push        0FC
 0003ADFE    push        edi
 0003ADFF    call        user32.GetWindowLongA
 0003AE04    mov         dword ptr [ebx+218],eax
 0003AE0A    mov         eax,dword ptr [ebx+210]
 0003AE10    push        eax
 0003AE11    push        0FC
 0003AE13    mov         eax,dword ptr [ebx+208]
 0003AE19    push        eax
 0003AE1A    call        user32.SetWindowLongA
 0003AE1F    push        2
 0003AE21    push        esi
 0003AE22    call        user32.GetWindow
 0003AE27    mov         esi,eax
 0003AE29    mov         edi,esi
 0003AE2B    mov         dword ptr [ebx+204],edi
 0003AE31    push        0FC
 0003AE33    push        edi
 0003AE34    call        user32.GetWindowLongA
 0003AE39    mov         dword ptr [ebx+214],eax
 0003AE3F    mov         eax,dword ptr [ebx+20C]
 0003AE45    push        eax
 0003AE46    push        0FC
 0003AE48    mov         eax,dword ptr [ebx+204]
 0003AE4E    push        eax
 0003AE4F    call        user32.SetWindowLongA
 0003AE54    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003AE59    cmp         byte ptr [eax],0
>0003AE5C    je          0003AE7C
 0003AE5E    cmp         dword ptr [ebx+204],0
>0003AE65    je          0003AE7C
 0003AE67    push        0
 0003AE69    push        3
 0003AE6B    push        0D3
 0003AE70    mov         eax,dword ptr [ebx+204]
 0003AE76    push        eax
 0003AE77    call        user32.SendMessageA
 0003AE7C    pop         edi
 0003AE7D    pop         esi
 0003AE7E    pop         ebx
 0003AE7F    ret
*}
end;

//0003AE80
procedure TCustomComboBox.DestroyWnd;
begin
{*
 0003AE80    push        ebx
 0003AE81    push        esi
 0003AE82    mov         ebx,eax
 0003AE84    mov         eax,dword ptr [ebx+1EC]
 0003AE8A    mov         edx,dword ptr [eax]
 0003AE8C    call        dword ptr [edx+14]
 0003AE8F    test        eax,eax
>0003AE91    jle         0003AEC1
 0003AE93    mov         eax,ebx
 0003AE95    call        TCustomComboBox.GetItemIndex
 0003AE9A    mov         dword ptr [ebx+224],eax
 0003AEA0    mov         dl,1
 0003AEA2    mov         eax,[0001F340];TStringList
 0003AEA7    call        TObject.Create
 0003AEAC    mov         esi,eax
 0003AEAE    mov         dword ptr [ebx+220],esi
 0003AEB4    mov         edx,dword ptr [ebx+1EC]
 0003AEBA    mov         eax,esi
 0003AEBC    mov         ecx,dword ptr [eax]
 0003AEBE    call        dword ptr [ecx+8]
 0003AEC1    mov         eax,ebx
 0003AEC3    call        TWinControl.DestroyWnd
 0003AEC8    pop         esi
 0003AEC9    pop         ebx
 0003AECA    ret
*}
end;

//0003AECC
procedure TCustomComboBox.WMCreate(var Message:TWMCreate);
begin
{*
 0003AECC    push        esi
 0003AECD    mov         esi,eax
 0003AECF    mov         eax,esi
 0003AED1    mov         ecx,dword ptr [eax]
 0003AED3    call        dword ptr [ecx-10]
 0003AED6    cmp         dword ptr [esi+54],0
>0003AEDA    je          0003AEED
 0003AEDC    mov         eax,dword ptr [esi+54]
 0003AEDF    push        eax
 0003AEE0    mov         eax,esi
 0003AEE2    call        TWinControl.GetHandle
 0003AEE7    push        eax
 0003AEE8    call        user32.SetWindowTextA
 0003AEED    pop         esi
 0003AEEE    ret
*}
end;

//0003AEF0
procedure TCustomComboBox.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 0003AEF0    push        ebx
 0003AEF1    push        esi
 0003AEF2    add         esp,0FFFFFFF0
 0003AEF5    mov         esi,edx
 0003AEF7    mov         ebx,eax
 0003AEF9    cmp         byte ptr [ebx+1F6],1
>0003AF00    jne         0003AF33
 0003AF02    mov         eax,dword ptr [ebx+24]
 0003AF05    mov         eax,dword ptr [eax+124]
 0003AF0B    call        TBrush.GetHandle
 0003AF10    push        eax
 0003AF11    lea         edx,[esp+4]
 0003AF15    mov         eax,ebx
 0003AF17    mov         ecx,dword ptr [eax]
 0003AF19    call        dword ptr [ecx+44]
 0003AF1C    lea         eax,[esp+4]
 0003AF20    push        eax
 0003AF21    mov         eax,dword ptr [esi+4]
 0003AF24    push        eax
 0003AF25    call        user32.FillRect
 0003AF2A    mov         dword ptr [esi+0C],1
>0003AF31    jmp         0003AF3C
 0003AF33    mov         edx,esi
 0003AF35    mov         eax,ebx
 0003AF37    mov         ecx,dword ptr [eax]
 0003AF39    call        dword ptr [ecx-10]
 0003AF3C    add         esp,10
 0003AF3F    pop         esi
 0003AF40    pop         ebx
 0003AF41    ret
*}
end;

//0003AF44
procedure TCustomComboBox.WMDrawItem(var Message:TWMDrawItem);
begin
{*
 0003AF44    mov         ecx,dword ptr [eax]
 0003AF46    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 0003AF49    ret
*}
end;

//0003AF4C
procedure TCustomComboBox.WMMeasureItem(var Message:TWMMeasureItem);
begin
{*
 0003AF4C    mov         ecx,dword ptr [eax]
 0003AF4E    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 0003AF51    ret
*}
end;

//0003AF54
procedure TCustomComboBox.WMDeleteItem(var Message:TWMDeleteItem);
begin
{*
 0003AF54    mov         ecx,dword ptr [eax]
 0003AF56    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 0003AF59    ret
*}
end;

//0003AF5C
procedure TCustomComboBox.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 0003AF5C    push        ebx
 0003AF5D    push        esi
 0003AF5E    mov         esi,edx
 0003AF60    mov         ebx,eax
 0003AF62    mov         edx,esi
 0003AF64    mov         eax,ebx
 0003AF66    mov         ecx,dword ptr [eax]
 0003AF68    call        dword ptr [ecx-10]
 0003AF6B    mov         eax,ebx
 0003AF6D    call        TCustomComboBox.GetDroppedDown
 0003AF72    test        al,al
>0003AF74    je          0003AF7A
 0003AF76    or          dword ptr [esi+0C],4
 0003AF7A    pop         esi
 0003AF7B    pop         ebx
 0003AF7C    ret
*}
end;

//0003AF80
procedure TCustomComboBox.CMCancelMode(var Message:TCMCancelMode);
begin
{*
 0003AF80    cmp         eax,dword ptr [edx+8]
>0003AF83    je          0003AF93
 0003AF85    push        0
 0003AF87    xor         ecx,ecx
 0003AF89    mov         edx,14F
 0003AF8E    call        TControl.Perform
 0003AF93    ret
*}
end;

//0003AF94
procedure TCustomComboBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0003AF94    push        ebx
 0003AF95    push        esi
 0003AF96    mov         esi,edx
 0003AF98    mov         ebx,eax
 0003AF9A    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003AF9F    cmp         byte ptr [eax],0
>0003AFA2    je          0003AFAB
 0003AFA4    mov         eax,ebx
 0003AFA6    call        TWinControl.RecreateWnd
 0003AFAB    mov         edx,esi
 0003AFAD    mov         eax,ebx
 0003AFAF    call        TWinControl.CMCtl3DChanged
 0003AFB4    pop         esi
 0003AFB5    pop         ebx
 0003AFB6    ret
*}
end;

//0003AFB8
procedure TCustomComboBox.CMParentColorChanged(var Message:TMessage);
begin
{*
 0003AFB8    push        esi
 0003AFB9    mov         esi,eax
 0003AFBB    mov         eax,esi
 0003AFBD    call        TControl.CMParentColorChanged
 0003AFC2    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003AFC7    cmp         byte ptr [eax],0
>0003AFCA    jne         0003AFDC
 0003AFCC    cmp         byte ptr [esi+1F6],2
>0003AFD3    jae         0003AFDC
 0003AFD5    mov         eax,esi
 0003AFD7    mov         edx,dword ptr [eax]
 0003AFD9    call        dword ptr [edx+78]
 0003AFDC    pop         esi
 0003AFDD    ret
*}
end;

//0003AFE0
procedure TCustomComboBox.EditWndProc(var Message:TMessage);
begin
{*
 0003AFE0    push        ebx
 0003AFE1    push        esi
 0003AFE2    push        edi
 0003AFE3    add         esp,0FFFFFFF0
 0003AFE6    mov         edi,edx
 0003AFE8    mov         esi,eax
 0003AFEA    cmp         dword ptr [edi],112
>0003AFF0    jne         0003B000
 0003AFF2    mov         edx,edi
 0003AFF4    mov         eax,esi
 0003AFF6    mov         ecx,dword ptr [eax]
 0003AFF8    call        dword ptr [ecx+70]
>0003AFFB    jmp         0003B0CF
 0003B000    mov         eax,dword ptr [edi]
 0003B002    cmp         eax,100
>0003B007    jb          0003B033
 0003B009    cmp         eax,108
>0003B00E    ja          0003B033
 0003B010    mov         eax,esi
 0003B012    call        GetParentForm
 0003B017    mov         ebx,eax
 0003B019    test        ebx,ebx
>0003B01B    je          0003B033
 0003B01D    mov         ecx,edi
 0003B01F    mov         edx,esi
 0003B021    mov         eax,ebx
 0003B023    mov         ebx,dword ptr [eax]
 0003B025    call        dword ptr [ebx+0D0]
 0003B02B    test        al,al
>0003B02D    jne         0003B0CF
 0003B033    mov         eax,dword ptr [esi+214]
 0003B039    push        eax
 0003B03A    mov         edx,edi
 0003B03C    mov         ecx,dword ptr [esi+204]
 0003B042    mov         eax,esi
 0003B044    mov         ebx,dword ptr [eax]
 0003B046    call        dword ptr [ebx+0B8]
 0003B04C    mov         eax,dword ptr [edi]
 0003B04E    sub         eax,30
>0003B051    je          0003B0B0
 0003B053    sub         eax,1D1
>0003B058    je          0003B05F
 0003B05A    sub         eax,2
>0003B05D    jne         0003B0CF
 0003B05F    cmp         byte ptr [esi+4D],1
>0003B063    jne         0003B0CF
 0003B065    push        esp
 0003B066    call        user32.GetCursorPos
 0003B06B    lea         ecx,[esp+8]
 0003B06F    mov         edx,esp
 0003B071    mov         eax,esi
 0003B073    call        TControl.ScreenToClient
 0003B078    mov         eax,dword ptr [esp+8]
 0003B07C    mov         dword ptr [esp],eax
 0003B07F    mov         eax,dword ptr [esp+0C]
 0003B083    mov         dword ptr [esp+4],eax
 0003B087    mov         eax,esp
 0003B089    call        PointToSmallPoint
 0003B08E    push        eax
 0003B08F    push        0
 0003B091    push        202
 0003B096    mov         eax,dword ptr [esi+204]
 0003B09C    push        eax
 0003B09D    call        user32.SendMessageA
 0003B0A2    or          ecx,0FFFFFFFF
 0003B0A5    xor         edx,edx
 0003B0A7    mov         eax,esi
 0003B0A9    call        TControl.BeginDrag
>0003B0AE    jmp         0003B0CF
 0003B0B0    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003B0B5    cmp         byte ptr [eax],0
>0003B0B8    je          0003B0CF
 0003B0BA    push        0
 0003B0BC    push        3
 0003B0BE    push        0D3
 0003B0C3    mov         eax,dword ptr [esi+204]
 0003B0C9    push        eax
 0003B0CA    call        user32.SendMessageA
 0003B0CF    add         esp,10
 0003B0D2    pop         edi
 0003B0D3    pop         esi
 0003B0D4    pop         ebx
 0003B0D5    ret
*}
end;

//0003B0D8
procedure TCustomComboBox.ListWndProc(var Message:TMessage);
begin
{*
 0003B0D8    push        ebx
 0003B0D9    push        esi
 0003B0DA    push        edi
 0003B0DB    mov         edi,edx
 0003B0DD    mov         esi,eax
 0003B0DF    mov         eax,dword ptr [esi+218]
 0003B0E5    push        eax
 0003B0E6    mov         edx,edi
 0003B0E8    mov         ecx,dword ptr [esi+208]
 0003B0EE    mov         eax,esi
 0003B0F0    mov         ebx,dword ptr [eax]
 0003B0F2    call        dword ptr [ebx+0B8]
 0003B0F8    pop         edi
 0003B0F9    pop         esi
 0003B0FA    pop         ebx
 0003B0FB    ret
*}
end;

//0003B0FC
procedure sub_0003B0FC;
begin
{*
 0003B0FC    call        TWinControl.GetHandle
 0003B101    ret
*}
end;

//0003B104
procedure TCustomComboBox.ComboWndProc(var Message:TMessage; ComboWnd:HWND; ComboProc:Pointer);
begin
{*
 0003B104    push        ebp
 0003B105    mov         ebp,esp
 0003B107    add         esp,0FFFFFFF4
 0003B10A    push        ebx
 0003B10B    push        esi
 0003B10C    push        edi
 0003B10D    mov         ebx,ecx
 0003B10F    mov         esi,edx
 0003B111    mov         dword ptr [ebp-4],eax
 0003B114    xor         eax,eax
 0003B116    push        ebp
 0003B117    push        3B3BB
 0003B11C    push        dword ptr fs:[eax]
 0003B11F    mov         dword ptr fs:[eax],esp
 0003B122    mov         eax,dword ptr [esi]
 0003B124    cmp         eax,104
>0003B129    jg          0003B17A
>0003B12B    je          0003B21B
 0003B131    cmp         eax,87
>0003B136    jg          0003B15C
>0003B138    je          0003B32E
 0003B13E    sub         eax,7
>0003B141    je          0003B1CD
 0003B147    dec         eax
>0003B148    je          0003B201
 0003B14E    sub         eax,7C
>0003B151    je          0003B34E
>0003B157    jmp         0003B37C
 0003B15C    sub         eax,100
>0003B161    je          0003B21B
 0003B167    dec         eax
>0003B168    je          0003B29F
 0003B16E    dec         eax
>0003B16F    je          0003B249
>0003B175    jmp         0003B37C
 0003B17A    cmp         eax,0BD00
>0003B17F    jg          0003B1AB
>0003B181    je          0003B368
 0003B187    sub         eax,105
>0003B18C    je          0003B29F
 0003B192    sub         eax,0FB
>0003B197    je          0003B2BE
 0003B19D    sub         eax,5
>0003B1A0    je          0003B2D4
>0003B1A6    jmp         0003B37C
 0003B1AB    sub         eax,0BD02
>0003B1B0    je          0003B368
 0003B1B6    sub         eax,2
>0003B1B9    je          0003B368
 0003B1BF    sub         eax,2
>0003B1C2    je          0003B368
>0003B1C8    jmp         0003B37C
 0003B1CD    mov         eax,dword ptr [ebp-4]
 0003B1D0    call        GetParentForm
 0003B1D5    mov         edi,eax
 0003B1D7    test        edi,edi
>0003B1D9    je          0003B37C
 0003B1DF    mov         edx,dword ptr [ebp-4]
 0003B1E2    mov         eax,edi
 0003B1E4    mov         ecx,dword ptr [eax]
 0003B1E6    call        dword ptr [ecx+0C8]
 0003B1EC    test        al,al
>0003B1EE    jne         0003B37C
 0003B1F4    xor         eax,eax
 0003B1F6    pop         edx
 0003B1F7    pop         ecx
 0003B1F8    pop         ecx
 0003B1F9    mov         dword ptr fs:[eax],edx
>0003B1FC    jmp         0003B3D4
 0003B201    mov         eax,dword ptr [ebp-4]
 0003B204    test        byte ptr [eax+44],20
>0003B208    je          0003B37C
 0003B20E    xor         eax,eax
 0003B210    pop         edx
 0003B211    pop         ecx
 0003B212    pop         ecx
 0003B213    mov         dword ptr fs:[eax],edx
>0003B216    jmp         0003B3D4
 0003B21B    mov         eax,dword ptr [ebp-4]
 0003B21E    cmp         ebx,dword ptr [eax+208]
>0003B224    je          0003B37C
 0003B22A    mov         edx,esi
 0003B22C    mov         eax,dword ptr [ebp-4]
 0003B22F    call        TWinControl.DoKeyDown
 0003B234    test        al,al
>0003B236    je          0003B37C
 0003B23C    xor         eax,eax
 0003B23E    pop         edx
 0003B23F    pop         ecx
 0003B240    pop         ecx
 0003B241    mov         dword ptr fs:[eax],edx
>0003B244    jmp         0003B3D4
 0003B249    mov         edx,esi
 0003B24B    mov         eax,dword ptr [ebp-4]
 0003B24E    call        TWinControl.DoKeyPress
 0003B253    test        al,al
>0003B255    je          0003B264
 0003B257    xor         eax,eax
 0003B259    pop         edx
 0003B25A    pop         ecx
 0003B25B    pop         ecx
 0003B25C    mov         dword ptr fs:[eax],edx
>0003B25F    jmp         0003B3D4
 0003B264    mov         di,word ptr [esi+4]
 0003B268    cmp         di,0D
>0003B26C    je          0003B278
 0003B26E    cmp         di,1B
>0003B272    jne         0003B37C
 0003B278    mov         eax,dword ptr [ebp-4]
 0003B27B    call        TCustomComboBox.GetDroppedDown
 0003B280    test        al,al
>0003B282    je          0003B37C
 0003B288    xor         edx,edx
 0003B28A    mov         eax,dword ptr [ebp-4]
 0003B28D    call        TCustomComboBox.SetDroppedDown
 0003B292    xor         eax,eax
 0003B294    pop         edx
 0003B295    pop         ecx
 0003B296    pop         ecx
 0003B297    mov         dword ptr fs:[eax],edx
>0003B29A    jmp         0003B3D4
 0003B29F    mov         edx,esi
 0003B2A1    mov         eax,dword ptr [ebp-4]
 0003B2A4    call        TWinControl.DoKeyUp
 0003B2A9    test        al,al
>0003B2AB    je          0003B37C
 0003B2B1    xor         eax,eax
 0003B2B3    pop         edx
 0003B2B4    pop         ecx
 0003B2B5    pop         ecx
 0003B2B6    mov         dword ptr fs:[eax],edx
>0003B2B9    jmp         0003B3D4
 0003B2BE    mov         ecx,esi
 0003B2C0    mov         eax,[000B59E8];^Application:TApplication
 0003B2C5    mov         eax,dword ptr [eax]
 0003B2C7    mov         edx,dword ptr [ebp-4]
 0003B2CA    call        TApplication.HintMouseMessage
>0003B2CF    jmp         0003B37C
 0003B2D4    mov         eax,dword ptr [ebp-4]
 0003B2D7    call        HasPopup
 0003B2DC    test        al,al
>0003B2DE    je          0003B37C
 0003B2E4    movsx       eax,word ptr [esi+8]
 0003B2E8    mov         dword ptr [ebp-0C],eax
 0003B2EB    movsx       eax,word ptr [esi+0A]
 0003B2EF    mov         dword ptr [ebp-8],eax
 0003B2F2    push        1
 0003B2F4    lea         eax,[ebp-0C]
 0003B2F7    push        eax
 0003B2F8    mov         eax,dword ptr [ebp-4]
 0003B2FB    call        TWinControl.GetHandle
 0003B300    push        eax
 0003B301    push        ebx
 0003B302    call        user32.MapWindowPoints
 0003B307    mov         ax,word ptr [ebp-0C]
 0003B30B    mov         word ptr [esi+8],ax
 0003B30F    mov         ax,word ptr [ebp-8]
 0003B313    mov         word ptr [esi+0A],ax
 0003B317    mov         edx,esi
 0003B319    mov         eax,dword ptr [ebp-4]
 0003B31C    mov         ecx,dword ptr [eax]
 0003B31E    call        dword ptr [ecx+70]
 0003B321    xor         eax,eax
 0003B323    pop         edx
 0003B324    pop         ecx
 0003B325    pop         ecx
 0003B326    mov         dword ptr fs:[eax],edx
>0003B329    jmp         0003B3D4
 0003B32E    mov         eax,dword ptr [ebp-4]
 0003B331    call        TCustomComboBox.GetDroppedDown
 0003B336    test        al,al
>0003B338    je          0003B37C
 0003B33A    mov         dword ptr [esi+0C],4
 0003B341    xor         eax,eax
 0003B343    pop         edx
 0003B344    pop         ecx
 0003B345    pop         ecx
 0003B346    mov         dword ptr fs:[eax],edx
>0003B349    jmp         0003B3D4
 0003B34E    mov         eax,dword ptr [ebp-4]
 0003B351    test        byte ptr [eax+20],10
>0003B355    je          0003B37C
 0003B357    mov         dword ptr [esi+0C],0FFFFFFFF
 0003B35E    xor         eax,eax
 0003B360    pop         edx
 0003B361    pop         ecx
 0003B362    pop         ecx
 0003B363    mov         dword ptr fs:[eax],edx
>0003B366    jmp         0003B3D4
 0003B368    mov         edx,esi
 0003B36A    mov         eax,dword ptr [ebp-4]
 0003B36D    mov         ecx,dword ptr [eax]
 0003B36F    call        dword ptr [ecx+70]
 0003B372    xor         eax,eax
 0003B374    pop         edx
 0003B375    pop         ecx
 0003B376    pop         ecx
 0003B377    mov         dword ptr fs:[eax],edx
>0003B37A    jmp         0003B3D4
 0003B37C    mov         eax,dword ptr [esi+8]
 0003B37F    push        eax
 0003B380    mov         eax,dword ptr [esi+4]
 0003B383    push        eax
 0003B384    mov         eax,dword ptr [esi]
 0003B386    push        eax
 0003B387    push        ebx
 0003B388    mov         eax,dword ptr [ebp+8]
 0003B38B    push        eax
 0003B38C    call        user32.CallWindowProcA
 0003B391    mov         dword ptr [esi+0C],eax
 0003B394    cmp         dword ptr [esi],203
>0003B39A    jne         0003B3B1
 0003B39C    mov         eax,dword ptr [ebp-4]
 0003B39F    test        byte ptr [eax+40],80
>0003B3A3    je          0003B3B1
 0003B3A5    mov         eax,dword ptr [ebp-4]
 0003B3A8    mov         bx,0FFEB
 0003B3AC    call        @CallDynaInst
 0003B3B1    xor         eax,eax
 0003B3B3    pop         edx
 0003B3B4    pop         ecx
 0003B3B5    pop         ecx
 0003B3B6    mov         dword ptr fs:[eax],edx
>0003B3B9    jmp         0003B3D4
>0003B3BB    jmp         @HandleAnyException
 0003B3C0    mov         eax,[000B59E8];^Application:TApplication
 0003B3C5    mov         eax,dword ptr [eax]
 0003B3C7    mov         edx,dword ptr [ebp-4]
 0003B3CA    call        TApplication.HandleException
 0003B3CF    call        @DoneExcept
 0003B3D4    pop         edi
 0003B3D5    pop         esi
 0003B3D6    pop         ebx
 0003B3D7    mov         esp,ebp
 0003B3D9    pop         ebp
 0003B3DA    ret         4
*}
end;

//0003B3E0
procedure TCustomComboBox.WndProc(var Message:TMessage);
begin
{*
 0003B3E0    push        ebx
 0003B3E1    push        esi
 0003B3E2    push        edi
 0003B3E3    mov         esi,edx
 0003B3E5    mov         ebx,eax
 0003B3E7    test        byte ptr [ebx+20],10
>0003B3EB    jne         0003B43D
 0003B3ED    mov         edi,dword ptr [esi]
 0003B3EF    cmp         edi,201
>0003B3F5    je          0003B3FF
 0003B3F7    cmp         edi,203
>0003B3FD    jne         0003B43D
 0003B3FF    mov         eax,ebx
 0003B401    call        TControl.Dragging
 0003B406    test        al,al
>0003B408    jne         0003B43D
 0003B40A    cmp         byte ptr [ebx+4D],1
>0003B40E    jne         0003B43D
 0003B410    mov         edx,esi
 0003B412    mov         eax,ebx
 0003B414    call        TWinControl.IsControlMouseMsg
 0003B419    test        al,al
>0003B41B    jne         0003B522
 0003B421    mov         ax,[0003B528]
 0003B427    or          ax,word ptr [ebx+44]
 0003B42B    mov         word ptr [ebx+44],ax
 0003B42F    mov         edx,esi
 0003B431    mov         eax,ebx
 0003B433    mov         ecx,dword ptr [eax]
 0003B435    call        dword ptr [ecx-14]
>0003B438    jmp         0003B522
 0003B43D    mov         eax,dword ptr [esi]
 0003B43F    sub         eax,5
>0003B442    je          0003B466
 0003B444    sub         eax,0FD
>0003B449    je          0003B4E6
 0003B44F    add         eax,0FFFFFFD0
 0003B452    sub         eax,7
>0003B455    jb          0003B481
 0003B457    add         eax,0FFFF4407
 0003B45C    sub         eax,7
>0003B45F    jb          0003B4C0
>0003B461    jmp         0003B519
 0003B466    cmp         byte ptr [ebx+228],0
>0003B46D    je          0003B519
 0003B473    mov         edx,esi
 0003B475    mov         eax,ebx
 0003B477    mov         ecx,dword ptr [eax]
 0003B479    call        dword ptr [ecx-10]
>0003B47C    jmp         0003B522
 0003B481    mov         eax,dword ptr [ebx+58]
 0003B484    mov         eax,dword ptr [eax+14]
 0003B487    call        ColorToRGB
 0003B48C    push        eax
 0003B48D    mov         eax,dword ptr [esi+4]
 0003B490    push        eax
 0003B491    call        gdi32.SetTextColor
 0003B496    mov         eax,dword ptr [ebx+124]
 0003B49C    call        TBrush.GetColor
 0003B4A1    call        ColorToRGB
 0003B4A6    push        eax
 0003B4A7    mov         eax,dword ptr [esi+4]
 0003B4AA    push        eax
 0003B4AB    call        gdi32.SetBkColor
 0003B4B0    mov         eax,dword ptr [ebx+124]
 0003B4B6    call        TBrush.GetHandle
 0003B4BB    mov         dword ptr [esi+0C],eax
>0003B4BE    jmp         0003B522
 0003B4C0    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003B4C5    cmp         byte ptr [eax],0
>0003B4C8    jne         0003B519
 0003B4CA    cmp         byte ptr [ebx+1F6],2
>0003B4D1    jae         0003B519
 0003B4D3    mov         eax,dword ptr [ebx+24]
 0003B4D6    mov         eax,dword ptr [eax+124]
 0003B4DC    call        TBrush.GetHandle
 0003B4E1    mov         dword ptr [esi+0C],eax
>0003B4E4    jmp         0003B522
 0003B4E6    mov         edx,esi
 0003B4E8    mov         eax,ebx
 0003B4EA    call        TWinControl.DoKeyPress
 0003B4EF    test        al,al
>0003B4F1    jne         0003B522
 0003B4F3    mov         di,word ptr [esi+4]
 0003B4F7    cmp         di,0D
>0003B4FB    je          0003B503
 0003B4FD    cmp         di,1B
>0003B501    jne         0003B519
 0003B503    mov         eax,ebx
 0003B505    call        TCustomComboBox.GetDroppedDown
 0003B50A    test        al,al
>0003B50C    je          0003B519
 0003B50E    xor         edx,edx
 0003B510    mov         eax,ebx
 0003B512    call        TCustomComboBox.SetDroppedDown
>0003B517    jmp         0003B522
 0003B519    mov         edx,esi
 0003B51B    mov         eax,ebx
 0003B51D    call        TWinControl.WndProc
 0003B522    pop         edi
 0003B523    pop         esi
 0003B524    pop         ebx
 0003B525    ret
*}
end;

//0003B52C
procedure TCustomComboBox.AdjustDropDown;
begin
{*
 0003B52C    push        ebp
 0003B52D    mov         ebp,esp
 0003B52F    push        ecx
 0003B530    push        ebx
 0003B531    mov         dword ptr [ebp-4],eax
 0003B534    mov         eax,dword ptr [ebp-4]
 0003B537    mov         eax,dword ptr [eax+1EC]
 0003B53D    mov         edx,dword ptr [eax]
 0003B53F    call        dword ptr [edx+14]
 0003B542    mov         ebx,eax
 0003B544    mov         eax,dword ptr [ebp-4]
 0003B547    mov         eax,dword ptr [eax+200]
 0003B54D    cmp         ebx,eax
>0003B54F    jle         0003B553
 0003B551    mov         ebx,eax
 0003B553    cmp         ebx,1
>0003B556    jge         0003B55D
 0003B558    mov         ebx,1
 0003B55D    mov         eax,dword ptr [ebp-4]
 0003B560    mov         byte ptr [eax+228],1
 0003B567    xor         eax,eax
 0003B569    push        ebp
 0003B56A    push        3B5C1
 0003B56F    push        dword ptr fs:[eax]
 0003B572    mov         dword ptr fs:[eax],esp
 0003B575    push        9E
 0003B57A    mov         eax,dword ptr [ebp-4]
 0003B57D    call        TCustomComboBox.GetItemHeight
 0003B582    imul        ebx
 0003B584    mov         edx,dword ptr [ebp-4]
 0003B587    add         eax,dword ptr [edx+3C]
 0003B58A    add         eax,2
 0003B58D    push        eax
 0003B58E    mov         eax,dword ptr [ebp-4]
 0003B591    mov         eax,dword ptr [eax+38]
 0003B594    push        eax
 0003B595    push        0
 0003B597    push        0
 0003B599    push        0
 0003B59B    mov         eax,dword ptr [ebp-4]
 0003B59E    call        TWinControl.GetHandle
 0003B5A3    push        eax
 0003B5A4    call        user32.SetWindowPos
 0003B5A9    xor         eax,eax
 0003B5AB    pop         edx
 0003B5AC    pop         ecx
 0003B5AD    pop         ecx
 0003B5AE    mov         dword ptr fs:[eax],edx
 0003B5B1    push        3B5C8
 0003B5B6    mov         eax,dword ptr [ebp-4]
 0003B5B9    mov         byte ptr [eax+228],0
 0003B5C0    ret
>0003B5C1    jmp         @HandleFinally
>0003B5C6    jmp         0003B5B6
 0003B5C8    push        5F
 0003B5CA    push        0
 0003B5CC    push        0
 0003B5CE    push        0
 0003B5D0    push        0
 0003B5D2    push        0
 0003B5D4    mov         eax,dword ptr [ebp-4]
 0003B5D7    call        TWinControl.GetHandle
 0003B5DC    push        eax
 0003B5DD    call        user32.SetWindowPos
 0003B5E2    pop         ebx
 0003B5E3    pop         ecx
 0003B5E4    pop         ebp
 0003B5E5    ret
*}
end;

//0003B5E8
procedure TCustomComboBox.CNCommand(var Message:TWMCommand);
begin
{*
 0003B5E8    push        ebp
 0003B5E9    mov         ebp,esp
 0003B5EB    push        0
 0003B5ED    push        ebx
 0003B5EE    push        esi
 0003B5EF    mov         esi,eax
 0003B5F1    xor         eax,eax
 0003B5F3    push        ebp
 0003B5F4    push        3B728
 0003B5F9    push        dword ptr fs:[eax]
 0003B5FC    mov         dword ptr fs:[eax],esp
 0003B5FF    movzx       eax,word ptr [edx+6]
 0003B603    cmp         eax,7
>0003B606    ja          0003B712
 0003B60C    jmp         dword ptr [eax*4+3B613]
 0003B60C    dd          0003B712
 0003B60C    dd          0003B6AD
 0003B60C    dd          0003B633
 0003B60C    dd          0003B6E6
 0003B60C    dd          0003B6FD
 0003B60C    dd          0003B643
 0003B60C    dd          0003B712
 0003B60C    dd          0003B653
 0003B633    mov         eax,esi
 0003B635    mov         bx,0FFEB
 0003B639    call        @CallDynaInst
>0003B63E    jmp         0003B712
 0003B643    mov         eax,esi
 0003B645    mov         bx,0FFB8
 0003B649    call        @CallDynaInst
>0003B64E    jmp         0003B712
 0003B653    mov         byte ptr [esi+21D],0
 0003B65A    mov         eax,esi
 0003B65C    mov         bx,0FFB7
 0003B660    call        @CallDynaInst
 0003B665    mov         eax,esi
 0003B667    call        TCustomComboBox.AdjustDropDown
 0003B66C    cmp         byte ptr [esi+21D],0
>0003B673    je          0003B712
 0003B679    push        0
 0003B67B    push        0
 0003B67D    push        1F
 0003B67F    mov         eax,esi
 0003B681    call        TWinControl.GetHandle
 0003B686    push        eax
 0003B687    call        user32.PostMessageA
 0003B68C    cmp         byte ptr [esi+21C],0
>0003B693    jne         0003B712
 0003B695    push        0
 0003B697    push        0
 0003B699    push        14F
 0003B69E    mov         eax,esi
 0003B6A0    call        TWinControl.GetHandle
 0003B6A5    push        eax
 0003B6A6    call        user32.PostMessageA
>0003B6AB    jmp         0003B712
 0003B6AD    mov         eax,esi
 0003B6AF    call        TCustomComboBox.GetItemIndex
 0003B6B4    mov         edx,eax
 0003B6B6    lea         ecx,[ebp-4]
 0003B6B9    mov         eax,dword ptr [esi+1EC]
 0003B6BF    mov         ebx,dword ptr [eax]
 0003B6C1    call        dword ptr [ebx+0C]
 0003B6C4    mov         edx,dword ptr [ebp-4]
 0003B6C7    mov         eax,esi
 0003B6C9    call        TControl.SetText
 0003B6CE    mov         eax,esi
 0003B6D0    mov         bx,0FFEC
 0003B6D4    call        @CallDynaInst
 0003B6D9    mov         eax,esi
 0003B6DB    mov         bx,0FFB8
 0003B6DF    call        @CallDynaInst
>0003B6E4    jmp         0003B712
 0003B6E6    mov         byte ptr [esi+21C],1
 0003B6ED    mov         byte ptr [esi+21D],1
 0003B6F4    mov         eax,esi
 0003B6F6    call        TWinControl.SetIme
>0003B6FB    jmp         0003B712
 0003B6FD    mov         byte ptr [esi+21C],0
 0003B704    mov         byte ptr [esi+21D],1
 0003B70B    mov         eax,esi
 0003B70D    call        TWinControl.ResetIme
 0003B712    xor         eax,eax
 0003B714    pop         edx
 0003B715    pop         ecx
 0003B716    pop         ecx
 0003B717    mov         dword ptr fs:[eax],edx
 0003B71A    push        3B72F
 0003B71F    lea         eax,[ebp-4]
 0003B722    call        @LStrClr
 0003B727    ret
>0003B728    jmp         @HandleFinally
>0003B72D    jmp         0003B71F
 0003B72F    pop         esi
 0003B730    pop         ebx
 0003B731    pop         ecx
 0003B732    pop         ebp
 0003B733    ret
*}
end;

//0003B734
procedure TCustomComboBox.Change;
begin
{*
 0003B734    push        ebx
 0003B735    mov         ebx,eax
 0003B737    mov         eax,ebx
 0003B739    call        TControl.Changed
 0003B73E    cmp         word ptr [ebx+22E],0
>0003B746    je          0003B756
 0003B748    mov         edx,ebx
 0003B74A    mov         eax,dword ptr [ebx+230]
 0003B750    call        dword ptr [ebx+22C]
 0003B756    pop         ebx
 0003B757    ret
*}
end;

//0003B758
procedure TCustomComboBox.DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);
begin
{*
 0003B758    push        ebp
 0003B759    mov         ebp,esp
 0003B75B    add         esp,0FFFFFFEC
 0003B75E    push        ebx
 0003B75F    push        esi
 0003B760    push        edi
 0003B761    xor         ebx,ebx
 0003B763    mov         dword ptr [ebp-14],ebx
 0003B766    mov         esi,ecx
 0003B768    lea         edi,[ebp-10]
 0003B76B    mov         ecx,4
 0003B770    rep movs    dword ptr [edi],dword ptr [esi]
 0003B772    mov         esi,edx
 0003B774    mov         ebx,eax
 0003B776    xor         eax,eax
 0003B778    push        ebp
 0003B779    push        3B7FF
 0003B77E    push        dword ptr fs:[eax]
 0003B781    mov         dword ptr fs:[eax],esp
 0003B784    mov         eax,dword ptr [ebx+1F0]
 0003B78A    call        TControlCanvas.UpdateTextFlags
 0003B78F    cmp         word ptr [ebx+23E],0
>0003B797    je          0003B7B3
 0003B799    lea         eax,[ebp-10]
 0003B79C    push        eax
 0003B79D    mov         al,byte ptr [ebp+8]
 0003B7A0    push        eax
 0003B7A1    mov         ecx,esi
 0003B7A3    mov         edx,ebx
 0003B7A5    mov         eax,dword ptr [ebx+240]
 0003B7AB    call        dword ptr [ebx+23C]
>0003B7B1    jmp         0003B7E9
 0003B7B3    lea         edx,[ebp-10]
 0003B7B6    mov         eax,dword ptr [ebx+1F0]
 0003B7BC    call        TCanvas.FillRect
 0003B7C1    lea         ecx,[ebp-14]
 0003B7C4    mov         edx,esi
 0003B7C6    mov         eax,dword ptr [ebx+1EC]
 0003B7CC    mov         esi,dword ptr [eax]
 0003B7CE    call        dword ptr [esi+0C]
 0003B7D1    mov         eax,dword ptr [ebp-14]
 0003B7D4    push        eax
 0003B7D5    mov         edx,dword ptr [ebp-10]
 0003B7D8    add         edx,2
 0003B7DB    mov         ecx,dword ptr [ebp-0C]
 0003B7DE    mov         eax,dword ptr [ebx+1F0]
 0003B7E4    call        TCanvas.TextOut
 0003B7E9    xor         eax,eax
 0003B7EB    pop         edx
 0003B7EC    pop         ecx
 0003B7ED    pop         ecx
 0003B7EE    mov         dword ptr fs:[eax],edx
 0003B7F1    push        3B806
 0003B7F6    lea         eax,[ebp-14]
 0003B7F9    call        @LStrClr
 0003B7FE    ret
>0003B7FF    jmp         @HandleFinally
>0003B804    jmp         0003B7F6
 0003B806    pop         edi
 0003B807    pop         esi
 0003B808    pop         ebx
 0003B809    mov         esp,ebp
 0003B80B    pop         ebp
 0003B80C    ret         4
*}
end;

//0003B810
procedure TCustomComboBox.DropDown;
begin
{*
 0003B810    push        ebx
 0003B811    cmp         word ptr [eax+236],0
>0003B819    je          0003B82B
 0003B81B    mov         ebx,eax
 0003B81D    mov         edx,eax
 0003B81F    mov         eax,dword ptr [ebx+238]
 0003B825    call        dword ptr [ebx+234]
 0003B82B    pop         ebx
 0003B82C    ret
*}
end;

//0003B830
procedure TCustomComboBox.MeasureItem(Index:Integer; var Height:Integer);
begin
{*
 0003B830    push        ebx
 0003B831    cmp         word ptr [eax+246],0
>0003B839    je          0003B84E
 0003B83B    push        ecx
 0003B83C    mov         ebx,eax
 0003B83E    mov         ecx,edx
 0003B840    mov         edx,eax
 0003B842    mov         eax,dword ptr [ebx+248]
 0003B848    call        dword ptr [ebx+244]
 0003B84E    pop         ebx
 0003B84F    ret
*}
end;

//0003B850
procedure TCustomComboBox.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 0003B850    push        ebx
 0003B851    push        esi
 0003B852    push        edi
 0003B853    push        ebp
 0003B854    push        ecx
 0003B855    mov         esi,eax
 0003B857    mov         edi,dword ptr [edx+8]
 0003B85A    mov         al,byte ptr [edi+10]
 0003B85D    mov         byte ptr [esp],al
 0003B860    mov         edx,dword ptr [edi+18]
 0003B863    mov         eax,dword ptr [esi+1F0]
 0003B869    call        TCanvas.SetHandle
 0003B86E    mov         edx,dword ptr [esi+58]
 0003B871    mov         eax,dword ptr [esi+1F0]
 0003B877    call        TCanvas.SetFont
 0003B87C    mov         edx,dword ptr [esi+124]
 0003B882    mov         eax,dword ptr [esi+1F0]
 0003B888    call        TCanvas.SetBrush
 0003B88D    cmp         dword ptr [edi+8],0
>0003B891    jl          0003B8BF
 0003B893    test        byte ptr [esp],1
>0003B897    je          0003B8BF
 0003B899    mov         eax,dword ptr [esi+1F0]
 0003B89F    mov         eax,dword ptr [eax+14]
 0003B8A2    mov         edx,8000000D
 0003B8A7    call        TBrush.SetColor
 0003B8AC    mov         eax,dword ptr [esi+1F0]
 0003B8B2    mov         eax,dword ptr [eax+0C]
 0003B8B5    mov         edx,8000000E
 0003B8BA    call        TFont.SetColor
 0003B8BF    mov         ebp,dword ptr [edi+8]
 0003B8C2    test        ebp,ebp
>0003B8C4    jl          0003B8DB
 0003B8C6    mov         al,byte ptr [esp]
 0003B8C9    push        eax
 0003B8CA    lea         ecx,[edi+1C]
 0003B8CD    mov         edx,ebp
 0003B8CF    mov         eax,esi
 0003B8D1    mov         ebx,dword ptr [eax]
 0003B8D3    call        dword ptr [ebx+0BC]
>0003B8D9    jmp         0003B8E9
 0003B8DB    lea         edx,[edi+1C]
 0003B8DE    mov         eax,dword ptr [esi+1F0]
 0003B8E4    call        TCanvas.FillRect
 0003B8E9    test        byte ptr [esp],10
>0003B8ED    je          0003B8FC
 0003B8EF    lea         eax,[edi+1C]
 0003B8F2    push        eax
 0003B8F3    mov         eax,dword ptr [edi+18]
 0003B8F6    push        eax
 0003B8F7    call        user32.DrawFocusRect
 0003B8FC    xor         edx,edx
 0003B8FE    mov         eax,dword ptr [esi+1F0]
 0003B904    call        TCanvas.SetHandle
 0003B909    pop         edx
 0003B90A    pop         ebp
 0003B90B    pop         edi
 0003B90C    pop         esi
 0003B90D    pop         ebx
 0003B90E    ret
*}
end;

//0003B910
procedure TCustomComboBox.CNMeasureItem(var Message:TWMMeasureItem);
begin
{*
 0003B910    push        ebx
 0003B911    push        esi
 0003B912    push        edi
 0003B913    mov         esi,eax
 0003B915    mov         edi,dword ptr [edx+8]
 0003B918    mov         eax,dword ptr [esi+1F8]
 0003B91E    mov         dword ptr [edi+10],eax
 0003B921    cmp         byte ptr [esi+1F6],4
>0003B928    jne         0003B93A
 0003B92A    lea         ecx,[edi+10]
 0003B92D    mov         edx,dword ptr [edi+8]
 0003B930    mov         eax,esi
 0003B932    mov         ebx,dword ptr [eax]
 0003B934    call        dword ptr [ebx+0C4]
 0003B93A    pop         edi
 0003B93B    pop         esi
 0003B93C    pop         ebx
 0003B93D    ret
*}
end;

//0003B940
procedure TCustomComboBox.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 0003B940    push        ebx
 0003B941    push        esi
 0003B942    mov         esi,edx
 0003B944    mov         ebx,eax
 0003B946    cmp         byte ptr [ebx+4D],1
>0003B94A    jne         0003B982
 0003B94C    cmp         byte ptr [ebx+1F6],2
>0003B953    jne         0003B982
 0003B955    push        15
 0003B957    call        user32.GetSystemMetrics
 0003B95C    mov         edx,dword ptr [ebx+38]
 0003B95F    sub         edx,eax
 0003B961    movsx       eax,word ptr [esi+8]
 0003B965    cmp         edx,eax
>0003B967    jle         0003B982
 0003B969    mov         eax,ebx
 0003B96B    mov         edx,dword ptr [eax]
 0003B96D    call        dword ptr [edx+0B4]
 0003B973    or          ecx,0FFFFFFFF
 0003B976    xor         edx,edx
 0003B978    mov         eax,ebx
 0003B97A    call        TControl.BeginDrag
 0003B97F    pop         esi
 0003B980    pop         ebx
 0003B981    ret
 0003B982    mov         edx,esi
 0003B984    mov         eax,ebx
 0003B986    call        TControl.WMLButtonDown
 0003B98B    mov         eax,ebx
 0003B98D    call        TControl.GetMouseCapture
 0003B992    test        al,al
>0003B994    je          0003B9B2
 0003B996    mov         eax,ebx
 0003B998    call        GetParentForm
 0003B99D    test        eax,eax
>0003B99F    je          0003B9B2
 0003B9A1    cmp         ebx,dword ptr [eax+200]
>0003B9A7    je          0003B9B2
 0003B9A9    xor         edx,edx
 0003B9AB    mov         eax,ebx
 0003B9AD    call        TControl.SetMouseCapture
 0003B9B2    pop         esi
 0003B9B3    pop         ebx
 0003B9B4    ret
*}
end;

//0003B9B8
procedure TCustomComboBox.Focused;
begin
{*
 0003B9B8    push        ebx
 0003B9B9    push        esi
 0003B9BA    mov         esi,eax
 0003B9BC    xor         ebx,ebx
 0003B9BE    mov         eax,esi
 0003B9C0    call        TWinControl.HandleAllocated
 0003B9C5    test        al,al
>0003B9C7    je          0003B9E4
 0003B9C9    call        user32.GetFocus
 0003B9CE    cmp         eax,dword ptr [esi+204]
>0003B9D4    je          0003B9E2
 0003B9D6    cmp         eax,dword ptr [esi+208]
>0003B9DC    je          0003B9E2
 0003B9DE    xor         ebx,ebx
>0003B9E0    jmp         0003B9E4
 0003B9E2    mov         bl,1
 0003B9E4    mov         eax,ebx
 0003B9E6    pop         esi
 0003B9E7    pop         ebx
 0003B9E8    ret
*}
end;

//0003B9EC
procedure TButtonActionLink.AssignClient(AClient:TObject);
begin
{*
 0003B9EC    push        ebx
 0003B9ED    push        esi
 0003B9EE    mov         esi,edx
 0003B9F0    mov         ebx,eax
 0003B9F2    mov         edx,esi
 0003B9F4    mov         eax,ebx
 0003B9F6    call        TWinControlActionLink.AssignClient
 0003B9FB    mov         eax,esi
 0003B9FD    mov         edx,dword ptr ds:[3682C];TButtonControl
 0003BA03    call        @AsClass
 0003BA08    mov         dword ptr [ebx+18],eax
 0003BA0B    pop         esi
 0003BA0C    pop         ebx
 0003BA0D    ret
*}
end;

//0003BA10
function TButtonActionLink.IsCheckedLinked:Boolean;
begin
{*
 0003BA10    push        ebx
 0003BA11    mov         ebx,eax
 0003BA13    mov         eax,ebx
 0003BA15    call        TActionLink.IsCheckedLinked
 0003BA1A    test        al,al
>0003BA1C    je          0003BA3E
 0003BA1E    mov         eax,dword ptr [ebx+18]
 0003BA21    mov         edx,dword ptr [eax]
 0003BA23    call        dword ptr [edx+0B8]
 0003BA29    push        eax
 0003BA2A    mov         eax,dword ptr [ebx+0C]
 0003BA2D    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0003BA33    call        @AsClass
 0003BA38    pop         edx
 0003BA39    cmp         dl,byte ptr [eax+50]
>0003BA3C    je          0003BA42
 0003BA3E    xor         eax,eax
 0003BA40    pop         ebx
 0003BA41    ret
 0003BA42    mov         al,1
 0003BA44    pop         ebx
 0003BA45    ret
*}
end;

//0003BA48
procedure TButtonActionLink.SetChecked(Value:Boolean);
begin
{*
 0003BA48    push        ebp
 0003BA49    mov         ebp,esp
 0003BA4B    push        ecx
 0003BA4C    push        ebx
 0003BA4D    mov         ebx,edx
 0003BA4F    mov         dword ptr [ebp-4],eax
 0003BA52    mov         eax,dword ptr [ebp-4]
 0003BA55    mov         edx,dword ptr [eax]
 0003BA57    call        dword ptr [edx+20]
 0003BA5A    test        al,al
>0003BA5C    je          0003BAA5
 0003BA5E    mov         eax,dword ptr [ebp-4]
 0003BA61    mov         eax,dword ptr [eax+18]
 0003BA64    mov         byte ptr [eax+1EC],1
 0003BA6B    xor         edx,edx
 0003BA6D    push        ebp
 0003BA6E    push        3BA9E
 0003BA73    push        dword ptr fs:[edx]
 0003BA76    mov         dword ptr fs:[edx],esp
 0003BA79    mov         edx,ebx
 0003BA7B    mov         ecx,dword ptr [eax]
 0003BA7D    call        dword ptr [ecx+0BC]
 0003BA83    xor         eax,eax
 0003BA85    pop         edx
 0003BA86    pop         ecx
 0003BA87    pop         ecx
 0003BA88    mov         dword ptr fs:[eax],edx
 0003BA8B    push        3BAA5
 0003BA90    mov         eax,dword ptr [ebp-4]
 0003BA93    mov         eax,dword ptr [eax+18]
 0003BA96    mov         byte ptr [eax+1EC],0
 0003BA9D    ret
>0003BA9E    jmp         @HandleFinally
>0003BAA3    jmp         0003BA90
 0003BAA5    pop         ebx
 0003BAA6    pop         ecx
 0003BAA7    pop         ebp
 0003BAA8    ret
*}
end;

//0003BAAC
constructor TButtonControl.Create(AOwner:TComponent);
begin
{*
 0003BAAC    push        ebx
 0003BAAD    push        esi
 0003BAAE    test        dl,dl
>0003BAB0    je          0003BABA
 0003BAB2    add         esp,0FFFFFFF0
 0003BAB5    call        @ClassCreate
 0003BABA    mov         ebx,edx
 0003BABC    mov         esi,eax
 0003BABE    xor         edx,edx
 0003BAC0    mov         eax,esi
 0003BAC2    call        TWinControl.Create
 0003BAC7    mov         byte ptr [esi+148],0
 0003BACE    mov         eax,esi
 0003BAD0    test        bl,bl
>0003BAD2    je          0003BAE3
 0003BAD4    call        @AfterConstruction
 0003BAD9    pop         dword ptr fs:[0]
 0003BAE0    add         esp,0C
 0003BAE3    mov         eax,esi
 0003BAE5    pop         esi
 0003BAE6    pop         ebx
 0003BAE7    ret
*}
end;

//0003BAE8
procedure TButtonControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 0003BAE8    push        ebx
 0003BAE9    push        esi
 0003BAEA    push        edi
 0003BAEB    mov         ebx,ecx
 0003BAED    mov         esi,edx
 0003BAEF    mov         edi,eax
 0003BAF1    mov         ecx,ebx
 0003BAF3    mov         edx,esi
 0003BAF5    mov         eax,edi
 0003BAF7    call        TWinControl.ActionChange
 0003BAFC    mov         eax,esi
 0003BAFE    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0003BB04    call        @IsClass
 0003BB09    test        al,al
>0003BB0B    je          0003BB2C
 0003BB0D    test        bl,bl
>0003BB0F    je          0003BB1F
 0003BB11    mov         eax,edi
 0003BB13    mov         edx,dword ptr [eax]
 0003BB15    call        dword ptr [edx+0B8]
 0003BB1B    test        al,al
>0003BB1D    jne         0003BB2C
 0003BB1F    mov         dl,byte ptr [esi+50]
 0003BB22    mov         eax,edi
 0003BB24    mov         ecx,dword ptr [eax]
 0003BB26    call        dword ptr [ecx+0BC]
 0003BB2C    pop         edi
 0003BB2D    pop         esi
 0003BB2E    pop         ebx
 0003BB2F    ret
*}
end;

//0003BB30
procedure TButtonControl.sub_0003BB30;
begin
{*
 0003BB30    mov         eax,[0003676C];TButtonActionLink
 0003BB35    ret
*}
end;

//0003BB38
{*function sub_0003BB38:?;
begin
 0003BB38    xor         eax,eax
 0003BB3A    ret
end;*}

//0003BB3C
function TButtonControl.IsCheckedStored(Value:Boolean):Boolean;
begin
{*
 0003BB3C    push        ebx
 0003BB3D    push        esi
 0003BB3E    mov         ebx,eax
 0003BB40    mov         esi,dword ptr [ebx+5C]
 0003BB43    test        esi,esi
>0003BB45    je          0003BB57
 0003BB47    mov         eax,esi
 0003BB49    mov         edx,dword ptr [eax]
 0003BB4B    call        dword ptr [edx+20]
 0003BB4E    test        al,al
>0003BB50    je          0003BB57
 0003BB52    xor         eax,eax
 0003BB54    pop         esi
 0003BB55    pop         ebx
 0003BB56    ret
 0003BB57    mov         al,1
 0003BB59    pop         esi
 0003BB5A    pop         ebx
 0003BB5B    ret
*}
end;

//0003BB5C
procedure sub_0003BB5C;
begin
{*
 0003BB5C    ret
*}
end;

//0003BB60
procedure TButtonControl.WndProc(var Message:TMessage);
begin
{*
 0003BB60    push        ebx
 0003BB61    push        esi
 0003BB62    push        edi
 0003BB63    mov         edi,edx
 0003BB65    mov         esi,eax
 0003BB67    mov         eax,dword ptr [edi]
 0003BB69    sub         eax,201
>0003BB6E    je          0003BB7E
 0003BB70    sub         eax,2
>0003BB73    je          0003BB7E
 0003BB75    sub         eax,0BB0E
>0003BB7A    je          0003BBBF
>0003BB7C    jmp         0003BBC8
 0003BB7E    test        byte ptr [esi+20],10
>0003BB82    jne         0003BBC8
 0003BB84    mov         eax,esi
 0003BB86    mov         bx,0FFBB
 0003BB8A    call        @CallDynaInst
 0003BB8F    test        al,al
>0003BB91    jne         0003BBC8
 0003BB93    mov         byte ptr [esi+1EC],1
 0003BB9A    mov         eax,esi
 0003BB9C    call        TWinControl.GetHandle
 0003BBA1    push        eax
 0003BBA2    call        user32.SetFocus
 0003BBA7    mov         byte ptr [esi+1EC],0
 0003BBAE    mov         eax,esi
 0003BBB0    mov         bx,0FFBB
 0003BBB4    call        @CallDynaInst
 0003BBB9    test        al,al
>0003BBBB    je          0003BBD1
>0003BBBD    jmp         0003BBC8
 0003BBBF    cmp         byte ptr [esi+1EC],0
>0003BBC6    jne         0003BBD1
 0003BBC8    mov         edx,edi
 0003BBCA    mov         eax,esi
 0003BBCC    call        TWinControl.WndProc
 0003BBD1    pop         edi
 0003BBD2    pop         esi
 0003BBD3    pop         ebx
 0003BBD4    ret
*}
end;

//0003BBD8
constructor TButton.Create(AOwner:TComponent);
begin
{*
 0003BBD8    push        ebx
 0003BBD9    push        esi
 0003BBDA    test        dl,dl
>0003BBDC    je          0003BBE6
 0003BBDE    add         esp,0FFFFFFF0
 0003BBE1    call        @ClassCreate
 0003BBE6    mov         ebx,edx
 0003BBE8    mov         esi,eax
 0003BBEA    xor         edx,edx
 0003BBEC    mov         eax,esi
 0003BBEE    call        TButtonControl.Create
 0003BBF3    mov         eax,[0003BC38]
 0003BBF8    mov         dword ptr [esi+40],eax
 0003BBFB    mov         edx,4B
 0003BC00    mov         eax,esi
 0003BC02    call        TControl.SetWidth
 0003BC07    mov         edx,19
 0003BC0C    mov         eax,esi
 0003BC0E    call        TControl.SetHeight
 0003BC13    mov         dl,1
 0003BC15    mov         eax,esi
 0003BC17    call        TWinControl.SetTabStop
 0003BC1C    mov         eax,esi
 0003BC1E    test        bl,bl
>0003BC20    je          0003BC31
 0003BC22    call        @AfterConstruction
 0003BC27    pop         dword ptr fs:[0]
 0003BC2E    add         esp,0C
 0003BC31    mov         eax,esi
 0003BC33    pop         esi
 0003BC34    pop         ebx
 0003BC35    ret
*}
end;

//0003BC3C
procedure TButton.Click;
begin
{*
 0003BC3C    push        ebx
 0003BC3D    mov         ebx,eax
 0003BC3F    mov         eax,ebx
 0003BC41    call        GetParentForm
 0003BC46    test        eax,eax
>0003BC48    je          0003BC56
 0003BC4A    mov         edx,dword ptr [ebx+1F4]
 0003BC50    mov         dword ptr [eax+22C],edx
 0003BC56    mov         eax,ebx
 0003BC58    call        TControl.Click
 0003BC5D    pop         ebx
 0003BC5E    ret
*}
end;

//0003BC60
procedure TButton.UseRightToLeftAlignment;
begin
{*
 0003BC60    xor         eax,eax
 0003BC62    ret
*}
end;

//0003BC64
procedure TButton.SetButtonStyle(ADefault:Boolean);
begin
{*
 0003BC64    push        ebx
 0003BC65    push        esi
 0003BC66    push        edi
 0003BC67    push        ebp
 0003BC68    mov         ebx,edx
 0003BC6A    mov         ebp,eax
 0003BC6C    mov         eax,ebp
 0003BC6E    call        TWinControl.HandleAllocated
 0003BC73    test        al,al
>0003BC75    je          0003BCB1
 0003BC77    test        bl,bl
>0003BC79    je          0003BC81
 0003BC7B    mov         si,1
>0003BC7F    jmp         0003BC83
 0003BC81    xor         esi,esi
 0003BC83    push        0F0
 0003BC85    mov         eax,ebp
 0003BC87    call        TWinControl.GetHandle
 0003BC8C    push        eax
 0003BC8D    call        user32.GetWindowLongA
 0003BC92    and         eax,0F
 0003BC95    movzx       edi,si
 0003BC98    cmp         eax,edi
>0003BC9A    je          0003BCB1
 0003BC9C    push        1
 0003BC9E    push        edi
 0003BC9F    push        0F4
 0003BCA4    mov         eax,ebp
 0003BCA6    call        TWinControl.GetHandle
 0003BCAB    push        eax
 0003BCAC    call        user32.SendMessageA
 0003BCB1    pop         ebp
 0003BCB2    pop         edi
 0003BCB3    pop         esi
 0003BCB4    pop         ebx
 0003BCB5    ret
*}
end;

//0003BCB8
procedure TButton.SetDefault(Value:Boolean);
begin
{*
 0003BCB8    push        ebx
 0003BCB9    mov         ebx,eax
 0003BCBB    mov         byte ptr [ebx+1F0],dl
 0003BCC1    mov         eax,ebx
 0003BCC3    call        TWinControl.HandleAllocated
 0003BCC8    test        al,al
>0003BCCA    je          0003BCEA
 0003BCCC    mov         eax,ebx
 0003BCCE    call        GetParentForm
 0003BCD3    test        eax,eax
>0003BCD5    je          0003BCEA
 0003BCD7    mov         edx,dword ptr [eax+200]
 0003BCDD    push        edx
 0003BCDE    xor         ecx,ecx
 0003BCE0    mov         edx,0B007
 0003BCE5    call        TControl.Perform
 0003BCEA    pop         ebx
 0003BCEB    ret
*}
end;

//0003BCEC
procedure TButton.CreateParams(var Params:TCreateParams);
begin
{*
 0003BCEC    push        ebx
 0003BCED    push        esi
 0003BCEE    mov         esi,edx
 0003BCF0    mov         ebx,eax
 0003BCF2    mov         edx,esi
 0003BCF4    mov         eax,ebx
 0003BCF6    call        TWinControl.CreateParams
 0003BCFB    mov         ecx,3BD20
 0003BD00    mov         edx,esi
 0003BD02    mov         eax,ebx
 0003BD04    call        TWinControl.CreateSubClass
 0003BD09    xor         eax,eax
 0003BD0B    mov         al,byte ptr [ebx+1F0]
 0003BD11    mov         eax,dword ptr [eax*4+0B4718]
 0003BD18    or          dword ptr [esi+4],eax
 0003BD1B    pop         esi
 0003BD1C    pop         ebx
 0003BD1D    ret
*}
end;

//0003BD28
procedure TButton.CreateWnd;
begin
{*
 0003BD28    push        ebx
 0003BD29    mov         ebx,eax
 0003BD2B    mov         eax,ebx
 0003BD2D    call        TWinControl.CreateWnd
 0003BD32    mov         al,byte ptr [ebx+1F0]
 0003BD38    mov         byte ptr [ebx+1F2],al
 0003BD3E    pop         ebx
 0003BD3F    ret
*}
end;

//0003BD40
procedure TButton.CNCommand(var Message:TWMCommand);
begin
{*
 0003BD40    push        ebx
 0003BD41    cmp         word ptr [edx+6],0
>0003BD46    jne         0003BD51
 0003BD48    mov         bx,0FFEC
 0003BD4C    call        @CallDynaInst
 0003BD51    pop         ebx
 0003BD52    ret
*}
end;

//0003BD54
procedure TButton.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 0003BD54    push        ebx
 0003BD55    push        esi
 0003BD56    mov         esi,edx
 0003BD58    mov         ebx,eax
 0003BD5A    cmp         word ptr [esi+4],0D
>0003BD5F    jne         0003BD6A
 0003BD61    cmp         byte ptr [ebx+1F2],0
>0003BD68    jne         0003BD7A
 0003BD6A    cmp         word ptr [esi+4],1B
>0003BD6F    jne         0003BDAC
 0003BD71    cmp         byte ptr [ebx+1F1],0
>0003BD78    je          0003BDAC
 0003BD7A    mov         eax,dword ptr [esi+8]
 0003BD7D    call        KeyDataToShiftState
 0003BD82    mov         dl,byte ptr ds:[3BDB8]
 0003BD88    cmp         dl,al
>0003BD8A    jne         0003BDAC
 0003BD8C    mov         eax,ebx
 0003BD8E    call        TWinControl.CanFocus
 0003BD93    test        al,al
>0003BD95    je          0003BDAC
 0003BD97    mov         eax,ebx
 0003BD99    mov         bx,0FFEC
 0003BD9D    call        @CallDynaInst
 0003BDA2    mov         dword ptr [esi+0C],1
 0003BDA9    pop         esi
 0003BDAA    pop         ebx
 0003BDAB    ret
 0003BDAC    mov         edx,esi
 0003BDAE    mov         eax,ebx
 0003BDB0    call        TWinControl.CMDialogKey
 0003BDB5    pop         esi
 0003BDB6    pop         ebx
 0003BDB7    ret
*}
end;

//0003BDBC
procedure TButton.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 0003BDBC    push        ebp
 0003BDBD    mov         ebp,esp
 0003BDBF    push        0
 0003BDC1    push        ebx
 0003BDC2    push        esi
 0003BDC3    mov         esi,edx
 0003BDC5    mov         ebx,eax
 0003BDC7    xor         eax,eax
 0003BDC9    push        ebp
 0003BDCA    push        3BE2D
 0003BDCF    push        dword ptr fs:[eax]
 0003BDD2    mov         dword ptr fs:[eax],esp
 0003BDD5    lea         edx,[ebp-4]
 0003BDD8    mov         eax,ebx
 0003BDDA    call        TControl.GetText
 0003BDDF    mov         edx,dword ptr [ebp-4]
 0003BDE2    mov         ax,word ptr [esi+4]
 0003BDE6    call        IsAccel
 0003BDEB    test        al,al
>0003BDED    je          0003BE0E
 0003BDEF    mov         eax,ebx
 0003BDF1    call        TWinControl.CanFocus
 0003BDF6    test        al,al
>0003BDF8    je          0003BE0E
 0003BDFA    mov         eax,ebx
 0003BDFC    mov         bx,0FFEC
 0003BE00    call        @CallDynaInst
 0003BE05    mov         dword ptr [esi+0C],1
>0003BE0C    jmp         0003BE17
 0003BE0E    mov         edx,esi
 0003BE10    mov         eax,ebx
 0003BE12    call        TWinControl.CMDialogChar
 0003BE17    xor         eax,eax
 0003BE19    pop         edx
 0003BE1A    pop         ecx
 0003BE1B    pop         ecx
 0003BE1C    mov         dword ptr fs:[eax],edx
 0003BE1F    push        3BE34
 0003BE24    lea         eax,[ebp-4]
 0003BE27    call        @LStrClr
 0003BE2C    ret
>0003BE2D    jmp         @HandleFinally
>0003BE32    jmp         0003BE24
 0003BE34    pop         esi
 0003BE35    pop         ebx
 0003BE36    pop         ecx
 0003BE37    pop         ebp
 0003BE38    ret
*}
end;

//0003BE3C
procedure TButton.CMFocusChanged(var Message:TCMFocusChanged);
begin
{*
 0003BE3C    push        ebx
 0003BE3D    push        esi
 0003BE3E    push        edi
 0003BE3F    mov         esi,edx
 0003BE41    mov         ebx,eax
 0003BE43    mov         edi,dword ptr [esi+8]
 0003BE46    mov         eax,edi
 0003BE48    mov         edx,dword ptr ds:[36984];TButton
 0003BE4E    call        @IsClass
 0003BE53    test        al,al
>0003BE55    je          0003BE64
 0003BE57    cmp         ebx,edi
 0003BE59    sete        al
 0003BE5C    mov         byte ptr [ebx+1F2],al
>0003BE62    jmp         0003BE70
 0003BE64    mov         al,byte ptr [ebx+1F0]
 0003BE6A    mov         byte ptr [ebx+1F2],al
 0003BE70    mov         dl,byte ptr [ebx+1F2]
 0003BE76    mov         eax,ebx
 0003BE78    mov         ecx,dword ptr [eax]
 0003BE7A    call        dword ptr [ecx+0C0]
 0003BE80    mov         edx,esi
 0003BE82    mov         eax,ebx
 0003BE84    call        TWinControl.CMFocusChanged
 0003BE89    pop         edi
 0003BE8A    pop         esi
 0003BE8B    pop         ebx
 0003BE8C    ret
*}
end;

//0003BE90
procedure TButton.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 0003BE90    mov         ecx,dword ptr [eax]
 0003BE92    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 0003BE95    ret
*}
end;

//0003BE98
constructor TCustomCheckBox.Create(AOwner:TComponent);
begin
{*
 0003BE98    push        ebx
 0003BE99    push        esi
 0003BE9A    test        dl,dl
>0003BE9C    je          0003BEA6
 0003BE9E    add         esp,0FFFFFFF0
 0003BEA1    call        @ClassCreate
 0003BEA6    mov         ebx,edx
 0003BEA8    mov         esi,eax
 0003BEAA    xor         edx,edx
 0003BEAC    mov         eax,esi
 0003BEAE    call        TButtonControl.Create
 0003BEB3    mov         edx,61
 0003BEB8    mov         eax,esi
 0003BEBA    call        TControl.SetWidth
 0003BEBF    mov         edx,11
 0003BEC4    mov         eax,esi
 0003BEC6    call        TControl.SetHeight
 0003BECB    mov         dl,1
 0003BECD    mov         eax,esi
 0003BECF    call        TWinControl.SetTabStop
 0003BED4    mov         eax,[0003BF00]
 0003BED9    mov         dword ptr [esi+40],eax
 0003BEDC    mov         byte ptr [esi+1F0],1
 0003BEE3    mov         eax,esi
 0003BEE5    test        bl,bl
>0003BEE7    je          0003BEF8
 0003BEE9    call        @AfterConstruction
 0003BEEE    pop         dword ptr fs:[0]
 0003BEF5    add         esp,0C
 0003BEF8    mov         eax,esi
 0003BEFA    pop         esi
 0003BEFB    pop         ebx
 0003BEFC    ret
*}
end;

//0003BF04
procedure TCustomCheckBox.GetControlsAlignment;
begin
{*
 0003BF04    push        ebx
 0003BF05    push        esi
 0003BF06    mov         esi,eax
 0003BF08    mov         eax,esi
 0003BF0A    mov         bx,0FFCF
 0003BF0E    call        @CallDynaInst
 0003BF13    test        al,al
>0003BF15    jne         0003BF1C
 0003BF17    mov         al,1
 0003BF19    pop         esi
 0003BF1A    pop         ebx
 0003BF1B    ret
 0003BF1C    cmp         byte ptr [esi+1F0],1
>0003BF23    jne         0003BF29
 0003BF25    xor         eax,eax
>0003BF27    jmp         0003BF2B
 0003BF29    mov         al,1
 0003BF2B    pop         esi
 0003BF2C    pop         ebx
 0003BF2D    ret
*}
end;

//0003BF30
procedure TCustomCheckBox.Toggle;
begin
{*
 0003BF30    mov         dl,byte ptr [eax+1F2]
 0003BF36    sub         dl,1
>0003BF39    jb          0003BF43
>0003BF3B    je          0003BF5D
 0003BF3D    dec         dl
>0003BF3F    je          0003BF65
>0003BF41    jmp         0003BF6C
 0003BF43    cmp         byte ptr [eax+1F1],0
>0003BF4A    je          0003BF55
 0003BF4C    mov         dl,2
 0003BF4E    call        TCustomCheckBox.SetState
>0003BF53    jmp         0003BF6C
 0003BF55    mov         dl,1
 0003BF57    call        TCustomCheckBox.SetState
 0003BF5C    ret
 0003BF5D    xor         edx,edx
 0003BF5F    call        TCustomCheckBox.SetState
 0003BF64    ret
 0003BF65    mov         dl,1
 0003BF67    call        TCustomCheckBox.SetState
 0003BF6C    ret
*}
end;

//0003BF70
procedure TCustomCheckBox.Click;
begin
{*
 0003BF70    push        ebx
 0003BF71    mov         ebx,eax
 0003BF73    mov         eax,ebx
 0003BF75    call        TControl.Changed
 0003BF7A    mov         eax,ebx
 0003BF7C    call        TControl.Click
 0003BF81    pop         ebx
 0003BF82    ret
*}
end;

//0003BF84
function TCustomCheckBox.GetChecked:Boolean;
begin
{*
 0003BF84    cmp         byte ptr [eax+1F2],1
 0003BF8B    sete        al
 0003BF8E    ret
*}
end;

//0003BF90
procedure TCustomCheckBox.SetAlignment(Value:TLeftRight);
begin
{*
 0003BF90    cmp         dl,byte ptr [eax+1F0]
>0003BF96    je          0003BFA3
 0003BF98    mov         byte ptr [eax+1F0],dl
 0003BF9E    call        TWinControl.RecreateWnd
 0003BFA3    ret
*}
end;

//0003BFA4
procedure TCustomCheckBox.SetChecked(Value:Boolean);
begin
{*
 0003BFA4    test        dl,dl
>0003BFA6    je          0003BFB0
 0003BFA8    mov         dl,1
 0003BFAA    call        TCustomCheckBox.SetState
 0003BFAF    ret
 0003BFB0    xor         edx,edx
 0003BFB2    call        TCustomCheckBox.SetState
 0003BFB7    ret
*}
end;

//0003BFB8
procedure TCustomCheckBox.SetState(Value:TCheckBoxState);
begin
{*
 0003BFB8    push        ebx
 0003BFB9    mov         ebx,eax
 0003BFBB    cmp         dl,byte ptr [ebx+1F2]
>0003BFC1    je          0003C005
 0003BFC3    mov         byte ptr [ebx+1F2],dl
 0003BFC9    mov         eax,ebx
 0003BFCB    call        TWinControl.HandleAllocated
 0003BFD0    test        al,al
>0003BFD2    je          0003BFF1
 0003BFD4    push        0
 0003BFD6    xor         eax,eax
 0003BFD8    mov         al,byte ptr [ebx+1F2]
 0003BFDE    push        eax
 0003BFDF    push        0F1
 0003BFE4    mov         eax,ebx
 0003BFE6    call        TWinControl.GetHandle
 0003BFEB    push        eax
 0003BFEC    call        user32.SendMessageA
 0003BFF1    cmp         byte ptr [ebx+1EC],0
>0003BFF8    jne         0003C005
 0003BFFA    mov         eax,ebx
 0003BFFC    mov         bx,0FFEC
 0003C000    call        @CallDynaInst
 0003C005    pop         ebx
 0003C006    ret
*}
end;

//0003C008
procedure TCustomCheckBox.CreateParams(var Params:TCreateParams);
begin
{*
 0003C008    push        ebx
 0003C009    push        esi
 0003C00A    push        edi
 0003C00B    mov         edi,edx
 0003C00D    mov         esi,eax
 0003C00F    mov         edx,edi
 0003C011    mov         eax,esi
 0003C013    call        TWinControl.CreateParams
 0003C018    mov         ecx,3C05C
 0003C01D    mov         edx,edi
 0003C01F    mov         eax,esi
 0003C021    call        TWinControl.CreateSubClass
 0003C026    mov         eax,esi
 0003C028    mov         bx,0FFCF
 0003C02C    call        @CallDynaInst
 0003C031    and         eax,7F
 0003C034    lea         eax,[eax*8+0B4720]
 0003C03B    xor         edx,edx
 0003C03D    mov         dl,byte ptr [esi+1F0]
 0003C043    mov         eax,dword ptr [eax+edx*4]
 0003C046    mov         edx,dword ptr [edi+4]
 0003C049    or          edx,5
 0003C04C    or          eax,edx
 0003C04E    mov         dword ptr [edi+4],eax
 0003C051    and         dword ptr [edi+24],0FFFFFFFC
 0003C055    pop         edi
 0003C056    pop         esi
 0003C057    pop         ebx
 0003C058    ret
*}
end;

//0003C064
procedure TCustomCheckBox.CreateWnd;
begin
{*
 0003C064    push        ebx
 0003C065    mov         ebx,eax
 0003C067    mov         eax,ebx
 0003C069    call        TWinControl.CreateWnd
 0003C06E    push        0
 0003C070    xor         eax,eax
 0003C072    mov         al,byte ptr [ebx+1F2]
 0003C078    push        eax
 0003C079    push        0F1
 0003C07E    mov         eax,ebx
 0003C080    call        TWinControl.GetHandle
 0003C085    push        eax
 0003C086    call        user32.SendMessageA
 0003C08B    pop         ebx
 0003C08C    ret
*}
end;

//0003C090
procedure TCustomCheckBox.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 0003C090    push        ebx
 0003C091    push        esi
 0003C092    push        edi
 0003C093    mov         esi,edx
 0003C095    mov         ebx,eax
 0003C097    cmp         byte ptr [ebx+12C],0
>0003C09E    je          0003C13A
 0003C0A4    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003C0A9    cmp         byte ptr [eax],0
>0003C0AC    jne         0003C13A
 0003C0B2    mov         eax,dword ptr [esi+20]
 0003C0B5    push        eax
 0003C0B6    mov         eax,[000B5950];^HInstance:Longword
 0003C0BB    mov         eax,dword ptr [eax]
 0003C0BD    push        eax
 0003C0BE    push        0
 0003C0C0    mov         eax,dword ptr [esi+1C]
 0003C0C3    push        eax
 0003C0C4    mov         eax,dword ptr [esi+18]
 0003C0C7    push        eax
 0003C0C8    mov         eax,dword ptr [esi+14]
 0003C0CB    push        eax
 0003C0CC    mov         eax,dword ptr [esi+10]
 0003C0CF    push        eax
 0003C0D0    mov         eax,dword ptr [esi+0C]
 0003C0D3    push        eax
 0003C0D4    mov         eax,dword ptr [esi+4]
 0003C0D7    push        eax
 0003C0D8    mov         eax,dword ptr [esi]
 0003C0DA    push        eax
 0003C0DB    push        3C148
 0003C0E0    mov         eax,dword ptr [esi+8]
 0003C0E3    push        eax
 0003C0E4    call        user32.CreateWindowExA
 0003C0E9    mov         edi,eax
 0003C0EB    mov         dword ptr [ebx+140],edi
 0003C0F1    mov         eax,edi
 0003C0F3    call        Subclass3DWnd
 0003C0F8    push        0FC
 0003C0FA    mov         eax,dword ptr [ebx+140]
 0003C100    push        eax
 0003C101    call        user32.GetWindowLongA
 0003C106    mov         dword ptr [ebx+130],eax
 0003C10C    mov         eax,[000B5954]
 0003C111    mov         dword ptr [eax],ebx
 0003C113    push        3FD90;InitWndProc:Longint
 0003C118    push        0FC
 0003C11A    mov         eax,dword ptr [ebx+140]
 0003C120    push        eax
 0003C121    call        user32.SetWindowLongA
 0003C126    push        0
 0003C128    push        0
 0003C12A    push        0
 0003C12C    mov         eax,dword ptr [ebx+140]
 0003C132    push        eax
 0003C133    call        user32.SendMessageA
>0003C138    jmp         0003C143
 0003C13A    mov         edx,esi
 0003C13C    mov         eax,ebx
 0003C13E    call        TWinControl.CreateWindowHandle
 0003C143    pop         edi
 0003C144    pop         esi
 0003C145    pop         ebx
 0003C146    ret
*}
end;

//0003C150
procedure TCustomGroupBox.WMSize(var Message:TMessage);
begin
{*
 0003C150    push        esi
 0003C151    mov         esi,eax
 0003C153    mov         eax,esi
 0003C155    call        TWinControl.WMSize
 0003C15A    mov         eax,esi
 0003C15C    mov         edx,dword ptr [eax]
 0003C15E    call        dword ptr [edx+78]
 0003C161    pop         esi
 0003C162    ret
*}
end;

//0003C164
procedure TCustomCheckBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0003C164    call        TWinControl.RecreateWnd
 0003C169    ret
*}
end;

//0003C16C
procedure TCustomCheckBox.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 0003C16C    push        ebp
 0003C16D    mov         ebp,esp
 0003C16F    push        0
 0003C171    push        ebx
 0003C172    push        esi
 0003C173    push        edi
 0003C174    mov         edi,edx
 0003C176    mov         esi,eax
 0003C178    xor         eax,eax
 0003C17A    push        ebp
 0003C17B    push        3C1F6
 0003C180    push        dword ptr fs:[eax]
 0003C183    mov         dword ptr fs:[eax],esp
 0003C186    lea         edx,[ebp-4]
 0003C189    mov         eax,esi
 0003C18B    call        TControl.GetText
 0003C190    mov         edx,dword ptr [ebp-4]
 0003C193    mov         ax,word ptr [edi+4]
 0003C197    call        IsAccel
 0003C19C    test        al,al
>0003C19E    je          0003C1D7
 0003C1A0    mov         eax,esi
 0003C1A2    call        TWinControl.CanFocus
 0003C1A7    test        al,al
>0003C1A9    je          0003C1D7
 0003C1AB    mov         eax,esi
 0003C1AD    mov         edx,dword ptr [eax]
 0003C1AF    call        dword ptr [edx+0B4]
 0003C1B5    mov         eax,esi
 0003C1B7    mov         bx,0FFBB
 0003C1BB    call        @CallDynaInst
 0003C1C0    test        al,al
>0003C1C2    je          0003C1CE
 0003C1C4    mov         eax,esi
 0003C1C6    mov         edx,dword ptr [eax]
 0003C1C8    call        dword ptr [edx+0C0]
 0003C1CE    mov         dword ptr [edi+0C],1
>0003C1D5    jmp         0003C1E0
 0003C1D7    mov         edx,edi
 0003C1D9    mov         eax,esi
 0003C1DB    call        TWinControl.CMDialogChar
 0003C1E0    xor         eax,eax
 0003C1E2    pop         edx
 0003C1E3    pop         ecx
 0003C1E4    pop         ecx
 0003C1E5    mov         dword ptr fs:[eax],edx
 0003C1E8    push        3C1FD
 0003C1ED    lea         eax,[ebp-4]
 0003C1F0    call        @LStrClr
 0003C1F5    ret
>0003C1F6    jmp         @HandleFinally
>0003C1FB    jmp         0003C1ED
 0003C1FD    pop         edi
 0003C1FE    pop         esi
 0003C1FF    pop         ebx
 0003C200    pop         ecx
 0003C201    pop         ebp
 0003C202    ret
*}
end;

//0003C204
procedure TCustomCheckBox.CNCommand(var Message:TWMCommand);
begin
{*
 0003C204    cmp         word ptr [edx+6],0
>0003C209    jne         0003C213
 0003C20B    mov         edx,dword ptr [eax]
 0003C20D    call        dword ptr [edx+0C0]
 0003C213    ret
*}
end;

//0003C214
procedure TCustomCheckBox.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 0003C214    push        ebx
 0003C215    push        esi
 0003C216    mov         esi,edx
 0003C218    mov         ebx,eax
 0003C21A    cmp         byte ptr [ebx+12C],0
>0003C221    je          0003C23A
 0003C223    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003C228    cmp         byte ptr [eax],0
>0003C22B    jne         0003C23A
 0003C22D    mov         eax,ebx
 0003C22F    call        TWinControl.GetHandle
 0003C234    push        eax
 0003C235    call        user32.UpdateWindow
 0003C23A    mov         edx,esi
 0003C23C    mov         eax,ebx
 0003C23E    call        TWinControl.WMSetFocus
 0003C243    pop         esi
 0003C244    pop         ebx
 0003C245    ret
*}
end;

//0003C248
constructor TRadioButton.Create(AOwner:TComponent);
begin
{*
 0003C248    push        ebx
 0003C249    push        esi
 0003C24A    test        dl,dl
>0003C24C    je          0003C256
 0003C24E    add         esp,0FFFFFFF0
 0003C251    call        @ClassCreate
 0003C256    mov         ebx,edx
 0003C258    mov         esi,eax
 0003C25A    xor         edx,edx
 0003C25C    mov         eax,esi
 0003C25E    call        TButtonControl.Create
 0003C263    mov         edx,71
 0003C268    mov         eax,esi
 0003C26A    call        TControl.SetWidth
 0003C26F    mov         edx,11
 0003C274    mov         eax,esi
 0003C276    call        TControl.SetHeight
 0003C27B    mov         eax,[0003C2A4]
 0003C280    mov         dword ptr [esi+40],eax
 0003C283    mov         byte ptr [esi+1F0],1
 0003C28A    mov         eax,esi
 0003C28C    test        bl,bl
>0003C28E    je          0003C29F
 0003C290    call        @AfterConstruction
 0003C295    pop         dword ptr fs:[0]
 0003C29C    add         esp,0C
 0003C29F    mov         eax,esi
 0003C2A1    pop         esi
 0003C2A2    pop         ebx
 0003C2A3    ret
*}
end;

//0003C2A8
function TRadioButton.GetChecked:Boolean;
begin
{*
 0003C2A8    mov         al,byte ptr [eax+1F1];TRadioButton.FChecked:Boolean
 0003C2AE    ret
*}
end;

//0003C2B0
procedure TRadioButton.GetControlsAlignment;
begin
{*
 0003C2B0    push        ebx
 0003C2B1    push        esi
 0003C2B2    mov         esi,eax
 0003C2B4    mov         eax,esi
 0003C2B6    mov         bx,0FFCF
 0003C2BA    call        @CallDynaInst
 0003C2BF    test        al,al
>0003C2C1    jne         0003C2C8
 0003C2C3    mov         al,1
 0003C2C5    pop         esi
 0003C2C6    pop         ebx
 0003C2C7    ret
 0003C2C8    cmp         byte ptr [esi+1F0],1
>0003C2CF    jne         0003C2D5
 0003C2D1    xor         eax,eax
>0003C2D3    jmp         0003C2D7
 0003C2D5    mov         al,1
 0003C2D7    pop         esi
 0003C2D8    pop         ebx
 0003C2D9    ret
*}
end;

//0003C2DC
procedure TCustomListBox.SetBorderStyle(Value:TBorderStyle);
begin
{*
 0003C2DC    cmp         dl,byte ptr [eax+1F0]
>0003C2E2    je          0003C2EF
 0003C2E4    mov         byte ptr [eax+1F0],dl
 0003C2EA    call        TWinControl.RecreateWnd
 0003C2EF    ret
*}
end;

//0003C2F0
procedure TurnSiblingsOff;
begin
{*
 0003C2F0    push        ebp
 0003C2F1    mov         ebp,esp
 0003C2F3    push        ecx
 0003C2F4    push        ebx
 0003C2F5    push        esi
 0003C2F6    push        edi
 0003C2F7    mov         eax,dword ptr [ebp+8]
 0003C2FA    mov         eax,dword ptr [eax-4]
 0003C2FD    mov         eax,dword ptr [eax+24]
 0003C300    test        eax,eax
>0003C302    je          0003C351
 0003C304    mov         edx,dword ptr [ebp+8]
 0003C307    mov         dword ptr [ebp-4],eax
 0003C30A    mov         eax,dword ptr [ebp-4]
 0003C30D    call        TWinControl.GetControlCount
 0003C312    mov         esi,eax
 0003C314    dec         esi
 0003C315    test        esi,esi
>0003C317    jl          0003C351
 0003C319    inc         esi
 0003C31A    xor         edi,edi
 0003C31C    mov         edx,edi
 0003C31E    mov         eax,dword ptr [ebp-4]
 0003C321    call        TWinControl.GetControl
 0003C326    mov         ebx,eax
 0003C328    mov         eax,dword ptr [ebp+8]
 0003C32B    cmp         ebx,dword ptr [eax-4]
>0003C32E    je          0003C34D
 0003C330    mov         eax,ebx
 0003C332    mov         edx,dword ptr ds:[378C0];TRadioButton
 0003C338    call        @IsClass
 0003C33D    test        al,al
>0003C33F    je          0003C34D
 0003C341    xor         edx,edx
 0003C343    mov         eax,ebx
 0003C345    mov         ecx,dword ptr [eax]
 0003C347    call        dword ptr [ecx+0BC]
 0003C34D    inc         edi
 0003C34E    dec         esi
>0003C34F    jne         0003C31C
 0003C351    pop         edi
 0003C352    pop         esi
 0003C353    pop         ebx
 0003C354    pop         ecx
 0003C355    pop         ebp
 0003C356    ret
*}
end;

//0003C358
procedure TRadioButton.SetChecked(Value:Boolean);
begin
{*
 0003C358    push        ebp
 0003C359    mov         ebp,esp
 0003C35B    push        ecx
 0003C35C    push        ebx
 0003C35D    mov         ebx,edx
 0003C35F    mov         dword ptr [ebp-4],eax
 0003C362    mov         eax,dword ptr [ebp-4]
 0003C365    cmp         bl,byte ptr [eax+1F1]
>0003C36B    je          0003C3DB
 0003C36D    mov         eax,dword ptr [ebp-4]
 0003C370    mov         byte ptr [eax+1F1],bl
 0003C376    mov         edx,ebx
 0003C378    mov         eax,dword ptr [ebp-4]
 0003C37B    call        TWinControl.SetTabStop
 0003C380    mov         eax,dword ptr [ebp-4]
 0003C383    call        TWinControl.HandleAllocated
 0003C388    test        al,al
>0003C38A    je          0003C3B0
 0003C38C    push        0
 0003C38E    mov         eax,dword ptr [ebp-4]
 0003C391    mov         edx,dword ptr [eax]
 0003C393    call        dword ptr [edx+0B8]
 0003C399    and         eax,7F
 0003C39C    push        eax
 0003C39D    push        0F1
 0003C3A2    mov         eax,dword ptr [ebp-4]
 0003C3A5    call        TWinControl.GetHandle
 0003C3AA    push        eax
 0003C3AB    call        user32.SendMessageA
 0003C3B0    test        bl,bl
>0003C3B2    je          0003C3DB
 0003C3B4    push        ebp
 0003C3B5    call        TurnSiblingsOff
 0003C3BA    pop         ecx
 0003C3BB    mov         eax,dword ptr [ebp-4]
 0003C3BE    call        TControl.Changed
 0003C3C3    mov         eax,dword ptr [ebp-4]
 0003C3C6    cmp         byte ptr [eax+1EC],0
>0003C3CD    jne         0003C3DB
 0003C3CF    mov         eax,dword ptr [ebp-4]
 0003C3D2    mov         bx,0FFEC
 0003C3D6    call        @CallDynaInst
 0003C3DB    pop         ebx
 0003C3DC    pop         ecx
 0003C3DD    pop         ebp
 0003C3DE    ret
*}
end;

//0003C3E0
procedure TRadioButton.CreateParams(var Params:TCreateParams);
begin
{*
 0003C3E0    push        ebx
 0003C3E1    push        esi
 0003C3E2    push        edi
 0003C3E3    mov         edi,edx
 0003C3E5    mov         esi,eax
 0003C3E7    mov         edx,edi
 0003C3E9    mov         eax,esi
 0003C3EB    call        TWinControl.CreateParams
 0003C3F0    mov         ecx,3C430
 0003C3F5    mov         edx,edi
 0003C3F7    mov         eax,esi
 0003C3F9    call        TWinControl.CreateSubClass
 0003C3FE    mov         eax,esi
 0003C400    mov         bx,0FFCF
 0003C404    call        @CallDynaInst
 0003C409    and         eax,7F
 0003C40C    lea         eax,[eax*8+0B4730]
 0003C413    xor         edx,edx
 0003C415    mov         dl,byte ptr [esi+1F0]
 0003C41B    mov         eax,dword ptr [eax+edx*4]
 0003C41E    mov         edx,dword ptr [edi+4]
 0003C421    or          edx,4
 0003C424    or          eax,edx
 0003C426    mov         dword ptr [edi+4],eax
 0003C429    pop         edi
 0003C42A    pop         esi
 0003C42B    pop         ebx
 0003C42C    ret
*}
end;

//0003C438
procedure TRadioButton.CreateWnd;
begin
{*
 0003C438    push        ebx
 0003C439    mov         ebx,eax
 0003C43B    mov         eax,ebx
 0003C43D    call        TWinControl.CreateWnd
 0003C442    push        0
 0003C444    xor         eax,eax
 0003C446    mov         al,byte ptr [ebx+1F1]
 0003C44C    push        eax
 0003C44D    push        0F1
 0003C452    mov         eax,ebx
 0003C454    call        TWinControl.GetHandle
 0003C459    push        eax
 0003C45A    call        user32.SendMessageA
 0003C45F    pop         ebx
 0003C460    ret
*}
end;

//0003C464
procedure TRadioButton.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 0003C464    push        ebx
 0003C465    push        esi
 0003C466    push        edi
 0003C467    mov         esi,edx
 0003C469    mov         ebx,eax
 0003C46B    cmp         byte ptr [ebx+12C],0
>0003C472    je          0003C50E
 0003C478    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003C47D    cmp         byte ptr [eax],0
>0003C480    jne         0003C50E
 0003C486    mov         eax,dword ptr [esi+20]
 0003C489    push        eax
 0003C48A    mov         eax,[000B5950];^HInstance:Longword
 0003C48F    mov         eax,dword ptr [eax]
 0003C491    push        eax
 0003C492    push        0
 0003C494    mov         eax,dword ptr [esi+1C]
 0003C497    push        eax
 0003C498    mov         eax,dword ptr [esi+18]
 0003C49B    push        eax
 0003C49C    mov         eax,dword ptr [esi+14]
 0003C49F    push        eax
 0003C4A0    mov         eax,dword ptr [esi+10]
 0003C4A3    push        eax
 0003C4A4    mov         eax,dword ptr [esi+0C]
 0003C4A7    push        eax
 0003C4A8    mov         eax,dword ptr [esi+4]
 0003C4AB    push        eax
 0003C4AC    mov         eax,dword ptr [esi]
 0003C4AE    push        eax
 0003C4AF    push        3C51C
 0003C4B4    mov         eax,dword ptr [esi+8]
 0003C4B7    push        eax
 0003C4B8    call        user32.CreateWindowExA
 0003C4BD    mov         edi,eax
 0003C4BF    mov         dword ptr [ebx+140],edi
 0003C4C5    mov         eax,edi
 0003C4C7    call        Subclass3DWnd
 0003C4CC    push        0FC
 0003C4CE    mov         eax,dword ptr [ebx+140]
 0003C4D4    push        eax
 0003C4D5    call        user32.GetWindowLongA
 0003C4DA    mov         dword ptr [ebx+130],eax
 0003C4E0    mov         eax,[000B5954]
 0003C4E5    mov         dword ptr [eax],ebx
 0003C4E7    push        3FD90;InitWndProc:Longint
 0003C4EC    push        0FC
 0003C4EE    mov         eax,dword ptr [ebx+140]
 0003C4F4    push        eax
 0003C4F5    call        user32.SetWindowLongA
 0003C4FA    push        0
 0003C4FC    push        0
 0003C4FE    push        0
 0003C500    mov         eax,dword ptr [ebx+140]
 0003C506    push        eax
 0003C507    call        user32.SendMessageA
>0003C50C    jmp         0003C517
 0003C50E    mov         edx,esi
 0003C510    mov         eax,ebx
 0003C512    call        TWinControl.CreateWindowHandle
 0003C517    pop         edi
 0003C518    pop         esi
 0003C519    pop         ebx
 0003C51A    ret
*}
end;

//0003C524
procedure TRadioButton.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0003C524    call        TWinControl.RecreateWnd
 0003C529    ret
*}
end;

//0003C52C
procedure TRadioButton.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 0003C52C    push        ebp
 0003C52D    mov         ebp,esp
 0003C52F    push        0
 0003C531    push        ebx
 0003C532    push        esi
 0003C533    mov         esi,edx
 0003C535    mov         ebx,eax
 0003C537    xor         eax,eax
 0003C539    push        ebp
 0003C53A    push        3C59C
 0003C53F    push        dword ptr fs:[eax]
 0003C542    mov         dword ptr fs:[eax],esp
 0003C545    lea         edx,[ebp-4]
 0003C548    mov         eax,ebx
 0003C54A    call        TControl.GetText
 0003C54F    mov         edx,dword ptr [ebp-4]
 0003C552    mov         ax,word ptr [esi+4]
 0003C556    call        IsAccel
 0003C55B    test        al,al
>0003C55D    je          0003C57D
 0003C55F    mov         eax,ebx
 0003C561    call        TWinControl.CanFocus
 0003C566    test        al,al
>0003C568    je          0003C57D
 0003C56A    mov         eax,ebx
 0003C56C    mov         edx,dword ptr [eax]
 0003C56E    call        dword ptr [edx+0B4]
 0003C574    mov         dword ptr [esi+0C],1
>0003C57B    jmp         0003C586
 0003C57D    mov         edx,esi
 0003C57F    mov         eax,ebx
 0003C581    call        TWinControl.CMDialogChar
 0003C586    xor         eax,eax
 0003C588    pop         edx
 0003C589    pop         ecx
 0003C58A    pop         ecx
 0003C58B    mov         dword ptr fs:[eax],edx
 0003C58E    push        3C5A3
 0003C593    lea         eax,[ebp-4]
 0003C596    call        @LStrClr
 0003C59B    ret
>0003C59C    jmp         @HandleFinally
>0003C5A1    jmp         0003C593
 0003C5A3    pop         esi
 0003C5A4    pop         ebx
 0003C5A5    pop         ecx
 0003C5A6    pop         ebp
 0003C5A7    ret
*}
end;

//0003C5A8
procedure TRadioButton.CNCommand(var Message:TWMCommand);
begin
{*
 0003C5A8    push        ebx
 0003C5A9    push        esi
 0003C5AA    mov         esi,eax
 0003C5AC    mov         ax,word ptr [edx+6]
 0003C5B0    sub         ax,1
>0003C5B4    jb          0003C5BE
 0003C5B6    sub         ax,4
>0003C5BA    je          0003C5CD
>0003C5BC    jmp         0003C5D8
 0003C5BE    mov         dl,1
 0003C5C0    mov         eax,esi
 0003C5C2    mov         ecx,dword ptr [eax]
 0003C5C4    call        dword ptr [ecx+0BC]
 0003C5CA    pop         esi
 0003C5CB    pop         ebx
 0003C5CC    ret
 0003C5CD    mov         eax,esi
 0003C5CF    mov         bx,0FFEB
 0003C5D3    call        @CallDynaInst
 0003C5D8    pop         esi
 0003C5D9    pop         ebx
 0003C5DA    ret
*}
end;

//0003C5DC
procedure TRadioButton.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 0003C5DC    push        ebx
 0003C5DD    push        esi
 0003C5DE    mov         esi,edx
 0003C5E0    mov         ebx,eax
 0003C5E2    cmp         byte ptr [ebx+12C],0
>0003C5E9    je          0003C602
 0003C5EB    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003C5F0    cmp         byte ptr [eax],0
>0003C5F3    jne         0003C602
 0003C5F5    mov         eax,ebx
 0003C5F7    call        TWinControl.GetHandle
 0003C5FC    push        eax
 0003C5FD    call        user32.UpdateWindow
 0003C602    mov         edx,esi
 0003C604    mov         eax,ebx
 0003C606    call        TWinControl.WMSetFocus
 0003C60B    pop         esi
 0003C60C    pop         ebx
 0003C60D    ret
*}
end;

//0003C610
function TListBoxStrings.GetCount:Integer;
begin
{*
 0003C610    push        ebx
 0003C611    mov         ebx,eax
 0003C613    push        0
 0003C615    push        0
 0003C617    push        18B
 0003C61C    mov         eax,dword ptr [ebx+0C]
 0003C61F    call        TWinControl.GetHandle
 0003C624    push        eax
 0003C625    call        user32.SendMessageA
 0003C62A    pop         ebx
 0003C62B    ret
*}
end;

//0003C62C
function TListBoxStrings.Get(Index:Integer):AnsiString;
begin
{*
 0003C62C    push        ebp
 0003C62D    mov         ebp,esp
 0003C62F    add         esp,0FFFFF004
 0003C635    push        eax
 0003C636    add         esp,0FFFFFFF8
 0003C639    push        ebx
 0003C63A    push        esi
 0003C63B    push        edi
 0003C63C    xor         ebx,ebx
 0003C63E    mov         dword ptr [ebp-1008],ebx
 0003C644    mov         dword ptr [ebp-4],ecx
 0003C647    mov         edi,edx
 0003C649    mov         esi,eax
 0003C64B    xor         eax,eax
 0003C64D    push        ebp
 0003C64E    push        3C6C2
 0003C653    push        dword ptr fs:[eax]
 0003C656    mov         dword ptr fs:[eax],esp
 0003C659    lea         eax,[ebp-1004]
 0003C65F    push        eax
 0003C660    push        edi
 0003C661    push        189
 0003C666    mov         eax,dword ptr [esi+0C]
 0003C669    call        TWinControl.GetHandle
 0003C66E    push        eax
 0003C66F    call        user32.SendMessageA
 0003C674    mov         ebx,eax
 0003C676    test        ebx,ebx
>0003C678    jge         0003C699
 0003C67A    lea         edx,[ebp-1008]
 0003C680    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 0003C685    call        LoadResString
 0003C68A    mov         edx,dword ptr [ebp-1008]
 0003C690    mov         ecx,edi
 0003C692    mov         eax,esi
 0003C694    call        TStrings.Error
 0003C699    lea         edx,[ebp-1004]
 0003C69F    mov         eax,dword ptr [ebp-4]
 0003C6A2    mov         ecx,ebx
 0003C6A4    call        @LStrFromPCharLen
 0003C6A9    xor         eax,eax
 0003C6AB    pop         edx
 0003C6AC    pop         ecx
 0003C6AD    pop         ecx
 0003C6AE    mov         dword ptr fs:[eax],edx
 0003C6B1    push        3C6C9
 0003C6B6    lea         eax,[ebp-1008]
 0003C6BC    call        @LStrClr
 0003C6C1    ret
>0003C6C2    jmp         @HandleFinally
>0003C6C7    jmp         0003C6B6
 0003C6C9    pop         edi
 0003C6CA    pop         esi
 0003C6CB    pop         ebx
 0003C6CC    mov         esp,ebp
 0003C6CE    pop         ebp
 0003C6CF    ret
*}
end;

//0003C6D0
function TListBoxStrings.GetObject(Index:Integer):TObject;
begin
{*
 0003C6D0    push        ebp
 0003C6D1    mov         ebp,esp
 0003C6D3    push        0
 0003C6D5    push        ebx
 0003C6D6    push        esi
 0003C6D7    push        edi
 0003C6D8    mov         edi,edx
 0003C6DA    mov         esi,eax
 0003C6DC    xor         eax,eax
 0003C6DE    push        ebp
 0003C6DF    push        3C72E
 0003C6E4    push        dword ptr fs:[eax]
 0003C6E7    mov         dword ptr fs:[eax],esp
 0003C6EA    mov         edx,edi
 0003C6EC    mov         eax,dword ptr [esi+0C]
 0003C6EF    mov         bx,0FFB8
 0003C6F3    call        @CallDynaInst
 0003C6F8    mov         ebx,eax
 0003C6FA    cmp         ebx,0FFFFFFFF
>0003C6FD    jne         0003C718
 0003C6FF    lea         edx,[ebp-4]
 0003C702    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 0003C707    call        LoadResString
 0003C70C    mov         edx,dword ptr [ebp-4]
 0003C70F    mov         ecx,edi
 0003C711    mov         eax,esi
 0003C713    call        TStrings.Error
 0003C718    xor         eax,eax
 0003C71A    pop         edx
 0003C71B    pop         ecx
 0003C71C    pop         ecx
 0003C71D    mov         dword ptr fs:[eax],edx
 0003C720    push        3C735
 0003C725    lea         eax,[ebp-4]
 0003C728    call        @LStrClr
 0003C72D    ret
>0003C72E    jmp         @HandleFinally
>0003C733    jmp         0003C725
 0003C735    mov         eax,ebx
 0003C737    pop         edi
 0003C738    pop         esi
 0003C739    pop         ebx
 0003C73A    pop         ecx
 0003C73B    pop         ebp
 0003C73C    ret
*}
end;

//0003C740
procedure TListBoxStrings.Put(Index:Integer; const S:AnsiString);
begin
{*
 0003C740    push        ebx
 0003C741    push        esi
 0003C742    push        edi
 0003C743    push        ebp
 0003C744    mov         ebp,ecx
 0003C746    mov         edi,edx
 0003C748    mov         ebx,eax
 0003C74A    mov         eax,dword ptr [ebx+0C]
 0003C74D    call        TCustomListBox.GetItemIndex
 0003C752    mov         esi,eax
 0003C754    mov         ecx,ebp
 0003C756    mov         edx,edi
 0003C758    mov         eax,ebx
 0003C75A    call        TStrings.Put
 0003C75F    mov         edx,esi
 0003C761    mov         eax,dword ptr [ebx+0C]
 0003C764    call        TCustomListBox.SetItemIndex
 0003C769    pop         ebp
 0003C76A    pop         edi
 0003C76B    pop         esi
 0003C76C    pop         ebx
 0003C76D    ret
*}
end;

//0003C770
procedure TListBoxStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 0003C770    push        ebx
 0003C771    push        esi
 0003C772    push        edi
 0003C773    mov         edi,edx
 0003C775    mov         esi,eax
 0003C777    mov         edx,edi
 0003C779    mov         eax,dword ptr [esi+0C]
 0003C77C    mov         bx,0FFB7
 0003C780    call        @CallDynaInst
 0003C785    pop         edi
 0003C786    pop         esi
 0003C787    pop         ebx
 0003C788    ret
*}
end;

//0003C78C
function TListBoxStrings.Add(const S:AnsiString):Integer;
begin
{*
 0003C78C    push        ebp
 0003C78D    mov         ebp,esp
 0003C78F    push        0
 0003C791    push        ebx
 0003C792    push        esi
 0003C793    mov         esi,edx
 0003C795    mov         ebx,eax
 0003C797    xor         eax,eax
 0003C799    push        ebp
 0003C79A    push        3C7FF
 0003C79F    push        dword ptr fs:[eax]
 0003C7A2    mov         dword ptr fs:[eax],esp
 0003C7A5    mov         eax,esi
 0003C7A7    call        @LStrToPChar
 0003C7AC    push        eax
 0003C7AD    push        0
 0003C7AF    push        180
 0003C7B4    mov         eax,dword ptr [ebx+0C]
 0003C7B7    call        TWinControl.GetHandle
 0003C7BC    push        eax
 0003C7BD    call        user32.SendMessageA
 0003C7C2    mov         ebx,eax
 0003C7C4    test        ebx,ebx
>0003C7C6    jge         0003C7E9
 0003C7C8    lea         edx,[ebp-4]
 0003C7CB    mov         eax,[000B579C];^SInsertLineError:TResStringRec
 0003C7D0    call        LoadResString
 0003C7D5    mov         ecx,dword ptr [ebp-4]
 0003C7D8    mov         dl,1
 0003C7DA    mov         eax,[0001EE08];EOutOfResources
 0003C7DF    call        Exception.Create
 0003C7E4    call        @RaiseExcept
 0003C7E9    xor         eax,eax
 0003C7EB    pop         edx
 0003C7EC    pop         ecx
 0003C7ED    pop         ecx
 0003C7EE    mov         dword ptr fs:[eax],edx
 0003C7F1    push        3C806
 0003C7F6    lea         eax,[ebp-4]
 0003C7F9    call        @LStrClr
 0003C7FE    ret
>0003C7FF    jmp         @HandleFinally
>0003C804    jmp         0003C7F6
 0003C806    mov         eax,ebx
 0003C808    pop         esi
 0003C809    pop         ebx
 0003C80A    pop         ecx
 0003C80B    pop         ebp
 0003C80C    ret
*}
end;

//0003C810
procedure TListBoxStrings.Insert(Index:Integer; const S:AnsiString);
begin
{*
 0003C810    push        ebp
 0003C811    mov         ebp,esp
 0003C813    push        0
 0003C815    push        ebx
 0003C816    push        esi
 0003C817    push        edi
 0003C818    mov         edi,ecx
 0003C81A    mov         esi,edx
 0003C81C    mov         ebx,eax
 0003C81E    xor         eax,eax
 0003C820    push        ebp
 0003C821    push        3C883
 0003C826    push        dword ptr fs:[eax]
 0003C829    mov         dword ptr fs:[eax],esp
 0003C82C    mov         eax,edi
 0003C82E    call        @LStrToPChar
 0003C833    push        eax
 0003C834    push        esi
 0003C835    push        181
 0003C83A    mov         eax,dword ptr [ebx+0C]
 0003C83D    call        TWinControl.GetHandle
 0003C842    push        eax
 0003C843    call        user32.SendMessageA
 0003C848    test        eax,eax
>0003C84A    jge         0003C86D
 0003C84C    lea         edx,[ebp-4]
 0003C84F    mov         eax,[000B579C];^SInsertLineError:TResStringRec
 0003C854    call        LoadResString
 0003C859    mov         ecx,dword ptr [ebp-4]
 0003C85C    mov         dl,1
 0003C85E    mov         eax,[0001EE08];EOutOfResources
 0003C863    call        Exception.Create
 0003C868    call        @RaiseExcept
 0003C86D    xor         eax,eax
 0003C86F    pop         edx
 0003C870    pop         ecx
 0003C871    pop         ecx
 0003C872    mov         dword ptr fs:[eax],edx
 0003C875    push        3C88A
 0003C87A    lea         eax,[ebp-4]
 0003C87D    call        @LStrClr
 0003C882    ret
>0003C883    jmp         @HandleFinally
>0003C888    jmp         0003C87A
 0003C88A    pop         edi
 0003C88B    pop         esi
 0003C88C    pop         ebx
 0003C88D    pop         ecx
 0003C88E    pop         ebp
 0003C88F    ret
*}
end;

//0003C890
procedure TListBoxStrings.Delete(Index:Integer);
begin
{*
 0003C890    push        ebx
 0003C891    push        esi
 0003C892    mov         esi,eax
 0003C894    mov         eax,dword ptr [esi+0C]
 0003C897    mov         bx,0FFB5
 0003C89B    call        @CallDynaInst
 0003C8A0    pop         esi
 0003C8A1    pop         ebx
 0003C8A2    ret
*}
end;

//0003C8A4
procedure TListBoxStrings.Clear;
begin
{*
 0003C8A4    push        ebx
 0003C8A5    mov         eax,dword ptr [eax+0C]
 0003C8A8    mov         bx,0FFB6
 0003C8AC    call        @CallDynaInst
 0003C8B1    pop         ebx
 0003C8B2    ret
*}
end;

//0003C8B4
procedure TListBoxStrings.SetUpdateState(Updating:Boolean);
begin
{*
 0003C8B4    push        ebx
 0003C8B5    push        esi
 0003C8B6    mov         ebx,edx
 0003C8B8    mov         esi,eax
 0003C8BA    push        0
 0003C8BC    mov         eax,ebx
 0003C8BE    xor         al,1
 0003C8C0    and         eax,7F
 0003C8C3    push        eax
 0003C8C4    push        0B
 0003C8C6    mov         eax,dword ptr [esi+0C]
 0003C8C9    call        TWinControl.GetHandle
 0003C8CE    push        eax
 0003C8CF    call        user32.SendMessageA
 0003C8D4    xor         bl,1
 0003C8D7    test        bl,bl
>0003C8D9    je          0003C8E3
 0003C8DB    mov         eax,dword ptr [esi+0C]
 0003C8DE    call        TControl.Refresh
 0003C8E3    pop         esi
 0003C8E4    pop         ebx
 0003C8E5    ret
*}
end;

//0003C8E8
function TListBoxStrings.IndexOf(const S:AnsiString):Integer;
begin
{*
 0003C8E8    push        ebx
 0003C8E9    push        esi
 0003C8EA    mov         esi,edx
 0003C8EC    mov         ebx,eax
 0003C8EE    mov         eax,esi
 0003C8F0    call        @LStrToPChar
 0003C8F5    push        eax
 0003C8F6    push        0FF
 0003C8F8    push        1A2
 0003C8FD    mov         eax,dword ptr [ebx+0C]
 0003C900    call        TWinControl.GetHandle
 0003C905    push        eax
 0003C906    call        user32.SendMessageA
 0003C90B    pop         esi
 0003C90C    pop         ebx
 0003C90D    ret
*}
end;

//0003C910
procedure TListBoxStrings.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 0003C910    push        ebp
 0003C911    mov         ebp,esp
 0003C913    push        ecx
 0003C914    push        ebx
 0003C915    push        esi
 0003C916    mov         esi,ecx
 0003C918    mov         ebx,edx
 0003C91A    mov         dword ptr [ebp-4],eax
 0003C91D    mov         eax,dword ptr [ebp-4]
 0003C920    call        TStrings.BeginUpdate
 0003C925    mov         eax,dword ptr [ebp-4]
 0003C928    mov         eax,dword ptr [eax+0C]
 0003C92B    mov         byte ptr [eax+228],1
 0003C932    xor         eax,eax
 0003C934    push        ebp
 0003C935    push        3C96F
 0003C93A    push        dword ptr fs:[eax]
 0003C93D    mov         dword ptr fs:[eax],esp
 0003C940    mov         ecx,esi
 0003C942    mov         edx,ebx
 0003C944    mov         eax,dword ptr [ebp-4]
 0003C947    call        TStrings.Move
 0003C94C    xor         eax,eax
 0003C94E    pop         edx
 0003C94F    pop         ecx
 0003C950    pop         ecx
 0003C951    mov         dword ptr fs:[eax],edx
 0003C954    push        3C976
 0003C959    mov         eax,dword ptr [ebp-4]
 0003C95C    mov         eax,dword ptr [eax+0C]
 0003C95F    mov         byte ptr [eax+228],0
 0003C966    mov         eax,dword ptr [ebp-4]
 0003C969    call        TStrings.EndUpdate
 0003C96E    ret
>0003C96F    jmp         @HandleFinally
>0003C974    jmp         0003C959
 0003C976    pop         esi
 0003C977    pop         ebx
 0003C978    pop         ecx
 0003C979    pop         ebp
 0003C97A    ret
*}
end;

//0003C97C
constructor TCustomListBox.Create(AOwner:TComponent);
begin
{*
 0003C97C    push        ebp
 0003C97D    mov         ebp,esp
 0003C97F    push        ecx
 0003C980    push        ebx
 0003C981    push        esi
 0003C982    test        dl,dl
>0003C984    je          0003C98E
 0003C986    add         esp,0FFFFFFF0
 0003C989    call        @ClassCreate
 0003C98E    mov         byte ptr [ebp-1],dl
 0003C991    mov         ebx,eax
 0003C993    xor         edx,edx
 0003C995    mov         eax,ebx
 0003C997    call        TWinControl.Create
 0003C99C    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003C9A1    cmp         byte ptr [eax],0
>0003C9A4    je          0003C9B0
 0003C9A6    mov         eax,[0003CA4C]
 0003C9AB    mov         dword ptr [ebx+40],eax
>0003C9AE    jmp         0003C9B8
 0003C9B0    mov         eax,[0003CA50]
 0003C9B5    mov         dword ptr [ebx+40],eax
 0003C9B8    mov         edx,79
 0003C9BD    mov         eax,ebx
 0003C9BF    call        TControl.SetWidth
 0003C9C4    mov         edx,61
 0003C9C9    mov         eax,ebx
 0003C9CB    call        TControl.SetHeight
 0003C9D0    mov         dl,1
 0003C9D2    mov         eax,ebx
 0003C9D4    call        TWinControl.SetTabStop
 0003C9D9    xor         edx,edx
 0003C9DB    mov         eax,ebx
 0003C9DD    call        TControl.SetParentColor
 0003C9E2    mov         dl,1
 0003C9E4    mov         eax,[00038C74];TListBoxStrings
 0003C9E9    call        TObject.Create
 0003C9EE    mov         esi,eax
 0003C9F0    mov         dword ptr [ebx+1EC],esi
 0003C9F6    mov         dword ptr [esi+0C],ebx
 0003C9F9    mov         dl,1
 0003C9FB    mov         eax,[0003E18C];TControlCanvas
 0003CA00    call        TCanvas.Create
 0003CA05    mov         esi,eax
 0003CA07    mov         dword ptr [ebx+1F4],esi
 0003CA0D    mov         edx,ebx
 0003CA0F    mov         eax,esi
 0003CA11    call        TControlCanvas.SetControl
 0003CA16    mov         dword ptr [ebx+1FC],10
 0003CA20    mov         byte ptr [ebx+1F0],1
 0003CA27    mov         byte ptr [ebx+204],1
 0003CA2E    mov         eax,ebx
 0003CA30    cmp         byte ptr [ebp-1],0
>0003CA34    je          0003CA45
 0003CA36    call        @AfterConstruction
 0003CA3B    pop         dword ptr fs:[0]
 0003CA42    add         esp,0C
 0003CA45    mov         eax,ebx
 0003CA47    pop         esi
 0003CA48    pop         ebx
 0003CA49    pop         ecx
 0003CA4A    pop         ebp
 0003CA4B    ret
*}
end;

//0003CA54
destructor TCustomListBox.Destroy;
begin
{*
 0003CA54    push        ebx
 0003CA55    push        esi
 0003CA56    call        @BeforeDestruction
 0003CA5B    mov         ebx,edx
 0003CA5D    mov         esi,eax
 0003CA5F    mov         edx,ebx
 0003CA61    and         dl,0FC
 0003CA64    mov         eax,esi
 0003CA66    call        TWinControl.Destroy
 0003CA6B    mov         eax,dword ptr [esi+1F4]
 0003CA71    call        TObject.Free
 0003CA76    mov         eax,dword ptr [esi+1EC]
 0003CA7C    call        TObject.Free
 0003CA81    mov         eax,dword ptr [esi+20C]
 0003CA87    call        TObject.Free
 0003CA8C    test        bl,bl
>0003CA8E    jle         0003CA97
 0003CA90    mov         eax,esi
 0003CA92    call        @ClassDestroy
 0003CA97    pop         esi
 0003CA98    pop         ebx
 0003CA99    ret
*}
end;

//0003CA9C
procedure TCustomListBox.GetItemData(Index:Integer);
begin
{*
 0003CA9C    push        ebx
 0003CA9D    push        esi
 0003CA9E    mov         esi,edx
 0003CAA0    mov         ebx,eax
 0003CAA2    push        0
 0003CAA4    push        esi
 0003CAA5    push        199
 0003CAAA    mov         eax,ebx
 0003CAAC    call        TWinControl.GetHandle
 0003CAB1    push        eax
 0003CAB2    call        user32.SendMessageA
 0003CAB7    pop         esi
 0003CAB8    pop         ebx
 0003CAB9    ret
*}
end;

//0003CABC
procedure TCustomListBox.SetItemData(Index:Integer; AData:Longint);
begin
{*
 0003CABC    push        ebx
 0003CABD    push        esi
 0003CABE    push        edi
 0003CABF    mov         edi,ecx
 0003CAC1    mov         esi,edx
 0003CAC3    mov         ebx,eax
 0003CAC5    push        edi
 0003CAC6    push        esi
 0003CAC7    push        19A
 0003CACC    mov         eax,ebx
 0003CACE    call        TWinControl.GetHandle
 0003CAD3    push        eax
 0003CAD4    call        user32.SendMessageA
 0003CAD9    pop         edi
 0003CADA    pop         esi
 0003CADB    pop         ebx
 0003CADC    ret
*}
end;

//0003CAE0
procedure TCustomListBox.DeleteString(Index:Integer);
begin
{*
 0003CAE0    push        ebx
 0003CAE1    push        esi
 0003CAE2    mov         esi,edx
 0003CAE4    mov         ebx,eax
 0003CAE6    push        0
 0003CAE8    push        esi
 0003CAE9    push        182
 0003CAEE    mov         eax,ebx
 0003CAF0    call        TWinControl.GetHandle
 0003CAF5    push        eax
 0003CAF6    call        user32.SendMessageA
 0003CAFB    pop         esi
 0003CAFC    pop         ebx
 0003CAFD    ret
*}
end;

//0003CB00
procedure TCustomListBox.ResetContent;
begin
{*
 0003CB00    push        ebx
 0003CB01    mov         ebx,eax
 0003CB03    push        0
 0003CB05    push        0
 0003CB07    push        184
 0003CB0C    mov         eax,ebx
 0003CB0E    call        TWinControl.GetHandle
 0003CB13    push        eax
 0003CB14    call        user32.SendMessageA
 0003CB19    pop         ebx
 0003CB1A    ret
*}
end;

//0003CB1C
procedure TCustomListBox.SetColumnWidth;
begin
{*
 0003CB1C    push        ebx
 0003CB1D    push        esi
 0003CB1E    mov         ebx,eax
 0003CB20    mov         ecx,dword ptr [ebx+1F8]
 0003CB26    test        ecx,ecx
>0003CB28    jle         0003CB5C
 0003CB2A    cmp         dword ptr [ebx+38],0
>0003CB2E    jle         0003CB5C
 0003CB30    mov         eax,dword ptr [ebx+38]
 0003CB33    add         eax,ecx
 0003CB35    sub         eax,3
 0003CB38    cdq
 0003CB39    idiv        eax,ecx
 0003CB3B    mov         esi,eax
 0003CB3D    cmp         esi,1
>0003CB40    jge         0003CB47
 0003CB42    mov         esi,1
 0003CB47    push        0
 0003CB49    push        esi
 0003CB4A    push        195
 0003CB4F    mov         eax,ebx
 0003CB51    call        TWinControl.GetHandle
 0003CB56    push        eax
 0003CB57    call        user32.SendMessageA
 0003CB5C    pop         esi
 0003CB5D    pop         ebx
 0003CB5E    ret
*}
end;

//0003CB60
procedure TCustomListBox.SetColumns(Value:Integer);
begin
{*
 0003CB60    push        ebx
 0003CB61    mov         ebx,eax
 0003CB63    cmp         edx,dword ptr [ebx+1F8]
>0003CB69    je          0003CB9F
 0003CB6B    cmp         dword ptr [ebx+1F8],0
>0003CB72    je          0003CB78
 0003CB74    test        edx,edx
>0003CB76    jne         0003CB87
 0003CB78    mov         dword ptr [ebx+1F8],edx
 0003CB7E    mov         eax,ebx
 0003CB80    call        TWinControl.RecreateWnd
>0003CB85    jmp         0003CB9F
 0003CB87    mov         dword ptr [ebx+1F8],edx
 0003CB8D    mov         eax,ebx
 0003CB8F    call        TWinControl.HandleAllocated
 0003CB94    test        al,al
>0003CB96    je          0003CB9F
 0003CB98    mov         eax,ebx
 0003CB9A    call        TCustomListBox.SetColumnWidth
 0003CB9F    pop         ebx
 0003CBA0    ret
*}
end;

//0003CBA4
function TCustomListBox.GetItemIndex:Integer;
begin
{*
 0003CBA4    push        ebx
 0003CBA5    mov         ebx,eax
 0003CBA7    cmp         byte ptr [ebx+202],0
>0003CBAE    je          0003CBC8
 0003CBB0    push        0
 0003CBB2    push        0
 0003CBB4    push        19F
 0003CBB9    mov         eax,ebx
 0003CBBB    call        TWinControl.GetHandle
 0003CBC0    push        eax
 0003CBC1    call        user32.SendMessageA
 0003CBC6    pop         ebx
 0003CBC7    ret
 0003CBC8    push        0
 0003CBCA    push        0
 0003CBCC    push        188
 0003CBD1    mov         eax,ebx
 0003CBD3    call        TWinControl.GetHandle
 0003CBD8    push        eax
 0003CBD9    call        user32.SendMessageA
 0003CBDE    pop         ebx
 0003CBDF    ret
*}
end;

//0003CBE0
procedure TCustomListBox.SetItemIndex(Value:Integer);
begin
{*
 0003CBE0    push        ebx
 0003CBE1    push        esi
 0003CBE2    mov         esi,edx
 0003CBE4    mov         ebx,eax
 0003CBE6    mov         eax,ebx
 0003CBE8    call        TCustomListBox.GetItemIndex
 0003CBED    cmp         esi,eax
>0003CBEF    je          0003CC26
 0003CBF1    cmp         byte ptr [ebx+202],0
>0003CBF8    je          0003CC11
 0003CBFA    push        0
 0003CBFC    push        esi
 0003CBFD    push        19E
 0003CC02    mov         eax,ebx
 0003CC04    call        TWinControl.GetHandle
 0003CC09    push        eax
 0003CC0A    call        user32.SendMessageA
>0003CC0F    jmp         0003CC26
 0003CC11    push        0
 0003CC13    push        esi
 0003CC14    push        186
 0003CC19    mov         eax,ebx
 0003CC1B    call        TWinControl.GetHandle
 0003CC20    push        eax
 0003CC21    call        user32.SendMessageA
 0003CC26    pop         esi
 0003CC27    pop         ebx
 0003CC28    ret
*}
end;

//0003CC2C
procedure TCustomListBox.SetExtendedSelect(Value:Boolean);
begin
{*
 0003CC2C    cmp         dl,byte ptr [eax+204]
>0003CC32    je          0003CC3F
 0003CC34    mov         byte ptr [eax+204],dl
 0003CC3A    call        TWinControl.RecreateWnd
 0003CC3F    ret
*}
end;

//0003CC40
procedure TCustomListBox.SetIntegralHeight(Value:Boolean);
begin
{*
 0003CC40    cmp         dl,byte ptr [eax+201]
>0003CC46    je          0003CC53
 0003CC48    mov         byte ptr [eax+201],dl
 0003CC4E    call        TWinControl.RecreateWnd
 0003CC53    ret
*}
end;

//0003CC54
function TCustomListBox.GetItemHeight:Integer;
begin
{*
 0003CC54    push        ebx
 0003CC55    push        esi
 0003CC56    add         esp,0FFFFFFF0
 0003CC59    mov         ebx,eax
 0003CC5B    mov         esi,dword ptr [ebx+1FC]
 0003CC61    mov         eax,ebx
 0003CC63    call        TWinControl.HandleAllocated
 0003CC68    test        al,al
>0003CC6A    je          0003CC8E
 0003CC6C    cmp         byte ptr [ebx+200],0
>0003CC73    jne         0003CC8E
 0003CC75    mov         eax,esp
 0003CC77    push        eax
 0003CC78    xor         ecx,ecx
 0003CC7A    mov         edx,198
 0003CC7F    mov         eax,ebx
 0003CC81    call        TControl.Perform
 0003CC86    mov         esi,dword ptr [esp+0C]
 0003CC8A    sub         esi,dword ptr [esp+4]
 0003CC8E    mov         eax,esi
 0003CC90    add         esp,10
 0003CC93    pop         esi
 0003CC94    pop         ebx
 0003CC95    ret
*}
end;

//0003CC98
procedure TCustomListBox.SetItemHeight(Value:Integer);
begin
{*
 0003CC98    cmp         edx,dword ptr [eax+1FC]
>0003CC9E    je          0003CCAF
 0003CCA0    test        edx,edx
>0003CCA2    jle         0003CCAF
 0003CCA4    mov         dword ptr [eax+1FC],edx
 0003CCAA    call        TWinControl.RecreateWnd
 0003CCAF    ret
*}
end;

//0003CCB0
procedure TCustomListBox.SetTabWidth(Value:Integer);
begin
{*
 0003CCB0    test        edx,edx
>0003CCB2    jge         0003CCB6
 0003CCB4    xor         edx,edx
 0003CCB6    cmp         edx,dword ptr [eax+208]
>0003CCBC    je          0003CCC9
 0003CCBE    mov         dword ptr [eax+208],edx
 0003CCC4    call        TWinControl.RecreateWnd
 0003CCC9    ret
*}
end;

//0003CCCC
procedure TCustomListBox.SetMultiSelect(Value:Boolean);
begin
{*
 0003CCCC    cmp         dl,byte ptr [eax+202]
>0003CCD2    je          0003CCDF
 0003CCD4    mov         byte ptr [eax+202],dl
 0003CCDA    call        TWinControl.RecreateWnd
 0003CCDF    ret
*}
end;

//0003CCE0
function TCustomListBox.GetSelected(Index:Integer):Boolean;
begin
{*
 0003CCE0    push        ebp
 0003CCE1    mov         ebp,esp
 0003CCE3    add         esp,0FFFFFFF4
 0003CCE6    push        ebx
 0003CCE7    push        esi
 0003CCE8    xor         ecx,ecx
 0003CCEA    mov         dword ptr [ebp-0C],ecx
 0003CCED    mov         esi,edx
 0003CCEF    mov         ebx,eax
 0003CCF1    xor         eax,eax
 0003CCF3    push        ebp
 0003CCF4    push        3CD63
 0003CCF9    push        dword ptr fs:[eax]
 0003CCFC    mov         dword ptr fs:[eax],esp
 0003CCFF    push        0
 0003CD01    push        esi
 0003CD02    push        187
 0003CD07    mov         eax,ebx
 0003CD09    call        TWinControl.GetHandle
 0003CD0E    push        eax
 0003CD0F    call        user32.SendMessageA
 0003CD14    cmp         eax,0FFFFFFFF
>0003CD17    jne         0003CD47
 0003CD19    mov         dword ptr [ebp-8],esi
 0003CD1C    mov         byte ptr [ebp-4],0
 0003CD20    lea         eax,[ebp-8]
 0003CD23    push        eax
 0003CD24    push        0
 0003CD26    lea         edx,[ebp-0C]
 0003CD29    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 0003CD2E    call        LoadResString
 0003CD33    mov         ecx,dword ptr [ebp-0C]
 0003CD36    mov         dl,1
 0003CD38    mov         eax,[0001EC9C];EListError
 0003CD3D    call        Exception.CreateFmt
 0003CD42    call        @RaiseExcept
 0003CD47    neg         eax
 0003CD49    sbb         ebx,ebx
 0003CD4B    neg         ebx
 0003CD4D    xor         eax,eax
 0003CD4F    pop         edx
 0003CD50    pop         ecx
 0003CD51    pop         ecx
 0003CD52    mov         dword ptr fs:[eax],edx
 0003CD55    push        3CD6A
 0003CD5A    lea         eax,[ebp-0C]
 0003CD5D    call        @LStrClr
 0003CD62    ret
>0003CD63    jmp         @HandleFinally
>0003CD68    jmp         0003CD5A
 0003CD6A    mov         eax,ebx
 0003CD6C    pop         esi
 0003CD6D    pop         ebx
 0003CD6E    mov         esp,ebp
 0003CD70    pop         ebp
 0003CD71    ret
*}
end;

//0003CD74
procedure TCustomListBox.SetSorted(Value:Boolean);
begin
{*
 0003CD74    cmp         dl,byte ptr [eax+203]
>0003CD7A    je          0003CD87
 0003CD7C    mov         byte ptr [eax+203],dl
 0003CD82    call        TWinControl.RecreateWnd
 0003CD87    ret
*}
end;

//0003CD88
procedure TCustomListBox.SetStyle(Value:TListBoxStyle);
begin
{*
 0003CD88    cmp         dl,byte ptr [eax+200]
>0003CD8E    je          0003CD9B
 0003CD90    mov         byte ptr [eax+200],dl
 0003CD96    call        TWinControl.RecreateWnd
 0003CD9B    ret
*}
end;

//0003CD9C
function TCustomListBox.GetTopIndex:Integer;
begin
{*
 0003CD9C    push        ebx
 0003CD9D    mov         ebx,eax
 0003CD9F    push        0
 0003CDA1    push        0
 0003CDA3    push        18E
 0003CDA8    mov         eax,ebx
 0003CDAA    call        TWinControl.GetHandle
 0003CDAF    push        eax
 0003CDB0    call        user32.SendMessageA
 0003CDB5    pop         ebx
 0003CDB6    ret
*}
end;

//0003CDB8
procedure TRadioButton.SetAlignment(Value:TLeftRight);
begin
{*
 0003CDB8    cmp         dl,byte ptr [eax+1F0]
>0003CDBE    je          0003CDCB
 0003CDC0    mov         byte ptr [eax+1F0],dl
 0003CDC6    call        TWinControl.RecreateWnd
 0003CDCB    ret
*}
end;

//0003CDCC
procedure TCustomListBox.SetTopIndex(Value:Integer);
begin
{*
 0003CDCC    push        ebx
 0003CDCD    push        esi
 0003CDCE    mov         esi,edx
 0003CDD0    mov         ebx,eax
 0003CDD2    mov         eax,ebx
 0003CDD4    call        TCustomListBox.GetTopIndex
 0003CDD9    cmp         esi,eax
>0003CDDB    je          0003CDF2
 0003CDDD    push        0
 0003CDDF    push        esi
 0003CDE0    push        197
 0003CDE5    mov         eax,ebx
 0003CDE7    call        TWinControl.GetHandle
 0003CDEC    push        eax
 0003CDED    call        user32.SendMessageA
 0003CDF2    pop         esi
 0003CDF3    pop         ebx
 0003CDF4    ret
*}
end;

//0003CDF8
procedure TCustomListBox.SetItems(Value:TStrings);
begin
{*
 0003CDF8    push        esi
 0003CDF9    mov         esi,eax
 0003CDFB    mov         eax,dword ptr [esi+1EC]
 0003CE01    mov         ecx,dword ptr [eax]
 0003CE03    call        dword ptr [ecx+8]
 0003CE06    pop         esi
 0003CE07    ret
*}
end;

//0003CE08
function TCustomListBox.ItemAtPos(Pos:TPoint; Existing:Boolean):Integer;
begin
{*
 0003CE08    push        ebx
 0003CE09    push        esi
 0003CE0A    push        edi
 0003CE0B    push        ebp
 0003CE0C    add         esp,0FFFFFFD8
 0003CE0F    mov         esi,edx
 0003CE11    lea         edi,[esp]
 0003CE14    movs        dword ptr [edi],dword ptr [esi]
 0003CE15    movs        dword ptr [edi],dword ptr [esi]
 0003CE16    mov         ebx,ecx
 0003CE18    mov         esi,eax
 0003CE1A    push        dword ptr [esp+4]
 0003CE1E    push        dword ptr [esp+4]
 0003CE22    lea         edx,[esp+20]
 0003CE26    mov         eax,esi
 0003CE28    mov         ecx,dword ptr [eax]
 0003CE2A    call        dword ptr [ecx+44]
 0003CE2D    lea         eax,[esp+20]
 0003CE31    push        eax
 0003CE32    call        user32.PtInRect
 0003CE37    test        eax,eax
>0003CE39    je          0003CE87
 0003CE3B    mov         eax,esi
 0003CE3D    call        TCustomListBox.GetTopIndex
 0003CE42    mov         ebp,eax
 0003CE44    mov         eax,dword ptr [esi+1EC]
 0003CE4A    mov         edx,dword ptr [eax]
 0003CE4C    call        dword ptr [edx+14]
 0003CE4F    mov         edi,eax
 0003CE51    cmp         edi,ebp
>0003CE53    jle         0003CE83
 0003CE55    lea         eax,[esp+8]
 0003CE59    push        eax
 0003CE5A    mov         ecx,ebp
 0003CE5C    mov         edx,198
 0003CE61    mov         eax,esi
 0003CE63    call        TControl.Perform
 0003CE68    push        dword ptr [esp+4]
 0003CE6C    push        dword ptr [esp+4]
 0003CE70    lea         eax,[esp+10]
 0003CE74    push        eax
 0003CE75    call        user32.PtInRect
 0003CE7A    test        eax,eax
>0003CE7C    jne         0003CE8A
 0003CE7E    inc         ebp
 0003CE7F    cmp         edi,ebp
>0003CE81    jg          0003CE55
 0003CE83    test        bl,bl
>0003CE85    je          0003CE8A
 0003CE87    or          ebp,0FFFFFFFF
 0003CE8A    mov         eax,ebp
 0003CE8C    add         esp,28
 0003CE8F    pop         ebp
 0003CE90    pop         edi
 0003CE91    pop         esi
 0003CE92    pop         ebx
 0003CE93    ret
*}
end;

//0003CE94
procedure TCustomListBox.CreateParams(var Params:TCreateParams);
begin
{*
 0003CE94    push        ebx
 0003CE95    push        esi
 0003CE96    mov         esi,edx
 0003CE98    mov         ebx,eax
 0003CE9A    mov         edx,esi
 0003CE9C    mov         eax,ebx
 0003CE9E    call        TWinControl.CreateParams
 0003CEA3    mov         ecx,3CF70
 0003CEA8    mov         edx,esi
 0003CEAA    mov         eax,ebx
 0003CEAC    call        TWinControl.CreateSubClass
 0003CEB1    mov         eax,0B4754
 0003CEB6    cmp         byte ptr [ebx+204],0
>0003CEBD    je          0003CEC4
 0003CEBF    mov         eax,0B475C
 0003CEC4    mov         edx,dword ptr [esi+4]
 0003CEC7    or          edx,300041
 0003CECD    xor         ecx,ecx
 0003CECF    mov         cl,byte ptr [ebx+200]
 0003CED5    or          edx,dword ptr [ecx*4+0B4740]
 0003CEDC    xor         ecx,ecx
 0003CEDE    mov         cl,byte ptr [ebx+203]
 0003CEE4    or          edx,dword ptr [ecx*4+0B474C]
 0003CEEB    xor         ecx,ecx
 0003CEED    mov         cl,byte ptr [ebx+202]
 0003CEF3    or          edx,dword ptr [eax+ecx*4]
 0003CEF6    xor         eax,eax
 0003CEF8    mov         al,byte ptr [ebx+201]
 0003CEFE    or          edx,dword ptr [eax*4+0B4764]
 0003CF05    cmp         dword ptr [ebx+1F8],0
 0003CF0C    setne       al
 0003CF0F    and         eax,7F
 0003CF12    or          edx,dword ptr [eax*4+0B476C]
 0003CF19    xor         eax,eax
 0003CF1B    mov         al,byte ptr [ebx+1F0]
 0003CF21    or          edx,dword ptr [eax*4+0B4678]
 0003CF28    cmp         dword ptr [ebx+208],0
 0003CF2F    setne       al
 0003CF32    and         eax,7F
 0003CF35    or          edx,dword ptr [eax*4+0B4774]
 0003CF3C    mov         dword ptr [esi+4],edx
 0003CF3F    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003CF44    cmp         byte ptr [eax],0
>0003CF47    je          0003CF69
 0003CF49    cmp         byte ptr [ebx+12C],0
>0003CF50    je          0003CF69
 0003CF52    cmp         byte ptr [ebx+1F0],1
>0003CF59    jne         0003CF69
 0003CF5B    and         dword ptr [esi+4],0FF7FFFFF
 0003CF62    or          dword ptr [esi+8],200
 0003CF69    and         dword ptr [esi+24],0FFFFFFFC
 0003CF6D    pop         esi
 0003CF6E    pop         ebx
 0003CF6F    ret
*}
end;

//0003CF78
procedure TCustomListBox.CreateWnd;
begin
{*
 0003CF78    push        ebx
 0003CF79    push        esi
 0003CF7A    push        edi
 0003CF7B    mov         ebx,eax
 0003CF7D    mov         esi,dword ptr [ebx+38]
 0003CF80    mov         edi,dword ptr [ebx+3C]
 0003CF83    mov         eax,ebx
 0003CF85    call        TWinControl.CreateWnd
 0003CF8A    push        14
 0003CF8C    push        edi
 0003CF8D    push        esi
 0003CF8E    mov         eax,dword ptr [ebx+34]
 0003CF91    push        eax
 0003CF92    mov         eax,dword ptr [ebx+30]
 0003CF95    push        eax
 0003CF96    push        0
 0003CF98    mov         eax,ebx
 0003CF9A    call        TWinControl.GetHandle
 0003CF9F    push        eax
 0003CFA0    call        user32.SetWindowPos
 0003CFA5    cmp         dword ptr [ebx+208],0
>0003CFAC    je          0003CFC9
 0003CFAE    lea         eax,[ebx+208]
 0003CFB4    push        eax
 0003CFB5    push        1
 0003CFB7    push        192
 0003CFBC    mov         eax,ebx
 0003CFBE    call        TWinControl.GetHandle
 0003CFC3    push        eax
 0003CFC4    call        user32.SendMessageA
 0003CFC9    mov         eax,ebx
 0003CFCB    call        TCustomListBox.SetColumnWidth
 0003CFD0    mov         esi,dword ptr [ebx+20C]
 0003CFD6    test        esi,esi
>0003CFD8    je          0003D014
 0003CFDA    mov         edx,esi
 0003CFDC    mov         eax,dword ptr [ebx+1EC]
 0003CFE2    mov         ecx,dword ptr [eax]
 0003CFE4    call        dword ptr [ecx+8]
 0003CFE7    mov         edx,dword ptr [ebx+210]
 0003CFED    mov         eax,ebx
 0003CFEF    call        TCustomListBox.SetTopIndex
 0003CFF4    mov         edx,dword ptr [ebx+214]
 0003CFFA    mov         eax,ebx
 0003CFFC    call        TCustomListBox.SetItemIndex
 0003D001    mov         eax,dword ptr [ebx+20C]
 0003D007    call        TObject.Free
 0003D00C    xor         eax,eax
 0003D00E    mov         dword ptr [ebx+20C],eax
 0003D014    pop         edi
 0003D015    pop         esi
 0003D016    pop         ebx
 0003D017    ret
*}
end;

//0003D018
procedure TCustomListBox.DestroyWnd;
begin
{*
 0003D018    push        ebx
 0003D019    push        esi
 0003D01A    mov         ebx,eax
 0003D01C    mov         eax,dword ptr [ebx+1EC]
 0003D022    mov         edx,dword ptr [eax]
 0003D024    call        dword ptr [edx+14]
 0003D027    test        eax,eax
>0003D029    jle         0003D066
 0003D02B    mov         dl,1
 0003D02D    mov         eax,[0001F340];TStringList
 0003D032    call        TObject.Create
 0003D037    mov         esi,eax
 0003D039    mov         dword ptr [ebx+20C],esi
 0003D03F    mov         edx,dword ptr [ebx+1EC]
 0003D045    mov         eax,esi
 0003D047    mov         ecx,dword ptr [eax]
 0003D049    call        dword ptr [ecx+8]
 0003D04C    mov         eax,ebx
 0003D04E    call        TCustomListBox.GetTopIndex
 0003D053    mov         dword ptr [ebx+210],eax
 0003D059    mov         eax,ebx
 0003D05B    call        TCustomListBox.GetItemIndex
 0003D060    mov         dword ptr [ebx+214],eax
 0003D066    mov         eax,ebx
 0003D068    call        TWinControl.DestroyWnd
 0003D06D    pop         esi
 0003D06E    pop         ebx
 0003D06F    ret
*}
end;

//0003D070
procedure TCustomListBox.WndProc(var Message:TMessage);
begin
{*
 0003D070    push        ebx
 0003D071    push        esi
 0003D072    push        edi
 0003D073    mov         esi,edx
 0003D075    mov         ebx,eax
 0003D077    test        byte ptr [ebx+20],10
>0003D07B    jne         0003D0C6
 0003D07D    mov         edi,dword ptr [esi]
 0003D07F    cmp         edi,201
>0003D085    je          0003D08F
 0003D087    cmp         edi,203
>0003D08D    jne         0003D0C6
 0003D08F    mov         eax,ebx
 0003D091    call        TControl.Dragging
 0003D096    test        al,al
>0003D098    jne         0003D0C6
 0003D09A    cmp         byte ptr [ebx+4D],1
>0003D09E    jne         0003D0C6
 0003D0A0    mov         edx,esi
 0003D0A2    mov         eax,ebx
 0003D0A4    call        TWinControl.IsControlMouseMsg
 0003D0A9    test        al,al
>0003D0AB    jne         0003D0CF
 0003D0AD    mov         ax,[0003D0D4]
 0003D0B3    or          ax,word ptr [ebx+44]
 0003D0B7    mov         word ptr [ebx+44],ax
 0003D0BB    mov         edx,esi
 0003D0BD    mov         eax,ebx
 0003D0BF    mov         ecx,dword ptr [eax]
 0003D0C1    call        dword ptr [ecx-14]
>0003D0C4    jmp         0003D0CF
 0003D0C6    mov         edx,esi
 0003D0C8    mov         eax,ebx
 0003D0CA    call        TWinControl.WndProc
 0003D0CF    pop         edi
 0003D0D0    pop         esi
 0003D0D1    pop         ebx
 0003D0D2    ret
*}
end;

//0003D0D8
procedure TCustomListBox.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 0003D0D8    push        ebx
 0003D0D9    push        esi
 0003D0DA    push        edi
 0003D0DB    push        ebp
 0003D0DC    add         esp,0FFFFFFF8
 0003D0DF    mov         edi,edx
 0003D0E1    mov         esi,eax
 0003D0E3    mov         ax,word ptr [edi+4]
 0003D0E7    call        KeysToShiftState
 0003D0EC    mov         ebx,eax
 0003D0EE    cmp         byte ptr [esi+4D],1
>0003D0F2    jne         0003D13D
 0003D0F4    cmp         byte ptr [esi+202],0
>0003D0FB    je          0003D13D
 0003D0FD    test        bl,1
>0003D100    je          0003D107
 0003D102    test        bl,4
>0003D105    je          0003D13D
 0003D107    mov         edx,esp
 0003D109    mov         eax,dword ptr [edi+8]
 0003D10C    call        SmallPointToPoint
 0003D111    mov         edx,esp
 0003D113    mov         cl,1
 0003D115    mov         eax,esi
 0003D117    call        TCustomListBox.ItemAtPos
 0003D11C    mov         ebp,eax
 0003D11E    test        ebp,ebp
>0003D120    jl          0003D13D
 0003D122    mov         edx,ebp
 0003D124    mov         eax,esi
 0003D126    call        TCustomListBox.GetSelected
 0003D12B    test        al,al
>0003D12D    je          0003D13D
 0003D12F    or          ecx,0FFFFFFFF
 0003D132    xor         edx,edx
 0003D134    mov         eax,esi
 0003D136    call        TControl.BeginDrag
>0003D13B    jmp         0003D16B
 0003D13D    mov         edx,edi
 0003D13F    mov         eax,esi
 0003D141    call        TControl.WMLButtonDown
 0003D146    cmp         byte ptr [esi+4D],1
>0003D14A    jne         0003D16B
 0003D14C    cmp         byte ptr [esi+202],0
>0003D153    je          0003D15F
 0003D155    test        bl,4
>0003D158    jne         0003D16B
 0003D15A    test        bl,1
>0003D15D    jne         0003D16B
 0003D15F    or          ecx,0FFFFFFFF
 0003D162    xor         edx,edx
 0003D164    mov         eax,esi
 0003D166    call        TControl.BeginDrag
 0003D16B    pop         ecx
 0003D16C    pop         edx
 0003D16D    pop         ebp
 0003D16E    pop         edi
 0003D16F    pop         esi
 0003D170    pop         ebx
 0003D171    ret
*}
end;

//0003D174
procedure TCustomListBox.CNCommand(var Message:TWMCommand);
begin
{*
 0003D174    push        ebx
 0003D175    push        esi
 0003D176    mov         esi,eax
 0003D178    mov         ax,word ptr [edx+6]
 0003D17C    dec         ax
>0003D17F    je          0003D188
 0003D181    dec         ax
>0003D184    je          0003D19D
>0003D186    jmp         0003D1A8
 0003D188    mov         eax,esi
 0003D18A    call        TControl.Changed
 0003D18F    mov         eax,esi
 0003D191    mov         bx,0FFEC
 0003D195    call        @CallDynaInst
 0003D19A    pop         esi
 0003D19B    pop         ebx
 0003D19C    ret
 0003D19D    mov         eax,esi
 0003D19F    mov         bx,0FFEB
 0003D1A3    call        @CallDynaInst
 0003D1A8    pop         esi
 0003D1A9    pop         ebx
 0003D1AA    ret
*}
end;

//0003D1AC
procedure PaintListBox;
begin
{*
 0003D1AC    push        ebp
 0003D1AD    mov         ebp,esp
 0003D1AF    add         esp,0FFFFFF70
 0003D1B5    push        ebx
 0003D1B6    push        esi
 0003D1B7    push        edi
 0003D1B8    mov         edi,dword ptr [ebp+8]
 0003D1BB    add         edi,0FFFFFFFC
 0003D1BE    mov         dword ptr [ebp-18],0BC2B
 0003D1C5    lea         eax,[ebp-58]
 0003D1C8    mov         dword ptr [ebp-10],eax
 0003D1CB    mov         eax,dword ptr [edi]
 0003D1CD    call        TWinControl.GetHandle
 0003D1D2    mov         dword ptr [ebp-14],eax
 0003D1D5    mov         dword ptr [ebp-58],2
 0003D1DC    mov         dword ptr [ebp-4C],1
 0003D1E3    xor         eax,eax
 0003D1E5    mov         dword ptr [ebp-48],eax
 0003D1E8    mov         eax,dword ptr [ebp+8]
 0003D1EB    mov         eax,dword ptr [eax-8]
 0003D1EE    mov         eax,dword ptr [eax+4]
 0003D1F1    mov         dword ptr [ebp-40],eax
 0003D1F4    mov         eax,dword ptr [edi]
 0003D1F6    call        TWinControl.GetHandle
 0003D1FB    mov         dword ptr [ebp-54],eax
 0003D1FE    mov         eax,dword ptr [edi]
 0003D200    call        TWinControl.GetHandle
 0003D205    mov         dword ptr [ebp-44],eax
 0003D208    mov         dword ptr [ebp-28],0BC2C
 0003D20F    mov         eax,dword ptr [edi]
 0003D211    call        TWinControl.GetHandle
 0003D216    mov         dword ptr [ebp-24],eax
 0003D219    lea         eax,[ebp-70]
 0003D21C    mov         dword ptr [ebp-20],eax
 0003D21F    mov         dword ptr [ebp-70],2
 0003D226    mov         eax,dword ptr [edi]
 0003D228    call        TWinControl.GetHandle
 0003D22D    mov         dword ptr [ebp-6C],eax
 0003D230    xor         esi,esi
 0003D232    mov         eax,dword ptr [edi]
 0003D234    call        TCustomListBox.GetTopIndex
 0003D239    mov         ebx,eax
 0003D23B    lea         eax,[ebp-80]
 0003D23E    push        eax
 0003D23F    mov         eax,dword ptr [ebp+8]
 0003D242    mov         eax,dword ptr [eax-8]
 0003D245    mov         eax,dword ptr [eax+4]
 0003D248    push        eax
 0003D249    call        gdi32.GetClipBox
 0003D24E    mov         eax,dword ptr [edi]
 0003D250    mov         eax,dword ptr [eax+3C]
 0003D253    mov         dword ptr [ebp-4],eax
 0003D256    mov         eax,dword ptr [edi]
 0003D258    mov         eax,dword ptr [eax+38]
 0003D25B    mov         dword ptr [ebp-8],eax
 0003D25E    cmp         esi,dword ptr [ebp-4]
>0003D261    jge         0003D306
 0003D267    mov         dword ptr [ebp-68],ebx
 0003D26A    mov         eax,dword ptr [edi]
 0003D26C    mov         eax,dword ptr [eax+1EC]
 0003D272    mov         edx,dword ptr [eax]
 0003D274    call        dword ptr [edx+14]
 0003D277    cmp         ebx,eax
>0003D279    jge         0003D28D
 0003D27B    mov         eax,dword ptr [edi]
 0003D27D    mov         eax,dword ptr [eax+1EC]
 0003D283    mov         edx,ebx
 0003D285    mov         ecx,dword ptr [eax]
 0003D287    call        dword ptr [ecx+18]
 0003D28A    mov         dword ptr [ebp-5C],eax
 0003D28D    mov         eax,dword ptr [ebp-8]
 0003D290    mov         dword ptr [ebp-64],eax
 0003D293    mov         eax,dword ptr [edi]
 0003D295    mov         eax,dword ptr [eax+1FC]
 0003D29B    mov         dword ptr [ebp-60],eax
 0003D29E    mov         eax,dword ptr [ebp-5C]
 0003D2A1    mov         dword ptr [ebp-2C],eax
 0003D2A4    mov         dword ptr [ebp-50],ebx
 0003D2A7    lea         edx,[ebp-28]
 0003D2AA    mov         eax,dword ptr [edi]
 0003D2AC    mov         ecx,dword ptr [eax]
 0003D2AE    call        dword ptr [ecx-14]
 0003D2B1    mov         eax,dword ptr [ebp-60]
 0003D2B4    add         eax,esi
 0003D2B6    push        eax
 0003D2B7    lea         eax,[ebp-90]
 0003D2BD    push        eax
 0003D2BE    mov         ecx,dword ptr [ebp-64]
 0003D2C1    mov         edx,esi
 0003D2C3    xor         eax,eax
 0003D2C5    call        Rect
 0003D2CA    push        esi
 0003D2CB    push        edi
 0003D2CC    lea         esi,[ebp-90]
 0003D2D2    lea         edi,[ebp-3C]
 0003D2D5    mov         ecx,4
 0003D2DA    rep movs    dword ptr [edi],dword ptr [esi]
 0003D2DC    pop         edi
 0003D2DD    pop         esi
 0003D2DE    lea         edx,[ebp-18]
 0003D2E1    mov         eax,dword ptr [edi]
 0003D2E3    mov         ecx,dword ptr [eax]
 0003D2E5    call        dword ptr [ecx-14]
 0003D2E8    add         esi,dword ptr [ebp-60]
 0003D2EB    inc         ebx
 0003D2EC    mov         eax,dword ptr [edi]
 0003D2EE    mov         eax,dword ptr [eax+1EC]
 0003D2F4    mov         edx,dword ptr [eax]
 0003D2F6    call        dword ptr [edx+14]
 0003D2F9    cmp         ebx,eax
>0003D2FB    jge         0003D306
 0003D2FD    cmp         esi,dword ptr [ebp-4]
>0003D300    jl          0003D267
 0003D306    pop         edi
 0003D307    pop         esi
 0003D308    pop         ebx
 0003D309    mov         esp,ebp
 0003D30B    pop         ebp
 0003D30C    ret
*}
end;

//0003D310
procedure TCustomListBox.WMPaint(var Message:TWMPaint);
begin
{*
 0003D310    push        ebp
 0003D311    mov         ebp,esp
 0003D313    add         esp,0FFFFFFF8
 0003D316    mov         dword ptr [ebp-8],edx
 0003D319    mov         dword ptr [ebp-4],eax
 0003D31C    mov         eax,dword ptr [ebp-8]
 0003D31F    cmp         dword ptr [eax+4],0
>0003D323    je          0003D32E
 0003D325    push        ebp
 0003D326    call        PaintListBox
 0003D32B    pop         ecx
>0003D32C    jmp         0003D339
 0003D32E    mov         edx,dword ptr [ebp-8]
 0003D331    mov         eax,dword ptr [ebp-4]
 0003D334    call        TWinControl.WMPaint
 0003D339    pop         ecx
 0003D33A    pop         ecx
 0003D33B    pop         ebp
 0003D33C    ret
*}
end;

//0003D340
procedure TCustomListBox.WMSize(var Message:TWMSize);
begin
{*
 0003D340    push        ebx
 0003D341    mov         ebx,eax
 0003D343    mov         eax,ebx
 0003D345    call        TWinControl.WMSize
 0003D34A    mov         eax,ebx
 0003D34C    call        TCustomListBox.SetColumnWidth
 0003D351    pop         ebx
 0003D352    ret
*}
end;

//0003D354
procedure TCustomListBox.DragCanceled;
begin
{*
 0003D354    push        ebx
 0003D355    add         esp,0FFFFFFE0
 0003D358    mov         ebx,eax
 0003D35A    mov         dword ptr [esp+8],201
 0003D362    push        esp
 0003D363    call        user32.GetCursorPos
 0003D368    lea         ecx,[esp+18]
 0003D36C    mov         edx,esp
 0003D36E    mov         eax,ebx
 0003D370    call        TControl.ScreenToClient
 0003D375    lea         eax,[esp+18]
 0003D379    call        PointToSmallPoint
 0003D37E    mov         dword ptr [esp+10],eax
 0003D382    xor         eax,eax
 0003D384    mov         dword ptr [esp+0C],eax
 0003D388    xor         eax,eax
 0003D38A    mov         dword ptr [esp+14],eax
 0003D38E    lea         edx,[esp+8]
 0003D392    mov         eax,ebx
 0003D394    mov         ecx,dword ptr [eax]
 0003D396    call        dword ptr [ecx-10]
 0003D399    mov         dword ptr [esp+8],202
 0003D3A1    lea         edx,[esp+8]
 0003D3A5    mov         eax,ebx
 0003D3A7    mov         ecx,dword ptr [eax]
 0003D3A9    call        dword ptr [ecx-10]
 0003D3AC    add         esp,20
 0003D3AF    pop         ebx
 0003D3B0    ret
*}
end;

//0003D3B4
procedure TCustomListBox.DrawItem(Index:Integer; Rect:TRect; State:TOwnerDrawState);
begin
{*
 0003D3B4    push        ebp
 0003D3B5    mov         ebp,esp
 0003D3B7    add         esp,0FFFFFFE8
 0003D3BA    push        ebx
 0003D3BB    push        esi
 0003D3BC    push        edi
 0003D3BD    xor         ebx,ebx
 0003D3BF    mov         dword ptr [ebp-18],ebx
 0003D3C2    mov         esi,ecx
 0003D3C4    lea         edi,[ebp-14]
 0003D3C7    mov         ecx,4
 0003D3CC    rep movs    dword ptr [edi],dword ptr [esi]
 0003D3CE    mov         edi,edx
 0003D3D0    mov         esi,eax
 0003D3D2    xor         eax,eax
 0003D3D4    push        ebp
 0003D3D5    push        3D4AD
 0003D3DA    push        dword ptr fs:[eax]
 0003D3DD    mov         dword ptr fs:[eax],esp
 0003D3E0    cmp         word ptr [esi+21A],0
>0003D3E8    je          0003D407
 0003D3EA    lea         eax,[ebp-14]
 0003D3ED    push        eax
 0003D3EE    mov         al,byte ptr [ebp+8]
 0003D3F1    push        eax
 0003D3F2    mov         ecx,edi
 0003D3F4    mov         edx,esi
 0003D3F6    mov         eax,dword ptr [esi+21C]
 0003D3FC    call        dword ptr [esi+218]
>0003D402    jmp         0003D497
 0003D407    lea         edx,[ebp-14]
 0003D40A    mov         eax,dword ptr [esi+1F4]
 0003D410    call        TCanvas.FillRect
 0003D415    mov         eax,dword ptr [esi+1EC]
 0003D41B    mov         edx,dword ptr [eax]
 0003D41D    call        dword ptr [edx+14]
 0003D420    cmp         edi,eax
>0003D422    jge         0003D497
 0003D424    mov         edx,24
 0003D429    mov         eax,esi
 0003D42B    call        TControl.DrawTextBiDiModeFlags
 0003D430    mov         dword ptr [ebp-4],eax
 0003D433    mov         eax,esi
 0003D435    mov         bx,0FFCF
 0003D439    call        @CallDynaInst
 0003D43E    test        al,al
>0003D440    jne         0003D448
 0003D442    add         dword ptr [ebp-14],2
>0003D446    jmp         0003D44C
 0003D448    sub         dword ptr [ebp-0C],2
 0003D44C    mov         eax,dword ptr [ebp-4]
 0003D44F    push        eax
 0003D450    lea         eax,[ebp-14]
 0003D453    push        eax
 0003D454    lea         ecx,[ebp-18]
 0003D457    mov         edx,edi
 0003D459    mov         eax,dword ptr [esi+1EC]
 0003D45F    mov         ebx,dword ptr [eax]
 0003D461    call        dword ptr [ebx+0C]
 0003D464    mov         eax,dword ptr [ebp-18]
 0003D467    call        @LStrLen
 0003D46C    push        eax
 0003D46D    lea         ecx,[ebp-18]
 0003D470    mov         edx,edi
 0003D472    mov         eax,dword ptr [esi+1EC]
 0003D478    mov         ebx,dword ptr [eax]
 0003D47A    call        dword ptr [ebx+0C]
 0003D47D    mov         eax,dword ptr [ebp-18]
 0003D480    call        @LStrToPChar
 0003D485    push        eax
 0003D486    mov         eax,dword ptr [esi+1F4]
 0003D48C    call        TCanvas.GetHandle
 0003D491    push        eax
 0003D492    call        user32.DrawTextA
 0003D497    xor         eax,eax
 0003D499    pop         edx
 0003D49A    pop         ecx
 0003D49B    pop         ecx
 0003D49C    mov         dword ptr fs:[eax],edx
 0003D49F    push        3D4B4
 0003D4A4    lea         eax,[ebp-18]
 0003D4A7    call        @LStrClr
 0003D4AC    ret
>0003D4AD    jmp         @HandleFinally
>0003D4B2    jmp         0003D4A4
 0003D4B4    pop         edi
 0003D4B5    pop         esi
 0003D4B6    pop         ebx
 0003D4B7    mov         esp,ebp
 0003D4B9    pop         ebp
 0003D4BA    ret         4
*}
end;

//0003D4C0
procedure TCustomListBox.MeasureItem(Index:Integer; var Height:Integer);
begin
{*
 0003D4C0    push        ebx
 0003D4C1    cmp         word ptr [eax+222],0
>0003D4C9    je          0003D4DE
 0003D4CB    push        ecx
 0003D4CC    mov         ebx,eax
 0003D4CE    mov         ecx,edx
 0003D4D0    mov         edx,eax
 0003D4D2    mov         eax,dword ptr [ebx+224]
 0003D4D8    call        dword ptr [ebx+220]
 0003D4DE    pop         ebx
 0003D4DF    ret
*}
end;

//0003D4E0
procedure TCustomListBox.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 0003D4E0    push        ebx
 0003D4E1    push        esi
 0003D4E2    push        edi
 0003D4E3    push        ebp
 0003D4E4    push        ecx
 0003D4E5    mov         esi,eax
 0003D4E7    mov         edi,dword ptr [edx+8]
 0003D4EA    mov         al,byte ptr [edi+10]
 0003D4ED    mov         byte ptr [esp],al
 0003D4F0    mov         edx,dword ptr [edi+18]
 0003D4F3    mov         eax,dword ptr [esi+1F4]
 0003D4F9    call        TCanvas.SetHandle
 0003D4FE    mov         edx,dword ptr [esi+58]
 0003D501    mov         eax,dword ptr [esi+1F4]
 0003D507    call        TCanvas.SetFont
 0003D50C    mov         edx,dword ptr [esi+124]
 0003D512    mov         eax,dword ptr [esi+1F4]
 0003D518    call        TCanvas.SetBrush
 0003D51D    cmp         dword ptr [edi+8],0
>0003D521    jl          0003D54F
 0003D523    test        byte ptr [esp],1
>0003D527    je          0003D54F
 0003D529    mov         eax,dword ptr [esi+1F4]
 0003D52F    mov         eax,dword ptr [eax+14]
 0003D532    mov         edx,8000000D
 0003D537    call        TBrush.SetColor
 0003D53C    mov         eax,dword ptr [esi+1F4]
 0003D542    mov         eax,dword ptr [eax+0C]
 0003D545    mov         edx,8000000E
 0003D54A    call        TFont.SetColor
 0003D54F    mov         ebp,dword ptr [edi+8]
 0003D552    test        ebp,ebp
>0003D554    jl          0003D56B
 0003D556    mov         al,byte ptr [esp]
 0003D559    push        eax
 0003D55A    lea         ecx,[edi+1C]
 0003D55D    mov         edx,ebp
 0003D55F    mov         eax,esi
 0003D561    mov         ebx,dword ptr [eax]
 0003D563    call        dword ptr [ebx+0B8]
>0003D569    jmp         0003D579
 0003D56B    lea         edx,[edi+1C]
 0003D56E    mov         eax,dword ptr [esi+1F4]
 0003D574    call        TCanvas.FillRect
 0003D579    test        byte ptr [esp],10
>0003D57D    je          0003D58C
 0003D57F    lea         eax,[edi+1C]
 0003D582    push        eax
 0003D583    mov         eax,dword ptr [edi+18]
 0003D586    push        eax
 0003D587    call        user32.DrawFocusRect
 0003D58C    xor         edx,edx
 0003D58E    mov         eax,dword ptr [esi+1F4]
 0003D594    call        TCanvas.SetHandle
 0003D599    pop         edx
 0003D59A    pop         ebp
 0003D59B    pop         edi
 0003D59C    pop         esi
 0003D59D    pop         ebx
 0003D59E    ret
*}
end;

//0003D5A0
procedure TCustomListBox.CNMeasureItem(var Message:TWMMeasureItem);
begin
{*
 0003D5A0    push        ebx
 0003D5A1    push        esi
 0003D5A2    mov         esi,eax
 0003D5A4    mov         eax,dword ptr [edx+8]
 0003D5A7    mov         edx,dword ptr [esi+1FC]
 0003D5AD    mov         dword ptr [eax+10],edx
 0003D5B0    cmp         byte ptr [esi+200],2
>0003D5B7    jne         0003D5C9
 0003D5B9    lea         ecx,[eax+10]
 0003D5BC    mov         edx,dword ptr [eax+8]
 0003D5BF    mov         eax,esi
 0003D5C1    mov         ebx,dword ptr [eax]
 0003D5C3    call        dword ptr [ebx+0BC]
 0003D5C9    pop         esi
 0003D5CA    pop         ebx
 0003D5CB    ret
*}
end;

//0003D5CC
procedure TCustomListBox.CMCtl3DChanged(var Message:TMessage);
begin
{*
 0003D5CC    push        ebx
 0003D5CD    push        esi
 0003D5CE    mov         esi,edx
 0003D5D0    mov         ebx,eax
 0003D5D2    mov         eax,[000B58C0];NewStyleControls:Boolean
 0003D5D7    cmp         byte ptr [eax],0
>0003D5DA    je          0003D5EC
 0003D5DC    cmp         byte ptr [ebx+1F0],1
>0003D5E3    jne         0003D5EC
 0003D5E5    mov         eax,ebx
 0003D5E7    call        TWinControl.RecreateWnd
 0003D5EC    mov         edx,esi
 0003D5EE    mov         eax,ebx
 0003D5F0    call        TWinControl.CMCtl3DChanged
 0003D5F5    pop         esi
 0003D5F6    pop         ebx
 0003D5F7    ret
*}
end;

end.