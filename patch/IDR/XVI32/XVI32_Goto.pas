//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Goto;

interface

uses
  SysUtils, Classes, StdCtrls, ExtCtrls, CMkomp40, CMHstBtn;

type
  TFormGoto = class(TForm)
  published
    GroupBox1:TGroupBox;//f2C4
    RadioButtonDec:TRadioButton;//f2C8
    RadioButtonHex:TRadioButton;//f2CC
    ButtonOK:TButton;//f2D0
    ButtonCancel:TButton;//f2D4
    RadioGroupGoMode:TRadioGroup;//f2D8
    ButtonHelp:TButton;//f2DC
    CMNumEdit1:TCMNumEdit;//f2E0
    CMHistoryBtnGoTo:TCMHistoryBtn;//f2E4
    procedure ButtonHelpClick(Sender:TObject);//0009DB18
    //procedure CMHistoryBtnGoToSelect(?:?; ?:?);//0009DB2C
    procedure FormShow(Sender:TObject);//0009DB3C
    procedure ButtonOKClick(Sender:TObject);//0009DA08
    procedure FormCreate(Sender:TObject);//0009D914
    procedure FormDestroy(Sender:TObject);//0009D980
    procedure RadioButtonDecClick(Sender:TObject);//0009D990
  public
    f2E8:Integer;//f2E8
  end;
    //procedure sub_0009D8BC(?:TFormGoto; ?:?);//0009D8BC
    //procedure sub_0009D9B0(?:?);//0009D9B0

implementation

{$R *.DFM}

//0009D8BC
{*procedure sub_0009D8BC(?:TFormGoto; ?:?);
begin
 0009D8BC    push        ebx
 0009D8BD    push        esi
 0009D8BE    mov         esi,edx
 0009D8C0    mov         ebx,eax
 0009D8C2    mov         edx,esi
 0009D8C4    mov         eax,9D910;'$'
 0009D8C9    call        @LStrPos
 0009D8CE    test        eax,eax
 0009D8D0    setg        dl
 0009D8D3    mov         eax,dword ptr [ebx+2CC]
 0009D8D9    mov         ecx,dword ptr [eax]
 0009D8DB    call        dword ptr [ecx+0BC]
 0009D8E1    mov         eax,dword ptr [ebx+2CC]
 0009D8E7    mov         edx,dword ptr [eax]
 0009D8E9    call        dword ptr [edx+0B8]
 0009D8EF    mov         edx,eax
 0009D8F1    xor         dl,1
 0009D8F4    mov         eax,dword ptr [ebx+2C8]
 0009D8FA    mov         ecx,dword ptr [eax]
 0009D8FC    call        dword ptr [ecx+0BC]
 0009D902    pop         esi
 0009D903    pop         ebx
 0009D904    ret
end;*}

//0009D914
procedure TFormGoto.FormCreate(Sender:TObject);
begin
{*
 0009D914    push        ebp
 0009D915    mov         ebp,esp
 0009D917    push        0
 0009D919    push        ebx
 0009D91A    mov         ebx,eax
 0009D91C    xor         eax,eax
 0009D91E    push        ebp
 0009D91F    push        9D973
 0009D924    push        dword ptr fs:[eax]
 0009D927    mov         dword ptr fs:[eax],esp
 0009D92A    mov         eax,ebx
 0009D92C    call        00087A14
 0009D931    mov         eax,ebx
 0009D933    call        00087964
 0009D938    xor         edx,edx
 0009D93A    mov         eax,dword ptr [ebx+2E4];TFormGoto.CMHistoryBtnGoTo:TCMHistoryBtn
 0009D940    call        0009CAE4
 0009D945    lea         edx,[ebp-4]
 0009D948    mov         eax,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009D94E    call        TControl.GetText
 0009D953    mov         edx,dword ptr [ebp-4]
 0009D956    mov         eax,ebx
 0009D958    call        0009D8BC
 0009D95D    xor         eax,eax
 0009D95F    pop         edx
 0009D960    pop         ecx
 0009D961    pop         ecx
 0009D962    mov         dword ptr fs:[eax],edx
 0009D965    push        9D97A
 0009D96A    lea         eax,[ebp-4]
 0009D96D    call        @LStrClr
 0009D972    ret
>0009D973    jmp         @HandleFinally
>0009D978    jmp         0009D96A
 0009D97A    pop         ebx
 0009D97B    pop         ecx
 0009D97C    pop         ebp
 0009D97D    ret
*}
end;

