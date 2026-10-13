//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ImgList;

interface

uses
  SysUtils, Classes, ImgList, Graphics;

type
  TChangeLink = class(TObject)
  public
    FSender:TCustomImageList;//f4
    FOnChange:TNotifyEvent;//f8
    procedure Change; dynamic;//0004FBA4
    destructor Destroy;//0004FB70
  end;
  TDrawingStyle = (dsFocus, dsSelected, dsNormal, dsTransparent);
  TImageType = (itImage, itMask);
  TCustomImageList = class(TComponent)
  public
    FHeight:Integer;//f24
    FWidth:Integer;//f28
    FAllocBy:Integer;//f2C
    FHandle:HIMAGELIST;//f30
    FDrawingStyle:TDrawingStyle;//f34
    FMasked:Boolean;//f35
    FShareImages:Boolean;//f36
    FImageType:TImageType;//f37
    FBkColor:TColor;//f38
    FBlendColor:TColor;//f3C
    FClients:TList;//f40
    FBitmap:TBitmap;//f44
    FMonoBitmap:TBitmap;//f48
    FChanged:Boolean;//f4C
    FUpdateCount:Integer;//f50
    FOnChange:TNotifyEvent;//f54
    destructor Destroy; virtual;//0004E290
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0004F0FC
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0004F484
    procedure Assign(Source:TPersistent); virtual;//v8//0004F03C
    constructor Create(AOwner:TComponent); virtual;//v2C//0004E1F0
    //procedure v30(?:?; ?:?; ?:?; ?:?; ?:?; ?:?); virtual;//v30//0004EC60
    procedure Initialize; virtual;//v34//0004E2FC
    function GetHotSpot:TPoint; virtual;//v38//0004F240
    procedure Change; dynamic;//0004F250
    constructor CreateSize(AWidth:Integer; AHeight:Integer);//0004E23C
    function HandleAllocated:Boolean;//0004E3B4
    procedure HandleNeeded;//0004E3BC
    procedure InitBitmap;//0004E3C8
    procedure SetNewDimensions(Value:HIMAGELIST);//0004E48C
    procedure SetWidth(Value:Integer);//0004E4C4
    procedure SetHeight(Value:Integer);//0004E508
    procedure SetHandle(Value:HIMAGELIST);//0004E54C
    function GetBitmapHandle(Bitmap:HBITMAP):HBITMAP;//0004E578
    function GetHandle:HIMAGELIST;//0004E588
    function GetImageHandle(Image:TBitmap; ImageDDB:TBitmap):HBITMAP;//0004E598
    procedure FreeHandle;//0004E5EC
    procedure CreateImageList;//0004E620
    function GetImageBitmap:HBITMAP;//0004E6BC
    function GetMaskBitmap:HBITMAP;//0004E6FC
    function Add(Image:TBitmap; Mask:TBitmap):Integer;//0004E73C
    function AddMasked(Image:TBitmap; MaskColor:TColor):Integer;//0004E808
    function GetCount:Integer;//0004E924
    procedure ReplaceMasked(Index:Integer; NewImage:TBitmap; MaskColor:TColor);//0004E948
    procedure Delete(Index:Integer);//0004EB68
    procedure Clear;//0004EBF4
    procedure SetBkColor(Value:TColor);//0004EC00
    function GetBkColor:TColor;//0004EC38
    procedure Draw(Canvas:TCanvas; X:Integer; Y:Integer; Index:Integer; Enabled:Boolean);//0004EE38
    procedure CopyImages(Value:HIMAGELIST);//0004EE84
    procedure AddImages(Value:TCustomImageList);//0004F01C
    procedure CheckImage(Image:TGraphic);//0004F1AC
    procedure SetDrawingStyle(Value:TDrawingStyle);//0004F224
    procedure UnRegisterChanges(Value:TChangeLink);//0004F2A0
    procedure RegisterChanges(Value:TChangeLink);//0004F2E4
    function Equal(IL:TCustomImageList):Boolean;//0004F338
    procedure ReadD2Stream(Stream:TStream);//0004F4DC
    procedure ReadD3Stream(Stream:TStream);//0004F76C
    procedure ReadData(Stream:TStream);//0004F830
    procedure WriteData(Stream:TStream);//0004FA44
    procedure BeginUpdate;//0004FB4C
    procedure EndUpdate;//0004FB50
  end;
    function GetRGBColor(Value:TColor):DWORD;//0004E1B0
    function GetColor(Value:DWORD):TColor;//0004E1D0
    constructor Create(AOwner:TComponent);//0004E1F0
    destructor Destroy;//0004E290
    procedure Initialize;//0004E2FC
    //procedure sub_0004EC60(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//0004EC60
    procedure Assign(Source:TPersistent);//0004F03C
    procedure AssignTo(Dest:TPersistent);//0004F0FC
    function GetHotSpot:TPoint;//0004F240
    procedure Change;//0004F250
    function StreamsEqual(S1:TMemoryStream; S2:TMemoryStream):Boolean;//0004F2F8
    function DoWrite:Boolean;//0004F428
    procedure DefineProperties(Filer:TFiler);//0004F484
    procedure WriteDIB(BM:HBITMAP);//0004F8B8
    procedure Change;//0004FBA4

implementation

//0004E1B0
function GetRGBColor(Value:TColor):DWORD;
begin
{*
 0004E1B0    call        ColorToRGB
 0004E1B5    mov         edx,eax
 0004E1B7    sub         edx,1FFFFFFF
>0004E1BD    je          0004E1C4
 0004E1BF    dec         edx
>0004E1C0    je          0004E1C8
>0004E1C2    jmp         0004E1CD
 0004E1C4    or          eax,0FFFFFFFF
 0004E1C7    ret
 0004E1C8    mov         eax,0FF000000
 0004E1CD    ret
*}
end;

//0004E1D0
function GetColor(Value:DWORD):TColor;
begin
{*
 0004E1D0    mov         edx,eax
 0004E1D2    sub         edx,0FF000000
>0004E1D8    je          0004E1E8
 0004E1DA    sub         edx,0FFFFFF
>0004E1E0    jne         0004E1ED
 0004E1E2    mov         eax,1FFFFFFF
 0004E1E7    ret
 0004E1E8    mov         eax,20000000
 0004E1ED    ret
*}
end;

//0004E1F0
constructor TCustomImageList.Create(AOwner:TComponent);
begin
{*
 0004E1F0    push        ebx
 0004E1F1    push        esi
 0004E1F2    test        dl,dl
>0004E1F4    je          0004E1FE
 0004E1F6    add         esp,0FFFFFFF0
 0004E1F9    call        @ClassCreate
 0004E1FE    mov         ebx,edx
 0004E200    mov         esi,eax
 0004E202    xor         edx,edx
 0004E204    mov         eax,esi
 0004E206    call        TComponent.Create
 0004E20B    mov         dword ptr [esi+28],10
 0004E212    mov         dword ptr [esi+24],10
 0004E219    mov         eax,esi
 0004E21B    mov         edx,dword ptr [eax]
 0004E21D    call        dword ptr [edx+34]
 0004E220    mov         eax,esi
 0004E222    test        bl,bl
>0004E224    je          0004E235
 0004E226    call        @AfterConstruction
 0004E22B    pop         dword ptr fs:[0]
 0004E232    add         esp,0C
 0004E235    mov         eax,esi
 0004E237    pop         esi
 0004E238    pop         ebx
 0004E239    ret
*}
end;

//0004E23C
constructor TCustomImageList.CreateSize(AWidth:Integer; AHeight:Integer);
begin
{*
 0004E23C    push        ebp
 0004E23D    mov         ebp,esp
 0004E23F    push        ebx
 0004E240    push        esi
 0004E241    push        edi
 0004E242    test        dl,dl
>0004E244    je          0004E24E
 0004E246    add         esp,0FFFFFFF0
 0004E249    call        @ClassCreate
 0004E24E    mov         esi,ecx
 0004E250    mov         ebx,edx
 0004E252    mov         edi,eax
 0004E254    xor         ecx,ecx
 0004E256    xor         edx,edx
 0004E258    mov         eax,edi
 0004E25A    call        TComponent.Create
 0004E25F    mov         dword ptr [edi+28],esi
 0004E262    mov         eax,dword ptr [ebp+8]
 0004E265    mov         dword ptr [edi+24],eax
 0004E268    mov         eax,edi
 0004E26A    mov         edx,dword ptr [eax]
 0004E26C    call        dword ptr [edx+34]
 0004E26F    mov         eax,edi
 0004E271    test        bl,bl
>0004E273    je          0004E284
 0004E275    call        @AfterConstruction
 0004E27A    pop         dword ptr fs:[0]
 0004E281    add         esp,0C
 0004E284    mov         eax,edi
 0004E286    pop         edi
 0004E287    pop         esi
 0004E288    pop         ebx
 0004E289    pop         ebp
 0004E28A    ret         4
*}
end;

//0004E290
destructor TCustomImageList.Destroy;
begin
{*
 0004E290    push        ebx
 0004E291    push        esi
 0004E292    push        edi
 0004E293    call        @BeforeDestruction
 0004E298    mov         ebx,edx
 0004E29A    mov         edi,eax
>0004E29C    jmp         0004E2AE
 0004E29E    mov         eax,esi
 0004E2A0    call        TList.Last
 0004E2A5    mov         edx,eax
 0004E2A7    mov         eax,edi
 0004E2A9    call        TCustomImageList.UnRegisterChanges
 0004E2AE    mov         esi,dword ptr [edi+40]
 0004E2B1    cmp         dword ptr [esi+8],0
>0004E2B5    jg          0004E29E
 0004E2B7    mov         eax,dword ptr [edi+44]
 0004E2BA    call        TObject.Free
 0004E2BF    mov         eax,edi
 0004E2C1    call        TCustomImageList.FreeHandle
 0004E2C6    mov         eax,dword ptr [edi+40]
 0004E2C9    call        TObject.Free
 0004E2CE    xor         eax,eax
 0004E2D0    mov         dword ptr [edi+40],eax
 0004E2D3    mov         eax,dword ptr [edi+48]
 0004E2D6    test        eax,eax
>0004E2D8    je          0004E2DF
 0004E2DA    call        TObject.Free
 0004E2DF    mov         edx,ebx
 0004E2E1    and         dl,0FC
 0004E2E4    mov         eax,edi
 0004E2E6    call        TComponent.Destroy
 0004E2EB    test        bl,bl
>0004E2ED    jle         0004E2F6
 0004E2EF    mov         eax,edi
 0004E2F1    call        @ClassDestroy
 0004E2F6    pop         edi
 0004E2F7    pop         esi
 0004E2F8    pop         ebx
 0004E2F9    ret
*}
end;

//0004E2FC
procedure TCustomImageList.Initialize;
begin
{*
 0004E2FC    push        ebp
 0004E2FD    mov         ebp,esp
 0004E2FF    push        0
 0004E301    push        ebx
 0004E302    mov         ebx,eax
 0004E304    xor         eax,eax
 0004E306    push        ebp
 0004E307    push        4E3A9
 0004E30C    push        dword ptr fs:[eax]
 0004E30F    mov         dword ptr fs:[eax],esp
 0004E312    mov         dl,1
 0004E314    mov         eax,[0001EEC4];TList
 0004E319    call        TObject.Create
 0004E31E    mov         dword ptr [ebx+40],eax
 0004E321    mov         eax,dword ptr [ebx+24]
 0004E324    cmp         eax,1
>0004E327    jl          0004E336
 0004E329    cmp         eax,8000
>0004E32E    jg          0004E336
 0004E330    cmp         dword ptr [ebx+28],1
>0004E334    jge         0004E357
 0004E336    lea         edx,[ebp-4]
 0004E339    mov         eax,[000B57BC];^SInvalidImageSize:TResStringRec
 0004E33E    call        LoadResString
 0004E343    mov         ecx,dword ptr [ebp-4]
 0004E346    mov         dl,1
 0004E348    mov         eax,[0001EE64];EInvalidOperation
 0004E34D    call        Exception.Create
 0004E352    call        @RaiseExcept
 0004E357    mov         dword ptr [ebx+2C],4
 0004E35E    mov         byte ptr [ebx+35],1
 0004E362    mov         dl,2
 0004E364    mov         eax,ebx
 0004E366    call        TCustomImageList.SetDrawingStyle
 0004E36B    mov         byte ptr [ebx+37],0
 0004E36F    mov         dword ptr [ebx+38],1FFFFFFF
 0004E376    mov         dword ptr [ebx+3C],1FFFFFFF
 0004E37D    mov         dl,1
 0004E37F    mov         eax,[00028F70];TBitmap
 0004E384    call        TBitmap.Create
 0004E389    mov         dword ptr [ebx+44],eax
 0004E38C    mov         eax,ebx
 0004E38E    call        TCustomImageList.InitBitmap
 0004E393    xor         eax,eax
 0004E395    pop         edx
 0004E396    pop         ecx
 0004E397    pop         ecx
 0004E398    mov         dword ptr fs:[eax],edx
 0004E39B    push        4E3B0
 0004E3A0    lea         eax,[ebp-4]
 0004E3A3    call        @LStrClr
 0004E3A8    ret
>0004E3A9    jmp         @HandleFinally
>0004E3AE    jmp         0004E3A0
 0004E3B0    pop         ebx
 0004E3B1    pop         ecx
 0004E3B2    pop         ebp
 0004E3B3    ret
*}
end;

//0004E3B4
function TCustomImageList.HandleAllocated:Boolean;
begin
{*
 0004E3B4    cmp         dword ptr [eax+30],0
 0004E3B8    setne       al
 0004E3BB    ret
*}
end;

//0004E3BC
procedure TCustomImageList.HandleNeeded;
begin
{*
 0004E3BC    cmp         dword ptr [eax+30],0
>0004E3C0    jne         0004E3C7
 0004E3C2    call        TCustomImageList.CreateImageList
 0004E3C7    ret
*}
end;

