//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Menus;

interface

uses
  SysUtils, Classes, Menus, Graphics, CMiVCL, ImgList;

type
  EMenuError = class(Exception)
  end;
  TMenuBreak = (mbNone, mbBreak, mbBarBreak);
  TMenuChangeEvent = procedure(Sender:TObject; Source:TMenuItem; Rebuild:Boolean) of object;;
  TMenuDrawItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; ARect:TRect; Selected:Boolean) of object;;
  TMenuMeasureItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; var Width:Integer; var Height:Integer) of object;;
  TMenuActionLink = class(TActionLink)
  public
    FClient:TMenuItem;//f10
    procedure AssignClient(AClient:TObject); virtual;//v0//00050C64
    function IsOnExecuteLinked:Boolean; virtual;//v8//00050E0C
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v10//00050F30
    function IsCaptionLinked:Boolean; virtual;//v1C//00050C80
    function IsCheckedLinked:Boolean; virtual;//v20//00050CB4
    function IsEnabledLinked:Boolean; virtual;//v24//00050CE4
    function IsHelpContextLinked:Boolean; virtual;//v28//00050D14
    function IsHintLinked:Boolean; virtual;//v2C//00050D44
    function IsImageIndexLinked:Boolean; virtual;//v30//00050D78
    function IsShortCutLinked:Boolean; virtual;//v34//00050DA8
    function IsVisibleLinked:Boolean; virtual;//v38//00050DDC
    procedure SetCaption(const Value:AnsiString); virtual;//v3C//00050E30
    procedure SetChecked(Value:Boolean); virtual;//v40//00050E50
    procedure SetEnabled(Value:Boolean); virtual;//v44//00050E70
    procedure SetHelpContext(Value:THelpContext); virtual;//v48//00050E90
    procedure SetHint(const Value:AnsiString); virtual;//v4C//00050EAC
    procedure SetImageIndex(Value:Integer); virtual;//v50//00050ED0
    procedure SetShortCut(Value:TShortCut); virtual;//v54//00050EF0
    procedure SetVisible(Value:Boolean); virtual;//v58//00050F10
  end;
  TMenuItem = class(TComponent)
  public
    Caption:String;//f24
    FHandle:HMENU;//f28
    Checked:Boolean;//f2C
    Enabled:Boolean;//f2D
    Default:Boolean;//f2E
    RadioItem:Boolean;//f2F
    Visible:Boolean;//f30
    GroupIndex:Byte;//f31
    ImageIndex:Integer;//f34
    FActionLink:TMenuActionLink;//f38
    Break:TMenuBreak;//f3C
    FBitmap:TBitmap;//f40
    FCommand:Word;//f44
    HelpContext:THelpContext;//f48
    Hint:String;//f4C
    FItems:TList;//f50
    ShortCut:TShortCut;//f54
    FParent:TMenuItem;//f58
    FMerged:TMenuItem;//f5C
    FMergedWith:TMenuItem;//f60
    FMenu:TMenu;//f64
    FStreamedRebuild:Boolean;//f68
    FOnChange:TMenuChangeEvent;//f6C
    OnClick:TNotifyEvent;//f74
    f78:TMRUFiles;//f78
    OnDrawItem:TMenuDrawItemEvent;//f7C
    f80:dword;//f80
    OnMeasureItem:TMenuMeasureItemEvent;//f84
    f88:dword;//f88
    destructor Destroy; virtual;//00050FA8
    procedure AssignTo(Dest:TPersistent); virtual;//v0//000529C0
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0005157C
    procedure Loaded; virtual;//vC//000513A0
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00052A34
    constructor Create(AOwner:TComponent); virtual;//v2C//00050F58
    procedure DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean); virtual;//v30//000517D4
    procedure MenuChanged(Rebuild:Boolean); virtual;//v34//0005256C
    procedure InitiateAction; virtual;//v38//000522F4
    procedure Click; virtual;//v3C//00052468
    procedure sub_00052160; dynamic;//00052160
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//0005279C
    procedure HasParent; dynamic;//00051FB4
    procedure GetParentComponent; dynamic;//000526F8
    procedure SetParentComponent(Value:TComponent); dynamic;//0005270C
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//00052278
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00052240
    procedure AppendTo(Menu:HMENU; ARightToLeft:Boolean);//0005104C
    procedure PopulateMenu;//000512E4
    procedure ReadShortCutText(Reader:TReader);//00051324
    procedure MergeWith(Menu:TMenuItem);//0005137C
    procedure RebuildHandle;//000513DC
    procedure VerifyGroupIndex(Position:Integer; Value:Byte);//00051438
    procedure WriteShortCutText(Writer:TWriter);//000514E4
    function GetHandle:HMENU;//000514E8
    procedure DoDrawText(ACanvas:TCanvas; const ACaption:AnsiString; var Rect:TRect; Selected:Boolean; Flags:Longint);//000515C0
    procedure MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer);//00051DB8
    procedure SetBreak(Value:TMenuBreak);//00051FB8
    procedure SetCaption(const Value:AnsiString);//00051FD0
    procedure TurnSiblingsOff;//00051FF8
    procedure SetChecked(Value:Boolean);//00052040
    procedure SetEnabled(Value:Boolean);//00052094
    procedure SetGroupIndex(Value:Byte);//0005210C
    function GetAction:TBasicAction;//00052150
    function GetCount:Integer;//00052168
    function GetItem(Index:Integer):TMenuItem;//00052178
    procedure SetShortCut(Value:TShortCut);//00052198
    procedure SetVisible(Value:Boolean);//000521B0
    procedure SetImageIndex(Value:Integer);//000521C8
    function GetMenuIndex:Integer;//000521E0
    procedure SetMenuIndex(Value:Integer);//000521F8
    procedure SetDefault(Value:Boolean);//00052298
    procedure Insert(Index:Integer; Item:TMenuItem);//00052304
    procedure Delete(Index:Integer);//00052400
    function IndexOf(Item:TMenuItem):Integer;//000524C8
    procedure Add(Item:TMenuItem);//000524E0
    procedure Remove(Item:TMenuItem);//000524FC
    procedure SubItemChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//000525A8
    function GetBitmap:TBitmap;//00052600
    procedure SetAction(Value:TBasicAction);//00052628
    procedure SetBitmap(Value:TBitmap);//00052698
    procedure InitiateActions;//000526CC
    function GetParentMenu:TMenu;//00052760
    procedure SetRadioItem(Value:Boolean);//00052770
    procedure DoActionChange(Sender:TObject);//0005287C
    function IsCaptionStored(Value:String):Boolean;//000528A0
    function IsCheckedStored(Value:Boolean):Boolean;//000528C0
    function IsEnabledStored(Value:Boolean):Boolean;//000528E0
    function IsHintStored(Value:String):Boolean;//00052900
    function IsHelpContextStored(Value:THelpContext):Boolean;//00052920
    function IsImageIndexStored(Value:Integer):Boolean;//00052940
    function IsShortCutStored(Value:TShortCut):Boolean;//00052960
    function IsVisibleStored(Value:Boolean):Boolean;//00052980
    function IsOnClickStored(Value:TNotifyEvent):Boolean;//000529A0
  end;
  TMenu = class(TComponent)
  public
    FBiDiMode:TBiDiMode;//f24
    Items:TMenuItem;//f28
    FWindowHandle:HWND;//f2C
    FMenuImage:String;//f30
    FOwnerDraw:Boolean;//f34
    FParentBiDiMode:Boolean;//f35
    FImageChangeLink:TChangeLink;//f38
    FImages:TCustomImageList;//f3C
    FOnChange:TMenuChangeEvent;//f40
    destructor Destroy; virtual;//00052AF4
    procedure Loaded; virtual;//vC//00053198
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00053230
    constructor Create(AOwner:TComponent); virtual;//v2C//00052A68
    procedure DoChange(Source:TMenuItem; Rebuild:Boolean); virtual;//v30//00053180
    function GetHandle:HMENU; virtual;//v34//00052B54
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean); virtual;//v38//000531B0
    procedure IsShortCut(var Message:TWMKey); dynamic;//00052E18
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//00052B60
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00052B2C
    procedure UpdateItems;//00052B98
    function FindItem(Value:Integer; Kind:TFindItemKind):TMenuItem;//00052C48
    function GetHelpContext(Value:Integer; ByCommand:Boolean):THelpContext;//00052C78
    function DispatchCommand(ACommand:Word):Boolean;//00052CE8
    function DispatchPopup(AHandle:HMENU):Boolean;//00052D04
    function IsOwnerDraw:Boolean;//00052D58
    procedure DoBiDiModeChanged;//00052E9C
    function UpdateImage:Boolean;//00053038
    procedure SetOwnerDraw(Value:Boolean);//000530BC
    procedure AdjustBiDiBehavior;//000530CC
    procedure SetWindowHandle(Value:HWND);//00053148
    procedure ImageListChange(Sender:TObject);//000531E8
    procedure SetImages(Value:TCustomImageList);//000531F4
    function IsRightToLeft:Boolean;//0005325C
    procedure ProcessMenuChar(var Message:TWMMenuChar);//00053394
    function DoGetMenuString(Menu:HMENU; ItemID:UINT; Str:PChar; MaxCount:Integer; Flag:UINT):Integer;//0005350C
    procedure SetBiDiMode(Value:TBiDiMode);//000535B4
    procedure SetParentBiDiMode(Value:Boolean);//000535C8
    procedure ParentBiDiModeChanged;//000535D8
    procedure ParentBiDiModeChanged(AControl:TObject);//00053600
  end;
  TMainMenu = class(TMenu)
  public
    FOle2Menu:HMENU;//f48
    AutoMerge:Boolean;//f4C
    function GetHandle:HMENU; virtual;//v34//000536EC
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean); virtual;//v38//0005364C
    procedure IsStoredBiDiMode(Value:TBiDiMode);//00052E94
    procedure SetAutoMerge(Value:Boolean);//0005362C
    procedure Merge(Menu:TMainMenu);//00053688
    procedure Unmerge(Menu:TMainMenu);//000536A4
    procedure ItemChanged;//000536C0
  end;
  TPopupAlignment = (paLeft, paRight, paCenter);
  TPopupMenu = class(TMenu)
  public
    FPopupPoint:TPoint;//f48
    Alignment:TPopupAlignment;//f50
    AutoPopup:Boolean;//f51
    FPopupComponent:TComponent;//f54
    FTrackButton:TTrackButton;//f58
    OnPopup:TNotifyEvent;//f5C
    destructor Destroy; virtual;//00053E7C
    constructor Create(AOwner:TComponent); virtual;//v2C//00053E0C
    procedure Popup(X:Integer; Y:Integer); virtual;//v3C//00053F68
    procedure DoPopup(Item:TObject);//00053EB0
    function GetHelpContext:THelpContext;//00053EC4
    procedure SetHelpContext(Value:THelpContext);//00053ECC
    procedure SetBiDiModeFromPopupControl;//00053ED4
    function UseRightToLeftAlignment:Boolean;//00053F1C
  end;
  TPopupList = class(TList)
  public
    Window:HWND;//f10
    procedure WndProc(var Message:TMessage);//000537A0
    procedure Add(Popup:TPopupMenu);//00053DC8
    procedure Remove(Popup:TPopupMenu);//00053DF0
  end;
    function FindPopupControl(const Pos:TPoint):TControl;//00050654
    procedure Error(const S:AnsiString);//00050684
    procedure IndexError;//0005069C
    function ShortCut(Key:Word; Shift:TShiftState):TShortCut;//000506E4
    function GetSpecialName(ShortCut:TShortCut):AnsiString;//0005071C
    function ShortCutToText(ShortCut:TShortCut):AnsiString;//00050784
    function CompareFront(var Text:AnsiString; const Front:AnsiString):Boolean;//00050988
    function TextToShortCut(Text:AnsiString):TShortCut;//000509E4
    function UniqueCommand:Word;//00050ADC
    function Iterate(var I:Integer; MenuItem:TMenuItem; AFunc:Pointer):Boolean;//00050AFC
    procedure IterateMenus(Func:Pointer; Menu1:TMenuItem; Menu2:TMenuItem);//00050B5C
    procedure AssignClient(AClient:TObject);//00050C64
    function IsCaptionLinked:Boolean;//00050C80
    function IsCheckedLinked:Boolean;//00050CB4
    function IsEnabledLinked:Boolean;//00050CE4
    function IsHelpContextLinked:Boolean;//00050D14
    function IsHintLinked:Boolean;//00050D44
    function IsImageIndexLinked:Boolean;//00050D78
    function IsShortCutLinked:Boolean;//00050DA8
    function IsVisibleLinked:Boolean;//00050DDC
    function IsOnExecuteLinked:Boolean;//00050E0C
    procedure SetCaption(const Value:AnsiString);//00050E30
    procedure SetChecked(Value:Boolean);//00050E50
    procedure SetEnabled(Value:Boolean);//00050E70
    procedure SetHelpContext(Value:THelpContext);//00050E90
    procedure SetHint(const Value:AnsiString);//00050EAC
    procedure SetImageIndex(Value:Integer);//00050ED0
    procedure SetShortCut(Value:TShortCut);//00050EF0
    procedure SetVisible(Value:Boolean);//00050F10
    procedure SetOnExecute(Value:TNotifyEvent);//00050F30
    constructor Create(AOwner:TComponent);//00050F58
    destructor Destroy;//00050FA8
    function AddIn(MenuItem:TMenuItem):Boolean;//000512C8
    procedure Loaded;//000513A0
    procedure DefineProperties(Filer:TFiler);//0005157C
    procedure DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean);//000517D4
    procedure GetMenuSize;//00051D6C
    procedure HasParent;//00051FB4
    procedure sub_00052160;//00052160
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00052240
    procedure SetChildOrder(Child:TComponent; Order:Integer);//00052278
    procedure InitiateAction;//000522F4
    procedure Click;//00052468
    procedure MenuChanged(Rebuild:Boolean);//0005256C
    procedure GetParentComponent;//000526F8
    procedure SetParentComponent(Value:TComponent);//0005270C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//0005279C
    procedure AssignTo(Dest:TPersistent);//000529C0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00052A34
    constructor Create(AOwner:TComponent);//00052A68
    destructor Destroy;//00052AF4
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00052B2C
    function GetHandle:HMENU;//00052B54
    procedure SetChildOrder(Child:TComponent; Order:Integer);//00052B60
    function UpdateItem(MenuItem:TMenuItem):Boolean;//00052B70
    function Find(Item:TMenuItem):Boolean;//00052BB0
    function DoClick(Item:TMenuItem):TClickResult;//00052D6C
    procedure IsShortCut(var Message:TWMKey);//00052E18
    procedure BuildImage(Menu:HMENU);//00052F58
    procedure DoChange(Source:TMenuItem; Rebuild:Boolean);//00053180
    procedure Loaded;//00053198
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//000531B0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00053230
    function IsAccelChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;//00053274
    function IsInitialChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;//000532D0
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//0005364C
    function GetHandle:HMENU;//000536EC
    function GetMenuFont:HFONT;//0005375C
    constructor Create(AOwner:TComponent);//00053E0C
    destructor Destroy;//00053E7C
    procedure Popup(X:Integer; Y:Integer);//00053F68
    function NewItem(const ACaption:AnsiString; AShortCut:TShortCut; AChecked:Boolean; AEnabled:Boolean; AOnClick:TNotifyEvent; hCtx:Word; const AName:AnsiString):TMenuItem;//00053FFC
    procedure _NF__488;//00054068

implementation

//00050654
function FindPopupControl(const Pos:TPoint):TControl;
begin
{*
 00050654    push        ebx
 00050655    push        esi
 00050656    push        edi
 00050657    mov         edi,eax
 00050659    xor         esi,esi
 0005065B    mov         eax,edi
 0005065D    call        FindVCLWindow
 00050662    mov         ebx,eax
 00050664    test        ebx,ebx
>00050666    je          0005067B
 00050668    mov         edx,edi
 0005066A    xor         ecx,ecx
 0005066C    mov         eax,ebx
 0005066E    call        TWinControl.ControlAtPos
 00050673    mov         esi,eax
 00050675    test        esi,esi
>00050677    jne         0005067B
 00050679    mov         esi,ebx
 0005067B    mov         eax,esi
 0005067D    pop         edi
 0005067E    pop         esi
 0005067F    pop         ebx
 00050680    ret
*}
end;

//00050684
procedure Error(const S:AnsiString);
begin
{*
 00050684    push        ebx
 00050685    mov         ebx,eax
 00050687    mov         ecx,ebx
 00050689    mov         dl,1
 0005068B    mov         eax,[0004FBF4];EMenuError
 00050690    call        Exception.Create
 00050695    call        @RaiseExcept
 0005069A    pop         ebx
 0005069B    ret
*}
end;

//0005069C
procedure IndexError;
begin
{*
 0005069C    push        ebp
 0005069D    mov         ebp,esp
 0005069F    push        0
 000506A1    xor         eax,eax
 000506A3    push        ebp
 000506A4    push        506DA
 000506A9    push        dword ptr fs:[eax]
 000506AC    mov         dword ptr fs:[eax],esp
 000506AF    lea         edx,[ebp-4]
 000506B2    mov         eax,[000B5880];^SMenuIndexError:TResStringRec
 000506B7    call        LoadResString
 000506BC    mov         eax,dword ptr [ebp-4]
 000506BF    call        Error
 000506C4    xor         eax,eax
 000506C6    pop         edx
 000506C7    pop         ecx
 000506C8    pop         ecx
 000506C9    mov         dword ptr fs:[eax],edx
 000506CC    push        506E1
 000506D1    lea         eax,[ebp-4]
 000506D4    call        @LStrClr
 000506D9    ret
>000506DA    jmp         @HandleFinally
>000506DF    jmp         000506D1
 000506E1    pop         ecx
 000506E2    pop         ebp
 000506E3    ret
*}
end;

//000506E4
function ShortCut(Key:Word; Shift:TShiftState):TShortCut;
begin
{*
 000506E4    push        ebp
 000506E5    mov         ebp,esp
 000506E7    push        ecx
 000506E8    mov         byte ptr [ebp-3],dl
 000506EB    mov         word ptr [ebp-2],ax
 000506EF    xor         eax,eax
 000506F1    cmp         byte ptr [ebp-1],0
>000506F5    jne         00050719
 000506F7    mov         ax,word ptr [ebp-2]
 000506FB    test        byte ptr [ebp-3],1
>000506FF    je          00050705
 00050701    add         ax,2000
 00050705    test        byte ptr [ebp-3],4
>00050709    je          0005070F
 0005070B    add         ax,4000
 0005070F    test        byte ptr [ebp-3],2
>00050713    je          00050719
 00050715    add         ax,8000
 00050719    pop         ecx
 0005071A    pop         ebp
 0005071B    ret
*}
end;

//0005071C
function GetSpecialName(ShortCut:TShortCut):AnsiString;
begin
{*
 0005071C    push        ebp
 0005071D    mov         ebp,esp
 0005071F    add         esp,0FFFFFEFC
 00050725    push        ebx
 00050726    mov         ebx,edx
 00050728    mov         word ptr [ebp-2],ax
 0005072C    mov         eax,ebx
 0005072E    call        @LStrClr
 00050733    push        0
 00050735    xor         eax,eax
 00050737    mov         al,byte ptr [ebp-2]
 0005073A    push        eax
 0005073B    call        user32.MapVirtualKeyA
 00050740    shl         eax,10
 00050743    test        eax,eax
>00050745    je          0005077D
 00050747    push        100
 0005074C    lea         edx,[ebp-102]
 00050752    push        edx
 00050753    push        eax
 00050754    call        user32.GetKeyNameTextA
 00050759    cmp         byte ptr [ebp-101],0
>00050760    jne         0005077D
 00050762    cmp         byte ptr [ebp-102],0
>00050769    je          0005077D
 0005076B    mov         eax,ebx
 0005076D    lea         edx,[ebp-102]
 00050773    mov         ecx,100
 00050778    call        @LStrFromArray
 0005077D    pop         ebx
 0005077E    mov         esp,ebp
 00050780    pop         ebp
 00050781    ret
*}
end;

//00050784
function ShortCutToText(ShortCut:TShortCut):AnsiString;
begin
{*
 00050784    push        ebp
 00050785    mov         ebp,esp
 00050787    push        0
 00050789    push        0
 0005078B    push        0
 0005078D    push        ebx
 0005078E    push        esi
 0005078F    mov         esi,edx
 00050791    mov         word ptr [ebp-2],ax
 00050795    xor         eax,eax
 00050797    push        ebp
 00050798    push        5096D
 0005079D    push        dword ptr fs:[eax]
 000507A0    mov         dword ptr fs:[eax],esp
 000507A3    mov         bl,byte ptr [ebp-2]
 000507A6    xor         eax,eax
 000507A8    mov         al,bl
 000507AA    cmp         eax,2D
>000507AD    jge         000507D6
 000507AF    add         eax,0FFFFFFF8
 000507B2    sub         eax,2
>000507B5    jb          0005081F
 000507B7    sub         eax,3
>000507BA    je          00050837
 000507BC    sub         eax,0E
>000507BF    je          0005084A
 000507C5    add         eax,0FFFFFFFB
 000507C8    sub         eax,9
>000507CB    jb          0005085D
>000507D1    jmp         000508ED
 000507D6    cmp         eax,41
>000507D9    jge         000507F6
 000507DB    add         eax,0FFFFFFD3
 000507DE    sub         eax,2
>000507E1    jb          00050878
 000507E7    dec         eax
 000507E8    sub         eax,0A
>000507EB    jb          00050890
>000507F1    jmp         000508ED
 000507F6    add         eax,0FFFFFFBF
 000507F9    sub         eax,1A
>000507FC    jb          000508A4
 00050802    add         eax,0FFFFFFFB
 00050805    sub         eax,0A
>00050808    jb          000508B8
 0005080E    add         eax,0FFFFFFFA
 00050811    sub         eax,18
>00050814    jb          000508CC
>0005081A    jmp         000508ED
 0005081F    lea         eax,[ebp-8]
 00050822    xor         edx,edx
 00050824    mov         dl,bl
 00050826    mov         edx,dword ptr [edx*4+0B48A4]
 0005082D    call        @LStrLAsg
>00050832    jmp         000508F9
 00050837    lea         eax,[ebp-8]
 0005083A    mov         edx,dword ptr ds:[0B48D0]
 00050840    call        @LStrLAsg
>00050845    jmp         000508F9
 0005084A    lea         eax,[ebp-8]
 0005084D    mov         edx,dword ptr ds:[0B48CC]
 00050853    call        @LStrLAsg
>00050858    jmp         000508F9
 0005085D    lea         eax,[ebp-8]
 00050860    add         bl,4
 00050863    xor         edx,edx
 00050865    mov         dl,bl
 00050867    mov         edx,dword ptr [edx*4+0B4844]
 0005086E    call        @LStrLAsg
>00050873    jmp         000508F9
 00050878    lea         eax,[ebp-8]
 0005087B    add         bl,0D
 0005087E    xor         edx,edx
 00050880    mov         dl,bl
 00050882    mov         edx,dword ptr [edx*4+0B4810]
 00050889    call        @LStrLAsg
>0005088E    jmp         000508F9
 00050890    lea         eax,[ebp-8]
 00050893    xor         edx,edx
 00050895    mov         dl,bl
 00050897    sub         edx,30
 0005089A    add         edx,30
 0005089D    call        @LStrFromChar
>000508A2    jmp         000508F9
 000508A4    lea         eax,[ebp-8]
 000508A7    xor         edx,edx
 000508A9    mov         dl,bl
 000508AB    sub         edx,41
 000508AE    add         edx,41
 000508B1    call        @LStrFromChar
>000508B6    jmp         000508F9
 000508B8    lea         eax,[ebp-8]
 000508BB    xor         edx,edx
 000508BD    mov         dl,bl
 000508BF    sub         edx,60
 000508C2    add         edx,30
 000508C5    call        @LStrFromChar
>000508CA    jmp         000508F9
 000508CC    xor         eax,eax
 000508CE    mov         al,bl
 000508D0    sub         eax,6F
 000508D3    lea         edx,[ebp-0C]
 000508D6    call        IntToStr
 000508DB    mov         ecx,dword ptr [ebp-0C]
 000508DE    lea         eax,[ebp-8]
 000508E1    mov         edx,50984;'F'
 000508E6    call        @LStrCat3
>000508EB    jmp         000508F9
 000508ED    lea         edx,[ebp-8]
 000508F0    mov         ax,word ptr [ebp-2]
 000508F4    call        GetSpecialName
 000508F9    cmp         dword ptr [ebp-8],0
>000508FD    je          0005094B
 000508FF    mov         eax,esi
 00050901    call        @LStrClr
 00050906    test        byte ptr [ebp-1],20
>0005090A    je          00050919
 0005090C    mov         eax,esi
 0005090E    mov         edx,dword ptr ds:[0B4900]
 00050914    call        @LStrCat
 00050919    test        byte ptr [ebp-1],40
>0005091D    je          0005092C
 0005091F    mov         eax,esi
 00050921    mov         edx,dword ptr ds:[0B4904]
 00050927    call        @LStrCat
 0005092C    test        byte ptr [ebp-1],80
>00050930    je          0005093F
 00050932    mov         eax,esi
 00050934    mov         edx,dword ptr ds:[0B4908]
 0005093A    call        @LStrCat
 0005093F    mov         eax,esi
 00050941    mov         edx,dword ptr [ebp-8]
 00050944    call        @LStrCat
>00050949    jmp         00050952
 0005094B    mov         eax,esi
 0005094D    call        @LStrClr
 00050952    xor         eax,eax
 00050954    pop         edx
 00050955    pop         ecx
 00050956    pop         ecx
 00050957    mov         dword ptr fs:[eax],edx
 0005095A    push        50974
 0005095F    lea         eax,[ebp-0C]
 00050962    mov         edx,2
 00050967    call        @LStrArrayClr
 0005096C    ret
>0005096D    jmp         @HandleFinally
>00050972    jmp         0005095F
 00050974    pop         esi
 00050975    pop         ebx
 00050976    mov         esp,ebp
 00050978    pop         ebp
 00050979    ret
*}
end;

//00050988
function CompareFront(var Text:AnsiString; const Front:AnsiString):Boolean;
begin
{*
 00050988    push        ebx
 00050989    push        esi
 0005098A    push        edi
 0005098B    mov         edi,edx
 0005098D    mov         esi,eax
 0005098F    xor         ebx,ebx
 00050991    mov         eax,dword ptr [esi]
 00050993    call        @LStrLen
 00050998    push        eax
 00050999    mov         eax,edi
 0005099B    call        @LStrLen
 000509A0    pop         edx
 000509A1    cmp         edx,eax
>000509A3    jl          000509DE
 000509A5    mov         eax,edi
 000509A7    call        @LStrLen
 000509AC    push        eax
 000509AD    mov         eax,edi
 000509AF    call        @LStrToPChar
 000509B4    push        eax
 000509B5    mov         eax,dword ptr [esi]
 000509B7    call        @LStrToPChar
 000509BC    pop         edx
 000509BD    pop         ecx
 000509BE    call        AnsiStrLIComp
 000509C3    test        eax,eax
>000509C5    jne         000509DE
 000509C7    mov         bl,1
 000509C9    mov         eax,edi
 000509CB    call        @LStrLen
 000509D0    mov         ecx,eax
 000509D2    mov         eax,esi
 000509D4    mov         edx,1
 000509D9    call        @LStrDelete
 000509DE    mov         eax,ebx
 000509E0    pop         edi
 000509E1    pop         esi
 000509E2    pop         ebx
 000509E3    ret
*}
end;

//000509E4
function TextToShortCut(Text:AnsiString):TShortCut;
begin
{*
 000509E4    push        ebp
 000509E5    mov         ebp,esp
 000509E7    add         esp,0FFFFFFF8
 000509EA    push        ebx
 000509EB    push        esi
 000509EC    push        edi
 000509ED    xor         edx,edx
 000509EF    mov         dword ptr [ebp-8],edx
 000509F2    mov         dword ptr [ebp-4],eax
 000509F5    mov         eax,dword ptr [ebp-4]
 000509F8    call        @LStrAddRef
 000509FD    xor         eax,eax
 000509FF    push        ebp
 00050A00    push        50ABF
 00050A05    push        dword ptr fs:[eax]
 00050A08    mov         dword ptr fs:[eax],esp
 00050A0B    xor         edi,edi
 00050A0D    xor         esi,esi
 00050A0F    lea         eax,[ebp-4]
 00050A12    mov         edx,dword ptr ds:[0B4900]
 00050A18    call        CompareFront
 00050A1D    test        al,al
>00050A1F    je          00050A28
 00050A21    or          si,2000
>00050A26    jmp         00050A0F
 00050A28    lea         eax,[ebp-4]
 00050A2B    mov         edx,50AD8;'^'
 00050A30    call        CompareFront
 00050A35    test        al,al
>00050A37    je          00050A40
 00050A39    or          si,4000
>00050A3E    jmp         00050A0F
 00050A40    lea         eax,[ebp-4]
 00050A43    mov         edx,dword ptr ds:[0B4904]
 00050A49    call        CompareFront
 00050A4E    test        al,al
>00050A50    je          00050A59
 00050A52    or          si,4000
>00050A57    jmp         00050A0F
 00050A59    lea         eax,[ebp-4]
 00050A5C    mov         edx,dword ptr ds:[0B4908]
 00050A62    call        CompareFront
 00050A67    test        al,al
>00050A69    je          00050A72
 00050A6B    or          si,8000
>00050A70    jmp         00050A0F
 00050A72    cmp         dword ptr [ebp-4],0
>00050A76    je          00050AA4
 00050A78    mov         bx,8
 00050A7C    lea         edx,[ebp-8]
 00050A7F    mov         eax,ebx
 00050A81    call        ShortCutToText
 00050A86    mov         edx,dword ptr [ebp-8]
 00050A89    mov         eax,dword ptr [ebp-4]
 00050A8C    call        AnsiCompareText
 00050A91    test        eax,eax
>00050A93    jne         00050A9C
 00050A95    mov         edi,esi
 00050A97    or          di,bx
>00050A9A    jmp         00050AA4
 00050A9C    inc         ebx
 00050A9D    cmp         bx,256
>00050AA2    jne         00050A7C
 00050AA4    xor         eax,eax
 00050AA6    pop         edx
 00050AA7    pop         ecx
 00050AA8    pop         ecx
 00050AA9    mov         dword ptr fs:[eax],edx
 00050AAC    push        50AC6
 00050AB1    lea         eax,[ebp-8]
 00050AB4    mov         edx,2
 00050AB9    call        @LStrArrayClr
 00050ABE    ret
>00050ABF    jmp         @HandleFinally
>00050AC4    jmp         00050AB1
 00050AC6    mov         eax,edi
 00050AC8    pop         edi
 00050AC9    pop         esi
 00050ACA    pop         ebx
 00050ACB    pop         ecx
 00050ACC    pop         ecx
 00050ACD    pop         ebp
 00050ACE    ret
*}
end;

//00050ADC
function UniqueCommand:Word;
begin
{*
 00050ADC    push        ebx
 00050ADD    mov         eax,[000B67A8]
 00050AE2    call        TBits.OpenBit
 00050AE7    mov         ebx,eax
 00050AE9    movzx       edx,bx
 00050AEC    mov         cl,1
 00050AEE    mov         eax,[000B67A8]
 00050AF3    call        TBits.SetBit
 00050AF8    mov         eax,ebx
 00050AFA    pop         ebx
 00050AFB    ret
*}
end;

//00050AFC
function Iterate(var I:Integer; MenuItem:TMenuItem; AFunc:Pointer):Boolean;
begin
{*
 00050AFC    push        ebp
 00050AFD    mov         ebp,esp
 00050AFF    add         esp,0FFFFFFF4
 00050B02    push        ebx
 00050B03    push        esi
 00050B04    mov         dword ptr [ebp-8],ecx
 00050B07    mov         esi,edx
 00050B09    mov         ebx,eax
 00050B0B    test        esi,esi
>00050B0D    je          00050B53
 00050B0F    mov         byte ptr [ebp-9],0
>00050B13    jmp         00050B42
 00050B15    mov         edx,dword ptr [ebx]
 00050B17    mov         eax,esi
 00050B19    call        TMenuItem.GetItem
 00050B1E    mov         dword ptr [ebp-4],eax
 00050B21    mov         eax,dword ptr [ebp-4]
 00050B24    mov         al,byte ptr [eax+31]
 00050B27    mov         edx,dword ptr [ebp+8]
 00050B2A    cmp         al,byte ptr [edx-1]
>00050B2D    ja          00050B53
 00050B2F    mov         eax,dword ptr [ebp-4]
 00050B32    mov         edx,dword ptr [ebp+8]
 00050B35    push        dword ptr [edx]
 00050B37    call        dword ptr [ebp-8]
 00050B3A    add         esp,4
 00050B3D    mov         byte ptr [ebp-9],al
 00050B40    inc         dword ptr [ebx]
 00050B42    cmp         byte ptr [ebp-9],0
>00050B46    jne         00050B53
 00050B48    mov         eax,esi
 00050B4A    call        TMenuItem.GetCount
 00050B4F    cmp         eax,dword ptr [ebx]
>00050B51    jg          00050B15
 00050B53    mov         al,byte ptr [ebp-9]
 00050B56    pop         esi
 00050B57    pop         ebx
 00050B58    mov         esp,ebp
 00050B5A    pop         ebp
 00050B5B    ret
*}
end;

