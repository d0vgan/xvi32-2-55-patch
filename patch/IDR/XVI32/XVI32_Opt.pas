//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Opt;

interface

uses
  SysUtils, Classes, ExtCtrls, ComCtrls, StdCtrls, Spin;

type
  TFormOpt = class(TForm)
  published
    Panel1:TPanel;//f2C4
    PageControl1:TPageControl;//f2C8
    TabSheet2:TTabSheet;//f2CC
    ButtonOK:TButton;//f2D0
    ButtonCancel:TButton;//f2D4
    Label1:TLabel;//f2D8
    SpinEditFSize:TSpinEdit;//f2DC
    Label2:TLabel;//f2E0
    SpinEditCols:TSpinEdit;//f2E4
    Label3:TLabel;//f2E8
    SpinEditRows:TSpinEdit;//f2EC
    ButtonDefault:TButton;//f2F0
    Label4:TLabel;//f2F4
    ComboBoxFont:TComboBox;//f2F8
    TabSheet1:TTabSheet;//f2FC
    RadioGroupBase:TRadioGroup;//f300
    CheckBoxHideTool:TCheckBox;//f304
    CheckBoxOldFileTime:TCheckBox;//f308
    Label5:TLabel;//f30C
    SpinEditMRU:TSpinEdit;//f310
    Label7:TLabel;//f314
    ComboBoxColor:TComboBox;//f318
    CheckBoxNewEOF:TCheckBox;//f31C
    ButtonHelp:TButton;//f320
    CheckBoxTextGridLeft:TCheckBox;//f324
    TabSheet4:TTabSheet;//f328
    GroupBoxSendTo:TGroupBox;//f32C
    ButtonSendToCrea:TButton;//f330
    ButtonSendToRemove:TButton;//f334
    CheckBoxHideAddr:TCheckBox;//f338
    TabSheet3:TTabSheet;//f33C
    CheckBoxDIshort:TCheckBox;//f340
    CheckBoxDIsingle:TCheckBox;//f344
    CheckBoxDIword:TCheckBox;//f348
    CheckBoxDIdouble:TCheckBox;//f34C
    CheckBoxDIint:TCheckBox;//f350
    CheckBoxDIbin:TCheckBox;//f354
    CheckBoxDIlong:TCheckBox;//f358
    CheckBoxDIblock:TCheckBox;//f35C
    CheckBoxDIbyte:TCheckBox;//f360
    RadioGroupByteOrder:TRadioGroup;//f364
    CheckBoxUseWinFileReq:TCheckBox;//f368
    CheckBoxShowGrid:TCheckBox;//f36C
    CheckBoxUseBlank:TCheckBox;//f370
    procedure ButtonHelpClick(Sender:TObject);//000934D0
    procedure ButtonSendToCreaClick(Sender:TObject);//00093094
    procedure ButtonSendToRemoveClick(Sender:TObject);//00093114
    //procedure ComboBoxColorDrawItem(?:?; ?:?);//00093394
    procedure FormCreate(Sender:TObject);//000931B0
    procedure ButtonOKClick(Sender:TObject);//0009325C
    procedure ButtonDefaultClick(Sender:TObject);//0009326C
  public
    f374:String;//f374
  end;
    procedure sub_00092FA8(?:TFormOpt);//00092FA8

implementation

{$R *.DFM}

