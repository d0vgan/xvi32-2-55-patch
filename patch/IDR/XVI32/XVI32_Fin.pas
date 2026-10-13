//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Fin;

interface

uses
  SysUtils, Classes, StdCtrls, Buttons, CMkomp40, CMHstBtn;

type
  TFormFind = class(TForm)
  published
    GroupBox1:TGroupBox;//f2C4
    ButtonOK:TButton;//f2C8
    ButtonCancel:TButton;//f2CC
    BitBtnConvert:TBitBtn;//f2D0
    GroupBox2:TGroupBox;//f2D4
    CheckBoxCase:TCheckBox;//f2D8
    GroupBox3:TGroupBox;//f2DC
    rbtDown:TRadioButton;//f2E0
    rbtUp:TRadioButton;//f2E4
    CheckBoxJokerFind:TCheckBox;//f2E8
    CMByteEditJoker:TCMByteEdit;//f2EC
    LabelJoker:TLabel;//f2F0
    ButtonHelp:TButton;//f2F4
    GroupBox4:TGroupBox;//f2F8
    rbtCursor:TRadioButton;//f2FC
    rbtBeginEnd:TRadioButton;//f300
    EditFindT:TEdit;//f304
    CMByteEditFindH:TCMByteEdit;//f308
    CMHistoryBtnFindT:TCMHistoryBtn;//f30C
    CMHistoryBtnFindH:TCMHistoryBtn;//f310
    RadioButtonHex:TRadioButton;//f314
    RadioButtonText:TRadioButton;//f318
    CheckBoxFindUTF16:TCheckBox;//f31C
    procedure rbtDownClick(Sender:TObject);//0009F0EC
    procedure ButtonHelpClick(Sender:TObject);//0009F060
    procedure CMByteEditFindHKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//0009F180
    procedure FormShow(Sender:TObject);//0009F1E0
    procedure RadioButtonTextClick(Sender:TObject);//0009F1A4
    procedure FormDestroy(Sender:TObject);//0009ED78
    procedure FormCreate(Sender:TObject);//0009ECF4
    procedure BitBtnConvertClick(Sender:TObject);//0009ED98
    procedure CMByteEditJokerExit(Sender:TObject);//0009EE0C
    procedure ButtonOKClick(Sender:TObject);//0009EE60
  public
    f320:String;//f320
  end;

implementation

{$R *.DFM}

//0009ECF4
procedure TFormFind.FormCreate(Sender:TObject);
begin
{*
 0009ECF4    push        ebp
 0009ECF5    mov         ebp,esp
 0009ECF7    push        0
 0009ECF9    push        ebx
 0009ECFA    mov         ebx,eax
 0009ECFC    xor         eax,eax
 0009ECFE    push        ebp
 0009ECFF    push        9ED6B
 0009ED04    push        dword ptr fs:[eax]
 0009ED07    mov         dword ptr fs:[eax],esp
 0009ED0A    mov         eax,ebx
 0009ED0C    call        00087A14
 0009ED11    mov         eax,ebx
 0009ED13    call        00087964
 0009ED18    xor         edx,edx
 0009ED1A    mov         eax,dword ptr [ebx+30C];TFormFind.CMHistoryBtnFindT:TCMHistoryBtn
 0009ED20    call        0009CAE4
 0009ED25    xor         edx,edx
 0009ED27    mov         eax,dword ptr [ebx+310];TFormFind.CMHistoryBtnFindH:TCMHistoryBtn
 0009ED2D    call        0009CAE4
 0009ED32    lea         edx,[ebp-4]
 0009ED35    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009ED3A    movzx       eax,byte ptr [eax]
 0009ED3D    add         eax,85C
 0009ED42    call        LoadStr
 0009ED47    mov         edx,dword ptr [ebp-4]
 0009ED4A    mov         eax,dword ptr [ebx+31C];TFormFind.CheckBoxFindUTF16:TCheckBox
 0009ED50    call        TControl.SetText
 0009ED55    xor         eax,eax
 0009ED57    pop         edx
 0009ED58    pop         ecx
 0009ED59    pop         ecx
 0009ED5A    mov         dword ptr fs:[eax],edx
 0009ED5D    push        9ED72
 0009ED62    lea         eax,[ebp-4]
 0009ED65    call        @LStrClr
 0009ED6A    ret
>0009ED6B    jmp         @HandleFinally
>0009ED70    jmp         0009ED62
 0009ED72    pop         ebx
 0009ED73    pop         ecx
 0009ED74    pop         ebp
 0009ED75    ret
*}
end;