//00050B5C
procedure IterateMenus(Func:Pointer; Menu1:TMenuItem; Menu2:TMenuItem);
begin
{*
 00050B5C    push        ebp
 00050B5D    mov         ebp,esp
 00050B5F    add         esp,0FFFFFFE8
 00050B62    push        ebx
 00050B63    push        esi
 00050B64    push        edi
 00050B65    mov         dword ptr [ebp-0C],ecx
 00050B68    mov         edi,edx
 00050B6A    mov         dword ptr [ebp-8],eax
 00050B6D    xor         eax,eax
 00050B6F    mov         dword ptr [ebp-10],eax
 00050B72    xor         eax,eax
 00050B74    mov         dword ptr [ebp-14],eax
 00050B77    xor         ebx,ebx
 00050B79    xor         esi,esi
 00050B7B    test        edi,edi
>00050B7D    je          00050B88
 00050B7F    mov         eax,edi
 00050B81    call        TMenuItem.GetCount
 00050B86    mov         ebx,eax
 00050B88    cmp         dword ptr [ebp-0C],0
>00050B8C    je          00050B98
 00050B8E    mov         eax,dword ptr [ebp-0C]
 00050B91    call        TMenuItem.GetCount
 00050B96    mov         esi,eax
 00050B98    mov         byte ptr [ebp-16],0
>00050B9C    jmp         00050C42
 00050BA1    mov         byte ptr [ebp-1],0FF
 00050BA5    mov         byte ptr [ebp-15],0FF
 00050BA9    cmp         ebx,dword ptr [ebp-10]
>00050BAC    jle         00050BBE
 00050BAE    mov         edx,dword ptr [ebp-10]
 00050BB1    mov         eax,edi
 00050BB3    call        TMenuItem.GetItem
 00050BB8    mov         al,byte ptr [eax+31]
 00050BBB    mov         byte ptr [ebp-1],al
 00050BBE    cmp         esi,dword ptr [ebp-14]
>00050BC1    jle         00050BD4
 00050BC3    mov         edx,dword ptr [ebp-14]
 00050BC6    mov         eax,dword ptr [ebp-0C]
 00050BC9    call        TMenuItem.GetItem
 00050BCE    mov         al,byte ptr [eax+31]
 00050BD1    mov         byte ptr [ebp-15],al
 00050BD4    mov         al,byte ptr [ebp-1]
 00050BD7    cmp         al,byte ptr [ebp-15]
>00050BDA    ja          00050BF0
 00050BDC    push        ebp
 00050BDD    lea         eax,[ebp-10]
 00050BE0    mov         ecx,dword ptr [ebp-8]
 00050BE3    mov         edx,edi
 00050BE5    call        Iterate
 00050BEA    pop         ecx
 00050BEB    mov         byte ptr [ebp-16],al
>00050BEE    jmp         00050C0E
 00050BF0    mov         al,byte ptr [ebp-15]
 00050BF3    mov         byte ptr [ebp-1],al
 00050BF6    push        ebp
 00050BF7    lea         eax,[ebp-14]
 00050BFA    mov         ecx,dword ptr [ebp-8]
 00050BFD    mov         edx,dword ptr [ebp-0C]
 00050C00    call        Iterate
 00050C05    pop         ecx
 00050C06    mov         byte ptr [ebp-16],al
>00050C09    jmp         00050C0E
 00050C0B    inc         dword ptr [ebp-10]
 00050C0E    cmp         ebx,dword ptr [ebp-10]
>00050C11    jle         00050C2A
 00050C13    mov         edx,dword ptr [ebp-10]
 00050C16    mov         eax,edi
 00050C18    call        TMenuItem.GetItem
 00050C1D    mov         al,byte ptr [eax+31]
 00050C20    cmp         al,byte ptr [ebp-1]
>00050C23    jbe         00050C0B
>00050C25    jmp         00050C2A
 00050C27    inc         dword ptr [ebp-14]
 00050C2A    cmp         esi,dword ptr [ebp-14]
>00050C2D    jle         00050C42
 00050C2F    mov         edx,dword ptr [ebp-14]
 00050C32    mov         eax,dword ptr [ebp-0C]
 00050C35    call        TMenuItem.GetItem
 00050C3A    mov         al,byte ptr [eax+31]
 00050C3D    cmp         al,byte ptr [ebp-1]
>00050C40    jbe         00050C27
 00050C42    cmp         byte ptr [ebp-16],0
>00050C46    jne         00050C5A
 00050C48    cmp         ebx,dword ptr [ebp-10]
>00050C4B    jg          00050BA1
 00050C51    cmp         esi,dword ptr [ebp-14]
>00050C54    jg          00050BA1
 00050C5A    pop         edi
 00050C5B    pop         esi
 00050C5C    pop         ebx
 00050C5D    mov         esp,ebp
 00050C5F    pop         ebp
 00050C60    ret
*}
end;

//00050C64
procedure TMenuActionLink.AssignClient(AClient:TObject);
begin
{*
 00050C64    push        ebx
 00050C65    push        esi
 00050C66    mov         esi,edx
 00050C68    mov         ebx,eax
 00050C6A    mov         eax,esi
 00050C6C    mov         edx,dword ptr ds:[4FE44];TMenuItem
 00050C72    call        @AsClass
 00050C77    mov         dword ptr [ebx+10],eax
 00050C7A    pop         esi
 00050C7B    pop         ebx
 00050C7C    ret
*}
end;

//00050C80
function TMenuActionLink.IsCaptionLinked:Boolean;
begin
{*
 00050C80    push        ebx
 00050C81    mov         ebx,eax
 00050C83    mov         eax,ebx
 00050C85    call        TActionLink.IsCaptionLinked
 00050C8A    test        al,al
>00050C8C    je          00050CAC
 00050C8E    mov         eax,dword ptr [ebx+0C]
 00050C91    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050C97    call        @AsClass
 00050C9C    mov         edx,dword ptr [eax+4C]
 00050C9F    mov         eax,dword ptr [ebx+10]
 00050CA2    mov         eax,dword ptr [eax+24]
 00050CA5    call        @LStrCmp
>00050CAA    je          00050CB0
 00050CAC    xor         eax,eax
 00050CAE    pop         ebx
 00050CAF    ret
 00050CB0    mov         al,1
 00050CB2    pop         ebx
 00050CB3    ret
*}
end;

//00050CB4
function TMenuActionLink.IsCheckedLinked:Boolean;
begin
{*
 00050CB4    push        ebx
 00050CB5    mov         ebx,eax
 00050CB7    mov         eax,ebx
 00050CB9    call        TActionLink.IsCheckedLinked
 00050CBE    test        al,al
>00050CC0    je          00050CDB
 00050CC2    mov         eax,dword ptr [ebx+0C]
 00050CC5    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050CCB    call        @AsClass
 00050CD0    mov         al,byte ptr [eax+50]
 00050CD3    mov         edx,dword ptr [ebx+10]
 00050CD6    cmp         al,byte ptr [edx+2C]
>00050CD9    je          00050CDF
 00050CDB    xor         eax,eax
 00050CDD    pop         ebx
 00050CDE    ret
 00050CDF    mov         al,1
 00050CE1    pop         ebx
 00050CE2    ret
*}
end;

//00050CE4
function TMenuActionLink.IsEnabledLinked:Boolean;
begin
{*
 00050CE4    push        ebx
 00050CE5    mov         ebx,eax
 00050CE7    mov         eax,ebx
 00050CE9    call        TActionLink.IsEnabledLinked
 00050CEE    test        al,al
>00050CF0    je          00050D0B
 00050CF2    mov         eax,dword ptr [ebx+0C]
 00050CF5    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050CFB    call        @AsClass
 00050D00    mov         al,byte ptr [eax+51]
 00050D03    mov         edx,dword ptr [ebx+10]
 00050D06    cmp         al,byte ptr [edx+2D]
>00050D09    je          00050D0F
 00050D0B    xor         eax,eax
 00050D0D    pop         ebx
 00050D0E    ret
 00050D0F    mov         al,1
 00050D11    pop         ebx
 00050D12    ret
*}
end;

//00050D14
function TMenuActionLink.IsHelpContextLinked:Boolean;
begin
{*
 00050D14    push        ebx
 00050D15    mov         ebx,eax
 00050D17    mov         eax,ebx
 00050D19    call        TActionLink.IsHelpContextLinked
 00050D1E    test        al,al
>00050D20    je          00050D3B
 00050D22    mov         eax,dword ptr [ebx+0C]
 00050D25    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050D2B    call        @AsClass
 00050D30    mov         eax,dword ptr [eax+54]
 00050D33    mov         edx,dword ptr [ebx+10]
 00050D36    cmp         eax,dword ptr [edx+48]
>00050D39    je          00050D3F
 00050D3B    xor         eax,eax
 00050D3D    pop         ebx
 00050D3E    ret
 00050D3F    mov         al,1
 00050D41    pop         ebx
 00050D42    ret
*}
end;

//00050D44
function TMenuActionLink.IsHintLinked:Boolean;
begin
{*
 00050D44    push        ebx
 00050D45    mov         ebx,eax
 00050D47    mov         eax,ebx
 00050D49    call        TActionLink.IsHintLinked
 00050D4E    test        al,al
>00050D50    je          00050D70
 00050D52    mov         eax,dword ptr [ebx+0C]
 00050D55    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050D5B    call        @AsClass
 00050D60    mov         edx,dword ptr [eax+58]
 00050D63    mov         eax,dword ptr [ebx+10]
 00050D66    mov         eax,dword ptr [eax+4C]
 00050D69    call        @LStrCmp
>00050D6E    je          00050D74
 00050D70    xor         eax,eax
 00050D72    pop         ebx
 00050D73    ret
 00050D74    mov         al,1
 00050D76    pop         ebx
 00050D77    ret
*}
end;

//00050D78
function TMenuActionLink.IsImageIndexLinked:Boolean;
begin
{*
 00050D78    push        ebx
 00050D79    mov         ebx,eax
 00050D7B    mov         eax,ebx
 00050D7D    call        TActionLink.IsImageIndexLinked
 00050D82    test        al,al
>00050D84    je          00050D9F
 00050D86    mov         eax,dword ptr [ebx+0C]
 00050D89    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050D8F    call        @AsClass
 00050D94    mov         eax,dword ptr [eax+5C]
 00050D97    mov         edx,dword ptr [ebx+10]
 00050D9A    cmp         eax,dword ptr [edx+34]
>00050D9D    je          00050DA3
 00050D9F    xor         eax,eax
 00050DA1    pop         ebx
 00050DA2    ret
 00050DA3    mov         al,1
 00050DA5    pop         ebx
 00050DA6    ret
*}
end;

//00050DA8
function TMenuActionLink.IsShortCutLinked:Boolean;
begin
{*
 00050DA8    push        ebx
 00050DA9    mov         ebx,eax
 00050DAB    mov         eax,ebx
 00050DAD    call        TActionLink.IsShortCutLinked
 00050DB2    test        al,al
>00050DB4    je          00050DD1
 00050DB6    mov         eax,dword ptr [ebx+0C]
 00050DB9    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050DBF    call        @AsClass
 00050DC4    mov         ax,word ptr [eax+60]
 00050DC8    mov         edx,dword ptr [ebx+10]
 00050DCB    cmp         ax,word ptr [edx+54]
>00050DCF    je          00050DD5
 00050DD1    xor         eax,eax
 00050DD3    pop         ebx
 00050DD4    ret
 00050DD5    mov         al,1
 00050DD7    pop         ebx
 00050DD8    ret
*}
end;

//00050DDC
function TMenuActionLink.IsVisibleLinked:Boolean;
begin
{*
 00050DDC    push        ebx
 00050DDD    mov         ebx,eax
 00050DDF    mov         eax,ebx
 00050DE1    call        TActionLink.IsVisibleLinked
 00050DE6    test        al,al
>00050DE8    je          00050E03
 00050DEA    mov         eax,dword ptr [ebx+0C]
 00050DED    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00050DF3    call        @AsClass
 00050DF8    mov         al,byte ptr [eax+62]
 00050DFB    mov         edx,dword ptr [ebx+10]
 00050DFE    cmp         al,byte ptr [edx+30]
>00050E01    je          00050E07
 00050E03    xor         eax,eax
 00050E05    pop         ebx
 00050E06    ret
 00050E07    mov         al,1
 00050E09    pop         ebx
 00050E0A    ret
*}
end;

//00050E0C
function TMenuActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 00050E0C    push        ebx
 00050E0D    mov         ebx,eax
 00050E0F    mov         eax,ebx
 00050E11    call        TBasicActionLink.IsOnExecuteLinked
 00050E16    test        al,al
>00050E18    je          00050E28
 00050E1A    mov         eax,dword ptr [ebx+10]
 00050E1D    mov         eax,dword ptr [eax+74]
 00050E20    mov         edx,dword ptr [ebx+0C]
 00050E23    cmp         eax,dword ptr [edx+2C]
>00050E26    je          00050E2C
 00050E28    xor         eax,eax
 00050E2A    pop         ebx
 00050E2B    ret
 00050E2C    mov         al,1
 00050E2E    pop         ebx
 00050E2F    ret
*}
end;

//00050E30
procedure TMenuActionLink.SetCaption(const Value:AnsiString);
begin
{*
 00050E30    push        ebx
 00050E31    push        esi
 00050E32    mov         esi,edx
 00050E34    mov         ebx,eax
 00050E36    mov         eax,ebx
 00050E38    mov         edx,dword ptr [eax]
 00050E3A    call        dword ptr [edx+1C]
 00050E3D    test        al,al
>00050E3F    je          00050E4B
 00050E41    mov         edx,esi
 00050E43    mov         eax,dword ptr [ebx+10]
 00050E46    call        TMenuItem.SetCaption
 00050E4B    pop         esi
 00050E4C    pop         ebx
 00050E4D    ret
*}
end;

//00050E50
procedure TMenuActionLink.SetChecked(Value:Boolean);
begin
{*
 00050E50    push        ebx
 00050E51    push        esi
 00050E52    mov         ebx,edx
 00050E54    mov         esi,eax
 00050E56    mov         eax,esi
 00050E58    mov         edx,dword ptr [eax]
 00050E5A    call        dword ptr [edx+20]
 00050E5D    test        al,al
>00050E5F    je          00050E6B
 00050E61    mov         edx,ebx
 00050E63    mov         eax,dword ptr [esi+10]
 00050E66    call        TMenuItem.SetChecked
 00050E6B    pop         esi
 00050E6C    pop         ebx
 00050E6D    ret
*}
end;

//00050E70
procedure TMenuActionLink.SetEnabled(Value:Boolean);
begin
{*
 00050E70    push        ebx
 00050E71    push        esi
 00050E72    mov         ebx,edx
 00050E74    mov         esi,eax
 00050E76    mov         eax,esi
 00050E78    mov         edx,dword ptr [eax]
 00050E7A    call        dword ptr [edx+24]
 00050E7D    test        al,al
>00050E7F    je          00050E8B
 00050E81    mov         edx,ebx
 00050E83    mov         eax,dword ptr [esi+10]
 00050E86    call        TMenuItem.SetEnabled
 00050E8B    pop         esi
 00050E8C    pop         ebx
 00050E8D    ret
*}
end;

//00050E90
procedure TMenuActionLink.SetHelpContext(Value:THelpContext);
begin
{*
 00050E90    push        ebx
 00050E91    push        esi
 00050E92    mov         esi,edx
 00050E94    mov         ebx,eax
 00050E96    mov         eax,ebx
 00050E98    mov         edx,dword ptr [eax]
 00050E9A    call        dword ptr [edx+28]
 00050E9D    test        al,al
>00050E9F    je          00050EA7
 00050EA1    mov         eax,dword ptr [ebx+10]
 00050EA4    mov         dword ptr [eax+48],esi
 00050EA7    pop         esi
 00050EA8    pop         ebx
 00050EA9    ret
*}
end;

//00050EAC
procedure TMenuActionLink.SetHint(const Value:AnsiString);
begin
{*
 00050EAC    push        ebx
 00050EAD    push        esi
 00050EAE    mov         esi,edx
 00050EB0    mov         ebx,eax
 00050EB2    mov         eax,ebx
 00050EB4    mov         edx,dword ptr [eax]
 00050EB6    call        dword ptr [edx+2C]
 00050EB9    test        al,al
>00050EBB    je          00050ECA
 00050EBD    mov         eax,dword ptr [ebx+10]
 00050EC0    add         eax,4C
 00050EC3    mov         edx,esi
 00050EC5    call        @LStrAsg
 00050ECA    pop         esi
 00050ECB    pop         ebx
 00050ECC    ret
*}
end;

//00050ED0
procedure TMenuActionLink.SetImageIndex(Value:Integer);
begin
{*
 00050ED0    push        ebx
 00050ED1    push        esi
 00050ED2    mov         esi,edx
 00050ED4    mov         ebx,eax
 00050ED6    mov         eax,ebx
 00050ED8    mov         edx,dword ptr [eax]
 00050EDA    call        dword ptr [edx+30]
 00050EDD    test        al,al
>00050EDF    je          00050EEB
 00050EE1    mov         edx,esi
 00050EE3    mov         eax,dword ptr [ebx+10]
 00050EE6    call        TMenuItem.SetImageIndex
 00050EEB    pop         esi
 00050EEC    pop         ebx
 00050EED    ret
*}
end;

//00050EF0
procedure TMenuActionLink.SetShortCut(Value:TShortCut);
begin
{*
 00050EF0    push        ebx
 00050EF1    push        esi
 00050EF2    mov         esi,edx
 00050EF4    mov         ebx,eax
 00050EF6    mov         eax,ebx
 00050EF8    mov         edx,dword ptr [eax]
 00050EFA    call        dword ptr [edx+34]
 00050EFD    test        al,al
>00050EFF    je          00050F0B
 00050F01    mov         edx,esi
 00050F03    mov         eax,dword ptr [ebx+10]
 00050F06    call        TMenuItem.SetShortCut
 00050F0B    pop         esi
 00050F0C    pop         ebx
 00050F0D    ret
*}
end;

//00050F10
procedure TMenuActionLink.SetVisible(Value:Boolean);
begin
{*
 00050F10    push        ebx
 00050F11    push        esi
 00050F12    mov         ebx,edx
 00050F14    mov         esi,eax
 00050F16    mov         eax,esi
 00050F18    mov         edx,dword ptr [eax]
 00050F1A    call        dword ptr [edx+38]
 00050F1D    test        al,al
>00050F1F    je          00050F2B
 00050F21    mov         edx,ebx
 00050F23    mov         eax,dword ptr [esi+10]
 00050F26    call        TMenuItem.SetVisible
 00050F2B    pop         esi
 00050F2C    pop         ebx
 00050F2D    ret
*}
end;

//00050F30
procedure TMenuActionLink.SetOnExecute(Value:TNotifyEvent);
begin
{*
 00050F30    push        ebp
 00050F31    mov         ebp,esp
 00050F33    push        ebx
 00050F34    mov         ebx,eax
 00050F36    mov         eax,ebx
 00050F38    mov         edx,dword ptr [eax]
 00050F3A    call        dword ptr [edx+8]
 00050F3D    test        al,al
>00050F3F    je          00050F50
 00050F41    mov         eax,dword ptr [ebx+10]
 00050F44    mov         edx,dword ptr [ebp+8]
 00050F47    mov         dword ptr [eax+74],edx
 00050F4A    mov         edx,dword ptr [ebp+0C]
 00050F4D    mov         dword ptr [eax+78],edx
 00050F50    pop         ebx
 00050F51    pop         ebp
 00050F52    ret         8
*}
end;

//00050F58
constructor TMenuItem.Create(AOwner:TComponent);
begin
{*
 00050F58    push        ebx
 00050F59    push        esi
 00050F5A    test        dl,dl
>00050F5C    je          00050F66
 00050F5E    add         esp,0FFFFFFF0
 00050F61    call        @ClassCreate
 00050F66    mov         ebx,edx
 00050F68    mov         esi,eax
 00050F6A    xor         edx,edx
 00050F6C    mov         eax,esi
 00050F6E    call        TComponent.Create
 00050F73    mov         byte ptr [esi+30],1
 00050F77    mov         byte ptr [esi+2D],1
 00050F7B    call        UniqueCommand
 00050F80    mov         word ptr [esi+44],ax
 00050F84    mov         dword ptr [esi+34],0FFFFFFFF
 00050F8B    mov         eax,esi
 00050F8D    test        bl,bl
>00050F8F    je          00050FA0
 00050F91    call        @AfterConstruction
 00050F96    pop         dword ptr fs:[0]
 00050F9D    add         esp,0C
 00050FA0    mov         eax,esi
 00050FA2    pop         esi
 00050FA3    pop         ebx
 00050FA4    ret
*}
end;

//00050FA8
destructor TMenuItem.Destroy;
begin
{*
 00050FA8    push        ebx
 00050FA9    push        esi
 00050FAA    call        @BeforeDestruction
 00050FAF    mov         ebx,edx
 00050FB1    mov         esi,eax
 00050FB3    mov         eax,dword ptr [esi+58]
 00050FB6    test        eax,eax
>00050FB8    je          00050FD6
 00050FBA    mov         edx,esi
 00050FBC    call        TMenuItem.Remove
 00050FC1    xor         eax,eax
 00050FC3    mov         dword ptr [esi+58],eax
>00050FC6    jmp         00050FD6
 00050FC8    xor         edx,edx
 00050FCA    mov         eax,esi
 00050FCC    call        TMenuItem.GetItem
 00050FD1    call        TObject.Free
 00050FD6    mov         eax,esi
 00050FD8    call        TMenuItem.GetCount
 00050FDD    test        eax,eax
>00050FDF    jg          00050FC8
 00050FE1    cmp         dword ptr [esi+28],0
>00050FE5    je          00050FF9
 00050FE7    xor         edx,edx
 00050FE9    mov         eax,esi
 00050FEB    call        TMenuItem.MergeWith
 00050FF0    mov         eax,dword ptr [esi+28]
 00050FF3    push        eax
 00050FF4    call        user32.DestroyMenu
 00050FF9    mov         eax,dword ptr [esi+50]
 00050FFC    call        TObject.Free
 00051001    mov         eax,dword ptr [esi+38]
 00051004    call        TObject.Free
 00051009    xor         eax,eax
 0005100B    mov         dword ptr [esi+38],eax
 0005100E    mov         ax,word ptr [esi+44]
 00051012    test        ax,ax
>00051015    je          00051026
 00051017    movzx       edx,ax
 0005101A    xor         ecx,ecx
 0005101C    mov         eax,[000B67A8]
 00051021    call        TBits.SetBit
 00051026    mov         eax,dword ptr [esi+40]
 00051029    test        eax,eax
>0005102B    je          00051032
 0005102D    call        TObject.Free
 00051032    mov         edx,ebx
 00051034    and         dl,0FC
 00051037    mov         eax,esi
 00051039    call        TComponent.Destroy
 0005103E    test        bl,bl
>00051040    jle         00051049
 00051042    mov         eax,esi
 00051044    call        @ClassDestroy
 00051049    pop         esi
 0005104A    pop         ebx
 0005104B    ret
*}
end;

//0005104C
procedure TMenuItem.AppendTo(Menu:HMENU; ARightToLeft:Boolean);
begin
{*
 0005104C    push        ebp
 0005104D    mov         ebp,esp
 0005104F    add         esp,0FFFFFFC0
 00051052    push        ebx
 00051053    push        esi
 00051054    push        edi
 00051055    xor         ebx,ebx
 00051057    mov         dword ptr [ebp-40],ebx
 0005105A    mov         dword ptr [ebp-8],ebx
 0005105D    mov         byte ptr [ebp-1],cl
 00051060    mov         edi,edx
 00051062    mov         ebx,eax
 00051064    xor         eax,eax
 00051066    push        ebp
 00051067    push        512A0
 0005106C    push        dword ptr fs:[eax]
 0005106F    mov         dword ptr fs:[eax],esp
 00051072    cmp         byte ptr [ebx+30],0
>00051076    je          00051282
 0005107C    lea         eax,[ebp-8]
 0005107F    mov         edx,dword ptr [ebx+24]
 00051082    call        @LStrLAsg
 00051087    mov         eax,ebx
 00051089    call        TMenuItem.GetCount
 0005108E    test        eax,eax
>00051090    jle         0005109E
 00051092    mov         eax,ebx
 00051094    call        TMenuItem.GetHandle
 00051099    mov         dword ptr [ebp-25],eax
>0005109C    jmp         000510E8
 0005109E    cmp         word ptr [ebx+54],0
>000510A3    je          000510E8
 000510A5    mov         esi,dword ptr [ebx+58]
 000510A8    test        esi,esi
>000510AA    je          000510C4
 000510AC    cmp         dword ptr [esi+58],0
>000510B0    jne         000510C4
 000510B2    mov         eax,dword ptr [esi+4]
 000510B5    mov         edx,dword ptr ds:[50288];TMainMenu
 000510BB    call        @IsClass
 000510C0    test        al,al
>000510C2    jne         000510E8
 000510C4    push        dword ptr [ebp-8]
 000510C7    push        512B8;#9
 000510CC    lea         edx,[ebp-40]
 000510CF    mov         ax,word ptr [ebx+54]
 000510D3    call        ShortCutToText
 000510D8    push        dword ptr [ebp-40]
 000510DB    lea         eax,[ebp-8]
 000510DE    mov         edx,3
 000510E3    call        @LStrCatN
 000510E8    call        kernel32.GetVersion
 000510ED    and         ax,0FF
 000510F1    cmp         ax,4
>000510F5    jb          000511FB
 000510FB    mov         dword ptr [ebp-39],2C
 00051102    mov         dword ptr [ebp-35],3F
 00051109    mov         eax,ebx
 0005110B    call        TMenuItem.GetParentMenu
 00051110    mov         esi,eax
 00051112    test        esi,esi
>00051114    je          00051121
 00051116    mov         eax,esi
 00051118    call        TMenu.IsOwnerDraw
 0005111D    test        al,al
>0005111F    jne         00051137
 00051121    cmp         dword ptr [ebx+40],0
>00051125    je          00051133
 00051127    mov         eax,dword ptr [ebx+40]
 0005112A    mov         edx,dword ptr [eax]
 0005112C    call        dword ptr [edx+1C]
 0005112F    test        al,al
>00051131    je          00051137
 00051133    xor         eax,eax
>00051135    jmp         00051139
 00051137    mov         al,1
 00051139    mov         byte ptr [ebp-9],al
 0005113C    mov         eax,dword ptr [ebx+24]
 0005113F    mov         edx,512C4;'-'
 00051144    call        @LStrCmp
 00051149    sete        al
 0005114C    and         eax,7F
 0005114F    mov         eax,dword ptr [eax*4+0B495C]
 00051156    xor         edx,edx
 00051158    mov         dl,byte ptr [ebx+2F]
 0005115B    mov         edx,dword ptr [edx*4+0B4954]
 00051162    xor         ecx,ecx
 00051164    mov         cl,byte ptr [ebx+3C]
 00051167    or          edx,dword ptr [ecx*4+0B4930]
 0005116E    or          eax,edx
 00051170    xor         edx,edx
 00051172    mov         dl,byte ptr [ebp-1]
 00051175    or          eax,dword ptr [edx*4+0B4964]
 0005117C    xor         edx,edx
 0005117E    mov         dl,byte ptr [ebp-9]
 00051181    or          eax,dword ptr [edx*4+0B496C]
 00051188    mov         dword ptr [ebp-31],eax
 0005118B    xor         eax,eax
 0005118D    mov         al,byte ptr [ebx+2C]
 00051190    mov         eax,dword ptr [eax*4+0B493C]
 00051197    xor         edx,edx
 00051199    mov         dl,byte ptr [ebx+2D]
 0005119C    or          eax,dword ptr [edx*4+0B494C]
 000511A3    xor         edx,edx
 000511A5    mov         dl,byte ptr [ebx+2E]
 000511A8    or          eax,dword ptr [edx*4+0B4944]
 000511AF    mov         dword ptr [ebp-2D],eax
 000511B2    movzx       eax,word ptr [ebx+44]
 000511B6    mov         dword ptr [ebp-29],eax
 000511B9    xor         eax,eax
 000511BB    mov         dword ptr [ebp-25],eax
 000511BE    xor         eax,eax
 000511C0    mov         dword ptr [ebp-21],eax
 000511C3    xor         eax,eax
 000511C5    mov         dword ptr [ebp-1D],eax
 000511C8    mov         eax,dword ptr [ebp-8]
 000511CB    call        @LStrToPChar
 000511D0    mov         dword ptr [ebp-15],eax
 000511D3    mov         eax,ebx
 000511D5    call        TMenuItem.GetCount
 000511DA    test        eax,eax
>000511DC    jle         000511E8
 000511DE    mov         eax,ebx
 000511E0    call        TMenuItem.GetHandle
 000511E5    mov         dword ptr [ebp-25],eax
 000511E8    lea         eax,[ebp-39]
 000511EB    push        eax
 000511EC    push        0FF
 000511EE    push        0FF
 000511F0    push        edi
 000511F1    call        user32.InsertMenuItemA
>000511F6    jmp         00051282
 000511FB    mov         eax,dword ptr [ebx+24]
 000511FE    mov         edx,512C4;'-'
 00051203    call        @LStrCmp
 00051208    sete        al
 0005120B    and         eax,7F
 0005120E    mov         esi,dword ptr [eax*4+0B4928]
 00051215    xor         eax,eax
 00051217    mov         al,byte ptr [ebx+3C]
 0005121A    mov         eax,dword ptr [eax*4+0B491C]
 00051221    xor         edx,edx
 00051223    mov         dl,byte ptr [ebx+2C]
 00051226    or          eax,dword ptr [edx*4+0B490C]
 0005122D    xor         edx,edx
 0005122F    mov         dl,byte ptr [ebx+2D]
 00051232    or          eax,dword ptr [edx*4+0B4914]
 00051239    or          esi,eax
 0005123B    or          esi,400
 00051241    mov         eax,ebx
 00051243    call        TMenuItem.GetCount
 00051248    test        eax,eax
>0005124A    jle         0005126B
 0005124C    mov         eax,dword ptr [ebx+24]
 0005124F    call        @LStrToPChar
 00051254    push        eax
 00051255    mov         eax,ebx
 00051257    call        TMenuItem.GetHandle
 0005125C    push        eax
 0005125D    or          esi,10
 00051260    push        esi
 00051261    push        0FF
 00051263    push        edi
 00051264    call        user32.InsertMenuA
>00051269    jmp         00051282
 0005126B    mov         eax,dword ptr [ebp-8]
 0005126E    call        @LStrToPChar
 00051273    push        eax
 00051274    movzx       eax,word ptr [ebx+44]
 00051278    push        eax
 00051279    push        esi
 0005127A    push        0FF
 0005127C    push        edi
 0005127D    call        user32.InsertMenuA
 00051282    xor         eax,eax
 00051284    pop         edx
 00051285    pop         ecx
 00051286    pop         ecx
 00051287    mov         dword ptr fs:[eax],edx
 0005128A    push        512A7
 0005128F    lea         eax,[ebp-40]
 00051292    call        @LStrClr
 00051297    lea         eax,[ebp-8]
 0005129A    call        @LStrClr
 0005129F    ret
>000512A0    jmp         @HandleFinally
>000512A5    jmp         0005128F
 000512A7    pop         edi
 000512A8    pop         esi
 000512A9    pop         ebx
 000512AA    mov         esp,ebp
 000512AC    pop         ebp
 000512AD    ret
*}
end;

//000512C8
function AddIn(MenuItem:TMenuItem):Boolean;
begin
{*
 000512C8    push        ebp
 000512C9    mov         ebp,esp
 000512CB    mov         edx,dword ptr [ebp+8]
 000512CE    mov         cl,byte ptr [edx-5]
 000512D1    mov         edx,dword ptr [ebp+8]
 000512D4    mov         edx,dword ptr [edx-4]
 000512D7    mov         edx,dword ptr [edx+28]
 000512DA    call        TMenuItem.AppendTo
 000512DF    xor         eax,eax
 000512E1    pop         ebp
 000512E2    ret
*}
end;

