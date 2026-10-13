//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Rep;

interface

uses
  SysUtils, Classes, StdCtrls, Buttons, CMkomp40, CMHstBtn;

type
  TFormReplace = class(TForm)
  published
    GroupBoxFind:TGroupBox;//f2C4
    RadioButtonFindT:TRadioButton;//f2C8
    RadioButtonFindH:TRadioButton;//f2CC
    ButtonOK:TButton;//f2D0
    ButtonCancel:TButton;//f2D4
    BitBtnConvFind:TBitBtn;//f2D8
    GroupBox2:TGroupBox;//f2DC
    CheckBoxCase:TCheckBox;//f2E0
    CheckBoxJokerFind:TCheckBox;//f2E4
    CMByteEditJoker:TCMByteEdit;//f2E8
    LabelJoker:TLabel;//f2EC
    ButtonReplAll:TButton;//f2F0
    GroupBoxReplace:TGroupBox;//f2F4
    RadioButtonReplT:TRadioButton;//f2F8
    RadioButtonReplH:TRadioButton;//f2FC
    BitBtnConvertRepl:TBitBtn;//f300
    ButtonHelp:TButton;//f304
    GroupBox4:TGroupBox;//f308
    rbtCursor:TRadioButton;//f30C
    rbtBeginEnd:TRadioButton;//f310
    EditFindT:TEdit;//f314
    CMByteEditFindH:TCMByteEdit;//f318
    EditReplT:TEdit;//f31C
    CMByteEditReplH:TCMByteEdit;//f320
    CMHistoryBtnFindT:TCMHistoryBtn;//f324
    CMHistoryBtnFindH:TCMHistoryBtn;//f328
    CMHistoryBtnReplT:TCMHistoryBtn;//f32C
    CMHistoryBtnReplH:TCMHistoryBtn;//f330
    CheckBoxFindUTF16:TCheckBox;//f334
    CheckBoxReplUTF16:TCheckBox;//f338
    procedure ButtonHelpClick(Sender:TObject);//0009FCF0
    procedure FormShow(Sender:TObject);//0009F818
    procedure CMByteEditFindHKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//0009FD04
    procedure CMRadioBtnReplClick(Sender:TObject);//0009FD64
    procedure CMRadioBtnFindClick(Sender:TObject);//0009FD28
    procedure BitBtnConvertReplClick(Sender:TObject);//0009F93C
    procedure FormDestroy(Sender:TObject);//0009F88C
    procedure FormCreate(Sender:TObject);//0009F758
    procedure BitBtnConvFindClick(Sender:TObject);//0009F8C8
    procedure CMByteEditJokerExit(Sender:TObject);//0009F9B0
    procedure ButtonOKClick(Sender:TObject);//0009FA04
  public
    f33C:String;//f33C
    f340:String;//f340
    f344:byte;//f344
  end;

implementation

{$R *.DFM}