//00092FA8
procedure sub_00092FA8(?:TFormOpt);
begin
{*
 00092FA8    push        ebp
 00092FA9    mov         ebp,esp
 00092FAB    push        0
 00092FAD    push        0
 00092FAF    push        ebx
 00092FB0    mov         ebx,eax
 00092FB2    xor         eax,eax
 00092FB4    push        ebp
 00092FB5    push        93075
 00092FBA    push        dword ptr fs:[eax]
 00092FBD    mov         dword ptr fs:[eax],esp
 00092FC0    lea         edx,[ebp-4]
 00092FC3    mov         eax,82C
 00092FC8    call        LoadStr;'Scanning Shortcut Links...'
 00092FCD    mov         eax,dword ptr [ebp-4]
 00092FD0    call        000986CC
 00092FD5    xor         eax,eax
 00092FD7    push        ebp
 00092FD8    push        93053
 00092FDD    push        dword ptr fs:[eax]
 00092FE0    mov         dword ptr fs:[eax],esp
 00092FE3    lea         edx,[ebp-8]
 00092FE6    mov         eax,[000B59E8];^Application:TApplication
 00092FEB    mov         eax,dword ptr [eax]
 00092FED    call        TApplication.GetExeName
 00092FF2    mov         eax,dword ptr [ebp-8]
 00092FF5    lea         ecx,[ebp-4]
 00092FF8    mov         edx,9308C;'SendTo'
 00092FFD    call        0008FDA8
 00093002    mov         edx,dword ptr [ebp-4]
 00093005    lea         eax,[ebx+374]
 0009300B    call        @LStrAsg
 00093010    cmp         dword ptr [ebx+374],0
 00093017    sete        dl
 0009301A    mov         eax,dword ptr [ebx+330]
 00093020    mov         ecx,dword ptr [eax]
 00093022    call        dword ptr [ecx+60]
 00093025    mov         eax,dword ptr [ebx+330]
 0009302B    mov         edx,dword ptr [eax]
 0009302D    call        dword ptr [edx+50]
 00093030    mov         edx,eax
 00093032    xor         dl,1
 00093035    mov         eax,dword ptr [ebx+334]
 0009303B    mov         ecx,dword ptr [eax]
 0009303D    call        dword ptr [ecx+60]
 00093040    xor         eax,eax
 00093042    pop         edx
 00093043    pop         ecx
 00093044    pop         ecx
 00093045    mov         dword ptr fs:[eax],edx
 00093048    push        9305A
 0009304D    call        000986F4
 00093052    ret
>00093053    jmp         @HandleFinally
>00093058    jmp         0009304D
 0009305A    xor         eax,eax
 0009305C    pop         edx
 0009305D    pop         ecx
 0009305E    pop         ecx
 0009305F    mov         dword ptr fs:[eax],edx
 00093062    push        9307C
 00093067    lea         eax,[ebp-8]
 0009306A    mov         edx,2
 0009306F    call        @LStrArrayClr
 00093074    ret
>00093075    jmp         @HandleFinally
>0009307A    jmp         00093067
 0009307C    pop         ebx
 0009307D    pop         ecx
 0009307E    pop         ecx
 0009307F    pop         ebp
 00093080    ret
*}
end;

//00093094
procedure TFormOpt.ButtonSendToCreaClick(Sender:TObject);
begin
{*
 00093094    push        ebp
 00093095    mov         ebp,esp
 00093097    push        0
 00093099    push        ebx
 0009309A    mov         ebx,eax
 0009309C    xor         eax,eax
 0009309E    push        ebp
 0009309F    push        930E9
 000930A4    push        dword ptr fs:[eax]
 000930A7    mov         dword ptr fs:[eax],esp
 000930AA    lea         eax,[ebp-4]
 000930AD    mov         edx,930FC;'XVI32'
 000930B2    call        @LStrLAsg
 000930B7    push        0
 000930B9    lea         eax,[ebp-4]
 000930BC    mov         ecx,9310C;'SendTo'
 000930C1    xor         edx,edx
 000930C3    call        0008FEF4
 000930C8    test        al,al
>000930CA    je          000930D3
 000930CC    mov         eax,ebx
 000930CE    call        00092FA8
 000930D3    xor         eax,eax
 000930D5    pop         edx
 000930D6    pop         ecx
 000930D7    pop         ecx
 000930D8    mov         dword ptr fs:[eax],edx
 000930DB    push        930F0
 000930E0    lea         eax,[ebp-4]
 000930E3    call        @LStrClr
 000930E8    ret
>000930E9    jmp         @HandleFinally
>000930EE    jmp         000930E0
 000930F0    pop         ebx
 000930F1    pop         ecx
 000930F2    pop         ebp
 000930F3    ret
*}
end;