//0004E3C8
procedure TCustomImageList.InitBitmap;
begin
{*
 0004E3C8    push        ebp
 0004E3C9    mov         ebp,esp
 0004E3CB    add         esp,0FFFFFFE8
 0004E3CE    push        ebx
 0004E3CF    mov         dword ptr [ebp-4],eax
 0004E3D2    push        0
 0004E3D4    call        user32.GetDC
 0004E3D9    mov         dword ptr [ebp-8],eax
 0004E3DC    xor         eax,eax
 0004E3DE    push        ebp
 0004E3DF    push        4E469
 0004E3E4    push        dword ptr fs:[eax]
 0004E3E7    mov         dword ptr fs:[eax],esp
 0004E3EA    mov         eax,dword ptr [ebp-4]
 0004E3ED    mov         ebx,dword ptr [eax+44]
 0004E3F0    mov         eax,dword ptr [ebp-4]
 0004E3F3    mov         eax,dword ptr [eax+24]
 0004E3F6    push        eax
 0004E3F7    mov         eax,dword ptr [ebp-4]
 0004E3FA    mov         eax,dword ptr [eax+28]
 0004E3FD    push        eax
 0004E3FE    mov         eax,dword ptr [ebp-8]
 0004E401    push        eax
 0004E402    call        gdi32.CreateCompatibleBitmap
 0004E407    mov         edx,eax
 0004E409    mov         eax,ebx
 0004E40B    call        TBitmap.SetHandle
 0004E410    mov         eax,ebx
 0004E412    call        TBitmap.GetCanvas
 0004E417    mov         eax,dword ptr [eax+14]
 0004E41A    xor         edx,edx
 0004E41C    call        TBrush.SetColor
 0004E421    mov         eax,ebx
 0004E423    mov         edx,dword ptr [eax]
 0004E425    call        dword ptr [edx+20]
 0004E428    push        eax
 0004E429    lea         eax,[ebp-18]
 0004E42C    push        eax
 0004E42D    mov         eax,ebx
 0004E42F    mov         edx,dword ptr [eax]
 0004E431    call        dword ptr [edx+2C]
 0004E434    mov         ecx,eax
 0004E436    xor         edx,edx
 0004E438    xor         eax,eax
 0004E43A    call        Rect
 0004E43F    lea         eax,[ebp-18]
 0004E442    push        eax
 0004E443    mov         eax,ebx
 0004E445    call        TBitmap.GetCanvas
 0004E44A    pop         edx
 0004E44B    call        TCanvas.FillRect
 0004E450    xor         eax,eax
 0004E452    pop         edx
 0004E453    pop         ecx
 0004E454    pop         ecx
 0004E455    mov         dword ptr fs:[eax],edx
 0004E458    push        4E470
 0004E45D    mov         eax,dword ptr [ebp-8]
 0004E460    push        eax
 0004E461    push        0
 0004E463    call        user32.ReleaseDC
 0004E468    ret
>0004E469    jmp         @HandleFinally
>0004E46E    jmp         0004E45D
 0004E470    mov         eax,dword ptr [ebp-4]
 0004E473    mov         eax,dword ptr [eax+48]
 0004E476    test        eax,eax
>0004E478    je          0004E487
 0004E47A    call        TObject.Free
 0004E47F    mov         eax,dword ptr [ebp-4]
 0004E482    xor         edx,edx
 0004E484    mov         dword ptr [eax+48],edx
 0004E487    pop         ebx
 0004E488    mov         esp,ebp
 0004E48A    pop         ebp
 0004E48B    ret
*}
end;

//0004E48C
procedure TCustomImageList.SetNewDimensions(Value:HIMAGELIST);
begin
{*
 0004E48C    push        ebx
 0004E48D    add         esp,0FFFFFFF8
 0004E490    mov         ebx,eax
 0004E492    mov         eax,dword ptr [ebx+28]
 0004E495    mov         dword ptr [esp+4],eax
 0004E499    mov         eax,dword ptr [ebx+24]
 0004E49C    mov         dword ptr [esp],eax
 0004E49F    push        esp
 0004E4A0    lea         eax,[esp+8]
 0004E4A4    push        eax
 0004E4A5    push        edx
 0004E4A6    call        comctl32.ImageList_GetIconSize
 0004E4AB    mov         eax,dword ptr [esp+4]
 0004E4AF    mov         dword ptr [ebx+28],eax
 0004E4B2    mov         eax,dword ptr [esp]
 0004E4B5    mov         dword ptr [ebx+24],eax
 0004E4B8    mov         eax,ebx
 0004E4BA    call        TCustomImageList.InitBitmap
 0004E4BF    pop         ecx
 0004E4C0    pop         edx
 0004E4C1    pop         ebx
 0004E4C2    ret
*}
end;

//0004E4C4
procedure TCustomImageList.SetWidth(Value:Integer);
begin
{*
 0004E4C4    push        ebx
 0004E4C5    push        esi
 0004E4C6    mov         esi,eax
 0004E4C8    cmp         edx,dword ptr [esi+28]
>0004E4CB    je          0004E505
 0004E4CD    mov         dword ptr [esi+28],edx
 0004E4D0    mov         eax,esi
 0004E4D2    call        TCustomImageList.HandleAllocated
 0004E4D7    test        al,al
>0004E4D9    je          0004E4EC
 0004E4DB    mov         eax,dword ptr [esi+24]
 0004E4DE    push        eax
 0004E4DF    mov         eax,dword ptr [esi+28]
 0004E4E2    push        eax
 0004E4E3    mov         eax,dword ptr [esi+30]
 0004E4E6    push        eax
 0004E4E7    call        comctl32.ImageList_SetIconSize
 0004E4EC    mov         eax,esi
 0004E4EE    call        TCustomImageList.Clear
 0004E4F3    mov         eax,esi
 0004E4F5    call        TCustomImageList.InitBitmap
 0004E4FA    mov         eax,esi
 0004E4FC    mov         bx,0FFF0
 0004E500    call        @CallDynaInst
 0004E505    pop         esi
 0004E506    pop         ebx
 0004E507    ret
*}
end;

//0004E508
procedure TCustomImageList.SetHeight(Value:Integer);
begin
{*
 0004E508    push        ebx
 0004E509    push        esi
 0004E50A    mov         esi,eax
 0004E50C    cmp         edx,dword ptr [esi+24]
>0004E50F    je          0004E549
 0004E511    mov         dword ptr [esi+24],edx
 0004E514    mov         eax,esi
 0004E516    call        TCustomImageList.HandleAllocated
 0004E51B    test        al,al
>0004E51D    je          0004E530
 0004E51F    mov         eax,dword ptr [esi+24]
 0004E522    push        eax
 0004E523    mov         eax,dword ptr [esi+28]
 0004E526    push        eax
 0004E527    mov         eax,dword ptr [esi+30]
 0004E52A    push        eax
 0004E52B    call        comctl32.ImageList_SetIconSize
 0004E530    mov         eax,esi
 0004E532    call        TCustomImageList.Clear
 0004E537    mov         eax,esi
 0004E539    call        TCustomImageList.InitBitmap
 0004E53E    mov         eax,esi
 0004E540    mov         bx,0FFF0
 0004E544    call        @CallDynaInst
 0004E549    pop         esi
 0004E54A    pop         ebx
 0004E54B    ret
*}
end;

//0004E54C
procedure TCustomImageList.SetHandle(Value:HIMAGELIST);
begin
{*
 0004E54C    push        ebx
 0004E54D    push        esi
 0004E54E    mov         esi,edx
 0004E550    mov         ebx,eax
 0004E552    mov         eax,ebx
 0004E554    call        TCustomImageList.FreeHandle
 0004E559    test        esi,esi
>0004E55B    je          0004E574
 0004E55D    mov         edx,esi
 0004E55F    mov         eax,ebx
 0004E561    call        TCustomImageList.SetNewDimensions
 0004E566    mov         dword ptr [ebx+30],esi
 0004E569    mov         eax,ebx
 0004E56B    mov         bx,0FFF0
 0004E56F    call        @CallDynaInst
 0004E574    pop         esi
 0004E575    pop         ebx
 0004E576    ret
*}
end;

//0004E578
function TCustomImageList.GetBitmapHandle(Bitmap:HBITMAP):HBITMAP;
begin
{*
 0004E578    test        edx,edx
>0004E57A    je          0004E57F
 0004E57C    mov         eax,edx
 0004E57E    ret
 0004E57F    mov         eax,dword ptr [eax+44]
 0004E582    mov         edx,dword ptr [eax]
 0004E584    call        dword ptr [edx+60]
 0004E587    ret
*}
end;

//0004E588
function TCustomImageList.GetHandle:HIMAGELIST;
begin
{*
 0004E588    push        ebx
 0004E589    mov         ebx,eax
 0004E58B    mov         eax,ebx
 0004E58D    call        TCustomImageList.HandleNeeded
 0004E592    mov         eax,dword ptr [ebx+30]
 0004E595    pop         ebx
 0004E596    ret
*}
end;

//0004E598
function TCustomImageList.GetImageHandle(Image:TBitmap; ImageDDB:TBitmap):HBITMAP;
begin
{*
 0004E598    push        ebx
 0004E599    push        esi
 0004E59A    push        edi
 0004E59B    mov         edi,ecx
 0004E59D    mov         ebx,edx
 0004E59F    mov         esi,eax
 0004E5A1    mov         edx,ebx
 0004E5A3    mov         eax,esi
 0004E5A5    call        TCustomImageList.CheckImage
 0004E5AA    test        ebx,ebx
>0004E5AC    je          0004E5DD
 0004E5AE    mov         eax,ebx
 0004E5B0    call        TBitmap.GetHandleType
 0004E5B5    cmp         al,1
>0004E5B7    jne         0004E5C2
 0004E5B9    mov         eax,ebx
 0004E5BB    mov         edx,dword ptr [eax]
 0004E5BD    call        dword ptr [edx+60]
>0004E5C0    jmp         0004E5E5
 0004E5C2    mov         edx,ebx
 0004E5C4    mov         eax,edi
 0004E5C6    mov         ecx,dword ptr [eax]
 0004E5C8    call        dword ptr [ecx+8]
 0004E5CB    mov         dl,1
 0004E5CD    mov         eax,edi
 0004E5CF    mov         ecx,dword ptr [eax]
 0004E5D1    call        dword ptr [ecx+68]
 0004E5D4    mov         eax,edi
 0004E5D6    mov         edx,dword ptr [eax]
 0004E5D8    call        dword ptr [edx+60]
>0004E5DB    jmp         0004E5E5
 0004E5DD    mov         eax,dword ptr [esi+44]
 0004E5E0    mov         edx,dword ptr [eax]
 0004E5E2    call        dword ptr [edx+60]
 0004E5E5    pop         edi
 0004E5E6    pop         esi
 0004E5E7    pop         ebx
 0004E5E8    ret
*}
end;

//0004E5EC
procedure TCustomImageList.FreeHandle;
begin
{*
 0004E5EC    push        ebx
 0004E5ED    mov         ebx,eax
 0004E5EF    mov         eax,ebx
 0004E5F1    call        TCustomImageList.HandleAllocated
 0004E5F6    test        al,al
>0004E5F8    je          0004E60D
 0004E5FA    cmp         byte ptr [ebx+36],0
>0004E5FE    jne         0004E60D
 0004E600    mov         eax,ebx
 0004E602    call        TCustomImageList.GetHandle
 0004E607    push        eax
 0004E608    call        comctl32.ImageList_Destroy
 0004E60D    xor         eax,eax
 0004E60F    mov         dword ptr [ebx+30],eax
 0004E612    mov         eax,ebx
 0004E614    mov         bx,0FFF0
 0004E618    call        @CallDynaInst
 0004E61D    pop         ebx
 0004E61E    ret
*}
end;

//0004E620
procedure TCustomImageList.CreateImageList;
begin
{*
 0004E620    push        ebp
 0004E621    mov         ebp,esp
 0004E623    push        0
 0004E625    push        ebx
 0004E626    push        esi
 0004E627    push        edi
 0004E628    mov         ebx,eax
 0004E62A    xor         eax,eax
 0004E62C    push        ebp
 0004E62D    push        4E6AF
 0004E632    push        dword ptr fs:[eax]
 0004E635    mov         dword ptr fs:[eax],esp
 0004E638    mov         esi,dword ptr [ebx+2C]
 0004E63B    push        esi
 0004E63C    push        esi
 0004E63D    xor         eax,eax
 0004E63F    mov         al,byte ptr [ebx+35]
 0004E642    mov         eax,dword ptr [eax*4+0B48A4]
 0004E649    or          eax,0FE
 0004E64E    push        eax
 0004E64F    mov         eax,dword ptr [ebx+24]
 0004E652    push        eax
 0004E653    mov         eax,dword ptr [ebx+28]
 0004E656    push        eax
 0004E657    call        comctl32.ImageList_Create
 0004E65C    mov         edi,eax
 0004E65E    mov         dword ptr [ebx+30],edi
 0004E661    test        edi,edi
>0004E663    jne         0004E686
 0004E665    lea         edx,[ebp-4]
 0004E668    mov         eax,[000B5A18];^SInvalidImageList:TResStringRec
 0004E66D    call        LoadResString
 0004E672    mov         ecx,dword ptr [ebp-4]
 0004E675    mov         dl,1
 0004E677    mov         eax,[0001EE64];EInvalidOperation
 0004E67C    call        Exception.Create
 0004E681    call        @RaiseExcept
 0004E686    mov         eax,dword ptr [ebx+38]
 0004E689    cmp         eax,1FFFFFFF
>0004E68E    je          0004E699
 0004E690    mov         edx,eax
 0004E692    mov         eax,ebx
 0004E694    call        TCustomImageList.SetBkColor
 0004E699    xor         eax,eax
 0004E69B    pop         edx
 0004E69C    pop         ecx
 0004E69D    pop         ecx
 0004E69E    mov         dword ptr fs:[eax],edx
 0004E6A1    push        4E6B6
 0004E6A6    lea         eax,[ebp-4]
 0004E6A9    call        @LStrClr
 0004E6AE    ret
>0004E6AF    jmp         @HandleFinally
>0004E6B4    jmp         0004E6A6
 0004E6B6    pop         edi
 0004E6B7    pop         esi
 0004E6B8    pop         ebx
 0004E6B9    pop         ecx
 0004E6BA    pop         ebp
 0004E6BB    ret
*}
end;

//0004E6BC
function TCustomImageList.GetImageBitmap:HBITMAP;
begin
{*
 0004E6BC    push        ebx
 0004E6BD    add         esp,0FFFFFFE0
 0004E6C0    mov         ebx,eax
 0004E6C2    mov         eax,ebx
 0004E6C4    call        TCustomImageList.GetCount
 0004E6C9    test        eax,eax
>0004E6CB    jle         0004E6F0
 0004E6CD    push        esp
 0004E6CE    push        0
 0004E6D0    mov         eax,ebx
 0004E6D2    call        TCustomImageList.GetHandle
 0004E6D7    push        eax
 0004E6D8    call        comctl32.ImageList_GetImageInfo
 0004E6DD    test        eax,eax
>0004E6DF    je          0004E6F0
 0004E6E1    mov         ebx,dword ptr [esp]
 0004E6E4    mov         eax,dword ptr [esp+4]
 0004E6E8    push        eax
 0004E6E9    call        gdi32.DeleteObject
>0004E6EE    jmp         0004E6F2
 0004E6F0    xor         ebx,ebx
 0004E6F2    mov         eax,ebx
 0004E6F4    add         esp,20
 0004E6F7    pop         ebx
 0004E6F8    ret
*}
end;

//0004E6FC
function TCustomImageList.GetMaskBitmap:HBITMAP;
begin
{*
 0004E6FC    push        ebx
 0004E6FD    add         esp,0FFFFFFE0
 0004E700    mov         ebx,eax
 0004E702    mov         eax,ebx
 0004E704    call        TCustomImageList.GetCount
 0004E709    test        eax,eax
>0004E70B    jle         0004E730
 0004E70D    push        esp
 0004E70E    push        0
 0004E710    mov         eax,ebx
 0004E712    call        TCustomImageList.GetHandle
 0004E717    push        eax
 0004E718    call        comctl32.ImageList_GetImageInfo
 0004E71D    test        eax,eax
>0004E71F    je          0004E730
 0004E721    mov         ebx,dword ptr [esp+4]
 0004E725    mov         eax,dword ptr [esp]
 0004E728    push        eax
 0004E729    call        gdi32.DeleteObject
>0004E72E    jmp         0004E732
 0004E730    xor         ebx,ebx
 0004E732    mov         eax,ebx
 0004E734    add         esp,20
 0004E737    pop         ebx
 0004E738    ret
*}
end;

