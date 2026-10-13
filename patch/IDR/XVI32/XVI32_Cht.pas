//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Cht;

interface

uses
  SysUtils, Classes, ExtCtrls, StdCtrls, Grids;

type
  TFormCharTable = class(TForm)
  published
    PanelButtons:TPanel;//f2C4
    ButtonClear:TButton;//f2C8
    ButtonSave:TButton;//f2CC
    ButtonLoad:TButton;//f2D0
    RadioGroupScope:TRadioGroup;//f2D4
    ButtonConvert:TButton;//f2D8
    ButtonCancel:TButton;//f2DC
    ButtonHelp:TButton;//f2E0
    PanelGrid:TPanel;//f2E4
    Timer1:TTimer;//f2E8
    StringGridCharTable:TStringGrid;//f2EC
    procedure StringGridCharTableMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//000A2DF0
    procedure StringGridCharTableDragOver(Sender:TObject; Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//000A2E50
    procedure StringGridCharTableMouseMove(Sender:TObject; Shift:TShiftState; X:Integer; Y:Integer);//000A2DCC
    procedure StringGridCharTableClick(Sender:TObject);//000A2DE0
    procedure FormShow(Sender:TObject);//000A23E8
    procedure FormClose(Sender:TObject; var Action:TCloseAction);//000A3208
    procedure StringGridCharTableEndDrag(Sender:TObject; Target:TObject; X:Integer; Y:Integer);//000A2EB4
    //procedure StringGridCharTableDrawCell(?:?; ?:?);//000A3118
    procedure StringGridCharTableExit(Sender:TObject);//000A2974
    procedure StringGridCharTableKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);//000A2888
    procedure StringGridCharTableSelectCell;//000A28B8
    procedure StringGridCharTableKeyPress(Sender:TObject; var Key:Char);//000A2798
    procedure FormCreate(Sender:TObject);//000A2314
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);//000A25B4
    procedure ButtonHelpClick(Sender:TObject);//000A2DB0
    procedure ButtonConvertClick(Sender:TObject);//000A2DC4
    procedure ButtonLoadClick(Sender:TObject);//000A2BFC
    procedure ButtonClearClick(Sender:TObject);//000A2A34
    procedure ButtonSaveClick(Sender:TObject);//000A2A58
  public
    f2F0:byte;//f2F0
    f2F4:dword;//f2F4
    f2F8:byte;//f2F8
    procedure WMGetMinMaxInfo(Message:TWMGetMinMaxInfo); message WM_GETMINMAXINFO;//000A22C4
    procedure WMNCHitTest(Message:TWMNCHitTest); message WM_NCHITTEST;//000A229C
  end;
    procedure WMNCHitTest(Message:TWMNCHitTest);//000A229C
    procedure WMGetMinMaxInfo(Message:TWMGetMinMaxInfo);//000A22C4
    //function sub_000A25C8(?:TFormCharTable):?;//000A25C8
    procedure sub_000A2700(?:TFormCharTable; ?:Integer; ?:Integer);//000A2700
    procedure sub_000A2F44(?:TFormCharTable);//000A2F44
    procedure sub_000A3074(?:TFormCharTable);//000A3074

implementation

{$R *.DFM}

//000A229C
procedure TFormCharTable.WMNCHitTest(Message:TWMNCHitTest);
begin
{*
 000A229C    push        ebx
 000A229D    mov         ebx,edx
 000A229F    mov         edx,ebx
 000A22A1    call        TWinControl.WMNCHitTest
 000A22A6    mov         eax,dword ptr [ebx+0C]
 000A22A9    add         eax,0FFFFFFF6
 000A22AC    sub         eax,2
>000A22AF    jb          000A22BD
 000A22B1    dec         eax
 000A22B2    sub         eax,2
>000A22B5    jb          000A22BD
 000A22B7    dec         eax
 000A22B8    sub         eax,2
>000A22BB    jae         000A22C2
 000A22BD    xor         eax,eax
 000A22BF    mov         dword ptr [ebx+0C],eax
 000A22C2    pop         ebx
 000A22C3    ret
*}
end;

//000A22C4
procedure TFormCharTable.WMGetMinMaxInfo(Message:TWMGetMinMaxInfo);
begin
{*
 000A22C4    push        ebx
 000A22C5    push        esi
 000A22C6    mov         esi,edx
 000A22C8    mov         ebx,eax
 000A22CA    mov         edx,esi
 000A22CC    mov         eax,ebx
 000A22CE    call        TCustomForm.WMGetMinMaxInfo
 000A22D3    cmp         byte ptr [ebx+2F0],0;TFormCharTable.?f2F0:byte
>000A22DA    jne         000A230E
 000A22DC    mov         edx,dword ptr [esi+8]
 000A22DF    lea         eax,[edx+18]
 000A22E2    mov         ecx,dword ptr [ebx+38];TFormCharTable.Width:Integer
 000A22E5    mov         dword ptr [eax],ecx
 000A22E7    mov         ecx,dword ptr [ebx+2E0];TFormCharTable.ButtonHelp:TButton
 000A22ED    test        ecx,ecx
>000A22EF    jne         000A22FA
 000A22F1    mov         dword ptr [eax+4],3C
>000A22F8    jmp         000A2306
 000A22FA    mov         esi,dword ptr [ecx+34];TButton.Top:Integer
 000A22FD    add         esi,dword ptr [ecx+3C];TButton.Height:Integer
 000A2300    add         esi,28
 000A2303    mov         dword ptr [eax+4],esi
 000A2306    lea         eax,[edx+20]
 000A2309    mov         edx,dword ptr [ebx+38];TFormCharTable.Width:Integer
 000A230C    mov         dword ptr [eax],edx
 000A230E    pop         esi
 000A230F    pop         ebx
 000A2310    ret
*}
end;

//000A2314
procedure TFormCharTable.FormCreate(Sender:TObject);
begin
{*
 000A2314    push        ebp
 000A2315    mov         ebp,esp
 000A2317    push        0
 000A2319    push        0
 000A231B    push        0
 000A231D    push        ebx
 000A231E    mov         ebx,eax
 000A2320    xor         eax,eax
 000A2322    push        ebp
 000A2323    push        0A23CD
 000A2328    push        dword ptr fs:[eax]
 000A232B    mov         dword ptr fs:[eax],esp
 000A232E    mov         byte ptr [ebx+2F0],1;TFormCharTable.?f2F0:byte
 000A2335    mov         eax,ebx
 000A2337    call        00087A14
 000A233C    mov         eax,ebx
 000A233E    call        00087964
 000A2343    mov         eax,ebx
 000A2345    call        000A2F44
 000A234A    mov         byte ptr [ebx+2F8],0;TFormCharTable.?f2F8:byte
 000A2351    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2356    cmp         dword ptr [eax],0
>000A2359    jne         000A2374
 000A235B    lea         edx,[ebp-4]
 000A235E    mov         eax,81F
 000A2363    call        LoadStr;'Character conversion table'
 000A2368    mov         edx,dword ptr [ebp-4]
 000A236B    mov         eax,ebx
 000A236D    call        TControl.SetText
>000A2372    jmp         000A23B2
 000A2374    lea         edx,[ebp-8]
 000A2377    mov         eax,81F
 000A237C    call        LoadStr;'Character conversion table'
 000A2381    push        dword ptr [ebp-8]
 000A2384    push        0A23E4;' - '
 000A2389    lea         edx,[ebp-0C]
 000A238C    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2391    mov         eax,dword ptr [eax]
 000A2393    call        ExtractFileName
 000A2398    push        dword ptr [ebp-0C]
 000A239B    lea         eax,[ebp-4]
 000A239E    mov         edx,3
 000A23A3    call        @LStrCatN
 000A23A8    mov         edx,dword ptr [ebp-4]
 000A23AB    mov         eax,ebx
 000A23AD    call        TControl.SetText
 000A23B2    xor         eax,eax
 000A23B4    pop         edx
 000A23B5    pop         ecx
 000A23B6    pop         ecx
 000A23B7    mov         dword ptr fs:[eax],edx
 000A23BA    push        0A23D4
 000A23BF    lea         eax,[ebp-0C]
 000A23C2    mov         edx,3
 000A23C7    call        @LStrArrayClr
 000A23CC    ret
>000A23CD    jmp         @HandleFinally
>000A23D2    jmp         000A23BF
 000A23D4    pop         ebx
 000A23D5    mov         esp,ebp
 000A23D7    pop         ebp
 000A23D8    ret
*}
end;

