//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ActnList;

interface

uses
  SysUtils, Classes, ActnList, ImgList, system;

type
  TContainedAction = class(TBasicAction)
  public
    Category:String;//f40
    FActionList:TCustomActionList;//f44
    destructor Destroy; virtual;//0004D588
    procedure ReadState(Reader:TReader); virtual;//v14//0004D5F8
    function Update:Boolean; virtual;//v44//0004D74C
    procedure Execute; dynamic;//0004D6F4
    procedure HasParent; dynamic;//0004D5E8
    procedure GetParentComponent; dynamic;//0004D5D8
    procedure SetParentComponent(AParent:TComponent); dynamic;//0004D6C8
    function GetIndex:Integer;//0004D5BC
    function IsStoredCategory(Value:String):Boolean;//0004D5D4
    procedure SetIndex(Value:Integer);//0004D62C
    procedure SetCategory(const Value:AnsiString);//0004D674
    procedure SetActionList(AActionList:TCustomActionList);//0004D6A0
  end;
  TCustomActionList = class(TComponent)
  public
    FActions:TList;//f24
    FImageChangeLink:TChangeLink;//f28
    FImages:TCustomImageList;//f2C
    FOnChange:TNotifyEvent;//f30
    FOnExecute:TActionEvent;//f38
    FOnUpdate:TActionEvent;//f40
    destructor Destroy; virtual;//0004D80C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0004D914
    constructor Create(AOwner:TComponent); virtual;//v2C//0004D7A4
    procedure Change; virtual;//v30//0004D998
    procedure UpdateAction(Action:TBasicAction); dynamic;//0004DA80
    procedure ExecuteAction(Action:TBasicAction); dynamic;//0004DA60
    procedure SetChildOrder(Component:TComponent; Order:Integer); dynamic;//0004D8A4
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//0004D85C
    procedure SetImages(Value:TCustomImageList);//0004D8D4
    procedure ImageListChange(Sender:TObject);//0004D908
    procedure AddAction(Action:TContainedAction);//0004D95C
    procedure RemoveAction(Action:TContainedAction);//0004D97C
    function IsShortCut(var Message:TWMKey):Boolean;//0004DA00
  end;
  TCustomAction = class(TContainedAction)
  public
    FDisableIfNoHandler:Boolean;//f48
    FCaption:String;//f4C
    FChecked:Boolean;//f50
    FEnabled:Boolean;//f51
    FHelpContext:THelpContext;//f54
    FHint:String;//f58
    FImageIndex:Integer;//f5C
    FShortCut:TShortCut;//f60
    FVisible:Boolean;//f62
    FOnHint:THintEvent;//f64
    FImage:TObject;//f6C
    FMask:TObject;//f70
    destructor Destroy; virtual;//0004DBA8
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0004DBE0
    procedure SetName(const Value:TComponentName); virtual;//v18//0004DF40
    constructor Create(AOwner:TComponent); virtual;//v2C//0004DB60
    procedure Execute; dynamic;//0004DFAC
    procedure SetCaption(const Value:AnsiString);//0004DC5C
    procedure SetChecked(Value:Boolean);//0004DCC4
    procedure SetEnabled(Value:Boolean);//0004DD1C
    procedure SetHelpContext(Value:THelpContext);//0004DD74
    procedure SetHint(const Value:AnsiString);//0004DDCC
    procedure SetImageIndex(Value:Integer);//0004DE34
    procedure SetShortCut(Value:TShortCut);//0004DE8C
    procedure SetVisible(Value:Boolean);//0004DEE8
    function DoHint(var HintStr:AnsiString):Boolean;//0004DF8C
  end;
  TActionLink = class(TBasicActionLink)
  public
    function IsCaptionLinked:Boolean; virtual;//v1C//0004DAA0
    function IsCheckedLinked:Boolean; virtual;//v20//0004DAB4
    function IsEnabledLinked:Boolean; virtual;//v24//0004DAC8
    function IsHelpContextLinked:Boolean; virtual;//v28//0004DADC
    function IsHintLinked:Boolean; virtual;//v2C//0004DAF0
    function IsImageIndexLinked:Boolean; virtual;//v30//0004DB04
    function IsShortCutLinked:Boolean; virtual;//v34//0004DB18
    function IsVisibleLinked:Boolean; virtual;//v38//0004DB2C
    procedure v3C; virtual;//v3C//0004DB40
    procedure v40; virtual;//v40//0004DB44
    procedure v44; virtual;//v44//0004DB48
    procedure v48; virtual;//v48//0004DB4C
    procedure v4C; virtual;//v4C//0004DB50
    procedure v50; virtual;//v50//0004DB54
    procedure v54; virtual;//v54//0004DB58
    procedure v58; virtual;//v58//0004DB5C
  end;
    destructor Destroy;//0004D588
    procedure GetParentComponent;//0004D5D8
    procedure HasParent;//0004D5E8
    procedure ReadState(Reader:TReader);//0004D5F8
    procedure SetParentComponent(AParent:TComponent);//0004D6C8
    procedure Execute;//0004D6F4
    function Update:Boolean;//0004D74C
    constructor Create(AOwner:TComponent);//0004D7A4
    destructor Destroy;//0004D80C
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//0004D85C
    procedure SetChildOrder(Component:TComponent; Order:Integer);//0004D8A4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0004D914
    procedure Change;//0004D998
    procedure ExecuteAction(Action:TBasicAction);//0004DA60
    procedure UpdateAction(Action:TBasicAction);//0004DA80
    function IsCaptionLinked:Boolean;//0004DAA0
    function IsCheckedLinked:Boolean;//0004DAB4
    function IsEnabledLinked:Boolean;//0004DAC8
    function IsHelpContextLinked:Boolean;//0004DADC
    function IsHintLinked:Boolean;//0004DAF0
    function IsImageIndexLinked:Boolean;//0004DB04
    function IsShortCutLinked:Boolean;//0004DB18
    function IsVisibleLinked:Boolean;//0004DB2C
    procedure sub_0004DB40;//0004DB40
    procedure sub_0004DB44;//0004DB44
    procedure sub_0004DB48;//0004DB48
    procedure sub_0004DB4C;//0004DB4C
    procedure sub_0004DB50;//0004DB50
    procedure sub_0004DB54;//0004DB54
    procedure sub_0004DB58;//0004DB58
    procedure sub_0004DB5C;//0004DB5C
    constructor Create(AOwner:TComponent);//0004DB60
    destructor Destroy;//0004DBA8
    procedure AssignTo(Dest:TPersistent);//0004DBE0
    procedure SetName(const Value:TComponentName);//0004DF40
    procedure Execute;//0004DFAC

implementation

//0004D588
destructor TContainedAction.Destroy;
begin
{*
 0004D588    push        ebx
 0004D589    push        esi
 0004D58A    call        @BeforeDestruction
 0004D58F    mov         ebx,edx
 0004D591    mov         esi,eax
 0004D593    mov         eax,dword ptr [esi+44]
 0004D596    test        eax,eax
>0004D598    je          0004D5A1
 0004D59A    mov         edx,esi
 0004D59C    call        TCustomActionList.RemoveAction
 0004D5A1    mov         edx,ebx
 0004D5A3    and         dl,0FC
 0004D5A6    mov         eax,esi
 0004D5A8    call        TBasicAction.Destroy
 0004D5AD    test        bl,bl
>0004D5AF    jle         0004D5B8
 0004D5B1    mov         eax,esi
 0004D5B3    call        @ClassDestroy
 0004D5B8    pop         esi
 0004D5B9    pop         ebx
 0004D5BA    ret
*}
end;