//0004E73C
function TCustomImageList.Add(Image:TBitmap; Mask:TBitmap):Integer;
begin
{*
 0004E73C    push        ebp
 0004E73D    mov         ebp,esp
 0004E73F    add         esp,0FFFFFFF0
 0004E742    push        ebx
 0004E743    push        esi
 0004E744    mov         esi,ecx
 0004E746    mov         ebx,edx
 0004E748    mov         dword ptr [ebp-4],eax
 0004E74B    mov         dl,1
 0004E74D    mov         eax,[00028F70];TBitmap
 0004E752    call        TBitmap.Create
 0004E757    mov         dword ptr [ebp-0C],eax
 0004E75A    xor         eax,eax
 0004E75C    push        ebp
 0004E75D    push        4E7EB
 0004E762    push        dword ptr fs:[eax]
 0004E765    mov         dword ptr fs:[eax],esp
 0004E768    mov         dl,1
 0004E76A    mov         eax,[00028F70];TBitmap
 0004E76F    call        TBitmap.Create
 0004E774    mov         dword ptr [ebp-10],eax
 0004E777    xor         eax,eax
 0004E779    push        ebp
 0004E77A    push        4E7CE
 0004E77F    push        dword ptr fs:[eax]
 0004E782    mov         dword ptr fs:[eax],esp
 0004E785    mov         eax,dword ptr [ebp-4]
 0004E788    call        TCustomImageList.HandleNeeded
 0004E78D    mov         ecx,dword ptr [ebp-10]
 0004E790    mov         edx,esi
 0004E792    mov         eax,dword ptr [ebp-4]
 0004E795    call        TCustomImageList.GetImageHandle
 0004E79A    push        eax
 0004E79B    mov         ecx,dword ptr [ebp-0C]
 0004E79E    mov         edx,ebx
 0004E7A0    mov         eax,dword ptr [ebp-4]
 0004E7A3    call        TCustomImageList.GetImageHandle
 0004E7A8    push        eax
 0004E7A9    mov         eax,dword ptr [ebp-4]
 0004E7AC    mov         eax,dword ptr [eax+30]
 0004E7AF    push        eax
 0004E7B0    call        comctl32.ImageList_Add
 0004E7B5    mov         dword ptr [ebp-8],eax
 0004E7B8    xor         eax,eax
 0004E7BA    pop         edx
 0004E7BB    pop         ecx
 0004E7BC    pop         ecx
 0004E7BD    mov         dword ptr fs:[eax],edx
 0004E7C0    push        4E7D5
 0004E7C5    mov         eax,dword ptr [ebp-10]
 0004E7C8    call        TObject.Free
 0004E7CD    ret
>0004E7CE    jmp         @HandleFinally
>0004E7D3    jmp         0004E7C5
 0004E7D5    xor         eax,eax
 0004E7D7    pop         edx
 0004E7D8    pop         ecx
 0004E7D9    pop         ecx
 0004E7DA    mov         dword ptr fs:[eax],edx
 0004E7DD    push        4E7F2
 0004E7E2    mov         eax,dword ptr [ebp-0C]
 0004E7E5    call        TObject.Free
 0004E7EA    ret
>0004E7EB    jmp         @HandleFinally
>0004E7F0    jmp         0004E7E2
 0004E7F2    mov         eax,dword ptr [ebp-4]
 0004E7F5    mov         bx,0FFF0
 0004E7F9    call        @CallDynaInst
 0004E7FE    mov         eax,dword ptr [ebp-8]
 0004E801    pop         esi
 0004E802    pop         ebx
 0004E803    mov         esp,ebp
 0004E805    pop         ebp
 0004E806    ret
*}
end;

//0004E808
function TCustomImageList.AddMasked(Image:TBitmap; MaskColor:TColor):Integer;
begin
{*
 0004E808    push        ebp
 0004E809    mov         ebp,esp
 0004E80B    add         esp,0FFFFFFF0
 0004E80E    push        ebx
 0004E80F    push        esi
 0004E810    mov         esi,ecx
 0004E812    mov         ebx,edx
 0004E814    mov         dword ptr [ebp-4],eax
 0004E817    mov         dl,1
 0004E819    mov         eax,[00028F70];TBitmap
 0004E81E    call        TBitmap.Create
 0004E823    mov         dword ptr [ebp-0C],eax
 0004E826    xor         eax,eax
 0004E828    push        ebp
 0004E829    push        4E907
 0004E82E    push        dword ptr fs:[eax]
 0004E831    mov         dword ptr fs:[eax],esp
 0004E834    mov         eax,dword ptr [ebp-4]
 0004E837    cmp         byte ptr [eax+35],0
>0004E83B    je          0004E8D0
 0004E841    cmp         esi,0FFFFFFFF
>0004E844    je          0004E8D0
 0004E84A    mov         dl,1
 0004E84C    mov         eax,[00028F70];TBitmap
 0004E851    call        TBitmap.Create
 0004E856    mov         dword ptr [ebp-10],eax
 0004E859    xor         eax,eax
 0004E85B    push        ebp
 0004E85C    push        4E8C9
 0004E861    push        dword ptr fs:[eax]
 0004E864    mov         dword ptr fs:[eax],esp
 0004E867    mov         edx,ebx
 0004E869    mov         eax,dword ptr [ebp-10]
 0004E86C    mov         ecx,dword ptr [eax]
 0004E86E    call        dword ptr [ecx+8]
 0004E871    mov         edx,esi
 0004E873    mov         eax,dword ptr [ebp-10]
 0004E876    call        TBitmap.SetTransparentColor
 0004E87B    mov         eax,dword ptr [ebp-4]
 0004E87E    call        TCustomImageList.HandleNeeded
 0004E883    mov         eax,dword ptr [ebp-10]
 0004E886    mov         edx,dword ptr [eax]
 0004E888    call        dword ptr [edx+64]
 0004E88B    mov         edx,eax
 0004E88D    mov         eax,dword ptr [ebp-4]
 0004E890    call        TCustomImageList.GetBitmapHandle
 0004E895    push        eax
 0004E896    mov         ecx,dword ptr [ebp-0C]
 0004E899    mov         edx,ebx
 0004E89B    mov         eax,dword ptr [ebp-4]
 0004E89E    call        TCustomImageList.GetImageHandle
 0004E8A3    push        eax
 0004E8A4    mov         eax,dword ptr [ebp-4]
 0004E8A7    mov         eax,dword ptr [eax+30]
 0004E8AA    push        eax
 0004E8AB    call        comctl32.ImageList_Add
 0004E8B0    mov         dword ptr [ebp-8],eax
 0004E8B3    xor         eax,eax
 0004E8B5    pop         edx
 0004E8B6    pop         ecx
 0004E8B7    pop         ecx
 0004E8B8    mov         dword ptr fs:[eax],edx
 0004E8BB    push        4E8F1
 0004E8C0    mov         eax,dword ptr [ebp-10]
 0004E8C3    call        TObject.Free
 0004E8C8    ret
>0004E8C9    jmp         @HandleFinally
>0004E8CE    jmp         0004E8C0
 0004E8D0    push        0
 0004E8D2    mov         ecx,dword ptr [ebp-0C]
 0004E8D5    mov         edx,ebx
 0004E8D7    mov         eax,dword ptr [ebp-4]
 0004E8DA    call        TCustomImageList.GetImageHandle
 0004E8DF    push        eax
 0004E8E0    mov         eax,dword ptr [ebp-4]
 0004E8E3    call        TCustomImageList.GetHandle
 0004E8E8    push        eax
 0004E8E9    call        comctl32.ImageList_Add
 0004E8EE    mov         dword ptr [ebp-8],eax
 0004E8F1    xor         eax,eax
 0004E8F3    pop         edx
 0004E8F4    pop         ecx
 0004E8F5    pop         ecx
 0004E8F6    mov         dword ptr fs:[eax],edx
 0004E8F9    push        4E90E
 0004E8FE    mov         eax,dword ptr [ebp-0C]
 0004E901    call        TObject.Free
 0004E906    ret
>0004E907    jmp         @HandleFinally
>0004E90C    jmp         0004E8FE
 0004E90E    mov         eax,dword ptr [ebp-4]
 0004E911    mov         bx,0FFF0
 0004E915    call        @CallDynaInst
 0004E91A    mov         eax,dword ptr [ebp-8]
 0004E91D    pop         esi
 0004E91E    pop         ebx
 0004E91F    mov         esp,ebp
 0004E921    pop         ebp
 0004E922    ret
*}
end;

//0004E924
function TCustomImageList.GetCount:Integer;
begin
{*
 0004E924    push        ebx
 0004E925    mov         ebx,eax
 0004E927    mov         eax,ebx
 0004E929    call        TCustomImageList.HandleAllocated
 0004E92E    test        al,al
>0004E930    je          0004E941
 0004E932    mov         eax,ebx
 0004E934    call        TCustomImageList.GetHandle
 0004E939    push        eax
 0004E93A    call        comctl32.ImageList_GetImageCount
 0004E93F    pop         ebx
 0004E940    ret
 0004E941    xor         eax,eax
 0004E943    pop         ebx
 0004E944    ret
*}
end;

//0004E948
procedure TCustomImageList.ReplaceMasked(Index:Integer; NewImage:TBitmap; MaskColor:TColor);
begin
{*
 0004E948    push        ebp
 0004E949    mov         ebp,esp
 0004E94B    add         esp,0FFFFFFEC
 0004E94E    push        ebx
 0004E94F    push        esi
 0004E950    xor         ebx,ebx
 0004E952    mov         dword ptr [ebp-14],ebx
 0004E955    mov         esi,ecx
 0004E957    mov         ebx,edx
 0004E959    mov         dword ptr [ebp-4],eax
 0004E95C    xor         eax,eax
 0004E95E    push        ebp
 0004E95F    push        4EB57
 0004E964    push        dword ptr fs:[eax]
 0004E967    mov         dword ptr fs:[eax],esp
 0004E96A    mov         eax,dword ptr [ebp-4]
 0004E96D    call        TCustomImageList.HandleAllocated
 0004E972    test        al,al
>0004E974    je          0004EB35
 0004E97A    mov         edx,esi
 0004E97C    mov         eax,dword ptr [ebp-4]
 0004E97F    call        TCustomImageList.CheckImage
 0004E984    mov         ecx,dword ptr [ebp+8]
 0004E987    mov         edx,esi
 0004E989    mov         eax,dword ptr [ebp-4]
 0004E98C    call        TCustomImageList.AddMasked
 0004E991    mov         dword ptr [ebp-8],eax
 0004E994    cmp         dword ptr [ebp-8],0FFFFFFFF
>0004E998    je          0004EB14
 0004E99E    xor         eax,eax
 0004E9A0    push        ebp
 0004E9A1    push        4EB0D
 0004E9A6    push        dword ptr fs:[eax]
 0004E9A9    mov         dword ptr fs:[eax],esp
 0004E9AC    mov         dl,1
 0004E9AE    mov         eax,[00028F70];TBitmap
 0004E9B3    call        TBitmap.Create
 0004E9B8    mov         dword ptr [ebp-0C],eax
 0004E9BB    xor         eax,eax
 0004E9BD    push        ebp
 0004E9BE    push        4EAED
 0004E9C3    push        dword ptr fs:[eax]
 0004E9C6    mov         dword ptr fs:[eax],esp
 0004E9C9    mov         eax,dword ptr [ebp-4]
 0004E9CC    mov         edx,dword ptr [eax+24]
 0004E9CF    mov         eax,dword ptr [ebp-0C]
 0004E9D2    mov         ecx,dword ptr [eax]
 0004E9D4    call        dword ptr [ecx+34]
 0004E9D7    mov         eax,dword ptr [ebp-4]
 0004E9DA    mov         edx,dword ptr [eax+28]
 0004E9DD    mov         eax,dword ptr [ebp-0C]
 0004E9E0    mov         ecx,dword ptr [eax]
 0004E9E2    call        dword ptr [ecx+40]
 0004E9E5    mov         dl,1
 0004E9E7    mov         eax,[00028F70];TBitmap
 0004E9EC    call        TBitmap.Create
 0004E9F1    mov         dword ptr [ebp-10],eax
 0004E9F4    xor         eax,eax
 0004E9F6    push        ebp
 0004E9F7    push        4EAD0
 0004E9FC    push        dword ptr fs:[eax]
 0004E9FF    mov         dword ptr fs:[eax],esp
 0004EA02    mov         dl,1
 0004EA04    mov         eax,dword ptr [ebp-10]
 0004EA07    call        TBitmap.SetMonochrome
 0004EA0C    mov         eax,dword ptr [ebp-4]
 0004EA0F    mov         edx,dword ptr [eax+24]
 0004EA12    mov         eax,dword ptr [ebp-10]
 0004EA15    mov         ecx,dword ptr [eax]
 0004EA17    call        dword ptr [ecx+34]
 0004EA1A    mov         eax,dword ptr [ebp-4]
 0004EA1D    mov         edx,dword ptr [eax+28]
 0004EA20    mov         eax,dword ptr [ebp-10]
 0004EA23    mov         ecx,dword ptr [eax]
 0004EA25    call        dword ptr [ecx+40]
 0004EA28    push        0
 0004EA2A    push        0
 0004EA2C    push        0
 0004EA2E    mov         eax,dword ptr [ebp-0C]
 0004EA31    call        TBitmap.GetCanvas
 0004EA36    call        TCanvas.GetHandle
 0004EA3B    push        eax
 0004EA3C    mov         eax,dword ptr [ebp-8]
 0004EA3F    push        eax
 0004EA40    mov         eax,dword ptr [ebp-4]
 0004EA43    call        TCustomImageList.GetHandle
 0004EA48    push        eax
 0004EA49    call        comctl32.ImageList_Draw
 0004EA4E    push        10
 0004EA50    push        0
 0004EA52    push        0
 0004EA54    mov         eax,dword ptr [ebp-10]
 0004EA57    call        TBitmap.GetCanvas
 0004EA5C    call        TCanvas.GetHandle
 0004EA61    push        eax
 0004EA62    mov         eax,dword ptr [ebp-8]
 0004EA65    push        eax
 0004EA66    mov         eax,dword ptr [ebp-4]
 0004EA69    call        TCustomImageList.GetHandle
 0004EA6E    push        eax
 0004EA6F    call        comctl32.ImageList_Draw
 0004EA74    mov         eax,dword ptr [ebp-10]
 0004EA77    mov         edx,dword ptr [eax]
 0004EA79    call        dword ptr [edx+60]
 0004EA7C    push        eax
 0004EA7D    mov         eax,dword ptr [ebp-0C]
 0004EA80    mov         edx,dword ptr [eax]
 0004EA82    call        dword ptr [edx+60]
 0004EA85    push        eax
 0004EA86    push        ebx
 0004EA87    mov         eax,dword ptr [ebp-4]
 0004EA8A    call        TCustomImageList.GetHandle
 0004EA8F    push        eax
 0004EA90    call        comctl32.ImageList_Replace
 0004EA95    test        eax,eax
>0004EA97    jne         0004EABA
 0004EA99    lea         edx,[ebp-14]
 0004EA9C    mov         eax,[000B5738];^SReplaceImage:TResStringRec
 0004EAA1    call        LoadResString
 0004EAA6    mov         ecx,dword ptr [ebp-14]
 0004EAA9    mov         dl,1
 0004EAAB    mov         eax,[0001EE64];EInvalidOperation
 0004EAB0    call        Exception.Create
 0004EAB5    call        @RaiseExcept
 0004EABA    xor         eax,eax
 0004EABC    pop         edx
 0004EABD    pop         ecx
 0004EABE    pop         ecx
 0004EABF    mov         dword ptr fs:[eax],edx
 0004EAC2    push        4EAD7
 0004EAC7    mov         eax,dword ptr [ebp-10]
 0004EACA    call        TObject.Free
 0004EACF    ret
>0004EAD0    jmp         @HandleFinally
>0004EAD5    jmp         0004EAC7
 0004EAD7    xor         eax,eax
 0004EAD9    pop         edx
 0004EADA    pop         ecx
 0004EADB    pop         ecx
 0004EADC    mov         dword ptr fs:[eax],edx
 0004EADF    push        4EAF4
 0004EAE4    mov         eax,dword ptr [ebp-0C]
 0004EAE7    call        TObject.Free
 0004EAEC    ret
>0004EAED    jmp         @HandleFinally
>0004EAF2    jmp         0004EAE4
 0004EAF4    xor         eax,eax
 0004EAF6    pop         edx
 0004EAF7    pop         ecx
 0004EAF8    pop         ecx
 0004EAF9    mov         dword ptr fs:[eax],edx
 0004EAFC    push        4EB35
 0004EB01    mov         edx,dword ptr [ebp-8]
 0004EB04    mov         eax,dword ptr [ebp-4]
 0004EB07    call        TCustomImageList.Delete
 0004EB0C    ret
>0004EB0D    jmp         @HandleFinally
>0004EB12    jmp         0004EB01
 0004EB14    lea         edx,[ebp-14]
 0004EB17    mov         eax,[000B5738];^SReplaceImage:TResStringRec
 0004EB1C    call        LoadResString
 0004EB21    mov         ecx,dword ptr [ebp-14]
 0004EB24    mov         dl,1
 0004EB26    mov         eax,[0001EE64];EInvalidOperation
 0004EB2B    call        Exception.Create
 0004EB30    call        @RaiseExcept
 0004EB35    mov         eax,dword ptr [ebp-4]
 0004EB38    mov         bx,0FFF0
 0004EB3C    call        @CallDynaInst
 0004EB41    xor         eax,eax
 0004EB43    pop         edx
 0004EB44    pop         ecx
 0004EB45    pop         ecx
 0004EB46    mov         dword ptr fs:[eax],edx
 0004EB49    push        4EB5E
 0004EB4E    lea         eax,[ebp-14]
 0004EB51    call        @LStrClr
 0004EB56    ret
>0004EB57    jmp         @HandleFinally
>0004EB5C    jmp         0004EB4E
 0004EB5E    pop         esi
 0004EB5F    pop         ebx
 0004EB60    mov         esp,ebp
 0004EB62    pop         ebp
 0004EB63    ret         4
*}
end;

