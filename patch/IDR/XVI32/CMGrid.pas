//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMGrid;

interface

uses
  SysUtils, Classes, Grids;

type
  TCMStrGrid = class(TStringGrid)
  public
    .......SlaveGrid:TStringGrid;//f2C8
    constructor Create(AOwner:TComponent); virtual;//v2C//00089114
    //function SelectCell(ACol:Longint; ARow:Longint):?; virtual;//vCC//000891B0
    procedure KeyDown(Key:Word; Shift:TShiftState); dynamic;//00089228
    procedure SetSlaveGrid(Value:TStringGrid);//0008919C
  end;
    constructor Create(AOwner:TComponent);//00089114
    //function SelectCell(ACol:Longint; ARow:Longint):?;//000891B0
    procedure KeyDown(Key:Word; Shift:TShiftState);//00089228
    procedure sub_000892A8(?:TStringGrid; ?:Longint; ?:Longint);//000892A8
    //function sub_000892DC(?:TCMStrGrid; ?:?):?;//000892DC
    //function sub_000892F4(?:TCMStrGrid; ?:?):?;//000892F4

implementation

//00089114
constructor TCMStrGrid.Create(AOwner:TComponent);
begin
{*
 00089114    push        ebx
 00089115    push        esi
 00089116    test        dl,dl
>00089118    je          00089122
 0008911A    add         esp,0FFFFFFF0
 0008911D    call        @ClassCreate
 00089122    mov         ebx,edx
 00089124    mov         esi,eax
 00089126    xor         edx,edx
 00089128    mov         eax,esi
 0008912A    call        TStringGrid.Create
 0008912F    xor         edx,edx
 00089131    mov         eax,esi
 00089133    call        TCustomGrid.SetFixedCols
 00089138    xor         edx,edx
 0008913A    mov         eax,esi
 0008913C    call        TCustomGrid.SetFixedRows
 00089141    mov         ax,[00089194];0x20 gvar_00089194
 00089147    or          ax,word ptr [esi+228];TCMStrGrid.FOptions:TGridOptions
 0008914E    mov         dx,word ptr ds:[89198];0x10 gvar_00089198
 00089155    not         edx
 00089157    and         dx,ax
 0008915A    mov         eax,esi
 0008915C    call        TCustomGrid.SetOptions
 00089161    mov         edx,0C
 00089166    mov         eax,esi
 00089168    call        TCustomGrid.SetDefaultColWidth
 0008916D    mov         edx,0C
 00089172    mov         eax,esi
 00089174    call        TCustomGrid.SetDefaultRowHeight
 00089179    mov         eax,esi
 0008917B    test        bl,bl
>0008917D    je          0008918E
 0008917F    call        @AfterConstruction
 00089184    pop         dword ptr fs:[0]
 0008918B    add         esp,0C
 0008918E    mov         eax,esi
 00089190    pop         esi
 00089191    pop         ebx
 00089192    ret
*}
end;

//0008919C
procedure TCMStrGrid.SetSlaveGrid(Value:TStringGrid);
begin
{*
 0008919C    cmp         edx,dword ptr [eax+2C8];TCMStrGrid.........SlaveGrid:TStringGrid
>000891A2    je          000891AE
 000891A4    cmp         eax,edx
>000891A6    je          000891AE
 000891A8    mov         dword ptr [eax+2C8],edx;TCMStrGrid..........SlaveGrid:TStringGrid
 000891AE    ret
*}
end;

//000891B0
{*function TCMStrGrid.SelectCell(ACol:Longint; ARow:Longint):?;
begin
 000891B0    push        ebx
 000891B1    push        esi
 000891B2    push        edi
 000891B3    push        ebp
 000891B4    mov         ebp,ecx
 000891B6    mov         edi,edx
 000891B8    mov         esi,eax
 000891BA    mov         ecx,ebp
 000891BC    mov         edx,edi
 000891BE    mov         eax,esi
 000891C0    call        TDrawGrid.SelectCell
 000891C5    mov         ebx,eax
 000891C7    test        bl,bl
>000891C9    je          0008921E
 000891CB    cmp         dword ptr [esi+2C8],0;TCMStrGrid...........SlaveGrid:TStringGrid
>000891D2    je          0008921E
 000891D4    cmp         esi,dword ptr [esi+2C8];TCMStrGrid............SlaveGrid:TStringGrid
>000891DA    je          0008921E
 000891DC    mov         eax,dword ptr [esi+2C8];TCMStrGrid.............SlaveGrid:TStringGrid
 000891E2    mov         edx,dword ptr ds:[88F94];TCMStrGrid
 000891E8    call        @IsClass
 000891ED    test        al,al
>000891EF    je          000891FF
 000891F1    mov         eax,dword ptr [esi+2C8];TCMStrGrid..............SlaveGrid:TStringGrid
 000891F7    cmp         esi,dword ptr [eax+2C8]
>000891FD    je          0008921E
 000891FF    mov         eax,dword ptr [esi+2C8];TCMStrGrid...............SlaveGrid:TStringGrid
 00089205    cmp         edi,dword ptr [eax+208];TStringGrid.FCurrent:TGridCoord
>0008920B    jne         00089215
 0008920D    cmp         ebp,dword ptr [eax+20C];TStringGrid.FCurrent:Longint
>00089213    je          0008921E
 00089215    mov         ecx,ebp
 00089217    mov         edx,edi
 00089219    call        000892A8
 0008921E    mov         eax,ebx
 00089220    pop         ebp
 00089221    pop         edi
 00089222    pop         esi
 00089223    pop         ebx
 00089224    ret
end;*}