//000512E4
procedure TMenuItem.PopulateMenu;
begin
{*
 000512E4    push        ebp
 000512E5    mov         ebp,esp
 000512E7    add         esp,0FFFFFFF8
 000512EA    push        ebx
 000512EB    mov         dword ptr [ebp-4],eax
 000512EE    mov         eax,dword ptr [ebp-4]
 000512F1    mov         ebx,dword ptr [eax+64]
 000512F4    test        ebx,ebx
>000512F6    je          00051303
 000512F8    mov         eax,ebx
 000512FA    call        TMenu.IsRightToLeft
 000512FF    test        al,al
>00051301    jne         00051307
 00051303    xor         eax,eax
>00051305    jmp         00051309
 00051307    mov         al,1
 00051309    mov         byte ptr [ebp-5],al
 0005130C    mov         eax,dword ptr [ebp-4]
 0005130F    mov         edx,dword ptr [eax+5C]
 00051312    mov         eax,512C8;AddIn:Boolean
 00051317    mov         ecx,dword ptr [ebp-4]
 0005131A    call        IterateMenus
 0005131F    pop         ebx
 00051320    pop         ecx
 00051321    pop         ecx
 00051322    pop         ebp
 00051323    ret
*}
end;

//00051324
procedure TMenuItem.ReadShortCutText(Reader:TReader);
begin
{*
 00051324    push        ebp
 00051325    mov         ebp,esp
 00051327    push        0
 00051329    push        ebx
 0005132A    push        esi
 0005132B    mov         esi,edx
 0005132D    mov         ebx,eax
 0005132F    xor         eax,eax
 00051331    push        ebp
 00051332    push        5136E
 00051337    push        dword ptr fs:[eax]
 0005133A    mov         dword ptr fs:[eax],esp
 0005133D    lea         edx,[ebp-4]
 00051340    mov         eax,esi
 00051342    call        TReader.ReadString
 00051347    mov         eax,dword ptr [ebp-4]
 0005134A    call        TextToShortCut
 0005134F    mov         edx,eax
 00051351    mov         eax,ebx
 00051353    call        TMenuItem.SetShortCut
 00051358    xor         eax,eax
 0005135A    pop         edx
 0005135B    pop         ecx
 0005135C    pop         ecx
 0005135D    mov         dword ptr fs:[eax],edx
 00051360    push        51375
 00051365    lea         eax,[ebp-4]
 00051368    call        @LStrClr
 0005136D    ret
>0005136E    jmp         @HandleFinally
>00051373    jmp         00051365
 00051375    pop         esi
 00051376    pop         ebx
 00051377    pop         ecx
 00051378    pop         ebp
 00051379    ret
*}
end;

//0005137C
procedure TMenuItem.MergeWith(Menu:TMenuItem);
begin
{*
 0005137C    push        ebx
 0005137D    mov         ecx,dword ptr [eax+5C]
 00051380    cmp         edx,ecx
>00051382    je          0005139E
 00051384    test        ecx,ecx
>00051386    je          0005138D
 00051388    xor         ebx,ebx
 0005138A    mov         dword ptr [ecx+60],ebx
 0005138D    mov         ecx,edx
 0005138F    mov         dword ptr [eax+5C],ecx
 00051392    test        ecx,ecx
>00051394    je          00051399
 00051396    mov         dword ptr [ecx+60],eax
 00051399    call        TMenuItem.RebuildHandle
 0005139E    pop         ebx
 0005139F    ret
*}
end;

//000513A0
procedure TMenuItem.Loaded;
begin
{*
 000513A0    push        ebx
 000513A1    push        esi
 000513A2    mov         esi,eax
 000513A4    mov         eax,esi
 000513A6    call        TComponent.Loaded
 000513AB    mov         eax,esi
 000513AD    call        TMenuItem.GetAction
 000513B2    test        eax,eax
>000513B4    je          000513CC
 000513B6    mov         eax,esi
 000513B8    call        TMenuItem.GetAction
 000513BD    mov         edx,eax
 000513BF    mov         cl,1
 000513C1    mov         eax,esi
 000513C3    mov         bx,0FFF0
 000513C7    call        @CallDynaInst
 000513CC    cmp         byte ptr [esi+68],0
>000513D0    je          000513D9
 000513D2    mov         eax,esi
 000513D4    call        TMenuItem.RebuildHandle
 000513D9    pop         esi
 000513DA    pop         ebx
 000513DB    ret
*}
end;

//000513DC
procedure TMenuItem.RebuildHandle;
begin
{*
 000513DC    push        esi
 000513DD    mov         esi,eax
 000513DF    test        byte ptr [esi+20],8
>000513E3    jne         00051434
 000513E5    test        byte ptr [esi+20],2
>000513E9    je          000513F1
 000513EB    mov         byte ptr [esi+68],1
>000513EF    jmp         00051434
 000513F1    mov         eax,dword ptr [esi+60]
 000513F4    test        eax,eax
>000513F6    je          00051413
 000513F8    call        TMenuItem.RebuildHandle
>000513FD    jmp         00051434
 000513FF    push        400
 00051404    push        0
 00051406    mov         eax,esi
 00051408    call        TMenuItem.GetHandle
 0005140D    push        eax
 0005140E    call        user32.RemoveMenu
 00051413    mov         eax,esi
 00051415    call        TMenuItem.GetHandle
 0005141A    push        eax
 0005141B    call        user32.GetMenuItemCount
 00051420    test        eax,eax
>00051422    jg          000513FF
 00051424    mov         eax,esi
 00051426    call        TMenuItem.PopulateMenu
 0005142B    xor         edx,edx
 0005142D    mov         eax,esi
 0005142F    mov         ecx,dword ptr [eax]
 00051431    call        dword ptr [ecx+34]
 00051434    pop         esi
 00051435    ret
*}
end;

//00051438
procedure TMenuItem.VerifyGroupIndex(Position:Integer; Value:Byte);
begin
{*
 00051438    push        ebp
 00051439    mov         ebp,esp
 0005143B    add         esp,0FFFFFFF4
 0005143E    push        ebx
 0005143F    push        esi
 00051440    push        edi
 00051441    xor         ebx,ebx
 00051443    mov         dword ptr [ebp-0C],ebx
 00051446    mov         byte ptr [ebp-5],cl
 00051449    mov         dword ptr [ebp-4],edx
 0005144C    mov         edi,eax
 0005144E    xor         eax,eax
 00051450    push        ebp
 00051451    push        514D4
 00051456    push        dword ptr fs:[eax]
 00051459    mov         dword ptr fs:[eax],esp
 0005145C    mov         eax,edi
 0005145E    call        TMenuItem.GetCount
 00051463    mov         esi,eax
 00051465    dec         esi
 00051466    test        esi,esi
>00051468    jl          000514BE
 0005146A    inc         esi
 0005146B    xor         ebx,ebx
 0005146D    cmp         ebx,dword ptr [ebp-4]
>00051470    jge         0005149A
 00051472    mov         edx,ebx
 00051474    mov         eax,edi
 00051476    call        TMenuItem.GetItem
 0005147B    mov         al,byte ptr [eax+31]
 0005147E    cmp         al,byte ptr [ebp-5]
>00051481    jbe         000514BA
 00051483    lea         edx,[ebp-0C]
 00051486    mov         eax,[000B5724];^SGroupIndexTooLow:TResStringRec
 0005148B    call        LoadResString
 00051490    mov         eax,dword ptr [ebp-0C]
 00051493    call        Error
>00051498    jmp         000514BA
 0005149A    mov         edx,ebx
 0005149C    mov         eax,edi
 0005149E    call        TMenuItem.GetItem
 000514A3    mov         al,byte ptr [eax+31]
 000514A6    cmp         al,byte ptr [ebp-5]
>000514A9    jae         000514BA
 000514AB    mov         edx,ebx
 000514AD    mov         eax,edi
 000514AF    call        TMenuItem.GetItem
 000514B4    mov         dl,byte ptr [ebp-5]
 000514B7    mov         byte ptr [eax+31],dl
 000514BA    inc         ebx
 000514BB    dec         esi
>000514BC    jne         0005146D
 000514BE    xor         eax,eax
 000514C0    pop         edx
 000514C1    pop         ecx
 000514C2    pop         ecx
 000514C3    mov         dword ptr fs:[eax],edx
 000514C6    push        514DB
 000514CB    lea         eax,[ebp-0C]
 000514CE    call        @LStrClr
 000514D3    ret
>000514D4    jmp         @HandleFinally
>000514D9    jmp         000514CB
 000514DB    pop         edi
 000514DC    pop         esi
 000514DD    pop         ebx
 000514DE    mov         esp,ebp
 000514E0    pop         ebp
 000514E1    ret
*}
end;

//000514E4
procedure TMenuItem.WriteShortCutText(Writer:TWriter);
begin
{*
 000514E4    ret
*}
end;

//000514E8
function TMenuItem.GetHandle:HMENU;
begin
{*
 000514E8    push        ebp
 000514E9    mov         ebp,esp
 000514EB    push        0
 000514ED    push        ebx
 000514EE    mov         ebx,eax
 000514F0    xor         eax,eax
 000514F2    push        ebp
 000514F3    push        5156F
 000514F8    push        dword ptr fs:[eax]
 000514FB    mov         dword ptr fs:[eax],esp
 000514FE    cmp         dword ptr [ebx+28],0
>00051502    jne         00051556
 00051504    mov         eax,dword ptr [ebx+4]
 00051507    mov         edx,dword ptr ds:[50454];TPopupMenu
 0005150D    call        @IsClass
 00051512    test        al,al
>00051514    je          00051520
 00051516    call        user32.CreatePopupMenu
 0005151B    mov         dword ptr [ebx+28],eax
>0005151E    jmp         00051528
 00051520    call        user32.CreateMenu
 00051525    mov         dword ptr [ebx+28],eax
 00051528    cmp         dword ptr [ebx+28],0
>0005152C    jne         0005154F
 0005152E    lea         edx,[ebp-4]
 00051531    mov         eax,[000B56E8];^SOutOfResources:TResStringRec
 00051536    call        LoadResString
 0005153B    mov         ecx,dword ptr [ebp-4]
 0005153E    mov         dl,1
 00051540    mov         eax,[0004FBF4];EMenuError
 00051545    call        Exception.Create
 0005154A    call        @RaiseExcept
 0005154F    mov         eax,ebx
 00051551    call        TMenuItem.PopulateMenu
 00051556    mov         ebx,dword ptr [ebx+28]
 00051559    xor         eax,eax
 0005155B    pop         edx
 0005155C    pop         ecx
 0005155D    pop         ecx
 0005155E    mov         dword ptr fs:[eax],edx
 00051561    push        51576
 00051566    lea         eax,[ebp-4]
 00051569    call        @LStrClr
 0005156E    ret
>0005156F    jmp         @HandleFinally
>00051574    jmp         00051566
 00051576    mov         eax,ebx
 00051578    pop         ebx
 00051579    pop         ecx
 0005157A    pop         ebp
 0005157B    ret
*}
end;

//0005157C
procedure TMenuItem.DefineProperties(Filer:TFiler);
begin
{*
 0005157C    push        ebx
 0005157D    push        esi
 0005157E    mov         esi,edx
 00051580    mov         ebx,eax
 00051582    mov         edx,esi
 00051584    mov         eax,ebx
 00051586    call        TComponent.DefineProperties
 0005158B    push        ebx
 0005158C    push        51324;TMenuItem.ReadShortCutText
 00051591    push        ebx
 00051592    push        514E4;TMenuItem.WriteShortCutText
 00051597    xor         ecx,ecx
 00051599    mov         edx,515B0;'ShortCutText'
 0005159E    mov         eax,esi
 000515A0    mov         ebx,dword ptr [eax]
 000515A2    call        dword ptr [ebx]
 000515A4    pop         esi
 000515A5    pop         ebx
 000515A6    ret
*}
end;

//000515C0
procedure TMenuItem.DoDrawText(ACanvas:TCanvas; const ACaption:AnsiString; var Rect:TRect; Selected:Boolean; Flags:Longint);
begin
{*
 000515C0    push        ebp
 000515C1    mov         ebp,esp
 000515C3    add         esp,0FFFFFFE4
 000515C6    push        ebx
 000515C7    push        esi
 000515C8    push        edi
 000515C9    xor         ebx,ebx
 000515CB    mov         dword ptr [ebp-0C],ebx
 000515CE    mov         dword ptr [ebp-8],ecx
 000515D1    mov         dword ptr [ebp-4],edx
 000515D4    mov         esi,eax
 000515D6    mov         ebx,dword ptr [ebp+8]
 000515D9    xor         eax,eax
 000515DB    push        ebp
 000515DC    push        517A7
 000515E1    push        dword ptr fs:[eax]
 000515E4    mov         dword ptr fs:[eax],esp
 000515E7    mov         eax,esi
 000515E9    call        TMenuItem.GetParentMenu
 000515EE    mov         edi,eax
 000515F0    test        edi,edi
>000515F2    je          00051622
 000515F4    mov         eax,edi
 000515F6    call        TMenu.IsRightToLeft
 000515FB    test        al,al
>000515FD    je          00051622
 000515FF    test        bl,0
>00051602    jne         0005160C
 00051604    and         ebx,0FFFFFFFF
 00051607    or          ebx,2
>0005160A    jmp         0005161C
 0005160C    mov         eax,ebx
 0005160E    and         eax,2
 00051611    cmp         eax,2
>00051614    jne         0005161C
 00051616    and         ebx,0FFFFFFFD
 00051619    or          ebx,0
 0005161C    or          ebx,20000
 00051622    lea         eax,[ebp-0C]
 00051625    mov         edx,dword ptr [ebp-8]
 00051628    call        @LStrLAsg
 0005162D    test        bh,4
>00051630    je          00051656
 00051632    cmp         dword ptr [ebp-0C],0
>00051636    je          00051649
 00051638    mov         eax,dword ptr [ebp-0C]
 0005163B    cmp         byte ptr [eax],26
>0005163E    jne         00051656
 00051640    mov         eax,dword ptr [ebp-0C]
 00051643    cmp         byte ptr [eax+1],0
>00051647    jne         00051656
 00051649    lea         eax,[ebp-0C]
 0005164C    mov         edx,517C0;' '
 00051651    call        @LStrCat
 00051656    mov         eax,dword ptr [ebp-0C]
 00051659    mov         edx,517CC;'-'
 0005165E    call        @LStrCmp
>00051663    jne         0005169C
 00051665    test        bh,4
>00051668    jne         00051791
 0005166E    mov         eax,dword ptr [ebp+10]
 00051671    mov         esi,eax
 00051673    lea         edi,[ebp-1C]
 00051676    mov         ecx,4
 0005167B    rep movs    dword ptr [edi],dword ptr [esi]
 0005167D    add         dword ptr [ebp-18],4
 00051681    push        2
 00051683    push        6
 00051685    lea         eax,[ebp-1C]
 00051688    push        eax
 00051689    mov         eax,dword ptr [ebp-4]
 0005168C    call        TCanvas.GetHandle
 00051691    push        eax
 00051692    call        user32.DrawEdge
>00051697    jmp         00051791
 0005169C    mov         eax,dword ptr [ebp-4]
 0005169F    mov         eax,dword ptr [eax+14]
 000516A2    mov         dl,1
 000516A4    call        TBrush.SetStyle
 000516A9    cmp         byte ptr [esi+2E],0
>000516AD    je          000516CB
 000516AF    mov         eax,dword ptr [ebp-4]
 000516B2    mov         edi,dword ptr [eax+0C]
 000516B5    mov         eax,edi
 000516B7    call        TFont.GetStyle
 000516BC    mov         edx,eax
 000516BE    or          dl,byte ptr ds:[517D0]
 000516C4    mov         eax,edi
 000516C6    call        TFont.SetStyle
 000516CB    cmp         byte ptr [esi+2D],0
>000516CF    jne         0005176C
 000516D5    cmp         byte ptr [ebp+0C],0
>000516D9    jne         0005172A
 000516DB    push        1
 000516DD    push        1
 000516DF    mov         eax,dword ptr [ebp+10]
 000516E2    push        eax
 000516E3    call        user32.OffsetRect
 000516E8    mov         eax,dword ptr [ebp-4]
 000516EB    mov         eax,dword ptr [eax+0C]
 000516EE    mov         edx,80000014
 000516F3    call        TFont.SetColor
 000516F8    push        ebx
 000516F9    mov         eax,dword ptr [ebp+10]
 000516FC    push        eax
 000516FD    mov         eax,dword ptr [ebp-0C]
 00051700    call        @LStrLen
 00051705    push        eax
 00051706    mov         eax,dword ptr [ebp-0C]
 00051709    call        @LStrToPChar
 0005170E    push        eax
 0005170F    mov         eax,dword ptr [ebp-4]
 00051712    call        TCanvas.GetHandle
 00051717    push        eax
 00051718    call        user32.DrawTextA
 0005171D    push        0FF
 0005171F    push        0FF
 00051721    mov         eax,dword ptr [ebp+10]
 00051724    push        eax
 00051725    call        user32.OffsetRect
 0005172A    cmp         byte ptr [ebp+0C],0
>0005172E    je          0005175C
 00051730    mov         eax,8000000D
 00051735    call        ColorToRGB
 0005173A    mov         esi,eax
 0005173C    mov         eax,80000010
 00051741    call        ColorToRGB
 00051746    cmp         esi,eax
>00051748    jne         0005175C
 0005174A    mov         eax,dword ptr [ebp-4]
 0005174D    mov         eax,dword ptr [eax+0C]
 00051750    mov         edx,80000014
 00051755    call        TFont.SetColor
>0005175A    jmp         0005176C
 0005175C    mov         eax,dword ptr [ebp-4]
 0005175F    mov         eax,dword ptr [eax+0C]
 00051762    mov         edx,80000010
 00051767    call        TFont.SetColor
 0005176C    push        ebx
 0005176D    mov         eax,dword ptr [ebp+10]
 00051770    push        eax
 00051771    mov         eax,dword ptr [ebp-0C]
 00051774    call        @LStrLen
 00051779    push        eax
 0005177A    mov         eax,dword ptr [ebp-0C]
 0005177D    call        @LStrToPChar
 00051782    push        eax
 00051783    mov         eax,dword ptr [ebp-4]
 00051786    call        TCanvas.GetHandle
 0005178B    push        eax
 0005178C    call        user32.DrawTextA
 00051791    xor         eax,eax
 00051793    pop         edx
 00051794    pop         ecx
 00051795    pop         ecx
 00051796    mov         dword ptr fs:[eax],edx
 00051799    push        517AE
 0005179E    lea         eax,[ebp-0C]
 000517A1    call        @LStrClr
 000517A6    ret
>000517A7    jmp         @HandleFinally
>000517AC    jmp         0005179E
 000517AE    pop         edi
 000517AF    pop         esi
 000517B0    pop         ebx
 000517B1    mov         esp,ebp
 000517B3    pop         ebp
 000517B4    ret         0C
*}
end;

//000517D4
procedure TMenuItem.DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean);
begin
{*
 000517D4    push        ebp
 000517D5    mov         ebp,esp
 000517D7    add         esp,0FFFFFFBC
 000517DA    push        ebx
 000517DB    push        esi
 000517DC    push        edi
 000517DD    xor         ebx,ebx
 000517DF    mov         dword ptr [ebp-44],ebx
 000517E2    mov         esi,ecx
 000517E4    lea         edi,[ebp-20]
 000517E7    mov         ecx,4
 000517EC    rep movs    dword ptr [edi],dword ptr [esi]
 000517EE    mov         dword ptr [ebp-8],edx
 000517F1    mov         dword ptr [ebp-4],eax
 000517F4    xor         eax,eax
 000517F6    push        ebp
 000517F7    push        51D4D
 000517FC    push        dword ptr fs:[eax]
 000517FF    mov         dword ptr fs:[eax],esp
 00051802    mov         eax,dword ptr [ebp-4]
 00051805    call        TMenuItem.GetParentMenu
 0005180A    mov         esi,eax
 0005180C    test        esi,esi
>0005180E    je          00051844
 00051810    mov         eax,esi
 00051812    call        TMenu.IsOwnerDraw
 00051817    test        al,al
>00051819    je          00051844
 0005181B    mov         eax,dword ptr [ebp-4]
 0005181E    cmp         word ptr [eax+7E],0
>00051823    je          00051844
 00051825    lea         eax,[ebp-20]
 00051828    push        eax
 00051829    mov         al,byte ptr [ebp+8]
 0005182C    push        eax
 0005182D    mov         ebx,dword ptr [ebp-4]
 00051830    mov         ecx,dword ptr [ebp-8]
 00051833    mov         edx,dword ptr [ebp-4]
 00051836    mov         eax,dword ptr [ebx+80]
 0005183C    call        dword ptr [ebx+7C]
>0005183F    jmp         00051D37
 00051844    mov         eax,dword ptr [ebp-4]
 00051847    mov         bx,0FFF3
 0005184B    call        @CallDynaInst
 00051850    mov         edx,dword ptr ds:[50288];TMainMenu
 00051856    call        @IsClass
 0005185B    mov         byte ptr [ebp-9],al
 0005185E    mov         edi,dword ptr [esi+3C]
 00051861    cmp         byte ptr [ebp+8],0
>00051865    jne         00051872
 00051867    lea         edx,[ebp-20]
 0005186A    mov         eax,dword ptr [ebp-8]
 0005186D    call        TCanvas.FillRect
 00051872    test        esi,esi
>00051874    je          0005187C
 00051876    mov         byte ptr [ebp-0A],0
>0005187A    jmp         00051899
 0005187C    mov         eax,esi
 0005187E    mov         edx,dword ptr ds:[50454];TPopupMenu
 00051884    call        @IsClass
 00051889    test        al,al
>0005188B    je          00051895
 0005188D    mov         al,byte ptr [esi+50]
 00051890    mov         byte ptr [ebp-0A],al
>00051893    jmp         00051899
 00051895    mov         byte ptr [ebp-0A],0
 00051899    mov         eax,dword ptr [ebp-20]
 0005189C    inc         eax
 0005189D    mov         dword ptr [ebp-30],eax
 000518A0    mov         eax,dword ptr [ebp-1C]
 000518A3    inc         eax
 000518A4    mov         dword ptr [ebp-2C],eax
 000518A7    mov         eax,dword ptr [ebp-4]
 000518AA    mov         eax,dword ptr [eax+24]
 000518AD    mov         edx,51D68;'-'
 000518B2    call        @LStrCmp
>000518B7    jne         000518D9
 000518B9    lea         edx,[ebp-20]
 000518BC    mov         eax,dword ptr [ebp-8]
 000518BF    call        TCanvas.FillRect
 000518C4    xor         eax,eax
 000518C6    mov         dword ptr [ebp-30],eax
 000518C9    mov         dword ptr [ebp-28],0FFFFFFFC
 000518D0    mov         byte ptr [ebp-0B],0
>000518D4    jmp         00051BE8
 000518D9    test        edi,edi
>000518DB    je          00051911
 000518DD    mov         eax,dword ptr [ebp-4]
 000518E0    mov         ebx,dword ptr [eax+34]
 000518E3    cmp         ebx,0FFFFFFFF
>000518E6    jle         000518F3
 000518E8    mov         eax,edi
 000518EA    call        TCustomImageList.GetCount
 000518EF    cmp         ebx,eax
>000518F1    jl          00051915
 000518F3    mov         eax,dword ptr [ebp-4]
 000518F6    cmp         byte ptr [eax+2C],0
>000518FA    je          00051911
 000518FC    mov         eax,dword ptr [ebp-4]
 000518FF    mov         esi,dword ptr [eax+40]
 00051902    test        esi,esi
>00051904    je          00051915
 00051906    mov         eax,esi
 00051908    mov         edx,dword ptr [eax]
 0005190A    call        dword ptr [edx+1C]
 0005190D    test        al,al
>0005190F    jne         00051915
 00051911    xor         eax,eax
>00051913    jmp         00051917
 00051915    mov         al,1
 00051917    mov         ebx,eax
 00051919    test        bl,bl
>0005191B    jne         0005193A
 0005191D    mov         eax,dword ptr [ebp-4]
 00051920    mov         esi,dword ptr [eax+40]
 00051923    test        esi,esi
>00051925    je          00051BBA
 0005192B    mov         eax,esi
 0005192D    mov         edx,dword ptr [eax]
 0005192F    call        dword ptr [edx+1C]
 00051932    test        al,al
>00051934    jne         00051BBA
 0005193A    mov         byte ptr [ebp-0B],1
 0005193E    test        bl,bl
>00051940    je          00051956
 00051942    mov         eax,dword ptr [edi+28]
 00051945    add         eax,dword ptr [ebp-30]
 00051948    mov         dword ptr [ebp-28],eax
 0005194B    mov         eax,dword ptr [edi+24]
 0005194E    add         eax,dword ptr [ebp-2C]
 00051951    mov         dword ptr [ebp-24],eax
>00051954    jmp         00051968
 00051956    mov         eax,dword ptr [ebp-30]
 00051959    add         eax,10
 0005195C    mov         dword ptr [ebp-28],eax
 0005195F    mov         eax,dword ptr [ebp-2C]
 00051962    add         eax,10
 00051965    mov         dword ptr [ebp-24],eax
 00051968    mov         eax,dword ptr [ebp-4]
 0005196B    cmp         byte ptr [eax+2C],0
>0005196F    je          000519EE
 00051971    inc         dword ptr [ebp-28]
 00051974    inc         dword ptr [ebp-24]
 00051977    mov         eax,dword ptr [ebp-8]
 0005197A    mov         eax,dword ptr [eax+14]
 0005197D    call        TBrush.GetColor
 00051982    mov         esi,eax
 00051984    cmp         byte ptr [ebp+8],0
>00051988    jne         000519C0
 0005198A    mov         eax,dword ptr [ebp-8]
 0005198D    mov         eax,dword ptr [eax+14]
 00051990    call        TBrush.GetColor
 00051995    mov         esi,eax
 00051997    mov         edx,80000014
 0005199C    mov         eax,8000000F
 000519A1    call        AllocPatternBitmap
 000519A6    mov         edx,eax
 000519A8    mov         eax,dword ptr [ebp-8]
 000519AB    mov         eax,dword ptr [eax+14]
 000519AE    call        TBrush.SetBitmap
 000519B3    lea         edx,[ebp-30]
 000519B6    mov         eax,dword ptr [ebp-8]
 000519B9    call        TCanvas.FillRect
>000519BE    jmp         000519DB
 000519C0    mov         eax,dword ptr [ebp-8]
 000519C3    mov         eax,dword ptr [eax+14]
 000519C6    mov         edx,8000000F
 000519CB    call        TBrush.SetColor
 000519D0    lea         edx,[ebp-30]
 000519D3    mov         eax,dword ptr [ebp-8]
 000519D6    call        TCanvas.FillRect
 000519DB    mov         eax,dword ptr [ebp-8]
 000519DE    mov         eax,dword ptr [eax+14]
 000519E1    mov         edx,esi
 000519E3    call        TBrush.SetColor
 000519E8    inc         dword ptr [ebp-30]
 000519EB    inc         dword ptr [ebp-2C]
 000519EE    test        bl,bl
>000519F0    je          00051AF0
 000519F6    mov         eax,dword ptr [ebp-4]
 000519F9    mov         ebx,dword ptr [eax+34]
 000519FC    cmp         ebx,0FFFFFFFF
>000519FF    jle         00051A30
 00051A01    mov         eax,edi
 00051A03    call        TCustomImageList.GetCount
 00051A08    cmp         ebx,eax
>00051A0A    jge         00051A30
 00051A0C    mov         eax,dword ptr [ebp-2C]
 00051A0F    push        eax
 00051A10    mov         eax,dword ptr [ebp-4]
 00051A13    mov         eax,dword ptr [eax+34]
 00051A16    push        eax
 00051A17    mov         eax,dword ptr [ebp-4]
 00051A1A    mov         al,byte ptr [eax+2D]
 00051A1D    push        eax
 00051A1E    mov         ecx,dword ptr [ebp-30]
 00051A21    mov         edx,dword ptr [ebp-8]
 00051A24    mov         eax,edi
 00051A26    call        TCustomImageList.Draw
>00051A2B    jmp         00051BA9
 00051A30    mov         dl,1
 00051A32    mov         eax,[00028F70];TBitmap
 00051A37    call        TBitmap.Create
 00051A3C    mov         dword ptr [ebp-10],eax
 00051A3F    xor         edx,edx
 00051A41    push        ebp
 00051A42    push        51AE9
 00051A47    push        dword ptr fs:[edx]
 00051A4A    mov         dword ptr fs:[edx],esp
 00051A4D    mov         dl,1
 00051A4F    mov         eax,dword ptr [ebp-10]
 00051A52    mov         ecx,dword ptr [eax]
 00051A54    call        dword ptr [ecx+3C]
 00051A57    push        7FF8
 00051A5C    push        0
 00051A5E    call        user32.LoadBitmapA
 00051A63    mov         edx,eax
 00051A65    mov         eax,dword ptr [ebp-10]
 00051A68    call        TBitmap.SetHandle
 00051A6D    mov         eax,dword ptr [ebp-8]
 00051A70    mov         eax,dword ptr [eax+0C]
 00051A73    mov         esi,dword ptr [eax+14]
 00051A76    mov         edx,80000012
 00051A7B    call        TFont.SetColor
 00051A80    mov         eax,dword ptr [ebp-10]
 00051A83    push        eax
 00051A84    mov         eax,dword ptr [ebp-10]
 00051A87    mov         edx,dword ptr [eax]
 00051A89    call        dword ptr [edx+20]
 00051A8C    mov         edx,dword ptr [ebp-24]
 00051A8F    mov         edi,dword ptr [ebp-2C]
 00051A92    sub         edx,edi
 00051A94    sub         edx,eax
 00051A96    sar         edx,1
>00051A98    jns         00051A9D
 00051A9A    adc         edx,0
 00051A9D    add         edx,edi
 00051A9F    inc         edx
 00051AA0    push        edx
 00051AA1    mov         eax,dword ptr [ebp-10]
 00051AA4    mov         edx,dword ptr [eax]
 00051AA6    call        dword ptr [edx+2C]
 00051AA9    mov         edx,dword ptr [ebp-28]
 00051AAC    mov         ebx,dword ptr [ebp-30]
 00051AAF    sub         edx,ebx
 00051AB1    sub         edx,eax
 00051AB3    sar         edx,1
>00051AB5    jns         00051ABA
 00051AB7    adc         edx,0
 00051ABA    add         edx,ebx
 00051ABC    inc         edx
 00051ABD    mov         eax,dword ptr [ebp-8]
 00051AC0    pop         ecx
 00051AC1    call        TCanvas.Draw
 00051AC6    mov         eax,dword ptr [ebp-8]
 00051AC9    mov         eax,dword ptr [eax+0C]
 00051ACC    mov         edx,esi
 00051ACE    call        TFont.SetColor
 00051AD3    xor         eax,eax
 00051AD5    pop         edx
 00051AD6    pop         ecx
 00051AD7    pop         ecx
 00051AD8    mov         dword ptr fs:[eax],edx
 00051ADB    push        51BA9
 00051AE0    mov         eax,dword ptr [ebp-10]
 00051AE3    call        TObject.Free
 00051AE8    ret
>00051AE9    jmp         @HandleFinally
>00051AEE    jmp         00051AE0
 00051AF0    lea         esi,[ebp-30]
 00051AF3    lea         edi,[ebp-40]
 00051AF6    mov         ecx,4
 00051AFB    rep movs    dword ptr [edi],dword ptr [esi]
 00051AFD    mov         eax,dword ptr [ebp-4]
 00051B00    mov         eax,dword ptr [eax+40]
 00051B03    mov         edx,dword ptr [eax]
 00051B05    call        dword ptr [edx+2C]
 00051B08    mov         edx,dword ptr [ebp-28]
 00051B0B    sub         edx,dword ptr [ebp-30]
 00051B0E    cmp         eax,edx
>00051B10    jge         00051B44
 00051B12    mov         eax,dword ptr [ebp-4]
 00051B15    mov         eax,dword ptr [eax+40]
 00051B18    mov         edx,dword ptr [eax]
 00051B1A    call        dword ptr [edx+2C]
 00051B1D    mov         edx,dword ptr [ebp-28]
 00051B20    sub         edx,dword ptr [ebp-30]
 00051B23    sub         edx,eax
 00051B25    sar         edx,1
>00051B27    jns         00051B2C
 00051B29    adc         edx,0
 00051B2C    add         edx,dword ptr [ebp-30]
 00051B2F    inc         edx
 00051B30    mov         dword ptr [ebp-30],edx
 00051B33    mov         eax,dword ptr [ebp-4]
 00051B36    mov         eax,dword ptr [eax+40]
 00051B39    mov         edx,dword ptr [eax]
 00051B3B    call        dword ptr [edx+2C]
 00051B3E    add         eax,dword ptr [ebp-30]
 00051B41    mov         dword ptr [ebp-28],eax
 00051B44    mov         eax,dword ptr [ebp-4]
 00051B47    mov         eax,dword ptr [eax+40]
 00051B4A    mov         edx,dword ptr [eax]
 00051B4C    call        dword ptr [edx+20]
 00051B4F    mov         edx,dword ptr [ebp-24]
 00051B52    sub         edx,dword ptr [ebp-2C]
 00051B55    cmp         eax,edx
>00051B57    jge         00051B8B
 00051B59    mov         eax,dword ptr [ebp-4]
 00051B5C    mov         eax,dword ptr [eax+40]
 00051B5F    mov         edx,dword ptr [eax]
 00051B61    call        dword ptr [edx+20]
 00051B64    mov         edx,dword ptr [ebp-24]
 00051B67    sub         edx,dword ptr [ebp-2C]
 00051B6A    sub         edx,eax
 00051B6C    sar         edx,1
>00051B6E    jns         00051B73
 00051B70    adc         edx,0
 00051B73    add         edx,dword ptr [ebp-2C]
 00051B76    inc         edx
 00051B77    mov         dword ptr [ebp-2C],edx
 00051B7A    mov         eax,dword ptr [ebp-4]
 00051B7D    mov         eax,dword ptr [eax+40]
 00051B80    mov         edx,dword ptr [eax]
 00051B82    call        dword ptr [edx+20]
 00051B85    add         eax,dword ptr [ebp-2C]
 00051B88    mov         dword ptr [ebp-24],eax
 00051B8B    mov         eax,dword ptr [ebp-4]
 00051B8E    mov         ecx,dword ptr [eax+40]
 00051B91    lea         edx,[ebp-30]
 00051B94    mov         eax,dword ptr [ebp-8]
 00051B97    call        TCanvas.StretchDraw
 00051B9C    lea         esi,[ebp-40]
 00051B9F    lea         edi,[ebp-30]
 00051BA2    mov         ecx,4
 00051BA7    rep movs    dword ptr [edi],dword ptr [esi]
 00051BA9    mov         eax,dword ptr [ebp-4]
 00051BAC    cmp         byte ptr [eax+2C],0
>00051BB0    je          00051BE8
 00051BB2    dec         dword ptr [ebp-28]
 00051BB5    dec         dword ptr [ebp-24]
>00051BB8    jmp         00051BE8
 00051BBA    test        edi,edi
>00051BBC    je          00051BD8
 00051BBE    cmp         byte ptr [ebp-9],0
>00051BC2    jne         00051BD8
 00051BC4    mov         eax,dword ptr [edi+28]
 00051BC7    add         eax,dword ptr [ebp-30]
 00051BCA    mov         dword ptr [ebp-28],eax
 00051BCD    mov         eax,dword ptr [edi+24]
 00051BD0    add         eax,dword ptr [ebp-2C]
 00051BD3    mov         dword ptr [ebp-24],eax
>00051BD6    jmp         00051BE4
 00051BD8    mov         eax,dword ptr [ebp-30]
 00051BDB    mov         dword ptr [ebp-28],eax
 00051BDE    mov         eax,dword ptr [ebp-2C]
 00051BE1    mov         dword ptr [ebp-24],eax
 00051BE4    mov         byte ptr [ebp-0B],0
 00051BE8    dec         dword ptr [ebp-30]
 00051BEB    dec         dword ptr [ebp-2C]
 00051BEE    add         dword ptr [ebp-28],2
 00051BF2    add         dword ptr [ebp-24],2
 00051BF6    mov         eax,dword ptr [ebp-4]
 00051BF9    cmp         byte ptr [eax+2C],0
>00051BFD    jne         00051C07
 00051BFF    mov         al,byte ptr [ebp+8]
 00051C02    and         al,byte ptr [ebp-0B]
>00051C05    je          00051C2A
 00051C07    push        0F
 00051C09    mov         eax,dword ptr [ebp-4]
 00051C0C    movzx       eax,byte ptr [eax+2C]
 00051C10    mov         eax,dword ptr [eax*4+0B497C]
 00051C17    push        eax
 00051C18    lea         eax,[ebp-30]
 00051C1B    push        eax
 00051C1C    mov         eax,dword ptr [ebp-8]
 00051C1F    call        TCanvas.GetHandle
 00051C24    push        eax
 00051C25    call        user32.DrawEdge
 00051C2A    cmp         byte ptr [ebp+8],0
>00051C2E    je          00051C58
 00051C30    cmp         byte ptr [ebp-0B],0
>00051C34    je          00051C3D
 00051C36    mov         eax,dword ptr [ebp-28]
 00051C39    inc         eax
 00051C3A    mov         dword ptr [ebp-20],eax
 00051C3D    mov         eax,dword ptr [ebp-8]
 00051C40    mov         eax,dword ptr [eax+14]
 00051C43    mov         edx,8000000D
 00051C48    call        TBrush.SetColor
 00051C4D    lea         edx,[ebp-20]
 00051C50    mov         eax,dword ptr [ebp-8]
 00051C53    call        TCanvas.FillRect
 00051C58    cmp         byte ptr [ebp+8],0
>00051C5C    je          00051C64
 00051C5E    cmp         byte ptr [ebp-0B],0
>00051C62    jne         00051C6B
 00051C64    mov         eax,dword ptr [ebp-28]
 00051C67    inc         eax
 00051C68    mov         dword ptr [ebp-20],eax
 00051C6B    add         dword ptr [ebp-20],2
 00051C6F    dec         dword ptr [ebp-18]
 00051C72    xor         eax,eax
 00051C74    mov         al,byte ptr [ebp-0A]
 00051C77    mov         bx,word ptr [eax*2+0B4974]
 00051C7F    or          bx,60
 00051C83    movzx       ebx,bx
 00051C86    lea         esi,[ebp-20]
 00051C89    lea         edi,[ebp-40]
 00051C8C    mov         ecx,4
 00051C91    rep movs    dword ptr [edi],dword ptr [esi]
 00051C93    lea         eax,[ebp-20]
 00051C96    push        eax
 00051C97    mov         al,byte ptr [ebp+8]
 00051C9A    push        eax
 00051C9B    mov         eax,ebx
 00051C9D    or          eax,400
 00051CA2    or          eax,100
 00051CA7    push        eax
 00051CA8    mov         eax,dword ptr [ebp-4]
 00051CAB    mov         ecx,dword ptr [eax+24]
 00051CAE    mov         edx,dword ptr [ebp-8]
 00051CB1    mov         eax,dword ptr [ebp-4]
 00051CB4    call        TMenuItem.DoDrawText
 00051CB9    mov         eax,dword ptr [ebp-34]
 00051CBC    sub         eax,dword ptr [ebp-3C]
 00051CBF    mov         edx,dword ptr [ebp-14]
 00051CC2    sub         edx,dword ptr [ebp-1C]
 00051CC5    sub         eax,edx
 00051CC7    sar         eax,1
>00051CC9    jns         00051CCE
 00051CCB    adc         eax,0
 00051CCE    push        eax
 00051CCF    push        0
 00051CD1    lea         eax,[ebp-20]
 00051CD4    push        eax
 00051CD5    call        user32.OffsetRect
 00051CDA    lea         eax,[ebp-20]
 00051CDD    push        eax
 00051CDE    mov         al,byte ptr [ebp+8]
 00051CE1    push        eax
 00051CE2    push        ebx
 00051CE3    mov         eax,dword ptr [ebp-4]
 00051CE6    mov         ecx,dword ptr [eax+24]
 00051CE9    mov         edx,dword ptr [ebp-8]
 00051CEC    mov         eax,dword ptr [ebp-4]
 00051CEF    call        TMenuItem.DoDrawText
 00051CF4    mov         eax,dword ptr [ebp-4]
 00051CF7    mov         bx,word ptr [eax+54]
 00051CFB    test        bx,bx
>00051CFE    je          00051D37
 00051D00    cmp         byte ptr [ebp-9],0
>00051D04    jne         00051D37
 00051D06    mov         eax,dword ptr [ebp-18]
 00051D09    mov         dword ptr [ebp-20],eax
 00051D0C    mov         eax,dword ptr [ebp-38]
 00051D0F    sub         eax,0A
 00051D12    mov         dword ptr [ebp-18],eax
 00051D15    lea         eax,[ebp-20]
 00051D18    push        eax
 00051D19    mov         al,byte ptr [ebp+8]
 00051D1C    push        eax
 00051D1D    push        2
 00051D1F    lea         edx,[ebp-44]
 00051D22    mov         eax,ebx
 00051D24    call        ShortCutToText
 00051D29    mov         ecx,dword ptr [ebp-44]
 00051D2C    mov         edx,dword ptr [ebp-8]
 00051D2F    mov         eax,dword ptr [ebp-4]
 00051D32    call        TMenuItem.DoDrawText
 00051D37    xor         eax,eax
 00051D39    pop         edx
 00051D3A    pop         ecx
 00051D3B    pop         ecx
 00051D3C    mov         dword ptr fs:[eax],edx
 00051D3F    push        51D54
 00051D44    lea         eax,[ebp-44]
 00051D47    call        @LStrClr
 00051D4C    ret
>00051D4D    jmp         @HandleFinally
>00051D52    jmp         00051D44
 00051D54    pop         edi
 00051D55    pop         esi
 00051D56    pop         ebx
 00051D57    mov         esp,ebp
 00051D59    pop         ebp
 00051D5A    ret         4
*}
end;

