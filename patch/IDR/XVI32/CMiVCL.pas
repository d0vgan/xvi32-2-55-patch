//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMiVCL;

interface

uses
  SysUtils, Classes, Menus, XVI32_Main;

type
  TMRUClick = procedure(Sender:TObject; AFilename:String) of object;;
  TMRUFiles = class(TComponent)
  public
    HelpContext:Integer;//f24
    FileCount:byte;//f28
    FileMenu:TMenuItem;//f2C
    f30:TStringList;//f30
    IniFile:String;//f34
    IniSection:String;//f38
    MaxLength:byte;//f3C
    ShortCut:Boolean;//f3D
    OnMRUItemClick:TMRUClick;//f40
    f44:TFormMain;//f44
    destructor Destroy; virtual;//0008850C
    procedure Loaded; virtual;//vC//00088548
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00088D04
    constructor Create(AOwner:TComponent); virtual;//v2C//0008846C
    procedure v30; virtual;//v30//00088728
    procedure SetFileCount(Value:Byte);//00088554
    procedure SetFileMenu(Value:TMenuItem);//0008859C
    procedure SetShortCut(Value:Boolean);//000885B8
    procedure SetMaxLength(Value:Byte);//000885C8
  end;
  TFileDrop = class(TComponent)
  public
    f24:TStringList;//f24
    Enabled:Boolean;//f28
    f2C:HWND;//f2C
    f30:Longint;//f30
    f34:Pointer;//f34
    OnDrop:TNotifyEvent;//f38
    f3C:TFormMain;//f3C
    destructor Destroy; virtual;//00088D90
    constructor Create(AOwner:TComponent); virtual;//v2C//00088D34
    procedure SetEnabled(Value:Boolean);//00088E48
  end;
    constructor Create(AOwner:TComponent);//0008846C
    destructor Destroy;//0008850C
    procedure Loaded;//00088548
    //procedure sub_0008868C(?:TMRUFiles; ?:?);//0008868C
    procedure sub_00088728;//00088728
    procedure sub_0008898C(?:TMRUFiles);//0008898C
    //function sub_00088A60(?:TMRUFiles):?;//00088A60
    //function sub_00088BA4(?:TMRUFiles):?;//00088BA4
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00088D04
    constructor Create(AOwner:TComponent);//00088D34
    destructor Destroy;//00088D90
    procedure sub_00088DD0(?:TFileDrop);//00088DD0
    procedure sub_00088E28(?:TFileDrop);//00088E28

implementation

//0008846C
constructor TMRUFiles.Create(AOwner:TComponent);
begin
{*
 0008846C    push        ebx
 0008846D    push        esi
 0008846E    test        dl,dl
>00088470    je          0008847A
 00088472    add         esp,0FFFFFFF0
 00088475    call        @ClassCreate
 0008847A    mov         ebx,edx
 0008847C    mov         esi,eax
 0008847E    xor         edx,edx
 00088480    mov         eax,esi
 00088482    call        TComponent.Create
 00088487    mov         byte ptr [esi+28],5;TMRUFiles.FileCount:byte
 0008848B    mov         byte ptr [esi+3C],1E;TMRUFiles.MaxLength:byte
 0008848F    mov         dl,1
 00088491    mov         eax,[0001F340];TStringList
 00088496    call        TObject.Create;TStringList.Create
 0008849B    mov         dword ptr [esi+30],eax;TMRUFiles.?f30:TStringList
 0008849E    xor         eax,eax
 000884A0    mov         dword ptr [esi+40],eax;TMRUFiles.OnMRUItemClick:TMRUClick
 000884A3    mov         dword ptr [esi+44],eax;TMRUFiles.?f44:TFormMain
 000884A6    lea         eax,[esi+34];TMRUFiles.IniFile:String
 000884A9    mov         edx,884E8;'<AppIniName>'
 000884AE    call        @LStrAsg
 000884B3    lea         eax,[esi+38];TMRUFiles.IniSection:String
 000884B6    mov         edx,88500;'MRU Files'
 000884BB    call        @LStrAsg
 000884C0    mov         byte ptr [esi+3D],1;TMRUFiles.ShortCut:Boolean
 000884C4    mov         eax,esi
 000884C6    test        bl,bl
>000884C8    je          000884D9
 000884CA    call        @AfterConstruction
 000884CF    pop         dword ptr fs:[0]
 000884D6    add         esp,0C
 000884D9    mov         eax,esi
 000884DB    pop         esi
 000884DC    pop         ebx
 000884DD    ret
*}
end;

//0008850C
destructor TMRUFiles.Destroy;
begin
{*
 0008850C    push        ebx
 0008850D    push        esi
 0008850E    call        @BeforeDestruction
 00088513    mov         ebx,edx
 00088515    mov         esi,eax
 00088517    test        byte ptr [esi+20],10;TMRUFiles.FComponentState:TComponentState
>0008851B    jne         00088524
 0008851D    mov         eax,esi
 0008851F    call        00088BA4
 00088524    mov         eax,dword ptr [esi+30];TMRUFiles.?f30:TStringList
 00088527    call        TObject.Free
 0008852C    mov         edx,ebx
 0008852E    and         dl,0FC
 00088531    mov         eax,esi
 00088533    call        TComponent.Destroy
 00088538    test        bl,bl
>0008853A    jle         00088543
 0008853C    mov         eax,esi
 0008853E    call        @ClassDestroy
 00088543    pop         esi
 00088544    pop         ebx
 00088545    ret
*}
end;