//0004D5BC
function TContainedAction.GetIndex:Integer;
begin
{*
 0004D5BC    mov         edx,dword ptr [eax+44]
 0004D5BF    test        edx,edx
>0004D5C1    je          0004D5CD
 0004D5C3    mov         edx,dword ptr [edx+24]
 0004D5C6    xchg        eax,edx
 0004D5C7    call        TList.IndexOf
 0004D5CC    ret
 0004D5CD    or          eax,0FFFFFFFF
 0004D5D0    ret
*}
end;

//0004D5D4
function TContainedAction.IsStoredCategory(Value:String):Boolean;
begin
{*
 0004D5D4    mov         al,1
 0004D5D6    ret
*}
end;

//0004D5D8
procedure TContainedAction.GetParentComponent;
begin
{*
 0004D5D8    mov         edx,dword ptr [eax+44]
 0004D5DB    test        edx,edx
>0004D5DD    je          0004D5E2
 0004D5DF    mov         eax,edx
 0004D5E1    ret
 0004D5E2    call        TComponent.GetParentComponent
 0004D5E7    ret
*}
end;

//0004D5E8
procedure TContainedAction.HasParent;
begin
{*
 0004D5E8    cmp         dword ptr [eax+44],0
>0004D5EC    je          0004D5F1
 0004D5EE    mov         al,1
 0004D5F0    ret
 0004D5F1    call        TComponent.HasParent
 0004D5F6    ret
*}
end;

//0004D5F8
procedure TContainedAction.ReadState(Reader:TReader);
begin
{*
 0004D5F8    push        ebx
 0004D5F9    push        esi
 0004D5FA    push        edi
 0004D5FB    mov         esi,edx
 0004D5FD    mov         ebx,eax
 0004D5FF    mov         edx,esi
 0004D601    mov         eax,ebx
 0004D603    call        TComponent.ReadState
 0004D608    mov         edi,dword ptr [esi+28]
 0004D60B    mov         eax,edi
 0004D60D    mov         edx,dword ptr ds:[4D310];TCustomActionList
 0004D613    call        @IsClass
 0004D618    test        al,al
>0004D61A    je          0004D625
 0004D61C    mov         edx,edi
 0004D61E    mov         eax,ebx
 0004D620    call        TContainedAction.SetActionList
 0004D625    pop         edi
 0004D626    pop         esi
 0004D627    pop         ebx
 0004D628    ret
*}
end;

//0004D62C
procedure TContainedAction.SetIndex(Value:Integer);
begin
{*
 0004D62C    push        ebx
 0004D62D    push        esi
 0004D62E    push        edi
 0004D62F    mov         esi,edx
 0004D631    mov         ebx,eax
 0004D633    mov         eax,ebx
 0004D635    call        TContainedAction.GetIndex
 0004D63A    test        eax,eax
>0004D63C    jl          0004D66F
 0004D63E    mov         edx,dword ptr [ebx+44]
 0004D641    mov         edi,dword ptr [edx+24]
 0004D644    mov         edx,dword ptr [edi+8]
 0004D647    test        esi,esi
>0004D649    jge         0004D64D
 0004D64B    xor         esi,esi
 0004D64D    cmp         edx,esi
>0004D64F    jg          0004D654
 0004D651    mov         esi,edx
 0004D653    dec         esi
 0004D654    cmp         eax,esi
>0004D656    je          0004D66F
 0004D658    mov         edx,edi
 0004D65A    xchg        eax,edx
 0004D65B    call        TList.Delete
 0004D660    mov         eax,dword ptr [ebx+44]
 0004D663    mov         eax,dword ptr [eax+24]
 0004D666    mov         ecx,ebx
 0004D668    mov         edx,esi
 0004D66A    call        TList.Insert
 0004D66F    pop         edi
 0004D670    pop         esi
 0004D671    pop         ebx
 0004D672    ret
*}
end;

//0004D674
procedure TContainedAction.SetCategory(const Value:AnsiString);
begin
{*
 0004D674    push        ebx
 0004D675    push        esi
 0004D676    mov         esi,edx
 0004D678    mov         ebx,eax
 0004D67A    mov         eax,esi
 0004D67C    mov         edx,dword ptr [ebx+40]
 0004D67F    call        @LStrCmp
>0004D684    je          0004D69C
 0004D686    lea         eax,[ebx+40]
 0004D689    mov         edx,esi
 0004D68B    call        @LStrAsg
 0004D690    mov         eax,dword ptr [ebx+44]
 0004D693    test        eax,eax
>0004D695    je          0004D69C
 0004D697    mov         edx,dword ptr [eax]
 0004D699    call        dword ptr [edx+30]
 0004D69C    pop         esi
 0004D69D    pop         ebx
 0004D69E    ret
*}
end;

//0004D6A0
procedure TContainedAction.SetActionList(AActionList:TCustomActionList);
begin
{*
 0004D6A0    push        ebx
 0004D6A1    push        esi
 0004D6A2    mov         esi,edx
 0004D6A4    mov         ebx,eax
 0004D6A6    mov         eax,dword ptr [ebx+44]
 0004D6A9    cmp         esi,eax
>0004D6AB    je          0004D6C5
 0004D6AD    test        eax,eax
>0004D6AF    je          0004D6B8
 0004D6B1    mov         edx,ebx
 0004D6B3    call        TCustomActionList.RemoveAction
 0004D6B8    test        esi,esi
>0004D6BA    je          0004D6C5
 0004D6BC    mov         edx,ebx
 0004D6BE    mov         eax,esi
 0004D6C0    call        TCustomActionList.AddAction
 0004D6C5    pop         esi
 0004D6C6    pop         ebx
 0004D6C7    ret
*}
end;

//0004D6C8
procedure TContainedAction.SetParentComponent(AParent:TComponent);
begin
{*
 0004D6C8    push        ebx
 0004D6C9    push        esi
 0004D6CA    mov         esi,edx
 0004D6CC    mov         ebx,eax
 0004D6CE    test        byte ptr [ebx+20],1
>0004D6D2    jne         0004D6EE
 0004D6D4    mov         eax,esi
 0004D6D6    mov         edx,dword ptr ds:[4D310];TCustomActionList
 0004D6DC    call        @IsClass
 0004D6E1    test        al,al
>0004D6E3    je          0004D6EE
 0004D6E5    mov         edx,esi
 0004D6E7    mov         eax,ebx
 0004D6E9    call        TContainedAction.SetActionList
 0004D6EE    pop         esi
 0004D6EF    pop         ebx
 0004D6F0    ret
*}
end;

