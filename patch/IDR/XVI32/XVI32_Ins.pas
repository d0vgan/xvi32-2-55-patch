//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Ins;

interface

uses
  SysUtils, Classes, StdCtrls, Buttons, CMkomp40, CMHstBtn;

type
  TFormIns = class(TForm)
  published
    GroupBox1:TGroupBox;//f2C4
    ButtonOK:TButton;//f2C8
    ButtonCancel:TButton;//f2CC
    BitBtnConvert:TBitBtn;//f2D0
    GroupBox2:TGroupBox;//f2D4
    RadioButtonDecN:TRadioButton;//f2D8
    RadioButtonHexN:TRadioButton;//f2DC
    ButtonHelp:TButton;//f2E0
    EditInsT:TEdit;//f2E4
    CMByteEditInsH:TCMByteEdit;//f2E8
    CMHistoryBtnInsT:TCMHistoryBtn;//f2EC
    CMHistoryBtnInsH:TCMHistoryBtn;//f2F0
    CMNumEdit1:TCMNumEdit;//f2F4
    CMHistoryBtnInsN:TCMHistoryBtn;//f2F8
    RadioButtonText:TRadioButton;//f2FC
    RadioButtonHex:TRadioButton;//f300
    CheckBoxUTF16:TCheckBox;//f304
    procedure CMByteEditInsHKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//000A1D60
    procedure ButtonHelpClick(Sender:TObject);//000A1D48
    //procedure CMHistoryBtnInsNSelect(?:?; ?:?);//000A1D84
    procedure RadioButtonTextClick(Sender:TObject);//000A1DD0
    procedure FormShow(Sender:TObject);//000A1D94
    procedure CMHistoryInsNChange;//000A1B30
    procedure FormDestroy(Sender:TObject);//000A1A70
    procedure FormCreate(Sender:TObject);//000A19BC
    procedure BitBtnConvertClick(Sender:TObject);//000A1A9C
    procedure RadioButtonDecNClick(Sender:TObject);//000A1B10
    procedure ButtonOKClick(Sender:TObject);//000A1BA4
  public
    f308:String;//f308
    f30C:Integer;//f30C
    f310:dword;//f310
  end;
    //procedure sub_000A1964(?:TFormIns; ?:?);//000A1964

implementation

{$R *.DFM}

//000A1964
{*procedure sub_000A1964(?:TFormIns; ?:?);
begin
 000A1964    push        ebx
 000A1965    push        esi
 000A1966    mov         esi,edx
 000A1968    mov         ebx,eax
 000A196A    mov         edx,esi
 000A196C    mov         eax,0A19B8;'$'
 000A1971    call        @LStrPos
 000A1976    test        eax,eax
 000A1978    setg        dl
 000A197B    mov         eax,dword ptr [ebx+2DC]
 000A1981    mov         ecx,dword ptr [eax]
 000A1983    call        dword ptr [ecx+0BC]
 000A1989    mov         eax,dword ptr [ebx+2DC]
 000A198F    mov         edx,dword ptr [eax]
 000A1991    call        dword ptr [edx+0B8]
 000A1997    mov         edx,eax
 000A1999    xor         dl,1
 000A199C    mov         eax,dword ptr [ebx+2D8]
 000A19A2    mov         ecx,dword ptr [eax]
 000A19A4    call        dword ptr [ecx+0BC]
 000A19AA    pop         esi
 000A19AB    pop         ebx
 000A19AC    ret
end;*}