//00088548
procedure TMRUFiles.Loaded;
begin
{*
 00088548    test        byte ptr [eax+20],10;TMRUFiles.FComponentState:TComponentState
>0008854C    jne         00088553
 0008854E    call        00088A60
 00088553    ret
*}
end;

//00088554
procedure TMRUFiles.SetFileCount(Value:Byte);
begin
{*
 00088554    push        ebx
 00088555    push        esi
 00088556    push        edi
 00088557    mov         ebx,edx
 00088559    mov         esi,eax
 0008855B    mov         al,byte ptr [esi+28];TMRUFiles.FileCount:byte
 0008855E    cmp         bl,al
>00088560    je          00088596
 00088562    cmp         al,bl
>00088564    jbe         0008858C
>00088566    jmp         0008857C
 00088568    mov         edi,dword ptr [esi+30];TMRUFiles.?f30:TStringList
 0008856B    mov         eax,edi
 0008856D    mov         edx,dword ptr [eax]
 0008856F    call        dword ptr [edx+14];TStringList.GetCount
 00088572    mov         edx,eax
 00088574    dec         edx
 00088575    mov         eax,edi
 00088577    mov         ecx,dword ptr [eax]
 00088579    call        dword ptr [ecx+44];TStringList.Delete
 0008857C    mov         eax,dword ptr [esi+30];TMRUFiles.?f30:TStringList
 0008857F    mov         edx,dword ptr [eax]
 00088581    call        dword ptr [edx+14];TStringList.GetCount
 00088584    xor         edx,edx
 00088586    mov         dl,bl
 00088588    cmp         eax,edx
>0008858A    jg          00088568
 0008858C    mov         byte ptr [esi+28],bl;TMRUFiles.FileCount:byte
 0008858F    mov         eax,esi
 00088591    mov         edx,dword ptr [eax]
 00088593    call        dword ptr [edx+30];TMRUFiles.sub_00088728
 00088596    pop         edi
 00088597    pop         esi
 00088598    pop         ebx
 00088599    ret
*}
end;

//0008859C
procedure TMRUFiles.SetFileMenu(Value:TMenuItem);
begin
{*
 0008859C    push        ebx
 0008859D    push        esi
 0008859E    mov         esi,edx
 000885A0    mov         ebx,eax
 000885A2    mov         eax,ebx
 000885A4    call        0008898C
 000885A9    mov         dword ptr [ebx+2C],esi;TMRUFiles.FileMenu:TMenuItem
 000885AC    mov         eax,ebx
 000885AE    mov         edx,dword ptr [eax]
 000885B0    call        dword ptr [edx+30];TMRUFiles.sub_00088728
 000885B3    pop         esi
 000885B4    pop         ebx
 000885B5    ret
*}
end;

//000885B8
procedure TMRUFiles.SetShortCut(Value:Boolean);
begin
{*
 000885B8    cmp         dl,byte ptr [eax+3D];TMRUFiles.ShortCut:Boolean
>000885BB    je          000885C5
 000885BD    mov         byte ptr [eax+3D],dl;TMRUFiles.ShortCut:Boolean
 000885C0    mov         edx,dword ptr [eax]
 000885C2    call        dword ptr [edx+30];TMRUFiles.sub_00088728
 000885C5    ret
*}
end;

//000885C8
procedure TMRUFiles.SetMaxLength(Value:Byte);
begin
{*
 000885C8    cmp         dl,byte ptr [eax+3C];TMRUFiles.MaxLength:byte
>000885CB    je          000885D5
 000885CD    mov         byte ptr [eax+3C],dl;TMRUFiles.MaxLength:byte
 000885D0    mov         edx,dword ptr [eax]
 000885D2    call        dword ptr [edx+30];TMRUFiles.sub_00088728
 000885D5    ret
*}
end;