//00051D6C
procedure GetMenuSize;
begin
{*
 00051D6C    push        ebp
 00051D6D    mov         ebp,esp
 00051D6F    add         esp,0FFFFFEAC
 00051D75    mov         dword ptr [ebp-154],154
 00051D7F    push        0
 00051D81    lea         eax,[ebp-154]
 00051D87    push        eax
 00051D88    push        0
 00051D8A    push        29
 00051D8C    call        user32.SystemParametersInfoA
 00051D91    test        eax,eax
>00051D93    je          00051DB1
 00051D95    mov         eax,dword ptr [ebp+8]
 00051D98    mov         eax,dword ptr [eax-4]
 00051D9B    mov         edx,dword ptr [ebp-0BC]
 00051DA1    mov         dword ptr [eax],edx
 00051DA3    mov         eax,dword ptr [ebp+8]
 00051DA6    mov         eax,dword ptr [eax+8]
 00051DA9    mov         edx,dword ptr [ebp-0B8]
 00051DAF    mov         dword ptr [eax],edx
 00051DB1    mov         esp,ebp
 00051DB3    pop         ebp
 00051DB4    ret
*}
end;

//00051DB8
procedure TMenuItem.MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer);
begin
{*
 00051DB8    push        ebp
 00051DB9    mov         ebp,esp
 00051DBB    add         esp,0FFFFFFDC
 00051DBE    push        ebx
 00051DBF    push        esi
 00051DC0    push        edi
 00051DC1    xor         ebx,ebx
 00051DC3    mov         dword ptr [ebp-24],ebx
 00051DC6    mov         dword ptr [ebp-10],ebx
 00051DC9    mov         dword ptr [ebp-4],ecx
 00051DCC    mov         dword ptr [ebp-8],edx
 00051DCF    mov         esi,eax
 00051DD1    xor         eax,eax
 00051DD3    push        ebp
 00051DD4    push        51F96
 00051DD9    push        dword ptr fs:[eax]
 00051DDC    mov         dword ptr fs:[eax],esp
 00051DDF    mov         eax,esi
 00051DE1    mov         bx,0FFF3
 00051DE5    call        @CallDynaInst
 00051DEA    mov         edx,dword ptr ds:[50288];TMainMenu
 00051DF0    call        @IsClass
 00051DF5    test        al,al
>00051DF7    je          00051E04
 00051DF9    mov         bl,1
 00051DFB    push        ebp
 00051DFC    call        GetMenuSize
 00051E01    pop         ecx
>00051E02    jmp         00051E06
 00051E04    xor         ebx,ebx
 00051E06    mov         eax,esi
 00051E08    call        TMenuItem.GetParentMenu
 00051E0D    mov         edi,eax
 00051E0F    mov         eax,dword ptr [edi+3C]
 00051E12    mov         dword ptr [ebp-0C],eax
 00051E15    mov         eax,dword ptr [esi+24]
 00051E18    mov         edx,51FB0;'-'
 00051E1D    call        @LStrCmp
>00051E22    jne         00051E3A
 00051E24    mov         eax,dword ptr [ebp+8]
 00051E27    mov         dword ptr [eax],5
 00051E2D    mov         eax,dword ptr [ebp-4]
 00051E30    mov         dword ptr [eax],0FFFFFFFE
 00051E36    xor         eax,eax
>00051E38    jmp         00051E9F
 00051E3A    cmp         dword ptr [ebp-0C],0
>00051E3E    je          00051E68
 00051E40    cmp         dword ptr [esi+34],0FFFFFFFF
>00051E44    jg          00051E4A
 00051E46    test        bl,bl
>00051E48    jne         00051E68
 00051E4A    mov         eax,dword ptr [ebp-0C]
 00051E4D    mov         eax,dword ptr [eax+28]
 00051E50    mov         edx,dword ptr [ebp-4]
 00051E53    mov         dword ptr [edx],eax
 00051E55    test        bl,bl
>00051E57    jne         00051E64
 00051E59    mov         eax,dword ptr [ebp-0C]
 00051E5C    mov         eax,dword ptr [eax+24]
 00051E5F    mov         edx,dword ptr [ebp+8]
 00051E62    mov         dword ptr [edx],eax
 00051E64    mov         al,1
>00051E66    jmp         00051E9F
 00051E68    cmp         dword ptr [esi+40],0
>00051E6C    je          00051E94
 00051E6E    mov         eax,dword ptr [esi+40]
 00051E71    mov         edx,dword ptr [eax]
 00051E73    call        dword ptr [edx+1C]
 00051E76    test        al,al
>00051E78    jne         00051E94
 00051E7A    mov         eax,dword ptr [ebp-4]
 00051E7D    mov         dword ptr [eax],10
 00051E83    test        bl,bl
>00051E85    jne         00051E90
 00051E87    mov         eax,dword ptr [ebp+8]
 00051E8A    mov         dword ptr [eax],10
 00051E90    mov         al,1
>00051E92    jmp         00051E9F
 00051E94    mov         eax,dword ptr [ebp-4]
 00051E97    mov         dword ptr [eax],0FFFFFFF9
 00051E9D    xor         eax,eax
 00051E9F    test        al,al
>00051EA1    je          00051EAD
 00051EA3    test        bl,bl
>00051EA5    jne         00051EAD
 00051EA7    mov         eax,dword ptr [ebp-4]
 00051EAA    add         dword ptr [eax],0F
 00051EAD    test        bl,bl
>00051EAF    jne         00051EB7
 00051EB1    mov         eax,dword ptr [ebp+8]
 00051EB4    add         dword ptr [eax],3
 00051EB7    lea         eax,[ebp-20]
 00051EBA    xor         ecx,ecx
 00051EBC    mov         edx,10
 00051EC1    call        @FillChar
 00051EC6    test        edi,edi
>00051EC8    je          00051ECE
 00051ECA    xor         ebx,ebx
>00051ECC    jmp         00051EE6
 00051ECE    mov         eax,edi
 00051ED0    mov         edx,dword ptr ds:[50454];TPopupMenu
 00051ED6    call        @IsClass
 00051EDB    test        al,al
>00051EDD    je          00051EE4
 00051EDF    mov         bl,byte ptr [edi+50]
>00051EE2    jmp         00051EE6
 00051EE4    xor         ebx,ebx
 00051EE6    mov         di,word ptr [esi+54]
 00051EEA    test        di,di
>00051EED    je          00051F09
 00051EEF    lea         edx,[ebp-24]
 00051EF2    mov         eax,edi
 00051EF4    call        ShortCutToText
 00051EF9    mov         ecx,dword ptr [ebp-24]
 00051EFC    lea         eax,[ebp-10]
 00051EFF    mov         edx,dword ptr [esi+24]
 00051F02    call        @LStrCat3
>00051F07    jmp         00051F14
 00051F09    lea         eax,[ebp-10]
 00051F0C    mov         edx,dword ptr [esi+24]
 00051F0F    call        @LStrLAsg
 00051F14    xor         eax,eax
 00051F16    mov         al,bl
 00051F18    mov         ax,word ptr [eax*2+0B4984]
 00051F20    or          ax,40
 00051F24    or          ax,20
 00051F28    or          ax,100
 00051F2C    or          ax,400
 00051F30    movzx       eax,ax
 00051F33    lea         edx,[ebp-20]
 00051F36    push        edx
 00051F37    push        0
 00051F39    push        eax
 00051F3A    mov         ecx,dword ptr [ebp-10]
 00051F3D    mov         edx,dword ptr [ebp-8]
 00051F40    mov         eax,esi
 00051F42    call        TMenuItem.DoDrawText
 00051F47    mov         eax,dword ptr [ebp-18]
 00051F4A    sub         eax,dword ptr [ebp-20]
 00051F4D    add         eax,7
 00051F50    mov         edx,dword ptr [ebp-4]
 00051F53    add         dword ptr [edx],eax
 00051F55    cmp         word ptr [esi+86],0
>00051F5D    je          00051F78
 00051F5F    mov         eax,dword ptr [ebp-4]
 00051F62    push        eax
 00051F63    mov         eax,dword ptr [ebp+8]
 00051F66    push        eax
 00051F67    mov         ecx,dword ptr [ebp-8]
 00051F6A    mov         edx,esi
 00051F6C    mov         eax,dword ptr [esi+88]
 00051F72    call        dword ptr [esi+84]
 00051F78    xor         eax,eax
 00051F7A    pop         edx
 00051F7B    pop         ecx
 00051F7C    pop         ecx
 00051F7D    mov         dword ptr fs:[eax],edx
 00051F80    push        51F9D
 00051F85    lea         eax,[ebp-24]
 00051F88    call        @LStrClr
 00051F8D    lea         eax,[ebp-10]
 00051F90    call        @LStrClr
 00051F95    ret
>00051F96    jmp         @HandleFinally
>00051F9B    jmp         00051F85
 00051F9D    pop         edi
 00051F9E    pop         esi
 00051F9F    pop         ebx
 00051FA0    mov         esp,ebp
 00051FA2    pop         ebp
 00051FA3    ret         4
*}
end;

//00051FB4
procedure TMenuItem.HasParent;
begin
{*
 00051FB4    mov         al,1
 00051FB6    ret
*}
end;

//00051FB8
procedure TMenuItem.SetBreak(Value:TMenuBreak);
begin
{*
 00051FB8    push        esi
 00051FB9    mov         esi,eax
 00051FBB    cmp         dl,byte ptr [esi+3C]
>00051FBE    je          00051FCC
 00051FC0    mov         byte ptr [esi+3C],dl
 00051FC3    mov         dl,1
 00051FC5    mov         eax,esi
 00051FC7    mov         ecx,dword ptr [eax]
 00051FC9    call        dword ptr [ecx+34]
 00051FCC    pop         esi
 00051FCD    ret
*}
end;

//00051FD0
procedure TMenuItem.SetCaption(const Value:AnsiString);
begin
{*
 00051FD0    push        ebx
 00051FD1    push        esi
 00051FD2    mov         ebx,edx
 00051FD4    mov         esi,eax
 00051FD6    mov         eax,dword ptr [esi+24]
 00051FD9    mov         edx,ebx
 00051FDB    call        @LStrCmp
>00051FE0    je          00051FF5
 00051FE2    lea         eax,[esi+24]
 00051FE5    mov         edx,ebx
 00051FE7    call        @LStrAsg
 00051FEC    mov         dl,1
 00051FEE    mov         eax,esi
 00051FF0    mov         ecx,dword ptr [eax]
 00051FF2    call        dword ptr [ecx+34]
 00051FF5    pop         esi
 00051FF6    pop         ebx
 00051FF7    ret
*}
end;

//00051FF8
procedure TMenuItem.TurnSiblingsOff;
begin
{*
 00051FF8    push        ebx
 00051FF9    push        esi
 00051FFA    push        edi
 00051FFB    mov         ebx,eax
 00051FFD    mov         esi,dword ptr [ebx+58]
 00052000    test        esi,esi
>00052002    je          0005203C
 00052004    mov         eax,esi
 00052006    call        TMenuItem.GetCount
 0005200B    dec         eax
 0005200C    test        eax,eax
>0005200E    jl          0005203C
 00052010    inc         eax
 00052011    mov         esi,eax
 00052013    xor         edi,edi
 00052015    mov         edx,edi
 00052017    mov         eax,dword ptr [ebx+58]
 0005201A    call        TMenuItem.GetItem
 0005201F    cmp         ebx,eax
>00052021    je          00052038
 00052023    cmp         byte ptr [eax+2F],0
>00052027    je          00052038
 00052029    mov         dl,byte ptr [eax+31]
 0005202C    cmp         dl,byte ptr [ebx+31]
>0005202F    jne         00052038
 00052031    xor         edx,edx
 00052033    call        TMenuItem.SetChecked
 00052038    inc         edi
 00052039    dec         esi
>0005203A    jne         00052015
 0005203C    pop         edi
 0005203D    pop         esi
 0005203E    pop         ebx
 0005203F    ret
*}
end;

//00052040
procedure TMenuItem.SetChecked(Value:Boolean);
begin
{*
 00052040    push        ebx
 00052041    push        esi
 00052042    push        edi
 00052043    mov         ebx,edx
 00052045    mov         esi,eax
 00052047    cmp         bl,byte ptr [esi+2C]
>0005204A    je          0005208E
 0005204C    mov         byte ptr [esi+2C],bl
 0005204F    mov         edi,dword ptr [esi+58]
 00052052    test        edi,edi
>00052054    je          0005207D
 00052056    test        byte ptr [esi+20],2
>0005205A    jne         0005207D
 0005205C    xor         eax,eax
 0005205E    mov         al,bl
 00052060    mov         eax,dword ptr [eax*4+0B490C]
 00052067    or          eax,0
 0005206A    push        eax
 0005206B    movzx       eax,word ptr [esi+44]
 0005206F    push        eax
 00052070    mov         eax,edi
 00052072    call        TMenuItem.GetHandle
 00052077    push        eax
 00052078    call        user32.CheckMenuItem
 0005207D    test        bl,bl
>0005207F    je          0005208E
 00052081    cmp         byte ptr [esi+2F],0
>00052085    je          0005208E
 00052087    mov         eax,esi
 00052089    call        TMenuItem.TurnSiblingsOff
 0005208E    pop         edi
 0005208F    pop         esi
 00052090    pop         ebx
 00052091    ret
*}
end;

//00052094
procedure TMenuItem.SetEnabled(Value:Boolean);
begin
{*
 00052094    push        ebx
 00052095    push        esi
 00052096    push        edi
 00052097    mov         ebx,edx
 00052099    mov         esi,eax
 0005209B    cmp         bl,byte ptr [esi+2D]
>0005209E    je          00052107
 000520A0    mov         byte ptr [esi+2D],bl
 000520A3    mov         eax,[000B5C00]
 000520A8    cmp         dword ptr [eax],2
>000520AB    jne         000520B8
 000520AD    mov         eax,esi
 000520AF    call        TMenuItem.GetCount
 000520B4    test        eax,eax
>000520B6    jne         000520C5
 000520B8    mov         edi,dword ptr [esi+58]
 000520BB    test        edi,edi
>000520BD    je          000520D0
 000520BF    cmp         dword ptr [edi+60],0
>000520C3    je          000520D0
 000520C5    mov         dl,1
 000520C7    mov         eax,esi
 000520C9    mov         ecx,dword ptr [eax]
 000520CB    call        dword ptr [ecx+34]
>000520CE    jmp         00052107
 000520D0    mov         edi,dword ptr [esi+58]
 000520D3    test        edi,edi
>000520D5    je          000520FE
 000520D7    test        byte ptr [esi+20],2
>000520DB    jne         000520FE
 000520DD    xor         eax,eax
 000520DF    mov         al,bl
 000520E1    mov         eax,dword ptr [eax*4+0B4914]
 000520E8    or          eax,0
 000520EB    push        eax
 000520EC    movzx       eax,word ptr [esi+44]
 000520F0    push        eax
 000520F1    mov         eax,edi
 000520F3    call        TMenuItem.GetHandle
 000520F8    push        eax
 000520F9    call        user32.EnableMenuItem
 000520FE    xor         edx,edx
 00052100    mov         eax,esi
 00052102    mov         ecx,dword ptr [eax]
 00052104    call        dword ptr [ecx+34]
 00052107    pop         edi
 00052108    pop         esi
 00052109    pop         ebx
 0005210A    ret
*}
end;

//0005210C
procedure TMenuItem.SetGroupIndex(Value:Byte);
begin
{*
 0005210C    push        ebx
 0005210D    push        esi
 0005210E    push        edi
 0005210F    mov         ebx,edx
 00052111    mov         esi,eax
 00052113    cmp         bl,byte ptr [esi+31]
>00052116    je          00052149
 00052118    mov         edi,dword ptr [esi+58]
 0005211B    test        edi,edi
>0005211D    je          00052133
 0005211F    mov         edx,esi
 00052121    mov         eax,edi
 00052123    call        TMenuItem.IndexOf
 00052128    mov         edx,eax
 0005212A    mov         ecx,ebx
 0005212C    mov         eax,edi
 0005212E    call        TMenuItem.VerifyGroupIndex
 00052133    mov         byte ptr [esi+31],bl
 00052136    cmp         byte ptr [esi+2C],0
>0005213A    je          00052149
 0005213C    cmp         byte ptr [esi+2F],0
>00052140    je          00052149
 00052142    mov         eax,esi
 00052144    call        TMenuItem.TurnSiblingsOff
 00052149    pop         edi
 0005214A    pop         esi
 0005214B    pop         ebx
 0005214C    ret
*}
end;

//00052150
function TMenuItem.GetAction:TBasicAction;
begin
{*
 00052150    mov         edx,dword ptr [eax+38]
 00052153    test        edx,edx
>00052155    je          0005215B
 00052157    mov         eax,dword ptr [edx+0C]
 0005215A    ret
 0005215B    xor         eax,eax
 0005215D    ret
*}
end;

//00052160
procedure TMenuItem.sub_00052160;
begin
{*
 00052160    mov         eax,[0004FD8C];TMenuActionLink
 00052165    ret
*}
end;

//00052168
function TMenuItem.GetCount:Integer;
begin
{*
 00052168    mov         edx,dword ptr [eax+50]
 0005216B    test        edx,edx
>0005216D    jne         00052172
 0005216F    xor         eax,eax
 00052171    ret
 00052172    mov         eax,dword ptr [edx+8]
 00052175    ret
*}
end;

//00052178
function TMenuItem.GetItem(Index:Integer):TMenuItem;
begin
{*
 00052178    push        ebx
 00052179    push        esi
 0005217A    mov         esi,edx
 0005217C    mov         ebx,eax
 0005217E    cmp         dword ptr [ebx+50],0
>00052182    jne         00052189
 00052184    call        IndexError
 00052189    mov         edx,esi
 0005218B    mov         eax,dword ptr [ebx+50]
 0005218E    call        TList.Get
 00052193    pop         esi
 00052194    pop         ebx
 00052195    ret
*}
end;

//00052198
procedure TMenuItem.SetShortCut(Value:TShortCut);
begin
{*
 00052198    push        esi
 00052199    mov         esi,eax
 0005219B    cmp         dx,word ptr [esi+54]
>0005219F    je          000521AE
 000521A1    mov         word ptr [esi+54],dx
 000521A5    mov         dl,1
 000521A7    mov         eax,esi
 000521A9    mov         ecx,dword ptr [eax]
 000521AB    call        dword ptr [ecx+34]
 000521AE    pop         esi
 000521AF    ret
*}
end;

//000521B0
procedure TMenuItem.SetVisible(Value:Boolean);
begin
{*
 000521B0    push        esi
 000521B1    mov         esi,eax
 000521B3    cmp         dl,byte ptr [esi+30]
>000521B6    je          000521C4
 000521B8    mov         byte ptr [esi+30],dl
 000521BB    mov         dl,1
 000521BD    mov         eax,esi
 000521BF    mov         ecx,dword ptr [eax]
 000521C1    call        dword ptr [ecx+34]
 000521C4    pop         esi
 000521C5    ret
*}
end;

//000521C8
procedure TMenuItem.SetImageIndex(Value:Integer);
begin
{*
 000521C8    push        esi
 000521C9    mov         esi,eax
 000521CB    cmp         edx,dword ptr [esi+34]
>000521CE    je          000521DC
 000521D0    mov         dword ptr [esi+34],edx
 000521D3    mov         dl,1
 000521D5    mov         eax,esi
 000521D7    mov         ecx,dword ptr [eax]
 000521D9    call        dword ptr [ecx+34]
 000521DC    pop         esi
 000521DD    ret
*}
end;

//000521E0
function TMenuItem.GetMenuIndex:Integer;
begin
{*
 000521E0    or          edx,0FFFFFFFF
 000521E3    mov         ecx,dword ptr [eax+58]
 000521E6    test        ecx,ecx
>000521E8    je          000521F5
 000521EA    mov         edx,eax
 000521EC    mov         eax,ecx
 000521EE    call        TMenuItem.IndexOf
 000521F3    mov         edx,eax
 000521F5    mov         eax,edx
 000521F7    ret
*}
end;

//000521F8
procedure TMenuItem.SetMenuIndex(Value:Integer);
begin
{*
 000521F8    push        ebx
 000521F9    push        esi
 000521FA    push        edi
 000521FB    mov         esi,edx
 000521FD    mov         ebx,eax
 000521FF    mov         eax,dword ptr [ebx+58]
 00052202    test        eax,eax
>00052204    je          0005223A
 00052206    call        TMenuItem.GetCount
 0005220B    test        esi,esi
>0005220D    jge         00052211
 0005220F    xor         esi,esi
 00052211    cmp         eax,esi
>00052213    jg          00052218
 00052215    mov         esi,eax
 00052217    dec         esi
 00052218    mov         eax,ebx
 0005221A    call        TMenuItem.GetMenuIndex
 0005221F    cmp         esi,eax
>00052221    je          0005223A
 00052223    mov         edi,dword ptr [ebx+58]
 00052226    mov         edx,ebx
 00052228    mov         eax,edi
 0005222A    call        TMenuItem.Remove
 0005222F    mov         ecx,ebx
 00052231    mov         edx,esi
 00052233    mov         eax,edi
 00052235    call        TMenuItem.Insert
 0005223A    pop         edi
 0005223B    pop         esi
 0005223C    pop         ebx
 0005223D    ret
*}
end;

//00052240
procedure TMenuItem.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00052240    push        ebp
 00052241    mov         ebp,esp
 00052243    push        ecx
 00052244    push        ebx
 00052245    push        esi
 00052246    mov         dword ptr [ebp-4],eax
 00052249    mov         eax,dword ptr [ebp-4]
 0005224C    call        TMenuItem.GetCount
 00052251    mov         ebx,eax
 00052253    dec         ebx
 00052254    test        ebx,ebx
>00052256    jl          00052271
 00052258    inc         ebx
 00052259    xor         esi,esi
 0005225B    mov         edx,esi
 0005225D    mov         eax,dword ptr [ebp-4]
 00052260    call        TMenuItem.GetItem
 00052265    mov         edx,eax
 00052267    mov         eax,dword ptr [ebp+0C]
 0005226A    call        dword ptr [ebp+8]
 0005226D    inc         esi
 0005226E    dec         ebx
>0005226F    jne         0005225B
 00052271    pop         esi
 00052272    pop         ebx
 00052273    pop         ecx
 00052274    pop         ebp
 00052275    ret         8
*}
end;

//00052278
procedure TMenuItem.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 00052278    push        ebx
 00052279    push        esi
 0005227A    mov         esi,ecx
 0005227C    mov         ebx,edx
 0005227E    mov         eax,ebx
 00052280    mov         edx,dword ptr ds:[4FE44];TMenuItem
 00052286    call        @AsClass
 0005228B    mov         edx,esi
 0005228D    call        TMenuItem.SetMenuIndex
 00052292    pop         esi
 00052293    pop         ebx
 00052294    ret
*}
end;

