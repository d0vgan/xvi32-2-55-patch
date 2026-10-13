//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Jmp;

interface

uses
  SysUtils, Classes, StdCtrls, CMkomp40, CMHstBtn;

type
  TFormJump = class(TForm)
  published
    GroupBox1:TGroupBox;//f2C4
    RadioButtonDec:TRadioButton;//f2C8
    RadioButtonHex:TRadioButton;//f2CC
    ButtonOK:TButton;//f2D0
    ButtonCancel:TButton;//f2D4
    CMNumEdit1:TCMNumEdit;//f2D8
    CMHistoryBtnJump:TCMHistoryBtn;//f2DC
    procedure FormCreate(Sender:TObject);//0009DF1C
    procedure FormDestroy(Sender:TObject);//0009DF88
    //procedure CMHistoryBtnJumpSelect(?:?; ?:?);//0009E13C
    procedure RadioButtonDecClick(Sender:TObject);//0009DF98
    procedure CMHistoryJumpChange;//0009DFB8
    procedure ButtonOKClick(Sender:TObject);//0009E084
  public
    f2E0:Integer;//f2E0
  end;
    //procedure sub_0009DEC4(?:TFormJump; ?:?);//0009DEC4
    //procedure sub_0009E02C(?:?);//0009E02C

implementation

{$R *.DFM}

//0009DEC4
{*procedure sub_0009DEC4(?:TFormJump; ?:?);
begin
 0009DEC4    push        ebx
 0009DEC5    push        esi
 0009DEC6    mov         esi,edx
 0009DEC8    mov         ebx,eax
 0009DECA    mov         edx,esi
 0009DECC    mov         eax,9DF18;'$'
 0009DED1    call        @LStrPos
 0009DED6    test        eax,eax
 0009DED8    setg        dl
 0009DEDB    mov         eax,dword ptr [ebx+2CC]
 0009DEE1    mov         ecx,dword ptr [eax]
 0009DEE3    call        dword ptr [ecx+0BC]
 0009DEE9    mov         eax,dword ptr [ebx+2CC]
 0009DEEF    mov         edx,dword ptr [eax]
 0009DEF1    call        dword ptr [edx+0B8]
 0009DEF7    mov         edx,eax
 0009DEF9    xor         dl,1
 0009DEFC    mov         eax,dword ptr [ebx+2C8]
 0009DF02    mov         ecx,dword ptr [eax]
 0009DF04    call        dword ptr [ecx+0BC]
 0009DF0A    pop         esi
 0009DF0B    pop         ebx
 0009DF0C    ret
end;*}

//0009DF1C
procedure TFormJump.FormCreate(Sender:TObject);
begin
{*
 0009DF1C    push        ebp
 0009DF1D    mov         ebp,esp
 0009DF1F    push        0
 0009DF21    push        ebx
 0009DF22    mov         ebx,eax
 0009DF24    xor         eax,eax
 0009DF26    push        ebp
 0009DF27    push        9DF7B
 0009DF2C    push        dword ptr fs:[eax]
 0009DF2F    mov         dword ptr fs:[eax],esp
 0009DF32    mov         eax,ebx
 0009DF34    call        00087A14
 0009DF39    mov         eax,ebx
 0009DF3B    call        00087964
 0009DF40    xor         edx,edx
 0009DF42    mov         eax,dword ptr [ebx+2DC];TFormJump.CMHistoryBtnJump:TCMHistoryBtn
 0009DF48    call        0009CAE4
 0009DF4D    lea         edx,[ebp-4]
 0009DF50    mov         eax,dword ptr [ebx+2D8];TFormJump.CMNumEdit1:TCMNumEdit
 0009DF56    call        TControl.GetText
 0009DF5B    mov         edx,dword ptr [ebp-4]
 0009DF5E    mov         eax,ebx
 0009DF60    call        0009DEC4
 0009DF65    xor         eax,eax
 0009DF67    pop         edx
 0009DF68    pop         ecx
 0009DF69    pop         ecx
 0009DF6A    mov         dword ptr fs:[eax],edx
 0009DF6D    push        9DF82
 0009DF72    lea         eax,[ebp-4]
 0009DF75    call        @LStrClr
 0009DF7A    ret
>0009DF7B    jmp         @HandleFinally
>0009DF80    jmp         0009DF72
 0009DF82    pop         ebx
 0009DF83    pop         ecx
 0009DF84    pop         ebp
 0009DF85    ret
*}
end;