//000A19BC
procedure TFormIns.FormCreate(Sender:TObject);
begin
{*
 000A19BC    push        ebp
 000A19BD    mov         ebp,esp
 000A19BF    push        0
 000A19C1    push        0
 000A19C3    push        ebx
 000A19C4    mov         ebx,eax
 000A19C6    xor         eax,eax
 000A19C8    push        ebp
 000A19C9    push        0A1A62
 000A19CE    push        dword ptr fs:[eax]
 000A19D1    mov         dword ptr fs:[eax],esp
 000A19D4    mov         eax,ebx
 000A19D6    call        00087A14
 000A19DB    mov         eax,ebx
 000A19DD    call        00087964
 000A19E2    xor         edx,edx
 000A19E4    mov         eax,dword ptr [ebx+2EC];TFormIns.CMHistoryBtnInsT:TCMHistoryBtn
 000A19EA    call        0009CAE4
 000A19EF    xor         edx,edx
 000A19F1    mov         eax,dword ptr [ebx+2F0];TFormIns.CMHistoryBtnInsH:TCMHistoryBtn
 000A19F7    call        0009CAE4
 000A19FC    xor         edx,edx
 000A19FE    mov         eax,dword ptr [ebx+2F8];TFormIns.CMHistoryBtnInsN:TCMHistoryBtn
 000A1A04    call        0009CAE4
 000A1A09    lea         edx,[ebp-4]
 000A1A0C    mov         eax,dword ptr [ebx+2F4];TFormIns.CMNumEdit1:TCMNumEdit
 000A1A12    call        TControl.GetText
 000A1A17    mov         edx,dword ptr [ebp-4]
 000A1A1A    mov         eax,ebx
 000A1A1C    call        000A1964
 000A1A21    lea         edx,[ebp-8]
 000A1A24    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 000A1A29    movzx       eax,byte ptr [eax]
 000A1A2C    add         eax,85C
 000A1A31    call        LoadStr
 000A1A36    mov         edx,dword ptr [ebp-8]
 000A1A39    mov         eax,dword ptr [ebx+304];TFormIns.CheckBoxUTF16:TCheckBox
 000A1A3F    call        TControl.SetText
 000A1A44    xor         eax,eax
 000A1A46    pop         edx
 000A1A47    pop         ecx
 000A1A48    pop         ecx
 000A1A49    mov         dword ptr fs:[eax],edx
 000A1A4C    push        0A1A69
 000A1A51    lea         eax,[ebp-8]
 000A1A54    call        @LStrClr
 000A1A59    lea         eax,[ebp-4]
 000A1A5C    call        @LStrClr
 000A1A61    ret
>000A1A62    jmp         @HandleFinally
>000A1A67    jmp         000A1A51
 000A1A69    pop         ebx
 000A1A6A    pop         ecx
 000A1A6B    pop         ecx
 000A1A6C    pop         ebp
 000A1A6D    ret
*}
end;

//000A1A70
procedure TFormIns.FormDestroy(Sender:TObject);
begin
{*
 000A1A70    push        ebx
 000A1A71    mov         ebx,eax
 000A1A73    xor         edx,edx
 000A1A75    mov         eax,dword ptr [ebx+2EC];TFormIns.CMHistoryBtnInsT:TCMHistoryBtn
 000A1A7B    call        0009CB94
 000A1A80    xor         edx,edx
 000A1A82    mov         eax,dword ptr [ebx+2F0];TFormIns.CMHistoryBtnInsH:TCMHistoryBtn
 000A1A88    call        0009CB94
 000A1A8D    xor         edx,edx
 000A1A8F    mov         eax,dword ptr [ebx+2F8];TFormIns.CMHistoryBtnInsN:TCMHistoryBtn
 000A1A95    call        0009CB94
 000A1A9A    pop         ebx
 000A1A9B    ret
*}
end;