//00052298
procedure TMenuItem.SetDefault(Value:Boolean);
begin
{*
 00052298    push        ebx
 00052299    push        esi
 0005229A    push        edi
 0005229B    push        ebp
 0005229C    mov         ebx,edx
 0005229E    mov         esi,eax
 000522A0    cmp         bl,byte ptr [esi+2E]
>000522A3    je          000522EF
 000522A5    test        bl,bl
>000522A7    je          000522E3
 000522A9    cmp         dword ptr [esi+58],0
>000522AD    je          000522E3
 000522AF    mov         eax,dword ptr [esi+58]
 000522B2    call        TMenuItem.GetCount
 000522B7    mov         edi,eax
 000522B9    dec         edi
 000522BA    test        edi,edi
>000522BC    jl          000522E3
 000522BE    inc         edi
 000522BF    xor         ebp,ebp
 000522C1    mov         edx,ebp
 000522C3    mov         eax,dword ptr [esi+58]
 000522C6    call        TMenuItem.GetItem
 000522CB    cmp         byte ptr [eax+2E],0
>000522CF    je          000522DF
 000522D1    mov         edx,ebp
 000522D3    mov         eax,dword ptr [esi+58]
 000522D6    call        TMenuItem.GetItem
 000522DB    mov         byte ptr [eax+2E],0
 000522DF    inc         ebp
 000522E0    dec         edi
>000522E1    jne         000522C1
 000522E3    mov         byte ptr [esi+2E],bl
 000522E6    mov         dl,1
 000522E8    mov         eax,esi
 000522EA    mov         ecx,dword ptr [eax]
 000522EC    call        dword ptr [ecx+34]
 000522EF    pop         ebp
 000522F0    pop         edi
 000522F1    pop         esi
 000522F2    pop         ebx
 000522F3    ret
*}
end;

//000522F4
procedure TMenuItem.InitiateAction;
begin
{*
 000522F4    mov         edx,dword ptr [eax+38]
 000522F7    test        edx,edx
>000522F9    je          00052302
 000522FB    mov         eax,edx
 000522FD    mov         edx,dword ptr [eax]
 000522FF    call        dword ptr [edx+18]
 00052302    ret
*}
end;

//00052304
procedure TMenuItem.Insert(Index:Integer; Item:TMenuItem);
begin
{*
 00052304    push        ebp
 00052305    mov         ebp,esp
 00052307    push        0
 00052309    push        ebx
 0005230A    push        esi
 0005230B    push        edi
 0005230C    mov         ebx,ecx
 0005230E    mov         edi,edx
 00052310    mov         esi,eax
 00052312    xor         eax,eax
 00052314    push        ebp
 00052315    push        523F0
 0005231A    push        dword ptr fs:[eax]
 0005231D    mov         dword ptr fs:[eax],esp
 00052320    cmp         dword ptr [ebx+58],0
>00052324    je          00052347
 00052326    lea         edx,[ebp-4]
 00052329    mov         eax,[000B5BF0];^SMenuReinserted:TResStringRec
 0005232E    call        LoadResString
 00052333    mov         ecx,dword ptr [ebp-4]
 00052336    mov         dl,1
 00052338    mov         eax,[0004FBF4];EMenuError
 0005233D    call        Exception.Create
 00052342    call        @RaiseExcept
 00052347    cmp         dword ptr [esi+50],0
>0005234B    jne         0005235C
 0005234D    mov         dl,1
 0005234F    mov         eax,[0001EEC4];TList
 00052354    call        TObject.Create
 00052359    mov         dword ptr [esi+50],eax
 0005235C    mov         eax,edi
 0005235E    dec         eax
 0005235F    test        eax,eax
>00052361    jl          00052396
 00052363    mov         eax,edi
 00052365    dec         eax
 00052366    mov         edx,dword ptr [esi+50]
 00052369    cmp         eax,dword ptr [edx+8]
>0005236C    jge         00052396
 0005236E    mov         edx,edi
 00052370    dec         edx
 00052371    mov         eax,dword ptr [esi+50]
 00052374    call        TList.Get
 00052379    mov         al,byte ptr [eax+31]
 0005237C    cmp         al,byte ptr [ebx+31]
>0005237F    jbe         00052396
 00052381    mov         edx,edi
 00052383    dec         edx
 00052384    mov         eax,dword ptr [esi+50]
 00052387    call        TList.Get
 0005238C    mov         dl,byte ptr [eax+31]
 0005238F    mov         eax,ebx
 00052391    call        TMenuItem.SetGroupIndex
 00052396    mov         cl,byte ptr [ebx+31]
 00052399    mov         edx,edi
 0005239B    mov         eax,esi
 0005239D    call        TMenuItem.VerifyGroupIndex
 000523A2    mov         ecx,ebx
 000523A4    mov         edx,edi
 000523A6    mov         eax,dword ptr [esi+50]
 000523A9    call        TList.Insert
 000523AE    mov         dword ptr [ebx+58],esi
 000523B1    mov         dword ptr [ebx+70],esi
 000523B4    mov         dword ptr [ebx+6C],525A8;TMenuItem.SubItemChanged
 000523BB    cmp         dword ptr [esi+28],0
>000523BF    je          000523C8
 000523C1    mov         eax,esi
 000523C3    call        TMenuItem.RebuildHandle
 000523C8    mov         eax,esi
 000523CA    call        TMenuItem.GetCount
 000523CF    dec         eax
 000523D0    sete        dl
 000523D3    mov         eax,esi
 000523D5    mov         ecx,dword ptr [eax]
 000523D7    call        dword ptr [ecx+34]
 000523DA    xor         eax,eax
 000523DC    pop         edx
 000523DD    pop         ecx
 000523DE    pop         ecx
 000523DF    mov         dword ptr fs:[eax],edx
 000523E2    push        523F7
 000523E7    lea         eax,[ebp-4]
 000523EA    call        @LStrClr
 000523EF    ret
>000523F0    jmp         @HandleFinally
>000523F5    jmp         000523E7
 000523F7    pop         edi
 000523F8    pop         esi
 000523F9    pop         ebx
 000523FA    pop         ecx
 000523FB    pop         ebp
 000523FC    ret
*}
end;

//00052400
procedure TMenuItem.Delete(Index:Integer);
begin
{*
 00052400    push        ebx
 00052401    push        esi
 00052402    push        edi
 00052403    mov         ebx,edx
 00052405    mov         esi,eax
 00052407    test        ebx,ebx
>00052409    jl          0005241C
 0005240B    cmp         dword ptr [esi+50],0
>0005240F    je          0005241C
 00052411    mov         eax,esi
 00052413    call        TMenuItem.GetCount
 00052418    cmp         ebx,eax
>0005241A    jl          00052421
 0005241C    call        IndexError
 00052421    mov         edx,ebx
 00052423    mov         eax,dword ptr [esi+50]
 00052426    call        TList.Get
 0005242B    mov         edi,eax
 0005242D    mov         edx,ebx
 0005242F    mov         eax,dword ptr [esi+50]
 00052432    call        TList.Delete
 00052437    xor         eax,eax
 00052439    mov         dword ptr [edi+58],eax
 0005243C    xor         eax,eax
 0005243E    mov         dword ptr [edi+6C],eax
 00052441    mov         dword ptr [edi+70],eax
 00052444    cmp         dword ptr [esi+28],0
>00052448    je          00052451
 0005244A    mov         eax,esi
 0005244C    call        TMenuItem.RebuildHandle
 00052451    mov         eax,esi
 00052453    call        TMenuItem.GetCount
 00052458    test        eax,eax
 0005245A    sete        dl
 0005245D    mov         eax,esi
 0005245F    mov         ecx,dword ptr [eax]
 00052461    call        dword ptr [ecx+34]
 00052464    pop         edi
 00052465    pop         esi
 00052466    pop         ebx
 00052467    ret
*}
end;

//00052468
procedure TMenuItem.Click;
begin
{*
 00052468    push        ebx
 00052469    mov         ebx,eax
 0005246B    cmp         byte ptr [ebx+2D],0
>0005246F    je          000524C5
 00052471    cmp         word ptr [ebx+76],0
>00052476    je          0005249C
 00052478    mov         eax,ebx
 0005247A    call        TMenuItem.GetAction
 0005247F    test        eax,eax
>00052481    je          0005249C
 00052483    mov         eax,ebx
 00052485    call        TMenuItem.GetAction
 0005248A    mov         eax,dword ptr [eax+2C]
 0005248D    cmp         eax,dword ptr [ebx+74]
>00052490    je          0005249C
 00052492    mov         edx,ebx
 00052494    mov         eax,dword ptr [ebx+78]
 00052497    call        dword ptr [ebx+74]
>0005249A    jmp         000524C5
 0005249C    test        byte ptr [ebx+20],10
>000524A0    jne         000524B6
 000524A2    cmp         dword ptr [ebx+38],0
>000524A6    je          000524B6
 000524A8    mov         eax,dword ptr [ebx+38]
 000524AB    mov         bx,0FFFF
 000524AF    call        @CallDynaInst
>000524B4    jmp         000524C5
 000524B6    cmp         word ptr [ebx+76],0
>000524BB    je          000524C5
 000524BD    mov         edx,ebx
 000524BF    mov         eax,dword ptr [ebx+78]
 000524C2    call        dword ptr [ebx+74]
 000524C5    pop         ebx
 000524C6    ret
*}
end;

//000524C8
function TMenuItem.IndexOf(Item:TMenuItem):Integer;
begin
{*
 000524C8    push        esi
 000524C9    or          ecx,0FFFFFFFF
 000524CC    mov         esi,dword ptr [eax+50]
 000524CF    test        esi,esi
>000524D1    je          000524DC
 000524D3    mov         eax,esi
 000524D5    call        TList.IndexOf
 000524DA    mov         ecx,eax
 000524DC    mov         eax,ecx
 000524DE    pop         esi
 000524DF    ret
*}
end;

//000524E0
procedure TMenuItem.Add(Item:TMenuItem);
begin
{*
 000524E0    push        ebx
 000524E1    push        esi
 000524E2    mov         esi,edx
 000524E4    mov         ebx,eax
 000524E6    mov         eax,ebx
 000524E8    call        TMenuItem.GetCount
 000524ED    mov         edx,eax
 000524EF    mov         ecx,esi
 000524F1    mov         eax,ebx
 000524F3    call        TMenuItem.Insert
 000524F8    pop         esi
 000524F9    pop         ebx
 000524FA    ret
*}
end;

//000524FC
procedure TMenuItem.Remove(Item:TMenuItem);
begin
{*
 000524FC    push        ebp
 000524FD    mov         ebp,esp
 000524FF    push        0
 00052501    push        ebx
 00052502    mov         ebx,eax
 00052504    xor         eax,eax
 00052506    push        ebp
 00052507    push        5255E
 0005250C    push        dword ptr fs:[eax]
 0005250F    mov         dword ptr fs:[eax],esp
 00052512    mov         eax,ebx
 00052514    call        TMenuItem.IndexOf
 00052519    cmp         eax,0FFFFFFFF
>0005251C    jne         0005253F
 0005251E    lea         edx,[ebp-4]
 00052521    mov         eax,[000B5B28];^SMenuNotFound:TResStringRec
 00052526    call        LoadResString
 0005252B    mov         ecx,dword ptr [ebp-4]
 0005252E    mov         dl,1
 00052530    mov         eax,[0004FBF4];EMenuError
 00052535    call        Exception.Create
 0005253A    call        @RaiseExcept
 0005253F    mov         edx,eax
 00052541    mov         eax,ebx
 00052543    call        TMenuItem.Delete
 00052548    xor         eax,eax
 0005254A    pop         edx
 0005254B    pop         ecx
 0005254C    pop         ecx
 0005254D    mov         dword ptr fs:[eax],edx
 00052550    push        52565
 00052555    lea         eax,[ebp-4]
 00052558    call        @LStrClr
 0005255D    ret
>0005255E    jmp         @HandleFinally
>00052563    jmp         00052555
 00052565    pop         ebx
 00052566    pop         ecx
 00052567    pop         ebp
 00052568    ret
*}
end;

//0005256C
procedure TMenuItem.MenuChanged(Rebuild:Boolean);
begin
{*
 0005256C    push        ebx
 0005256D    push        esi
 0005256E    mov         ebx,edx
 00052570    mov         esi,eax
 00052572    cmp         dword ptr [esi+58],0
>00052576    jne         0005258E
 00052578    mov         eax,dword ptr [esi+4]
 0005257B    mov         edx,dword ptr ds:[50194];TMenu
 00052581    call        @IsClass
 00052586    test        al,al
>00052588    je          0005258E
 0005258A    xor         eax,eax
>0005258C    jmp         00052590
 0005258E    mov         eax,esi
 00052590    cmp         word ptr [esi+6E],0
>00052595    je          000525A2
 00052597    push        ebx
 00052598    mov         ecx,eax
 0005259A    mov         edx,esi
 0005259C    mov         eax,dword ptr [esi+70]
 0005259F    call        dword ptr [esi+6C]
 000525A2    pop         esi
 000525A3    pop         ebx
 000525A4    ret
*}
end;

//000525A8
procedure TMenuItem.SubItemChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 000525A8    push        ebp
 000525A9    mov         ebp,esp
 000525AB    push        ebx
 000525AC    push        esi
 000525AD    mov         esi,ecx
 000525AF    mov         ebx,eax
 000525B1    cmp         byte ptr [ebp+8],0
>000525B5    je          000525CA
 000525B7    cmp         dword ptr [ebx+28],0
>000525BB    jne         000525C3
 000525BD    cmp         dword ptr [ebx+60],0
>000525C1    je          000525CA
 000525C3    mov         eax,ebx
 000525C5    call        TMenuItem.RebuildHandle
 000525CA    mov         eax,dword ptr [ebx+58]
 000525CD    test        eax,eax
>000525CF    je          000525DE
 000525D1    push        0
 000525D3    mov         ecx,esi
 000525D5    mov         edx,ebx
 000525D7    call        TMenuItem.SubItemChanged
>000525DC    jmp         000525F9
 000525DE    mov         esi,dword ptr [ebx+4]
 000525E1    mov         eax,esi
 000525E3    mov         edx,dword ptr ds:[50288];TMainMenu
 000525E9    call        @IsClass
 000525EE    test        al,al
>000525F0    je          000525F9
 000525F2    mov         eax,esi
 000525F4    call        TMainMenu.ItemChanged
 000525F9    pop         esi
 000525FA    pop         ebx
 000525FB    pop         ebp
 000525FC    ret         4
*}
end;

//00052600
function TMenuItem.GetBitmap:TBitmap;
begin
{*
 00052600    push        ebx
 00052601    mov         ebx,eax
 00052603    cmp         dword ptr [ebx+40],0
>00052607    jne         00052618
 00052609    mov         dl,1
 0005260B    mov         eax,[00028F70];TBitmap
 00052610    call        TBitmap.Create
 00052615    mov         dword ptr [ebx+40],eax
 00052618    mov         dl,1
 0005261A    mov         eax,dword ptr [ebx+40]
 0005261D    mov         ecx,dword ptr [eax]
 0005261F    call        dword ptr [ecx+3C]
 00052622    mov         eax,dword ptr [ebx+40]
 00052625    pop         ebx
 00052626    ret
*}
end;

//00052628
procedure TMenuItem.SetAction(Value:TBasicAction);
begin
{*
 00052628    push        ebx
 00052629    push        esi
 0005262A    push        edi
 0005262B    mov         edi,edx
 0005262D    mov         esi,eax
 0005262F    test        edi,edi
>00052631    jne         00052642
 00052633    mov         eax,dword ptr [esi+38]
 00052636    call        TObject.Free
 0005263B    xor         eax,eax
 0005263D    mov         dword ptr [esi+38],eax
>00052640    jmp         00052691
 00052642    cmp         dword ptr [esi+38],0
>00052646    jne         0005265D
 00052648    mov         eax,esi
 0005264A    mov         bx,0FFEF
 0005264E    call        @CallDynaInst
 00052653    mov         ecx,esi
 00052655    mov         dl,1
 00052657    call        dword ptr [eax+14]
 0005265A    mov         dword ptr [esi+38],eax
 0005265D    mov         edx,edi
 0005265F    mov         eax,dword ptr [esi+38]
 00052662    mov         ecx,dword ptr [eax]
 00052664    call        dword ptr [ecx+0C]
 00052667    mov         eax,dword ptr [esi+38]
 0005266A    mov         dword ptr [eax+8],esi
 0005266D    mov         dword ptr [eax+4],5287C;TMenuItem.DoActionChange
 00052674    test        byte ptr [edi+20],1
 00052678    setne       cl
 0005267B    mov         edx,edi
 0005267D    mov         eax,esi
 0005267F    mov         bx,0FFF0
 00052683    call        @CallDynaInst
 00052688    mov         edx,esi
 0005268A    mov         eax,edi
 0005268C    call        TComponent.FreeNotification
 00052691    pop         edi
 00052692    pop         esi
 00052693    pop         ebx
 00052694    ret
*}
end;

//00052698
procedure TMenuItem.SetBitmap(Value:TBitmap);
begin
{*
 00052698    push        ebx
 00052699    push        esi
 0005269A    mov         ebx,edx
 0005269C    mov         esi,eax
 0005269E    cmp         dword ptr [esi+40],0
>000526A2    jne         000526B3
 000526A4    mov         dl,1
 000526A6    mov         eax,[00028F70];TBitmap
 000526AB    call        TBitmap.Create
 000526B0    mov         dword ptr [esi+40],eax
 000526B3    mov         edx,ebx
 000526B5    mov         eax,dword ptr [esi+40]
 000526B8    mov         ecx,dword ptr [eax]
 000526BA    call        dword ptr [ecx+8]
 000526BD    xor         edx,edx
 000526BF    mov         eax,esi
 000526C1    mov         ecx,dword ptr [eax]
 000526C3    call        dword ptr [ecx+34]
 000526C6    pop         esi
 000526C7    pop         ebx
 000526C8    ret
*}
end;

//000526CC
procedure TMenuItem.InitiateActions;
begin
{*
 000526CC    push        ebx
 000526CD    push        esi
 000526CE    push        edi
 000526CF    mov         edi,eax
 000526D1    mov         eax,edi
 000526D3    call        TMenuItem.GetCount
 000526D8    mov         ebx,eax
 000526DA    dec         ebx
 000526DB    test        ebx,ebx
>000526DD    jl          000526F4
 000526DF    inc         ebx
 000526E0    xor         esi,esi
 000526E2    mov         edx,esi
 000526E4    mov         eax,edi
 000526E6    call        TMenuItem.GetItem
 000526EB    mov         edx,dword ptr [eax]
 000526ED    call        dword ptr [edx+38]
 000526F0    inc         esi
 000526F1    dec         ebx
>000526F2    jne         000526E2
 000526F4    pop         edi
 000526F5    pop         esi
 000526F6    pop         ebx
 000526F7    ret
*}
end;

//000526F8
procedure TMenuItem.GetParentComponent;
begin
{*
 000526F8    mov         edx,dword ptr [eax+58]
 000526FB    test        edx,edx
>000526FD    je          00052709
 000526FF    cmp         dword ptr [edx+64],0
>00052703    je          00052709
 00052705    mov         eax,dword ptr [edx+64]
 00052708    ret
 00052709    mov         eax,edx
 0005270B    ret
*}
end;

//0005270C
procedure TMenuItem.SetParentComponent(Value:TComponent);
begin
{*
 0005270C    push        ebx
 0005270D    push        esi
 0005270E    mov         esi,edx
 00052710    mov         ebx,eax
 00052712    mov         eax,dword ptr [ebx+58]
 00052715    test        eax,eax
>00052717    je          00052720
 00052719    mov         edx,ebx
 0005271B    call        TMenuItem.Remove
 00052720    test        esi,esi
>00052722    je          0005275B
 00052724    mov         eax,esi
 00052726    mov         edx,dword ptr ds:[50194];TMenu
 0005272C    call        @IsClass
 00052731    test        al,al
>00052733    je          00052741
 00052735    mov         eax,dword ptr [esi+28]
 00052738    mov         edx,ebx
 0005273A    call        TMenuItem.Add
>0005273F    jmp         0005275B
 00052741    mov         eax,esi
 00052743    mov         edx,dword ptr ds:[4FE44];TMenuItem
 00052749    call        @IsClass
 0005274E    test        al,al
>00052750    je          0005275B
 00052752    mov         edx,ebx
 00052754    mov         eax,esi
 00052756    call        TMenuItem.Add
 0005275B    pop         esi
 0005275C    pop         ebx
 0005275D    ret
*}
end;

//00052760
function TMenuItem.GetParentMenu:TMenu;
begin
{*
>00052760    jmp         00052764
 00052762    mov         eax,edx
 00052764    mov         edx,dword ptr [eax+58]
 00052767    test        edx,edx
>00052769    jne         00052762
 0005276B    mov         eax,dword ptr [eax+64]
 0005276E    ret
*}
end;

//00052770
procedure TMenuItem.SetRadioItem(Value:Boolean);
begin
{*
 00052770    push        esi
 00052771    mov         esi,eax
 00052773    cmp         dl,byte ptr [esi+2F]
>00052776    je          00052797
 00052778    mov         byte ptr [esi+2F],dl
 0005277B    cmp         byte ptr [esi+2C],0
>0005277F    je          0005278E
 00052781    cmp         byte ptr [esi+2F],0
>00052785    je          0005278E
 00052787    mov         eax,esi
 00052789    call        TMenuItem.TurnSiblingsOff
 0005278E    mov         dl,1
 00052790    mov         eax,esi
 00052792    mov         ecx,dword ptr [eax]
 00052794    call        dword ptr [ecx+34]
 00052797    pop         esi
 00052798    ret
*}
end;

//0005279C
procedure TMenuItem.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 0005279C    push        ebx
 0005279D    push        esi
 0005279E    push        edi
 0005279F    mov         ebx,ecx
 000527A1    mov         edi,edx
 000527A3    mov         esi,eax
 000527A5    mov         eax,esi
 000527A7    call        TMenuItem.GetAction
 000527AC    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 000527B2    call        @IsClass
 000527B7    test        al,al
>000527B9    je          00052875
 000527BF    test        bl,bl
>000527C1    je          000527C9
 000527C3    cmp         dword ptr [esi+24],0
>000527C7    jne         000527D3
 000527C9    mov         edx,dword ptr [edi+4C]
 000527CC    mov         eax,esi
 000527CE    call        TMenuItem.SetCaption
 000527D3    test        bl,bl
>000527D5    je          000527DD
 000527D7    cmp         byte ptr [esi+2C],0
>000527DB    jne         000527E7
 000527DD    mov         dl,byte ptr [edi+50]
 000527E0    mov         eax,esi
 000527E2    call        TMenuItem.SetChecked
 000527E7    test        bl,bl
>000527E9    je          000527F1
 000527EB    cmp         byte ptr [esi+2D],1
>000527EF    jne         000527FB
 000527F1    mov         dl,byte ptr [edi+51]
 000527F4    mov         eax,esi
 000527F6    call        TMenuItem.SetEnabled
 000527FB    test        bl,bl
>000527FD    je          00052805
 000527FF    cmp         dword ptr [esi+48],0
>00052803    jne         0005280B
 00052805    mov         eax,dword ptr [edi+54]
 00052808    mov         dword ptr [esi+48],eax
 0005280B    test        bl,bl
>0005280D    je          00052815
 0005280F    cmp         dword ptr [esi+4C],0
>00052813    jne         00052820
 00052815    lea         eax,[esi+4C]
 00052818    mov         edx,dword ptr [edi+58]
 0005281B    call        @LStrAsg
 00052820    test        bl,bl
>00052822    je          0005282A
 00052824    cmp         dword ptr [esi+34],0FFFFFFFF
>00052828    jne         00052834
 0005282A    mov         edx,dword ptr [edi+5C]
 0005282D    mov         eax,esi
 0005282F    call        TMenuItem.SetImageIndex
 00052834    test        bl,bl
>00052836    je          0005283F
 00052838    cmp         word ptr [esi+54],0
>0005283D    jne         0005284A
 0005283F    mov         dx,word ptr [edi+60]
 00052843    mov         eax,esi
 00052845    call        TMenuItem.SetShortCut
 0005284A    test        bl,bl
>0005284C    je          00052854
 0005284E    cmp         byte ptr [esi+30],1
>00052852    jne         0005285E
 00052854    mov         dl,byte ptr [edi+62]
 00052857    mov         eax,esi
 00052859    call        TMenuItem.SetVisible
 0005285E    test        bl,bl
>00052860    je          00052869
 00052862    cmp         word ptr [esi+76],0
>00052867    jne         00052875
 00052869    mov         eax,dword ptr [edi+2C]
 0005286C    mov         dword ptr [esi+74],eax
 0005286F    mov         eax,dword ptr [edi+30]
 00052872    mov         dword ptr [esi+78],eax
 00052875    pop         edi
 00052876    pop         esi
 00052877    pop         ebx
 00052878    ret
*}
end;

//0005287C
procedure TMenuItem.DoActionChange(Sender:TObject);
begin
{*
 0005287C    push        ebx
 0005287D    push        esi
 0005287E    mov         esi,edx
 00052880    mov         ebx,eax
 00052882    mov         eax,ebx
 00052884    call        TMenuItem.GetAction
 00052889    cmp         esi,eax
>0005288B    jne         0005289C
 0005288D    xor         ecx,ecx
 0005288F    mov         edx,esi
 00052891    mov         eax,ebx
 00052893    mov         bx,0FFF0
 00052897    call        @CallDynaInst
 0005289C    pop         esi
 0005289D    pop         ebx
 0005289E    ret
*}
end;

//000528A0
function TMenuItem.IsCaptionStored(Value:String):Boolean;
begin
{*
 000528A0    push        ebx
 000528A1    push        esi
 000528A2    mov         ebx,eax
 000528A4    mov         esi,dword ptr [ebx+38]
 000528A7    test        esi,esi
>000528A9    je          000528BB
 000528AB    mov         eax,esi
 000528AD    mov         edx,dword ptr [eax]
 000528AF    call        dword ptr [edx+1C]
 000528B2    test        al,al
>000528B4    je          000528BB
 000528B6    xor         eax,eax
 000528B8    pop         esi
 000528B9    pop         ebx
 000528BA    ret
 000528BB    mov         al,1
 000528BD    pop         esi
 000528BE    pop         ebx
 000528BF    ret
*}
end;

//000528C0
function TMenuItem.IsCheckedStored(Value:Boolean):Boolean;
begin
{*
 000528C0    push        ebx
 000528C1    push        esi
 000528C2    mov         ebx,eax
 000528C4    mov         esi,dword ptr [ebx+38]
 000528C7    test        esi,esi
>000528C9    je          000528DB
 000528CB    mov         eax,esi
 000528CD    mov         edx,dword ptr [eax]
 000528CF    call        dword ptr [edx+20]
 000528D2    test        al,al
>000528D4    je          000528DB
 000528D6    xor         eax,eax
 000528D8    pop         esi
 000528D9    pop         ebx
 000528DA    ret
 000528DB    mov         al,1
 000528DD    pop         esi
 000528DE    pop         ebx
 000528DF    ret
*}
end;

//000528E0
function TMenuItem.IsEnabledStored(Value:Boolean):Boolean;
begin
{*
 000528E0    push        ebx
 000528E1    push        esi
 000528E2    mov         ebx,eax
 000528E4    mov         esi,dword ptr [ebx+38]
 000528E7    test        esi,esi
>000528E9    je          000528FB
 000528EB    mov         eax,esi
 000528ED    mov         edx,dword ptr [eax]
 000528EF    call        dword ptr [edx+24]
 000528F2    test        al,al
>000528F4    je          000528FB
 000528F6    xor         eax,eax
 000528F8    pop         esi
 000528F9    pop         ebx
 000528FA    ret
 000528FB    mov         al,1
 000528FD    pop         esi
 000528FE    pop         ebx
 000528FF    ret
*}
end;

//00052900
function TMenuItem.IsHintStored(Value:String):Boolean;
begin
{*
 00052900    push        ebx
 00052901    push        esi
 00052902    mov         ebx,eax
 00052904    mov         esi,dword ptr [ebx+38]
 00052907    test        esi,esi
>00052909    je          0005291B
 0005290B    mov         eax,esi
 0005290D    mov         edx,dword ptr [eax]
 0005290F    call        dword ptr [edx+2C]
 00052912    test        al,al
>00052914    je          0005291B
 00052916    xor         eax,eax
 00052918    pop         esi
 00052919    pop         ebx
 0005291A    ret
 0005291B    mov         al,1
 0005291D    pop         esi
 0005291E    pop         ebx
 0005291F    ret
*}
end;

//00052920
function TMenuItem.IsHelpContextStored(Value:THelpContext):Boolean;
begin
{*
 00052920    push        ebx
 00052921    push        esi
 00052922    mov         ebx,eax
 00052924    mov         esi,dword ptr [ebx+38]
 00052927    test        esi,esi
>00052929    je          0005293B
 0005292B    mov         eax,esi
 0005292D    mov         edx,dword ptr [eax]
 0005292F    call        dword ptr [edx+28]
 00052932    test        al,al
>00052934    je          0005293B
 00052936    xor         eax,eax
 00052938    pop         esi
 00052939    pop         ebx
 0005293A    ret
 0005293B    mov         al,1
 0005293D    pop         esi
 0005293E    pop         ebx
 0005293F    ret
*}
end;

//00052940
function TMenuItem.IsImageIndexStored(Value:Integer):Boolean;
begin
{*
 00052940    push        ebx
 00052941    push        esi
 00052942    mov         ebx,eax
 00052944    mov         esi,dword ptr [ebx+38]
 00052947    test        esi,esi
>00052949    je          0005295B
 0005294B    mov         eax,esi
 0005294D    mov         edx,dword ptr [eax]
 0005294F    call        dword ptr [edx+30]
 00052952    test        al,al
>00052954    je          0005295B
 00052956    xor         eax,eax
 00052958    pop         esi
 00052959    pop         ebx
 0005295A    ret
 0005295B    mov         al,1
 0005295D    pop         esi
 0005295E    pop         ebx
 0005295F    ret
*}
end;

//00052960
function TMenuItem.IsShortCutStored(Value:TShortCut):Boolean;
begin
{*
 00052960    push        ebx
 00052961    push        esi
 00052962    mov         ebx,eax
 00052964    mov         esi,dword ptr [ebx+38]
 00052967    test        esi,esi
>00052969    je          0005297B
 0005296B    mov         eax,esi
 0005296D    mov         edx,dword ptr [eax]
 0005296F    call        dword ptr [edx+34]
 00052972    test        al,al
>00052974    je          0005297B
 00052976    xor         eax,eax
 00052978    pop         esi
 00052979    pop         ebx
 0005297A    ret
 0005297B    mov         al,1
 0005297D    pop         esi
 0005297E    pop         ebx
 0005297F    ret
*}
end;

//00052980
function TMenuItem.IsVisibleStored(Value:Boolean):Boolean;
begin
{*
 00052980    push        ebx
 00052981    push        esi
 00052982    mov         ebx,eax
 00052984    mov         esi,dword ptr [ebx+38]
 00052987    test        esi,esi
>00052989    je          0005299B
 0005298B    mov         eax,esi
 0005298D    mov         edx,dword ptr [eax]
 0005298F    call        dword ptr [edx+38]
 00052992    test        al,al
>00052994    je          0005299B
 00052996    xor         eax,eax
 00052998    pop         esi
 00052999    pop         ebx
 0005299A    ret
 0005299B    mov         al,1
 0005299D    pop         esi
 0005299E    pop         ebx
 0005299F    ret
*}
end;

//000529A0
function TMenuItem.IsOnClickStored(Value:TNotifyEvent):Boolean;
begin
{*
 000529A0    push        ebx
 000529A1    push        esi
 000529A2    mov         ebx,eax
 000529A4    mov         esi,dword ptr [ebx+38]
 000529A7    test        esi,esi
>000529A9    je          000529BB
 000529AB    mov         eax,esi
 000529AD    mov         edx,dword ptr [eax]
 000529AF    call        dword ptr [edx+8]
 000529B2    test        al,al
>000529B4    je          000529BB
 000529B6    xor         eax,eax
 000529B8    pop         esi
 000529B9    pop         ebx
 000529BA    ret
 000529BB    mov         al,1
 000529BD    pop         esi
 000529BE    pop         ebx
 000529BF    ret
*}
end;

