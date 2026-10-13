//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Donate;

interface

uses
  SysUtils, Classes, StdCtrls, CMLabel;

type
  TFormDonate = class(TForm)
  published
    Label1:TLabel;//f2C4
    Label2:TLabel;//f2C8
    ButtonCopy:TButton;//f2CC
    ButtonClose:TButton;//f2D0
    CMLbl1:TCMLbl;//f2D4
    procedure ButtonCopyClick(Sender:TObject);//000A08E0
  end;

implementation

{$R *.DFM}

//000A08E0
procedure TFormDonate.ButtonCopyClick(Sender:TObject);
begin
{*
 000A08E0    push        ebp
 000A08E1    mov         ebp,esp
 000A08E3    push        0
 000A08E5    push        ebx
 000A08E6    mov         ebx,eax
 000A08E8    xor         eax,eax
 000A08EA    push        ebp
 000A08EB    push        0A0933
 000A08F0    push        dword ptr fs:[eax]
 000A08F3    mov         dword ptr fs:[eax],esp
 000A08F6    lea         edx,[ebp-4]
 000A08F9    mov         eax,dword ptr [ebx+2D4];TFormDonate.CMLbl1:TCMLbl
 000A08FF    call        TControl.GetText
 000A0904    mov         eax,dword ptr [ebp-4]
 000A0907    push        eax
 000A0908    call        Clipboard
 000A090D    pop         edx
 000A090E    call        TClipboard.SetAsText
 000A0913    mov         dword ptr [ebx+22C],1;TFormDonate.FModalResult:TModalResult
 000A091D    xor         eax,eax
 000A091F    pop         edx
 000A0920    pop         ecx
 000A0921    pop         ecx
 000A0922    mov         dword ptr fs:[eax],edx
 000A0925    push        0A093A
 000A092A    lea         eax,[ebp-4]
 000A092D    call        @LStrClr
 000A0932    ret
>000A0933    jmp         @HandleFinally
>000A0938    jmp         000A092A
 000A093A    pop         ebx
 000A093B    pop         ecx
 000A093C    pop         ebp
 000A093D    ret
*}
end;

end.