//0008868C
{*procedure sub_0008868C(?:TMRUFiles; ?:?);
begin
 0008868C    push        ebp
 0008868D    mov         ebp,esp
 0008868F    push        ecx
 00088690    push        ebx
 00088691    push        esi
 00088692    mov         dword ptr [ebp-4],edx
 00088695    mov         esi,eax
 00088697    mov         eax,dword ptr [ebp-4]
 0008869A    call        @LStrAddRef
 0008869F    xor         eax,eax
 000886A1    push        ebp
 000886A2    push        8871C
 000886A7    push        dword ptr fs:[eax]
 000886AA    mov         dword ptr fs:[eax],esp
 000886AD    mov         edx,dword ptr [ebp-4]
 000886B0    mov         eax,dword ptr [esi+30]
 000886B3    mov         ecx,dword ptr [eax]
 000886B5    call        dword ptr [ecx+50]
 000886B8    cmp         eax,0FFFFFFFF
>000886BB    jle         000886CB
 000886BD    xor         ecx,ecx
 000886BF    mov         edx,eax
 000886C1    mov         eax,dword ptr [esi+30]
 000886C4    mov         ebx,dword ptr [eax]
 000886C6    call        dword ptr [ebx+60]
>000886C9    jmp         000886FF
 000886CB    mov         ecx,dword ptr [ebp-4]
 000886CE    xor         edx,edx
 000886D0    mov         eax,dword ptr [esi+30]
 000886D3    mov         ebx,dword ptr [eax]
 000886D5    call        dword ptr [ebx+54]
>000886D8    jmp         000886EE
 000886DA    mov         ebx,dword ptr [esi+30]
 000886DD    mov         eax,ebx
 000886DF    mov         edx,dword ptr [eax]
 000886E1    call        dword ptr [edx+14]
 000886E4    mov         edx,eax
 000886E6    dec         edx
 000886E7    mov         eax,ebx
 000886E9    mov         ecx,dword ptr [eax]
 000886EB    call        dword ptr [ecx+44]
 000886EE    mov         eax,dword ptr [esi+30]
 000886F1    mov         edx,dword ptr [eax]
 000886F3    call        dword ptr [edx+14]
 000886F6    xor         edx,edx
 000886F8    mov         dl,byte ptr [esi+28]
 000886FB    cmp         eax,edx
>000886FD    jg          000886DA
 000886FF    mov         eax,esi
 00088701    mov         edx,dword ptr [eax]
 00088703    call        dword ptr [edx+30]
 00088706    xor         eax,eax
 00088708    pop         edx
 00088709    pop         ecx
 0008870A    pop         ecx
 0008870B    mov         dword ptr fs:[eax],edx
 0008870E    push        88723
 00088713    lea         eax,[ebp-4]
 00088716    call        @LStrClr
 0008871B    ret
>0008871C    jmp         @HandleFinally
>00088721    jmp         00088713
 00088723    pop         esi
 00088724    pop         ebx
 00088725    pop         ecx
 00088726    pop         ebp
 00088727    ret
end;*}