//0009D980
procedure TFormGoto.FormDestroy(Sender:TObject);
begin
{*
 0009D980    xor         edx,edx
 0009D982    mov         eax,dword ptr [eax+2E4];TFormGoto.CMHistoryBtnGoTo:TCMHistoryBtn
 0009D988    call        0009CB94
 0009D98D    ret
*}
end;

//0009D990
procedure TFormGoto.RadioButtonDecClick(Sender:TObject);
begin
{*
 0009D990    push        ebx
 0009D991    mov         ebx,eax
 0009D993    mov         eax,dword ptr [ebx+2CC];TFormGoto.RadioButtonHex:TRadioButton
 0009D999    mov         edx,dword ptr [eax]
 0009D99B    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009D9A1    mov         edx,eax
 0009D9A3    mov         eax,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009D9A9    call        TCMNumEdit.SetHex
 0009D9AE    pop         ebx
 0009D9AF    ret
*}
end;

//0009D9B0
{*procedure sub_0009D9B0(?:?);
begin
 0009D9B0    push        ebp
 0009D9B1    mov         ebp,esp
 0009D9B3    push        0
 0009D9B5    xor         eax,eax
 0009D9B7    push        ebp
 0009D9B8    push        9D9FC
 0009D9BD    push        dword ptr fs:[eax]
 0009D9C0    mov         dword ptr fs:[eax],esp
 0009D9C3    lea         edx,[ebp-4]
 0009D9C6    mov         eax,7F2
 0009D9CB    call        LoadStr;'Address invalid'
 0009D9D0    mov         eax,dword ptr [ebp-4]
 0009D9D3    call        0008D0A8
 0009D9D8    mov         eax,dword ptr [ebp+8]
 0009D9DB    mov         eax,dword ptr [eax-4]
 0009D9DE    xor         edx,edx
 0009D9E0    mov         dword ptr [eax+22C],edx
 0009D9E6    xor         eax,eax
 0009D9E8    pop         edx
 0009D9E9    pop         ecx
 0009D9EA    pop         ecx
 0009D9EB    mov         dword ptr fs:[eax],edx
 0009D9EE    push        9DA03
 0009D9F3    lea         eax,[ebp-4]
 0009D9F6    call        @LStrClr
 0009D9FB    ret
>0009D9FC    jmp         @HandleFinally
>0009DA01    jmp         0009D9F3
 0009DA03    pop         ecx
 0009DA04    pop         ebp
 0009DA05    ret
end;*}