//0004EB68
procedure TCustomImageList.Delete(Index:Integer);
begin
{*
 0004EB68    push        ebp
 0004EB69    mov         ebp,esp
 0004EB6B    push        0
 0004EB6D    push        ebx
 0004EB6E    push        esi
 0004EB6F    mov         esi,edx
 0004EB71    mov         ebx,eax
 0004EB73    xor         eax,eax
 0004EB75    push        ebp
 0004EB76    push        4EBE7
 0004EB7B    push        dword ptr fs:[eax]
 0004EB7E    mov         dword ptr fs:[eax],esp
 0004EB81    mov         eax,ebx
 0004EB83    call        TCustomImageList.GetCount
 0004EB88    cmp         esi,eax
>0004EB8A    jl          0004EBAD
 0004EB8C    lea         edx,[ebp-4]
 0004EB8F    mov         eax,[000B57CC];^SImageIndexError:TResStringRec
 0004EB94    call        LoadResString
 0004EB99    mov         ecx,dword ptr [ebp-4]
 0004EB9C    mov         dl,1
 0004EB9E    mov         eax,[0001EE64];EInvalidOperation
 0004EBA3    call        Exception.Create
 0004EBA8    call        @RaiseExcept
 0004EBAD    mov         eax,ebx
 0004EBAF    call        TCustomImageList.HandleAllocated
 0004EBB4    test        al,al
>0004EBB6    je          0004EBC6
 0004EBB8    push        esi
 0004EBB9    mov         eax,ebx
 0004EBBB    call        TCustomImageList.GetHandle
 0004EBC0    push        eax
 0004EBC1    call        comctl32.ImageList_Remove
 0004EBC6    mov         eax,ebx
 0004EBC8    mov         bx,0FFF0
 0004EBCC    call        @CallDynaInst
 0004EBD1    xor         eax,eax
 0004EBD3    pop         edx
 0004EBD4    pop         ecx
 0004EBD5    pop         ecx
 0004EBD6    mov         dword ptr fs:[eax],edx
 0004EBD9    push        4EBEE
 0004EBDE    lea         eax,[ebp-4]
 0004EBE1    call        @LStrClr
 0004EBE6    ret
>0004EBE7    jmp         @HandleFinally
>0004EBEC    jmp         0004EBDE
 0004EBEE    pop         esi
 0004EBEF    pop         ebx
 0004EBF0    pop         ecx
 0004EBF1    pop         ebp
 0004EBF2    ret
*}
end;

//0004EBF4
procedure TCustomImageList.Clear;
begin
{*
 0004EBF4    or          edx,0FFFFFFFF
 0004EBF7    call        TCustomImageList.Delete
 0004EBFC    ret
*}
end;

//0004EC00
procedure TCustomImageList.SetBkColor(Value:TColor);
begin
{*
 0004EC00    push        ebx
 0004EC01    push        esi
 0004EC02    mov         esi,edx
 0004EC04    mov         ebx,eax
 0004EC06    mov         eax,ebx
 0004EC08    call        TCustomImageList.HandleAllocated
 0004EC0D    test        al,al
>0004EC0F    je          0004EC24
 0004EC11    mov         eax,esi
 0004EC13    call        GetRGBColor
 0004EC18    push        eax
 0004EC19    mov         eax,dword ptr [ebx+30]
 0004EC1C    push        eax
 0004EC1D    call        comctl32.ImageList_SetBkColor
>0004EC22    jmp         0004EC27
 0004EC24    mov         dword ptr [ebx+38],esi
 0004EC27    mov         eax,ebx
 0004EC29    mov         bx,0FFF0
 0004EC2D    call        @CallDynaInst
 0004EC32    pop         esi
 0004EC33    pop         ebx
 0004EC34    ret
*}
end;

//0004EC38
function TCustomImageList.GetBkColor:TColor;
begin
{*
 0004EC38    push        ebx
 0004EC39    mov         ebx,eax
 0004EC3B    mov         eax,ebx
 0004EC3D    call        TCustomImageList.HandleAllocated
 0004EC42    test        al,al
>0004EC44    je          0004EC5A
 0004EC46    mov         eax,ebx
 0004EC48    call        TCustomImageList.GetHandle
 0004EC4D    push        eax
 0004EC4E    call        comctl32.ImageList_GetBkColor
 0004EC53    call        GetColor
 0004EC58    pop         ebx
 0004EC59    ret
 0004EC5A    mov         eax,dword ptr [ebx+38]
 0004EC5D    pop         ebx
 0004EC5E    ret
*}
end;