//00088728
procedure sub_00088728;
begin
{*
 00088728    push        ebp
 00088729    mov         ebp,esp
 0008872B    add         esp,0FFFFFFE0
 0008872E    push        ebx
 0008872F    push        esi
 00088730    push        edi
 00088731    xor         edx,edx
 00088733    mov         dword ptr [ebp-1C],edx
 00088736    mov         dword ptr [ebp-20],edx
 00088739    mov         dword ptr [ebp-14],edx
 0008873C    mov         ebx,eax
 0008873E    xor         eax,eax
 00088740    push        ebp
 00088741    push        8893A
 00088746    push        dword ptr fs:[eax]
 00088749    mov         dword ptr fs:[eax],esp
 0008874C    cmp         dword ptr [ebx+2C],0;TMRUFiles.FileMenu:TMenuItem
>00088750    je          00088917
 00088756    mov         eax,ebx
 00088758    call        0008898C
 0008875D    mov         esi,dword ptr [ebx+2C];TMRUFiles.FileMenu:TMenuItem
 00088760    mov         eax,dword ptr [esi+24];TMenuItem.Caption:String
 00088763    mov         edx,88950;'-'
 00088768    call        @LStrCmp
 0008876D    setne       byte ptr [ebp-1]
 00088771    cmp         byte ptr [ebp-1],0
>00088775    je          00088789
 00088777    mov         eax,esi
 00088779    call        TMenuItem.GetCount
 0008877E    mov         dword ptr [ebp-10],eax
 00088781    mov         eax,dword ptr [ebx+2C];TMRUFiles.FileMenu:TMenuItem
 00088784    mov         dword ptr [ebp-8],eax
>00088787    jmp         0008879D
 00088789    mov         eax,esi
 0008878B    call        TMenuItem.GetMenuIndex
 00088790    inc         eax
 00088791    mov         dword ptr [ebp-10],eax
 00088794    mov         eax,dword ptr [ebx+2C];TMRUFiles.FileMenu:TMenuItem
 00088797    mov         eax,dword ptr [eax+58];TMenuItem.FParent:TMenuItem
 0008879A    mov         dword ptr [ebp-8],eax
 0008879D    test        byte ptr [ebx+20],10;TMRUFiles.FComponentState:TComponentState
 000887A1    setne       al
 000887A4    xor         al,1
 000887A6    and         al,byte ptr [ebp-1]
>000887A9    je          000887CC
 000887AB    mov         eax,dword ptr [ebp-8]
 000887AE    call        TMenuItem.GetCount
 000887B3    test        eax,eax
>000887B5    jne         000887CC
 000887B7    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 000887BA    mov         edx,dword ptr [eax]
 000887BC    call        dword ptr [edx+14];TStringList.GetCount
 000887BF    test        eax,eax
 000887C1    setg        dl
 000887C4    mov         eax,dword ptr [ebx+2C];TMRUFiles.FileMenu:TMenuItem
 000887C7    call        TMenuItem.SetEnabled
 000887CC    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 000887CF    mov         edx,dword ptr [eax]
 000887D1    call        dword ptr [edx+14];TStringList.GetCount
 000887D4    test        eax,eax
>000887D6    je          00088917
 000887DC    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 000887DF    mov         edx,dword ptr [eax]
 000887E1    call        dword ptr [edx+14];TStringList.GetCount
 000887E4    dec         eax
 000887E5    test        eax,eax
>000887E7    jl          000888CE
 000887ED    inc         eax
 000887EE    mov         dword ptr [ebp-18],eax
 000887F1    mov         dword ptr [ebp-0C],0
 000887F8    mov         ecx,dword ptr [ebp-8]
 000887FB    mov         dl,1
 000887FD    mov         eax,[0004FE44];TMenuItem
 00088802    call        TMenuItem.Create;TMenuItem.Create
 00088807    mov         esi,eax
 00088809    lea         edx,[ebp-20]
 0008880C    mov         eax,dword ptr [ebp-0C]
 0008880F    call        IntToStr
 00088814    mov         ecx,dword ptr [ebp-20]
 00088817    lea         eax,[ebp-1C]
 0008881A    mov         edx,8895C;'__MRU_'
 0008881F    call        @LStrCat3
 00088824    mov         edx,dword ptr [ebp-1C]
 00088827    mov         eax,esi
 00088829    mov         ecx,dword ptr [eax]
 0008882B    call        dword ptr [ecx+18];TComponent.SetName
 0008882E    lea         ecx,[ebp-14]
 00088831    mov         edx,dword ptr [ebp-0C]
 00088834    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088837    mov         edi,dword ptr [eax]
 00088839    call        dword ptr [edi+0C];TStringList.Get
 0008883C    cmp         byte ptr [ebx+3C],0;TMRUFiles.MaxLength:byte
>00088840    jbe         00088862
 00088842    push        1
 00088844    lea         eax,[ebp-1C]
 00088847    push        eax
 00088848    xor         edx,edx
 0008884A    mov         dl,byte ptr [ebx+3C];TMRUFiles.MaxLength:byte
 0008884D    mov         cl,1
 0008884F    mov         eax,dword ptr [ebp-14]
 00088852    call        000798A8
 00088857    mov         edx,dword ptr [ebp-1C]
 0008885A    lea         eax,[ebp-14]
 0008885D    call        @LStrLAsg
 00088862    cmp         byte ptr [ebx+3D],0;TMRUFiles.ShortCut:Boolean
>00088866    je          0008889E
 00088868    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 0008886B    mov         edx,dword ptr [eax]
 0008886D    call        dword ptr [edx+14];TStringList.GetCount
 00088870    cmp         eax,0A
>00088873    jge         0008889E
 00088875    push        8896C;'&'
 0008887A    lea         edx,[ebp-1C]
 0008887D    mov         eax,dword ptr [ebp-0C]
 00088880    inc         eax
 00088881    call        IntToStr
 00088886    push        dword ptr [ebp-1C]
 00088889    push        88978;' '
 0008888E    push        dword ptr [ebp-14]
 00088891    lea         eax,[ebp-14]
 00088894    mov         edx,4
 00088899    call        @LStrCatN
 0008889E    mov         edx,dword ptr [ebp-14]
 000888A1    mov         eax,esi
 000888A3    call        TMenuItem.SetCaption
 000888A8    mov         dword ptr [esi+78],ebx;TMenuItem.?f78:TMRUFiles
 000888AB    mov         dword ptr [esi+74],885D8;TMenuItem.OnClick:TNotifyEvent
 000888B2    mov         ecx,esi
 000888B4    mov         edx,dword ptr [ebp-10]
 000888B7    mov         eax,dword ptr [ebp-8]
 000888BA    call        TMenuItem.Insert
 000888BF    inc         dword ptr [ebp-10]
 000888C2    inc         dword ptr [ebp-0C]
 000888C5    dec         dword ptr [ebp-18]
>000888C8    jne         000887F8
 000888CE    cmp         byte ptr [ebp-1],0
>000888D2    jne         00088917
 000888D4    mov         eax,dword ptr [ebp-8]
 000888D7    call        TMenuItem.GetCount
 000888DC    cmp         eax,dword ptr [ebp-10]
>000888DF    jle         00088917
 000888E1    mov         ecx,dword ptr [ebp-8]
 000888E4    mov         dl,1
 000888E6    mov         eax,[0004FE44];TMenuItem
 000888EB    call        TMenuItem.Create;TMenuItem.Create
 000888F0    mov         esi,eax
 000888F2    mov         edx,88984;'__MRU__'
 000888F7    mov         eax,esi
 000888F9    mov         ecx,dword ptr [eax]
 000888FB    call        dword ptr [ecx+18];TComponent.SetName
 000888FE    mov         edx,88950;'-'
 00088903    mov         eax,esi
 00088905    call        TMenuItem.SetCaption
 0008890A    mov         ecx,esi
 0008890C    mov         edx,dword ptr [ebp-10]
 0008890F    mov         eax,dword ptr [ebp-8]
 00088912    call        TMenuItem.Insert
 00088917    xor         eax,eax
 00088919    pop         edx
 0008891A    pop         ecx
 0008891B    pop         ecx
 0008891C    mov         dword ptr fs:[eax],edx
 0008891F    push        88941
 00088924    lea         eax,[ebp-20]
 00088927    mov         edx,2
 0008892C    call        @LStrArrayClr
 00088931    lea         eax,[ebp-14]
 00088934    call        @LStrClr
 00088939    ret
>0008893A    jmp         @HandleFinally
>0008893F    jmp         00088924
 00088941    pop         edi
 00088942    pop         esi
 00088943    pop         ebx
 00088944    mov         esp,ebp
 00088946    pop         ebp
 00088947    ret
*}
end;