//00093114
procedure TFormOpt.ButtonSendToRemoveClick(Sender:TObject);
begin
{*
 00093114    push        ebp
 00093115    mov         ebp,esp
 00093117    push        0
 00093119    push        ebx
 0009311A    mov         ebx,eax
 0009311C    xor         eax,eax
 0009311E    push        ebp
 0009311F    push        93186
 00093124    push        dword ptr fs:[eax]
 00093127    mov         dword ptr fs:[eax],esp
 0009312A    cmp         dword ptr [ebx+374],0;TFormOpt.?f374:String
>00093131    je          00093170
 00093133    lea         edx,[ebp-4]
 00093136    mov         eax,9319C;'SendTo'
 0009313B    call        0008F57C
 00093140    push        dword ptr [ebp-4]
 00093143    push        931AC;'\'
 00093148    push        dword ptr [ebx+374];TFormOpt.?f374:String
 0009314E    lea         eax,[ebx+374];TFormOpt.?f374:String
 00093154    mov         edx,3
 00093159    call        @LStrCatN
 0009315E    mov         eax,dword ptr [ebx+374];TFormOpt.?f374:String
 00093164    call        DeleteFile
 00093169    mov         eax,ebx
 0009316B    call        00092FA8
 00093170    xor         eax,eax
 00093172    pop         edx
 00093173    pop         ecx
 00093174    pop         ecx
 00093175    mov         dword ptr fs:[eax],edx
 00093178    push        9318D
 0009317D    lea         eax,[ebp-4]
 00093180    call        @LStrClr
 00093185    ret
>00093186    jmp         @HandleFinally
>0009318B    jmp         0009317D
 0009318D    pop         ebx
 0009318E    pop         ecx
 0009318F    pop         ebp
 00093190    ret
*}
end;

//000931B0
procedure TFormOpt.FormCreate(Sender:TObject);
begin
{*
 000931B0    push        ebp
 000931B1    mov         ebp,esp
 000931B3    push        0
 000931B5    push        ebx
 000931B6    push        esi
 000931B7    mov         ebx,eax
 000931B9    xor         eax,eax
 000931BB    push        ebp
 000931BC    push        9324F
 000931C1    push        dword ptr fs:[eax]
 000931C4    mov         dword ptr fs:[eax],esp
 000931C7    xor         edx,edx
 000931C9    mov         eax,dword ptr [ebx+368];TFormOpt.CheckBoxUseWinFileReq:TCheckBox
 000931CF    call        TControl.SetVisible
 000931D4    mov         eax,ebx
 000931D6    call        00087A14
 000931DB    mov         eax,ebx
 000931DD    call        00087964
 000931E2    mov         eax,[000B5BDC];^Screen:TScreen
 000931E7    mov         eax,dword ptr [eax]
 000931E9    mov         edx,dword ptr [eax+24];TScreen.FFonts:TStrings
 000931EC    mov         eax,dword ptr [ebx+2F8];TFormOpt.ComboBoxFont:TComboBox
 000931F2    mov         eax,dword ptr [eax+1EC];TComboBox.FItems:TStrings
 000931F8    mov         ecx,dword ptr [eax]
 000931FA    call        dword ptr [ecx+8];TStrings.Assign
 000931FD    lea         edx,[ebp-4]
 00093200    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00093205    mov         eax,dword ptr [eax]
 00093207    mov         eax,dword ptr [eax+310]
 0009320D    mov         eax,dword ptr [eax+58]
 00093210    call        TFont.GetName
 00093215    mov         edx,dword ptr [ebp-4]
 00093218    mov         esi,dword ptr [ebx+2F8];TFormOpt.ComboBoxFont:TComboBox
 0009321E    mov         eax,dword ptr [esi+1EC];TComboBox.FItems:TStrings
 00093224    mov         ecx,dword ptr [eax]
 00093226    call        dword ptr [ecx+50];TStrings.IndexOf
 00093229    mov         edx,eax
 0009322B    mov         eax,esi
 0009322D    call        TCustomComboBox.SetItemIndex
 00093232    mov         eax,ebx
 00093234    call        00092FA8
 00093239    xor         eax,eax
 0009323B    pop         edx
 0009323C    pop         ecx
 0009323D    pop         ecx
 0009323E    mov         dword ptr fs:[eax],edx
 00093241    push        93256
 00093246    lea         eax,[ebp-4]
 00093249    call        @LStrClr
 0009324E    ret
>0009324F    jmp         @HandleFinally
>00093254    jmp         00093246
 00093256    pop         esi
 00093257    pop         ebx
 00093258    pop         ecx
 00093259    pop         ebp
 0009325A    ret
*}
end;