//0004D6F4
procedure TContainedAction.Execute;
begin
{*
 0004D6F4    push        ebx
 0004D6F5    push        esi
 0004D6F6    push        edi
 0004D6F7    mov         esi,eax
 0004D6F9    mov         edi,dword ptr [esi+44]
 0004D6FC    test        edi,edi
>0004D6FE    je          0004D711
 0004D700    mov         edx,esi
 0004D702    mov         eax,edi
 0004D704    mov         bx,0FFF4
 0004D708    call        @CallDynaInst
 0004D70D    test        al,al
>0004D70F    jne         0004D743
 0004D711    mov         eax,[000B59E8];^Application:TApplication
 0004D716    mov         eax,dword ptr [eax]
 0004D718    mov         edx,esi
 0004D71A    call        TApplication.ExecuteAction
 0004D71F    test        al,al
>0004D721    jne         0004D743
 0004D723    mov         eax,esi
 0004D725    call        TBasicAction.Execute
 0004D72A    test        al,al
>0004D72C    jne         0004D743
 0004D72E    mov         ecx,esi
 0004D730    xor         edx,edx
 0004D732    mov         eax,0B040
 0004D737    call        SendAppMessage
 0004D73C    dec         eax
>0004D73D    je          0004D743
 0004D73F    xor         eax,eax
>0004D741    jmp         0004D745
 0004D743    mov         al,1
 0004D745    pop         edi
 0004D746    pop         esi
 0004D747    pop         ebx
 0004D748    ret
*}
end;

//0004D74C
function TContainedAction.Update:Boolean;
begin
{*
 0004D74C    push        ebx
 0004D74D    push        esi
 0004D74E    push        edi
 0004D74F    mov         esi,eax
 0004D751    mov         edi,dword ptr [esi+44]
 0004D754    test        edi,edi
>0004D756    je          0004D769
 0004D758    mov         edx,esi
 0004D75A    mov         eax,edi
 0004D75C    mov         bx,0FFF1
 0004D760    call        @CallDynaInst
 0004D765    test        al,al
>0004D767    jne         0004D79B
 0004D769    mov         eax,[000B59E8];^Application:TApplication
 0004D76E    mov         eax,dword ptr [eax]
 0004D770    mov         edx,esi
 0004D772    call        TApplication.UpdateAction
 0004D777    test        al,al
>0004D779    jne         0004D79B
 0004D77B    mov         eax,esi
 0004D77D    call        TBasicAction.Update
 0004D782    test        al,al
>0004D784    jne         0004D79B
 0004D786    mov         ecx,esi
 0004D788    xor         edx,edx
 0004D78A    mov         eax,0B03F
 0004D78F    call        SendAppMessage
 0004D794    dec         eax
>0004D795    je          0004D79B
 0004D797    xor         eax,eax
>0004D799    jmp         0004D79D
 0004D79B    mov         al,1
 0004D79D    pop         edi
 0004D79E    pop         esi
 0004D79F    pop         ebx
 0004D7A0    ret
*}
end;

//0004D7A4
constructor TCustomActionList.Create(AOwner:TComponent);
begin
{*
 0004D7A4    push        ebp
 0004D7A5    mov         ebp,esp
 0004D7A7    push        ecx
 0004D7A8    push        ebx
 0004D7A9    push        esi
 0004D7AA    test        dl,dl
>0004D7AC    je          0004D7B6
 0004D7AE    add         esp,0FFFFFFF0
 0004D7B1    call        @ClassCreate
 0004D7B6    mov         byte ptr [ebp-1],dl
 0004D7B9    mov         ebx,eax
 0004D7BB    xor         edx,edx
 0004D7BD    mov         eax,ebx
 0004D7BF    call        TComponent.Create
 0004D7C4    mov         dl,1
 0004D7C6    mov         eax,[0001EEC4];TList
 0004D7CB    call        TObject.Create
 0004D7D0    mov         dword ptr [ebx+24],eax
 0004D7D3    mov         dl,1
 0004D7D5    mov         eax,[0004E008];TChangeLink
 0004D7DA    call        TObject.Create
 0004D7DF    mov         esi,eax
 0004D7E1    mov         dword ptr [ebx+28],esi
 0004D7E4    mov         dword ptr [esi+0C],ebx
 0004D7E7    mov         dword ptr [esi+8],4D908;TCustomActionList.ImageListChange
 0004D7EE    mov         eax,ebx
 0004D7F0    cmp         byte ptr [ebp-1],0
>0004D7F4    je          0004D805
 0004D7F6    call        @AfterConstruction
 0004D7FB    pop         dword ptr fs:[0]
 0004D802    add         esp,0C
 0004D805    mov         eax,ebx
 0004D807    pop         esi
 0004D808    pop         ebx
 0004D809    pop         ecx
 0004D80A    pop         ebp
 0004D80B    ret
*}
end;

//0004D80C
destructor TCustomActionList.Destroy;
begin
{*
 0004D80C    push        ebx
 0004D80D    push        esi
 0004D80E    push        edi
 0004D80F    call        @BeforeDestruction
 0004D814    mov         ebx,edx
 0004D816    mov         edi,eax
 0004D818    mov         eax,dword ptr [edi+28]
 0004D81B    call        TObject.Free
>0004D820    jmp         0004D82E
 0004D822    mov         eax,esi
 0004D824    call        TList.Last
 0004D829    call        TObject.Free
 0004D82E    mov         esi,dword ptr [edi+24]
 0004D831    cmp         dword ptr [esi+8],0
>0004D835    jg          0004D822
 0004D837    mov         eax,dword ptr [edi+24]
 0004D83A    call        TObject.Free
 0004D83F    mov         edx,ebx
 0004D841    and         dl,0FC
 0004D844    mov         eax,edi
 0004D846    call        TComponent.Destroy
 0004D84B    test        bl,bl
>0004D84D    jle         0004D856
 0004D84F    mov         eax,edi
 0004D851    call        @ClassDestroy
 0004D856    pop         edi
 0004D857    pop         esi
 0004D858    pop         ebx
 0004D859    ret
*}
end;

//0004D85C
procedure TCustomActionList.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 0004D85C    push        ebp
 0004D85D    mov         ebp,esp
 0004D85F    add         esp,0FFFFFFF8
 0004D862    push        ebx
 0004D863    push        esi
 0004D864    mov         dword ptr [ebp-8],edx
 0004D867    mov         dword ptr [ebp-4],eax
 0004D86A    mov         eax,dword ptr [ebp-4]
 0004D86D    mov         eax,dword ptr [eax+24]
 0004D870    mov         ebx,dword ptr [eax+8]
 0004D873    dec         ebx
 0004D874    test        ebx,ebx
>0004D876    jl          0004D89C
 0004D878    inc         ebx
 0004D879    xor         esi,esi
 0004D87B    mov         eax,dword ptr [ebp-4]
 0004D87E    mov         eax,dword ptr [eax+24]
 0004D881    mov         edx,esi
 0004D883    call        TList.Get
 0004D888    mov         edx,dword ptr [eax+4]
 0004D88B    cmp         edx,dword ptr [ebp-8]
>0004D88E    jne         0004D898
 0004D890    mov         edx,eax
 0004D892    mov         eax,dword ptr [ebp+0C]
 0004D895    call        dword ptr [ebp+8]
 0004D898    inc         esi
 0004D899    dec         ebx
>0004D89A    jne         0004D87B
 0004D89C    pop         esi
 0004D89D    pop         ebx
 0004D89E    pop         ecx
 0004D89F    pop         ecx
 0004D8A0    pop         ebp
 0004D8A1    ret         8
*}
end;