//0008898C
procedure sub_0008898C(?:TMRUFiles);
begin
{*
 0008898C    push        ebp
 0008898D    mov         ebp,esp
 0008898F    push        0
 00088991    push        ebx
 00088992    push        esi
 00088993    push        edi
 00088994    mov         ebx,eax
 00088996    xor         eax,eax
 00088998    push        ebp
 00088999    push        88A36
 0008899E    push        dword ptr fs:[eax]
 000889A1    mov         dword ptr fs:[eax],esp
 000889A4    mov         esi,dword ptr [ebx+2C];TMRUFiles.FileMenu:TMenuItem
 000889A7    test        esi,esi
>000889A9    je          00088A20
 000889AB    mov         eax,dword ptr [esi+24];TMenuItem.Caption:String
 000889AE    mov         edx,88A4C;'-'
 000889B3    call        @LStrCmp
 000889B8    setne       al
 000889BB    test        al,al
>000889BD    jne         000889C2
 000889BF    mov         esi,dword ptr [esi+58];TMenuItem.FParent:TMenuItem
 000889C2    mov         eax,esi
 000889C4    call        TMenuItem.GetCount
 000889C9    mov         ebx,eax
 000889CB    dec         ebx
 000889CC    cmp         ebx,0
>000889CF    jl          00088A20
 000889D1    lea         eax,[ebp-4]
 000889D4    push        eax
 000889D5    mov         edx,ebx
 000889D7    mov         eax,esi
 000889D9    call        TMenuItem.GetItem
 000889DE    mov         eax,dword ptr [eax+8];TMenuItem.Name:TComponentName
 000889E1    mov         ecx,6
 000889E6    mov         edx,1
 000889EB    call        @LStrCopy
 000889F0    mov         eax,dword ptr [ebp-4]
 000889F3    mov         edx,88A58;'__MRU_'
 000889F8    call        @LStrCmp
>000889FD    jne         00088A1A
 000889FF    mov         edx,ebx
 00088A01    mov         eax,esi
 00088A03    call        TMenuItem.GetItem
 00088A08    mov         edi,eax
 00088A0A    mov         edx,ebx
 00088A0C    mov         eax,esi
 00088A0E    call        TMenuItem.Delete
 00088A13    mov         eax,edi
 00088A15    call        TObject.Free
 00088A1A    dec         ebx
 00088A1B    cmp         ebx,0FFFFFFFF
>00088A1E    jne         000889D1
 00088A20    xor         eax,eax
 00088A22    pop         edx
 00088A23    pop         ecx
 00088A24    pop         ecx
 00088A25    mov         dword ptr fs:[eax],edx
 00088A28    push        88A3D
 00088A2D    lea         eax,[ebp-4]
 00088A30    call        @LStrClr
 00088A35    ret
>00088A36    jmp         @HandleFinally
>00088A3B    jmp         00088A2D
 00088A3D    pop         edi
 00088A3E    pop         esi
 00088A3F    pop         ebx
 00088A40    pop         ecx
 00088A41    pop         ebp
 00088A42    ret
*}
end;