//0009F758
procedure TFormReplace.FormCreate(Sender:TObject);
begin
{*
 0009F758    push        ebp
 0009F759    mov         ebp,esp
 0009F75B    push        0
 0009F75D    push        ebx
 0009F75E    mov         ebx,eax
 0009F760    xor         eax,eax
 0009F762    push        ebp
 0009F763    push        9F80C
 0009F768    push        dword ptr fs:[eax]
 0009F76B    mov         dword ptr fs:[eax],esp
 0009F76E    mov         eax,ebx
 0009F770    call        00087A14
 0009F775    mov         eax,ebx
 0009F777    call        00087964
 0009F77C    xor         edx,edx
 0009F77E    mov         eax,dword ptr [ebx+324];TFormReplace.CMHistoryBtnFindT:TCMHistoryBtn
 0009F784    call        0009CAE4
 0009F789    xor         edx,edx
 0009F78B    mov         eax,dword ptr [ebx+328];TFormReplace.CMHistoryBtnFindH:TCMHistoryBtn
 0009F791    call        0009CAE4
 0009F796    xor         edx,edx
 0009F798    mov         eax,dword ptr [ebx+32C];TFormReplace.CMHistoryBtnReplT:TCMHistoryBtn
 0009F79E    call        0009CAE4
 0009F7A3    xor         edx,edx
 0009F7A5    mov         eax,dword ptr [ebx+330];TFormReplace.CMHistoryBtnReplH:TCMHistoryBtn
 0009F7AB    call        0009CAE4
 0009F7B0    lea         edx,[ebp-4]
 0009F7B3    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009F7B8    movzx       eax,byte ptr [eax]
 0009F7BB    add         eax,85C
 0009F7C0    call        LoadStr
 0009F7C5    mov         edx,dword ptr [ebp-4]
 0009F7C8    mov         eax,dword ptr [ebx+334];TFormReplace.CheckBoxFindUTF16:TCheckBox
 0009F7CE    call        TControl.SetText
 0009F7D3    lea         edx,[ebp-4]
 0009F7D6    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009F7DB    movzx       eax,byte ptr [eax]
 0009F7DE    add         eax,85E
 0009F7E3    call        LoadStr
 0009F7E8    mov         edx,dword ptr [ebp-4]
 0009F7EB    mov         eax,dword ptr [ebx+338];TFormReplace.CheckBoxReplUTF16:TCheckBox
 0009F7F1    call        TControl.SetText
 0009F7F6    xor         eax,eax
 0009F7F8    pop         edx
 0009F7F9    pop         ecx
 0009F7FA    pop         ecx
 0009F7FB    mov         dword ptr fs:[eax],edx
 0009F7FE    push        9F813
 0009F803    lea         eax,[ebp-4]
 0009F806    call        @LStrClr
 0009F80B    ret
>0009F80C    jmp         @HandleFinally
>0009F811    jmp         0009F803
 0009F813    pop         ebx
 0009F814    pop         ecx
 0009F815    pop         ebp
 0009F816    ret
*}
end;