//00089228
procedure TCMStrGrid.KeyDown(Key:Word; Shift:TShiftState);
begin
{*
 00089228    push        ebx
 00089229    push        esi
 0008922A    push        edi
 0008922B    push        ebp
 0008922C    push        ecx
 0008922D    mov         byte ptr [esp],cl
 00089230    mov         edi,edx
 00089232    mov         ebx,eax
 00089234    mov         esi,dword ptr [ebx+20C];TCMStrGrid.FCurrent:Longint
 0008923A    mov         ebp,dword ptr [ebx+208];TCMStrGrid.FCurrent:TGridCoord
 00089240    mov         edx,edi
 00089242    mov         cl,byte ptr [esp]
 00089245    mov         eax,ebx
 00089247    call        TCustomGrid.KeyDown
 0008924C    cmp         word ptr [edi],25
>00089250    jne         00089272
 00089252    test        ebp,ebp
>00089254    jne         00089272
 00089256    test        esi,esi
>00089258    jle         00089272
 0008925A    mov         edx,esi
 0008925C    dec         edx
 0008925D    mov         eax,ebx
 0008925F    call        TCustomGrid.SetRow
 00089264    mov         edx,dword ptr [ebx+1FC];TCMStrGrid.FColCount:Longint
 0008926A    dec         edx
 0008926B    mov         eax,ebx
 0008926D    call        TCustomGrid.SetCol
 00089272    cmp         word ptr [edi],27
>00089276    jne         000892A1
 00089278    mov         eax,dword ptr [ebx+1FC];TCMStrGrid.FColCount:Longint
 0008927E    dec         eax
 0008927F    cmp         ebp,eax
>00089281    jne         000892A1
 00089283    mov         eax,dword ptr [ebx+22C];TCMStrGrid.FRowCount:Longint
 00089289    dec         eax
 0008928A    cmp         esi,eax
>0008928C    jge         000892A1
 0008928E    xor         edx,edx
 00089290    mov         eax,ebx
 00089292    call        TCustomGrid.SetCol
 00089297    lea         edx,[esi+1]
 0008929A    mov         eax,ebx
 0008929C    call        TCustomGrid.SetRow
 000892A1    pop         edx
 000892A2    pop         ebp
 000892A3    pop         edi
 000892A4    pop         esi
 000892A5    pop         ebx
 000892A6    ret
*}
end;

//000892A8
procedure sub_000892A8(?:TStringGrid; ?:Longint; ?:Longint);
begin
{*
 000892A8    push        esi
 000892A9    add         esp,0FFFFFFF0
 000892AC    mov         esi,eax
 000892AE    mov         dword ptr [esp],edx
 000892B1    mov         dword ptr [esp+4],ecx
 000892B5    mov         dword ptr [esp+8],edx
 000892B9    mov         dword ptr [esp+0C],ecx
 000892BD    mov         edx,esp
 000892BF    mov         eax,esi
 000892C1    call        TCustomGrid.SetSelection
 000892C6    mov         eax,dword ptr [esi+2C8]
 000892CC    test        eax,eax
>000892CE    je          000892D7
 000892D0    mov         edx,esp
 000892D2    call        TCustomGrid.SetSelection
 000892D7    add         esp,10
 000892DA    pop         esi
 000892DB    ret
*}
end;

//000892DC
{*function sub_000892DC(?:TCMStrGrid; ?:?):?;
begin
 000892DC    mov         ecx,edx
 000892DE    imul        ecx,dword ptr [eax+210]
 000892E5    add         edx,4
 000892E8    imul        edx,dword ptr [eax+224]
 000892EF    add         ecx,edx
 000892F1    mov         eax,ecx
 000892F3    ret
end;*}

//000892F4
{*function sub_000892F4(?:TCMStrGrid; ?:?):?;
begin
 000892F4    mov         ecx,edx
 000892F6    imul        ecx,dword ptr [eax+214]
 000892FD    add         edx,4
 00089300    imul        edx,dword ptr [eax+224]
 00089307    add         ecx,edx
 00089309    mov         eax,ecx
 0008930B    ret
end;*}

end.