//0009325C
procedure TFormOpt.ButtonOKClick(Sender:TObject);
begin
{*
 0009325C    mov         eax,dword ptr [eax+2D0];TFormOpt.ButtonOK:TButton
 00093262    mov         edx,dword ptr [eax]
 00093264    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009326A    ret
*}
end;

//0009326C
procedure TFormOpt.ButtonDefaultClick(Sender:TObject);
begin
{*
 0009326C    push        ebp
 0009326D    mov         ebp,esp
 0009326F    push        0
 00093271    push        ebx
 00093272    push        esi
 00093273    mov         ebx,eax
 00093275    xor         eax,eax
 00093277    push        ebp
 00093278    push        93372
 0009327D    push        dword ptr fs:[eax]
 00093280    mov         dword ptr fs:[eax],esp
 00093283    mov         edx,8
 00093288    mov         eax,dword ptr [ebx+2DC];TFormOpt.SpinEditFSize:TSpinEdit
 0009328E    call        TSpinEdit.SetValue
 00093293    mov         edx,11
 00093298    mov         eax,dword ptr [ebx+2E4];TFormOpt.SpinEditCols:TSpinEdit
 0009329E    call        TSpinEdit.SetValue
 000932A3    mov         edx,13
 000932A8    mov         eax,dword ptr [ebx+2EC];TFormOpt.SpinEditRows:TSpinEdit
 000932AE    call        TSpinEdit.SetValue
 000932B3    mov         edx,5
 000932B8    mov         eax,dword ptr [ebx+310];TFormOpt.SpinEditMRU:TSpinEdit
 000932BE    call        TSpinEdit.SetValue
 000932C3    mov         esi,dword ptr [ebx+2F8];TFormOpt.ComboBoxFont:TComboBox
 000932C9    mov         eax,dword ptr [esi+1EC];TComboBox.FItems:TStrings
 000932CF    mov         edx,93388;'Courier New'
 000932D4    mov         ecx,dword ptr [eax]
 000932D6    call        dword ptr [ecx+50];TStrings.IndexOf
 000932D9    mov         edx,eax
 000932DB    mov         eax,esi
 000932DD    call        TCustomComboBox.SetItemIndex
 000932E2    xor         edx,edx
 000932E4    mov         eax,dword ptr [ebx+304];TFormOpt.CheckBoxHideTool:TCheckBox
 000932EA    mov         ecx,dword ptr [eax]
 000932EC    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
 000932F2    xor         edx,edx
 000932F4    mov         eax,dword ptr [ebx+338];TFormOpt.CheckBoxHideAddr:TCheckBox
 000932FA    mov         ecx,dword ptr [eax]
 000932FC    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
 00093302    xor         edx,edx
 00093304    mov         eax,dword ptr [ebx+324];TFormOpt.CheckBoxTextGridLeft:TCheckBox
 0009330A    mov         ecx,dword ptr [eax]
 0009330C    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
 00093312    mov         dl,1
 00093314    mov         eax,dword ptr [ebx+36C];TFormOpt.CheckBoxShowGrid:TCheckBox
 0009331A    mov         ecx,dword ptr [eax]
 0009331C    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
 00093322    xor         edx,edx
 00093324    mov         eax,dword ptr [ebx+370];TFormOpt.CheckBoxUseBlank:TCheckBox
 0009332A    mov         ecx,dword ptr [eax]
 0009332C    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
 00093332    mov         ebx,dword ptr [ebx+318];TFormOpt.ComboBoxColor:TComboBox
 00093338    lea         edx,[ebp-4]
 0009333B    mov         eax,0FF
 00093340    call        ColorToString
 00093345    mov         edx,dword ptr [ebp-4]
 00093348    mov         eax,dword ptr [ebx+1EC];TComboBox.FItems:TStrings
 0009334E    mov         ecx,dword ptr [eax]
 00093350    call        dword ptr [ecx+50];TStrings.IndexOf
 00093353    mov         edx,eax
 00093355    mov         eax,ebx
 00093357    call        TCustomComboBox.SetItemIndex
 0009335C    xor         eax,eax
 0009335E    pop         edx
 0009335F    pop         ecx
 00093360    pop         ecx
 00093361    mov         dword ptr fs:[eax],edx
 00093364    push        93379
 00093369    lea         eax,[ebp-4]
 0009336C    call        @LStrClr
 00093371    ret
>00093372    jmp         @HandleFinally
>00093377    jmp         00093369
 00093379    pop         esi
 0009337A    pop         ebx
 0009337B    pop         ecx
 0009337C    pop         ebp
 0009337D    ret
*}
end;