//000A1A9C
procedure TFormIns.BitBtnConvertClick(Sender:TObject);
begin
{*
 000A1A9C    push        ebp
 000A1A9D    mov         ebp,esp
 000A1A9F    push        0
 000A1AA1    push        ebx
 000A1AA2    mov         ebx,eax
 000A1AA4    xor         eax,eax
 000A1AA6    push        ebp
 000A1AA7    push        0A1B02
 000A1AAC    push        dword ptr fs:[eax]
 000A1AAF    mov         dword ptr fs:[eax],esp
 000A1AB2    lea         edx,[ebp-4]
 000A1AB5    mov         eax,dword ptr [ebx+2E4];TFormIns.EditInsT:TEdit
 000A1ABB    call        TControl.GetText
 000A1AC0    mov         edx,dword ptr [ebp-4]
 000A1AC3    mov         eax,dword ptr [ebx+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1AC9    call        TCMByteEdit.SetASCII
 000A1ACE    mov         dl,1
 000A1AD0    mov         eax,dword ptr [ebx+300];TFormIns.RadioButtonHex:TRadioButton
 000A1AD6    mov         ecx,dword ptr [eax]
 000A1AD8    call        dword ptr [ecx+0BC];TRadioButton.SetChecked
 000A1ADE    mov         eax,dword ptr [ebx+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1AE4    mov         edx,dword ptr [eax]
 000A1AE6    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000A1AEC    xor         eax,eax
 000A1AEE    pop         edx
 000A1AEF    pop         ecx
 000A1AF0    pop         ecx
 000A1AF1    mov         dword ptr fs:[eax],edx
 000A1AF4    push        0A1B09
 000A1AF9    lea         eax,[ebp-4]
 000A1AFC    call        @LStrClr
 000A1B01    ret
>000A1B02    jmp         @HandleFinally
>000A1B07    jmp         000A1AF9
 000A1B09    pop         ebx
 000A1B0A    pop         ecx
 000A1B0B    pop         ebp
 000A1B0C    ret
*}
end;

//000A1B10
procedure TFormIns.RadioButtonDecNClick(Sender:TObject);
begin
{*
 000A1B10    push        ebx
 000A1B11    mov         ebx,eax
 000A1B13    mov         eax,dword ptr [ebx+2DC];TFormIns.RadioButtonHexN:TRadioButton
 000A1B19    mov         edx,dword ptr [eax]
 000A1B1B    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 000A1B21    mov         edx,eax
 000A1B23    mov         eax,dword ptr [ebx+2F4];TFormIns.CMNumEdit1:TCMNumEdit
 000A1B29    call        TCMNumEdit.SetHex
 000A1B2E    pop         ebx
 000A1B2F    ret
*}
end;

//000A1B30
procedure TFormIns.CMHistoryInsNChange;
begin
{*
 000A1B30    push        ebp
 000A1B31    mov         ebp,esp
 000A1B33    push        0
 000A1B35    push        ebx
 000A1B36    mov         ebx,eax
 000A1B38    xor         eax,eax
 000A1B3A    push        ebp
 000A1B3B    push        0A1B8B
 000A1B40    push        dword ptr fs:[eax]
 000A1B43    mov         dword ptr fs:[eax],esp
 000A1B46    lea         edx,[ebp-4]
 000A1B49    mov         eax,dword ptr [ebx+2F4];TFormIns.CMNumEdit1:TCMNumEdit
 000A1B4F    call        TControl.GetText
 000A1B54    mov         edx,dword ptr [ebp-4]
 000A1B57    mov         eax,0A1BA0;'$'
 000A1B5C    call        @LStrPos
 000A1B61    test        eax,eax
>000A1B63    jle         000A1B75
 000A1B65    mov         dl,1
 000A1B67    mov         eax,dword ptr [ebx+2DC];TFormIns.RadioButtonHexN:TRadioButton
 000A1B6D    mov         ecx,dword ptr [eax]
 000A1B6F    call        dword ptr [ecx+0BC];TRadioButton.SetChecked
 000A1B75    xor         eax,eax
 000A1B77    pop         edx
 000A1B78    pop         ecx
 000A1B79    pop         ecx
 000A1B7A    mov         dword ptr fs:[eax],edx
 000A1B7D    push        0A1B92
 000A1B82    lea         eax,[ebp-4]
 000A1B85    call        @LStrClr
 000A1B8A    ret
>000A1B8B    jmp         @HandleFinally
>000A1B90    jmp         000A1B82
 000A1B92    pop         ebx
 000A1B93    pop         ecx
 000A1B94    pop         ebp
 000A1B95    ret
*}
end;

//000A1BA4
procedure TFormIns.ButtonOKClick(Sender:TObject);
begin
{*
 000A1BA4    push        ebp
 000A1BA5    mov         ebp,esp
 000A1BA7    push        0
 000A1BA9    push        0
 000A1BAB    push        ebx
 000A1BAC    push        esi
 000A1BAD    mov         esi,eax
 000A1BAF    xor         eax,eax
 000A1BB1    push        ebp
 000A1BB2    push        0A1D3B
 000A1BB7    push        dword ptr fs:[eax]
 000A1BBA    mov         dword ptr fs:[eax],esp
 000A1BBD    mov         eax,edx
 000A1BBF    mov         edx,dword ptr [eax]
 000A1BC1    call        dword ptr [edx+0B4]
 000A1BC7    mov         eax,dword ptr [esi+2FC];TFormIns.RadioButtonText:TRadioButton
 000A1BCD    mov         edx,dword ptr [eax]
 000A1BCF    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 000A1BD5    test        al,al
>000A1BD7    je          000A1C6C
 000A1BDD    lea         edx,[ebp-4]
 000A1BE0    mov         eax,dword ptr [esi+2E4];TFormIns.EditInsT:TEdit
 000A1BE6    call        TControl.GetText
 000A1BEB    mov         edx,dword ptr [ebp-4]
 000A1BEE    lea         eax,[esi+308];TFormIns.?f308:String
 000A1BF4    call        @LStrAsg
 000A1BF9    cmp         dword ptr [esi+308],0;TFormIns.?f308:String
>000A1C00    jne         000A1C2D
 000A1C02    lea         edx,[ebp-8]
 000A1C05    mov         eax,816
 000A1C0A    call        LoadStr;'Empty string not valid'
 000A1C0F    mov         eax,dword ptr [ebp-8]
 000A1C12    call        0008D0A8
 000A1C17    mov         eax,dword ptr [esi+2E4];TFormIns.EditInsT:TEdit
 000A1C1D    mov         edx,dword ptr [eax]
 000A1C1F    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000A1C25    xor         eax,eax
 000A1C27    mov         dword ptr [esi+22C],eax;TFormIns.FModalResult:TModalResult
 000A1C2D    mov         eax,dword ptr [esi+304];TFormIns.CheckBoxUTF16:TCheckBox
 000A1C33    mov         edx,dword ptr [eax]
 000A1C35    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 000A1C3B    test        al,al
>000A1C3D    je          000A1CC4
 000A1C43    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 000A1C48    cmp         byte ptr [eax],0
 000A1C4B    sete        dl
 000A1C4E    lea         ecx,[ebp-8]
 000A1C51    mov         eax,dword ptr [esi+308];TFormIns.?f308:String
 000A1C57    call        0007556C
 000A1C5C    mov         edx,dword ptr [ebp-8]
 000A1C5F    lea         eax,[esi+308];TFormIns.?f308:String
 000A1C65    call        @LStrAsg
>000A1C6A    jmp         000A1CC4
 000A1C6C    mov         eax,dword ptr [esi+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1C72    call        00076FEC
 000A1C77    test        al,al
>000A1C79    jne         000A1CA8
 000A1C7B    lea         edx,[ebp-8]
 000A1C7E    mov         eax,806
 000A1C83    call        LoadStr;'Hex string invalid'
 000A1C88    mov         eax,dword ptr [ebp-8]
 000A1C8B    call        0008D0A8
 000A1C90    mov         eax,dword ptr [esi+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1C96    mov         edx,dword ptr [eax]
 000A1C98    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000A1C9E    xor         eax,eax
 000A1CA0    mov         dword ptr [esi+22C],eax;TFormIns.FModalResult:TModalResult
>000A1CA6    jmp         000A1CC4
 000A1CA8    lea         edx,[ebp-8]
 000A1CAB    mov         eax,dword ptr [esi+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1CB1    call        TCMByteEdit.GetASCII
 000A1CB6    mov         edx,dword ptr [ebp-8]
 000A1CB9    lea         eax,[esi+308];TFormIns.?f308:String
 000A1CBF    call        @LStrAsg
 000A1CC4    mov         eax,dword ptr [esi+2D4];TFormIns.GroupBox2:TGroupBox
 000A1CCA    cmp         byte ptr [eax+47],0;TGroupBox.FVisible:Boolean
>000A1CCE    je          000A1D1D
 000A1CD0    lea         edx,[ebp-4]
 000A1CD3    mov         eax,dword ptr [esi+2F4];TFormIns.CMNumEdit1:TCMNumEdit
 000A1CD9    call        TControl.GetText
 000A1CDE    mov         eax,dword ptr [ebp-4]
 000A1CE1    call        StrToInt
 000A1CE6    mov         ebx,eax
 000A1CE8    mov         dword ptr [esi+30C],ebx;TFormIns.?f30C:Integer
 000A1CEE    test        ebx,ebx
>000A1CF0    jne         000A1D1D
 000A1CF2    lea         edx,[ebp-8]
 000A1CF5    mov         eax,816
 000A1CFA    call        LoadStr;'Empty string not valid'
 000A1CFF    mov         eax,dword ptr [ebp-8]
 000A1D02    call        0008D0A8
 000A1D07    mov         eax,dword ptr [esi+2F4];TFormIns.CMNumEdit1:TCMNumEdit
 000A1D0D    mov         edx,dword ptr [eax]
 000A1D0F    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000A1D15    xor         eax,eax
 000A1D17    mov         dword ptr [esi+22C],eax;TFormIns.FModalResult:TModalResult
 000A1D1D    xor         eax,eax
 000A1D1F    pop         edx
 000A1D20    pop         ecx
 000A1D21    pop         ecx
 000A1D22    mov         dword ptr fs:[eax],edx
 000A1D25    push        0A1D42
 000A1D2A    lea         eax,[ebp-8]
 000A1D2D    call        @LStrClr
 000A1D32    lea         eax,[ebp-4]
 000A1D35    call        @LStrClr
 000A1D3A    ret
>000A1D3B    jmp         @HandleFinally
>000A1D40    jmp         000A1D2A
 000A1D42    pop         esi
 000A1D43    pop         ebx
 000A1D44    pop         ecx
 000A1D45    pop         ecx
 000A1D46    pop         ebp
 000A1D47    ret
*}
end;

//000A1D48
procedure TFormIns.ButtonHelpClick(Sender:TObject);
begin
{*
 000A1D48    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 000A1D4E    mov         edx,dword ptr [edx]
 000A1D50    mov         eax,dword ptr [eax+310];TFormIns.?f310:dword
 000A1D56    xchg        eax,edx
 000A1D57    call        TApplication.HelpContext
 000A1D5C    ret
*}
end;

//000A1D60
procedure TFormIns.CMByteEditInsHKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 000A1D60    push        ebp
 000A1D61    mov         ebp,esp
 000A1D63    push        ebx
 000A1D64    mov         ebx,edx
 000A1D66    cmp         word ptr [ecx],27
>000A1D6A    jne         000A1D7E
 000A1D6C    mov         eax,ebx
 000A1D6E    mov         edx,dword ptr ds:[75A34];TCMByteEdit
 000A1D74    call        @AsClass
 000A1D79    call        0009B254
 000A1D7E    pop         ebx
 000A1D7F    pop         ebp
 000A1D80    ret         4
*}
end;

//000A1D84
{*procedure TFormIns.CMHistoryBtnInsNSelect(?:?; ?:?);
begin
 000A1D84    push        ebp
 000A1D85    mov         ebp,esp
 000A1D87    mov         edx,dword ptr [ecx]
 000A1D89    call        000A1964
 000A1D8E    pop         ebp
 000A1D8F    ret         4
end;*}

//000A1D94
procedure TFormIns.FormShow(Sender:TObject);
begin
{*
 000A1D94    add         esp,0FFFFFFF0
 000A1D97    mov         edx,dword ptr [eax+2FC];TFormIns.RadioButtonText:TRadioButton
 000A1D9D    mov         dword ptr [esp],edx
 000A1DA0    mov         edx,dword ptr [eax+2E4];TFormIns.EditInsT:TEdit
 000A1DA6    mov         dword ptr [esp+4],edx
 000A1DAA    mov         edx,dword ptr [eax+300];TFormIns.RadioButtonHex:TRadioButton
 000A1DB0    mov         dword ptr [esp+8],edx
 000A1DB4    mov         eax,dword ptr [eax+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1DBA    mov         dword ptr [esp+0C],eax
 000A1DBE    mov         eax,esp
 000A1DC0    mov         edx,3
 000A1DC5    call        00087E28
 000A1DCA    add         esp,10
 000A1DCD    ret
*}
end;

//000A1DD0
procedure TFormIns.RadioButtonTextClick(Sender:TObject);
begin
{*
 000A1DD0    add         esp,0FFFFFFF0
 000A1DD3    mov         edx,dword ptr [eax+2FC];TFormIns.RadioButtonText:TRadioButton
 000A1DD9    mov         dword ptr [esp],edx
 000A1DDC    mov         edx,dword ptr [eax+2E4];TFormIns.EditInsT:TEdit
 000A1DE2    mov         dword ptr [esp+4],edx
 000A1DE6    mov         edx,dword ptr [eax+300];TFormIns.RadioButtonHex:TRadioButton
 000A1DEC    mov         dword ptr [esp+8],edx
 000A1DF0    mov         eax,dword ptr [eax+2E8];TFormIns.CMByteEditInsH:TCMByteEdit
 000A1DF6    mov         dword ptr [esp+0C],eax
 000A1DFA    mov         eax,esp
 000A1DFC    mov         edx,3
 000A1E01    call        00087E28
 000A1E06    add         esp,10
 000A1E09    ret
*}
end;

end.