//0004D8A4
procedure TCustomActionList.SetChildOrder(Component:TComponent; Order:Integer);
begin
{*
 0004D8A4    push        ebx
 0004D8A5    push        esi
 0004D8A6    push        edi
 0004D8A7    mov         edi,ecx
 0004D8A9    mov         esi,edx
 0004D8AB    mov         ebx,eax
 0004D8AD    mov         edx,esi
 0004D8AF    mov         eax,dword ptr [ebx+24]
 0004D8B2    call        TList.IndexOf
 0004D8B7    test        eax,eax
>0004D8B9    jl          0004D8CF
 0004D8BB    mov         eax,esi
 0004D8BD    mov         edx,dword ptr ds:[4D1EC];TContainedAction
 0004D8C3    call        @AsClass
 0004D8C8    mov         edx,edi
 0004D8CA    call        TContainedAction.SetIndex
 0004D8CF    pop         edi
 0004D8D0    pop         esi
 0004D8D1    pop         ebx
 0004D8D2    ret
*}
end;

//0004D8D4
procedure TCustomActionList.SetImages(Value:TCustomImageList);
begin
{*
 0004D8D4    push        ebx
 0004D8D5    push        esi
 0004D8D6    mov         esi,edx
 0004D8D8    mov         ebx,eax
 0004D8DA    mov         eax,dword ptr [ebx+2C]
 0004D8DD    test        eax,eax
>0004D8DF    je          0004D8E9
 0004D8E1    mov         edx,dword ptr [ebx+28]
 0004D8E4    call        TCustomImageList.UnRegisterChanges
 0004D8E9    mov         eax,esi
 0004D8EB    mov         dword ptr [ebx+2C],eax
 0004D8EE    test        eax,eax
>0004D8F0    je          0004D904
 0004D8F2    mov         edx,dword ptr [ebx+28]
 0004D8F5    call        TCustomImageList.RegisterChanges
 0004D8FA    mov         edx,ebx
 0004D8FC    mov         eax,dword ptr [ebx+2C]
 0004D8FF    call        TComponent.FreeNotification
 0004D904    pop         esi
 0004D905    pop         ebx
 0004D906    ret
*}
end;

//0004D908
procedure TCustomActionList.ImageListChange(Sender:TObject);
begin
{*
 0004D908    cmp         edx,dword ptr [eax+2C]
>0004D90B    jne         0004D912
 0004D90D    mov         edx,dword ptr [eax]
 0004D90F    call        dword ptr [edx+30]
 0004D912    ret
*}
end;

//0004D914
procedure TCustomActionList.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0004D914    push        ebx
 0004D915    push        esi
 0004D916    push        edi
 0004D917    mov         ebx,ecx
 0004D919    mov         edi,edx
 0004D91B    mov         esi,eax
 0004D91D    mov         ecx,ebx
 0004D91F    mov         edx,edi
 0004D921    mov         eax,esi
 0004D923    call        TComponent.Notification
 0004D928    cmp         bl,1
>0004D92B    jne         0004D957
 0004D92D    cmp         edi,dword ptr [esi+2C]
>0004D930    jne         0004D93D
 0004D932    xor         edx,edx
 0004D934    mov         eax,esi
 0004D936    call        TCustomActionList.SetImages
>0004D93B    jmp         0004D957
 0004D93D    mov         eax,edi
 0004D93F    mov         edx,dword ptr ds:[4D1EC];TContainedAction
 0004D945    call        @IsClass
 0004D94A    test        al,al
>0004D94C    je          0004D957
 0004D94E    mov         edx,edi
 0004D950    mov         eax,esi
 0004D952    call        TCustomActionList.RemoveAction
 0004D957    pop         edi
 0004D958    pop         esi
 0004D959    pop         ebx
 0004D95A    ret
*}
end;

//0004D95C
procedure TCustomActionList.AddAction(Action:TContainedAction);
begin
{*
 0004D95C    push        ebx
 0004D95D    push        esi
 0004D95E    mov         esi,edx
 0004D960    mov         ebx,eax
 0004D962    mov         edx,esi
 0004D964    mov         eax,dword ptr [ebx+24]
 0004D967    call        TList.Add
 0004D96C    mov         dword ptr [esi+44],ebx
 0004D96F    mov         edx,ebx
 0004D971    mov         eax,esi
 0004D973    call        TComponent.FreeNotification
 0004D978    pop         esi
 0004D979    pop         ebx
 0004D97A    ret
*}
end;

//0004D97C
procedure TCustomActionList.RemoveAction(Action:TContainedAction);
begin
{*
 0004D97C    push        ebx
 0004D97D    push        esi
 0004D97E    mov         esi,edx
 0004D980    mov         ebx,eax
 0004D982    mov         edx,esi
 0004D984    mov         eax,dword ptr [ebx+24]
 0004D987    call        TList.Remove
 0004D98C    test        eax,eax
>0004D98E    jl          0004D995
 0004D990    xor         eax,eax
 0004D992    mov         dword ptr [esi+44],eax
 0004D995    pop         esi
 0004D996    pop         ebx
 0004D997    ret
*}
end;

//0004D998
procedure TCustomActionList.Change;
begin
{*
 0004D998    push        ebx
 0004D999    push        esi
 0004D99A    push        edi
 0004D99B    mov         ebx,eax
 0004D99D    cmp         word ptr [ebx+32],0
>0004D9A2    je          0004D9AC
 0004D9A4    mov         edx,ebx
 0004D9A6    mov         eax,dword ptr [ebx+34]
 0004D9A9    call        dword ptr [ebx+30]
 0004D9AC    mov         eax,dword ptr [ebx+24]
 0004D9AF    mov         esi,dword ptr [eax+8]
 0004D9B2    dec         esi
 0004D9B3    test        esi,esi
>0004D9B5    jl          0004D9CD
 0004D9B7    inc         esi
 0004D9B8    xor         edi,edi
 0004D9BA    mov         edx,edi
 0004D9BC    mov         eax,dword ptr [ebx+24]
 0004D9BF    call        TList.Get
 0004D9C4    mov         edx,dword ptr [eax]
 0004D9C6    call        dword ptr [edx+30]
 0004D9C9    inc         edi
 0004D9CA    dec         esi
>0004D9CB    jne         0004D9BA
 0004D9CD    test        byte ptr [ebx+20],10
>0004D9D1    je          0004D9FB
 0004D9D3    mov         esi,dword ptr [ebx+4]
 0004D9D6    mov         eax,esi
 0004D9D8    mov         edx,dword ptr ds:[554E4];TForm
 0004D9DE    call        @IsClass
 0004D9E3    test        al,al
>0004D9E5    je          0004D9FB
 0004D9E7    cmp         dword ptr [esi+230],0
>0004D9EE    je          0004D9FB
 0004D9F0    mov         eax,dword ptr [esi+230]
 0004D9F6    mov         edx,dword ptr [eax]
 0004D9F8    call        dword ptr [edx+0C]
 0004D9FB    pop         edi
 0004D9FC    pop         esi
 0004D9FD    pop         ebx
 0004D9FE    ret
*}
end;