//000529C0
procedure TMenuItem.AssignTo(Dest:TPersistent);
begin
{*
 000529C0    push        ebx
 000529C1    push        esi
 000529C2    push        edi
 000529C3    mov         esi,edx
 000529C5    mov         ebx,eax
 000529C7    mov         eax,esi
 000529C9    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 000529CF    call        @IsClass
 000529D4    test        al,al
>000529D6    je          00052A25
 000529D8    mov         dl,byte ptr [ebx+2D]
 000529DB    mov         edi,esi
 000529DD    mov         eax,edi
 000529DF    call        TCustomAction.SetEnabled
 000529E4    mov         edx,dword ptr [ebx+48]
 000529E7    mov         eax,edi
 000529E9    call        TCustomAction.SetHelpContext
 000529EE    mov         edx,dword ptr [ebx+4C]
 000529F1    mov         eax,edi
 000529F3    call        TCustomAction.SetHint
 000529F8    mov         edx,dword ptr [ebx+34]
 000529FB    mov         eax,edi
 000529FD    call        TCustomAction.SetImageIndex
 00052A02    mov         edx,dword ptr [ebx+24]
 00052A05    mov         eax,edi
 00052A07    call        TCustomAction.SetCaption
 00052A0C    mov         dl,byte ptr [ebx+30]
 00052A0F    mov         eax,edi
 00052A11    call        TCustomAction.SetVisible
 00052A16    push        dword ptr [ebx+78]
 00052A19    push        dword ptr [ebx+74]
 00052A1C    mov         eax,edi
 00052A1E    mov         edx,dword ptr [eax]
 00052A20    call        dword ptr [edx+34]
>00052A23    jmp         00052A2E
 00052A25    mov         edx,esi
 00052A27    mov         eax,ebx
 00052A29    call        TPersistent.AssignTo
 00052A2E    pop         edi
 00052A2F    pop         esi
 00052A30    pop         ebx
 00052A31    ret
*}
end;

//00052A34
procedure TMenuItem.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00052A34    push        ebx
 00052A35    push        esi
 00052A36    push        edi
 00052A37    mov         ebx,ecx
 00052A39    mov         esi,edx
 00052A3B    mov         edi,eax
 00052A3D    mov         ecx,ebx
 00052A3F    mov         edx,esi
 00052A41    mov         eax,edi
 00052A43    call        TComponent.Notification
 00052A48    cmp         bl,1
>00052A4B    jne         00052A61
 00052A4D    mov         eax,edi
 00052A4F    call        TMenuItem.GetAction
 00052A54    cmp         esi,eax
>00052A56    jne         00052A61
 00052A58    xor         edx,edx
 00052A5A    mov         eax,edi
 00052A5C    call        TMenuItem.SetAction
 00052A61    pop         edi
 00052A62    pop         esi
 00052A63    pop         ebx
 00052A64    ret
*}
end;

//00052A68
constructor TMenu.Create(AOwner:TComponent);
begin
{*
 00052A68    push        ebp
 00052A69    mov         ebp,esp
 00052A6B    push        ecx
 00052A6C    push        ebx
 00052A6D    push        esi
 00052A6E    push        edi
 00052A6F    test        dl,dl
>00052A71    je          00052A7B
 00052A73    add         esp,0FFFFFFF0
 00052A76    call        @ClassCreate
 00052A7B    mov         edi,ecx
 00052A7D    mov         byte ptr [ebp-1],dl
 00052A80    mov         ebx,eax
 00052A82    mov         ecx,ebx
 00052A84    mov         dl,1
 00052A86    mov         eax,[0004FE44];TMenuItem
 00052A8B    call        TMenuItem.Create
 00052A90    mov         esi,eax
 00052A92    mov         dword ptr [ebx+28],esi
 00052A95    mov         dword ptr [esi+70],ebx
 00052A98    mov         eax,dword ptr [ebx]
 00052A9A    mov         eax,dword ptr [eax+38]
 00052A9D    mov         dword ptr [esi+6C],eax
 00052AA0    mov         dword ptr [esi+64],ebx
 00052AA3    mov         dl,1
 00052AA5    mov         eax,[0004E008];TChangeLink
 00052AAA    call        TObject.Create
 00052AAF    mov         esi,eax
 00052AB1    mov         dword ptr [ebx+38],esi
 00052AB4    mov         dword ptr [esi+0C],ebx
 00052AB7    mov         dword ptr [esi+8],531E8;TMenu.ImageListChange
 00052ABE    mov         byte ptr [ebx+35],1
 00052AC2    mov         ecx,edi
 00052AC4    xor         edx,edx
 00052AC6    mov         eax,ebx
 00052AC8    call        TComponent.Create
 00052ACD    mov         eax,ebx
 00052ACF    call        TMenu.ParentBiDiModeChanged
 00052AD4    mov         eax,ebx
 00052AD6    cmp         byte ptr [ebp-1],0
>00052ADA    je          00052AEB
 00052ADC    call        @AfterConstruction
 00052AE1    pop         dword ptr fs:[0]
 00052AE8    add         esp,0C
 00052AEB    mov         eax,ebx
 00052AED    pop         edi
 00052AEE    pop         esi
 00052AEF    pop         ebx
 00052AF0    pop         ecx
 00052AF1    pop         ebp
 00052AF2    ret
*}
end;

//00052AF4
destructor TMenu.Destroy;
begin
{*
 00052AF4    push        ebx
 00052AF5    push        esi
 00052AF6    call        @BeforeDestruction
 00052AFB    mov         ebx,edx
 00052AFD    mov         esi,eax
 00052AFF    mov         eax,dword ptr [esi+28]
 00052B02    call        TObject.Free
 00052B07    mov         eax,dword ptr [esi+38]
 00052B0A    call        TObject.Free
 00052B0F    mov         edx,ebx
 00052B11    and         dl,0FC
 00052B14    mov         eax,esi
 00052B16    call        TComponent.Destroy
 00052B1B    test        bl,bl
>00052B1D    jle         00052B26
 00052B1F    mov         eax,esi
 00052B21    call        @ClassDestroy
 00052B26    pop         esi
 00052B27    pop         ebx
 00052B28    ret
*}
end;

//00052B2C
procedure TMenu.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00052B2C    push        ebp
 00052B2D    mov         ebp,esp
 00052B2F    push        ebx
 00052B30    push        esi
 00052B31    push        edi
 00052B32    mov         edi,edx
 00052B34    mov         esi,eax
 00052B36    push        dword ptr [ebp+0C]
 00052B39    push        dword ptr [ebp+8]
 00052B3C    mov         edx,edi
 00052B3E    mov         eax,dword ptr [esi+28]
 00052B41    mov         bx,0FFFD
 00052B45    call        @CallDynaInst
 00052B4A    pop         edi
 00052B4B    pop         esi
 00052B4C    pop         ebx
 00052B4D    pop         ebp
 00052B4E    ret         8
*}
end;

//00052B54
function TMenu.GetHandle:HMENU;
begin
{*
 00052B54    mov         eax,dword ptr [eax+28]
 00052B57    call        TMenuItem.GetHandle
 00052B5C    ret
*}
end;

//00052B60
procedure TMenu.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 00052B60    push        ebx
 00052B61    mov         eax,dword ptr [eax+28]
 00052B64    mov         bx,0FFFA
 00052B68    call        @CallDynaInst
 00052B6D    pop         ebx
 00052B6E    ret
*}
end;

//00052B70
function UpdateItem(MenuItem:TMenuItem):Boolean;
begin
{*
 00052B70    push        ebx
 00052B71    push        esi
 00052B72    mov         esi,eax
 00052B74    xor         ebx,ebx
 00052B76    mov         eax,52B70;UpdateItem:Boolean
 00052B7B    mov         ecx,esi
 00052B7D    mov         edx,dword ptr [esi+5C]
 00052B80    call        IterateMenus
 00052B85    push        1
 00052B87    mov         ecx,esi
 00052B89    mov         edx,esi
 00052B8B    mov         eax,esi
 00052B8D    call        TMenuItem.SubItemChanged
 00052B92    mov         eax,ebx
 00052B94    pop         esi
 00052B95    pop         ebx
 00052B96    ret
*}
end;

//00052B98
procedure TMenu.UpdateItems;
begin
{*
 00052B98    push        ebx
 00052B99    mov         ecx,52B70;UpdateItem:Boolean
 00052B9E    mov         edx,dword ptr [eax+28]
 00052BA1    mov         ebx,dword ptr [edx+5C]
 00052BA4    mov         eax,edx
 00052BA6    xchg        eax,ecx
 00052BA7    mov         edx,ebx
 00052BA9    call        IterateMenus
 00052BAE    pop         ebx
 00052BAF    ret
*}
end;

//00052BB0
function Find(Item:TMenuItem):Boolean;
begin
{*
 00052BB0    push        ebp
 00052BB1    mov         ebp,esp
 00052BB3    push        ecx
 00052BB4    push        ebx
 00052BB5    push        esi
 00052BB6    push        edi
 00052BB7    mov         ebx,eax
 00052BB9    mov         byte ptr [ebp-1],0
 00052BBD    mov         eax,dword ptr [ebp+8]
 00052BC0    cmp         byte ptr [eax-1],0
>00052BC4    jne         00052BD4
 00052BC6    mov         eax,dword ptr [ebp+8]
 00052BC9    mov         eax,dword ptr [eax-8]
 00052BCC    movzx       edx,word ptr [ebx+44]
 00052BD0    cmp         eax,edx
>00052BD2    je          00052BFF
 00052BD4    mov         eax,dword ptr [ebp+8]
 00052BD7    cmp         byte ptr [eax-1],1
>00052BDB    jne         00052BE8
 00052BDD    mov         eax,dword ptr [ebp+8]
 00052BE0    mov         eax,dword ptr [eax-8]
 00052BE3    cmp         eax,dword ptr [ebx+28]
>00052BE6    je          00052BFF
 00052BE8    mov         eax,dword ptr [ebp+8]
 00052BEB    cmp         byte ptr [eax-1],2
>00052BEF    jne         00052C0B
 00052BF1    mov         eax,dword ptr [ebp+8]
 00052BF4    mov         eax,dword ptr [eax-8]
 00052BF7    movzx       edx,word ptr [ebx+54]
 00052BFB    cmp         eax,edx
>00052BFD    jne         00052C0B
 00052BFF    mov         eax,dword ptr [ebp+8]
 00052C02    mov         dword ptr [eax-0C],ebx
 00052C05    mov         byte ptr [ebp-1],1
>00052C09    jmp         00052C3D
 00052C0B    mov         eax,ebx
 00052C0D    call        TMenuItem.GetCount
 00052C12    mov         esi,eax
 00052C14    dec         esi
 00052C15    test        esi,esi
>00052C17    jl          00052C3D
 00052C19    inc         esi
 00052C1A    xor         edi,edi
 00052C1C    mov         eax,dword ptr [ebp+8]
 00052C1F    push        eax
 00052C20    mov         edx,edi
 00052C22    mov         eax,ebx
 00052C24    call        TMenuItem.GetItem
 00052C29    call        Find
 00052C2E    pop         ecx
 00052C2F    test        al,al
>00052C31    je          00052C39
 00052C33    mov         byte ptr [ebp-1],1
>00052C37    jmp         00052C3D
 00052C39    inc         edi
 00052C3A    dec         esi
>00052C3B    jne         00052C1C
 00052C3D    mov         al,byte ptr [ebp-1]
 00052C40    pop         edi
 00052C41    pop         esi
 00052C42    pop         ebx
 00052C43    pop         ecx
 00052C44    pop         ebp
 00052C45    ret
*}
end;

//00052C48
function TMenu.FindItem(Value:Integer; Kind:TFindItemKind):TMenuItem;
begin
{*
 00052C48    push        ebp
 00052C49    mov         ebp,esp
 00052C4B    add         esp,0FFFFFFF4
 00052C4E    push        ebx
 00052C4F    mov         byte ptr [ebp-1],cl
 00052C52    mov         dword ptr [ebp-8],edx
 00052C55    xor         edx,edx
 00052C57    mov         dword ptr [ebp-0C],edx
 00052C5A    mov         ecx,52BB0;Find:Boolean
 00052C5F    mov         edx,dword ptr [eax+28]
 00052C62    mov         ebx,dword ptr [edx+5C]
 00052C65    mov         eax,edx
 00052C67    xchg        eax,ecx
 00052C68    mov         edx,ebx
 00052C6A    call        IterateMenus
 00052C6F    mov         eax,dword ptr [ebp-0C]
 00052C72    pop         ebx
 00052C73    mov         esp,ebp
 00052C75    pop         ebp
 00052C76    ret
*}
end;

//00052C78
function TMenu.GetHelpContext(Value:Integer; ByCommand:Boolean):THelpContext;
begin
{*
 00052C78    push        ebx
 00052C79    push        esi
 00052C7A    push        edi
 00052C7B    push        ebp
 00052C7C    push        ecx
 00052C7D    mov         byte ptr [esp],cl
 00052C80    mov         ebp,edx
 00052C82    mov         esi,eax
 00052C84    xor         edi,edi
 00052C86    mov         bl,1
 00052C88    cmp         byte ptr [esp],0
>00052C8C    je          00052C90
 00052C8E    xor         ebx,ebx
 00052C90    cmp         bl,1
>00052C93    jne         00052CBC
 00052C95    mov         eax,esi
 00052C97    mov         edx,dword ptr ds:[50454];TPopupMenu
 00052C9D    call        @IsClass
 00052CA2    test        al,al
>00052CA4    je          00052CBC
 00052CA6    mov         eax,esi
 00052CA8    mov         edx,dword ptr [eax]
 00052CAA    call        dword ptr [edx+34]
 00052CAD    cmp         ebp,eax
>00052CAF    jne         00052CBC
 00052CB1    mov         eax,esi
 00052CB3    call        TPopupMenu.GetHelpContext
 00052CB8    mov         edi,eax
>00052CBA    jmp         00052CDD
 00052CBC    mov         ecx,ebx
 00052CBE    mov         edx,ebp
 00052CC0    mov         eax,esi
 00052CC2    call        TMenu.FindItem
>00052CC7    jmp         00052CCC
 00052CC9    mov         eax,dword ptr [eax+58]
 00052CCC    test        eax,eax
>00052CCE    je          00052CD6
 00052CD0    cmp         dword ptr [eax+48],0
>00052CD4    je          00052CC9
 00052CD6    test        eax,eax
>00052CD8    je          00052CDD
 00052CDA    mov         edi,dword ptr [eax+48]
 00052CDD    mov         eax,edi
 00052CDF    pop         edx
 00052CE0    pop         ebp
 00052CE1    pop         edi
 00052CE2    pop         esi
 00052CE3    pop         ebx
 00052CE4    ret
*}
end;

//00052CE8
function TMenu.DispatchCommand(ACommand:Word):Boolean;
begin
{*
 00052CE8    push        ebx
 00052CE9    xor         ebx,ebx
 00052CEB    movzx       edx,dx
 00052CEE    xor         ecx,ecx
 00052CF0    call        TMenu.FindItem
 00052CF5    test        eax,eax
>00052CF7    je          00052D00
 00052CF9    mov         edx,dword ptr [eax]
 00052CFB    call        dword ptr [edx+3C]
 00052CFE    mov         bl,1
 00052D00    mov         eax,ebx
 00052D02    pop         ebx
 00052D03    ret
*}
end;

//00052D04
function TMenu.DispatchPopup(AHandle:HMENU):Boolean;
begin
{*
 00052D04    push        ebx
 00052D05    push        esi
 00052D06    push        edi
 00052D07    mov         edi,eax
 00052D09    xor         ebx,ebx
 00052D0B    mov         cl,1
 00052D0D    mov         eax,edi
 00052D0F    call        TMenu.FindItem
 00052D14    mov         esi,eax
 00052D16    test        esi,esi
>00052D18    je          00052D32
 00052D1A    test        byte ptr [esi+20],10
>00052D1E    jne         00052D27
 00052D20    mov         eax,esi
 00052D22    call        TMenuItem.InitiateActions
 00052D27    mov         eax,esi
 00052D29    mov         edx,dword ptr [eax]
 00052D2B    call        dword ptr [edx+3C]
 00052D2E    mov         bl,1
>00052D30    jmp         00052D51
 00052D32    test        byte ptr [edi+20],10
>00052D36    jne         00052D51
 00052D38    mov         eax,edi
 00052D3A    mov         edx,dword ptr ds:[50454];TPopupMenu
 00052D40    call        @IsClass
 00052D45    test        al,al
>00052D47    je          00052D51
 00052D49    mov         eax,dword ptr [edi+28]
 00052D4C    call        TMenuItem.InitiateActions
 00052D51    mov         eax,ebx
 00052D53    pop         edi
 00052D54    pop         esi
 00052D55    pop         ebx
 00052D56    ret
*}
end;

//00052D58
function TMenu.IsOwnerDraw:Boolean;
begin
{*
 00052D58    cmp         byte ptr [eax+34],0
>00052D5C    jne         00052D67
 00052D5E    cmp         dword ptr [eax+3C],0
>00052D62    jne         00052D67
 00052D64    xor         eax,eax
 00052D66    ret
 00052D67    mov         al,1
 00052D69    ret
*}
end;

//00052D6C
function DoClick(Item:TMenuItem):TClickResult;
begin
{*
 00052D6C    push        ebp
 00052D6D    mov         ebp,esp
 00052D6F    push        ecx
 00052D70    push        ebx
 00052D71    push        esi
 00052D72    push        edi
 00052D73    mov         ebx,eax
 00052D75    mov         byte ptr [ebp-1],1
 00052D79    mov         eax,dword ptr [ebx+58]
 00052D7C    test        eax,eax
>00052D7E    je          00052D8D
 00052D80    mov         edx,dword ptr [ebp+8]
 00052D83    push        edx
 00052D84    call        DoClick
 00052D89    pop         ecx
 00052D8A    mov         byte ptr [ebp-1],al
 00052D8D    cmp         byte ptr [ebp-1],1
>00052D91    jne         00052E0C
 00052D93    cmp         byte ptr [ebx+2D],0
>00052D97    je          00052E08
 00052D99    xor         eax,eax
 00052D9B    push        ebp
 00052D9C    push        52DEA
 00052DA1    push        dword ptr fs:[eax]
 00052DA4    mov         dword ptr fs:[eax],esp
 00052DA7    mov         eax,dword ptr [ebp+8]
 00052DAA    mov         eax,dword ptr [eax-4]
 00052DAD    test        byte ptr [eax+20],10
>00052DB1    jne         00052DBA
 00052DB3    mov         eax,ebx
 00052DB5    call        TMenuItem.InitiateActions
 00052DBA    mov         eax,ebx
 00052DBC    mov         edx,dword ptr [eax]
 00052DBE    call        dword ptr [edx+3C]
 00052DC1    mov         eax,dword ptr [ebp+8]
 00052DC4    cmp         ebx,dword ptr [eax-8]
>00052DC7    je          00052DE0
 00052DC9    mov         eax,dword ptr [ebp+8]
 00052DCC    mov         eax,dword ptr [eax-8]
 00052DCF    mov         ax,word ptr [eax+54]
 00052DD3    mov         edx,dword ptr [ebp+8]
 00052DD6    cmp         ax,word ptr [edx-0A]
>00052DDA    je          00052DE0
 00052DDC    mov         byte ptr [ebp-1],2
 00052DE0    xor         eax,eax
 00052DE2    pop         edx
 00052DE3    pop         ecx
 00052DE4    pop         ecx
 00052DE5    mov         dword ptr fs:[eax],edx
>00052DE8    jmp         00052E0C
>00052DEA    jmp         @HandleAnyException
 00052DEF    mov         eax,dword ptr [ebp+8]
 00052DF2    mov         edx,dword ptr [eax-4]
 00052DF5    mov         eax,[000B59E8];^Application:TApplication
 00052DFA    mov         eax,dword ptr [eax]
 00052DFC    call        TApplication.HandleException
 00052E01    call        @DoneExcept
>00052E06    jmp         00052E0C
 00052E08    mov         byte ptr [ebp-1],0
 00052E0C    mov         al,byte ptr [ebp-1]
 00052E0F    pop         edi
 00052E10    pop         esi
 00052E11    pop         ebx
 00052E12    pop         ecx
 00052E13    pop         ebp
 00052E14    ret
*}
end;

//00052E18
procedure TMenu.IsShortCut(var Message:TWMKey);
begin
{*
 00052E18    push        ebp
 00052E19    mov         ebp,esp
 00052E1B    add         esp,0FFFFFFF4
 00052E1E    push        ebx
 00052E1F    mov         ebx,edx
 00052E21    mov         dword ptr [ebp-4],eax
 00052E24    xor         eax,eax
 00052E26    mov         al,byte ptr [ebx+4]
 00052E29    mov         word ptr [ebp-0A],ax
 00052E2D    push        10
 00052E2F    call        user32.GetKeyState
 00052E34    test        ax,ax
>00052E37    jge         00052E3F
 00052E39    add         word ptr [ebp-0A],2000
 00052E3F    push        11
 00052E41    call        user32.GetKeyState
 00052E46    test        ax,ax
>00052E49    jge         00052E51
 00052E4B    add         word ptr [ebp-0A],4000
 00052E51    test        byte ptr [ebx+0B],20
>00052E55    je          00052E5D
 00052E57    add         word ptr [ebp-0A],8000
 00052E5D    xor         ebx,ebx
 00052E5F    movzx       edx,word ptr [ebp-0A]
 00052E63    mov         cl,2
 00052E65    mov         eax,dword ptr [ebp-4]
 00052E68    call        TMenu.FindItem
 00052E6D    mov         dword ptr [ebp-8],eax
 00052E70    cmp         dword ptr [ebp-8],0
>00052E74    je          00052E82
 00052E76    push        ebp
 00052E77    mov         eax,dword ptr [ebp-8]
 00052E7A    call        DoClick
 00052E7F    pop         ecx
 00052E80    mov         ebx,eax
 00052E82    cmp         bl,2
>00052E85    je          00052E5D
 00052E87    cmp         dword ptr [ebp-8],0
 00052E8B    setne       al
 00052E8E    pop         ebx
 00052E8F    mov         esp,ebp
 00052E91    pop         ebp
 00052E92    ret
*}
end;

//00052E94
procedure TMainMenu.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 00052E94    mov         al,byte ptr [eax+35];TMainMenu.FParentBiDiMode:Boolean
 00052E97    xor         al,1
 00052E99    ret
*}
end;

//00052E9C
procedure TMenu.DoBiDiModeChanged;
begin
{*
 00052E9C    push        ebx
 00052E9D    push        esi
 00052E9E    add         esp,0FFFFFF80
 00052EA1    mov         ebx,eax
 00052EA3    mov         eax,[000B5C08];SysLocale:TSysLocale
 00052EA8    cmp         byte ptr [eax+9],0
>00052EAC    je          00052F4E
 00052EB2    cmp         dword ptr [ebx+2C],0
>00052EB6    je          00052F4E
 00052EBC    mov         eax,ebx
 00052EBE    mov         edx,dword ptr [eax]
 00052EC0    call        dword ptr [edx+34]
 00052EC3    mov         esi,eax
 00052EC5    mov         dword ptr [esp],2C
 00052ECC    mov         dword ptr [esp+4],10
 00052ED4    lea         eax,[esp+30]
 00052ED8    mov         dword ptr [esp+24],eax
 00052EDC    mov         dword ptr [esp+28],50
 00052EE4    push        esp
 00052EE5    push        0FF
 00052EE7    push        0
 00052EE9    push        esi
 00052EEA    call        user32.GetMenuItemInfoA
 00052EEF    test        eax,eax
>00052EF1    je          00052F4E
 00052EF3    mov         eax,ebx
 00052EF5    call        TMenu.IsRightToLeft
 00052EFA    mov         edx,dword ptr [esp+8]
 00052EFE    and         edx,6000
 00052F04    neg         edx
 00052F06    sbb         edx,edx
 00052F08    neg         edx
 00052F0A    cmp         al,dl
>00052F0C    je          00052F4E
 00052F0E    mov         eax,ebx
 00052F10    call        TMenu.IsRightToLeft
 00052F15    and         eax,7F
 00052F18    shl         eax,0D
 00052F1B    lea         eax,[eax+eax*2]
 00052F1E    mov         edx,dword ptr [esp+8]
 00052F22    and         edx,0FFFF9FFF
 00052F28    or          eax,edx
 00052F2A    mov         dword ptr [esp+8],eax
 00052F2E    mov         dword ptr [esp+4],10
 00052F36    push        esp
 00052F37    push        0FF
 00052F39    push        0
 00052F3B    push        esi
 00052F3C    call        user32.SetMenuItemInfoA
 00052F41    test        eax,eax
>00052F43    je          00052F4E
 00052F45    mov         eax,dword ptr [ebx+2C]
 00052F48    push        eax
 00052F49    call        user32.DrawMenuBar
 00052F4E    add         esp,80
 00052F54    pop         esi
 00052F55    pop         ebx
 00052F56    ret
*}
end;

//00052F58
procedure BuildImage(Menu:HMENU);
begin
{*
 00052F58    push        ebp
 00052F59    mov         ebp,esp
 00052F5B    add         esp,0FFFFFFF4
 00052F5E    push        ebx
 00052F5F    push        esi
 00052F60    push        edi
 00052F61    mov         dword ptr [ebp-4],eax
 00052F64    mov         eax,dword ptr [ebp-4]
 00052F67    push        eax
 00052F68    call        user32.GetMenuItemCount
 00052F6D    mov         dword ptr [ebp-0C],eax
 00052F70    mov         eax,dword ptr [ebp+8]
 00052F73    lea         ebx,[eax-200]
 00052F79    mov         eax,dword ptr [ebp+8]
 00052F7C    add         eax,0FFFFFFFB
 00052F7F    mov         dword ptr [ebp-8],eax
 00052F82    xor         esi,esi
>00052F84    jmp         00053010
 00052F89    push        ebx
 00052F8A    mov         eax,dword ptr [ebp-8]
 00052F8D    sub         eax,ebx
 00052F8F    push        eax
 00052F90    push        400
 00052F95    mov         eax,dword ptr [ebp+8]
 00052F98    mov         eax,dword ptr [eax-204]
 00052F9E    mov         ecx,esi
 00052FA0    mov         edx,dword ptr [ebp-4]
 00052FA3    call        TMenu.DoGetMenuString
 00052FA8    mov         eax,ebx
 00052FAA    call        StrEnd
 00052FAF    mov         ebx,eax
 00052FB1    push        400
 00052FB6    push        esi
 00052FB7    mov         eax,dword ptr [ebp-4]
 00052FBA    push        eax
 00052FBB    call        user32.GetMenuState
 00052FC0    mov         edi,eax
 00052FC2    test        di,2
>00052FC7    je          00052FD7
 00052FC9    mov         edx,53028
 00052FCE    mov         eax,ebx
 00052FD0    call        StrECopy
 00052FD5    mov         ebx,eax
 00052FD7    test        di,40
>00052FDC    je          00052FEC
 00052FDE    mov         edx,5302C
 00052FE3    mov         eax,ebx
 00052FE5    call        StrECopy
 00052FEA    mov         ebx,eax
 00052FEC    test        di,1
>00052FF1    je          00053001
 00052FF3    mov         edx,53030
 00052FF8    mov         eax,ebx
 00052FFA    call        StrECopy
 00052FFF    mov         ebx,eax
 00053001    mov         edx,53034
 00053006    mov         eax,ebx
 00053008    call        StrECopy
 0005300D    mov         ebx,eax
 0005300F    inc         esi
 00053010    cmp         esi,dword ptr [ebp-0C]
>00053013    jge         0005301E
 00053015    cmp         ebx,dword ptr [ebp-8]
>00053018    jb          00052F89
 0005301E    pop         edi
 0005301F    pop         esi
 00053020    pop         ebx
 00053021    mov         esp,ebp
 00053023    pop         ebp
 00053024    ret
*}
end;

//00053038
function TMenu.UpdateImage:Boolean;
begin
{*
 00053038    push        ebp
 00053039    mov         ebp,esp
 0005303B    add         esp,0FFFFFDFC
 00053041    push        ebx
 00053042    mov         dword ptr [ebp-204],eax
 00053048    xor         ebx,ebx
 0005304A    mov         byte ptr [ebp-200],0
 00053051    mov         eax,dword ptr [ebp-204]
 00053057    cmp         dword ptr [eax+2C],0
>0005305B    je          0005306F
 0005305D    push        ebp
 0005305E    mov         eax,dword ptr [ebp-204]
 00053064    mov         edx,dword ptr [eax]
 00053066    call        dword ptr [edx+34]
 00053069    call        BuildImage
 0005306E    pop         ecx
 0005306F    mov         eax,dword ptr [ebp-204]
 00053075    cmp         dword ptr [eax+30],0
>00053079    je          00053098
 0005307B    mov         eax,dword ptr [ebp-204]
 00053081    mov         eax,dword ptr [eax+30]
 00053084    call        @LStrToPChar
 00053089    lea         edx,[ebp-200]
 0005308F    call        StrComp
 00053094    test        eax,eax
>00053096    je          000530B3
 00053098    mov         bl,1
 0005309A    mov         eax,dword ptr [ebp-204]
 000530A0    add         eax,30
 000530A3    lea         edx,[ebp-200]
 000530A9    mov         ecx,200
 000530AE    call        @LStrFromArray
 000530B3    mov         eax,ebx
 000530B5    pop         ebx
 000530B6    mov         esp,ebp
 000530B8    pop         ebp
 000530B9    ret
*}
end;

//000530BC
procedure TMenu.SetOwnerDraw(Value:Boolean);
begin
{*
 000530BC    cmp         dl,byte ptr [eax+34]
>000530BF    je          000530C9
 000530C1    mov         byte ptr [eax+34],dl
 000530C4    call        TMenu.UpdateItems
 000530C9    ret
*}
end;

//000530CC
procedure TMenu.AdjustBiDiBehavior;
begin
{*
 000530CC    push        ebp
 000530CD    mov         ebp,esp
 000530CF    add         esp,0FFFFFFF8
 000530D2    mov         dword ptr [ebp-4],eax
 000530D5    mov         eax,[000B5C08];SysLocale:TSysLocale
 000530DA    cmp         byte ptr [eax+9],0
>000530DE    je          00053143
 000530E0    mov         eax,dword ptr [ebp-4]
 000530E3    mov         al,byte ptr [eax+24]
 000530E6    mov         byte ptr [ebp-5],al
 000530E9    mov         edx,dword ptr [ebp-4]
 000530EC    mov         dl,byte ptr [edx+35]
 000530EF    mov         byte ptr [ebp-6],dl
 000530F2    xor         edx,edx
 000530F4    push        ebp
 000530F5    push        5313C
 000530FA    push        dword ptr fs:[edx]
 000530FD    mov         dword ptr fs:[edx],esp
 00053100    test        al,al
>00053102    jne         00053110
 00053104    mov         dl,1
 00053106    mov         eax,dword ptr [ebp-4]
 00053109    call        TMenu.SetBiDiMode
>0005310E    jmp         0005311A
 00053110    xor         edx,edx
 00053112    mov         eax,dword ptr [ebp-4]
 00053115    call        TMenu.SetBiDiMode
 0005311A    xor         eax,eax
 0005311C    pop         edx
 0005311D    pop         ecx
 0005311E    pop         ecx
 0005311F    mov         dword ptr fs:[eax],edx
 00053122    push        53143
 00053127    mov         dl,byte ptr [ebp-5]
 0005312A    mov         eax,dword ptr [ebp-4]
 0005312D    call        TMenu.SetBiDiMode
 00053132    mov         eax,dword ptr [ebp-4]
 00053135    mov         dl,byte ptr [ebp-6]
 00053138    mov         byte ptr [eax+35],dl
 0005313B    ret
>0005313C    jmp         @HandleFinally
>00053141    jmp         00053127
 00053143    pop         ecx
 00053144    pop         ecx
 00053145    pop         ebp
 00053146    ret
*}
end;

//00053148
procedure TMenu.SetWindowHandle(Value:HWND);
begin
{*
 00053148    push        ebx
 00053149    push        esi
 0005314A    mov         esi,edx
 0005314C    mov         ebx,eax
 0005314E    mov         dword ptr [ebx+2C],esi
 00053151    mov         eax,ebx
 00053153    call        TMenu.UpdateImage
 00053158    mov         eax,[000B5C08];SysLocale:TSysLocale
 0005315D    cmp         byte ptr [eax+9],0
>00053161    je          0005317D
 00053163    test        esi,esi
>00053165    je          0005317D
 00053167    cmp         byte ptr [ebx+35],0
>0005316B    je          00053176
 0005316D    mov         eax,ebx
 0005316F    call        TMenu.ParentBiDiModeChanged
>00053174    jmp         0005317D
 00053176    mov         eax,ebx
 00053178    call        TMenu.AdjustBiDiBehavior
 0005317D    pop         esi
 0005317E    pop         ebx
 0005317F    ret
*}
end;