//0009ED78
procedure TFormFind.FormDestroy(Sender:TObject);
begin
{*
 0009ED78    push        ebx
 0009ED79    mov         ebx,eax
 0009ED7B    xor         edx,edx
 0009ED7D    mov         eax,dword ptr [ebx+30C];TFormFind.CMHistoryBtnFindT:TCMHistoryBtn
 0009ED83    call        0009CB94
 0009ED88    xor         edx,edx
 0009ED8A    mov         eax,dword ptr [ebx+310];TFormFind.CMHistoryBtnFindH:TCMHistoryBtn
 0009ED90    call        0009CB94
 0009ED95    pop         ebx
 0009ED96    ret
*}
end;

//0009ED98
procedure TFormFind.BitBtnConvertClick(Sender:TObject);
begin
{*
 0009ED98    push        ebp
 0009ED99    mov         ebp,esp
 0009ED9B    push        0
 0009ED9D    push        ebx
 0009ED9E    mov         ebx,eax
 0009EDA0    xor         eax,eax
 0009EDA2    push        ebp
 0009EDA3    push        9EDFE
 0009EDA8    push        dword ptr fs:[eax]
 0009EDAB    mov         dword ptr fs:[eax],esp
 0009EDAE    lea         edx,[ebp-4]
 0009EDB1    mov         eax,dword ptr [ebx+304];TFormFind.EditFindT:TEdit
 0009EDB7    call        TControl.GetText
 0009EDBC    mov         edx,dword ptr [ebp-4]
 0009EDBF    mov         eax,dword ptr [ebx+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009EDC5    call        TCMByteEdit.SetASCII
 0009EDCA    mov         dl,1
 0009EDCC    mov         eax,dword ptr [ebx+314];TFormFind.RadioButtonHex:TRadioButton
 0009EDD2    mov         ecx,dword ptr [eax]
 0009EDD4    call        dword ptr [ecx+0BC];TRadioButton.SetChecked
 0009EDDA    mov         eax,dword ptr [ebx+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009EDE0    mov         edx,dword ptr [eax]
 0009EDE2    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009EDE8    xor         eax,eax
 0009EDEA    pop         edx
 0009EDEB    pop         ecx
 0009EDEC    pop         ecx
 0009EDED    mov         dword ptr fs:[eax],edx
 0009EDF0    push        9EE05
 0009EDF5    lea         eax,[ebp-4]
 0009EDF8    call        @LStrClr
 0009EDFD    ret
>0009EDFE    jmp         @HandleFinally
>0009EE03    jmp         0009EDF5
 0009EE05    pop         ebx
 0009EE06    pop         ecx
 0009EE07    pop         ebp
 0009EE08    ret
*}
end;

//0009EE0C
procedure TFormFind.CMByteEditJokerExit(Sender:TObject);
begin
{*
 0009EE0C    push        ebp
 0009EE0D    mov         ebp,esp
 0009EE0F    push        0
 0009EE11    push        ebx
 0009EE12    mov         ebx,eax
 0009EE14    xor         eax,eax
 0009EE16    push        ebp
 0009EE17    push        9EE54
 0009EE1C    push        dword ptr fs:[eax]
 0009EE1F    mov         dword ptr fs:[eax],esp
 0009EE22    lea         edx,[ebp-4]
 0009EE25    mov         eax,dword ptr [ebx+2EC];TFormFind.CMByteEditJoker:TCMByteEdit
 0009EE2B    call        TCMByteEdit.GetASCII
 0009EE30    mov         edx,dword ptr [ebp-4]
 0009EE33    mov         eax,dword ptr [ebx+2F0];TFormFind.LabelJoker:TLabel
 0009EE39    call        TControl.SetText
 0009EE3E    xor         eax,eax
 0009EE40    pop         edx
 0009EE41    pop         ecx
 0009EE42    pop         ecx
 0009EE43    mov         dword ptr fs:[eax],edx
 0009EE46    push        9EE5B
 0009EE4B    lea         eax,[ebp-4]
 0009EE4E    call        @LStrClr
 0009EE53    ret
>0009EE54    jmp         @HandleFinally
>0009EE59    jmp         0009EE4B
 0009EE5B    pop         ebx
 0009EE5C    pop         ecx
 0009EE5D    pop         ebp
 0009EE5E    ret
*}
end;

//0009EE60
procedure TFormFind.ButtonOKClick(Sender:TObject);
begin
{*
 0009EE60    push        ebp
 0009EE61    mov         ebp,esp
 0009EE63    push        0
 0009EE65    push        0
 0009EE67    push        esi
 0009EE68    mov         esi,eax
 0009EE6A    xor         eax,eax
 0009EE6C    push        ebp
 0009EE6D    push        9F051
 0009EE72    push        dword ptr fs:[eax]
 0009EE75    mov         dword ptr fs:[eax],esp
 0009EE78    mov         eax,edx
 0009EE7A    mov         edx,dword ptr [eax]
 0009EE7C    call        dword ptr [edx+0B4]
 0009EE82    mov         eax,dword ptr [esi+2EC];TFormFind.CMByteEditJoker:TCMByteEdit
 0009EE88    call        00076FEC
 0009EE8D    test        al,al
>0009EE8F    jne         0009EEC1
 0009EE91    lea         edx,[ebp-4]
 0009EE94    mov         eax,805
 0009EE99    call        LoadStr;'Enter joker char'
 0009EE9E    mov         eax,dword ptr [ebp-4]
 0009EEA1    call        0008D0A8
 0009EEA6    mov         eax,dword ptr [esi+2EC];TFormFind.CMByteEditJoker:TCMByteEdit
 0009EEAC    mov         edx,dword ptr [eax]
 0009EEAE    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009EEB4    xor         eax,eax
 0009EEB6    mov         dword ptr [esi+22C],eax;TFormFind.FModalResult:TModalResult
>0009EEBC    jmp         0009F033
 0009EEC1    mov         eax,dword ptr [esi+318];TFormFind.RadioButtonText:TRadioButton
 0009EEC7    mov         edx,dword ptr [eax]
 0009EEC9    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009EECF    test        al,al
>0009EED1    je          0009EF69
 0009EED7    lea         edx,[ebp-8]
 0009EEDA    mov         eax,dword ptr [esi+304];TFormFind.EditFindT:TEdit
 0009EEE0    call        TControl.GetText
 0009EEE5    mov         edx,dword ptr [ebp-8]
 0009EEE8    lea         eax,[esi+320];TFormFind.?f320:String
 0009EEEE    call        @LStrAsg
 0009EEF3    cmp         dword ptr [esi+320],0;TFormFind.?f320:String
>0009EEFA    jne         0009EF27
 0009EEFC    lea         edx,[ebp-4]
 0009EEFF    mov         eax,807
 0009EF04    call        LoadStr;'Can't find empty string'
 0009EF09    mov         eax,dword ptr [ebp-4]
 0009EF0C    call        0008D0A8
 0009EF11    mov         eax,dword ptr [esi+304];TFormFind.EditFindT:TEdit
 0009EF17    mov         edx,dword ptr [eax]
 0009EF19    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009EF1F    xor         eax,eax
 0009EF21    mov         dword ptr [esi+22C],eax;TFormFind.FModalResult:TModalResult
 0009EF27    mov         eax,dword ptr [esi+31C];TFormFind.CheckBoxFindUTF16:TCheckBox
 0009EF2D    mov         edx,dword ptr [eax]
 0009EF2F    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 0009EF35    test        al,al
>0009EF37    je          0009F033
 0009EF3D    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009EF42    cmp         byte ptr [eax],0
 0009EF45    sete        dl
 0009EF48    lea         ecx,[ebp-4]
 0009EF4B    mov         eax,dword ptr [esi+320];TFormFind.?f320:String
 0009EF51    call        0007556C
 0009EF56    mov         edx,dword ptr [ebp-4]
 0009EF59    lea         eax,[esi+320];TFormFind.?f320:String
 0009EF5F    call        @LStrAsg
>0009EF64    jmp         0009F033
 0009EF69    mov         eax,dword ptr [esi+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009EF6F    call        00076FEC
 0009EF74    test        al,al
>0009EF76    jne         0009EFA8
 0009EF78    lea         edx,[ebp-4]
 0009EF7B    mov         eax,806
 0009EF80    call        LoadStr;'Hex string invalid'
 0009EF85    mov         eax,dword ptr [ebp-4]
 0009EF88    call        0008D0A8
 0009EF8D    mov         eax,dword ptr [esi+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009EF93    mov         edx,dword ptr [eax]
 0009EF95    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009EF9B    xor         eax,eax
 0009EF9D    mov         dword ptr [esi+22C],eax;TFormFind.FModalResult:TModalResult
>0009EFA3    jmp         0009F033
 0009EFA8    lea         edx,[ebp-4]
 0009EFAB    mov         eax,dword ptr [esi+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009EFB1    call        TCMByteEdit.GetASCII
 0009EFB6    mov         edx,dword ptr [ebp-4]
 0009EFB9    lea         eax,[esi+320];TFormFind.?f320:String
 0009EFBF    call        @LStrAsg
 0009EFC4    mov         eax,dword ptr [esi+314];TFormFind.RadioButtonHex:TRadioButton
 0009EFCA    mov         edx,dword ptr [eax]
 0009EFCC    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009EFD2    test        al,al
>0009EFD4    je          0009F033
 0009EFD6    mov         eax,dword ptr [esi+2D8];TFormFind.CheckBoxCase:TCheckBox
 0009EFDC    mov         edx,dword ptr [eax]
 0009EFDE    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 0009EFE4    test        al,al
>0009EFE6    jne         0009F033
 0009EFE8    mov         eax,dword ptr [esi+320];TFormFind.?f320:String
 0009EFEE    call        00075350
 0009EFF3    test        al,al
>0009EFF5    je          0009F033
 0009EFF7    lea         edx,[ebp-4]
 0009EFFA    mov         eax,82E
 0009EFFF    call        LoadStr;'The hex string to find contains case sensitive chars.
Because you have NOT checked "Case sensitive",
this may produce unwanted results.

Perform instead a CASE SENSITIVE search?'
 0009F004    mov         eax,dword ptr [ebp-4]
 0009F007    call        0008D0E0
 0009F00C    sub         ax,6
>0009F010    je          0009F019
 0009F012    dec         ax
>0009F015    je          0009F033
>0009F017    jmp         0009F02B
 0009F019    mov         dl,1
 0009F01B    mov         eax,dword ptr [esi+2D8];TFormFind.CheckBoxCase:TCheckBox
 0009F021    mov         ecx,dword ptr [eax]
 0009F023    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
>0009F029    jmp         0009F033
 0009F02B    xor         eax,eax
 0009F02D    mov         dword ptr [esi+22C],eax;TFormFind.FModalResult:TModalResult
 0009F033    xor         eax,eax
 0009F035    pop         edx
 0009F036    pop         ecx
 0009F037    pop         ecx
 0009F038    mov         dword ptr fs:[eax],edx
 0009F03B    push        9F058
 0009F040    lea         eax,[ebp-8]
 0009F043    call        @LStrClr
 0009F048    lea         eax,[ebp-4]
 0009F04B    call        @LStrClr
 0009F050    ret
>0009F051    jmp         @HandleFinally
>0009F056    jmp         0009F040
 0009F058    pop         esi
 0009F059    pop         ecx
 0009F05A    pop         ecx
 0009F05B    pop         ebp
 0009F05C    ret
*}
end;

//0009F060
procedure TFormFind.ButtonHelpClick(Sender:TObject);
begin
{*
 0009F060    push        ebp
 0009F061    mov         ebp,esp
 0009F063    push        0
 0009F065    push        0
 0009F067    push        ebx
 0009F068    mov         ebx,eax
 0009F06A    xor         eax,eax
 0009F06C    push        ebp
 0009F06D    push        9F0E0
 0009F072    push        dword ptr fs:[eax]
 0009F075    mov         dword ptr fs:[eax],esp
 0009F078    lea         edx,[ebp-4]
 0009F07B    mov         eax,ebx
 0009F07D    call        TControl.GetText
 0009F082    mov         eax,dword ptr [ebp-4]
 0009F085    push        eax
 0009F086    lea         edx,[ebp-8]
 0009F089    mov         eax,800
 0009F08E    call        LoadStr;'Find'
 0009F093    mov         edx,dword ptr [ebp-8]
 0009F096    pop         eax
 0009F097    call        @LStrCmp
>0009F09C    jne         0009F0B1
 0009F09E    mov         eax,[000B59E8];^Application:TApplication
 0009F0A3    mov         eax,dword ptr [eax]
 0009F0A5    mov         edx,33
 0009F0AA    call        TApplication.HelpContext
>0009F0AF    jmp         0009F0C2
 0009F0B1    mov         eax,[000B59E8];^Application:TApplication
 0009F0B6    mov         eax,dword ptr [eax]
 0009F0B8    mov         edx,34
 0009F0BD    call        TApplication.HelpContext
 0009F0C2    xor         eax,eax
 0009F0C4    pop         edx
 0009F0C5    pop         ecx
 0009F0C6    pop         ecx
 0009F0C7    mov         dword ptr fs:[eax],edx
 0009F0CA    push        9F0E7
 0009F0CF    lea         eax,[ebp-8]
 0009F0D2    call        @LStrClr
 0009F0D7    lea         eax,[ebp-4]
 0009F0DA    call        @LStrClr
 0009F0DF    ret
>0009F0E0    jmp         @HandleFinally
>0009F0E5    jmp         0009F0CF
 0009F0E7    pop         ebx
 0009F0E8    pop         ecx
 0009F0E9    pop         ecx
 0009F0EA    pop         ebp
 0009F0EB    ret
*}
end;

//0009F0EC
procedure TFormFind.rbtDownClick(Sender:TObject);
begin
{*
 0009F0EC    push        ebp
 0009F0ED    mov         ebp,esp
 0009F0EF    push        0
 0009F0F1    push        ebx
 0009F0F2    push        esi
 0009F0F3    mov         esi,edx
 0009F0F5    mov         ebx,eax
 0009F0F7    xor         eax,eax
 0009F0F9    push        ebp
 0009F0FA    push        9F162
 0009F0FF    push        dword ptr fs:[eax]
 0009F102    mov         dword ptr fs:[eax],esp
 0009F105    mov         eax,dword ptr [esi+8]
 0009F108    mov         edx,9F178;'rbtDown'
 0009F10D    call        @LStrCmp
>0009F112    jne         0009F131
 0009F114    lea         edx,[ebp-4]
 0009F117    mov         eax,81D
 0009F11C    call        LoadStr;'&Begin'
 0009F121    mov         edx,dword ptr [ebp-4]
 0009F124    mov         eax,dword ptr [ebx+300];TFormFind.rbtBeginEnd:TRadioButton
 0009F12A    call        TControl.SetText
>0009F12F    jmp         0009F14C
 0009F131    lea         edx,[ebp-4]
 0009F134    mov         eax,81E
 0009F139    call        LoadStr;'&End'
 0009F13E    mov         edx,dword ptr [ebp-4]
 0009F141    mov         eax,dword ptr [ebx+300];TFormFind.rbtBeginEnd:TRadioButton
 0009F147    call        TControl.SetText
 0009F14C    xor         eax,eax
 0009F14E    pop         edx
 0009F14F    pop         ecx
 0009F150    pop         ecx
 0009F151    mov         dword ptr fs:[eax],edx
 0009F154    push        9F169
 0009F159    lea         eax,[ebp-4]
 0009F15C    call        @LStrClr
 0009F161    ret
>0009F162    jmp         @HandleFinally
>0009F167    jmp         0009F159
 0009F169    pop         esi
 0009F16A    pop         ebx
 0009F16B    pop         ecx
 0009F16C    pop         ebp
 0009F16D    ret
*}
end;

//0009F180
procedure TFormFind.CMByteEditFindHKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 0009F180    push        ebp
 0009F181    mov         ebp,esp
 0009F183    push        ebx
 0009F184    mov         ebx,edx
 0009F186    cmp         word ptr [ecx],27
>0009F18A    jne         0009F19E
 0009F18C    mov         eax,ebx
 0009F18E    mov         edx,dword ptr ds:[75A34];TCMByteEdit
 0009F194    call        @AsClass
 0009F199    call        0009B254
 0009F19E    pop         ebx
 0009F19F    pop         ebp
 0009F1A0    ret         4
*}
end;

//0009F1A4
procedure TFormFind.RadioButtonTextClick(Sender:TObject);
begin
{*
 0009F1A4    add         esp,0FFFFFFF0
 0009F1A7    mov         edx,dword ptr [eax+318];TFormFind.RadioButtonText:TRadioButton
 0009F1AD    mov         dword ptr [esp],edx
 0009F1B0    mov         edx,dword ptr [eax+304];TFormFind.EditFindT:TEdit
 0009F1B6    mov         dword ptr [esp+4],edx
 0009F1BA    mov         edx,dword ptr [eax+314];TFormFind.RadioButtonHex:TRadioButton
 0009F1C0    mov         dword ptr [esp+8],edx
 0009F1C4    mov         eax,dword ptr [eax+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009F1CA    mov         dword ptr [esp+0C],eax
 0009F1CE    mov         eax,esp
 0009F1D0    mov         edx,3
 0009F1D5    call        00087E28
 0009F1DA    add         esp,10
 0009F1DD    ret
*}
end;

//0009F1E0
procedure TFormFind.FormShow(Sender:TObject);
begin
{*
 0009F1E0    add         esp,0FFFFFFF0
 0009F1E3    mov         edx,dword ptr [eax+318];TFormFind.RadioButtonText:TRadioButton
 0009F1E9    mov         dword ptr [esp],edx
 0009F1EC    mov         edx,dword ptr [eax+304];TFormFind.EditFindT:TEdit
 0009F1F2    mov         dword ptr [esp+4],edx
 0009F1F6    mov         edx,dword ptr [eax+314];TFormFind.RadioButtonHex:TRadioButton
 0009F1FC    mov         dword ptr [esp+8],edx
 0009F200    mov         eax,dword ptr [eax+308];TFormFind.CMByteEditFindH:TCMByteEdit
 0009F206    mov         dword ptr [esp+0C],eax
 0009F20A    mov         eax,esp
 0009F20C    mov         edx,3
 0009F211    call        00087E28
 0009F216    add         esp,10
 0009F219    ret
*}
end;

end.