//000A23E8
procedure TFormCharTable.FormShow(Sender:TObject);
begin
{*
 000A23E8    push        ebp
 000A23E9    mov         ebp,esp
 000A23EB    push        0
 000A23ED    push        ebx
 000A23EE    push        esi
 000A23EF    push        edi
 000A23F0    mov         esi,eax
 000A23F2    xor         eax,eax
 000A23F4    push        ebp
 000A23F5    push        0A2576
 000A23FA    push        dword ptr fs:[eax]
 000A23FD    mov         dword ptr fs:[eax],esp
 000A2400    xor         edx,edx
 000A2402    mov         eax,esi
 000A2404    call        00087868
 000A2409    mov         ebx,dword ptr [esi+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A240F    mov         edx,0A258C;'Char'
 000A2414    mov         eax,dword ptr [ebx+1EC];TStringGrid...........................................FCanvas:TC...
 000A241A    call        TCanvas.TextWidth
 000A241F    mov         ecx,eax
 000A2421    add         ecx,0F
 000A2424    xor         edx,edx
 000A2426    mov         eax,ebx
 000A2428    call        TCustomGrid.SetColWidths
 000A242D    push        0A258C;'Char'
 000A2432    xor         ecx,ecx
 000A2434    xor         edx,edx
 000A2436    mov         eax,ebx
 000A2438    call        TStringGrid.SetCells
 000A243D    mov         edx,0A259C;'ANSI'
 000A2442    mov         eax,dword ptr [ebx+1EC];TStringGrid............................................FCanvas:T...
 000A2448    call        TCanvas.TextWidth
 000A244D    mov         ecx,eax
 000A244F    add         ecx,0F
 000A2452    mov         edx,1
 000A2457    mov         eax,ebx
 000A2459    call        TCustomGrid.SetColWidths
 000A245E    push        0A259C;'ANSI'
 000A2463    xor         ecx,ecx
 000A2465    mov         edx,1
 000A246A    mov         eax,ebx
 000A246C    call        TStringGrid.SetCells
 000A2471    mov         edx,0A25AC;'ASCII'
 000A2476    mov         eax,dword ptr [ebx+1EC];TStringGrid.............................................FCanvas:...
 000A247C    call        TCanvas.TextWidth
 000A2481    mov         ecx,eax
 000A2483    add         ecx,0F
 000A2486    mov         edx,2
 000A248B    mov         eax,ebx
 000A248D    call        TCustomGrid.SetColWidths
 000A2492    push        0A25AC;'ASCII'
 000A2497    xor         ecx,ecx
 000A2499    mov         edx,2
 000A249E    mov         eax,ebx
 000A24A0    call        TStringGrid.SetCells
 000A24A5    lea         edx,[ebp-4]
 000A24A8    mov         eax,820
 000A24AD    call        LoadStr;'Convert to'
 000A24B2    mov         edx,dword ptr [ebp-4]
 000A24B5    mov         eax,dword ptr [ebx+1EC];TStringGrid..............................................FCanvas...
 000A24BB    call        TCanvas.TextWidth
 000A24C0    mov         ecx,eax
 000A24C2    add         ecx,19
 000A24C5    mov         edx,3
 000A24CA    mov         eax,ebx
 000A24CC    call        TCustomGrid.SetColWidths
 000A24D1    lea         edx,[ebp-4]
 000A24D4    mov         eax,820
 000A24D9    call        LoadStr;'Convert to'
 000A24DE    mov         eax,dword ptr [ebp-4]
 000A24E1    push        eax
 000A24E2    xor         ecx,ecx
 000A24E4    mov         edx,3
 000A24E9    mov         eax,ebx
 000A24EB    call        TStringGrid.SetCells
 000A24F0    xor         edx,edx
 000A24F2    mov         eax,ebx
 000A24F4    call        TCustomGrid.GetColWidths
 000A24F9    mov         edi,eax
 000A24FB    mov         edx,1
 000A2500    mov         eax,ebx
 000A2502    call        TCustomGrid.GetColWidths
 000A2507    add         edi,eax
 000A2509    mov         edx,2
 000A250E    mov         eax,ebx
 000A2510    call        TCustomGrid.GetColWidths
 000A2515    add         edi,eax
 000A2517    mov         edx,3
 000A251C    mov         eax,ebx
 000A251E    call        TCustomGrid.GetColWidths
 000A2523    add         edi,eax
 000A2525    mov         edx,edi
 000A2527    mov         eax,dword ptr [ebx+224];TStringGrid.FGridLineWidth:Integer
 000A252D    lea         eax,[eax+eax*4]
 000A2530    add         edx,eax
 000A2532    add         edx,14
 000A2535    mov         eax,dword ptr [esi+2E4];TFormCharTable.PanelGrid:TPanel
 000A253B    call        TControl.SetClientWidth
 000A2540    mov         eax,dword ptr [esi+2E4];TFormCharTable.PanelGrid:TPanel
 000A2546    mov         edx,dword ptr [eax+38];TPanel.Width:Integer
 000A2549    mov         eax,dword ptr [esi+2C4];TFormCharTable.PanelButtons:TPanel
 000A254F    add         edx,dword ptr [eax+38];TPanel.Width:Integer
 000A2552    mov         eax,esi
 000A2554    call        TCustomForm.SetClientWidth
 000A2559    mov         byte ptr [esi+2F0],0;TFormCharTable.?f2F0:byte
 000A2560    xor         eax,eax
 000A2562    pop         edx
 000A2563    pop         ecx
 000A2564    pop         ecx
 000A2565    mov         dword ptr fs:[eax],edx
 000A2568    push        0A257D
 000A256D    lea         eax,[ebp-4]
 000A2570    call        @LStrClr
 000A2575    ret
>000A2576    jmp         @HandleFinally
>000A257B    jmp         000A256D
 000A257D    pop         edi
 000A257E    pop         esi
 000A257F    pop         ebx
 000A2580    pop         ecx
 000A2581    pop         ebp
 000A2582    ret
*}
end;

//000A25B4
procedure TFormCharTable.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
{*
 000A25B4    push        ebx
 000A25B5    push        esi
 000A25B6    mov         esi,ecx
 000A25B8    mov         ebx,eax
 000A25BA    mov         eax,ebx
 000A25BC    call        000A25C8
 000A25C1    mov         byte ptr [esi],al
 000A25C3    pop         esi
 000A25C4    pop         ebx
 000A25C5    ret
*}
end;

//000A25C8
{*function sub_000A25C8(?:TFormCharTable):?;
begin
 000A25C8    push        ebp
 000A25C9    mov         ebp,esp
 000A25CB    push        0
 000A25CD    push        ebx
 000A25CE    mov         ebx,eax
 000A25D0    xor         eax,eax
 000A25D2    push        ebp
 000A25D3    push        0A2640
 000A25D8    push        dword ptr fs:[eax]
 000A25DB    mov         dword ptr fs:[eax],esp
 000A25DE    cmp         byte ptr [ebx+2F8],0;TFormCharTable.?f2F8:byte
>000A25E5    jne         000A25EB
 000A25E7    mov         bl,1
>000A25E9    jmp         000A262A
 000A25EB    lea         edx,[ebp-4]
 000A25EE    mov         eax,823
 000A25F3    call        LoadStr;'Conversion table modified. Save now?'
 000A25F8    mov         eax,dword ptr [ebp-4]
 000A25FB    call        0008D0E0
 000A2600    sub         ax,6
>000A2604    je          000A260D
 000A2606    dec         ax
>000A2609    je          000A2624
>000A260B    jmp         000A2628
 000A260D    xor         edx,edx
 000A260F    mov         eax,ebx
 000A2611    call        TFormCharTable.ButtonSaveClick
 000A2616    cmp         byte ptr [ebx+2F8],0;TFormCharTable.?f2F8:byte
 000A261D    sete        al
 000A2620    mov         ebx,eax
>000A2622    jmp         000A262A
 000A2624    mov         bl,1
>000A2626    jmp         000A262A
 000A2628    xor         ebx,ebx
 000A262A    xor         eax,eax
 000A262C    pop         edx
 000A262D    pop         ecx
 000A262E    pop         ecx
 000A262F    mov         dword ptr fs:[eax],edx
 000A2632    push        0A2647
 000A2637    lea         eax,[ebp-4]
 000A263A    call        @LStrClr
 000A263F    ret
>000A2640    jmp         @HandleFinally
>000A2645    jmp         000A2637
 000A2647    mov         eax,ebx
 000A2649    pop         ebx
 000A264A    pop         ecx
 000A264B    pop         ebp
 000A264C    ret
end;*}

//000A2700
procedure sub_000A2700(?:TFormCharTable; ?:Integer; ?:Integer);
begin
{*
 000A2700    push        ebx
 000A2701    push        esi
 000A2702    push        edi
 000A2703    mov         edi,ecx
 000A2705    mov         ebx,eax
 000A2707    mov         esi,dword ptr [ebx+2EC]
 000A270D    xor         edx,edx
 000A270F    mov         eax,esi
 000A2711    call        TCustomGrid.GetRowHeights
 000A2716    cmp         edi,eax
>000A2718    jg          000A273A
 000A271A    mov         dl,1
 000A271C    mov         eax,dword ptr [ebx+2E8]
 000A2722    call        TTimer.SetEnabled
 000A2727    push        ebx
 000A2728    push        0A26B0
 000A272D    mov         eax,dword ptr [ebx+2E8]
 000A2733    call        TTimer.SetOnTimer
>000A2738    jmp         000A2792
 000A273A    mov         eax,dword ptr [esi+214]
 000A2740    sar         eax,1
>000A2742    jns         000A2747
 000A2744    adc         eax,0
 000A2747    push        eax
 000A2748    mov         eax,dword ptr [esi+3C]
 000A274B    pop         edx
 000A274C    sub         eax,edx
 000A274E    cmp         edi,eax
>000A2750    jge         000A2761
 000A2752    xor         edx,edx
 000A2754    mov         eax,dword ptr [ebx+2E8]
 000A275A    call        TTimer.SetEnabled
>000A275F    jmp         000A2792
 000A2761    cmp         eax,edi
>000A2763    jg          000A2785
 000A2765    mov         dl,1
 000A2767    mov         eax,dword ptr [ebx+2E8]
 000A276D    call        TTimer.SetEnabled
 000A2772    push        ebx
 000A2773    push        0A2650
 000A2778    mov         eax,dword ptr [ebx+2E8]
 000A277E    call        TTimer.SetOnTimer
>000A2783    jmp         000A2792
 000A2785    xor         edx,edx
 000A2787    mov         eax,dword ptr [ebx+2E8]
 000A278D    call        TTimer.SetEnabled
 000A2792    pop         edi
 000A2793    pop         esi
 000A2794    pop         ebx
 000A2795    ret
*}
end;

//000A2798
procedure TFormCharTable.StringGridCharTableKeyPress(Sender:TObject; var Key:Char);
begin
{*
 000A2798    push        ebp
 000A2799    mov         ebp,esp
 000A279B    push        0
 000A279D    push        ebx
 000A279E    push        esi
 000A279F    push        edi
 000A27A0    mov         ebx,ecx
 000A27A2    mov         esi,eax
 000A27A4    xor         eax,eax
 000A27A6    push        ebp
 000A27A7    push        0A2879
 000A27AC    push        dword ptr fs:[eax]
 000A27AF    mov         dword ptr fs:[eax],esp
 000A27B2    mov         al,byte ptr [ebx]
 000A27B4    call        UpCase
 000A27B9    mov         byte ptr [ebx],al
 000A27BB    cmp         byte ptr [ebx],20
>000A27BE    jae         000A27E0
 000A27C0    cmp         byte ptr [esi+2F8],0;TFormCharTable.?f2F8:byte
>000A27C7    jne         000A27D3
 000A27C9    mov         al,byte ptr [ebx]
 000A27CB    sub         al,8
>000A27CD    je          000A27D3
 000A27CF    xor         eax,eax
>000A27D1    jmp         000A27D5
 000A27D3    mov         al,1
 000A27D5    mov         byte ptr [esi+2F8],al;TFormCharTable.?f2F8:byte
>000A27DB    jmp         000A2863
 000A27E0    mov         al,byte ptr [ebx]
 000A27E2    add         al,0D0
 000A27E4    sub         al,0A
>000A27E6    jb          000A27F3
 000A27E8    add         al,0F9
 000A27EA    sub         al,6
>000A27EC    jb          000A27F3
 000A27EE    mov         byte ptr [ebx],0
>000A27F1    jmp         000A2863
 000A27F3    mov         edi,dword ptr [esi+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A27F9    mov         byte ptr [esi+2F8],1;TFormCharTable.?f2F8:byte
 000A2800    lea         eax,[ebp-4]
 000A2803    push        eax
 000A2804    mov         ecx,dword ptr [edi+20C];TStringGrid.FCurrent:Longint
 000A280A    mov         edx,dword ptr [edi+208];TStringGrid.FCurrent:TGridCoord
 000A2810    mov         eax,edi
 000A2812    call        TStringGrid.GetCells
 000A2817    mov         eax,dword ptr [ebp-4]
 000A281A    call        @LStrLen
 000A281F    cmp         eax,2
>000A2822    jl          000A2863
 000A2824    mov         eax,dword ptr [esi+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A282A    mov         eax,dword ptr [eax+25C];TStringGrid.FInplaceEdit:TInplaceEdit
 000A2830    mov         edx,dword ptr [eax]
 000A2832    call        dword ptr [edx+0BC];TCustomEdit.GetSelLength
 000A2838    cmp         eax,2
>000A283B    jne         000A2860
 000A283D    lea         eax,[ebp-4]
 000A2840    mov         dl,byte ptr [ebx]
 000A2842    call        @LStrFromChar
 000A2847    mov         eax,dword ptr [ebp-4]
 000A284A    push        eax
 000A284B    mov         ecx,dword ptr [edi+20C];TStringGrid.FCurrent:Longint
 000A2851    mov         edx,dword ptr [edi+208];TStringGrid.FCurrent:TGridCoord
 000A2857    mov         eax,edi
 000A2859    call        TStringGrid.SetCells
>000A285E    jmp         000A2863
 000A2860    mov         byte ptr [ebx],0
 000A2863    xor         eax,eax
 000A2865    pop         edx
 000A2866    pop         ecx
 000A2867    pop         ecx
 000A2868    mov         dword ptr fs:[eax],edx
 000A286B    push        0A2880
 000A2870    lea         eax,[ebp-4]
 000A2873    call        @LStrClr
 000A2878    ret
>000A2879    jmp         @HandleFinally
>000A287E    jmp         000A2870
 000A2880    pop         edi
 000A2881    pop         esi
 000A2882    pop         ebx
 000A2883    pop         ecx
 000A2884    pop         ebp
 000A2885    ret
*}
end;

//000A2888
procedure TFormCharTable.StringGridCharTableKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 000A2888    push        ebp
 000A2889    mov         ebp,esp
 000A288B    cmp         byte ptr [eax+2F8],0;TFormCharTable.?f2F8:byte
>000A2892    jne         000A28AA
 000A2894    mov         dx,word ptr [ecx]
 000A2897    sub         dx,8
>000A289B    je          000A28AA
 000A289D    add         edx,0FFFFFFDB
 000A28A0    sub         dx,2
>000A28A4    jb          000A28AA
 000A28A6    xor         edx,edx
>000A28A8    jmp         000A28AC
 000A28AA    mov         dl,1
 000A28AC    mov         byte ptr [eax+2F8],dl;TFormCharTable.?f2F8:byte
 000A28B2    pop         ebp
 000A28B3    ret         4
*}
end;

//000A28B8
procedure TFormCharTable.StringGridCharTableSelectCell;
begin
{*
 000A28B8    push        ebp
 000A28B9    mov         ebp,esp
 000A28BB    add         esp,0FFFFFFF0
 000A28BE    push        ebx
 000A28BF    push        esi
 000A28C0    xor         ebx,ebx
 000A28C2    mov         dword ptr [ebp-8],ebx
 000A28C5    mov         dword ptr [ebp-4],ebx
 000A28C8    mov         ebx,eax
 000A28CA    xor         eax,eax
 000A28CC    push        ebp
 000A28CD    push        0A2955
 000A28D2    push        dword ptr fs:[eax]
 000A28D5    mov         dword ptr fs:[eax],esp
 000A28D8    lea         eax,[ebp-4]
 000A28DB    push        eax
 000A28DC    mov         esi,dword ptr [ebx+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A28E2    mov         ecx,dword ptr [esi+20C];TStringGrid.FCurrent:Longint
 000A28E8    mov         edx,dword ptr [esi+208];TStringGrid.FCurrent:TGridCoord
 000A28EE    mov         eax,esi
 000A28F0    call        TStringGrid.GetCells
 000A28F5    cmp         dword ptr [ebp-4],0
>000A28F9    je          000A293A
 000A28FB    lea         eax,[ebp-8]
 000A28FE    push        eax
 000A28FF    mov         eax,dword ptr [ebp-4]
 000A2902    call        0007507C
 000A2907    mov         dword ptr [ebp-10],eax
 000A290A    mov         byte ptr [ebp-0C],0
 000A290E    lea         edx,[ebp-10]
 000A2911    xor         ecx,ecx
 000A2913    mov         eax,0A296C;'%2.2x'
 000A2918    call        Format
 000A291D    mov         eax,dword ptr [ebp-8]
 000A2920    push        eax
 000A2921    mov         esi,dword ptr [ebx+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A2927    mov         ecx,dword ptr [esi+20C];TStringGrid.FCurrent:Longint
 000A292D    mov         edx,dword ptr [esi+208];TStringGrid.FCurrent:TGridCoord
 000A2933    mov         eax,esi
 000A2935    call        TStringGrid.SetCells
 000A293A    xor         eax,eax
 000A293C    pop         edx
 000A293D    pop         ecx
 000A293E    pop         ecx
 000A293F    mov         dword ptr fs:[eax],edx
 000A2942    push        0A295C
 000A2947    lea         eax,[ebp-8]
 000A294A    mov         edx,2
 000A294F    call        @LStrArrayClr
 000A2954    ret
>000A2955    jmp         @HandleFinally
>000A295A    jmp         000A2947
 000A295C    pop         esi
 000A295D    pop         ebx
 000A295E    mov         esp,ebp
 000A2960    pop         ebp
 000A2961    ret         8
*}
end;

//000A2974
procedure TFormCharTable.StringGridCharTableExit(Sender:TObject);
begin
{*
 000A2974    push        ebp
 000A2975    mov         ebp,esp
 000A2977    add         esp,0FFFFFFF4
 000A297A    push        ebx
 000A297B    push        esi
 000A297C    push        edi
 000A297D    xor         ecx,ecx
 000A297F    mov         dword ptr [ebp-4],ecx
 000A2982    xor         edx,edx
 000A2984    push        ebp
 000A2985    push        0A2A15
 000A298A    push        dword ptr fs:[edx]
 000A298D    mov         dword ptr fs:[edx],esp
 000A2990    mov         ebx,dword ptr [eax+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A2996    lea         eax,[ebp-4]
 000A2999    push        eax
 000A299A    mov         ecx,dword ptr [ebx+20C];TStringGrid.FCurrent:Longint
 000A29A0    mov         edx,dword ptr [ebx+208];TStringGrid.FCurrent:TGridCoord
 000A29A6    mov         eax,ebx
 000A29A8    call        TStringGrid.GetCells
 000A29AD    cmp         dword ptr [ebp-4],0
>000A29B1    je          000A29FF
 000A29B3    lea         eax,[ebp-4]
 000A29B6    push        eax
 000A29B7    lea         eax,[ebp-4]
 000A29BA    push        eax
 000A29BB    mov         edi,dword ptr [ebx+20C];TStringGrid.FCurrent:Longint
 000A29C1    mov         ecx,edi
 000A29C3    mov         esi,dword ptr [ebx+208];TStringGrid.FCurrent:TGridCoord
 000A29C9    mov         edx,esi
 000A29CB    mov         eax,ebx
 000A29CD    call        TStringGrid.GetCells
 000A29D2    mov         eax,dword ptr [ebp-4]
 000A29D5    call        0007507C
 000A29DA    mov         dword ptr [ebp-0C],eax
 000A29DD    mov         byte ptr [ebp-8],0
 000A29E1    lea         edx,[ebp-0C]
 000A29E4    xor         ecx,ecx
 000A29E6    mov         eax,0A2A2C;'%2.2x'
 000A29EB    call        Format
 000A29F0    mov         eax,dword ptr [ebp-4]
 000A29F3    push        eax
 000A29F4    mov         ecx,edi
 000A29F6    mov         edx,esi
 000A29F8    mov         eax,ebx
 000A29FA    call        TStringGrid.SetCells
 000A29FF    xor         eax,eax
 000A2A01    pop         edx
 000A2A02    pop         ecx
 000A2A03    pop         ecx
 000A2A04    mov         dword ptr fs:[eax],edx
 000A2A07    push        0A2A1C
 000A2A0C    lea         eax,[ebp-4]
 000A2A0F    call        @LStrClr
 000A2A14    ret
>000A2A15    jmp         @HandleFinally
>000A2A1A    jmp         000A2A0C
 000A2A1C    pop         edi
 000A2A1D    pop         esi
 000A2A1E    pop         ebx
 000A2A1F    mov         esp,ebp
 000A2A21    pop         ebp
 000A2A22    ret
*}
end;

//000A2A34
procedure TFormCharTable.ButtonClearClick(Sender:TObject);
begin
{*
 000A2A34    push        ebx
 000A2A35    mov         ebx,eax
 000A2A37    mov         eax,ebx
 000A2A39    call        000A25C8
 000A2A3E    test        al,al
>000A2A40    je          000A2A55
 000A2A42    call        0009B244
 000A2A47    mov         eax,ebx
 000A2A49    call        000A2F44
 000A2A4E    mov         byte ptr [ebx+2F8],0;TFormCharTable.?f2F8:byte
 000A2A55    pop         ebx
 000A2A56    ret
*}
end;

//000A2A58
procedure TFormCharTable.ButtonSaveClick(Sender:TObject);
begin
{*
 000A2A58    push        ebp
 000A2A59    mov         ebp,esp
 000A2A5B    xor         ecx,ecx
 000A2A5D    push        ecx
 000A2A5E    push        ecx
 000A2A5F    push        ecx
 000A2A60    push        ecx
 000A2A61    push        ecx
 000A2A62    push        ecx
 000A2A63    push        ebx
 000A2A64    mov         ebx,eax
 000A2A66    xor         eax,eax
 000A2A68    push        ebp
 000A2A69    push        0A2BBE
 000A2A6E    push        dword ptr fs:[eax]
 000A2A71    mov         dword ptr fs:[eax],esp
 000A2A74    mov         eax,ebx
 000A2A76    call        000A3074
 000A2A7B    lea         edx,[ebp-8]
 000A2A7E    mov         eax,[000B59E8];^Application:TApplication
 000A2A83    mov         eax,dword ptr [eax]
 000A2A85    call        TApplication.GetExeName
 000A2A8A    mov         eax,dword ptr [ebp-8]
 000A2A8D    lea         edx,[ebp-4]
 000A2A90    call        ExtractFileDir
 000A2A95    lea         eax,[ebp-4]
 000A2A98    push        eax
 000A2A99    push        0A2BD4;'*.xct'
 000A2A9E    push        3F
 000A2AA0    push        0
 000A2AA2    push        0
 000A2AA4    push        0
 000A2AA6    push        0A2BE4;'Favorites'
 000A2AAB    lea         edx,[ebp-8]
 000A2AAE    mov         eax,821
 000A2AB3    call        LoadStr;'Save conversion table'
 000A2AB8    mov         ecx,dword ptr [ebp-8]
 000A2ABB    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A2AC0    mov         eax,dword ptr [eax]
 000A2AC2    mov         edx,1
 000A2AC7    call        000A1204
 000A2ACC    dec         eax
>000A2ACD    jne         000A2BA3
 000A2AD3    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A2AD8    mov         eax,dword ptr [eax]
 000A2ADA    mov         eax,dword ptr [eax+2DC]
 000A2AE0    call        0009AF40
 000A2AE5    test        al,al
>000A2AE7    je          000A2B48
 000A2AE9    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2AEE    mov         edx,dword ptr ds:[0B5894];^gvar_000B7070:TFormOSE
 000A2AF4    mov         edx,dword ptr [edx]
 000A2AF6    mov         edx,dword ptr [edx+2DC]
 000A2AFC    call        @LStrAsg
 000A2B01    lea         edx,[ebp-0C]
 000A2B04    mov         eax,81F
 000A2B09    call        LoadStr;'Character conversion table'
 000A2B0E    push        dword ptr [ebp-0C]
 000A2B11    push        0A2BF8;' - '
 000A2B16    lea         edx,[ebp-10]
 000A2B19    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2B1E    mov         eax,dword ptr [eax]
 000A2B20    call        ExtractFileName
 000A2B25    push        dword ptr [ebp-10]
 000A2B28    lea         eax,[ebp-8]
 000A2B2B    mov         edx,3
 000A2B30    call        @LStrCatN
 000A2B35    mov         edx,dword ptr [ebp-8]
 000A2B38    mov         eax,ebx
 000A2B3A    call        TControl.SetText
 000A2B3F    mov         byte ptr [ebx+2F8],0;TFormCharTable.?f2F8:byte
>000A2B46    jmp         000A2BA3
 000A2B48    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2B4D    call        @LStrClr
 000A2B52    lea         edx,[ebp-8]
 000A2B55    mov         eax,81F
 000A2B5A    call        LoadStr;'Character conversion table'
 000A2B5F    mov         edx,dword ptr [ebp-8]
 000A2B62    mov         eax,ebx
 000A2B64    call        TControl.SetText
 000A2B69    lea         eax,[ebp-8]
 000A2B6C    push        eax
 000A2B6D    lea         edx,[ebp-0C]
 000A2B70    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A2B75    mov         eax,dword ptr [eax]
 000A2B77    mov         eax,dword ptr [eax+2DC]
 000A2B7D    call        ExtractFileName
 000A2B82    mov         eax,dword ptr [ebp-0C]
 000A2B85    mov         dword ptr [ebp-18],eax
 000A2B88    mov         byte ptr [ebp-14],0B
 000A2B8C    lea         edx,[ebp-18]
 000A2B8F    xor         ecx,ecx
 000A2B91    mov         eax,7D7
 000A2B96    call        FmtLoadStr;'Error writing
%s'
 000A2B9B    mov         eax,dword ptr [ebp-8]
 000A2B9E    call        0008D0A8
 000A2BA3    xor         eax,eax
 000A2BA5    pop         edx
 000A2BA6    pop         ecx
 000A2BA7    pop         ecx
 000A2BA8    mov         dword ptr fs:[eax],edx
 000A2BAB    push        0A2BC5
 000A2BB0    lea         eax,[ebp-10]
 000A2BB3    mov         edx,4
 000A2BB8    call        @LStrArrayClr
 000A2BBD    ret
>000A2BBE    jmp         @HandleFinally
>000A2BC3    jmp         000A2BB0
 000A2BC5    pop         ebx
 000A2BC6    mov         esp,ebp
 000A2BC8    pop         ebp
 000A2BC9    ret
*}
end;

//000A2BFC
procedure TFormCharTable.ButtonLoadClick(Sender:TObject);
begin
{*
 000A2BFC    push        ebp
 000A2BFD    mov         ebp,esp
 000A2BFF    xor         ecx,ecx
 000A2C01    push        ecx
 000A2C02    push        ecx
 000A2C03    push        ecx
 000A2C04    push        ecx
 000A2C05    push        ecx
 000A2C06    push        ecx
 000A2C07    push        ebx
 000A2C08    mov         ebx,eax
 000A2C0A    xor         eax,eax
 000A2C0C    push        ebp
 000A2C0D    push        0A2D73
 000A2C12    push        dword ptr fs:[eax]
 000A2C15    mov         dword ptr fs:[eax],esp
 000A2C18    mov         eax,ebx
 000A2C1A    call        000A25C8
 000A2C1F    test        al,al
>000A2C21    je          000A2D58
 000A2C27    lea         edx,[ebp-8]
 000A2C2A    mov         eax,[000B59E8];^Application:TApplication
 000A2C2F    mov         eax,dword ptr [eax]
 000A2C31    call        TApplication.GetExeName
 000A2C36    mov         eax,dword ptr [ebp-8]
 000A2C39    lea         edx,[ebp-4]
 000A2C3C    call        ExtractFileDir
 000A2C41    lea         eax,[ebp-4]
 000A2C44    push        eax
 000A2C45    push        0A2D88;'*.xct'
 000A2C4A    push        3F
 000A2C4C    push        0
 000A2C4E    push        0
 000A2C50    push        0
 000A2C52    push        0A2D98;'Favorites'
 000A2C57    lea         edx,[ebp-8]
 000A2C5A    mov         eax,822
 000A2C5F    call        LoadStr;'Load conversion table'
 000A2C64    mov         ecx,dword ptr [ebp-8]
 000A2C67    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A2C6C    mov         eax,dword ptr [eax]
 000A2C6E    xor         edx,edx
 000A2C70    call        000A1204
 000A2C75    dec         eax
>000A2C76    jne         000A2D58
 000A2C7C    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A2C81    mov         eax,dword ptr [eax]
 000A2C83    mov         eax,dword ptr [eax+2DC]
 000A2C89    call        0009B070
 000A2C8E    test        al,al
>000A2C90    je          000A2CF8
 000A2C92    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2C97    mov         edx,dword ptr ds:[0B5894];^gvar_000B7070:TFormOSE
 000A2C9D    mov         edx,dword ptr [edx]
 000A2C9F    mov         edx,dword ptr [edx+2DC]
 000A2CA5    call        @LStrAsg
 000A2CAA    mov         eax,ebx
 000A2CAC    call        000A2F44
 000A2CB1    lea         edx,[ebp-0C]
 000A2CB4    mov         eax,81F
 000A2CB9    call        LoadStr;'Character conversion table'
 000A2CBE    push        dword ptr [ebp-0C]
 000A2CC1    push        0A2DAC;' - '
 000A2CC6    lea         edx,[ebp-10]
 000A2CC9    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2CCE    mov         eax,dword ptr [eax]
 000A2CD0    call        ExtractFileName
 000A2CD5    push        dword ptr [ebp-10]
 000A2CD8    lea         eax,[ebp-8]
 000A2CDB    mov         edx,3
 000A2CE0    call        @LStrCatN
 000A2CE5    mov         edx,dword ptr [ebp-8]
 000A2CE8    mov         eax,ebx
 000A2CEA    call        TControl.SetText
 000A2CEF    mov         byte ptr [ebx+2F8],0;TFormCharTable.?f2F8:byte
>000A2CF6    jmp         000A2D58
 000A2CF8    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000A2CFD    call        @LStrClr
 000A2D02    call        0009B244
 000A2D07    lea         edx,[ebp-8]
 000A2D0A    mov         eax,81F
 000A2D0F    call        LoadStr;'Character conversion table'
 000A2D14    mov         edx,dword ptr [ebp-8]
 000A2D17    mov         eax,ebx
 000A2D19    call        TControl.SetText
 000A2D1E    lea         eax,[ebp-8]
 000A2D21    push        eax
 000A2D22    lea         edx,[ebp-0C]
 000A2D25    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A2D2A    mov         eax,dword ptr [eax]
 000A2D2C    mov         eax,dword ptr [eax+2DC]
 000A2D32    call        ExtractFileName
 000A2D37    mov         eax,dword ptr [ebp-0C]
 000A2D3A    mov         dword ptr [ebp-18],eax
 000A2D3D    mov         byte ptr [ebp-14],0B
 000A2D41    lea         edx,[ebp-18]
 000A2D44    xor         ecx,ecx
 000A2D46    mov         eax,7D5
 000A2D4B    call        FmtLoadStr;'Error reading
%s'
 000A2D50    mov         eax,dword ptr [ebp-8]
 000A2D53    call        0008D0A8
 000A2D58    xor         eax,eax
 000A2D5A    pop         edx
 000A2D5B    pop         ecx
 000A2D5C    pop         ecx
 000A2D5D    mov         dword ptr fs:[eax],edx
 000A2D60    push        0A2D7A
 000A2D65    lea         eax,[ebp-10]
 000A2D68    mov         edx,4
 000A2D6D    call        @LStrArrayClr
 000A2D72    ret
>000A2D73    jmp         @HandleFinally
>000A2D78    jmp         000A2D65
 000A2D7A    pop         ebx
 000A2D7B    mov         esp,ebp
 000A2D7D    pop         ebp
 000A2D7E    ret
*}
end;

//000A2DB0
procedure TFormCharTable.ButtonHelpClick(Sender:TObject);
begin
{*
 000A2DB0    mov         eax,[000B59E8];^Application:TApplication
 000A2DB5    mov         eax,dword ptr [eax]
 000A2DB7    mov         edx,3C
 000A2DBC    call        TApplication.HelpContext
 000A2DC1    ret
*}
end;

//000A2DC4
procedure TFormCharTable.ButtonConvertClick(Sender:TObject);
begin
{*
 000A2DC4    call        000A3074
 000A2DC9    ret
*}
end;

//000A2DCC
procedure TFormCharTable.StringGridCharTableMouseMove(Sender:TObject; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 000A2DCC    push        ebp
 000A2DCD    mov         ebp,esp
 000A2DCF    mov         ecx,dword ptr [ebp+8]
 000A2DD2    mov         edx,dword ptr [ebp+0C]
 000A2DD5    call        000A2700
 000A2DDA    pop         ebp
 000A2DDB    ret         8
*}
end;

//000A2DE0
procedure TFormCharTable.StringGridCharTableClick(Sender:TObject);
begin
{*
 000A2DE0    xor         edx,edx
 000A2DE2    mov         eax,dword ptr [eax+2E8];TFormCharTable.Timer1:TTimer
 000A2DE8    call        TTimer.SetEnabled
 000A2DED    ret
*}
end;

//000A2DF0
procedure TFormCharTable.StringGridCharTableMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 000A2DF0    push        ebp
 000A2DF1    mov         ebp,esp
 000A2DF3    add         esp,0FFFFFFF8
 000A2DF6    push        ebx
 000A2DF7    push        esi
 000A2DF8    mov         ebx,eax
 000A2DFA    test        cl,cl
>000A2DFC    jne         000A2E45
 000A2DFE    mov         esi,dword ptr [ebx+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A2E04    lea         eax,[ebp-4]
 000A2E07    push        eax
 000A2E08    lea         eax,[ebp-8]
 000A2E0B    push        eax
 000A2E0C    mov         ecx,dword ptr [ebp+8]
 000A2E0F    mov         edx,dword ptr [ebp+0C]
 000A2E12    mov         eax,esi
 000A2E14    call        TDrawGrid.MouseToCell
 000A2E19    cmp         dword ptr [ebp-8],0
>000A2E1D    jle         000A2E45
 000A2E1F    mov         eax,dword ptr [ebp-4]
 000A2E22    sub         eax,3
>000A2E25    jae         000A2E45
 000A2E27    xor         edx,edx
 000A2E29    mov         eax,esi
 000A2E2B    call        TCustomGrid.SetEditorMode
 000A2E30    mov         eax,dword ptr [ebp-8]
 000A2E33    mov         dword ptr [ebx+2F4],eax;TFormCharTable.?f2F4:dword
 000A2E39    or          ecx,0FFFFFFFF
 000A2E3C    mov         dl,1
 000A2E3E    mov         eax,esi
 000A2E40    call        TControl.BeginDrag
 000A2E45    pop         esi
 000A2E46    pop         ebx
 000A2E47    pop         ecx
 000A2E48    pop         ecx
 000A2E49    pop         ebp
 000A2E4A    ret         0C
*}
end;

//000A2E50
procedure TFormCharTable.StringGridCharTableDragOver(Sender:TObject; Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 000A2E50    push        ebp
 000A2E51    mov         ebp,esp
 000A2E53    add         esp,0FFFFFFF8
 000A2E56    push        ebx
 000A2E57    push        esi
 000A2E58    push        edi
 000A2E59    mov         ebx,eax
 000A2E5B    mov         edi,dword ptr [ebp+10]
 000A2E5E    mov         esi,dword ptr [ebp+14]
 000A2E61    mov         eax,dword ptr [ebx+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A2E67    lea         edx,[ebp-4]
 000A2E6A    push        edx
 000A2E6B    lea         edx,[ebp-8]
 000A2E6E    push        edx
 000A2E6F    mov         ecx,edi
 000A2E71    mov         edx,esi
 000A2E73    call        TDrawGrid.MouseToCell
 000A2E78    cmp         dword ptr [ebp-8],0
>000A2E7C    jle         000A2E97
 000A2E7E    cmp         dword ptr [ebp-4],3
>000A2E82    jne         000A2E97
 000A2E84    mov         eax,dword ptr [ebp-8]
 000A2E87    cmp         eax,dword ptr [ebx+2F4];TFormCharTable.?f2F4:dword
>000A2E8D    je          000A2E97
 000A2E8F    mov         eax,dword ptr [ebp+8]
 000A2E92    mov         byte ptr [eax],1
>000A2E95    jmp         000A2E9D
 000A2E97    mov         eax,dword ptr [ebp+8]
 000A2E9A    mov         byte ptr [eax],0
 000A2E9D    mov         ecx,edi
 000A2E9F    mov         edx,esi
 000A2EA1    mov         eax,ebx
 000A2EA3    call        000A2700
 000A2EA8    pop         edi
 000A2EA9    pop         esi
 000A2EAA    pop         ebx
 000A2EAB    pop         ecx
 000A2EAC    pop         ecx
 000A2EAD    pop         ebp
 000A2EAE    ret         10
*}
end;

//000A2EB4
procedure TFormCharTable.StringGridCharTableEndDrag(Sender:TObject; Target:TObject; X:Integer; Y:Integer);
begin
{*
 000A2EB4    push        ebp
 000A2EB5    mov         ebp,esp
 000A2EB7    add         esp,0FFFFFFF4
 000A2EBA    push        ebx
 000A2EBB    push        esi
 000A2EBC    xor         ebx,ebx
 000A2EBE    mov         dword ptr [ebp-0C],ebx
 000A2EC1    mov         ebx,eax
 000A2EC3    xor         eax,eax
 000A2EC5    push        ebp
 000A2EC6    push        0A2F35
 000A2ECB    push        dword ptr fs:[eax]
 000A2ECE    mov         dword ptr fs:[eax],esp
 000A2ED1    mov         esi,dword ptr [ebx+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A2ED7    lea         eax,[ebp-4]
 000A2EDA    push        eax
 000A2EDB    lea         eax,[ebp-8]
 000A2EDE    push        eax
 000A2EDF    mov         ecx,dword ptr [ebp+8]
 000A2EE2    mov         edx,dword ptr [ebp+0C]
 000A2EE5    mov         eax,esi
 000A2EE7    call        TDrawGrid.MouseToCell
 000A2EEC    cmp         dword ptr [ebp-8],0
>000A2EF0    jle         000A2F1F
 000A2EF2    lea         eax,[ebp-0C]
 000A2EF5    push        eax
 000A2EF6    mov         ecx,dword ptr [ebp-8]
 000A2EF9    xor         edx,edx
 000A2EFB    mov         eax,esi
 000A2EFD    call        TStringGrid.GetCells
 000A2F02    mov         eax,dword ptr [ebp-0C]
 000A2F05    push        eax
 000A2F06    mov         ecx,dword ptr [ebx+2F4];TFormCharTable.?f2F4:dword
 000A2F0C    mov         edx,3
 000A2F11    mov         eax,esi
 000A2F13    call        TStringGrid.SetCells
 000A2F18    mov         byte ptr [ebx+2F8],1;TFormCharTable.?f2F8:byte
 000A2F1F    xor         eax,eax
 000A2F21    pop         edx
 000A2F22    pop         ecx
 000A2F23    pop         ecx
 000A2F24    mov         dword ptr fs:[eax],edx
 000A2F27    push        0A2F3C
 000A2F2C    lea         eax,[ebp-0C]
 000A2F2F    call        @LStrClr
 000A2F34    ret
>000A2F35    jmp         @HandleFinally
>000A2F3A    jmp         000A2F2C
 000A2F3C    pop         esi
 000A2F3D    pop         ebx
 000A2F3E    mov         esp,ebp
 000A2F40    pop         ebp
 000A2F41    ret         8
*}
end;

//000A2F44
procedure sub_000A2F44(?:TFormCharTable);
begin
{*
 000A2F44    push        ebp
 000A2F45    mov         ebp,esp
 000A2F47    add         esp,0FFFFFFF4
 000A2F4A    push        ebx
 000A2F4B    push        esi
 000A2F4C    push        edi
 000A2F4D    xor         edx,edx
 000A2F4F    mov         dword ptr [ebp-4],edx
 000A2F52    xor         edx,edx
 000A2F54    push        ebp
 000A2F55    push        0A3053
 000A2F5A    push        dword ptr fs:[edx]
 000A2F5D    mov         dword ptr fs:[edx],esp
 000A2F60    mov         esi,dword ptr [eax+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A2F66    xor         ebx,ebx
 000A2F68    lea         eax,[ebp-4]
 000A2F6B    push        eax
 000A2F6C    mov         dword ptr [ebp-0C],ebx
 000A2F6F    mov         byte ptr [ebp-8],0
 000A2F73    lea         edx,[ebp-0C]
 000A2F76    xor         ecx,ecx
 000A2F78    mov         eax,0A306C;'%2.2x'
 000A2F7D    call        Format
 000A2F82    mov         eax,dword ptr [ebp-4]
 000A2F85    push        eax
 000A2F86    lea         edi,[ebx+1]
 000A2F89    mov         ecx,edi
 000A2F8B    xor         edx,edx
 000A2F8D    mov         eax,esi
 000A2F8F    call        TStringGrid.SetCells
 000A2F94    cmp         ebx,20
>000A2F97    jl          000A2FD1
 000A2F99    lea         eax,[ebp-4]
 000A2F9C    mov         edx,ebx
 000A2F9E    call        @LStrFromChar
 000A2FA3    mov         eax,dword ptr [ebp-4]
 000A2FA6    push        eax
 000A2FA7    mov         ecx,edi
 000A2FA9    mov         edx,1
 000A2FAE    mov         eax,esi
 000A2FB0    call        TStringGrid.SetCells
 000A2FB5    lea         eax,[ebp-4]
 000A2FB8    mov         edx,ebx
 000A2FBA    call        @LStrFromChar
 000A2FBF    mov         eax,dword ptr [ebp-4]
 000A2FC2    push        eax
 000A2FC3    mov         ecx,edi
 000A2FC5    mov         edx,2
 000A2FCA    mov         eax,esi
 000A2FCC    call        TStringGrid.SetCells
 000A2FD1    mov         eax,ebx
 000A2FD3    xor         edx,edx
 000A2FD5    mov         dl,al
 000A2FD7    mov         ecx,dword ptr ds:[0B59F0];^gvar_000B6BF4
 000A2FDD    mov         dl,byte ptr [ecx+edx]
 000A2FE0    cmp         dl,al
>000A2FE2    jne         000A2FF6
 000A2FE4    push        0
 000A2FE6    mov         ecx,edi
 000A2FE8    mov         edx,3
 000A2FED    mov         eax,esi
 000A2FEF    call        TStringGrid.SetCells
>000A2FF4    jmp         000A3030
 000A2FF6    lea         eax,[ebp-4]
 000A2FF9    push        eax
 000A2FFA    xor         eax,eax
 000A2FFC    mov         al,bl
 000A2FFE    mov         edx,dword ptr ds:[0B59F0];^gvar_000B6BF4
 000A3004    movzx       eax,byte ptr [edx+eax]
 000A3008    mov         dword ptr [ebp-0C],eax
 000A300B    mov         byte ptr [ebp-8],0
 000A300F    lea         edx,[ebp-0C]
 000A3012    xor         ecx,ecx
 000A3014    mov         eax,0A306C;'%2.2x'
 000A3019    call        Format
 000A301E    mov         eax,dword ptr [ebp-4]
 000A3021    push        eax
 000A3022    mov         ecx,edi
 000A3024    mov         edx,3
 000A3029    mov         eax,esi
 000A302B    call        TStringGrid.SetCells
 000A3030    inc         ebx
 000A3031    cmp         ebx,100
>000A3037    jne         000A2F68
 000A303D    xor         eax,eax
 000A303F    pop         edx
 000A3040    pop         ecx
 000A3041    pop         ecx
 000A3042    mov         dword ptr fs:[eax],edx
 000A3045    push        0A305A
 000A304A    lea         eax,[ebp-4]
 000A304D    call        @LStrClr
 000A3052    ret
>000A3053    jmp         @HandleFinally
>000A3058    jmp         000A304A
 000A305A    pop         edi
 000A305B    pop         esi
 000A305C    pop         ebx
 000A305D    mov         esp,ebp
 000A305F    pop         ebp
 000A3060    ret
*}
end;

//000A3074
procedure sub_000A3074(?:TFormCharTable);
begin
{*
 000A3074    push        ebp
 000A3075    mov         ebp,esp
 000A3077    push        0
 000A3079    push        ebx
 000A307A    push        esi
 000A307B    push        edi
 000A307C    xor         edx,edx
 000A307E    push        ebp
 000A307F    push        0A3108
 000A3084    push        dword ptr fs:[edx]
 000A3087    mov         dword ptr fs:[edx],esp
 000A308A    mov         esi,dword ptr [eax+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A3090    xor         ebx,ebx
 000A3092    lea         eax,[ebp-4]
 000A3095    push        eax
 000A3096    lea         edi,[ebx+1]
 000A3099    mov         ecx,edi
 000A309B    mov         edx,3
 000A30A0    mov         eax,esi
 000A30A2    call        TStringGrid.GetCells
 000A30A7    cmp         dword ptr [ebp-4],0
>000A30AB    jne         000A30C2
 000A30AD    mov         eax,ebx
 000A30AF    xor         edx,edx
 000A30B1    mov         dl,al
 000A30B3    mov         ecx,dword ptr ds:[0B59F0];^gvar_000B6BF4
 000A30B9    lea         edx,[ecx+edx]
 000A30BC    push        edx
 000A30BD    pop         edx
 000A30BE    mov         byte ptr [edx],al
>000A30C0    jmp         000A30E9
 000A30C2    lea         eax,[ebp-4]
 000A30C5    push        eax
 000A30C6    mov         ecx,edi
 000A30C8    mov         edx,3
 000A30CD    mov         eax,esi
 000A30CF    call        TStringGrid.GetCells
 000A30D4    mov         eax,dword ptr [ebp-4]
 000A30D7    call        0007507C
 000A30DC    xor         edx,edx
 000A30DE    mov         dl,bl
 000A30E0    mov         ecx,dword ptr ds:[0B59F0];^gvar_000B6BF4
 000A30E6    mov         byte ptr [ecx+edx],al
 000A30E9    inc         ebx
 000A30EA    cmp         ebx,100
>000A30F0    jne         000A3092
 000A30F2    xor         eax,eax
 000A30F4    pop         edx
 000A30F5    pop         ecx
 000A30F6    pop         ecx
 000A30F7    mov         dword ptr fs:[eax],edx
 000A30FA    push        0A310F
 000A30FF    lea         eax,[ebp-4]
 000A3102    call        @LStrClr
 000A3107    ret
>000A3108    jmp         @HandleFinally
>000A310D    jmp         000A30FF
 000A310F    pop         edi
 000A3110    pop         esi
 000A3111    pop         ebx
 000A3112    pop         ecx
 000A3113    pop         ebp
 000A3114    ret
*}
end;

//000A3118
{*procedure TFormCharTable.StringGridCharTableDrawCell(?:?; ?:?);
begin
 000A3118    push        ebp
 000A3119    mov         ebp,esp
 000A311B    add         esp,0FFFFFFEC
 000A311E    push        ebx
 000A311F    push        esi
 000A3120    push        edi
 000A3121    xor         ebx,ebx
 000A3123    mov         dword ptr [ebp-14],ebx
 000A3126    mov         esi,dword ptr [ebp+0C]
 000A3129    lea         edi,[ebp-10]
 000A312C    push        ecx
 000A312D    mov         ecx,4
 000A3132    rep movs    dword ptr [edi],dword ptr [esi]
 000A3134    pop         ecx
 000A3135    mov         edi,ecx
 000A3137    mov         esi,eax
 000A3139    xor         eax,eax
 000A313B    push        ebp
 000A313C    push        0A31E4
 000A3141    push        dword ptr fs:[eax]
 000A3144    mov         dword ptr fs:[eax],esp
 000A3147    mov         eax,dword ptr [esi+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A314D    mov         ebx,dword ptr [eax+1EC];TStringGrid...............................................FCanva...
 000A3153    cmp         edi,2
>000A3156    jne         000A31CE
 000A3158    cmp         dword ptr [ebp+10],0
>000A315C    jle         000A31CE
 000A315E    mov         edx,0A31FC;'Terminal'
 000A3163    mov         eax,dword ptr [ebx+0C];TCanvas.Font:TFont
 000A3166    call        TFont.SetName
 000A316B    mov         eax,dword ptr [esi+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A3171    mov         edx,dword ptr [eax+220];TStringGrid.FFixedColor:TColor
 000A3177    mov         eax,dword ptr [ebx+14];TCanvas.Brush:TBrush
 000A317A    call        TBrush.SetColor
 000A317F    mov         edx,80000008
 000A3184    mov         eax,dword ptr [ebx+0C];TCanvas.Font:TFont
 000A3187    call        TFont.SetColor
 000A318C    mov         edx,0C
 000A3191    mov         eax,dword ptr [ebx+0C];TCanvas.Font:TFont
 000A3194    call        TFont.SetSize
 000A3199    lea         edx,[ebp-10]
 000A319C    mov         eax,ebx
 000A319E    call        TCanvas.FillRect
 000A31A3    lea         eax,[ebp-14]
 000A31A6    push        eax
 000A31A7    mov         ecx,dword ptr [ebp+10]
 000A31AA    mov         edx,edi
 000A31AC    mov         eax,dword ptr [esi+2EC];TFormCharTable.StringGridCharTable:TStringGrid
 000A31B2    call        TStringGrid.GetCells
 000A31B7    mov         eax,dword ptr [ebp-14]
 000A31BA    push        eax
 000A31BB    mov         ecx,dword ptr [ebp-0C]
 000A31BE    add         ecx,3
 000A31C1    mov         edx,dword ptr [ebp-10]
 000A31C4    add         edx,3;TRect.Left:Integer
 000A31C7    mov         eax,ebx
 000A31C9    call        TCanvas.TextOut
 000A31CE    xor         eax,eax
 000A31D0    pop         edx
 000A31D1    pop         ecx
 000A31D2    pop         ecx
 000A31D3    mov         dword ptr fs:[eax],edx
 000A31D6    push        0A31EB
 000A31DB    lea         eax,[ebp-14]
 000A31DE    call        @LStrClr
 000A31E3    ret
>000A31E4    jmp         @HandleFinally
>000A31E9    jmp         000A31DB
 000A31EB    pop         edi
 000A31EC    pop         esi
 000A31ED    pop         ebx
 000A31EE    mov         esp,ebp
 000A31F0    pop         ebp
 000A31F1    ret         0C
end;*}

//000A3208
procedure TFormCharTable.FormClose(Sender:TObject; var Action:TCloseAction);
begin
{*
 000A3208    xor         edx,edx
 000A320A    call        000876D8
 000A320F    ret
*}
end;

end.