//00088A60
{*function sub_00088A60(?:TMRUFiles):?;
begin
 00088A60    push        ebp
 00088A61    mov         ebp,esp
 00088A63    add         esp,0FFFFFFF4
 00088A66    push        ebx
 00088A67    push        esi
 00088A68    push        edi
 00088A69    xor         edx,edx
 00088A6B    mov         dword ptr [ebp-0C],edx
 00088A6E    mov         ebx,eax
 00088A70    xor         eax,eax
 00088A72    push        ebp
 00088A73    push        88B7B
 00088A78    push        dword ptr fs:[eax]
 00088A7B    mov         dword ptr fs:[eax],esp
 00088A7E    mov         byte ptr [ebp-1],0
 00088A82    cmp         dword ptr [ebx+34],0;TMRUFiles.IniFile:String
>00088A86    je          00088B65
 00088A8C    cmp         dword ptr [ebx+38],0;TMRUFiles.IniSection:String
>00088A90    je          00088B65
 00088A96    mov         eax,dword ptr [ebx+34];TMRUFiles.IniFile:String
 00088A99    mov         edx,88B94;'<AppIniName>'
 00088A9E    call        AnsiCompareText
 00088AA3    test        eax,eax
>00088AA5    jne         00088AB1
 00088AA7    lea         eax,[ebp-0C]
 00088AAA    call        00086D5C
>00088AAF    jmp         00088ABC
 00088AB1    lea         eax,[ebp-0C]
 00088AB4    mov         edx,dword ptr [ebx+34];TMRUFiles.IniFile:String
 00088AB7    call        @LStrLAsg
 00088ABC    mov         ecx,dword ptr [ebp-0C]
 00088ABF    mov         dl,1
 00088AC1    mov         eax,[0007792C];TIniFile
 00088AC6    call        TCustomIniFile.Create;TIniFile.Create
 00088ACB    mov         dword ptr [ebp-8],eax
 00088ACE    xor         eax,eax
 00088AD0    push        ebp
 00088AD1    push        88B5E
 00088AD6    push        dword ptr fs:[eax]
 00088AD9    mov         dword ptr fs:[eax],esp
 00088ADC    xor         eax,eax
 00088ADE    push        ebp
 00088ADF    push        88B3E
 00088AE4    push        dword ptr fs:[eax]
 00088AE7    mov         dword ptr fs:[eax],esp
 00088AEA    mov         ecx,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088AED    mov         edx,dword ptr [ebx+38];TMRUFiles.IniSection:String
 00088AF0    mov         eax,dword ptr [ebp-8]
 00088AF3    mov         esi,dword ptr [eax]
 00088AF5    call        dword ptr [esi+40];TIniFile.ReadSectionValues
 00088AF8    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088AFB    xor         edx,edx
 00088AFD    call        0007446C
>00088B02    jmp         00088B18
 00088B04    mov         esi,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088B07    mov         eax,esi
 00088B09    mov         edx,dword ptr [eax]
 00088B0B    call        dword ptr [edx+14];TStringList.GetCount
 00088B0E    mov         edx,eax
 00088B10    dec         edx
 00088B11    mov         eax,esi
 00088B13    mov         ecx,dword ptr [eax]
 00088B15    call        dword ptr [ecx+44];TStringList.Delete
 00088B18    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088B1B    mov         edx,dword ptr [eax]
 00088B1D    call        dword ptr [edx+14];TStringList.GetCount
 00088B20    xor         edx,edx
 00088B22    mov         dl,byte ptr [ebx+28];TMRUFiles.FileCount:byte
 00088B25    cmp         eax,edx
>00088B27    jg          00088B04
 00088B29    mov         eax,ebx
 00088B2B    mov         edx,dword ptr [eax]
 00088B2D    call        dword ptr [edx+30];TMRUFiles.sub_00088728
 00088B30    mov         byte ptr [ebp-1],1
 00088B34    xor         eax,eax
 00088B36    pop         edx
 00088B37    pop         ecx
 00088B38    pop         ecx
 00088B39    mov         dword ptr fs:[eax],edx
>00088B3C    jmp         00088B48
>00088B3E    jmp         @HandleAnyException
 00088B43    call        @DoneExcept
 00088B48    xor         eax,eax
 00088B4A    pop         edx
 00088B4B    pop         ecx
 00088B4C    pop         ecx
 00088B4D    mov         dword ptr fs:[eax],edx
 00088B50    push        88B65
 00088B55    mov         eax,dword ptr [ebp-8]
 00088B58    call        TObject.Free
 00088B5D    ret
>00088B5E    jmp         @HandleFinally
>00088B63    jmp         00088B55
 00088B65    xor         eax,eax
 00088B67    pop         edx
 00088B68    pop         ecx
 00088B69    pop         ecx
 00088B6A    mov         dword ptr fs:[eax],edx
 00088B6D    push        88B82
 00088B72    lea         eax,[ebp-0C]
 00088B75    call        @LStrClr
 00088B7A    ret
>00088B7B    jmp         @HandleFinally
>00088B80    jmp         00088B72
 00088B82    mov         al,byte ptr [ebp-1]
 00088B85    pop         edi
 00088B86    pop         esi
 00088B87    pop         ebx
 00088B88    mov         esp,ebp
 00088B8A    pop         ebp
 00088B8B    ret
end;*}