//0009DF88
procedure TFormJump.FormDestroy(Sender:TObject);
begin
{*
 0009DF88    xor         edx,edx
 0009DF8A    mov         eax,dword ptr [eax+2DC];TFormJump.CMHistoryBtnJump:TCMHistoryBtn
 0009DF90    call        0009CB94
 0009DF95    ret
*}
end;

//0009DF98
procedure TFormJump.RadioButtonDecClick(Sender:TObject);
begin
{*
 0009DF98    push        ebx
 0009DF99    mov         ebx,eax
 0009DF9B    mov         eax,dword ptr [ebx+2CC];TFormJump.RadioButtonHex:TRadioButton
 0009DFA1    mov         edx,dword ptr [eax]
 0009DFA3    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009DFA9    mov         edx,eax
 0009DFAB    mov         eax,dword ptr [ebx+2D8];TFormJump.CMNumEdit1:TCMNumEdit
 0009DFB1    call        TCMNumEdit.SetHex
 0009DFB6    pop         ebx
 0009DFB7    ret
*}
end;

//0009DFB8
procedure TFormJump.CMHistoryJumpChange;
begin
{*
 0009DFB8    push        ebp
 0009DFB9    mov         ebp,esp
 0009DFBB    push        0
 0009DFBD    push        ebx
 0009DFBE    mov         ebx,eax
 0009DFC0    xor         eax,eax
 0009DFC2    push        ebp
 0009DFC3    push        9E013
 0009DFC8    push        dword ptr fs:[eax]
 0009DFCB    mov         dword ptr fs:[eax],esp
 0009DFCE    lea         edx,[ebp-4]
 0009DFD1    mov         eax,dword ptr [ebx+2D8];TFormJump.CMNumEdit1:TCMNumEdit
 0009DFD7    call        TControl.GetText
 0009DFDC    mov         edx,dword ptr [ebp-4]
 0009DFDF    mov         eax,9E028;'$'
 0009DFE4    call        @LStrPos
 0009DFE9    test        eax,eax
>0009DFEB    jle         0009DFFD
 0009DFED    mov         dl,1
 0009DFEF    mov         eax,dword ptr [ebx+2CC];TFormJump.RadioButtonHex:TRadioButton
 0009DFF5    mov         ecx,dword ptr [eax]
 0009DFF7    call        dword ptr [ecx+0BC];TRadioButton.SetChecked
 0009DFFD    xor         eax,eax
 0009DFFF    pop         edx
 0009E000    pop         ecx
 0009E001    pop         ecx
 0009E002    mov         dword ptr fs:[eax],edx
 0009E005    push        9E01A
 0009E00A    lea         eax,[ebp-4]
 0009E00D    call        @LStrClr
 0009E012    ret
>0009E013    jmp         @HandleFinally
>0009E018    jmp         0009E00A
 0009E01A    pop         ebx
 0009E01B    pop         ecx
 0009E01C    pop         ebp
 0009E01D    ret
*}
end;

//0009E02C
{*procedure sub_0009E02C(?:?);
begin
 0009E02C    push        ebp
 0009E02D    mov         ebp,esp
 0009E02F    push        0
 0009E031    xor         eax,eax
 0009E033    push        ebp
 0009E034    push        9E078
 0009E039    push        dword ptr fs:[eax]
 0009E03C    mov         dword ptr fs:[eax],esp
 0009E03F    lea         edx,[ebp-4]
 0009E042    mov         eax,7F1
 0009E047    call        LoadStr;'Jump width invalid'
 0009E04C    mov         eax,dword ptr [ebp-4]
 0009E04F    call        0008D0A8
 0009E054    mov         eax,dword ptr [ebp+8]
 0009E057    mov         eax,dword ptr [eax-4]
 0009E05A    xor         edx,edx
 0009E05C    mov         dword ptr [eax+22C],edx
 0009E062    xor         eax,eax
 0009E064    pop         edx
 0009E065    pop         ecx
 0009E066    pop         ecx
 0009E067    mov         dword ptr fs:[eax],edx
 0009E06A    push        9E07F
 0009E06F    lea         eax,[ebp-4]
 0009E072    call        @LStrClr
 0009E077    ret
>0009E078    jmp         @HandleFinally
>0009E07D    jmp         0009E06F
 0009E07F    pop         ecx
 0009E080    pop         ebp
 0009E081    ret
end;*}