//0009F818
procedure TFormReplace.FormShow(Sender:TObject);
begin
{*
 0009F818    push        ebx
 0009F819    add         esp,0FFFFFFF0
 0009F81C    mov         ebx,eax
 0009F81E    mov         eax,dword ptr [ebx+2F8];TFormReplace.RadioButtonReplT:TRadioButton
 0009F824    mov         dword ptr [esp],eax
 0009F827    mov         eax,dword ptr [ebx+31C];TFormReplace.EditReplT:TEdit
 0009F82D    mov         dword ptr [esp+4],eax
 0009F831    mov         eax,dword ptr [ebx+2FC];TFormReplace.RadioButtonReplH:TRadioButton
 0009F837    mov         dword ptr [esp+8],eax
 0009F83B    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009F841    mov         dword ptr [esp+0C],eax
 0009F845    mov         eax,esp
 0009F847    mov         edx,3
 0009F84C    call        00087E28
 0009F851    mov         eax,dword ptr [ebx+2C8];TFormReplace.RadioButtonFindT:TRadioButton
 0009F857    mov         dword ptr [esp],eax
 0009F85A    mov         eax,dword ptr [ebx+314];TFormReplace.EditFindT:TEdit
 0009F860    mov         dword ptr [esp+4],eax
 0009F864    mov         eax,dword ptr [ebx+2CC];TFormReplace.RadioButtonFindH:TRadioButton
 0009F86A    mov         dword ptr [esp+8],eax
 0009F86E    mov         eax,dword ptr [ebx+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009F874    mov         dword ptr [esp+0C],eax
 0009F878    mov         eax,esp
 0009F87A    mov         edx,3
 0009F87F    call        00087E28
 0009F884    add         esp,10
 0009F887    pop         ebx
 0009F888    ret
*}
end;

//0009F88C
procedure TFormReplace.FormDestroy(Sender:TObject);
begin
{*
 0009F88C    push        ebx
 0009F88D    mov         ebx,eax
 0009F88F    xor         edx,edx
 0009F891    mov         eax,dword ptr [ebx+324];TFormReplace.CMHistoryBtnFindT:TCMHistoryBtn
 0009F897    call        0009CB94
 0009F89C    xor         edx,edx
 0009F89E    mov         eax,dword ptr [ebx+328];TFormReplace.CMHistoryBtnFindH:TCMHistoryBtn
 0009F8A4    call        0009CB94
 0009F8A9    xor         edx,edx
 0009F8AB    mov         eax,dword ptr [ebx+32C];TFormReplace.CMHistoryBtnReplT:TCMHistoryBtn
 0009F8B1    call        0009CB94
 0009F8B6    xor         edx,edx
 0009F8B8    mov         eax,dword ptr [ebx+330];TFormReplace.CMHistoryBtnReplH:TCMHistoryBtn
 0009F8BE    call        0009CB94
 0009F8C3    pop         ebx
 0009F8C4    ret
*}
end;

//0009F8C8
procedure TFormReplace.BitBtnConvFindClick(Sender:TObject);
begin
{*
 0009F8C8    push        ebp
 0009F8C9    mov         ebp,esp
 0009F8CB    push        0
 0009F8CD    push        ebx
 0009F8CE    mov         ebx,eax
 0009F8D0    xor         eax,eax
 0009F8D2    push        ebp
 0009F8D3    push        9F92E
 0009F8D8    push        dword ptr fs:[eax]
 0009F8DB    mov         dword ptr fs:[eax],esp
 0009F8DE    lea         edx,[ebp-4]
 0009F8E1    mov         eax,dword ptr [ebx+314];TFormReplace.EditFindT:TEdit
 0009F8E7    call        TControl.GetText
 0009F8EC    mov         edx,dword ptr [ebp-4]
 0009F8EF    mov         eax,dword ptr [ebx+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009F8F5    call        TCMByteEdit.SetASCII
 0009F8FA    mov         dl,1
 0009F8FC    mov         eax,dword ptr [ebx+2CC];TFormReplace.RadioButtonFindH:TRadioButton
 0009F902    mov         ecx,dword ptr [eax]
 0009F904    call        dword ptr [ecx+0BC];TRadioButton.SetChecked
 0009F90A    mov         eax,dword ptr [ebx+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009F910    mov         edx,dword ptr [eax]
 0009F912    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009F918    xor         eax,eax
 0009F91A    pop         edx
 0009F91B    pop         ecx
 0009F91C    pop         ecx
 0009F91D    mov         dword ptr fs:[eax],edx
 0009F920    push        9F935
 0009F925    lea         eax,[ebp-4]
 0009F928    call        @LStrClr
 0009F92D    ret
>0009F92E    jmp         @HandleFinally
>0009F933    jmp         0009F925
 0009F935    pop         ebx
 0009F936    pop         ecx
 0009F937    pop         ebp
 0009F938    ret
*}
end;

//0009F93C
procedure TFormReplace.BitBtnConvertReplClick(Sender:TObject);
begin
{*
 0009F93C    push        ebp
 0009F93D    mov         ebp,esp
 0009F93F    push        0
 0009F941    push        ebx
 0009F942    mov         ebx,eax
 0009F944    xor         eax,eax
 0009F946    push        ebp
 0009F947    push        9F9A2
 0009F94C    push        dword ptr fs:[eax]
 0009F94F    mov         dword ptr fs:[eax],esp
 0009F952    lea         edx,[ebp-4]
 0009F955    mov         eax,dword ptr [ebx+31C];TFormReplace.EditReplT:TEdit
 0009F95B    call        TControl.GetText
 0009F960    mov         edx,dword ptr [ebp-4]
 0009F963    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009F969    call        TCMByteEdit.SetASCII
 0009F96E    mov         dl,1
 0009F970    mov         eax,dword ptr [ebx+2FC];TFormReplace.RadioButtonReplH:TRadioButton
 0009F976    mov         ecx,dword ptr [eax]
 0009F978    call        dword ptr [ecx+0BC];TRadioButton.SetChecked
 0009F97E    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009F984    mov         edx,dword ptr [eax]
 0009F986    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009F98C    xor         eax,eax
 0009F98E    pop         edx
 0009F98F    pop         ecx
 0009F990    pop         ecx
 0009F991    mov         dword ptr fs:[eax],edx
 0009F994    push        9F9A9
 0009F999    lea         eax,[ebp-4]
 0009F99C    call        @LStrClr
 0009F9A1    ret
>0009F9A2    jmp         @HandleFinally
>0009F9A7    jmp         0009F999
 0009F9A9    pop         ebx
 0009F9AA    pop         ecx
 0009F9AB    pop         ebp
 0009F9AC    ret
*}
end;

//0009F9B0
procedure TFormReplace.CMByteEditJokerExit(Sender:TObject);
begin
{*
 0009F9B0    push        ebp
 0009F9B1    mov         ebp,esp
 0009F9B3    push        0
 0009F9B5    push        ebx
 0009F9B6    mov         ebx,eax
 0009F9B8    xor         eax,eax
 0009F9BA    push        ebp
 0009F9BB    push        9F9F8
 0009F9C0    push        dword ptr fs:[eax]
 0009F9C3    mov         dword ptr fs:[eax],esp
 0009F9C6    lea         edx,[ebp-4]
 0009F9C9    mov         eax,dword ptr [ebx+2E8];TFormReplace.CMByteEditJoker:TCMByteEdit
 0009F9CF    call        TCMByteEdit.GetASCII
 0009F9D4    mov         edx,dword ptr [ebp-4]
 0009F9D7    mov         eax,dword ptr [ebx+2EC];TFormReplace.LabelJoker:TLabel
 0009F9DD    call        TControl.SetText
 0009F9E2    xor         eax,eax
 0009F9E4    pop         edx
 0009F9E5    pop         ecx
 0009F9E6    pop         ecx
 0009F9E7    mov         dword ptr fs:[eax],edx
 0009F9EA    push        9F9FF
 0009F9EF    lea         eax,[ebp-4]
 0009F9F2    call        @LStrClr
 0009F9F7    ret
>0009F9F8    jmp         @HandleFinally
>0009F9FD    jmp         0009F9EF
 0009F9FF    pop         ebx
 0009FA00    pop         ecx
 0009FA01    pop         ebp
 0009FA02    ret
*}
end;

//0009FA04
procedure TFormReplace.ButtonOKClick(Sender:TObject);
begin
{*
 0009FA04    push        ebp
 0009FA05    mov         ebp,esp
 0009FA07    push        0
 0009FA09    push        0
 0009FA0B    push        ebx
 0009FA0C    push        esi
 0009FA0D    mov         esi,edx
 0009FA0F    mov         ebx,eax
 0009FA11    xor         eax,eax
 0009FA13    push        ebp
 0009FA14    push        9FCE0
 0009FA19    push        dword ptr fs:[eax]
 0009FA1C    mov         dword ptr fs:[eax],esp
 0009FA1F    mov         eax,esi
 0009FA21    mov         edx,dword ptr [eax]
 0009FA23    call        dword ptr [edx+0B4]
 0009FA29    mov         eax,dword ptr [ebx+2E8];TFormReplace.CMByteEditJoker:TCMByteEdit
 0009FA2F    call        00076FEC
 0009FA34    test        al,al
>0009FA36    jne         0009FA68
 0009FA38    lea         edx,[ebp-4]
 0009FA3B    mov         eax,805
 0009FA40    call        LoadStr;'Enter joker char'
 0009FA45    mov         eax,dword ptr [ebp-4]
 0009FA48    call        0008D0A8
 0009FA4D    mov         eax,dword ptr [ebx+2E8];TFormReplace.CMByteEditJoker:TCMByteEdit
 0009FA53    mov         edx,dword ptr [eax]
 0009FA55    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009FA5B    xor         eax,eax
 0009FA5D    mov         dword ptr [ebx+22C],eax;TFormReplace.FModalResult:TModalResult
>0009FA63    jmp         0009FBDA
 0009FA68    mov         eax,dword ptr [ebx+2C8];TFormReplace.RadioButtonFindT:TRadioButton
 0009FA6E    mov         edx,dword ptr [eax]
 0009FA70    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009FA76    test        al,al
>0009FA78    je          0009FB10
 0009FA7E    lea         edx,[ebp-8]
 0009FA81    mov         eax,dword ptr [ebx+314];TFormReplace.EditFindT:TEdit
 0009FA87    call        TControl.GetText
 0009FA8C    mov         edx,dword ptr [ebp-8]
 0009FA8F    lea         eax,[ebx+33C];TFormReplace.?f33C:String
 0009FA95    call        @LStrAsg
 0009FA9A    cmp         dword ptr [ebx+33C],0;TFormReplace.?f33C:String
>0009FAA1    jne         0009FACE
 0009FAA3    lea         edx,[ebp-4]
 0009FAA6    mov         eax,807
 0009FAAB    call        LoadStr;'Can't find empty string'
 0009FAB0    mov         eax,dword ptr [ebp-4]
 0009FAB3    call        0008D0A8
 0009FAB8    mov         eax,dword ptr [ebx+314];TFormReplace.EditFindT:TEdit
 0009FABE    mov         edx,dword ptr [eax]
 0009FAC0    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009FAC6    xor         eax,eax
 0009FAC8    mov         dword ptr [ebx+22C],eax;TFormReplace.FModalResult:TModalResult
 0009FACE    mov         eax,dword ptr [ebx+334];TFormReplace.CheckBoxFindUTF16:TCheckBox
 0009FAD4    mov         edx,dword ptr [eax]
 0009FAD6    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 0009FADC    test        al,al
>0009FADE    je          0009FBDA
 0009FAE4    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009FAE9    cmp         byte ptr [eax],0
 0009FAEC    sete        dl
 0009FAEF    lea         ecx,[ebp-4]
 0009FAF2    mov         eax,dword ptr [ebx+33C];TFormReplace.?f33C:String
 0009FAF8    call        0007556C
 0009FAFD    mov         edx,dword ptr [ebp-4]
 0009FB00    lea         eax,[ebx+33C];TFormReplace.?f33C:String
 0009FB06    call        @LStrAsg
>0009FB0B    jmp         0009FBDA
 0009FB10    mov         eax,dword ptr [ebx+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009FB16    call        00076FEC
 0009FB1B    test        al,al
>0009FB1D    jne         0009FB4F
 0009FB1F    lea         edx,[ebp-4]
 0009FB22    mov         eax,806
 0009FB27    call        LoadStr;'Hex string invalid'
 0009FB2C    mov         eax,dword ptr [ebp-4]
 0009FB2F    call        0008D0A8
 0009FB34    mov         eax,dword ptr [ebx+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009FB3A    mov         edx,dword ptr [eax]
 0009FB3C    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009FB42    xor         eax,eax
 0009FB44    mov         dword ptr [ebx+22C],eax;TFormReplace.FModalResult:TModalResult
>0009FB4A    jmp         0009FBDA
 0009FB4F    lea         edx,[ebp-4]
 0009FB52    mov         eax,dword ptr [ebx+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009FB58    call        TCMByteEdit.GetASCII
 0009FB5D    mov         edx,dword ptr [ebp-4]
 0009FB60    lea         eax,[ebx+33C];TFormReplace.?f33C:String
 0009FB66    call        @LStrAsg
 0009FB6B    mov         eax,dword ptr [ebx+2CC];TFormReplace.RadioButtonFindH:TRadioButton
 0009FB71    mov         edx,dword ptr [eax]
 0009FB73    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009FB79    test        al,al
>0009FB7B    je          0009FBDA
 0009FB7D    mov         eax,dword ptr [ebx+2E0];TFormReplace.CheckBoxCase:TCheckBox
 0009FB83    mov         edx,dword ptr [eax]
 0009FB85    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 0009FB8B    test        al,al
>0009FB8D    jne         0009FBDA
 0009FB8F    mov         eax,dword ptr [ebx+33C];TFormReplace.?f33C:String
 0009FB95    call        00075350
 0009FB9A    test        al,al
>0009FB9C    je          0009FBDA
 0009FB9E    lea         edx,[ebp-4]
 0009FBA1    mov         eax,82E
 0009FBA6    call        LoadStr;'The hex string to find contains case sensitive chars.
Because you have NOT checked "Case sensitive",
this may produce unwanted results.

Perform instead a CASE SENSITIVE search?'
 0009FBAB    mov         eax,dword ptr [ebp-4]
 0009FBAE    call        0008D0E0
 0009FBB3    sub         ax,6
>0009FBB7    je          0009FBC0
 0009FBB9    dec         ax
>0009FBBC    je          0009FBDA
>0009FBBE    jmp         0009FBD2
 0009FBC0    mov         dl,1
 0009FBC2    mov         eax,dword ptr [ebx+2E0];TFormReplace.CheckBoxCase:TCheckBox
 0009FBC8    mov         ecx,dword ptr [eax]
 0009FBCA    call        dword ptr [ecx+0BC];TCustomCheckBox.SetChecked
>0009FBD0    jmp         0009FBDA
 0009FBD2    xor         eax,eax
 0009FBD4    mov         dword ptr [ebx+22C],eax;TFormReplace.FModalResult:TModalResult
 0009FBDA    mov         eax,dword ptr [ebx+2F8];TFormReplace.RadioButtonReplT:TRadioButton
 0009FBE0    mov         edx,dword ptr [eax]
 0009FBE2    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009FBE8    test        al,al
>0009FBEA    je          0009FC47
 0009FBEC    lea         edx,[ebp-8]
 0009FBEF    mov         eax,dword ptr [ebx+31C];TFormReplace.EditReplT:TEdit
 0009FBF5    call        TControl.GetText
 0009FBFA    mov         edx,dword ptr [ebp-8]
 0009FBFD    lea         eax,[ebx+340];TFormReplace.?f340:String
 0009FC03    call        @LStrAsg
 0009FC08    mov         eax,dword ptr [ebx+338];TFormReplace.CheckBoxReplUTF16:TCheckBox
 0009FC0E    mov         edx,dword ptr [eax]
 0009FC10    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 0009FC16    test        al,al
>0009FC18    je          0009FCB3
 0009FC1E    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009FC23    cmp         byte ptr [eax],0
 0009FC26    sete        dl
 0009FC29    lea         ecx,[ebp-4]
 0009FC2C    mov         eax,dword ptr [ebx+340];TFormReplace.?f340:String
 0009FC32    call        0007556C
 0009FC37    mov         edx,dword ptr [ebp-4]
 0009FC3A    lea         eax,[ebx+340];TFormReplace.?f340:String
 0009FC40    call        @LStrAsg
>0009FC45    jmp         0009FCB3
 0009FC47    lea         edx,[ebp-8]
 0009FC4A    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009FC50    call        TControl.GetText
 0009FC55    cmp         dword ptr [ebp-8],0
>0009FC59    je          0009FC97
 0009FC5B    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009FC61    call        00076FEC
 0009FC66    test        al,al
>0009FC68    jne         0009FC97
 0009FC6A    lea         edx,[ebp-4]
 0009FC6D    mov         eax,806
 0009FC72    call        LoadStr;'Hex string invalid'
 0009FC77    mov         eax,dword ptr [ebp-4]
 0009FC7A    call        0008D0A8
 0009FC7F    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009FC85    mov         edx,dword ptr [eax]
 0009FC87    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009FC8D    xor         eax,eax
 0009FC8F    mov         dword ptr [ebx+22C],eax;TFormReplace.FModalResult:TModalResult
>0009FC95    jmp         0009FCB3
 0009FC97    lea         edx,[ebp-4]
 0009FC9A    mov         eax,dword ptr [ebx+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009FCA0    call        TCMByteEdit.GetASCII
 0009FCA5    mov         edx,dword ptr [ebp-4]
 0009FCA8    lea         eax,[ebx+340];TFormReplace.?f340:String
 0009FCAE    call        @LStrAsg
 0009FCB3    cmp         esi,dword ptr [ebx+2F0];TFormReplace.ButtonReplAll:TButton
 0009FCB9    sete        al
 0009FCBC    mov         byte ptr [ebx+344],al;TFormReplace.?f344:byte
 0009FCC2    xor         eax,eax
 0009FCC4    pop         edx
 0009FCC5    pop         ecx
 0009FCC6    pop         ecx
 0009FCC7    mov         dword ptr fs:[eax],edx
 0009FCCA    push        9FCE7
 0009FCCF    lea         eax,[ebp-8]
 0009FCD2    call        @LStrClr
 0009FCD7    lea         eax,[ebp-4]
 0009FCDA    call        @LStrClr
 0009FCDF    ret
>0009FCE0    jmp         @HandleFinally
>0009FCE5    jmp         0009FCCF
 0009FCE7    pop         esi
 0009FCE8    pop         ebx
 0009FCE9    pop         ecx
 0009FCEA    pop         ecx
 0009FCEB    pop         ebp
 0009FCEC    ret
*}
end;

//0009FCF0
procedure TFormReplace.ButtonHelpClick(Sender:TObject);
begin
{*
 0009FCF0    mov         eax,[000B59E8];^Application:TApplication
 0009FCF5    mov         eax,dword ptr [eax]
 0009FCF7    mov         edx,35
 0009FCFC    call        TApplication.HelpContext
 0009FD01    ret
*}
end;

//0009FD04
procedure TFormReplace.CMByteEditFindHKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 0009FD04    push        ebp
 0009FD05    mov         ebp,esp
 0009FD07    push        ebx
 0009FD08    mov         ebx,edx
 0009FD0A    cmp         word ptr [ecx],27
>0009FD0E    jne         0009FD22
 0009FD10    mov         eax,ebx
 0009FD12    mov         edx,dword ptr ds:[75A34];TCMByteEdit
 0009FD18    call        @AsClass
 0009FD1D    call        0009B254
 0009FD22    pop         ebx
 0009FD23    pop         ebp
 0009FD24    ret         4
*}
end;

//0009FD28
procedure TFormReplace.CMRadioBtnFindClick(Sender:TObject);
begin
{*
 0009FD28    add         esp,0FFFFFFF0
 0009FD2B    mov         edx,dword ptr [eax+2C8];TFormReplace.RadioButtonFindT:TRadioButton
 0009FD31    mov         dword ptr [esp],edx
 0009FD34    mov         edx,dword ptr [eax+314];TFormReplace.EditFindT:TEdit
 0009FD3A    mov         dword ptr [esp+4],edx
 0009FD3E    mov         edx,dword ptr [eax+2CC];TFormReplace.RadioButtonFindH:TRadioButton
 0009FD44    mov         dword ptr [esp+8],edx
 0009FD48    mov         eax,dword ptr [eax+318];TFormReplace.CMByteEditFindH:TCMByteEdit
 0009FD4E    mov         dword ptr [esp+0C],eax
 0009FD52    mov         eax,esp
 0009FD54    mov         edx,3
 0009FD59    call        00087E28
 0009FD5E    add         esp,10
 0009FD61    ret
*}
end;

//0009FD64
procedure TFormReplace.CMRadioBtnReplClick(Sender:TObject);
begin
{*
 0009FD64    add         esp,0FFFFFFF0
 0009FD67    mov         edx,dword ptr [eax+2F8];TFormReplace.RadioButtonReplT:TRadioButton
 0009FD6D    mov         dword ptr [esp],edx
 0009FD70    mov         edx,dword ptr [eax+31C];TFormReplace.EditReplT:TEdit
 0009FD76    mov         dword ptr [esp+4],edx
 0009FD7A    mov         edx,dword ptr [eax+2FC];TFormReplace.RadioButtonReplH:TRadioButton
 0009FD80    mov         dword ptr [esp+8],edx
 0009FD84    mov         eax,dword ptr [eax+320];TFormReplace.CMByteEditReplH:TCMByteEdit
 0009FD8A    mov         dword ptr [esp+0C],eax
 0009FD8E    mov         eax,esp
 0009FD90    mov         edx,3
 0009FD95    call        00087E28
 0009FD9A    add         esp,10
 0009FD9D    ret
*}
end;

end.