//00088BA4
{*function sub_00088BA4(?:TMRUFiles):?;
begin
 00088BA4    push        ebp
 00088BA5    mov         ebp,esp
 00088BA7    add         esp,0FFFFFFE8
 00088BAA    push        ebx
 00088BAB    push        esi
 00088BAC    push        edi
 00088BAD    xor         edx,edx
 00088BAF    mov         dword ptr [ebp-14],edx
 00088BB2    mov         dword ptr [ebp-18],edx
 00088BB5    mov         dword ptr [ebp-0C],edx
 00088BB8    mov         ebx,eax
 00088BBA    xor         eax,eax
 00088BBC    push        ebp
 00088BBD    push        88CD9
 00088BC2    push        dword ptr fs:[eax]
 00088BC5    mov         dword ptr fs:[eax],esp
 00088BC8    mov         byte ptr [ebp-1],0
 00088BCC    cmp         dword ptr [ebx+34],0;TMRUFiles.IniFile:String
>00088BD0    je          00088CB6
 00088BD6    cmp         dword ptr [ebx+38],0;TMRUFiles.IniSection:String
>00088BDA    je          00088CB6
 00088BE0    mov         eax,dword ptr [ebx+34];TMRUFiles.IniFile:String
 00088BE3    mov         edx,88CF4;'<AppIniName>'
 00088BE8    call        AnsiCompareText
 00088BED    test        eax,eax
>00088BEF    jne         00088BFB
 00088BF1    lea         eax,[ebp-0C]
 00088BF4    call        00086D5C
>00088BF9    jmp         00088C06
 00088BFB    lea         eax,[ebp-0C]
 00088BFE    mov         edx,dword ptr [ebx+34];TMRUFiles.IniFile:String
 00088C01    call        @LStrLAsg
 00088C06    mov         ecx,dword ptr [ebp-0C]
 00088C09    mov         dl,1
 00088C0B    mov         eax,[0007792C];TIniFile
 00088C10    call        TCustomIniFile.Create;TIniFile.Create
 00088C15    mov         dword ptr [ebp-8],eax
 00088C18    xor         eax,eax
 00088C1A    push        ebp
 00088C1B    push        88CAF
 00088C20    push        dword ptr fs:[eax]
 00088C23    mov         dword ptr fs:[eax],esp
 00088C26    xor         eax,eax
 00088C28    push        ebp
 00088C29    push        88C8F
 00088C2E    push        dword ptr fs:[eax]
 00088C31    mov         dword ptr fs:[eax],esp
 00088C34    mov         edx,dword ptr [ebx+38];TMRUFiles.IniSection:String
 00088C37    mov         eax,dword ptr [ebp-8]
 00088C3A    mov         ecx,dword ptr [eax]
 00088C3C    call        dword ptr [ecx+44];TIniFile.EraseSection
 00088C3F    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088C42    mov         edx,dword ptr [eax]
 00088C44    call        dword ptr [edx+14];TStringList.GetCount
 00088C47    dec         eax
 00088C48    test        eax,eax
>00088C4A    jl          00088C81
 00088C4C    inc         eax
 00088C4D    mov         dword ptr [ebp-10],eax
 00088C50    xor         esi,esi
 00088C52    lea         ecx,[ebp-14]
 00088C55    mov         eax,dword ptr [ebx+30];TMRUFiles.?f30:TStringList
 00088C58    mov         edx,esi
 00088C5A    mov         edi,dword ptr [eax]
 00088C5C    call        dword ptr [edi+0C];TStringList.Get
 00088C5F    mov         eax,dword ptr [ebp-14]
 00088C62    push        eax
 00088C63    lea         edx,[ebp-18]
 00088C66    mov         eax,esi
 00088C68    call        IntToStr
 00088C6D    mov         ecx,dword ptr [ebp-18]
 00088C70    mov         edx,dword ptr [ebx+38];TMRUFiles.IniSection:String
 00088C73    mov         eax,dword ptr [ebp-8]
 00088C76    mov         edi,dword ptr [eax]
 00088C78    call        dword ptr [edi+4];TIniFile.WriteString
 00088C7B    inc         esi
 00088C7C    dec         dword ptr [ebp-10]
>00088C7F    jne         00088C52
 00088C81    mov         byte ptr [ebp-1],1
 00088C85    xor         eax,eax
 00088C87    pop         edx
 00088C88    pop         ecx
 00088C89    pop         ecx
 00088C8A    mov         dword ptr fs:[eax],edx
>00088C8D    jmp         00088C99
>00088C8F    jmp         @HandleAnyException
 00088C94    call        @DoneExcept
 00088C99    xor         eax,eax
 00088C9B    pop         edx
 00088C9C    pop         ecx
 00088C9D    pop         ecx
 00088C9E    mov         dword ptr fs:[eax],edx
 00088CA1    push        88CB6
 00088CA6    mov         eax,dword ptr [ebp-8]
 00088CA9    call        TObject.Free
 00088CAE    ret
>00088CAF    jmp         @HandleFinally
>00088CB4    jmp         00088CA6
 00088CB6    xor         eax,eax
 00088CB8    pop         edx
 00088CB9    pop         ecx
 00088CBA    pop         ecx
 00088CBB    mov         dword ptr fs:[eax],edx
 00088CBE    push        88CE0
 00088CC3    lea         eax,[ebp-18]
 00088CC6    mov         edx,2
 00088CCB    call        @LStrArrayClr
 00088CD0    lea         eax,[ebp-0C]
 00088CD3    call        @LStrClr
 00088CD8    ret
>00088CD9    jmp         @HandleFinally
>00088CDE    jmp         00088CC3
 00088CE0    mov         al,byte ptr [ebp-1]
 00088CE3    pop         edi
 00088CE4    pop         esi
 00088CE5    pop         ebx
 00088CE6    mov         esp,ebp
 00088CE8    pop         ebp
 00088CE9    ret
end;*}

//00088D04
procedure TMRUFiles.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00088D04    push        ebx
 00088D05    push        esi
 00088D06    push        edi
 00088D07    mov         ebx,ecx
 00088D09    mov         esi,edx
 00088D0B    mov         edi,eax
 00088D0D    mov         ecx,ebx
 00088D0F    mov         edx,esi
 00088D11    mov         eax,edi
 00088D13    call        TComponent.Notification
 00088D18    test        byte ptr [edi+20],10;TMRUFiles.FComponentState:TComponentState
>00088D1C    je          00088D2D
 00088D1E    cmp         bl,1
>00088D21    jne         00088D2D
 00088D23    cmp         esi,dword ptr [edi+2C];TMRUFiles.FileMenu:TMenuItem
>00088D26    jne         00088D2D
 00088D28    xor         eax,eax
 00088D2A    mov         dword ptr [edi+2C],eax;TMRUFiles.FileMenu:TMenuItem
 00088D2D    pop         edi
 00088D2E    pop         esi
 00088D2F    pop         ebx
 00088D30    ret
*}
end;