//0009E084
procedure TFormJump.ButtonOKClick(Sender:TObject);
begin
{*
 0009E084    push        ebp
 0009E085    mov         ebp,esp
 0009E087    add         esp,0FFFFFFF8
 0009E08A    push        ebx
 0009E08B    push        esi
 0009E08C    push        edi
 0009E08D    xor         ecx,ecx
 0009E08F    mov         dword ptr [ebp-8],ecx
 0009E092    mov         dword ptr [ebp-4],eax
 0009E095    xor         eax,eax
 0009E097    push        ebp
 0009E098    push        9E12C
 0009E09D    push        dword ptr fs:[eax]
 0009E0A0    mov         dword ptr fs:[eax],esp
 0009E0A3    mov         eax,edx
 0009E0A5    mov         edx,dword ptr [eax]
 0009E0A7    call        dword ptr [edx+0B4]
 0009E0AD    xor         edx,edx
 0009E0AF    push        ebp
 0009E0B0    push        9E105
 0009E0B5    push        dword ptr fs:[edx]
 0009E0B8    mov         dword ptr fs:[edx],esp
 0009E0BB    lea         edx,[ebp-8]
 0009E0BE    mov         eax,dword ptr [ebp-4]
 0009E0C1    mov         eax,dword ptr [eax+2D8];TFormJump.CMNumEdit1:TCMNumEdit
 0009E0C7    call        TControl.GetText
 0009E0CC    mov         eax,dword ptr [ebp-8]
 0009E0CF    call        StrToInt
 0009E0D4    mov         edx,dword ptr [ebp-4]
 0009E0D7    mov         dword ptr [edx+2E0],eax;TFormJump.?f2E0:Integer
 0009E0DD    mov         eax,dword ptr [ebp-4]
 0009E0E0    mov         eax,dword ptr [eax+2E0];TFormJump.?f2E0:Integer
 0009E0E6    test        eax,eax
>0009E0E8    jle         0009E0F4
 0009E0EA    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 0009E0F0    cmp         eax,dword ptr [edx]
>0009E0F2    jl          0009E0FB
 0009E0F4    push        ebp
 0009E0F5    call        0009E02C
 0009E0FA    pop         ecx
 0009E0FB    xor         eax,eax
 0009E0FD    pop         edx
 0009E0FE    pop         ecx
 0009E0FF    pop         ecx
 0009E100    mov         dword ptr fs:[eax],edx
>0009E103    jmp         0009E116
>0009E105    jmp         @HandleAnyException
 0009E10A    push        ebp
 0009E10B    call        0009E02C
 0009E110    pop         ecx
 0009E111    call        @DoneExcept
 0009E116    xor         eax,eax
 0009E118    pop         edx
 0009E119    pop         ecx
 0009E11A    pop         ecx
 0009E11B    mov         dword ptr fs:[eax],edx
 0009E11E    push        9E133
 0009E123    lea         eax,[ebp-8]
 0009E126    call        @LStrClr
 0009E12B    ret
>0009E12C    jmp         @HandleFinally
>0009E131    jmp         0009E123
 0009E133    pop         edi
 0009E134    pop         esi
 0009E135    pop         ebx
 0009E136    pop         ecx
 0009E137    pop         ecx
 0009E138    pop         ebp
 0009E139    ret
*}
end;

//0009E13C
{*procedure TFormJump.CMHistoryBtnJumpSelect(?:?; ?:?);
begin
 0009E13C    push        ebp
 0009E13D    mov         ebp,esp
 0009E13F    mov         edx,dword ptr [ecx]
 0009E141    call        0009DEC4
 0009E146    pop         ebp
 0009E147    ret         4
end;*}

end.