//0004DA00
function TCustomActionList.IsShortCut(var Message:TWMKey):Boolean;
begin
{*
 0004DA00    push        ebx
 0004DA01    push        esi
 0004DA02    push        edi
 0004DA03    push        ebp
 0004DA04    mov         esi,edx
 0004DA06    mov         edi,eax
 0004DA08    mov         eax,dword ptr [esi+8]
 0004DA0B    call        KeyDataToShiftState
 0004DA10    mov         ebx,eax
 0004DA12    mov         ax,word ptr [esi+4]
 0004DA16    mov         edx,ebx
 0004DA18    call        ShortCut
 0004DA1D    mov         ebp,eax
 0004DA1F    mov         eax,dword ptr [edi+24]
 0004DA22    mov         esi,dword ptr [eax+8]
 0004DA25    dec         esi
 0004DA26    test        esi,esi
>0004DA28    jl          0004DA56
 0004DA2A    inc         esi
 0004DA2B    xor         ebx,ebx
 0004DA2D    mov         eax,dword ptr [edi+24]
 0004DA30    mov         edx,ebx
 0004DA32    call        TList.Get
 0004DA37    cmp         bp,word ptr [eax+60]
>0004DA3B    jne         0004DA52
 0004DA3D    mov         eax,dword ptr [edi+24]
 0004DA40    mov         edx,ebx
 0004DA42    call        TList.Get
 0004DA47    mov         bx,0FFF0
 0004DA4B    call        @CallDynaInst
>0004DA50    jmp         0004DA58
 0004DA52    inc         ebx
 0004DA53    dec         esi
>0004DA54    jne         0004DA2D
 0004DA56    xor         eax,eax
 0004DA58    pop         ebp
 0004DA59    pop         edi
 0004DA5A    pop         esi
 0004DA5B    pop         ebx
 0004DA5C    ret
*}
end;

//0004DA60
procedure TCustomActionList.ExecuteAction(Action:TBasicAction);
begin
{*
 0004DA60    push        ebx
 0004DA61    push        ecx
 0004DA62    mov         byte ptr [esp],0
 0004DA66    cmp         word ptr [eax+3A],0
>0004DA6B    je          0004DA77
 0004DA6D    mov         ecx,esp
 0004DA6F    mov         ebx,eax
 0004DA71    mov         eax,dword ptr [ebx+3C]
 0004DA74    call        dword ptr [ebx+38]
 0004DA77    mov         al,byte ptr [esp]
 0004DA7A    pop         edx
 0004DA7B    pop         ebx
 0004DA7C    ret
*}
end;

//0004DA80
procedure TCustomActionList.UpdateAction(Action:TBasicAction);
begin
{*
 0004DA80    push        ebx
 0004DA81    push        ecx
 0004DA82    mov         byte ptr [esp],0
 0004DA86    cmp         word ptr [eax+42],0
>0004DA8B    je          0004DA97
 0004DA8D    mov         ecx,esp
 0004DA8F    mov         ebx,eax
 0004DA91    mov         eax,dword ptr [ebx+44]
 0004DA94    call        dword ptr [ebx+40]
 0004DA97    mov         al,byte ptr [esp]
 0004DA9A    pop         edx
 0004DA9B    pop         ebx
 0004DA9C    ret
*}
end;

//0004DAA0
function TActionLink.IsCaptionLinked:Boolean;
begin
{*
 0004DAA0    push        ebx
 0004DAA1    mov         ebx,eax
 0004DAA3    mov         eax,dword ptr [ebx+0C]
 0004DAA6    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DAAC    call        @IsClass
 0004DAB1    pop         ebx
 0004DAB2    ret
*}
end;

//0004DAB4
function TActionLink.IsCheckedLinked:Boolean;
begin
{*
 0004DAB4    push        ebx
 0004DAB5    mov         ebx,eax
 0004DAB7    mov         eax,dword ptr [ebx+0C]
 0004DABA    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DAC0    call        @IsClass
 0004DAC5    pop         ebx
 0004DAC6    ret
*}
end;

//0004DAC8
function TActionLink.IsEnabledLinked:Boolean;
begin
{*
 0004DAC8    push        ebx
 0004DAC9    mov         ebx,eax
 0004DACB    mov         eax,dword ptr [ebx+0C]
 0004DACE    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DAD4    call        @IsClass
 0004DAD9    pop         ebx
 0004DADA    ret
*}
end;

//0004DADC
function TActionLink.IsHelpContextLinked:Boolean;
begin
{*
 0004DADC    push        ebx
 0004DADD    mov         ebx,eax
 0004DADF    mov         eax,dword ptr [ebx+0C]
 0004DAE2    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DAE8    call        @IsClass
 0004DAED    pop         ebx
 0004DAEE    ret
*}
end;

//0004DAF0
function TActionLink.IsHintLinked:Boolean;
begin
{*
 0004DAF0    push        ebx
 0004DAF1    mov         ebx,eax
 0004DAF3    mov         eax,dword ptr [ebx+0C]
 0004DAF6    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DAFC    call        @IsClass
 0004DB01    pop         ebx
 0004DB02    ret
*}
end;

//0004DB04
function TActionLink.IsImageIndexLinked:Boolean;
begin
{*
 0004DB04    push        ebx
 0004DB05    mov         ebx,eax
 0004DB07    mov         eax,dword ptr [ebx+0C]
 0004DB0A    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DB10    call        @IsClass
 0004DB15    pop         ebx
 0004DB16    ret
*}
end;

//0004DB18
function TActionLink.IsShortCutLinked:Boolean;
begin
{*
 0004DB18    push        ebx
 0004DB19    mov         ebx,eax
 0004DB1B    mov         eax,dword ptr [ebx+0C]
 0004DB1E    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DB24    call        @IsClass
 0004DB29    pop         ebx
 0004DB2A    ret
*}
end;

//0004DB2C
function TActionLink.IsVisibleLinked:Boolean;
begin
{*
 0004DB2C    push        ebx
 0004DB2D    mov         ebx,eax
 0004DB2F    mov         eax,dword ptr [ebx+0C]
 0004DB32    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DB38    call        @IsClass
 0004DB3D    pop         ebx
 0004DB3E    ret
*}
end;

//0004DB40
procedure sub_0004DB40;
begin
{*
 0004DB40    ret
*}
end;

//0004DB44
procedure sub_0004DB44;
begin
{*
 0004DB44    ret
*}
end;

//0004DB48
procedure sub_0004DB48;
begin
{*
 0004DB48    ret
*}
end;

//0004DB4C
procedure sub_0004DB4C;
begin
{*
 0004DB4C    ret
*}
end;

//0004DB50
procedure sub_0004DB50;
begin
{*
 0004DB50    ret
*}
end;

//0004DB54
procedure sub_0004DB54;
begin
{*
 0004DB54    ret
*}
end;

//0004DB58
procedure sub_0004DB58;
begin
{*
 0004DB58    ret
*}
end;

//0004DB5C
procedure sub_0004DB5C;
begin
{*
 0004DB5C    ret
*}
end;

//0004DB60
constructor TCustomAction.Create(AOwner:TComponent);
begin
{*
 0004DB60    push        ebx
 0004DB61    push        esi
 0004DB62    test        dl,dl
>0004DB64    je          0004DB6E
 0004DB66    add         esp,0FFFFFFF0
 0004DB69    call        @ClassCreate
 0004DB6E    mov         ebx,edx
 0004DB70    mov         esi,eax
 0004DB72    xor         edx,edx
 0004DB74    mov         eax,esi
 0004DB76    call        TBasicAction.Create
 0004DB7B    mov         byte ptr [esi+48],1
 0004DB7F    mov         byte ptr [esi+51],1
 0004DB83    mov         dword ptr [esi+5C],0FFFFFFFF
 0004DB8A    mov         byte ptr [esi+62],1
 0004DB8E    mov         eax,esi
 0004DB90    test        bl,bl
>0004DB92    je          0004DBA3
 0004DB94    call        @AfterConstruction
 0004DB99    pop         dword ptr fs:[0]
 0004DBA0    add         esp,0C
 0004DBA3    mov         eax,esi
 0004DBA5    pop         esi
 0004DBA6    pop         ebx
 0004DBA7    ret
*}
end;