//00088D34
constructor TFileDrop.Create(AOwner:TComponent);
begin
{*
 00088D34    push        ebx
 00088D35    push        esi
 00088D36    test        dl,dl
>00088D38    je          00088D42
 00088D3A    add         esp,0FFFFFFF0
 00088D3D    call        @ClassCreate
 00088D42    mov         ebx,edx
 00088D44    mov         esi,eax
 00088D46    xor         edx,edx
 00088D48    mov         eax,esi
 00088D4A    call        TComponent.Create
 00088D4F    mov         dl,1
 00088D51    mov         eax,[0001F340];TStringList
 00088D56    call        TObject.Create;TStringList.Create
 00088D5B    mov         dword ptr [esi+24],eax;TFileDrop.?f24:TStringList
 00088D5E    xor         eax,eax
 00088D60    mov         dword ptr [esi+2C],eax;TFileDrop.?f2C:HWND
 00088D63    mov         eax,esi
 00088D65    call        00088DD0
 00088D6A    mov         dl,1
 00088D6C    mov         eax,esi
 00088D6E    call        TFileDrop.SetEnabled
 00088D73    mov         eax,esi
 00088D75    test        bl,bl
>00088D77    je          00088D88
 00088D79    call        @AfterConstruction
 00088D7E    pop         dword ptr fs:[0]
 00088D85    add         esp,0C
 00088D88    mov         eax,esi
 00088D8A    pop         esi
 00088D8B    pop         ebx
 00088D8C    ret
*}
end;

//00088D90
destructor TFileDrop.Destroy;
begin
{*
 00088D90    push        ebx
 00088D91    push        esi
 00088D92    call        @BeforeDestruction
 00088D97    mov         ebx,edx
 00088D99    mov         esi,eax
 00088D9B    mov         eax,esi
 00088D9D    call        00088E28
 00088DA2    xor         edx,edx
 00088DA4    mov         eax,esi
 00088DA6    call        TFileDrop.SetEnabled
 00088DAB    mov         eax,dword ptr [esi+24];TFileDrop.?f24:TStringList
 00088DAE    call        TObject.Free
 00088DB3    mov         edx,ebx
 00088DB5    and         dl,0FC
 00088DB8    mov         eax,esi
 00088DBA    call        TComponent.Destroy
 00088DBF    test        bl,bl
>00088DC1    jle         00088DCA
 00088DC3    mov         eax,esi
 00088DC5    call        @ClassDestroy
 00088DCA    pop         esi
 00088DCB    pop         ebx
 00088DCC    ret
*}
end;

//00088DD0
procedure sub_00088DD0(?:TFileDrop);
begin
{*
 00088DD0    push        ebx
 00088DD1    push        esi
 00088DD2    mov         ebx,eax
 00088DD4    mov         esi,dword ptr [ebx+4];TFileDrop.FOwner:TComponent
 00088DD7    mov         eax,esi
 00088DD9    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00088DDF    call        @IsClass
 00088DE4    test        al,al
>00088DE6    je          00088E20
 00088DE8    mov         eax,esi
 00088DEA    call        TWinControl.GetHandle
 00088DEF    mov         dword ptr [ebx+2C],eax;TFileDrop.?f2C:HWND
 00088DF2    push        ebx
 00088DF3    push        88E5C
 00088DF8    call        MakeObjectInstance
 00088DFD    mov         dword ptr [ebx+34],eax;TFileDrop.?f34:Pointer
 00088E00    push        0FC
 00088E02    mov         eax,dword ptr [ebx+2C];TFileDrop.?f2C:HWND
 00088E05    push        eax
 00088E06    call        user32.GetWindowLongA
 00088E0B    mov         dword ptr [ebx+30],eax;TFileDrop.?f30:Longint
 00088E0E    mov         eax,dword ptr [ebx+34];TFileDrop.?f34:Pointer
 00088E11    push        eax
 00088E12    push        0FC
 00088E14    mov         eax,dword ptr [ebx+2C];TFileDrop.?f2C:HWND
 00088E17    push        eax
 00088E18    call        user32.SetWindowLongA
 00088E1D    pop         esi
 00088E1E    pop         ebx
 00088E1F    ret
 00088E20    mov         byte ptr [ebx+28],0;TFileDrop.Enabled:Boolean
 00088E24    pop         esi
 00088E25    pop         ebx
 00088E26    ret
*}
end;

//00088E28
procedure sub_00088E28(?:TFileDrop);
begin
{*
 00088E28    push        ebx
 00088E29    mov         ebx,eax
 00088E2B    mov         eax,dword ptr [ebx+2C];TFileDrop.?f2C:HWND
 00088E2E    test        eax,eax
>00088E30    je          00088E46
 00088E32    mov         edx,dword ptr [ebx+30];TFileDrop.?f30:Longint
 00088E35    push        edx
 00088E36    push        0FC
 00088E38    push        eax
 00088E39    call        user32.SetWindowLongA
 00088E3E    mov         eax,dword ptr [ebx+34];TFileDrop.?f34:Pointer
 00088E41    call        FreeObjectInstance
 00088E46    pop         ebx
 00088E47    ret
*}
end;

//00088E48
procedure TFileDrop.SetEnabled(Value:Boolean);
begin
{*
 00088E48    mov         ecx,edx
 00088E4A    mov         byte ptr [eax+28],cl;TFileDrop.Enabled:Boolean
 00088E4D    neg         cl
 00088E4F    sbb         edx,edx
 00088E51    push        edx
 00088E52    mov         eax,dword ptr [eax+2C];TFileDrop.?f2C:HWND
 00088E55    push        eax
 00088E56    call        shell32.DragAcceptFiles
 00088E5B    ret
*}
end;

end.