//00053180
procedure TMenu.DoChange(Source:TMenuItem; Rebuild:Boolean);
begin
{*
 00053180    push        ebx
 00053181    cmp         word ptr [eax+42],0
>00053186    je          00053195
 00053188    push        ecx
 00053189    mov         ebx,eax
 0005318B    mov         ecx,edx
 0005318D    mov         edx,eax
 0005318F    mov         eax,dword ptr [ebx+44]
 00053192    call        dword ptr [ebx+40]
 00053195    pop         ebx
 00053196    ret
*}
end;

//00053198
procedure TMenu.Loaded;
begin
{*
 00053198    push        ebx
 00053199    mov         ebx,eax
 0005319B    mov         eax,ebx
 0005319D    call        TComponent.Loaded
 000531A2    xor         ecx,ecx
 000531A4    xor         edx,edx
 000531A6    mov         eax,ebx
 000531A8    mov         ebx,dword ptr [eax]
 000531AA    call        dword ptr [ebx+30]
 000531AD    pop         ebx
 000531AE    ret
*}
end;

//000531B0
procedure TMenu.MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 000531B0    push        ebp
 000531B1    mov         ebp,esp
 000531B3    push        ebx
 000531B4    push        esi
 000531B5    mov         esi,ecx
 000531B7    mov         ebx,eax
 000531B9    mov         al,[000531E0]
 000531BE    and         al,byte ptr [ebx+20]
 000531C1    mov         dl,byte ptr ds:[531E4]
 000531C7    cmp         dl,al
>000531C9    jne         000531D7
 000531CB    mov         cl,byte ptr [ebp+8]
 000531CE    mov         edx,esi
 000531D0    mov         eax,ebx
 000531D2    mov         ebx,dword ptr [eax]
 000531D4    call        dword ptr [ebx+30]
 000531D7    pop         esi
 000531D8    pop         ebx
 000531D9    pop         ebp
 000531DA    ret         4
*}
end;

//000531E8
procedure TMenu.ImageListChange(Sender:TObject);
begin
{*
 000531E8    cmp         edx,dword ptr [eax+3C]
>000531EB    jne         000531F2
 000531ED    call        TMenu.UpdateItems
 000531F2    ret
*}
end;

//000531F4
procedure TMenu.SetImages(Value:TCustomImageList);
begin
{*
 000531F4    push        ebx
 000531F5    push        esi
 000531F6    mov         esi,edx
 000531F8    mov         ebx,eax
 000531FA    mov         eax,dword ptr [ebx+3C]
 000531FD    test        eax,eax
>000531FF    je          00053209
 00053201    mov         edx,dword ptr [ebx+38]
 00053204    call        TCustomImageList.UnRegisterChanges
 00053209    mov         eax,esi
 0005320B    mov         dword ptr [ebx+3C],eax
 0005320E    test        eax,eax
>00053210    je          00053224
 00053212    mov         edx,dword ptr [ebx+38]
 00053215    call        TCustomImageList.RegisterChanges
 0005321A    mov         edx,ebx
 0005321C    mov         eax,dword ptr [ebx+3C]
 0005321F    call        TComponent.FreeNotification
 00053224    mov         eax,ebx
 00053226    call        TMenu.UpdateItems
 0005322B    pop         esi
 0005322C    pop         ebx
 0005322D    ret
*}
end;

//00053230
procedure TMenu.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00053230    push        ebx
 00053231    push        esi
 00053232    push        edi
 00053233    mov         ebx,ecx
 00053235    mov         esi,edx
 00053237    mov         edi,eax
 00053239    mov         ecx,ebx
 0005323B    mov         edx,esi
 0005323D    mov         eax,edi
 0005323F    call        TComponent.Notification
 00053244    cmp         esi,dword ptr [edi+3C]
>00053247    jne         00053257
 00053249    cmp         bl,1
>0005324C    jne         00053257
 0005324E    xor         edx,edx
 00053250    mov         eax,edi
 00053252    call        TMenu.SetImages
 00053257    pop         edi
 00053258    pop         esi
 00053259    pop         ebx
 0005325A    ret
*}
end;

//0005325C
function TMenu.IsRightToLeft:Boolean;
begin
{*
 0005325C    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 00053262    cmp         byte ptr [edx+9],0
>00053266    je          0005326E
 00053268    cmp         byte ptr [eax+24],0
>0005326C    jne         00053271
 0005326E    xor         eax,eax
 00053270    ret
 00053271    mov         al,1
 00053273    ret
*}
end;

//00053274
function IsAccelChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;
begin
{*
 00053274    push        ebp
 00053275    mov         ebp,esp
 00053277    push        esi
 00053278    xor         esi,esi
 0005327A    test        dl,10
>0005327D    je          00053298
 0005327F    push        ecx
 00053280    push        eax
 00053281    call        user32.GetSubMenu
 00053286    mov         edx,dword ptr [ebp+0C]
 00053289    mov         edx,dword ptr [edx-4]
 0005328C    mov         cl,1
 0005328E    xchg        eax,edx
 0005328F    call        TMenu.FindItem
 00053294    mov         esi,eax
>00053296    jmp         000532B4
 00053298    push        ecx
 00053299    push        eax
 0005329A    call        user32.GetMenuItemID
 0005329F    cmp         eax,0FFFFFFFF
>000532A2    je          000532B4
 000532A4    mov         edx,dword ptr [ebp+0C]
 000532A7    mov         edx,dword ptr [edx-4]
 000532AA    xor         ecx,ecx
 000532AC    xchg        eax,edx
 000532AD    call        TMenu.FindItem
 000532B2    mov         esi,eax
 000532B4    test        esi,esi
>000532B6    je          000532C7
 000532B8    xor         eax,eax
 000532BA    mov         al,byte ptr [ebp+8]
 000532BD    mov         edx,dword ptr [esi+24]
 000532C0    call        IsAccel
>000532C5    jmp         000532C9
 000532C7    xor         eax,eax
 000532C9    pop         esi
 000532CA    pop         ebp
 000532CB    ret         4
*}
end;

//000532D0
function IsInitialChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;
begin
{*
 000532D0    push        ebp
 000532D1    mov         ebp,esp
 000532D3    push        0
 000532D5    push        0
 000532D7    push        0
 000532D9    push        ebx
 000532DA    mov         dword ptr [ebp-4],ecx
 000532DD    xor         ecx,ecx
 000532DF    push        ebp
 000532E0    push        53381
 000532E5    push        dword ptr fs:[ecx]
 000532E8    mov         dword ptr fs:[ecx],esp
 000532EB    test        dl,10
>000532EE    je          0005330C
 000532F0    mov         edx,dword ptr [ebp-4]
 000532F3    push        edx
 000532F4    push        eax
 000532F5    call        user32.GetSubMenu
 000532FA    mov         edx,dword ptr [ebp+0C]
 000532FD    mov         edx,dword ptr [edx-4]
 00053300    mov         cl,1
 00053302    xchg        eax,edx
 00053303    call        TMenu.FindItem
 00053308    mov         ebx,eax
>0005330A    jmp         0005332C
 0005330C    mov         edx,dword ptr [ebp+0C]
 0005330F    mov         edx,dword ptr [edx-4]
 00053312    mov         cl,1
 00053314    xchg        eax,edx
 00053315    call        TMenu.FindItem
 0005331A    mov         ebx,eax
 0005331C    test        ebx,ebx
>0005331E    je          0005332C
 00053320    mov         edx,dword ptr [ebp-4]
 00053323    mov         eax,ebx
 00053325    call        TMenuItem.GetItem
 0005332A    mov         ebx,eax
 0005332C    test        ebx,ebx
>0005332E    je          00053364
 00053330    cmp         dword ptr [ebx+24],0
>00053334    je          00053364
 00053336    lea         eax,[ebp-8]
 00053339    mov         dl,byte ptr [ebp+8]
 0005333C    call        @LStrFromChar
 00053341    mov         eax,dword ptr [ebp-8]
 00053344    push        eax
 00053345    lea         eax,[ebp-0C]
 00053348    mov         edx,dword ptr [ebx+24]
 0005334B    mov         dl,byte ptr [edx]
 0005334D    call        @LStrFromChar
 00053352    mov         eax,dword ptr [ebp-0C]
 00053355    pop         edx
 00053356    call        AnsiCompareText
 0005335B    test        eax,eax
 0005335D    sete        al
 00053360    mov         ebx,eax
>00053362    jmp         00053366
 00053364    xor         ebx,ebx
 00053366    xor         eax,eax
 00053368    pop         edx
 00053369    pop         ecx
 0005336A    pop         ecx
 0005336B    mov         dword ptr fs:[eax],edx
 0005336E    push        53388
 00053373    lea         eax,[ebp-0C]
 00053376    mov         edx,2
 0005337B    call        @LStrArrayClr
 00053380    ret
>00053381    jmp         @HandleFinally
>00053386    jmp         00053373
 00053388    mov         eax,ebx
 0005338A    pop         ebx
 0005338B    mov         esp,ebp
 0005338D    pop         ebp
 0005338E    ret         4
*}
end;

//00053394
procedure TMenu.ProcessMenuChar(var Message:TWMMenuChar);
begin
{*
 00053394    push        ebp
 00053395    mov         ebp,esp
 00053397    add         esp,0FFFFFFE8
 0005339A    push        ebx
 0005339B    push        esi
 0005339C    push        edi
 0005339D    mov         ebx,edx
 0005339F    mov         dword ptr [ebp-4],eax
 000533A2    xor         eax,eax
 000533A4    mov         dword ptr [ebx+0C],eax
 000533A7    mov         dword ptr [ebp-0C],0FFFFFFFF
 000533AE    mov         dword ptr [ebp-10],0FFFFFFFF
 000533B5    mov         dword ptr [ebp-14],0FFFFFFFF
 000533BC    mov         eax,dword ptr [ebx+8]
 000533BF    push        eax
 000533C0    call        user32.GetMenuItemCount
 000533C5    mov         dword ptr [ebp-8],eax
 000533C8    mov         eax,dword ptr [ebp-8]
 000533CB    dec         eax
 000533CC    test        eax,eax
>000533CE    jl          00053447
 000533D0    inc         eax
 000533D1    mov         dword ptr [ebp-18],eax
 000533D4    xor         esi,esi
 000533D6    push        400
 000533DB    push        esi
 000533DC    mov         eax,dword ptr [ebx+8]
 000533DF    push        eax
 000533E0    call        user32.GetMenuState
 000533E5    mov         edi,eax
 000533E7    push        ebp
 000533E8    mov         al,byte ptr [ebx+4]
 000533EB    push        eax
 000533EC    mov         eax,dword ptr [ebx+8]
 000533EF    mov         ecx,esi
 000533F1    mov         edx,edi
 000533F3    call        IsAccelChar
 000533F8    pop         ecx
 000533F9    test        al,al
>000533FB    je          00053441
 000533FD    test        di,2
>00053402    je          00053413
 00053404    cmp         dword ptr [ebp-0C],0
>00053408    jge         00053441
 0005340A    mov         dword ptr [ebp-0C],0FFFFFFFE
>00053411    jmp         00053441
 00053413    cmp         dword ptr [ebp-0C],0
>00053417    jge         00053425
 00053419    mov         dword ptr [ebp-0C],esi
 0005341C    mov         dword ptr [ebx+0C],2
>00053423    jmp         0005342C
 00053425    mov         dword ptr [ebx+0C],3
 0005342C    test        di,80
>00053431    je          00053438
 00053433    mov         dword ptr [ebp-10],esi
>00053436    jmp         00053441
 00053438    cmp         dword ptr [ebp-10],0
>0005343C    jl          00053441
 0005343E    mov         dword ptr [ebp-14],esi
 00053441    inc         esi
 00053442    dec         dword ptr [ebp-18]
>00053445    jne         000533D6
 00053447    cmp         dword ptr [ebp-0C],0FFFFFFFF
>0005344B    jge         00053459
 0005344D    mov         dword ptr [ebx+0C],10000
>00053454    jmp         00053505
 00053459    cmp         dword ptr [ebp-0C],0
>0005345D    jge         000534D8
 0005345F    mov         eax,dword ptr [ebp-8]
 00053462    dec         eax
 00053463    test        eax,eax
>00053465    jl          000534D8
 00053467    inc         eax
 00053468    mov         dword ptr [ebp-18],eax
 0005346B    xor         esi,esi
 0005346D    push        400
 00053472    push        esi
 00053473    mov         eax,dword ptr [ebx+8]
 00053476    push        eax
 00053477    call        user32.GetMenuState
 0005347C    mov         edi,eax
 0005347E    push        ebp
 0005347F    mov         al,byte ptr [ebx+4]
 00053482    push        eax
 00053483    mov         eax,dword ptr [ebx+8]
 00053486    mov         ecx,esi
 00053488    mov         edx,edi
 0005348A    call        IsInitialChar
 0005348F    pop         ecx
 00053490    test        al,al
>00053492    je          000534D2
 00053494    test        di,2
>00053499    je          000534A4
 0005349B    mov         dword ptr [ebx+0C],10000
>000534A2    jmp         00053505
 000534A4    cmp         dword ptr [ebp-0C],0
>000534A8    jge         000534B6
 000534AA    mov         dword ptr [ebp-0C],esi
 000534AD    mov         dword ptr [ebx+0C],2
>000534B4    jmp         000534BD
 000534B6    mov         dword ptr [ebx+0C],3
 000534BD    test        di,80
>000534C2    je          000534C9
 000534C4    mov         dword ptr [ebp-10],esi
>000534C7    jmp         000534D2
 000534C9    cmp         dword ptr [ebp-10],0
>000534CD    jl          000534D2
 000534CF    mov         dword ptr [ebp-14],esi
 000534D2    inc         esi
 000534D3    dec         dword ptr [ebp-18]
>000534D6    jne         0005346D
 000534D8    mov         eax,dword ptr [ebx+0C]
 000534DB    cmp         eax,2
>000534DE    jne         000534EB
 000534E0    shl         eax,10
 000534E3    or          eax,dword ptr [ebp-0C]
 000534E6    mov         dword ptr [ebx+0C],eax
>000534E9    jmp         00053505
 000534EB    cmp         eax,3
>000534EE    jne         00053505
 000534F0    cmp         dword ptr [ebp-14],0
>000534F4    jge         000534FC
 000534F6    mov         edx,dword ptr [ebp-0C]
 000534F9    mov         dword ptr [ebp-14],edx
 000534FC    shl         eax,10
 000534FF    or          eax,dword ptr [ebp-14]
 00053502    mov         dword ptr [ebx+0C],eax
 00053505    pop         edi
 00053506    pop         esi
 00053507    pop         ebx
 00053508    mov         esp,ebp
 0005350A    pop         ebp
 0005350B    ret
*}
end;

//0005350C
function TMenu.DoGetMenuString(Menu:HMENU; ItemID:UINT; Str:PChar; MaxCount:Integer; Flag:UINT):Integer;
begin
{*
 0005350C    push        ebp
 0005350D    mov         ebp,esp
 0005350F    push        ecx
 00053510    push        ebx
 00053511    push        esi
 00053512    push        edi
 00053513    mov         esi,ecx
 00053515    mov         edi,edx
 00053517    mov         ebx,eax
 00053519    mov         eax,ebx
 0005351B    call        TMenu.IsOwnerDraw
 00053520    test        al,al
>00053522    je          00053598
 00053524    xor         eax,eax
 00053526    mov         dword ptr [ebp-4],eax
 00053529    mov         eax,dword ptr [ebp+8]
 0005352C    push        eax
 0005352D    push        esi
 0005352E    push        edi
 0005352F    call        user32.GetMenuState
 00053534    test        al,10
>00053536    je          00053551
 00053538    push        esi
 00053539    push        edi
 0005353A    call        user32.GetSubMenu
 0005353F    mov         edi,eax
 00053541    mov         cl,1
 00053543    mov         edx,edi
 00053545    mov         eax,ebx
 00053547    call        TMenu.FindItem
 0005354C    mov         dword ptr [ebp-4],eax
>0005354F    jmp         0005356D
 00053551    push        esi
 00053552    push        edi
 00053553    call        user32.GetMenuItemID
 00053558    mov         esi,eax
 0005355A    cmp         esi,0FFFFFFFF
>0005355D    je          0005356D
 0005355F    xor         ecx,ecx
 00053561    mov         edx,esi
 00053563    mov         eax,ebx
 00053565    call        TMenu.FindItem
 0005356A    mov         dword ptr [ebp-4],eax
 0005356D    cmp         dword ptr [ebp-4],0
>00053571    je          00053594
 00053573    mov         eax,dword ptr [ebp+10]
 00053576    mov         byte ptr [eax],0
 00053579    mov         eax,dword ptr [ebp-4]
 0005357C    mov         edx,dword ptr [eax+24]
 0005357F    mov         ecx,dword ptr [ebp+0C]
 00053582    mov         eax,dword ptr [ebp+10]
 00053585    call        StrPLCopy
 0005358A    mov         eax,dword ptr [ebp+10]
 0005358D    call        StrLen
>00053592    jmp         000535AB
 00053594    xor         eax,eax
>00053596    jmp         000535AB
 00053598    mov         eax,dword ptr [ebp+8]
 0005359B    push        eax
 0005359C    mov         eax,dword ptr [ebp+0C]
 0005359F    push        eax
 000535A0    mov         eax,dword ptr [ebp+10]
 000535A3    push        eax
 000535A4    push        esi
 000535A5    push        edi
 000535A6    call        user32.GetMenuStringA
 000535AB    pop         edi
 000535AC    pop         esi
 000535AD    pop         ebx
 000535AE    pop         ecx
 000535AF    pop         ebp
 000535B0    ret         0C
*}
end;

//000535B4
procedure TMenu.SetBiDiMode(Value:TBiDiMode);
begin
{*
 000535B4    cmp         dl,byte ptr [eax+24]
>000535B7    je          000535C5
 000535B9    mov         byte ptr [eax+24],dl
 000535BC    mov         byte ptr [eax+35],0
 000535C0    call        TMenu.DoBiDiModeChanged
 000535C5    ret
*}
end;

//000535C8
procedure TMenu.SetParentBiDiMode(Value:Boolean);
begin
{*
 000535C8    cmp         dl,byte ptr [eax+35]
>000535CB    je          000535D5
 000535CD    mov         byte ptr [eax+35],dl
 000535D0    call        TMenu.ParentBiDiModeChanged
 000535D5    ret
*}
end;

//000535D8
procedure TMenu.ParentBiDiModeChanged;
begin
{*
 000535D8    push        ebx
 000535D9    mov         ebx,eax
 000535DB    cmp         byte ptr [ebx+35],0
>000535DF    je          000535FB
 000535E1    mov         eax,dword ptr [ebx+2C]
 000535E4    call        FindControl
 000535E9    test        eax,eax
>000535EB    je          000535FB
 000535ED    mov         dl,byte ptr [eax+4F]
 000535F0    mov         eax,ebx
 000535F2    call        TMenu.SetBiDiMode
 000535F7    mov         byte ptr [ebx+35],1
 000535FB    pop         ebx
 000535FC    ret
*}
end;

//00053600
procedure TMenu.ParentBiDiModeChanged(AControl:TObject);
begin
{*
 00053600    push        ebx
 00053601    push        esi
 00053602    mov         esi,edx
 00053604    mov         ebx,eax
 00053606    cmp         byte ptr [ebx+35],0
>0005360A    je          00053627
 0005360C    mov         eax,esi
 0005360E    mov         edx,dword ptr ds:[3EB50];TControl
 00053614    call        @AsClass
 00053619    mov         dl,byte ptr [eax+4F]
 0005361C    mov         eax,ebx
 0005361E    call        TMenu.SetBiDiMode
 00053623    mov         byte ptr [ebx+35],1
 00053627    pop         esi
 00053628    pop         ebx
 00053629    ret
*}
end;

//0005362C
procedure TMainMenu.SetAutoMerge(Value:Boolean);
begin
{*
 0005362C    cmp         dl,byte ptr [eax+4C]
>0005362F    je          0005364A
 00053631    mov         byte ptr [eax+4C],dl
 00053634    mov         edx,dword ptr [eax+2C]
 00053637    test        edx,edx
>00053639    je          0005364A
 0005363B    push        0
 0005363D    push        0
 0005363F    push        0B015
 00053644    push        edx
 00053645    call        user32.SendMessageA
 0005364A    ret
*}
end;

//0005364C
procedure TMainMenu.MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 0005364C    push        ebp
 0005364D    mov         ebp,esp
 0005364F    push        ebx
 00053650    push        esi
 00053651    push        edi
 00053652    mov         edi,ecx
 00053654    mov         esi,edx
 00053656    mov         ebx,eax
 00053658    cmp         dword ptr [ebx+2C],0
>0005365C    je          00053672
 0005365E    mov         eax,ebx
 00053660    call        TMenu.UpdateImage
 00053665    test        al,al
>00053667    je          00053672
 00053669    mov         eax,dword ptr [ebx+2C]
 0005366C    push        eax
 0005366D    call        user32.DrawMenuBar
 00053672    mov         al,byte ptr [ebp+8]
 00053675    push        eax
 00053676    mov         ecx,edi
 00053678    mov         edx,esi
 0005367A    mov         eax,ebx
 0005367C    call        TMenu.MenuChanged
 00053681    pop         edi
 00053682    pop         esi
 00053683    pop         ebx
 00053684    pop         ebp
 00053685    ret         4
*}
end;

//00053688
procedure TMainMenu.Merge(Menu:TMainMenu);
begin
{*
 00053688    test        edx,edx
>0005368A    je          00053698
 0005368C    mov         eax,dword ptr [eax+28]
 0005368F    mov         edx,dword ptr [edx+28]
 00053692    call        TMenuItem.MergeWith
 00053697    ret
 00053698    xor         edx,edx
 0005369A    mov         eax,dword ptr [eax+28]
 0005369D    call        TMenuItem.MergeWith
 000536A2    ret
*}
end;

//000536A4
procedure TMainMenu.Unmerge(Menu:TMainMenu);
begin
{*
 000536A4    test        edx,edx
>000536A6    je          000536BD
 000536A8    mov         ecx,dword ptr [eax+28]
 000536AB    mov         ecx,dword ptr [ecx+5C]
 000536AE    cmp         ecx,dword ptr [edx+28]
>000536B1    jne         000536BD
 000536B3    xor         edx,edx
 000536B5    mov         eax,dword ptr [eax+28]
 000536B8    call        TMenuItem.MergeWith
 000536BD    ret
*}
end;

//000536C0
procedure TMainMenu.ItemChanged;
begin
{*
 000536C0    push        ebx
 000536C1    push        esi
 000536C2    mov         ebx,eax
 000536C4    push        0
 000536C6    xor         ecx,ecx
 000536C8    xor         edx,edx
 000536CA    mov         eax,ebx
 000536CC    mov         esi,dword ptr [eax]
 000536CE    call        dword ptr [esi+38]
 000536D1    mov         eax,dword ptr [ebx+2C]
 000536D4    test        eax,eax
>000536D6    je          000536E7
 000536D8    push        0
 000536DA    push        0
 000536DC    push        0B015
 000536E1    push        eax
 000536E2    call        user32.SendMessageA
 000536E7    pop         esi
 000536E8    pop         ebx
 000536E9    ret
*}
end;

//000536EC
function TMainMenu.GetHandle:HMENU;
begin
{*
 000536EC    mov         edx,dword ptr [eax+48]
 000536EF    test        edx,edx
>000536F1    je          000536F6
 000536F3    mov         eax,edx
 000536F5    ret
 000536F6    call        TMenu.GetHandle
 000536FB    ret
*}
end;

//0005375C
function GetMenuFont:HFONT;
begin
{*
 0005375C    push        ebp
 0005375D    mov         ebp,esp
 0005375F    add         esp,0FFFFFEAC
 00053765    mov         dword ptr [ebp-154],154
 0005376F    push        0
 00053771    lea         eax,[ebp-154]
 00053777    push        eax
 00053778    push        0
 0005377A    push        29
 0005377C    call        user32.SystemParametersInfoA
 00053781    test        eax,eax
>00053783    je          00053793
 00053785    lea         eax,[ebp-0B4]
 0005378B    push        eax
 0005378C    call        gdi32.CreateFontIndirectA
>00053791    jmp         0005379A
 00053793    push        0D
 00053795    call        gdi32.GetStockObject
 0005379A    mov         esp,ebp
 0005379C    pop         ebp
 0005379D    ret
*}
end;