//0004DBA8
destructor TCustomAction.Destroy;
begin
{*
 0004DBA8    push        ebx
 0004DBA9    push        esi
 0004DBAA    call        @BeforeDestruction
 0004DBAF    mov         ebx,edx
 0004DBB1    mov         esi,eax
 0004DBB3    mov         eax,dword ptr [esi+6C]
 0004DBB6    call        TObject.Free
 0004DBBB    mov         eax,dword ptr [esi+70]
 0004DBBE    call        TObject.Free
 0004DBC3    mov         edx,ebx
 0004DBC5    and         dl,0FC
 0004DBC8    mov         eax,esi
 0004DBCA    call        TContainedAction.Destroy
 0004DBCF    test        bl,bl
>0004DBD1    jle         0004DBDA
 0004DBD3    mov         eax,esi
 0004DBD5    call        @ClassDestroy
 0004DBDA    pop         esi
 0004DBDB    pop         ebx
 0004DBDC    ret
*}
end;

//0004DBE0
procedure TCustomAction.AssignTo(Dest:TPersistent);
begin
{*
 0004DBE0    push        ebx
 0004DBE1    push        esi
 0004DBE2    push        edi
 0004DBE3    mov         esi,edx
 0004DBE5    mov         ebx,eax
 0004DBE7    mov         eax,esi
 0004DBE9    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 0004DBEF    call        @IsClass
 0004DBF4    test        al,al
>0004DBF6    je          0004DC4D
 0004DBF8    mov         edx,dword ptr [ebx+4C]
 0004DBFB    mov         edi,esi
 0004DBFD    mov         eax,edi
 0004DBFF    call        TCustomAction.SetCaption
 0004DC04    mov         dl,byte ptr [ebx+50]
 0004DC07    mov         eax,edi
 0004DC09    call        TCustomAction.SetChecked
 0004DC0E    mov         dl,byte ptr [ebx+51]
 0004DC11    mov         eax,edi
 0004DC13    call        TCustomAction.SetEnabled
 0004DC18    mov         edx,dword ptr [ebx+54]
 0004DC1B    mov         eax,edi
 0004DC1D    call        TCustomAction.SetHelpContext
 0004DC22    mov         edx,dword ptr [ebx+58]
 0004DC25    mov         eax,edi
 0004DC27    call        TCustomAction.SetHint
 0004DC2C    mov         edx,dword ptr [ebx+5C]
 0004DC2F    mov         eax,edi
 0004DC31    call        TCustomAction.SetImageIndex
 0004DC36    mov         dx,word ptr [ebx+60]
 0004DC3A    mov         eax,edi
 0004DC3C    call        TCustomAction.SetShortCut
 0004DC41    mov         dl,byte ptr [ebx+62]
 0004DC44    mov         eax,edi
 0004DC46    call        TCustomAction.SetVisible
>0004DC4B    jmp         0004DC56
 0004DC4D    mov         edx,esi
 0004DC4F    mov         eax,ebx
 0004DC51    call        TPersistent.AssignTo
 0004DC56    pop         edi
 0004DC57    pop         esi
 0004DC58    pop         ebx
 0004DC59    ret
*}
end;

//0004DC5C
procedure TCustomAction.SetCaption(const Value:AnsiString);
begin
{*
 0004DC5C    push        ebx
 0004DC5D    push        esi
 0004DC5E    push        edi
 0004DC5F    push        ebp
 0004DC60    mov         ebp,edx
 0004DC62    mov         ebx,eax
 0004DC64    mov         eax,ebp
 0004DC66    mov         edx,dword ptr [ebx+4C]
 0004DC69    call        @LStrCmp
>0004DC6E    je          0004DCBD
 0004DC70    mov         eax,dword ptr [ebx+3C]
 0004DC73    mov         edi,dword ptr [eax+8]
 0004DC76    dec         edi
 0004DC77    test        edi,edi
>0004DC79    jl          0004DCAC
 0004DC7B    inc         edi
 0004DC7C    xor         esi,esi
 0004DC7E    mov         edx,esi
 0004DC80    mov         eax,dword ptr [ebx+3C]
 0004DC83    call        TList.Get
 0004DC88    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DC8E    call        @IsClass
 0004DC93    test        al,al
>0004DC95    je          0004DCA8
 0004DC97    mov         edx,esi
 0004DC99    mov         eax,dword ptr [ebx+3C]
 0004DC9C    call        TList.Get
 0004DCA1    mov         edx,ebp
 0004DCA3    mov         ecx,dword ptr [eax]
 0004DCA5    call        dword ptr [ecx+3C]
 0004DCA8    inc         esi
 0004DCA9    dec         edi
>0004DCAA    jne         0004DC7E
 0004DCAC    lea         eax,[ebx+4C]
 0004DCAF    mov         edx,ebp
 0004DCB1    call        @LStrAsg
 0004DCB6    mov         eax,ebx
 0004DCB8    mov         edx,dword ptr [eax]
 0004DCBA    call        dword ptr [edx+30]
 0004DCBD    pop         ebp
 0004DCBE    pop         edi
 0004DCBF    pop         esi
 0004DCC0    pop         ebx
 0004DCC1    ret
*}
end;

//0004DCC4
procedure TCustomAction.SetChecked(Value:Boolean);
begin
{*
 0004DCC4    push        ebx
 0004DCC5    push        esi
 0004DCC6    push        edi
 0004DCC7    push        ebp
 0004DCC8    mov         ebx,edx
 0004DCCA    mov         ebp,eax
 0004DCCC    cmp         bl,byte ptr [ebp+50]
>0004DCCF    je          0004DD17
 0004DCD1    mov         eax,dword ptr [ebp+3C]
 0004DCD4    mov         edi,dword ptr [eax+8]
 0004DCD7    dec         edi
 0004DCD8    test        edi,edi
>0004DCDA    jl          0004DD0D
 0004DCDC    inc         edi
 0004DCDD    xor         esi,esi
 0004DCDF    mov         edx,esi
 0004DCE1    mov         eax,dword ptr [ebp+3C]
 0004DCE4    call        TList.Get
 0004DCE9    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DCEF    call        @IsClass
 0004DCF4    test        al,al
>0004DCF6    je          0004DD09
 0004DCF8    mov         edx,esi
 0004DCFA    mov         eax,dword ptr [ebp+3C]
 0004DCFD    call        TList.Get
 0004DD02    mov         edx,ebx
 0004DD04    mov         ecx,dword ptr [eax]
 0004DD06    call        dword ptr [ecx+40]
 0004DD09    inc         esi
 0004DD0A    dec         edi
>0004DD0B    jne         0004DCDF
 0004DD0D    mov         byte ptr [ebp+50],bl
 0004DD10    mov         eax,ebp
 0004DD12    mov         edx,dword ptr [eax]
 0004DD14    call        dword ptr [edx+30]
 0004DD17    pop         ebp
 0004DD18    pop         edi
 0004DD19    pop         esi
 0004DD1A    pop         ebx
 0004DD1B    ret
*}
end;