//00093394
{*procedure TFormOpt.ComboBoxColorDrawItem(?:?; ?:?);
begin
 00093394    push        ebp
 00093395    mov         ebp,esp
 00093397    add         esp,0FFFFFFC4
 0009339A    push        ebx
 0009339B    push        esi
 0009339C    push        edi
 0009339D    xor         ebx,ebx
 0009339F    mov         dword ptr [ebp-3C],ebx
 000933A2    mov         esi,dword ptr [ebp+0C]
 000933A5    lea         edi,[ebp-18]
 000933A8    push        ecx
 000933A9    mov         ecx,4
 000933AE    rep movs    dword ptr [edi],dword ptr [esi]
 000933B0    pop         ecx
 000933B1    mov         dword ptr [ebp-4],ecx
 000933B4    mov         ebx,edx
 000933B6    xor         eax,eax
 000933B8    push        ebp
 000933B9    push        934BF
 000933BE    push        dword ptr fs:[eax]
 000933C1    mov         dword ptr fs:[eax],esp
 000933C4    mov         eax,ebx
 000933C6    mov         edx,dword ptr ds:[35FBC];TComboBox
 000933CC    call        @AsClass
 000933D1    call        TCustomComboBox.GetItemHeight
 000933D6    mov         edx,dword ptr [ebp-18]
 000933D9    mov         ecx,edx
 000933DB    inc         ecx
 000933DC    mov         dword ptr [ebp-28],ecx
 000933DF    mov         ecx,dword ptr [ebp-14]
 000933E2    mov         esi,ecx
 000933E4    inc         esi
 000933E5    mov         dword ptr [ebp-24],esi
 000933E8    add         edx,eax
 000933EA    dec         edx
 000933EB    mov         dword ptr [ebp-20],edx
 000933EE    add         eax,ecx
 000933F0    dec         eax
 000933F1    mov         dword ptr [ebp-1C],eax
 000933F4    mov         eax,dword ptr [ebp-20]
 000933F7    add         eax,4
 000933FA    mov         dword ptr [ebp-38],eax
 000933FD    mov         dword ptr [ebp-34],esi
 00093400    mov         eax,dword ptr [ebp-10]
 00093403    mov         dword ptr [ebp-30],eax
 00093406    mov         eax,dword ptr [ebp-0C]
 00093409    dec         eax
 0009340A    mov         dword ptr [ebp-2C],eax
 0009340D    mov         eax,ebx
 0009340F    mov         edx,dword ptr ds:[35FBC];TComboBox
 00093415    call        @AsClass
 0009341A    mov         esi,eax
 0009341C    mov         ebx,dword ptr [esi+1F0];TComboBox.FCanvas:TCanvas
 00093422    lea         edx,[ebp-18]
 00093425    mov         eax,ebx
 00093427    call        TCanvas.FillRect
 0009342C    mov         eax,dword ptr [ebx+14];TCanvas.Brush:TBrush
 0009342F    call        TBrush.GetColor
 00093434    mov         dword ptr [ebp-8],eax
 00093437    lea         ecx,[ebp-3C]
 0009343A    mov         edx,dword ptr [ebp-4]
 0009343D    mov         eax,dword ptr [esi+1EC];TComboBox.FItems:TStrings
 00093443    mov         edi,dword ptr [eax]
 00093445    call        dword ptr [edi+0C];TStrings.Get
 00093448    mov         eax,dword ptr [ebp-3C]
 0009344B    call        StringToColor
 00093450    mov         edx,eax
 00093452    mov         eax,dword ptr [ebx+14];TCanvas.Brush:TBrush
 00093455    call        TBrush.SetColor
 0009345A    mov         eax,dword ptr [ebp-20]
 0009345D    push        eax
 0009345E    mov         eax,dword ptr [ebp-1C]
 00093461    push        eax
 00093462    mov         ecx,dword ptr [ebp-24]
 00093465    mov         edx,dword ptr [ebp-28]
 00093468    mov         eax,ebx
 0009346A    call        TCanvas.Rectangle
 0009346F    mov         edx,dword ptr [ebp-8]
 00093472    mov         eax,dword ptr [ebx+14];TCanvas.Brush:TBrush
 00093475    call        TBrush.SetColor
 0009347A    push        24
 0009347C    lea         eax,[ebp-38]
 0009347F    push        eax
 00093480    push        0FF
 00093482    lea         ecx,[ebp-3C]
 00093485    mov         edx,dword ptr [ebp-4]
 00093488    mov         eax,dword ptr [esi+1EC];TComboBox.FItems:TStrings
 0009348E    mov         esi,dword ptr [eax]
 00093490    call        dword ptr [esi+0C];TStrings.Get
 00093493    mov         eax,dword ptr [ebp-3C]
 00093496    call        @LStrToPChar
 0009349B    push        eax
 0009349C    mov         eax,ebx
 0009349E    call        TCanvas.GetHandle
 000934A3    push        eax
 000934A4    call        user32.DrawTextA
 000934A9    xor         eax,eax
 000934AB    pop         edx
 000934AC    pop         ecx
 000934AD    pop         ecx
 000934AE    mov         dword ptr fs:[eax],edx
 000934B1    push        934C6
 000934B6    lea         eax,[ebp-3C]
 000934B9    call        @LStrClr
 000934BE    ret
>000934BF    jmp         @HandleFinally
>000934C4    jmp         000934B6
 000934C6    pop         edi
 000934C7    pop         esi
 000934C8    pop         ebx
 000934C9    mov         esp,ebp
 000934CB    pop         ebp
 000934CC    ret         8
end;*}