//0004EC60
{*procedure sub_0004EC60(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0004EC60    push        ebp
 0004EC61    mov         ebp,esp
 0004EC63    add         esp,0FFFFFFD8
 0004EC66    push        ebx
 0004EC67    push        esi
 0004EC68    push        edi
 0004EC69    mov         edi,ecx
 0004EC6B    mov         dword ptr [ebp-4],edx
 0004EC6E    mov         ebx,eax
 0004EC70    mov         eax,ebx
 0004EC72    call        TCustomImageList.HandleAllocated
 0004EC77    test        al,al
>0004EC79    je          0004EE2E
 0004EC7F    cmp         byte ptr [ebp+8],0
>0004EC83    je          0004ECC9
 0004EC85    mov         eax,dword ptr [ebp+0C]
 0004EC88    push        eax
 0004EC89    mov         eax,dword ptr [ebx+3C];TCustomImageList.FBlendColor:TColor
 0004EC8C    call        GetRGBColor
 0004EC91    push        eax
 0004EC92    mov         eax,ebx
 0004EC94    call        TCustomImageList.GetBkColor
 0004EC99    call        GetRGBColor
 0004EC9E    push        eax
 0004EC9F    push        0
 0004ECA1    push        0
 0004ECA3    mov         eax,dword ptr [ebp+10]
 0004ECA6    push        eax
 0004ECA7    mov         eax,dword ptr [ebp+14]
 0004ECAA    push        eax
 0004ECAB    mov         eax,edi
 0004ECAD    call        TCanvas.GetHandle
 0004ECB2    push        eax
 0004ECB3    mov         eax,dword ptr [ebp-4]
 0004ECB6    push        eax
 0004ECB7    mov         eax,ebx
 0004ECB9    call        TCustomImageList.GetHandle
 0004ECBE    push        eax
 0004ECBF    call        comctl32.ImageList_DrawEx
>0004ECC4    jmp         0004EE2E
 0004ECC9    cmp         dword ptr [ebx+48],0;TCustomImageList.FMonoBitmap:TBitmap
>0004ECCD    jne         0004ECFD
 0004ECCF    mov         dl,1
 0004ECD1    mov         eax,[00028F70];TBitmap
 0004ECD6    call        TBitmap.Create;TBitmap.Create
 0004ECDB    mov         esi,eax
 0004ECDD    mov         dword ptr [ebx+48],esi;TCustomImageList.FMonoBitmap:TBitmap
 0004ECE0    mov         dl,1
 0004ECE2    mov         eax,esi
 0004ECE4    call        TBitmap.SetMonochrome
 0004ECE9    mov         edx,dword ptr [ebx+28];TCustomImageList.FWidth:Integer
 0004ECEC    mov         eax,esi
 0004ECEE    mov         ecx,dword ptr [eax]
 0004ECF0    call        dword ptr [ecx+40];TBitmap.SetWidth
 0004ECF3    mov         edx,dword ptr [ebx+24];TCustomImageList.FHeight:Integer
 0004ECF6    mov         eax,esi
 0004ECF8    mov         ecx,dword ptr [eax]
 0004ECFA    call        dword ptr [ecx+34];TBitmap.SetHeight
 0004ECFD    mov         eax,dword ptr [ebx+48];TCustomImageList.FMonoBitmap:TBitmap
 0004ED00    call        TBitmap.GetCanvas
 0004ED05    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0004ED08    mov         edx,0FFFFFF
 0004ED0D    call        TBrush.SetColor
 0004ED12    mov         eax,dword ptr [ebx+24];TCustomImageList.FHeight:Integer
 0004ED15    push        eax
 0004ED16    lea         eax,[ebp-28]
 0004ED19    push        eax
 0004ED1A    mov         ecx,dword ptr [ebx+28];TCustomImageList.FWidth:Integer
 0004ED1D    xor         edx,edx
 0004ED1F    xor         eax,eax
 0004ED21    call        Rect
 0004ED26    lea         eax,[ebp-28]
 0004ED29    push        eax
 0004ED2A    mov         eax,dword ptr [ebx+48];TCustomImageList.FMonoBitmap:TBitmap
 0004ED2D    call        TBitmap.GetCanvas
 0004ED32    pop         edx
 0004ED33    call        TCanvas.FillRect
 0004ED38    push        0
 0004ED3A    push        0
 0004ED3C    push        0FF000000
 0004ED41    push        0
 0004ED43    push        0
 0004ED45    push        0
 0004ED47    push        0
 0004ED49    mov         eax,dword ptr [ebx+48];TCustomImageList.FMonoBitmap:TBitmap
 0004ED4C    call        TBitmap.GetCanvas
 0004ED51    call        TCanvas.GetHandle
 0004ED56    push        eax
 0004ED57    mov         eax,dword ptr [ebp-4]
 0004ED5A    push        eax
 0004ED5B    mov         eax,ebx
 0004ED5D    call        TCustomImageList.GetHandle
 0004ED62    push        eax
 0004ED63    call        comctl32.ImageList_DrawEx
 0004ED68    mov         eax,dword ptr [ebp+10]
 0004ED6B    add         eax,dword ptr [ebx+24];TCustomImageList.FHeight:Integer
 0004ED6E    push        eax
 0004ED6F    lea         eax,[ebp-18]
 0004ED72    push        eax
 0004ED73    mov         ecx,dword ptr [ebp+14]
 0004ED76    add         ecx,dword ptr [ebx+28];TCustomImageList.FWidth:Integer
 0004ED79    mov         edx,dword ptr [ebp+10]
 0004ED7C    mov         eax,dword ptr [ebp+14]
 0004ED7F    call        Rect
 0004ED84    mov         eax,dword ptr [ebx+48];TCustomImageList.FMonoBitmap:TBitmap
 0004ED87    call        TBitmap.GetCanvas
 0004ED8C    call        TCanvas.GetHandle
 0004ED91    mov         dword ptr [ebp-8],eax
 0004ED94    mov         eax,dword ptr [edi+14]
 0004ED97    mov         edx,80000014
 0004ED9C    call        TBrush.SetColor
 0004EDA1    mov         eax,edi
 0004EDA3    call        TCanvas.GetHandle
 0004EDA8    mov         esi,eax
 0004EDAA    push        0FFFFFF
 0004EDAF    push        esi
 0004EDB0    call        gdi32.SetTextColor
 0004EDB5    push        0
 0004EDB7    push        esi
 0004EDB8    call        gdi32.SetBkColor
 0004EDBD    push        0E20746
 0004EDC2    push        0
 0004EDC4    push        0
 0004EDC6    mov         eax,dword ptr [ebp-8]
 0004EDC9    push        eax
 0004EDCA    mov         eax,dword ptr [ebx+24];TCustomImageList.FHeight:Integer
 0004EDCD    push        eax
 0004EDCE    mov         eax,dword ptr [ebx+28];TCustomImageList.FWidth:Integer
 0004EDD1    push        eax
 0004EDD2    mov         eax,dword ptr [ebp+10]
 0004EDD5    inc         eax
 0004EDD6    push        eax
 0004EDD7    mov         eax,dword ptr [ebp+14]
 0004EDDA    inc         eax
 0004EDDB    push        eax
 0004EDDC    push        esi
 0004EDDD    call        gdi32.BitBlt
 0004EDE2    mov         eax,dword ptr [edi+14]
 0004EDE5    mov         edx,80000010
 0004EDEA    call        TBrush.SetColor
 0004EDEF    mov         eax,edi
 0004EDF1    call        TCanvas.GetHandle
 0004EDF6    mov         esi,eax
 0004EDF8    push        0FFFFFF
 0004EDFD    push        esi
 0004EDFE    call        gdi32.SetTextColor
 0004EE03    push        0
 0004EE05    push        esi
 0004EE06    call        gdi32.SetBkColor
 0004EE0B    push        0E20746
 0004EE10    push        0
 0004EE12    push        0
 0004EE14    mov         eax,dword ptr [ebp-8]
 0004EE17    push        eax
 0004EE18    mov         eax,dword ptr [ebx+24];TCustomImageList.FHeight:Integer
 0004EE1B    push        eax
 0004EE1C    mov         eax,dword ptr [ebx+28];TCustomImageList.FWidth:Integer
 0004EE1F    push        eax
 0004EE20    mov         eax,dword ptr [ebp+10]
 0004EE23    push        eax
 0004EE24    mov         eax,dword ptr [ebp+14]
 0004EE27    push        eax
 0004EE28    push        esi
 0004EE29    call        gdi32.BitBlt
 0004EE2E    pop         edi
 0004EE2F    pop         esi
 0004EE30    pop         ebx
 0004EE31    mov         esp,ebp
 0004EE33    pop         ebp
 0004EE34    ret         10
end;*}

//0004EE38
procedure TCustomImageList.Draw(Canvas:TCanvas; X:Integer; Y:Integer; Index:Integer; Enabled:Boolean);
begin
{*
 0004EE38    push        ebp
 0004EE39    mov         ebp,esp
 0004EE3B    push        ebx
 0004EE3C    push        esi
 0004EE3D    push        edi
 0004EE3E    mov         edi,ecx
 0004EE40    mov         esi,edx
 0004EE42    mov         ebx,eax
 0004EE44    mov         eax,ebx
 0004EE46    call        TCustomImageList.HandleAllocated
 0004EE4B    test        al,al
>0004EE4D    je          0004EE7D
 0004EE4F    push        edi
 0004EE50    mov         eax,dword ptr [ebp+10]
 0004EE53    push        eax
 0004EE54    xor         eax,eax
 0004EE56    mov         al,byte ptr [ebx+34]
 0004EE59    mov         eax,dword ptr [eax*4+0B48AC]
 0004EE60    xor         edx,edx
 0004EE62    mov         dl,byte ptr [ebx+37]
 0004EE65    or          eax,dword ptr [edx*4+0B48BC]
 0004EE6C    push        eax
 0004EE6D    mov         al,byte ptr [ebp+8]
 0004EE70    push        eax
 0004EE71    mov         ecx,esi
 0004EE73    mov         edx,dword ptr [ebp+0C]
 0004EE76    mov         eax,ebx
 0004EE78    mov         ebx,dword ptr [eax]
 0004EE7A    call        dword ptr [ebx+30]
 0004EE7D    pop         edi
 0004EE7E    pop         esi
 0004EE7F    pop         ebx
 0004EE80    pop         ebp
 0004EE81    ret         0C
*}
end;

//0004EE84
procedure TCustomImageList.CopyImages(Value:HIMAGELIST);
begin
{*
 0004EE84    push        ebp
 0004EE85    mov         ebp,esp
 0004EE87    add         esp,0FFFFFFE0
 0004EE8A    push        ebx
 0004EE8B    push        esi
 0004EE8C    push        edi
 0004EE8D    mov         dword ptr [ebp-8],edx
 0004EE90    mov         dword ptr [ebp-4],eax
 0004EE93    mov         eax,dword ptr [ebp-4]
 0004EE96    mov         eax,dword ptr [eax+24]
 0004EE99    push        eax
 0004EE9A    lea         eax,[ebp-20]
 0004EE9D    push        eax
 0004EE9E    mov         eax,dword ptr [ebp-4]
 0004EEA1    mov         ecx,dword ptr [eax+28]
 0004EEA4    xor         edx,edx
 0004EEA6    xor         eax,eax
 0004EEA8    call        Rect
 0004EEAD    mov         eax,dword ptr [ebp-4]
 0004EEB0    call        TCustomImageList.BeginUpdate
 0004EEB5    xor         eax,eax
 0004EEB7    push        ebp
 0004EEB8    push        4F00C
 0004EEBD    push        dword ptr fs:[eax]
 0004EEC0    mov         dword ptr fs:[eax],esp
 0004EEC3    mov         dl,1
 0004EEC5    mov         eax,[00028F70];TBitmap
 0004EECA    call        TBitmap.Create
 0004EECF    mov         dword ptr [ebp-0C],eax
 0004EED2    xor         eax,eax
 0004EED4    push        ebp
 0004EED5    push        4EFEF
 0004EEDA    push        dword ptr fs:[eax]
 0004EEDD    mov         dword ptr fs:[eax],esp
 0004EEE0    mov         eax,dword ptr [ebp-4]
 0004EEE3    mov         edx,dword ptr [eax+24]
 0004EEE6    mov         eax,dword ptr [ebp-0C]
 0004EEE9    mov         ecx,dword ptr [eax]
 0004EEEB    call        dword ptr [ecx+34]
 0004EEEE    mov         eax,dword ptr [ebp-4]
 0004EEF1    mov         edx,dword ptr [eax+28]
 0004EEF4    mov         eax,dword ptr [ebp-0C]
 0004EEF7    mov         ecx,dword ptr [eax]
 0004EEF9    call        dword ptr [ecx+40]
 0004EEFC    mov         dl,1
 0004EEFE    mov         eax,[00028F70];TBitmap
 0004EF03    call        TBitmap.Create
 0004EF08    mov         dword ptr [ebp-10],eax
 0004EF0B    xor         eax,eax
 0004EF0D    push        ebp
 0004EF0E    push        4EFD2
 0004EF13    push        dword ptr fs:[eax]
 0004EF16    mov         dword ptr fs:[eax],esp
 0004EF19    mov         dl,1
 0004EF1B    mov         eax,dword ptr [ebp-10]
 0004EF1E    call        TBitmap.SetMonochrome
 0004EF23    mov         eax,dword ptr [ebp-4]
 0004EF26    mov         edx,dword ptr [eax+24]
 0004EF29    mov         eax,dword ptr [ebp-10]
 0004EF2C    mov         ecx,dword ptr [eax]
 0004EF2E    call        dword ptr [ecx+34]
 0004EF31    mov         eax,dword ptr [ebp-4]
 0004EF34    mov         edx,dword ptr [eax+28]
 0004EF37    mov         eax,dword ptr [ebp-10]
 0004EF3A    mov         ecx,dword ptr [eax]
 0004EF3C    call        dword ptr [ecx+40]
 0004EF3F    mov         eax,dword ptr [ebp-8]
 0004EF42    push        eax
 0004EF43    call        comctl32.ImageList_GetImageCount
 0004EF48    mov         esi,eax
 0004EF4A    dec         esi
 0004EF4B    test        esi,esi
>0004EF4D    jl          0004EFBC
 0004EF4F    inc         esi
 0004EF50    xor         ebx,ebx
 0004EF52    mov         eax,dword ptr [ebp-0C]
 0004EF55    call        TBitmap.GetCanvas
 0004EF5A    mov         edi,eax
 0004EF5C    lea         edx,[ebp-20]
 0004EF5F    mov         eax,edi
 0004EF61    call        TCanvas.FillRect
 0004EF66    push        0
 0004EF68    push        0
 0004EF6A    push        0
 0004EF6C    mov         eax,edi
 0004EF6E    call        TCanvas.GetHandle
 0004EF73    push        eax
 0004EF74    push        ebx
 0004EF75    mov         eax,dword ptr [ebp-8]
 0004EF78    push        eax
 0004EF79    call        comctl32.ImageList_Draw
 0004EF7E    mov         eax,dword ptr [ebp-10]
 0004EF81    call        TBitmap.GetCanvas
 0004EF86    mov         edi,eax
 0004EF88    lea         edx,[ebp-20]
 0004EF8B    mov         eax,edi
 0004EF8D    call        TCanvas.FillRect
 0004EF92    push        10
 0004EF94    push        0
 0004EF96    push        0
 0004EF98    mov         eax,edi
 0004EF9A    call        TCanvas.GetHandle
 0004EF9F    push        eax
 0004EFA0    push        ebx
 0004EFA1    mov         eax,dword ptr [ebp-8]
 0004EFA4    push        eax
 0004EFA5    call        comctl32.ImageList_Draw
 0004EFAA    mov         ecx,dword ptr [ebp-10]
 0004EFAD    mov         edx,dword ptr [ebp-0C]
 0004EFB0    mov         eax,dword ptr [ebp-4]
 0004EFB3    call        TCustomImageList.Add
 0004EFB8    inc         ebx
 0004EFB9    dec         esi
>0004EFBA    jne         0004EF52
 0004EFBC    xor         eax,eax
 0004EFBE    pop         edx
 0004EFBF    pop         ecx
 0004EFC0    pop         ecx
 0004EFC1    mov         dword ptr fs:[eax],edx
 0004EFC4    push        4EFD9
 0004EFC9    mov         eax,dword ptr [ebp-10]
 0004EFCC    call        TObject.Free
 0004EFD1    ret
>0004EFD2    jmp         @HandleFinally
>0004EFD7    jmp         0004EFC9
 0004EFD9    xor         eax,eax
 0004EFDB    pop         edx
 0004EFDC    pop         ecx
 0004EFDD    pop         ecx
 0004EFDE    mov         dword ptr fs:[eax],edx
 0004EFE1    push        4EFF6
 0004EFE6    mov         eax,dword ptr [ebp-0C]
 0004EFE9    call        TObject.Free
 0004EFEE    ret
>0004EFEF    jmp         @HandleFinally
>0004EFF4    jmp         0004EFE6
 0004EFF6    xor         eax,eax
 0004EFF8    pop         edx
 0004EFF9    pop         ecx
 0004EFFA    pop         ecx
 0004EFFB    mov         dword ptr fs:[eax],edx
 0004EFFE    push        4F013
 0004F003    mov         eax,dword ptr [ebp-4]
 0004F006    call        TCustomImageList.EndUpdate
 0004F00B    ret
>0004F00C    jmp         @HandleFinally
>0004F011    jmp         0004F003
 0004F013    pop         edi
 0004F014    pop         esi
 0004F015    pop         ebx
 0004F016    mov         esp,ebp
 0004F018    pop         ebp
 0004F019    ret
*}
end;

//0004F01C
procedure TCustomImageList.AddImages(Value:TCustomImageList);
begin
{*
 0004F01C    push        ebx
 0004F01D    push        esi
 0004F01E    mov         esi,edx
 0004F020    mov         ebx,eax
 0004F022    test        esi,esi
>0004F024    je          0004F036
 0004F026    mov         eax,esi
 0004F028    call        TCustomImageList.GetHandle
 0004F02D    mov         edx,eax
 0004F02F    mov         eax,ebx
 0004F031    call        TCustomImageList.CopyImages
 0004F036    pop         esi
 0004F037    pop         ebx
 0004F038    ret
*}
end;

//0004F03C
procedure TCustomImageList.Assign(Source:TPersistent);
begin
{*
 0004F03C    push        ebx
 0004F03D    push        esi
 0004F03E    mov         esi,edx
 0004F040    mov         ebx,eax
 0004F042    test        esi,esi
>0004F044    jne         0004F050
 0004F046    mov         eax,ebx
 0004F048    call        TCustomImageList.FreeHandle
 0004F04D    pop         esi
 0004F04E    pop         ebx
 0004F04F    ret
 0004F050    mov         eax,esi
 0004F052    mov         edx,dword ptr ds:[4E0E0];TCustomImageList
 0004F058    call        @IsClass
 0004F05D    test        al,al
>0004F05F    je          0004F0ED
 0004F065    mov         eax,ebx
 0004F067    call        TCustomImageList.Clear
 0004F06C    mov         al,byte ptr [esi+35]
 0004F06F    mov         byte ptr [ebx+35],al
 0004F072    mov         al,byte ptr [esi+37]
 0004F075    mov         byte ptr [ebx+37],al
 0004F078    mov         dl,byte ptr [esi+34]
 0004F07B    mov         eax,ebx
 0004F07D    call        TCustomImageList.SetDrawingStyle
 0004F082    mov         al,byte ptr [esi+36]
 0004F085    mov         byte ptr [ebx+36],al
 0004F088    mov         eax,esi
 0004F08A    call        TCustomImageList.GetHandle
 0004F08F    mov         edx,eax
 0004F091    mov         eax,ebx
 0004F093    call        TCustomImageList.SetNewDimensions
 0004F098    mov         eax,ebx
 0004F09A    call        TCustomImageList.HandleAllocated
 0004F09F    test        al,al
>0004F0A1    jne         0004F0AC
 0004F0A3    mov         eax,ebx
 0004F0A5    call        TCustomImageList.HandleNeeded
>0004F0AA    jmp         0004F0C1
 0004F0AC    mov         eax,dword ptr [ebx+24]
 0004F0AF    push        eax
 0004F0B0    mov         eax,dword ptr [ebx+28]
 0004F0B3    push        eax
 0004F0B4    mov         eax,ebx
 0004F0B6    call        TCustomImageList.GetHandle
 0004F0BB    push        eax
 0004F0BC    call        comctl32.ImageList_SetIconSize
 0004F0C1    mov         eax,esi
 0004F0C3    call        TCustomImageList.GetHandle
 0004F0C8    push        eax
 0004F0C9    call        comctl32.ImageList_GetBkColor
 0004F0CE    call        GetColor
 0004F0D3    mov         edx,eax
 0004F0D5    mov         eax,ebx
 0004F0D7    call        TCustomImageList.SetBkColor
 0004F0DC    mov         eax,dword ptr [esi+3C]
 0004F0DF    mov         dword ptr [ebx+3C],eax
 0004F0E2    mov         edx,esi
 0004F0E4    mov         eax,ebx
 0004F0E6    call        TCustomImageList.AddImages
>0004F0EB    jmp         0004F0F6
 0004F0ED    mov         edx,esi
 0004F0EF    mov         eax,ebx
 0004F0F1    call        TPersistent.Assign
 0004F0F6    pop         esi
 0004F0F7    pop         ebx
 0004F0F8    ret
*}
end;

//0004F0FC
procedure TCustomImageList.AssignTo(Dest:TPersistent);
begin
{*
 0004F0FC    push        ebx
 0004F0FD    push        esi
 0004F0FE    mov         ebx,edx
 0004F100    mov         esi,eax
 0004F102    mov         eax,ebx
 0004F104    mov         edx,dword ptr ds:[4E0E0];TCustomImageList
 0004F10A    call        @IsClass
 0004F10F    test        al,al
>0004F111    je          0004F1A0
 0004F117    mov         al,byte ptr [esi+35]
 0004F11A    mov         byte ptr [ebx+35],al
 0004F11D    mov         al,byte ptr [esi+37]
 0004F120    mov         byte ptr [ebx+37],al
 0004F123    mov         dl,byte ptr [esi+34]
 0004F126    mov         eax,ebx
 0004F128    call        TCustomImageList.SetDrawingStyle
 0004F12D    mov         al,byte ptr [esi+36]
 0004F130    mov         byte ptr [ebx+36],al
 0004F133    mov         eax,dword ptr [esi+3C]
 0004F136    mov         dword ptr [ebx+3C],eax
 0004F139    mov         eax,ebx
 0004F13B    call        TCustomImageList.Clear
 0004F140    mov         eax,esi
 0004F142    call        TCustomImageList.GetHandle
 0004F147    mov         edx,eax
 0004F149    mov         eax,ebx
 0004F14B    call        TCustomImageList.SetNewDimensions
 0004F150    mov         eax,ebx
 0004F152    call        TCustomImageList.HandleAllocated
 0004F157    test        al,al
>0004F159    jne         0004F164
 0004F15B    mov         eax,ebx
 0004F15D    call        TCustomImageList.HandleNeeded
>0004F162    jmp         0004F179
 0004F164    mov         eax,dword ptr [ebx+24]
 0004F167    push        eax
 0004F168    mov         eax,dword ptr [ebx+28]
 0004F16B    push        eax
 0004F16C    mov         eax,ebx
 0004F16E    call        TCustomImageList.GetHandle
 0004F173    push        eax
 0004F174    call        comctl32.ImageList_SetIconSize
 0004F179    mov         eax,esi
 0004F17B    call        TCustomImageList.GetHandle
 0004F180    push        eax
 0004F181    call        comctl32.ImageList_GetBkColor
 0004F186    call        GetColor
 0004F18B    mov         edx,eax
 0004F18D    mov         eax,ebx
 0004F18F    call        TCustomImageList.SetBkColor
 0004F194    mov         edx,esi
 0004F196    mov         eax,ebx
 0004F198    call        TCustomImageList.AddImages
 0004F19D    pop         esi
 0004F19E    pop         ebx
 0004F19F    ret
 0004F1A0    mov         edx,ebx
 0004F1A2    mov         eax,esi
 0004F1A4    call        TPersistent.AssignTo
 0004F1A9    pop         esi
 0004F1AA    pop         ebx
 0004F1AB    ret
*}
end;

//0004F1AC
procedure TCustomImageList.CheckImage(Image:TGraphic);
begin
{*
 0004F1AC    push        ebp
 0004F1AD    mov         ebp,esp
 0004F1AF    push        0
 0004F1B1    push        ebx
 0004F1B2    push        esi
 0004F1B3    mov         esi,edx
 0004F1B5    mov         ebx,eax
 0004F1B7    xor         eax,eax
 0004F1B9    push        ebp
 0004F1BA    push        4F218
 0004F1BF    push        dword ptr fs:[eax]
 0004F1C2    mov         dword ptr fs:[eax],esp
 0004F1C5    test        esi,esi
>0004F1C7    je          0004F202
 0004F1C9    mov         eax,esi
 0004F1CB    mov         edx,dword ptr [eax]
 0004F1CD    call        dword ptr [edx+20]
 0004F1D0    cmp         eax,dword ptr [ebx+24]
>0004F1D3    jl          0004F1E1
 0004F1D5    mov         eax,esi
 0004F1D7    mov         edx,dword ptr [eax]
 0004F1D9    call        dword ptr [edx+2C]
 0004F1DC    cmp         eax,dword ptr [ebx+28]
>0004F1DF    jge         0004F202
 0004F1E1    lea         edx,[ebp-4]
 0004F1E4    mov         eax,[000B57BC];^SInvalidImageSize:TResStringRec
 0004F1E9    call        LoadResString
 0004F1EE    mov         ecx,dword ptr [ebp-4]
 0004F1F1    mov         dl,1
 0004F1F3    mov         eax,[0001EE64];EInvalidOperation
 0004F1F8    call        Exception.Create
 0004F1FD    call        @RaiseExcept
 0004F202    xor         eax,eax
 0004F204    pop         edx
 0004F205    pop         ecx
 0004F206    pop         ecx
 0004F207    mov         dword ptr fs:[eax],edx
 0004F20A    push        4F21F
 0004F20F    lea         eax,[ebp-4]
 0004F212    call        @LStrClr
 0004F217    ret
>0004F218    jmp         @HandleFinally
>0004F21D    jmp         0004F20F
 0004F21F    pop         esi
 0004F220    pop         ebx
 0004F221    pop         ecx
 0004F222    pop         ebp
 0004F223    ret
*}
end;

//0004F224
procedure TCustomImageList.SetDrawingStyle(Value:TDrawingStyle);
begin
{*
 0004F224    push        ebx
 0004F225    push        esi
 0004F226    mov         esi,eax
 0004F228    cmp         dl,byte ptr [esi+34]
>0004F22B    je          0004F23B
 0004F22D    mov         byte ptr [esi+34],dl
 0004F230    mov         eax,esi
 0004F232    mov         bx,0FFF0
 0004F236    call        @CallDynaInst
 0004F23B    pop         esi
 0004F23C    pop         ebx
 0004F23D    ret
*}
end;

//0004F240
function TCustomImageList.GetHotSpot:TPoint;
begin
{*
 0004F240    push        ebx
 0004F241    mov         ebx,edx
 0004F243    mov         ecx,ebx
 0004F245    xor         edx,edx
 0004F247    xor         eax,eax
 0004F249    call        Point
 0004F24E    pop         ebx
 0004F24F    ret
*}
end;

//0004F250
procedure TCustomImageList.Change;
begin
{*
 0004F250    push        ebx
 0004F251    push        esi
 0004F252    push        edi
 0004F253    push        ebp
 0004F254    mov         esi,eax
 0004F256    mov         byte ptr [esi+4C],1
 0004F25A    cmp         dword ptr [esi+50],0
>0004F25E    jg          0004F298
 0004F260    mov         eax,dword ptr [esi+40]
 0004F263    test        eax,eax
>0004F265    je          0004F289
 0004F267    mov         edi,dword ptr [eax+8]
 0004F26A    dec         edi
 0004F26B    test        edi,edi
>0004F26D    jl          0004F289
 0004F26F    inc         edi
 0004F270    xor         ebp,ebp
 0004F272    mov         edx,ebp
 0004F274    mov         eax,dword ptr [esi+40]
 0004F277    call        TList.Get
 0004F27C    mov         bx,0FFFF
 0004F280    call        @CallDynaInst
 0004F285    inc         ebp
 0004F286    dec         edi
>0004F287    jne         0004F272
 0004F289    cmp         word ptr [esi+56],0
>0004F28E    je          0004F298
 0004F290    mov         edx,esi
 0004F292    mov         eax,dword ptr [esi+58]
 0004F295    call        dword ptr [esi+54]
 0004F298    pop         ebp
 0004F299    pop         edi
 0004F29A    pop         esi
 0004F29B    pop         ebx
 0004F29C    ret
*}
end;

//0004F2A0
procedure TCustomImageList.UnRegisterChanges(Value:TChangeLink);
begin
{*
 0004F2A0    push        ebx
 0004F2A1    push        esi
 0004F2A2    push        edi
 0004F2A3    push        ebp
 0004F2A4    mov         ebp,edx
 0004F2A6    mov         ebx,eax
 0004F2A8    mov         eax,dword ptr [ebx+40]
 0004F2AB    test        eax,eax
>0004F2AD    je          0004F2DD
 0004F2AF    mov         edi,dword ptr [eax+8]
 0004F2B2    dec         edi
 0004F2B3    test        edi,edi
>0004F2B5    jl          0004F2DD
 0004F2B7    inc         edi
 0004F2B8    xor         esi,esi
 0004F2BA    mov         edx,esi
 0004F2BC    mov         eax,dword ptr [ebx+40]
 0004F2BF    call        TList.Get
 0004F2C4    cmp         ebp,eax
>0004F2C6    jne         0004F2D9
 0004F2C8    xor         eax,eax
 0004F2CA    mov         dword ptr [ebp+4],eax
 0004F2CD    mov         edx,esi
 0004F2CF    mov         eax,dword ptr [ebx+40]
 0004F2D2    call        TList.Delete
>0004F2D7    jmp         0004F2DD
 0004F2D9    inc         esi
 0004F2DA    dec         edi
>0004F2DB    jne         0004F2BA
 0004F2DD    pop         ebp
 0004F2DE    pop         edi
 0004F2DF    pop         esi
 0004F2E0    pop         ebx
 0004F2E1    ret
*}
end;

//0004F2E4
procedure TCustomImageList.RegisterChanges(Value:TChangeLink);
begin
{*
 0004F2E4    mov         dword ptr [edx+4],eax
 0004F2E7    mov         ecx,dword ptr [eax+40]
 0004F2EA    test        ecx,ecx
>0004F2EC    je          0004F2F5
 0004F2EE    mov         eax,ecx
 0004F2F0    call        TList.Add
 0004F2F5    ret
*}
end;

//0004F2F8
function StreamsEqual(S1:TMemoryStream; S2:TMemoryStream):Boolean;
begin
{*
 0004F2F8    push        ebx
 0004F2F9    push        esi
 0004F2FA    push        edi
 0004F2FB    mov         esi,edx
 0004F2FD    mov         ebx,eax
 0004F2FF    mov         eax,ebx
 0004F301    call        TStream.GetSize
 0004F306    mov         edi,eax
 0004F308    mov         eax,esi
 0004F30A    call        TStream.GetSize
 0004F30F    cmp         edi,eax
>0004F311    jne         0004F32B
 0004F313    mov         eax,ebx
 0004F315    call        TStream.GetSize
 0004F31A    mov         ecx,eax
 0004F31C    mov         edx,dword ptr [esi+4]
 0004F31F    mov         eax,dword ptr [ebx+4]
 0004F322    call        CompareMem
 0004F327    test        al,al
>0004F329    jne         0004F32F
 0004F32B    xor         eax,eax
>0004F32D    jmp         0004F331
 0004F32F    mov         al,1
 0004F331    pop         edi
 0004F332    pop         esi
 0004F333    pop         ebx
 0004F334    ret
*}
end;

//0004F338
function TCustomImageList.Equal(IL:TCustomImageList):Boolean;
begin
{*
 0004F338    push        ebp
 0004F339    mov         ebp,esp
 0004F33B    add         esp,0FFFFFFF4
 0004F33E    push        ebx
 0004F33F    push        esi
 0004F340    push        edi
 0004F341    mov         esi,edx
 0004F343    mov         ebx,eax
 0004F345    test        esi,esi
>0004F347    je          0004F35D
 0004F349    mov         eax,ebx
 0004F34B    call        TCustomImageList.GetCount
 0004F350    mov         edi,eax
 0004F352    mov         eax,esi
 0004F354    call        TCustomImageList.GetCount
 0004F359    cmp         edi,eax
>0004F35B    je          0004F366
 0004F35D    mov         byte ptr [ebp-1],0
>0004F361    jmp         0004F41B
 0004F366    mov         eax,ebx
 0004F368    call        TCustomImageList.GetCount
 0004F36D    test        eax,eax
>0004F36F    jne         0004F385
 0004F371    mov         eax,esi
 0004F373    call        TCustomImageList.GetCount
 0004F378    test        eax,eax
>0004F37A    jne         0004F385
 0004F37C    mov         byte ptr [ebp-1],1
>0004F380    jmp         0004F41B
 0004F385    mov         dl,1
 0004F387    mov         eax,[0001F5E8];TMemoryStream
 0004F38C    call        TObject.Create
 0004F391    mov         dword ptr [ebp-8],eax
 0004F394    xor         eax,eax
 0004F396    push        ebp
 0004F397    push        4F414
 0004F39C    push        dword ptr fs:[eax]
 0004F39F    mov         dword ptr fs:[eax],esp
 0004F3A2    mov         edx,dword ptr [ebp-8]
 0004F3A5    mov         eax,ebx
 0004F3A7    call        TCustomImageList.WriteData
 0004F3AC    mov         dl,1
 0004F3AE    mov         eax,[0001F5E8];TMemoryStream
 0004F3B3    call        TObject.Create
 0004F3B8    mov         dword ptr [ebp-0C],eax
 0004F3BB    xor         eax,eax
 0004F3BD    push        ebp
 0004F3BE    push        4F3F7
 0004F3C3    push        dword ptr fs:[eax]
 0004F3C6    mov         dword ptr fs:[eax],esp
 0004F3C9    mov         edx,dword ptr [ebp-0C]
 0004F3CC    mov         eax,esi
 0004F3CE    call        TCustomImageList.WriteData
 0004F3D3    mov         edx,dword ptr [ebp-0C]
 0004F3D6    mov         eax,dword ptr [ebp-8]
 0004F3D9    call        StreamsEqual
 0004F3DE    mov         byte ptr [ebp-1],al
 0004F3E1    xor         eax,eax
 0004F3E3    pop         edx
 0004F3E4    pop         ecx
 0004F3E5    pop         ecx
 0004F3E6    mov         dword ptr fs:[eax],edx
 0004F3E9    push        4F3FE
 0004F3EE    mov         eax,dword ptr [ebp-0C]
 0004F3F1    call        TObject.Free
 0004F3F6    ret
>0004F3F7    jmp         @HandleFinally
>0004F3FC    jmp         0004F3EE
 0004F3FE    xor         eax,eax
 0004F400    pop         edx
 0004F401    pop         ecx
 0004F402    pop         ecx
 0004F403    mov         dword ptr fs:[eax],edx
 0004F406    push        4F41B
 0004F40B    mov         eax,dword ptr [ebp-8]
 0004F40E    call        TObject.Free
 0004F413    ret
>0004F414    jmp         @HandleFinally
>0004F419    jmp         0004F40B
 0004F41B    mov         al,byte ptr [ebp-1]
 0004F41E    pop         edi
 0004F41F    pop         esi
 0004F420    pop         ebx
 0004F421    mov         esp,ebp
 0004F423    pop         ebp
 0004F424    ret
*}
end;

//0004F428
function DoWrite:Boolean;
begin
{*
 0004F428    push        ebp
 0004F429    mov         ebp,esp
 0004F42B    push        ebx
 0004F42C    mov         eax,dword ptr [ebp+8]
 0004F42F    mov         eax,dword ptr [eax-4]
 0004F432    cmp         dword ptr [eax+1C],0
>0004F436    je          0004F46F
 0004F438    mov         eax,dword ptr [ebp+8]
 0004F43B    mov         eax,dword ptr [eax-4]
 0004F43E    mov         ebx,dword ptr [eax+1C]
 0004F441    mov         eax,ebx
 0004F443    mov         edx,dword ptr ds:[4E0E0];TCustomImageList
 0004F449    call        @IsClass
 0004F44E    test        al,al
>0004F450    je          0004F46A
 0004F452    mov         eax,dword ptr [ebp+8]
 0004F455    mov         edx,ebx
 0004F457    mov         eax,dword ptr [ebp+8]
 0004F45A    mov         eax,dword ptr [eax-8]
 0004F45D    call        TCustomImageList.Equal
 0004F462    test        al,al
>0004F464    je          0004F46A
 0004F466    xor         eax,eax
>0004F468    jmp         0004F47F
 0004F46A    mov         al,1
 0004F46C    pop         ebx
 0004F46D    pop         ebp
 0004F46E    ret
 0004F46F    mov         eax,dword ptr [ebp+8]
 0004F472    mov         eax,dword ptr [eax-8]
 0004F475    call        TCustomImageList.GetCount
 0004F47A    test        eax,eax
 0004F47C    setg        al
 0004F47F    pop         ebx
 0004F480    pop         ebp
 0004F481    ret
*}
end;

//0004F484
procedure TCustomImageList.DefineProperties(Filer:TFiler);
begin
{*
 0004F484    push        ebp
 0004F485    mov         ebp,esp
 0004F487    add         esp,0FFFFFFF8
 0004F48A    push        ebx
 0004F48B    mov         dword ptr [ebp-4],edx
 0004F48E    mov         dword ptr [ebp-8],eax
 0004F491    mov         edx,dword ptr [ebp-4]
 0004F494    mov         eax,dword ptr [ebp-8]
 0004F497    call        TComponent.DefineProperties
 0004F49C    mov         eax,dword ptr [ebp-8]
 0004F49F    push        eax
 0004F4A0    push        4F830;TCustomImageList.ReadData
 0004F4A5    mov         eax,dword ptr [ebp-8]
 0004F4A8    push        eax
 0004F4A9    push        4FA44;TCustomImageList.WriteData
 0004F4AE    push        ebp
 0004F4AF    call        DoWrite
 0004F4B4    pop         ecx
 0004F4B5    mov         ecx,eax
 0004F4B7    mov         edx,4F4D4;'Bitmap'
 0004F4BC    mov         eax,dword ptr [ebp-4]
 0004F4BF    mov         ebx,dword ptr [eax]
 0004F4C1    call        dword ptr [ebx+4]
 0004F4C4    pop         ebx
 0004F4C5    pop         ecx
 0004F4C6    pop         ecx
 0004F4C7    pop         ebp
 0004F4C8    ret
*}
end;

//0004F4DC
procedure TCustomImageList.ReadD2Stream(Stream:TStream);
begin
{*
 0004F4DC    push        ebp
 0004F4DD    mov         ebp,esp
 0004F4DF    add         esp,0FFFFFFC0
 0004F4E2    push        ebx
 0004F4E3    push        esi
 0004F4E4    push        edi
 0004F4E5    mov         ebx,edx
 0004F4E7    mov         dword ptr [ebp-4],eax
 0004F4EA    lea         edx,[ebp-18]
 0004F4ED    mov         ecx,4
 0004F4F2    mov         eax,ebx
 0004F4F4    call        TStream.ReadBuffer
 0004F4F9    lea         edx,[ebp-1C]
 0004F4FC    mov         ecx,4
 0004F501    mov         eax,ebx
 0004F503    call        TStream.ReadBuffer
 0004F508    mov         dl,1
 0004F50A    mov         eax,[00028F70];TBitmap
 0004F50F    call        TBitmap.Create
 0004F514    mov         dword ptr [ebp-8],eax
 0004F517    xor         eax,eax
 0004F519    push        ebp
 0004F51A    push        4F75D
 0004F51F    push        dword ptr fs:[eax]
 0004F522    mov         dword ptr fs:[eax],esp
 0004F525    mov         eax,ebx
 0004F527    call        TStream.GetPosition
 0004F52C    mov         esi,eax
 0004F52E    mov         edx,ebx
 0004F530    mov         eax,dword ptr [ebp-8]
 0004F533    mov         ecx,dword ptr [eax]
 0004F535    call        dword ptr [ecx+50]
 0004F538    mov         edx,dword ptr [ebp-18]
 0004F53B    add         edx,esi
 0004F53D    mov         eax,ebx
 0004F53F    call        TStream.SetPosition
 0004F544    mov         dl,1
 0004F546    mov         eax,[00028F70];TBitmap
 0004F54B    call        TBitmap.Create
 0004F550    mov         dword ptr [ebp-10],eax
 0004F553    xor         eax,eax
 0004F555    push        ebp
 0004F556    push        4F740
 0004F55B    push        dword ptr fs:[eax]
 0004F55E    mov         dword ptr fs:[eax],esp
 0004F561    mov         edx,ebx
 0004F563    mov         eax,dword ptr [ebp-10]
 0004F566    mov         ecx,dword ptr [eax]
 0004F568    call        dword ptr [ecx+50]
 0004F56B    mov         dl,1
 0004F56D    mov         eax,[00028F70];TBitmap
 0004F572    call        TBitmap.Create
 0004F577    mov         dword ptr [ebp-0C],eax
 0004F57A    mov         eax,dword ptr [ebp-4]
 0004F57D    mov         edx,dword ptr [eax+28]
 0004F580    mov         eax,dword ptr [ebp-0C]
 0004F583    mov         ecx,dword ptr [eax]
 0004F585    call        dword ptr [ecx+40]
 0004F588    mov         eax,dword ptr [ebp-4]
 0004F58B    mov         edx,dword ptr [eax+24]
 0004F58E    mov         eax,dword ptr [ebp-0C]
 0004F591    mov         ecx,dword ptr [eax]
 0004F593    call        dword ptr [ecx+34]
 0004F596    mov         dl,1
 0004F598    mov         eax,[00028F70];TBitmap
 0004F59D    call        TBitmap.Create
 0004F5A2    mov         dword ptr [ebp-14],eax
 0004F5A5    mov         dl,1
 0004F5A7    mov         eax,dword ptr [ebp-14]
 0004F5AA    call        TBitmap.SetMonochrome
 0004F5AF    mov         eax,dword ptr [ebp-4]
 0004F5B2    mov         edx,dword ptr [eax+28]
 0004F5B5    mov         eax,dword ptr [ebp-14]
 0004F5B8    mov         ecx,dword ptr [eax]
 0004F5BA    call        dword ptr [ecx+40]
 0004F5BD    mov         eax,dword ptr [ebp-4]
 0004F5C0    mov         edx,dword ptr [eax+24]
 0004F5C3    mov         eax,dword ptr [ebp-14]
 0004F5C6    mov         ecx,dword ptr [eax]
 0004F5C8    call        dword ptr [ecx+34]
 0004F5CB    mov         eax,dword ptr [ebp-4]
 0004F5CE    mov         eax,dword ptr [eax+24]
 0004F5D1    push        eax
 0004F5D2    lea         eax,[ebp-30]
 0004F5D5    push        eax
 0004F5D6    mov         eax,dword ptr [ebp-4]
 0004F5D9    mov         ecx,dword ptr [eax+28]
 0004F5DC    xor         edx,edx
 0004F5DE    xor         eax,eax
 0004F5E0    call        Rect
 0004F5E5    mov         eax,dword ptr [ebp-4]
 0004F5E8    call        TCustomImageList.BeginUpdate
 0004F5ED    xor         eax,eax
 0004F5EF    push        ebp
 0004F5F0    push        4F723
 0004F5F5    push        dword ptr fs:[eax]
 0004F5F8    mov         dword ptr fs:[eax],esp
 0004F5FB    mov         eax,dword ptr [ebp-8]
 0004F5FE    mov         edx,dword ptr [eax]
 0004F600    call        dword ptr [edx+20]
 0004F603    mov         edx,dword ptr [ebp-4]
 0004F606    mov         ecx,dword ptr [edx+24]
 0004F609    cdq
 0004F60A    idiv        eax,ecx
 0004F60C    dec         eax
 0004F60D    test        eax,eax
>0004F60F    jl          0004F6FD
 0004F615    inc         eax
 0004F616    mov         dword ptr [ebp-20],eax
 0004F619    xor         edi,edi
 0004F61B    cmp         dword ptr [ebp-1C],0
>0004F61F    je          0004F6FD
 0004F625    mov         eax,dword ptr [ebp-8]
 0004F628    mov         edx,dword ptr [eax]
 0004F62A    call        dword ptr [edx+2C]
 0004F62D    mov         edx,dword ptr [ebp-4]
 0004F630    mov         ecx,dword ptr [edx+28]
 0004F633    cdq
 0004F634    idiv        eax,ecx
 0004F636    mov         esi,eax
 0004F638    dec         esi
 0004F639    test        esi,esi
>0004F63B    jl          0004F6F3
 0004F641    inc         esi
 0004F642    xor         ebx,ebx
 0004F644    cmp         dword ptr [ebp-1C],0
>0004F648    je          0004F6F3
 0004F64E    mov         eax,dword ptr [ebp-4]
 0004F651    mov         eax,dword ptr [eax+24]
 0004F654    push        eax
 0004F655    lea         eax,[ebp-40]
 0004F658    push        eax
 0004F659    mov         eax,dword ptr [ebp-4]
 0004F65C    mov         ecx,dword ptr [eax+28]
 0004F65F    mov         eax,dword ptr [ebp-4]
 0004F662    mov         edx,dword ptr [eax+24]
 0004F665    imul        edx,edi
 0004F668    mov         eax,dword ptr [ebp-4]
 0004F66B    mov         eax,dword ptr [eax+28]
 0004F66E    imul        eax,ebx
 0004F671    call        Bounds
 0004F676    lea         eax,[ebp-40]
 0004F679    push        eax
 0004F67A    mov         eax,dword ptr [ebp-8]
 0004F67D    call        TBitmap.GetCanvas
 0004F682    push        eax
 0004F683    mov         eax,dword ptr [ebp-0C]
 0004F686    call        TBitmap.GetCanvas
 0004F68B    lea         edx,[ebp-30]
 0004F68E    pop         ecx
 0004F68F    call        TCanvas.CopyRect
 0004F694    mov         eax,dword ptr [ebp-4]
 0004F697    mov         eax,dword ptr [eax+24]
 0004F69A    push        eax
 0004F69B    lea         eax,[ebp-40]
 0004F69E    push        eax
 0004F69F    mov         eax,dword ptr [ebp-4]
 0004F6A2    mov         ecx,dword ptr [eax+28]
 0004F6A5    mov         eax,dword ptr [ebp-4]
 0004F6A8    mov         edx,dword ptr [eax+24]
 0004F6AB    imul        edx,edi
 0004F6AE    mov         eax,dword ptr [ebp-4]
 0004F6B1    mov         eax,dword ptr [eax+28]
 0004F6B4    imul        eax,ebx
 0004F6B7    call        Bounds
 0004F6BC    lea         eax,[ebp-40]
 0004F6BF    push        eax
 0004F6C0    mov         eax,dword ptr [ebp-10]
 0004F6C3    call        TBitmap.GetCanvas
 0004F6C8    push        eax
 0004F6C9    mov         eax,dword ptr [ebp-14]
 0004F6CC    call        TBitmap.GetCanvas
 0004F6D1    lea         edx,[ebp-30]
 0004F6D4    pop         ecx
 0004F6D5    call        TCanvas.CopyRect
 0004F6DA    mov         ecx,dword ptr [ebp-14]
 0004F6DD    mov         edx,dword ptr [ebp-0C]
 0004F6E0    mov         eax,dword ptr [ebp-4]
 0004F6E3    call        TCustomImageList.Add
 0004F6E8    dec         dword ptr [ebp-1C]
 0004F6EB    inc         ebx
 0004F6EC    dec         esi
>0004F6ED    jne         0004F644
 0004F6F3    inc         edi
 0004F6F4    dec         dword ptr [ebp-20]
>0004F6F7    jne         0004F61B
 0004F6FD    xor         eax,eax
 0004F6FF    pop         edx
 0004F700    pop         ecx
 0004F701    pop         ecx
 0004F702    mov         dword ptr fs:[eax],edx
 0004F705    push        4F72A
 0004F70A    mov         eax,dword ptr [ebp-0C]
 0004F70D    call        TObject.Free
 0004F712    mov         eax,dword ptr [ebp-14]
 0004F715    call        TObject.Free
 0004F71A    mov         eax,dword ptr [ebp-4]
 0004F71D    call        TCustomImageList.EndUpdate
 0004F722    ret
>0004F723    jmp         @HandleFinally
>0004F728    jmp         0004F70A
 0004F72A    xor         eax,eax
 0004F72C    pop         edx
 0004F72D    pop         ecx
 0004F72E    pop         ecx
 0004F72F    mov         dword ptr fs:[eax],edx
 0004F732    push        4F747
 0004F737    mov         eax,dword ptr [ebp-10]
 0004F73A    call        TObject.Free
 0004F73F    ret
>0004F740    jmp         @HandleFinally
>0004F745    jmp         0004F737
 0004F747    xor         eax,eax
 0004F749    pop         edx
 0004F74A    pop         ecx
 0004F74B    pop         ecx
 0004F74C    mov         dword ptr fs:[eax],edx
 0004F74F    push        4F764
 0004F754    mov         eax,dword ptr [ebp-8]
 0004F757    call        TObject.Free
 0004F75C    ret
>0004F75D    jmp         @HandleFinally
>0004F762    jmp         0004F754
 0004F764    pop         edi
 0004F765    pop         esi
 0004F766    pop         ebx
 0004F767    mov         esp,ebp
 0004F769    pop         ebp
 0004F76A    ret
*}
end;

//0004F76C
procedure TCustomImageList.ReadD3Stream(Stream:TStream);
begin
{*
 0004F76C    push        ebp
 0004F76D    mov         ebp,esp
 0004F76F    add         esp,0FFFFFFF8
 0004F772    push        ebx
 0004F773    xor         ecx,ecx
 0004F775    mov         dword ptr [ebp-8],ecx
 0004F778    mov         ebx,eax
 0004F77A    xor         eax,eax
 0004F77C    push        ebp
 0004F77D    push        4F821
 0004F782    push        dword ptr fs:[eax]
 0004F785    mov         dword ptr fs:[eax],esp
 0004F788    push        0
 0004F78A    mov         ecx,edx
 0004F78C    mov         eax,[0001F7D8];TStreamAdapter
 0004F791    mov         dl,1
 0004F793    call        TStreamAdapter.Create
 0004F798    mov         dword ptr [ebp-4],eax
 0004F79B    xor         eax,eax
 0004F79D    push        ebp
 0004F79E    push        4F804
 0004F7A3    push        dword ptr fs:[eax]
 0004F7A6    mov         dword ptr fs:[eax],esp
 0004F7A9    mov         eax,dword ptr [ebp-4]
 0004F7AC    test        eax,eax
>0004F7AE    je          0004F7B3
 0004F7B0    sub         eax,0FFFFFFEC
 0004F7B3    push        eax
 0004F7B4    call        comctl32.ImageList_Read
 0004F7B9    mov         edx,eax
 0004F7BB    mov         eax,ebx
 0004F7BD    call        TCustomImageList.SetHandle
 0004F7C2    mov         eax,ebx
 0004F7C4    call        TCustomImageList.GetHandle
 0004F7C9    test        eax,eax
>0004F7CB    jne         0004F7EE
 0004F7CD    lea         edx,[ebp-8]
 0004F7D0    mov         eax,[000B5A78];^SImageReadFail:TResStringRec
 0004F7D5    call        LoadResString
 0004F7DA    mov         ecx,dword ptr [ebp-8]
 0004F7DD    mov         dl,1
 0004F7DF    mov         eax,[0001EB34];EReadError
 0004F7E4    call        Exception.Create
 0004F7E9    call        @RaiseExcept
 0004F7EE    xor         eax,eax
 0004F7F0    pop         edx
 0004F7F1    pop         ecx
 0004F7F2    pop         ecx
 0004F7F3    mov         dword ptr fs:[eax],edx
 0004F7F6    push        4F80B
 0004F7FB    mov         eax,dword ptr [ebp-4]
 0004F7FE    call        TObject.Free
 0004F803    ret
>0004F804    jmp         @HandleFinally
>0004F809    jmp         0004F7FB
 0004F80B    xor         eax,eax
 0004F80D    pop         edx
 0004F80E    pop         ecx
 0004F80F    pop         ecx
 0004F810    mov         dword ptr fs:[eax],edx
 0004F813    push        4F828
 0004F818    lea         eax,[ebp-8]
 0004F81B    call        @LStrClr
 0004F820    ret
>0004F821    jmp         @HandleFinally
>0004F826    jmp         0004F818
 0004F828    pop         ebx
 0004F829    pop         ecx
 0004F82A    pop         ecx
 0004F82B    pop         ebp
 0004F82C    ret
*}
end;

//0004F830
procedure TCustomImageList.ReadData(Stream:TStream);
begin
{*
 0004F830    push        ebx
 0004F831    push        esi
 0004F832    push        edi
 0004F833    add         esp,0FFFFFFF0
 0004F836    mov         edi,edx
 0004F838    mov         esi,eax
 0004F83A    mov         eax,esi
 0004F83C    call        TCustomImageList.FreeHandle
 0004F841    mov         eax,edi
 0004F843    call        TStream.GetPosition
 0004F848    mov         dword ptr [esp+0C],eax
 0004F84C    mov         edx,esp
 0004F84E    mov         ecx,4
 0004F853    mov         eax,edi
 0004F855    mov         ebx,dword ptr [eax]
 0004F857    call        dword ptr [ebx+4]
 0004F85A    lea         edx,[esp+4]
 0004F85E    mov         ecx,4
 0004F863    mov         eax,edi
 0004F865    mov         ebx,dword ptr [eax]
 0004F867    call        dword ptr [ebx+4]
 0004F86A    mov         bl,byte ptr [esp]
 0004F86D    and         bl,0FF
 0004F870    mov         ax,word ptr [esp]
 0004F874    shr         ax,8
 0004F878    mov         byte ptr [esp+8],al
 0004F87C    mov         edx,dword ptr [esp+0C]
 0004F880    mov         eax,edi
 0004F882    call        TStream.SetPosition
 0004F887    mov         eax,dword ptr [esp]
 0004F88A    cmp         eax,dword ptr [esp+4]
>0004F88E    je          0004F8A7
 0004F890    cmp         bl,49
>0004F893    jne         0004F8A7
 0004F895    cmp         byte ptr [esp+8],4C
>0004F89A    jne         0004F8A7
 0004F89C    mov         edx,edi
 0004F89E    mov         eax,esi
 0004F8A0    call        TCustomImageList.ReadD3Stream
>0004F8A5    jmp         0004F8B0
 0004F8A7    mov         edx,edi
 0004F8A9    mov         eax,esi
 0004F8AB    call        TCustomImageList.ReadD2Stream
 0004F8B0    add         esp,10
 0004F8B3    pop         edi
 0004F8B4    pop         esi
 0004F8B5    pop         ebx
 0004F8B6    ret
*}
end;

//0004F8B8
procedure WriteDIB(BM:HBITMAP);
begin
{*
 0004F8B8    push        ebp
 0004F8B9    mov         ebp,esp
 0004F8BB    add         esp,0FFFFFFE0
 0004F8BE    push        ebx
 0004F8BF    push        esi
 0004F8C0    push        edi
 0004F8C1    mov         ebx,eax
 0004F8C3    test        ebx,ebx
>0004F8C5    je          0004FA3C
 0004F8CB    lea         ecx,[ebp-4]
 0004F8CE    lea         edx,[ebp-10]
 0004F8D1    mov         eax,ebx
 0004F8D3    call        GetDIBSizes
 0004F8D8    mov         eax,dword ptr [ebp-10]
 0004F8DB    add         eax,dword ptr [ebp-4]
 0004F8DE    call        @GetMem
 0004F8E3    mov         dword ptr [ebp-8],eax
 0004F8E6    xor         eax,eax
 0004F8E8    push        ebp
 0004F8E9    push        4FA35
 0004F8EE    push        dword ptr fs:[eax]
 0004F8F1    mov         dword ptr fs:[eax],esp
 0004F8F4    mov         esi,dword ptr [ebp-8]
 0004F8F7    add         esi,dword ptr [ebp-10]
 0004F8FA    push        esi
 0004F8FB    mov         ecx,dword ptr [ebp-8]
 0004F8FE    xor         edx,edx
 0004F900    mov         eax,ebx
 0004F902    call        GetDIB
 0004F907    push        0
 0004F909    push        0
 0004F90B    lea         eax,[ebp-0C]
 0004F90E    push        eax
 0004F90F    push        0
 0004F911    mov         eax,dword ptr [ebp-8]
 0004F914    push        eax
 0004F915    mov         eax,dword ptr [ebp+8]
 0004F918    mov         eax,dword ptr [eax-8]
 0004F91B    push        eax
 0004F91C    call        gdi32.CreateDIBSection
 0004F921    mov         edx,eax
 0004F923    mov         eax,dword ptr [ebp+8]
 0004F926    mov         eax,dword ptr [eax-4]
 0004F929    call        TBitmap.SetHandle
 0004F92E    mov         edx,dword ptr [ebp-0C]
 0004F931    mov         eax,esi
 0004F933    mov         ecx,dword ptr [ebp-4]
 0004F936    call        Move
 0004F93B    mov         esi,dword ptr [ebp-8]
 0004F93E    mov         eax,dword ptr [esi+4]
 0004F941    mov         edx,dword ptr [ebp+8]
 0004F944    mov         edx,dword ptr [edx-0C]
 0004F947    mov         ecx,dword ptr [edx+28]
 0004F94A    cdq
 0004F94B    idiv        eax,ecx
 0004F94D    mov         ebx,eax
 0004F94F    test        ebx,ebx
>0004F951    jne         0004F954
 0004F953    inc         ebx
 0004F954    mov         eax,dword ptr [ebp+8]
 0004F957    mov         eax,dword ptr [eax-0C]
 0004F95A    call        TCustomImageList.GetCount
 0004F95F    cmp         ebx,eax
>0004F961    jle         0004F970
 0004F963    mov         eax,dword ptr [ebp+8]
 0004F966    mov         eax,dword ptr [eax-0C]
 0004F969    call        TCustomImageList.GetCount
 0004F96E    mov         ebx,eax
 0004F970    mov         eax,dword ptr [ebp+8]
 0004F973    mov         eax,dword ptr [eax-0C]
 0004F976    mov         eax,dword ptr [eax+28]
 0004F979    imul        ebx
 0004F97B    mov         dword ptr [esi+4],eax
 0004F97E    mov         eax,dword ptr [ebp+8]
 0004F981    mov         eax,dword ptr [eax-0C]
 0004F984    call        TCustomImageList.GetCount
 0004F989    cdq
 0004F98A    idiv        eax,ebx
 0004F98C    mov         edi,eax
 0004F98E    mov         eax,dword ptr [ebp+8]
 0004F991    mov         eax,dword ptr [eax-0C]
 0004F994    call        TCustomImageList.GetCount
 0004F999    mov         edx,edi
 0004F99B    imul        edx,ebx
 0004F99E    cmp         eax,edx
>0004F9A0    jle         0004F9A3
 0004F9A2    inc         edi
 0004F9A3    mov         eax,dword ptr [ebp+8]
 0004F9A6    mov         eax,dword ptr [eax-0C]
 0004F9A9    mov         ebx,dword ptr [eax+24]
 0004F9AC    imul        ebx,edi
 0004F9AF    mov         dword ptr [esi+8],ebx
 0004F9B2    push        ebx
 0004F9B3    lea         eax,[ebp-20]
 0004F9B6    push        eax
 0004F9B7    mov         ecx,dword ptr [esi+4]
 0004F9BA    xor         edx,edx
 0004F9BC    xor         eax,eax
 0004F9BE    call        Rect
 0004F9C3    push        0
 0004F9C5    push        0
 0004F9C7    lea         eax,[ebp-0C]
 0004F9CA    push        eax
 0004F9CB    push        0
 0004F9CD    mov         eax,dword ptr [ebp-8]
 0004F9D0    push        eax
 0004F9D1    mov         eax,dword ptr [ebp+8]
 0004F9D4    mov         eax,dword ptr [eax-8]
 0004F9D7    push        eax
 0004F9D8    call        gdi32.CreateDIBSection
 0004F9DD    mov         edx,eax
 0004F9DF    mov         eax,dword ptr [ebp+8]
 0004F9E2    mov         eax,dword ptr [eax-10]
 0004F9E5    call        TBitmap.SetHandle
 0004F9EA    lea         eax,[ebp-20]
 0004F9ED    push        eax
 0004F9EE    mov         eax,dword ptr [ebp+8]
 0004F9F1    mov         eax,dword ptr [eax-4]
 0004F9F4    call        TBitmap.GetCanvas
 0004F9F9    push        eax
 0004F9FA    mov         eax,dword ptr [ebp+8]
 0004F9FD    mov         eax,dword ptr [eax-10]
 0004FA00    call        TBitmap.GetCanvas
 0004FA05    lea         edx,[ebp-20]
 0004FA08    pop         ecx
 0004FA09    call        TCanvas.CopyRect
 0004FA0E    mov         eax,dword ptr [ebp+8]
 0004FA11    mov         edx,dword ptr [eax-14]
 0004FA14    mov         eax,dword ptr [ebp+8]
 0004FA17    mov         eax,dword ptr [eax-10]
 0004FA1A    mov         ecx,dword ptr [eax]
 0004FA1C    call        dword ptr [ecx+54]
 0004FA1F    xor         eax,eax
 0004FA21    pop         edx
 0004FA22    pop         ecx
 0004FA23    pop         ecx
 0004FA24    mov         dword ptr fs:[eax],edx
 0004FA27    push        4FA3C
 0004FA2C    mov         eax,dword ptr [ebp-8]
 0004FA2F    call        @FreeMem
 0004FA34    ret
>0004FA35    jmp         @HandleFinally
>0004FA3A    jmp         0004FA2C
 0004FA3C    pop         edi
 0004FA3D    pop         esi
 0004FA3E    pop         ebx
 0004FA3F    mov         esp,ebp
 0004FA41    pop         ebp
 0004FA42    ret
*}
end;

//0004FA44
procedure TCustomImageList.WriteData(Stream:TStream);
begin
{*
 0004FA44    push        ebp
 0004FA45    mov         ebp,esp
 0004FA47    add         esp,0FFFFFFE8
 0004FA4A    push        ebx
 0004FA4B    mov         ebx,edx
 0004FA4D    mov         dword ptr [ebp-0C],eax
 0004FA50    xor         eax,eax
 0004FA52    mov         dword ptr [ebp-4],eax
 0004FA55    xor         eax,eax
 0004FA57    mov         dword ptr [ebp-10],eax
 0004FA5A    xor         eax,eax
 0004FA5C    mov         dword ptr [ebp-8],eax
 0004FA5F    mov         dl,1
 0004FA61    mov         eax,[0001F5E8];TMemoryStream
 0004FA66    call        TObject.Create
 0004FA6B    mov         dword ptr [ebp-14],eax
 0004FA6E    xor         eax,eax
 0004FA70    push        ebp
 0004FA71    push        4FB3E
 0004FA76    push        dword ptr fs:[eax]
 0004FA79    mov         dword ptr fs:[eax],esp
 0004FA7C    mov         dl,1
 0004FA7E    mov         eax,[00028F70];TBitmap
 0004FA83    call        TBitmap.Create
 0004FA88    mov         dword ptr [ebp-4],eax
 0004FA8B    mov         dl,1
 0004FA8D    mov         eax,[00028F70];TBitmap
 0004FA92    call        TBitmap.Create
 0004FA97    mov         dword ptr [ebp-10],eax
 0004FA9A    push        0
 0004FA9C    call        user32.GetDC
 0004FAA1    mov         dword ptr [ebp-8],eax
 0004FAA4    push        ebp
 0004FAA5    mov         eax,dword ptr [ebp-0C]
 0004FAA8    call        TCustomImageList.GetImageBitmap
 0004FAAD    call        WriteDIB
 0004FAB2    pop         ecx
 0004FAB3    mov         eax,dword ptr [ebp-14]
 0004FAB6    call        TStream.GetSize
 0004FABB    mov         dword ptr [ebp-18],eax
 0004FABE    push        ebp
 0004FABF    mov         eax,dword ptr [ebp-0C]
 0004FAC2    call        TCustomImageList.GetMaskBitmap
 0004FAC7    call        WriteDIB
 0004FACC    pop         ecx
 0004FACD    lea         edx,[ebp-18]
 0004FAD0    mov         ecx,4
 0004FAD5    mov         eax,ebx
 0004FAD7    call        TStream.WriteBuffer
 0004FADC    mov         eax,dword ptr [ebp-0C]
 0004FADF    call        TCustomImageList.GetCount
 0004FAE4    mov         dword ptr [ebp-18],eax
 0004FAE7    lea         edx,[ebp-18]
 0004FAEA    mov         ecx,4
 0004FAEF    mov         eax,ebx
 0004FAF1    call        TStream.WriteBuffer
 0004FAF6    mov         eax,dword ptr [ebp-14]
 0004FAF9    call        TStream.GetSize
 0004FAFE    mov         ecx,eax
 0004FB00    mov         eax,dword ptr [ebp-14]
 0004FB03    mov         edx,dword ptr [eax+4]
 0004FB06    mov         eax,ebx
 0004FB08    call        TStream.WriteBuffer
 0004FB0D    xor         eax,eax
 0004FB0F    pop         edx
 0004FB10    pop         ecx
 0004FB11    pop         ecx
 0004FB12    mov         dword ptr fs:[eax],edx
 0004FB15    push        4FB45
 0004FB1A    mov         eax,dword ptr [ebp-8]
 0004FB1D    push        eax
 0004FB1E    push        0
 0004FB20    call        user32.ReleaseDC
 0004FB25    mov         eax,dword ptr [ebp-4]
 0004FB28    call        TObject.Free
 0004FB2D    mov         eax,dword ptr [ebp-10]
 0004FB30    call        TObject.Free
 0004FB35    mov         eax,dword ptr [ebp-14]
 0004FB38    call        TObject.Free
 0004FB3D    ret
>0004FB3E    jmp         @HandleFinally
>0004FB43    jmp         0004FB1A
 0004FB45    pop         ebx
 0004FB46    mov         esp,ebp
 0004FB48    pop         ebp
 0004FB49    ret
*}
end;

//0004FB4C
procedure TCustomImageList.BeginUpdate;
begin
{*
 0004FB4C    inc         dword ptr [eax+50]
 0004FB4F    ret
*}
end;

//0004FB50
procedure TCustomImageList.EndUpdate;
begin
{*
 0004FB50    push        ebx
 0004FB51    cmp         dword ptr [eax+50],0
>0004FB55    jle         0004FB5A
 0004FB57    dec         dword ptr [eax+50]
 0004FB5A    cmp         byte ptr [eax+4C],0
>0004FB5E    je          0004FB6D
 0004FB60    mov         byte ptr [eax+4C],0
 0004FB64    mov         bx,0FFF0
 0004FB68    call        @CallDynaInst
 0004FB6D    pop         ebx
 0004FB6E    ret
*}
end;

//0004FB70
destructor TChangeLink.Destroy;
begin
{*
 0004FB70    push        ebx
 0004FB71    push        esi
 0004FB72    call        @BeforeDestruction
 0004FB77    mov         ebx,edx
 0004FB79    mov         esi,eax
 0004FB7B    mov         eax,dword ptr [esi+4]
 0004FB7E    test        eax,eax
>0004FB80    je          0004FB89
 0004FB82    mov         edx,esi
 0004FB84    call        TCustomImageList.UnRegisterChanges
 0004FB89    mov         edx,ebx
 0004FB8B    and         dl,0FC
 0004FB8E    mov         eax,esi
 0004FB90    call        TObject.Destroy
 0004FB95    test        bl,bl
>0004FB97    jle         0004FBA0
 0004FB99    mov         eax,esi
 0004FB9B    call        @ClassDestroy
 0004FBA0    pop         esi
 0004FBA1    pop         ebx
 0004FBA2    ret
*}
end;

//0004FBA4
procedure TChangeLink.Change;
begin
{*
 0004FBA4    push        ebx
 0004FBA5    cmp         word ptr [eax+0A],0
>0004FBAA    je          0004FBB7
 0004FBAC    mov         ebx,eax
 0004FBAE    mov         edx,dword ptr [eax+4]
 0004FBB1    mov         eax,dword ptr [ebx+0C]
 0004FBB4    call        dword ptr [ebx+8]
 0004FBB7    pop         ebx
 0004FBB8    ret
*}
end;

end.