//0004DD1C
procedure TCustomAction.SetEnabled(Value:Boolean);
begin
{*
 0004DD1C    push        ebx
 0004DD1D    push        esi
 0004DD1E    push        edi
 0004DD1F    push        ebp
 0004DD20    mov         ebx,edx
 0004DD22    mov         ebp,eax
 0004DD24    cmp         bl,byte ptr [ebp+51]
>0004DD27    je          0004DD6F
 0004DD29    mov         eax,dword ptr [ebp+3C]
 0004DD2C    mov         edi,dword ptr [eax+8]
 0004DD2F    dec         edi
 0004DD30    test        edi,edi
>0004DD32    jl          0004DD65
 0004DD34    inc         edi
 0004DD35    xor         esi,esi
 0004DD37    mov         edx,esi
 0004DD39    mov         eax,dword ptr [ebp+3C]
 0004DD3C    call        TList.Get
 0004DD41    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DD47    call        @IsClass
 0004DD4C    test        al,al
>0004DD4E    je          0004DD61
 0004DD50    mov         edx,esi
 0004DD52    mov         eax,dword ptr [ebp+3C]
 0004DD55    call        TList.Get
 0004DD5A    mov         edx,ebx
 0004DD5C    mov         ecx,dword ptr [eax]
 0004DD5E    call        dword ptr [ecx+44]
 0004DD61    inc         esi
 0004DD62    dec         edi
>0004DD63    jne         0004DD37
 0004DD65    mov         byte ptr [ebp+51],bl
 0004DD68    mov         eax,ebp
 0004DD6A    mov         edx,dword ptr [eax]
 0004DD6C    call        dword ptr [edx+30]
 0004DD6F    pop         ebp
 0004DD70    pop         edi
 0004DD71    pop         esi
 0004DD72    pop         ebx
 0004DD73    ret
*}
end;

//0004DD74
procedure TCustomAction.SetHelpContext(Value:THelpContext);
begin
{*
 0004DD74    push        ebx
 0004DD75    push        esi
 0004DD76    push        edi
 0004DD77    push        ebp
 0004DD78    mov         ebp,edx
 0004DD7A    mov         ebx,eax
 0004DD7C    cmp         ebp,dword ptr [ebx+54]
>0004DD7F    je          0004DDC7
 0004DD81    mov         eax,dword ptr [ebx+3C]
 0004DD84    mov         edi,dword ptr [eax+8]
 0004DD87    dec         edi
 0004DD88    test        edi,edi
>0004DD8A    jl          0004DDBD
 0004DD8C    inc         edi
 0004DD8D    xor         esi,esi
 0004DD8F    mov         edx,esi
 0004DD91    mov         eax,dword ptr [ebx+3C]
 0004DD94    call        TList.Get
 0004DD99    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DD9F    call        @IsClass
 0004DDA4    test        al,al
>0004DDA6    je          0004DDB9
 0004DDA8    mov         edx,esi
 0004DDAA    mov         eax,dword ptr [ebx+3C]
 0004DDAD    call        TList.Get
 0004DDB2    mov         edx,ebp
 0004DDB4    mov         ecx,dword ptr [eax]
 0004DDB6    call        dword ptr [ecx+48]
 0004DDB9    inc         esi
 0004DDBA    dec         edi
>0004DDBB    jne         0004DD8F
 0004DDBD    mov         dword ptr [ebx+54],ebp
 0004DDC0    mov         eax,ebx
 0004DDC2    mov         edx,dword ptr [eax]
 0004DDC4    call        dword ptr [edx+30]
 0004DDC7    pop         ebp
 0004DDC8    pop         edi
 0004DDC9    pop         esi
 0004DDCA    pop         ebx
 0004DDCB    ret
*}
end;

//0004DDCC
procedure TCustomAction.SetHint(const Value:AnsiString);
begin
{*
 0004DDCC    push        ebx
 0004DDCD    push        esi
 0004DDCE    push        edi
 0004DDCF    push        ebp
 0004DDD0    mov         ebp,edx
 0004DDD2    mov         ebx,eax
 0004DDD4    mov         eax,ebp
 0004DDD6    mov         edx,dword ptr [ebx+58]
 0004DDD9    call        @LStrCmp
>0004DDDE    je          0004DE2D
 0004DDE0    mov         eax,dword ptr [ebx+3C]
 0004DDE3    mov         edi,dword ptr [eax+8]
 0004DDE6    dec         edi
 0004DDE7    test        edi,edi
>0004DDE9    jl          0004DE1C
 0004DDEB    inc         edi
 0004DDEC    xor         esi,esi
 0004DDEE    mov         edx,esi
 0004DDF0    mov         eax,dword ptr [ebx+3C]
 0004DDF3    call        TList.Get
 0004DDF8    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DDFE    call        @IsClass
 0004DE03    test        al,al
>0004DE05    je          0004DE18
 0004DE07    mov         edx,esi
 0004DE09    mov         eax,dword ptr [ebx+3C]
 0004DE0C    call        TList.Get
 0004DE11    mov         edx,ebp
 0004DE13    mov         ecx,dword ptr [eax]
 0004DE15    call        dword ptr [ecx+4C]
 0004DE18    inc         esi
 0004DE19    dec         edi
>0004DE1A    jne         0004DDEE
 0004DE1C    lea         eax,[ebx+58]
 0004DE1F    mov         edx,ebp
 0004DE21    call        @LStrAsg
 0004DE26    mov         eax,ebx
 0004DE28    mov         edx,dword ptr [eax]
 0004DE2A    call        dword ptr [edx+30]
 0004DE2D    pop         ebp
 0004DE2E    pop         edi
 0004DE2F    pop         esi
 0004DE30    pop         ebx
 0004DE31    ret
*}
end;

//0004DE34
procedure TCustomAction.SetImageIndex(Value:Integer);
begin
{*
 0004DE34    push        ebx
 0004DE35    push        esi
 0004DE36    push        edi
 0004DE37    push        ebp
 0004DE38    mov         ebp,edx
 0004DE3A    mov         ebx,eax
 0004DE3C    cmp         ebp,dword ptr [ebx+5C]
>0004DE3F    je          0004DE87
 0004DE41    mov         eax,dword ptr [ebx+3C]
 0004DE44    mov         edi,dword ptr [eax+8]
 0004DE47    dec         edi
 0004DE48    test        edi,edi
>0004DE4A    jl          0004DE7D
 0004DE4C    inc         edi
 0004DE4D    xor         esi,esi
 0004DE4F    mov         edx,esi
 0004DE51    mov         eax,dword ptr [ebx+3C]
 0004DE54    call        TList.Get
 0004DE59    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DE5F    call        @IsClass
 0004DE64    test        al,al
>0004DE66    je          0004DE79
 0004DE68    mov         edx,esi
 0004DE6A    mov         eax,dword ptr [ebx+3C]
 0004DE6D    call        TList.Get
 0004DE72    mov         edx,ebp
 0004DE74    mov         ecx,dword ptr [eax]
 0004DE76    call        dword ptr [ecx+50]
 0004DE79    inc         esi
 0004DE7A    dec         edi
>0004DE7B    jne         0004DE4F
 0004DE7D    mov         dword ptr [ebx+5C],ebp
 0004DE80    mov         eax,ebx
 0004DE82    mov         edx,dword ptr [eax]
 0004DE84    call        dword ptr [edx+30]
 0004DE87    pop         ebp
 0004DE88    pop         edi
 0004DE89    pop         esi
 0004DE8A    pop         ebx
 0004DE8B    ret
*}
end;