//0009DA08
procedure TFormGoto.ButtonOKClick(Sender:TObject);
begin
{*
 0009DA08    push        ebp
 0009DA09    mov         ebp,esp
 0009DA0B    add         esp,0FFFFFFF8
 0009DA0E    push        ebx
 0009DA0F    push        esi
 0009DA10    push        edi
 0009DA11    xor         ecx,ecx
 0009DA13    mov         dword ptr [ebp-8],ecx
 0009DA16    mov         dword ptr [ebp-4],eax
 0009DA19    xor         eax,eax
 0009DA1B    push        ebp
 0009DA1C    push        9DB07
 0009DA21    push        dword ptr fs:[eax]
 0009DA24    mov         dword ptr fs:[eax],esp
 0009DA27    mov         eax,edx
 0009DA29    mov         edx,dword ptr [eax]
 0009DA2B    call        dword ptr [edx+0B4]
 0009DA31    xor         edx,edx
 0009DA33    push        ebp
 0009DA34    push        9DAE0
 0009DA39    push        dword ptr fs:[edx]
 0009DA3C    mov         dword ptr fs:[edx],esp
 0009DA3F    lea         edx,[ebp-8]
 0009DA42    mov         eax,dword ptr [ebp-4]
 0009DA45    mov         eax,dword ptr [eax+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009DA4B    call        TControl.GetText
 0009DA50    mov         eax,dword ptr [ebp-8]
 0009DA53    call        StrToInt
 0009DA58    mov         ebx,eax
 0009DA5A    mov         eax,dword ptr [ebp-4]
 0009DA5D    mov         dword ptr [eax+2E8],ebx;TFormGoto.?f2E8:Integer
 0009DA63    mov         eax,dword ptr [ebp-4]
 0009DA66    mov         eax,dword ptr [eax+2D8];TFormGoto.RadioGroupGoMode:TRadioGroup
 0009DA6C    mov         eax,dword ptr [eax+1F8];TRadioGroup.FItemIndex:Integer
 0009DA72    sub         eax,1
>0009DA75    jb          0009DA7E
>0009DA77    je          0009DA91
 0009DA79    dec         eax
>0009DA7A    je          0009DAA1
>0009DA7C    jmp         0009DAB8
 0009DA7E    inc         ebx
 0009DA7F    mov         eax,[000B5B1C];^gvar_000B55F8:Longint
 0009DA84    sub         ebx,dword ptr [eax]
 0009DA86    mov         eax,dword ptr [ebp-4]
 0009DA89    mov         dword ptr [eax+2E8],ebx;TFormGoto.?f2E8:Integer
>0009DA8F    jmp         0009DAB8
 0009DA91    call        000981C4
 0009DA96    mov         edx,dword ptr [ebp-4]
 0009DA99    add         dword ptr [edx+2E8],eax;TFormGoto.?f2E8:Integer
>0009DA9F    jmp         0009DAB8
 0009DAA1    call        000981C4
 0009DAA6    mov         edx,dword ptr [ebp-4]
 0009DAA9    sub         eax,dword ptr [edx+2E8]
 0009DAAF    mov         edx,dword ptr [ebp-4]
 0009DAB2    mov         dword ptr [edx+2E8],eax;TFormGoto.?f2E8:Integer
 0009DAB8    mov         eax,dword ptr [ebp-4]
 0009DABB    mov         eax,dword ptr [eax+2E8];TFormGoto.?f2E8:Integer
 0009DAC1    test        eax,eax
>0009DAC3    jle         0009DACF
 0009DAC5    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 0009DACB    cmp         eax,dword ptr [edx]
>0009DACD    jle         0009DAD6
 0009DACF    push        ebp
 0009DAD0    call        0009D9B0
 0009DAD5    pop         ecx
 0009DAD6    xor         eax,eax
 0009DAD8    pop         edx
 0009DAD9    pop         ecx
 0009DADA    pop         ecx
 0009DADB    mov         dword ptr fs:[eax],edx
>0009DADE    jmp         0009DAF1
>0009DAE0    jmp         @HandleAnyException
 0009DAE5    push        ebp
 0009DAE6    call        0009D9B0
 0009DAEB    pop         ecx
 0009DAEC    call        @DoneExcept
 0009DAF1    xor         eax,eax
 0009DAF3    pop         edx
 0009DAF4    pop         ecx
 0009DAF5    pop         ecx
 0009DAF6    mov         dword ptr fs:[eax],edx
 0009DAF9    push        9DB0E
 0009DAFE    lea         eax,[ebp-8]
 0009DB01    call        @LStrClr
 0009DB06    ret
>0009DB07    jmp         @HandleFinally
>0009DB0C    jmp         0009DAFE
 0009DB0E    pop         edi
 0009DB0F    pop         esi
 0009DB10    pop         ebx
 0009DB11    pop         ecx
 0009DB12    pop         ecx
 0009DB13    pop         ebp
 0009DB14    ret
*}
end;

//0009DB18
procedure TFormGoto.ButtonHelpClick(Sender:TObject);
begin
{*
 0009DB18    mov         eax,[000B59E8];^Application:TApplication
 0009DB1D    mov         eax,dword ptr [eax]
 0009DB1F    mov         edx,36
 0009DB24    call        TApplication.HelpContext
 0009DB29    ret
*}
end;

//0009DB2C
{*procedure TFormGoto.CMHistoryBtnGoToSelect(?:?; ?:?);
begin
 0009DB2C    push        ebp
 0009DB2D    mov         ebp,esp
 0009DB2F    mov         edx,dword ptr [ecx]
 0009DB31    call        0009D8BC
 0009DB36    pop         ebp
 0009DB37    ret         4
end;*}

//0009DB3C
procedure TFormGoto.FormShow(Sender:TObject);
begin
{*
 0009DB3C    push        ebp
 0009DB3D    mov         ebp,esp
 0009DB3F    push        0
 0009DB41    push        0
 0009DB43    push        ebx
 0009DB44    push        esi
 0009DB45    mov         ebx,eax
 0009DB47    xor         eax,eax
 0009DB49    push        ebp
 0009DB4A    push        9DBF6
 0009DB4F    push        dword ptr fs:[eax]
 0009DB52    mov         dword ptr fs:[eax],esp
 0009DB55    mov         eax,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009DB5B    mov         edx,dword ptr [eax]
 0009DB5D    call        dword ptr [edx+0B4];TWinControl.SetFocus
 0009DB63    lea         eax,[ebp-4]
 0009DB66    push        eax
 0009DB67    lea         edx,[ebp-8]
 0009DB6A    mov         eax,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009DB70    call        TControl.GetText
 0009DB75    mov         eax,dword ptr [ebp-8]
 0009DB78    mov         ecx,1
 0009DB7D    mov         edx,1
 0009DB82    call        @LStrCopy
 0009DB87    mov         eax,dword ptr [ebp-4]
 0009DB8A    mov         edx,9DC0C;'$'
 0009DB8F    call        @LStrCmp
>0009DB94    jne         0009DBD0
 0009DB96    mov         edx,1
 0009DB9B    mov         eax,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009DBA1    mov         ecx,dword ptr [eax]
 0009DBA3    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
 0009DBA9    lea         edx,[ebp-4]
 0009DBAC    mov         esi,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009DBB2    mov         eax,esi
 0009DBB4    call        TControl.GetText
 0009DBB9    mov         eax,dword ptr [ebp-4]
 0009DBBC    call        @LStrLen
 0009DBC1    mov         edx,eax
 0009DBC3    dec         edx
 0009DBC4    mov         eax,esi
 0009DBC6    mov         ecx,dword ptr [eax]
 0009DBC8    call        dword ptr [ecx+0C8];TCustomEdit.SetSelLength
>0009DBCE    jmp         0009DBDB
 0009DBD0    mov         eax,dword ptr [ebx+2E0];TFormGoto.CMNumEdit1:TCMNumEdit
 0009DBD6    call        TCustomEdit.SelectAll
 0009DBDB    xor         eax,eax
 0009DBDD    pop         edx
 0009DBDE    pop         ecx
 0009DBDF    pop         ecx
 0009DBE0    mov         dword ptr fs:[eax],edx
 0009DBE3    push        9DBFD
 0009DBE8    lea         eax,[ebp-8]
 0009DBEB    mov         edx,2
 0009DBF0    call        @LStrArrayClr
 0009DBF5    ret
>0009DBF6    jmp         @HandleFinally
>0009DBFB    jmp         0009DBE8
 0009DBFD    pop         esi
 0009DBFE    pop         ebx
 0009DBFF    pop         ecx
 0009DC00    pop         ecx
 0009DC01    pop         ebp
 0009DC02    ret
*}
end;

end.