//000537A0
procedure TPopupList.WndProc(var Message:TMessage);
begin
{*
 000537A0    push        ebp
 000537A1    mov         ebp,esp
 000537A3    add         esp,0FFFFFFD0
 000537A6    push        ebx
 000537A7    push        esi
 000537A8    push        edi
 000537A9    xor         ecx,ecx
 000537AB    mov         dword ptr [ebp-30],ecx
 000537AE    mov         esi,edx
 000537B0    mov         dword ptr [ebp-4],eax
 000537B3    xor         eax,eax
 000537B5    push        ebp
 000537B6    push        53DB8
 000537BB    push        dword ptr fs:[eax]
 000537BE    mov         dword ptr fs:[eax],esp
 000537C1    xor         ecx,ecx
 000537C3    push        ebp
 000537C4    push        53D89
 000537C9    push        dword ptr fs:[ecx]
 000537CC    mov         dword ptr fs:[ecx],esp
 000537CF    mov         eax,dword ptr [esi]
 000537D1    cmp         eax,111
>000537D6    jg          000537F8
>000537D8    je          00053814
 000537DA    sub         eax,2B
>000537DD    je          00053A4B
 000537E3    dec         eax
>000537E4    je          00053BBC
 000537EA    sub         eax,27
>000537ED    je          00053939
>000537F3    jmp         00053D65
 000537F8    sub         eax,117
>000537FD    je          00053853
 000537FF    sub         eax,8
>00053802    je          00053891
 00053808    dec         eax
>00053809    je          00053D14
>0005380F    jmp         00053D65
 00053814    mov         eax,dword ptr [ebp-4]
 00053817    mov         ebx,dword ptr [eax+8]
 0005381A    dec         ebx
 0005381B    test        ebx,ebx
>0005381D    jl          00053D65
 00053823    inc         ebx
 00053824    xor         edi,edi
 00053826    mov         edx,edi
 00053828    mov         eax,dword ptr [ebp-4]
 0005382B    call        TList.Get
 00053830    mov         dx,word ptr [esi+4]
 00053834    call        TMenu.DispatchCommand
 00053839    test        al,al
>0005383B    je          0005384A
 0005383D    xor         eax,eax
 0005383F    pop         edx
 00053840    pop         ecx
 00053841    pop         ecx
 00053842    mov         dword ptr fs:[eax],edx
>00053845    jmp         00053DA2
 0005384A    inc         edi
 0005384B    dec         ebx
>0005384C    jne         00053826
>0005384E    jmp         00053D65
 00053853    mov         eax,dword ptr [ebp-4]
 00053856    mov         ebx,dword ptr [eax+8]
 00053859    dec         ebx
 0005385A    test        ebx,ebx
>0005385C    jl          00053D65
 00053862    inc         ebx
 00053863    xor         edi,edi
 00053865    mov         edx,edi
 00053867    mov         eax,dword ptr [ebp-4]
 0005386A    call        TList.Get
 0005386F    mov         edx,dword ptr [esi+4]
 00053872    call        TMenu.DispatchPopup
 00053877    test        al,al
>00053879    je          00053888
 0005387B    xor         eax,eax
 0005387D    pop         edx
 0005387E    pop         ecx
 0005387F    pop         ecx
 00053880    mov         dword ptr fs:[eax],edx
>00053883    jmp         00053DA2
 00053888    inc         edi
 00053889    dec         ebx
>0005388A    jne         00053865
>0005388C    jmp         00053D65
 00053891    mov         byte ptr [ebp-0D],0
 00053895    test        byte ptr [esi+6],10
>00053899    je          0005389F
 0005389B    mov         byte ptr [ebp-0D],1
 0005389F    mov         eax,dword ptr [ebp-4]
 000538A2    mov         ebx,dword ptr [eax+8]
 000538A5    dec         ebx
 000538A6    test        ebx,ebx
>000538A8    jl          00053926
 000538AA    inc         ebx
 000538AB    xor         edi,edi
 000538AD    cmp         byte ptr [ebp-0D],1
>000538B1    jne         000538D3
 000538B3    mov         eax,dword ptr [esi+8]
 000538B6    test        eax,eax
>000538B8    je          000538CA
 000538BA    movzx       edx,word ptr [esi+4]
 000538BE    push        edx
 000538BF    push        eax
 000538C0    call        user32.GetSubMenu
 000538C5    mov         dword ptr [ebp-8],eax
>000538C8    jmp         000538DA
 000538CA    mov         dword ptr [ebp-8],0FFFFFFFF
>000538D1    jmp         000538DA
 000538D3    movzx       eax,word ptr [esi+4]
 000538D7    mov         dword ptr [ebp-8],eax
 000538DA    mov         edx,edi
 000538DC    mov         eax,dword ptr [ebp-4]
 000538DF    call        TList.Get
 000538E4    mov         cl,byte ptr [ebp-0D]
 000538E7    mov         edx,dword ptr [ebp-8]
 000538EA    call        TMenu.FindItem
 000538EF    mov         dword ptr [ebp-0C],eax
 000538F2    cmp         dword ptr [ebp-0C],0
>000538F6    je          00053922
 000538F8    lea         edx,[ebp-30]
 000538FB    mov         eax,dword ptr [ebp-0C]
 000538FE    mov         eax,dword ptr [eax+4C]
 00053901    call        GetLongHint
 00053906    mov         edx,dword ptr [ebp-30]
 00053909    mov         eax,[000B59E8];^Application:TApplication
 0005390E    mov         eax,dword ptr [eax]
 00053910    call        TApplication.SetHint
 00053915    xor         eax,eax
 00053917    pop         edx
 00053918    pop         ecx
 00053919    pop         ecx
 0005391A    mov         dword ptr fs:[eax],edx
>0005391D    jmp         00053DA2
 00053922    inc         edi
 00053923    dec         ebx
>00053924    jne         000538AD
 00053926    mov         eax,[000B59E8];^Application:TApplication
 0005392B    mov         eax,dword ptr [eax]
 0005392D    xor         edx,edx
 0005392F    call        TApplication.SetHint
>00053934    jmp         00053D65
 00053939    mov         eax,dword ptr [esi+8]
 0005393C    mov         dword ptr [ebp-20],eax
 0005393F    mov         eax,dword ptr [ebp-4]
 00053942    mov         ebx,dword ptr [eax+8]
 00053945    dec         ebx
 00053946    test        ebx,ebx
>00053948    jl          00053D65
 0005394E    inc         ebx
 0005394F    xor         edi,edi
 00053951    mov         edx,edi
 00053953    mov         eax,dword ptr [ebp-4]
 00053956    call        TList.Get
 0005395B    mov         edx,dword ptr [eax]
 0005395D    call        dword ptr [edx+34]
 00053960    mov         edx,dword ptr [ebp-20]
 00053963    cmp         eax,dword ptr [edx+0C]
>00053966    jne         0005397A
 00053968    mov         edx,edi
 0005396A    mov         eax,dword ptr [ebp-4]
 0005396D    call        TList.Get
 00053972    mov         eax,dword ptr [eax+28]
 00053975    mov         dword ptr [ebp-0C],eax
>00053978    jmp         00053994
 0005397A    mov         edx,edi
 0005397C    mov         eax,dword ptr [ebp-4]
 0005397F    call        TList.Get
 00053984    mov         edx,dword ptr [ebp-20]
 00053987    mov         edx,dword ptr [edx+0C]
 0005398A    mov         cl,1
 0005398C    call        TMenu.FindItem
 00053991    mov         dword ptr [ebp-0C],eax
 00053994    cmp         dword ptr [ebp-0C],0
>00053998    je          00053A3E
 0005399E    mov         edx,edi
 000539A0    mov         eax,dword ptr [ebp-4]
 000539A3    call        TList.Get
 000539A8    mov         edx,dword ptr [ebp-20]
 000539AB    mov         edx,dword ptr [edx+8]
 000539AE    mov         cl,1
 000539B0    call        TMenu.GetHelpContext
 000539B5    test        eax,eax
>000539B7    jne         000539D0
 000539B9    mov         edx,edi
 000539BB    mov         eax,dword ptr [ebp-4]
 000539BE    call        TList.Get
 000539C3    mov         edx,dword ptr [ebp-20]
 000539C6    mov         edx,dword ptr [edx+0C]
 000539C9    xor         ecx,ecx
 000539CB    call        TMenu.GetHelpContext
 000539D0    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 000539D6    mov         edx,dword ptr [edx]
 000539D8    mov         edx,dword ptr [edx+60]
 000539DB    test        edx,edx
>000539DD    jne         000539EE
 000539DF    pop         dword ptr fs:[0]
 000539E6    add         esp,8
>000539E9    jmp         00053DA2
 000539EE    test        eax,eax
>000539F0    jne         000539FD
 000539F2    mov         eax,[000B5BDC];^Screen:TScreen
 000539F7    mov         eax,dword ptr [edx+144]
 000539FD    mov         ecx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00053A03    test        byte ptr [edx+208],8
>00053A0A    je          00053A23
 00053A0C    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 00053A12    mov         edx,dword ptr [edx]
 00053A14    mov         ecx,eax
 00053A16    mov         eax,8
 00053A1B    xchg        eax,edx
 00053A1C    call        TApplication.HelpCommand
>00053A21    jmp         00053A31
 00053A23    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 00053A29    mov         edx,dword ptr [edx]
 00053A2B    xchg        eax,edx
 00053A2C    call        TApplication.HelpContext
 00053A31    xor         eax,eax
 00053A33    pop         edx
 00053A34    pop         ecx
 00053A35    pop         ecx
 00053A36    mov         dword ptr fs:[eax],edx
>00053A39    jmp         00053DA2
 00053A3E    inc         edi
 00053A3F    dec         ebx
>00053A40    jne         00053951
>00053A46    jmp         00053D65
 00053A4B    mov         eax,dword ptr [esi+8]
 00053A4E    mov         dword ptr [ebp-24],eax
 00053A51    mov         eax,dword ptr [ebp-4]
 00053A54    mov         ebx,dword ptr [eax+8]
 00053A57    dec         ebx
 00053A58    test        ebx,ebx
>00053A5A    jl          00053D65
 00053A60    inc         ebx
 00053A61    xor         edi,edi
 00053A63    mov         edx,edi
 00053A65    mov         eax,dword ptr [ebp-4]
 00053A68    call        TList.Get
 00053A6D    mov         edx,dword ptr [ebp-24]
 00053A70    mov         edx,dword ptr [edx+8]
 00053A73    xor         ecx,ecx
 00053A75    call        TMenu.FindItem
 00053A7A    mov         dword ptr [ebp-0C],eax
 00053A7D    cmp         dword ptr [ebp-0C],0
>00053A81    je          00053BAF
 00053A87    mov         dl,1
 00053A89    mov         eax,[0003E18C];TControlCanvas
 00053A8E    call        TCanvas.Create
 00053A93    mov         dword ptr [ebp-14],eax
 00053A96    xor         eax,eax
 00053A98    push        ebp
 00053A99    push        53B9B
 00053A9E    push        dword ptr fs:[eax]
 00053AA1    mov         dword ptr fs:[eax],esp
 00053AA4    push        0D
 00053AA6    call        gdi32.GetStockObject
 00053AAB    push        eax
 00053AAC    mov         eax,dword ptr [ebp-24]
 00053AAF    mov         eax,dword ptr [eax+18]
 00053AB2    push        eax
 00053AB3    call        gdi32.SelectObject
 00053AB8    mov         dword ptr [ebp-18],eax
 00053ABB    xor         eax,eax
 00053ABD    push        ebp
 00053ABE    push        53B7E
 00053AC3    push        dword ptr fs:[eax]
 00053AC6    mov         dword ptr fs:[eax],esp
 00053AC9    mov         eax,dword ptr [ebp-24]
 00053ACC    mov         edx,dword ptr [eax+18]
 00053ACF    mov         eax,dword ptr [ebp-14]
 00053AD2    call        TCanvas.SetHandle
 00053AD7    call        GetMenuFont
 00053ADC    mov         edx,eax
 00053ADE    mov         eax,dword ptr [ebp-14]
 00053AE1    mov         eax,dword ptr [eax+0C]
 00053AE4    call        TFont.SetHandle
 00053AE9    mov         eax,dword ptr [ebp-24]
 00053AEC    test        byte ptr [eax+10],1
>00053AF0    je          00053B14
 00053AF2    mov         eax,dword ptr [ebp-14]
 00053AF5    mov         eax,dword ptr [eax+14]
 00053AF8    mov         edx,8000000D
 00053AFD    call        TBrush.SetColor
 00053B02    mov         eax,dword ptr [ebp-14]
 00053B05    mov         eax,dword ptr [eax+0C]
 00053B08    mov         edx,8000000E
 00053B0D    call        TFont.SetColor
>00053B12    jmp         00053B34
 00053B14    mov         eax,dword ptr [ebp-14]
 00053B17    mov         eax,dword ptr [eax+14]
 00053B1A    mov         edx,80000004
 00053B1F    call        TBrush.SetColor
 00053B24    mov         eax,dword ptr [ebp-14]
 00053B27    mov         eax,dword ptr [eax+0C]
 00053B2A    mov         edx,80000007
 00053B2F    call        TFont.SetColor
 00053B34    mov         eax,dword ptr [ebp-24]
 00053B37    test        byte ptr [eax+10],1
 00053B3B    setne       al
 00053B3E    push        eax
 00053B3F    mov         eax,dword ptr [ebp-24]
 00053B42    lea         ecx,[eax+1C]
 00053B45    mov         edx,dword ptr [ebp-14]
 00053B48    mov         eax,dword ptr [ebp-0C]
 00053B4B    mov         ebx,dword ptr [eax]
 00053B4D    call        dword ptr [ebx+30]
 00053B50    xor         eax,eax
 00053B52    pop         edx
 00053B53    pop         ecx
 00053B54    pop         ecx
 00053B55    mov         dword ptr fs:[eax],edx
 00053B58    push        53B85
 00053B5D    xor         edx,edx
 00053B5F    mov         eax,dword ptr [ebp-14]
 00053B62    call        TCanvas.SetHandle
 00053B67    cmp         dword ptr [ebp-18],0
>00053B6B    je          00053B7D
 00053B6D    mov         eax,dword ptr [ebp-18]
 00053B70    push        eax
 00053B71    mov         eax,dword ptr [ebp-24]
 00053B74    mov         eax,dword ptr [eax+18]
 00053B77    push        eax
 00053B78    call        gdi32.SelectObject
 00053B7D    ret
>00053B7E    jmp         @HandleFinally
>00053B83    jmp         00053B5D
 00053B85    xor         eax,eax
 00053B87    pop         edx
 00053B88    pop         ecx
 00053B89    pop         ecx
 00053B8A    mov         dword ptr fs:[eax],edx
 00053B8D    push        53BA2
 00053B92    mov         eax,dword ptr [ebp-14]
 00053B95    call        TObject.Free
 00053B9A    ret
>00053B9B    jmp         @HandleFinally
>00053BA0    jmp         00053B92
 00053BA2    xor         eax,eax
 00053BA4    pop         edx
 00053BA5    pop         ecx
 00053BA6    pop         ecx
 00053BA7    mov         dword ptr fs:[eax],edx
>00053BAA    jmp         00053DA2
 00053BAF    inc         edi
 00053BB0    dec         ebx
>00053BB1    jne         00053A63
>00053BB7    jmp         00053D65
 00053BBC    mov         eax,dword ptr [esi+8]
 00053BBF    mov         dword ptr [ebp-28],eax
 00053BC2    mov         eax,dword ptr [ebp-4]
 00053BC5    mov         ebx,dword ptr [eax+8]
 00053BC8    dec         ebx
 00053BC9    test        ebx,ebx
>00053BCB    jl          00053D65
 00053BD1    inc         ebx
 00053BD2    xor         edi,edi
 00053BD4    mov         edx,edi
 00053BD6    mov         eax,dword ptr [ebp-4]
 00053BD9    call        TList.Get
 00053BDE    mov         edx,dword ptr [ebp-28]
 00053BE1    mov         edx,dword ptr [edx+8]
 00053BE4    xor         ecx,ecx
 00053BE6    call        TMenu.FindItem
 00053BEB    mov         dword ptr [ebp-0C],eax
 00053BEE    cmp         dword ptr [ebp-0C],0
>00053BF2    je          00053D0A
 00053BF8    mov         eax,dword ptr [ebp-4]
 00053BFB    mov         eax,dword ptr [eax+10]
 00053BFE    push        eax
 00053BFF    call        user32.GetWindowDC
 00053C04    mov         dword ptr [ebp-1C],eax
 00053C07    xor         eax,eax
 00053C09    push        ebp
 00053C0A    push        53CF6
 00053C0F    push        dword ptr fs:[eax]
 00053C12    mov         dword ptr fs:[eax],esp
 00053C15    mov         dl,1
 00053C17    mov         eax,[0003E18C];TControlCanvas
 00053C1C    call        TCanvas.Create
 00053C21    mov         dword ptr [ebp-14],eax
 00053C24    xor         eax,eax
 00053C26    push        ebp
 00053C27    push        53CD1
 00053C2C    push        dword ptr fs:[eax]
 00053C2F    mov         dword ptr fs:[eax],esp
 00053C32    push        0D
 00053C34    call        gdi32.GetStockObject
 00053C39    push        eax
 00053C3A    mov         eax,dword ptr [ebp-1C]
 00053C3D    push        eax
 00053C3E    call        gdi32.SelectObject
 00053C43    mov         dword ptr [ebp-18],eax
 00053C46    xor         eax,eax
 00053C48    push        ebp
 00053C49    push        53CB4
 00053C4E    push        dword ptr fs:[eax]
 00053C51    mov         dword ptr fs:[eax],esp
 00053C54    mov         edx,dword ptr [ebp-1C]
 00053C57    mov         eax,dword ptr [ebp-14]
 00053C5A    call        TCanvas.SetHandle
 00053C5F    call        GetMenuFont
 00053C64    mov         edx,eax
 00053C66    mov         eax,dword ptr [ebp-14]
 00053C69    mov         eax,dword ptr [eax+0C]
 00053C6C    call        TFont.SetHandle
 00053C71    mov         eax,dword ptr [ebp-28]
 00053C74    add         eax,10
 00053C77    push        eax
 00053C78    mov         eax,dword ptr [ebp-28]
 00053C7B    lea         ecx,[eax+0C]
 00053C7E    mov         edx,dword ptr [ebp-14]
 00053C81    mov         eax,dword ptr [ebp-0C]
 00053C84    call        TMenuItem.MeasureItem
 00053C89    xor         eax,eax
 00053C8B    pop         edx
 00053C8C    pop         ecx
 00053C8D    pop         ecx
 00053C8E    mov         dword ptr fs:[eax],edx
 00053C91    push        53CBB
 00053C96    xor         edx,edx
 00053C98    mov         eax,dword ptr [ebp-14]
 00053C9B    call        TCanvas.SetHandle
 00053CA0    cmp         dword ptr [ebp-18],0
>00053CA4    je          00053CB3
 00053CA6    mov         eax,dword ptr [ebp-18]
 00053CA9    push        eax
 00053CAA    mov         eax,dword ptr [ebp-1C]
 00053CAD    push        eax
 00053CAE    call        gdi32.SelectObject
 00053CB3    ret
>00053CB4    jmp         @HandleFinally
>00053CB9    jmp         00053C96
 00053CBB    xor         eax,eax
 00053CBD    pop         edx
 00053CBE    pop         ecx
 00053CBF    pop         ecx
 00053CC0    mov         dword ptr fs:[eax],edx
 00053CC3    push        53CD8
 00053CC8    mov         eax,dword ptr [ebp-14]
 00053CCB    call        TObject.Free
 00053CD0    ret
>00053CD1    jmp         @HandleFinally
>00053CD6    jmp         00053CC8
 00053CD8    xor         eax,eax
 00053CDA    pop         edx
 00053CDB    pop         ecx
 00053CDC    pop         ecx
 00053CDD    mov         dword ptr fs:[eax],edx
 00053CE0    push        53CFD
 00053CE5    mov         eax,dword ptr [ebp-1C]
 00053CE8    push        eax
 00053CE9    mov         eax,dword ptr [ebp-4]
 00053CEC    mov         eax,dword ptr [eax+10]
 00053CEF    push        eax
 00053CF0    call        user32.ReleaseDC
 00053CF5    ret
>00053CF6    jmp         @HandleFinally
>00053CFB    jmp         00053CE5
 00053CFD    xor         eax,eax
 00053CFF    pop         edx
 00053D00    pop         ecx
 00053D01    pop         ecx
 00053D02    mov         dword ptr fs:[eax],edx
>00053D05    jmp         00053DA2
 00053D0A    inc         edi
 00053D0B    dec         ebx
>00053D0C    jne         00053BD4
>00053D12    jmp         00053D65
 00053D14    mov         eax,dword ptr [ebp-4]
 00053D17    mov         ebx,dword ptr [eax+8]
 00053D1A    dec         ebx
 00053D1B    test        ebx,ebx
>00053D1D    jl          00053D65
 00053D1F    inc         ebx
 00053D20    xor         edi,edi
 00053D22    mov         edx,edi
 00053D24    mov         eax,dword ptr [ebp-4]
 00053D27    call        TList.Get
 00053D2C    mov         dword ptr [ebp-2C],eax
 00053D2F    mov         eax,dword ptr [ebp-2C]
 00053D32    mov         edx,dword ptr [eax]
 00053D34    call        dword ptr [edx+34]
 00053D37    cmp         eax,dword ptr [esi+8]
>00053D3A    je          00053D4D
 00053D3C    mov         edx,dword ptr [esi+8]
 00053D3F    mov         cl,1
 00053D41    mov         eax,dword ptr [ebp-2C]
 00053D44    call        TMenu.FindItem
 00053D49    test        eax,eax
>00053D4B    je          00053D61
 00053D4D    mov         edx,esi
 00053D4F    mov         eax,dword ptr [ebp-2C]
 00053D52    call        TMenu.ProcessMenuChar
 00053D57    xor         eax,eax
 00053D59    pop         edx
 00053D5A    pop         ecx
 00053D5B    pop         ecx
 00053D5C    mov         dword ptr fs:[eax],edx
>00053D5F    jmp         00053DA2
 00053D61    inc         edi
 00053D62    dec         ebx
>00053D63    jne         00053D22
 00053D65    mov         eax,dword ptr [esi+8]
 00053D68    push        eax
 00053D69    mov         eax,dword ptr [esi+4]
 00053D6C    push        eax
 00053D6D    mov         eax,dword ptr [esi]
 00053D6F    push        eax
 00053D70    mov         eax,dword ptr [ebp-4]
 00053D73    mov         eax,dword ptr [eax+10]
 00053D76    push        eax
 00053D77    call        user32.DefWindowProcA
 00053D7C    mov         dword ptr [esi+0C],eax
 00053D7F    xor         eax,eax
 00053D81    pop         edx
 00053D82    pop         ecx
 00053D83    pop         ecx
 00053D84    mov         dword ptr fs:[eax],edx
>00053D87    jmp         00053DA2
>00053D89    jmp         @HandleAnyException
 00053D8E    mov         eax,[000B59E8];^Application:TApplication
 00053D93    mov         eax,dword ptr [eax]
 00053D95    mov         edx,dword ptr [ebp-4]
 00053D98    call        TApplication.HandleException
 00053D9D    call        @DoneExcept
 00053DA2    xor         eax,eax
 00053DA4    pop         edx
 00053DA5    pop         ecx
 00053DA6    pop         ecx
 00053DA7    mov         dword ptr fs:[eax],edx
 00053DAA    push        53DBF
 00053DAF    lea         eax,[ebp-30]
 00053DB2    call        @LStrClr
 00053DB7    ret
>00053DB8    jmp         @HandleFinally
>00053DBD    jmp         00053DAF
 00053DBF    pop         edi
 00053DC0    pop         esi
 00053DC1    pop         ebx
 00053DC2    mov         esp,ebp
 00053DC4    pop         ebp
 00053DC5    ret
*}
end;

//00053DC8
procedure TPopupList.Add(Popup:TPopupMenu);
begin
{*
 00053DC8    push        ebx
 00053DC9    push        esi
 00053DCA    mov         esi,edx
 00053DCC    mov         ebx,eax
 00053DCE    cmp         dword ptr [ebx+8],0
>00053DD2    jne         00053DE2
 00053DD4    push        ebx
 00053DD5    push        537A0;TPopupList.WndProc
 00053DDA    call        AllocateHWnd
 00053DDF    mov         dword ptr [ebx+10],eax
 00053DE2    mov         edx,esi
 00053DE4    mov         eax,ebx
 00053DE6    call        TList.Add
 00053DEB    pop         esi
 00053DEC    pop         ebx
 00053DED    ret
*}
end;

//00053DF0
procedure TPopupList.Remove(Popup:TPopupMenu);
begin
{*
 00053DF0    push        ebx
 00053DF1    mov         ebx,eax
 00053DF3    mov         eax,ebx
 00053DF5    call        TList.Remove
 00053DFA    cmp         dword ptr [ebx+8],0
>00053DFE    jne         00053E08
 00053E00    mov         eax,dword ptr [ebx+10]
 00053E03    call        DeallocateHWnd
 00053E08    pop         ebx
 00053E09    ret
*}
end;

//00053E0C
constructor TPopupMenu.Create(AOwner:TComponent);
begin
{*
 00053E0C    push        ebx
 00053E0D    push        esi
 00053E0E    test        dl,dl
>00053E10    je          00053E1A
 00053E12    add         esp,0FFFFFFF0
 00053E15    call        @ClassCreate
 00053E1A    mov         ebx,edx
 00053E1C    mov         esi,eax
 00053E1E    xor         edx,edx
 00053E20    mov         eax,esi
 00053E22    call        TMenu.Create
 00053E27    mov         dword ptr [esi+48],0FFFFFFFF
 00053E2E    mov         dword ptr [esi+4C],0FFFFFFFF
 00053E35    mov         eax,dword ptr [esi+28]
 00053E38    mov         dword ptr [eax+78],esi
 00053E3B    mov         dword ptr [eax+74],53EB0;TPopupMenu.DoPopup
 00053E42    mov         eax,[000B59E8];^Application:TApplication
 00053E47    mov         eax,dword ptr [eax]
 00053E49    mov         eax,dword ptr [eax+24]
 00053E4C    mov         dword ptr [esi+2C],eax
 00053E4F    mov         byte ptr [esi+51],1
 00053E53    mov         edx,esi
 00053E55    mov         eax,[000B67AC]
 00053E5A    call        TPopupList.Add
 00053E5F    mov         eax,esi
 00053E61    test        bl,bl
>00053E63    je          00053E74
 00053E65    call        @AfterConstruction
 00053E6A    pop         dword ptr fs:[0]
 00053E71    add         esp,0C
 00053E74    mov         eax,esi
 00053E76    pop         esi
 00053E77    pop         ebx
 00053E78    ret
*}
end;

//00053E7C
destructor TPopupMenu.Destroy;
begin
{*
 00053E7C    push        ebx
 00053E7D    push        esi
 00053E7E    call        @BeforeDestruction
 00053E83    mov         ebx,edx
 00053E85    mov         esi,eax
 00053E87    mov         edx,esi
 00053E89    mov         eax,[000B67AC]
 00053E8E    call        TPopupList.Remove
 00053E93    mov         edx,ebx
 00053E95    and         dl,0FC
 00053E98    mov         eax,esi
 00053E9A    call        TMenu.Destroy
 00053E9F    test        bl,bl
>00053EA1    jle         00053EAA
 00053EA3    mov         eax,esi
 00053EA5    call        @ClassDestroy
 00053EAA    pop         esi
 00053EAB    pop         ebx
 00053EAC    ret
*}
end;

//00053EB0
procedure TPopupMenu.DoPopup(Item:TObject);
begin
{*
 00053EB0    push        ebx
 00053EB1    cmp         word ptr [eax+5E],0
>00053EB6    je          00053EC0
 00053EB8    mov         ebx,eax
 00053EBA    mov         eax,dword ptr [ebx+60]
 00053EBD    call        dword ptr [ebx+5C]
 00053EC0    pop         ebx
 00053EC1    ret
*}
end;

//00053EC4
function TPopupMenu.GetHelpContext:THelpContext;
begin
{*
 00053EC4    mov         eax,dword ptr [eax+28]
 00053EC7    mov         eax,dword ptr [eax+48]
 00053ECA    ret
*}
end;

//00053ECC
procedure TPopupMenu.SetHelpContext(Value:THelpContext);
begin
{*
 00053ECC    mov         eax,dword ptr [eax+28];TPopupMenu.Items:TMenuItem
 00053ECF    mov         dword ptr [eax+48],edx;TMenuItem.HelpContext:THelpContext
 00053ED2    ret
*}
end;

//00053ED4
procedure TPopupMenu.SetBiDiModeFromPopupControl;
begin
{*
 00053ED4    push        ebx
 00053ED5    mov         ebx,eax
 00053ED7    mov         eax,[000B5C08];SysLocale:TSysLocale
 00053EDC    cmp         byte ptr [eax+9],0
>00053EE0    je          00053F19
 00053EE2    cmp         byte ptr [ebx+35],0
>00053EE6    je          00053F19
 00053EE8    lea         eax,[ebx+48]
 00053EEB    call        FindPopupControl
 00053EF0    test        eax,eax
>00053EF2    je          00053F04
 00053EF4    mov         dl,byte ptr [eax+4F]
 00053EF7    mov         eax,ebx
 00053EF9    call        TMenu.SetBiDiMode
 00053EFE    mov         byte ptr [ebx+35],1
>00053F02    jmp         00053F19
 00053F04    mov         eax,[000B59E8];^Application:TApplication
 00053F09    mov         eax,dword ptr [eax]
 00053F0B    mov         dl,byte ptr [eax+28]
 00053F0E    mov         eax,ebx
 00053F10    call        TMenu.SetBiDiMode
 00053F15    mov         byte ptr [ebx+35],1
 00053F19    pop         ebx
 00053F1A    ret
*}
end;

//00053F1C
function TPopupMenu.UseRightToLeftAlignment:Boolean;
begin
{*
 00053F1C    push        ebx
 00053F1D    xor         edx,edx
 00053F1F    mov         ecx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 00053F25    cmp         byte ptr [ecx+9],0
>00053F29    je          00053F61
 00053F2B    cmp         byte ptr [eax+35],0
>00053F2F    je          00053F5A
 00053F31    add         eax,48
 00053F34    call        FindPopupControl
 00053F39    test        eax,eax
>00053F3B    je          00053F4A
 00053F3D    mov         bx,0FFCF
 00053F41    call        @CallDynaInst
 00053F46    mov         edx,eax
>00053F48    jmp         00053F61
 00053F4A    mov         eax,[000B59E8];^Application:TApplication
 00053F4F    mov         eax,dword ptr [eax]
 00053F51    call        TApplication.UseRightToLeftAlignment
 00053F56    mov         edx,eax
>00053F58    jmp         00053F61
 00053F5A    cmp         byte ptr [eax+24],1
 00053F5E    sete        dl
 00053F61    mov         eax,edx
 00053F63    pop         ebx
 00053F64    ret
*}
end;

//00053F68
procedure TPopupMenu.Popup(X:Integer; Y:Integer);
begin
{*
 00053F68    push        ebx
 00053F69    push        esi
 00053F6A    push        edi
 00053F6B    add         esp,0FFFFFFF8
 00053F6E    mov         edi,ecx
 00053F70    mov         esi,edx
 00053F72    mov         ebx,eax
 00053F74    mov         ecx,esp
 00053F76    mov         edx,edi
 00053F78    mov         eax,esi
 00053F7A    call        Point
 00053F7F    mov         eax,dword ptr [esp]
 00053F82    mov         dword ptr [ebx+48],eax
 00053F85    mov         eax,dword ptr [esp+4]
 00053F89    mov         dword ptr [ebx+4C],eax
 00053F8C    mov         eax,ebx
 00053F8E    call        TPopupMenu.SetBiDiModeFromPopupControl
 00053F93    mov         edx,ebx
 00053F95    mov         eax,ebx
 00053F97    call        TPopupMenu.DoPopup
 00053F9C    mov         eax,dword ptr [ebx+28]
 00053F9F    call        TMenuItem.RebuildHandle
 00053FA4    mov         eax,ebx
 00053FA6    call        TMenu.AdjustBiDiBehavior
 00053FAB    push        0
 00053FAD    mov         eax,[000B67AC]
 00053FB2    mov         eax,dword ptr [eax+10]
 00053FB5    push        eax
 00053FB6    push        0
 00053FB8    push        edi
 00053FB9    push        esi
 00053FBA    mov         eax,ebx
 00053FBC    call        TPopupMenu.UseRightToLeftAlignment
 00053FC1    and         eax,7F
 00053FC4    lea         eax,[eax+eax*2]
 00053FC7    lea         eax,[eax*2+0B498C]
 00053FCE    xor         edx,edx
 00053FD0    mov         dl,byte ptr [ebx+50]
 00053FD3    mov         ax,word ptr [eax+edx*2]
 00053FD7    xor         edx,edx
 00053FD9    mov         dl,byte ptr [ebx+58]
 00053FDC    or          ax,word ptr [edx*2+0B4998]
 00053FE4    movzx       eax,ax
 00053FE7    push        eax
 00053FE8    mov         eax,dword ptr [ebx+28]
 00053FEB    call        TMenuItem.GetHandle
 00053FF0    push        eax
 00053FF1    call        user32.TrackPopupMenu
 00053FF6    pop         ecx
 00053FF7    pop         edx
 00053FF8    pop         edi
 00053FF9    pop         esi
 00053FFA    pop         ebx
 00053FFB    ret
*}
end;

//00053FFC
function NewItem(const ACaption:AnsiString; AShortCut:TShortCut; AChecked:Boolean; AEnabled:Boolean; AOnClick:TNotifyEvent; hCtx:Word; const AName:AnsiString):TMenuItem;
begin
{*
 00053FFC    push        ebp
 00053FFD    mov         ebp,esp
 00053FFF    push        ecx
 00054000    push        ebx
 00054001    push        esi
 00054002    push        edi
 00054003    mov         byte ptr [ebp-1],cl
 00054006    mov         edi,edx
 00054008    mov         esi,eax
 0005400A    xor         ecx,ecx
 0005400C    mov         dl,1
 0005400E    mov         eax,[0004FE44];TMenuItem
 00054013    call        TMenuItem.Create
 00054018    mov         ebx,eax
 0005401A    mov         edx,esi
 0005401C    mov         eax,ebx
 0005401E    call        TMenuItem.SetCaption
 00054023    mov         edx,edi
 00054025    mov         eax,ebx
 00054027    call        TMenuItem.SetShortCut
 0005402C    mov         eax,dword ptr [ebp+10]
 0005402F    mov         dword ptr [ebx+74],eax
 00054032    mov         eax,dword ptr [ebp+14]
 00054035    mov         dword ptr [ebx+78],eax
 00054038    movzx       eax,word ptr [ebp+0C]
 0005403C    mov         dword ptr [ebx+48],eax
 0005403F    mov         dl,byte ptr [ebp-1]
 00054042    mov         eax,ebx
 00054044    call        TMenuItem.SetChecked
 00054049    mov         dl,byte ptr [ebp+18]
 0005404C    mov         eax,ebx
 0005404E    call        TMenuItem.SetEnabled
 00054053    mov         edx,dword ptr [ebp+8]
 00054056    mov         eax,ebx
 00054058    mov         ecx,dword ptr [eax]
 0005405A    call        dword ptr [ecx+18]
 0005405D    mov         eax,ebx
 0005405F    pop         edi
 00054060    pop         esi
 00054061    pop         ebx
 00054062    pop         ecx
 00054063    pop         ebp
 00054064    ret         14
*}
end;

//00054068
procedure _NF__488;
begin
{*
 00054068    adc         al,byte ptr [eax]
 0005406A    add         byte ptr [eax],al
 0005406C    or          byte ptr [ecx+0B],cl
 0005406F    add         byte ptr [edi+edx*2+0B],cl
 00054073    add         byte ptr [ecx+ecx*2],al
 00054076    or          eax,dword ptr [eax]
 00054078    fcom        qword ptr [esi+0B]
 0005407B    add         byte ptr [eax],al
 0005407D    dec         ecx
 0005407E    or          eax,dword ptr [eax]
 00054080    dec         esp
 00054081    push        esi
 00054082    or          eax,dword ptr [eax]
 00054084    cld
 00054085    dec         eax
 00054086    or          eax,dword ptr [eax]
 00054088    nop
 00054089    push        esi
 0005408A    or          eax,dword ptr [eax]
 0005408C    clc
 0005408D    dec         eax
 0005408E    or          eax,dword ptr [eax]
 00054090    in          al,5A
 00054092    or          eax,dword ptr [eax]
 00054094    hlt
 00054095    dec         eax
 00054096    or          eax,dword ptr [eax]
 00054098    test        al,56
 0005409A    or          eax,dword ptr [eax]
 0005409C    lock dec    eax
 0005409E    or          eax,dword ptr [eax]
 000540A0    les         ebx,fword ptr [eax+0B]
 000540A3    add         ah,ch
 000540A5    dec         eax
 000540A6    or          eax,dword ptr [eax]
 000540A8    adc         byte ptr [eax+0B],bl
 000540AB    add         al,ch
 000540AD    dec         eax
 000540AE    or          eax,dword ptr [eax]
 000540B0    mov         word ptr [ebx+0B],ds
 000540B3    add         ah,ah
 000540B5    dec         eax
 000540B6    or          eax,dword ptr [eax]
 000540B8    mov         byte ptr [ebx+0B],bl
 000540BB    add         al,ah
 000540BD    dec         eax
 000540BE    or          eax,dword ptr [eax]
 000540C0    lods        byte ptr [esi]
 000540C1    push        edi
 000540C2    or          eax,dword ptr [eax]
 000540C4    fmul        qword ptr [eax+0B]
 000540C7    add         byte ptr [eax+5B],al
 000540CA    or          eax,dword ptr [eax]
 000540CC    fmul        dword ptr [eax+0B]
 000540CF    add         ah,ch
 000540D1    pop         edx
 000540D2    or          eax,dword ptr [eax]
 000540D4    ???
 000540D5    dec         eax
 000540D6    or          eax,dword ptr [eax]
 000540D8    loopne      00054135;^String
 000540DA    or          eax,dword ptr [eax]
 000540DC    ror         byte ptr [eax+0B],1
 000540DF    add         byte ptr [ebx+ebx*2+48CC000B],bl
 000540E6    or          eax,dword ptr [eax]
 000540E8    les         edx,fword ptr [edi+0B]
 000540EB    add         al,cl
 000540ED    dec         eax
 000540EE    or          eax,dword ptr [eax]
 000540F0    fcom        qword ptr [edi+0B]
 000540F3    add         ah,al
 000540F5    dec         eax
 000540F6    or          eax,dword ptr [eax]
 000540F8    xor         al,58
 000540FA    or          eax,dword ptr [eax]
*}
end;

Initialization
//00054158
{*
 00054158    push        ebp
 00054159    mov         ebp,esp
 0005415B    push        ecx
 0005415C    sub         dword ptr ds:[0B67A4],1
>00054163    jae         000541A3
 00054165    mov         eax,54068;_NF__488
 0005416A    call        @InitResStringImports
 0005416F    mov         eax,[0004FE44];TMenuItem
 00054174    mov         dword ptr [ebp-4],eax
 00054177    lea         eax,[ebp-4]
 0005417A    xor         edx,edx
 0005417C    call        RegisterClasses
 00054181    mov         dl,1
 00054183    mov         eax,[0001EF80];TBits
 00054188    call        TObject.Create
 0005418D    mov         [000B67A8],eax
 00054192    mov         dl,1
 00054194    mov         eax,[000536FC];TPopupList
 00054199    call        TObject.Create
 0005419E    mov         [000B67AC],eax
 000541A3    pop         ecx
 000541A4    pop         ebp
 000541A5    ret
*}
Finalization
//000540FC
{*
 000540FC    push        ebp
 000540FD    mov         ebp,esp
 000540FF    xor         eax,eax
 00054101    push        ebp
 00054102    push        5414C
 00054107    push        dword ptr fs:[eax]
 0005410A    mov         dword ptr fs:[eax],esp
 0005410D    inc         dword ptr ds:[0B67A4]
>00054113    jne         0005413E
 00054115    mov         eax,[000B67AC]
 0005411A    call        TObject.Free
 0005411F    mov         eax,[000B67A8]
 00054124    call        TObject.Free
 00054129    mov         eax,0B48C4
 0005412E    mov         ecx,12
 00054133    mov         edx,dword ptr ds:[110CC];String
 00054139    call        @FinalizeArray
 0005413E    xor         eax,eax
 00054140    pop         edx
 00054141    pop         ecx
 00054142    pop         ecx
 00054143    mov         dword ptr fs:[eax],edx
 00054146    push        54153
 0005414B    ret
>0005414C    jmp         @HandleFinally
>00054151    jmp         0005414B
 00054153    pop         ebp
 00054154    ret
*}
end.