//0004DE8C
procedure TCustomAction.SetShortCut(Value:TShortCut);
begin
{*
 0004DE8C    push        ebx
 0004DE8D    push        esi
 0004DE8E    push        edi
 0004DE8F    push        ebp
 0004DE90    mov         ebp,edx
 0004DE92    mov         ebx,eax
 0004DE94    cmp         bp,word ptr [ebx+60]
>0004DE98    je          0004DEE1
 0004DE9A    mov         eax,dword ptr [ebx+3C]
 0004DE9D    mov         edi,dword ptr [eax+8]
 0004DEA0    dec         edi
 0004DEA1    test        edi,edi
>0004DEA3    jl          0004DED6
 0004DEA5    inc         edi
 0004DEA6    xor         esi,esi
 0004DEA8    mov         edx,esi
 0004DEAA    mov         eax,dword ptr [ebx+3C]
 0004DEAD    call        TList.Get
 0004DEB2    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DEB8    call        @IsClass
 0004DEBD    test        al,al
>0004DEBF    je          0004DED2
 0004DEC1    mov         edx,esi
 0004DEC3    mov         eax,dword ptr [ebx+3C]
 0004DEC6    call        TList.Get
 0004DECB    mov         edx,ebp
 0004DECD    mov         ecx,dword ptr [eax]
 0004DECF    call        dword ptr [ecx+54]
 0004DED2    inc         esi
 0004DED3    dec         edi
>0004DED4    jne         0004DEA8
 0004DED6    mov         word ptr [ebx+60],bp
 0004DEDA    mov         eax,ebx
 0004DEDC    mov         edx,dword ptr [eax]
 0004DEDE    call        dword ptr [edx+30]
 0004DEE1    pop         ebp
 0004DEE2    pop         edi
 0004DEE3    pop         esi
 0004DEE4    pop         ebx
 0004DEE5    ret
*}
end;

//0004DEE8
procedure TCustomAction.SetVisible(Value:Boolean);
begin
{*
 0004DEE8    push        ebx
 0004DEE9    push        esi
 0004DEEA    push        edi
 0004DEEB    push        ebp
 0004DEEC    mov         ebx,edx
 0004DEEE    mov         ebp,eax
 0004DEF0    cmp         bl,byte ptr [ebp+62]
>0004DEF3    je          0004DF3B
 0004DEF5    mov         eax,dword ptr [ebp+3C]
 0004DEF8    mov         edi,dword ptr [eax+8]
 0004DEFB    dec         edi
 0004DEFC    test        edi,edi
>0004DEFE    jl          0004DF31
 0004DF00    inc         edi
 0004DF01    xor         esi,esi
 0004DF03    mov         edx,esi
 0004DF05    mov         eax,dword ptr [ebp+3C]
 0004DF08    call        TList.Get
 0004DF0D    mov         edx,dword ptr ds:[4D4D4];TActionLink
 0004DF13    call        @IsClass
 0004DF18    test        al,al
>0004DF1A    je          0004DF2D
 0004DF1C    mov         edx,esi
 0004DF1E    mov         eax,dword ptr [ebp+3C]
 0004DF21    call        TList.Get
 0004DF26    mov         edx,ebx
 0004DF28    mov         ecx,dword ptr [eax]
 0004DF2A    call        dword ptr [ecx+58]
 0004DF2D    inc         esi
 0004DF2E    dec         edi
>0004DF2F    jne         0004DF03
 0004DF31    mov         byte ptr [ebp+62],bl
 0004DF34    mov         eax,ebp
 0004DF36    mov         edx,dword ptr [eax]
 0004DF38    call        dword ptr [edx+30]
 0004DF3B    pop         ebp
 0004DF3C    pop         edi
 0004DF3D    pop         esi
 0004DF3E    pop         ebx
 0004DF3F    ret
*}
end;

//0004DF40
procedure TCustomAction.SetName(const Value:TComponentName);
begin
{*
 0004DF40    push        ebx
 0004DF41    push        esi
 0004DF42    push        edi
 0004DF43    mov         edi,edx
 0004DF45    mov         esi,eax
 0004DF47    mov         eax,dword ptr [esi+8]
 0004DF4A    mov         edx,dword ptr [esi+4C]
 0004DF4D    call        @LStrCmp
>0004DF52    jne         0004DF61
 0004DF54    mov         ebx,dword ptr [esi+4]
 0004DF57    test        ebx,ebx
>0004DF59    je          0004DF65
 0004DF5B    test        byte ptr [ebx+20],1
>0004DF5F    je          0004DF65
 0004DF61    xor         eax,eax
>0004DF63    jmp         0004DF67
 0004DF65    mov         al,1
 0004DF67    mov         ebx,eax
 0004DF69    mov         edx,edi
 0004DF6B    mov         eax,esi
 0004DF6D    call        TComponent.SetName
 0004DF72    test        bl,bl
>0004DF74    je          0004DF88
 0004DF76    mov         eax,dword ptr [esi+3C]
 0004DF79    cmp         dword ptr [eax+8],0
>0004DF7D    jne         0004DF88
 0004DF7F    mov         edx,edi
 0004DF81    mov         eax,esi
 0004DF83    call        TCustomAction.SetCaption
 0004DF88    pop         edi
 0004DF89    pop         esi
 0004DF8A    pop         ebx
 0004DF8B    ret
*}
end;

//0004DF8C
function TCustomAction.DoHint(var HintStr:AnsiString):Boolean;
begin
{*
 0004DF8C    push        ebx
 0004DF8D    push        ecx
 0004DF8E    mov         byte ptr [esp],1
 0004DF92    cmp         word ptr [eax+66],0
>0004DF97    je          0004DFA3
 0004DF99    mov         ecx,esp
 0004DF9B    mov         ebx,eax
 0004DF9D    mov         eax,dword ptr [ebx+68]
 0004DFA0    call        dword ptr [ebx+64]
 0004DFA3    mov         al,byte ptr [esp]
 0004DFA6    pop         edx
 0004DFA7    pop         ebx
 0004DFA8    ret
*}
end;

//0004DFAC
procedure TCustomAction.Execute;
begin
{*
 0004DFAC    push        ebx
 0004DFAD    mov         ebx,eax
 0004DFAF    mov         eax,ebx
 0004DFB1    mov         edx,dword ptr [eax]
 0004DFB3    call        dword ptr [edx+44]
 0004DFB6    cmp         byte ptr [ebx+51],0
>0004DFBA    je          0004DFC7
 0004DFBC    mov         eax,ebx
 0004DFBE    call        TContainedAction.Execute
 0004DFC3    test        al,al
>0004DFC5    jne         0004DFCB
 0004DFC7    xor         eax,eax
 0004DFC9    pop         ebx
 0004DFCA    ret
 0004DFCB    mov         al,1
 0004DFCD    pop         ebx
 0004DFCE    ret
*}
end;

end.