//000934D0
procedure TFormOpt.ButtonHelpClick(Sender:TObject);
begin
{*
 000934D0    mov         edx,dword ptr [eax+2C8];TFormOpt.PageControl1:TPageControl
 000934D6    mov         edx,dword ptr [edx+23C];TPageControl.ActivePage:TTabSheet
 000934DC    cmp         edx,dword ptr [eax+2FC];TFormOpt.TabSheet1:TTabSheet
>000934E2    jne         000934F6
 000934E4    mov         eax,[000B59E8];^Application:TApplication
 000934E9    mov         eax,dword ptr [eax]
 000934EB    mov         edx,11
 000934F0    call        TApplication.HelpContext
 000934F5    ret
 000934F6    cmp         edx,dword ptr [eax+2CC];TFormOpt.TabSheet2:TTabSheet
>000934FC    jne         00093511
 000934FE    mov         eax,[000B59E8];^Application:TApplication
 00093503    mov         eax,dword ptr [eax]
 00093505    mov         edx,52
 0009350A    call        TApplication.HelpContext
>0009350F    jmp         0009353D
 00093511    cmp         edx,dword ptr [eax+33C];TFormOpt.TabSheet3:TTabSheet
>00093517    jne         0009352C
 00093519    mov         eax,[000B59E8];^Application:TApplication
 0009351E    mov         eax,dword ptr [eax]
 00093520    mov         edx,53
 00093525    call        TApplication.HelpContext
>0009352A    jmp         0009353D
 0009352C    mov         eax,[000B59E8];^Application:TApplication
 00093531    mov         eax,dword ptr [eax]
 00093533    mov         edx,54
 00093538    call        TApplication.HelpContext
 0009353D    ret
*}
end;

end.