//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Bln;

interface

uses
  SysUtils, Classes, StdCtrls, CMkomp40, CMHstBtn;

type
  TFormBlockN = class(TForm)
  published
    GroupBox1:TGroupBox;//f2C4
    RadioButtonDec:TRadioButton;//f2C8
    RadioButtonHex:TRadioButton;//f2CC
    ButtonOK:TButton;//f2D0
    ButtonCancel:TButton;//f2D4
    ButtonHelp:TButton;//f2D8
    CMNumEdit1:TCMNumEdit;//f2DC
    CMHistoryBtnBlockN:TCMHistoryBtn;//f2E0
    procedure FormDestroy(Sender:TObject);//0009D454
    procedure ButtonHelpClick(Sender:TObject);//0009D5AC
    //procedure CMHistoryBtnBlockNSelect(?:?; ?:?);//0009D5C0
    procedure RadioButtonDecClick(Sender:TObject);//0009D464
    procedure ButtonOKClick(Sender:TObject);//0009D4DC
    procedure FormCreate(Sender:TObject);//0009D3E8
  public
    f2E4:Integer;//f2E4
  end;
    //procedure sub_0009D390(?:TFormBlockN; ?:?);//0009D390
    //procedure sub_0009D484(?:?);//0009D484

implementation

{$R *.DFM}

//0009D390
{*procedure sub_0009D390(?:TFormBlockN; ?:?);
begin
 0009D390    push        ebx
 0009D391    push        esi
 0009D392    mov         esi,edx
 0009D394    mov         ebx,eax
 0009D396    mov         edx,esi
 0009D398    mov         eax,9D3E4;'$'
 0009D39D    call        @LStrPos
 0009D3A2    test        eax,eax
 0009D3A4    setg        dl
 0009D3A7    mov         eax,dword ptr [ebx+2CC]
 0009D3AD    mov         ecx,dword ptr [eax]
 0009D3AF    call        dword ptr [ecx+0BC]
 0009D3B5    mov         eax,dword ptr [ebx+2CC]
 0009D3BB    mov         edx,dword ptr [eax]
 0009D3BD    call        dword ptr [edx+0B8]
 0009D3C3    mov         edx,eax
 0009D3C5    xor         dl,1
 0009D3C8    mov         eax,dword ptr [ebx+2C8]
 0009D3CE    mov         ecx,dword ptr [eax]
 0009D3D0    call        dword ptr [ecx+0BC]
 0009D3D6    pop         esi
 0009D3D7    pop         ebx
 0009D3D8    ret
end;*}

//0009D3E8
procedure TFormBlockN.FormCreate(Sender:TObject);
begin
{*
 0009D3E8    push        ebp
 0009D3E9    mov         ebp,esp
 0009D3EB    push        0
 0009D3ED    push        ebx
 0009D3EE    mov         ebx,eax
 0009D3F0    xor         eax,eax
 0009D3F2    push        ebp
 0009D3F3    push        9D447
 0009D3F8    push        dword ptr fs:[eax]
 0009D3FB    mov         dword ptr fs:[eax],esp
 0009D3FE    mov         eax,ebx
 0009D400    call        00087A14
 0009D405    mov         eax,ebx
 0009D407    call        00087964
 0009D40C    xor         edx,edx
 0009D40E    mov         eax,dword ptr [ebx+2E0];TFormBlockN.CMHistoryBtnBlockN:TCMHistoryBtn
 0009D414    call        0009CAE4
 0009D419    lea         edx,[ebp-4]
 0009D41C    mov         eax,dword ptr [ebx+2DC];TFormBlockN.CMNumEdit1:TCMNumEdit
 0009D422    call        TControl.GetText
 0009D427    mov         edx,dword ptr [ebp-4]
 0009D42A    mov         eax,ebx
 0009D42C    call        0009D390
 0009D431    xor         eax,eax
 0009D433    pop         edx
 0009D434    pop         ecx
 0009D435    pop         ecx
 0009D436    mov         dword ptr fs:[eax],edx
 0009D439    push        9D44E
 0009D43E    lea         eax,[ebp-4]
 0009D441    call        @LStrClr
 0009D446    ret
>0009D447    jmp         @HandleFinally
>0009D44C    jmp         0009D43E
 0009D44E    pop         ebx
 0009D44F    pop         ecx
 0009D450    pop         ebp
 0009D451    ret
*}
end;

//0009D454
procedure TFormBlockN.FormDestroy(Sender:TObject);
begin
{*
 0009D454    xor         edx,edx
 0009D456    mov         eax,dword ptr [eax+2E0];TFormBlockN.CMHistoryBtnBlockN:TCMHistoryBtn
 0009D45C    call        0009CB94
 0009D461    ret
*}
end;

//0009D464
procedure TFormBlockN.RadioButtonDecClick(Sender:TObject);
begin
{*
 0009D464    push        ebx
 0009D465    mov         ebx,eax
 0009D467    mov         eax,dword ptr [ebx+2CC];TFormBlockN.RadioButtonHex:TRadioButton
 0009D46D    mov         edx,dword ptr [eax]
 0009D46F    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009D475    mov         edx,eax
 0009D477    mov         eax,dword ptr [ebx+2DC];TFormBlockN.CMNumEdit1:TCMNumEdit
 0009D47D    call        TCMNumEdit.SetHex
 0009D482    pop         ebx
 0009D483    ret
*}
end;

//0009D484
{*procedure sub_0009D484(?:?);
begin
 0009D484    push        ebp
 0009D485    mov         ebp,esp
 0009D487    push        0
 0009D489    xor         eax,eax
 0009D48B    push        ebp
 0009D48C    push        9D4D0
 0009D491    push        dword ptr fs:[eax]
 0009D494    mov         dword ptr fs:[eax],esp
 0009D497    lea         edx,[ebp-4]
 0009D49A    mov         eax,7E8
 0009D49F    call        LoadStr;'Block size invalid'
 0009D4A4    mov         eax,dword ptr [ebp-4]
 0009D4A7    call        0008D0A8
 0009D4AC    mov         eax,dword ptr [ebp+8]
 0009D4AF    mov         eax,dword ptr [eax-4]
 0009D4B2    xor         edx,edx
 0009D4B4    mov         dword ptr [eax+22C],edx
 0009D4BA    xor         eax,eax
 0009D4BC    pop         edx
 0009D4BD    pop         ecx
 0009D4BE    pop         ecx
 0009D4BF    mov         dword ptr fs:[eax],edx
 0009D4C2    push        9D4D7
 0009D4C7    lea         eax,[ebp-4]
 0009D4CA    call        @LStrClr
 0009D4CF    ret
>0009D4D0    jmp         @HandleFinally
>0009D4D5    jmp         0009D4C7
 0009D4D7    pop         ecx
 0009D4D8    pop         ebp
 0009D4D9    ret
end;*}

//0009D4DC
procedure TFormBlockN.ButtonOKClick(Sender:TObject);
begin
{*
 0009D4DC    push        ebp
 0009D4DD    mov         ebp,esp
 0009D4DF    add         esp,0FFFFFFF8
 0009D4E2    push        ebx
 0009D4E3    push        esi
 0009D4E4    push        edi
 0009D4E5    xor         ecx,ecx
 0009D4E7    mov         dword ptr [ebp-8],ecx
 0009D4EA    mov         dword ptr [ebp-4],eax
 0009D4ED    xor         eax,eax
 0009D4EF    push        ebp
 0009D4F0    push        9D59C
 0009D4F5    push        dword ptr fs:[eax]
 0009D4F8    mov         dword ptr fs:[eax],esp
 0009D4FB    mov         eax,edx
 0009D4FD    mov         edx,dword ptr [eax]
 0009D4FF    call        dword ptr [edx+0B4]
 0009D505    xor         eax,eax
 0009D507    push        ebp
 0009D508    push        9D575
 0009D50D    push        dword ptr fs:[eax]
 0009D510    mov         dword ptr fs:[eax],esp
 0009D513    lea         edx,[ebp-8]
 0009D516    mov         eax,dword ptr [ebp-4]
 0009D519    mov         eax,dword ptr [eax+2DC];TFormBlockN.CMNumEdit1:TCMNumEdit
 0009D51F    call        TControl.GetText
 0009D524    mov         eax,dword ptr [ebp-8]
 0009D527    call        StrToInt
 0009D52C    mov         edx,dword ptr [ebp-4]
 0009D52F    mov         dword ptr [edx+2E4],eax;TFormBlockN.?f2E4:Integer
 0009D535    mov         eax,dword ptr [ebp-4]
 0009D538    mov         ebx,dword ptr [eax+2E4];TFormBlockN.?f2E4:Integer
 0009D53E    test        ebx,ebx
>0009D540    jle         0009D564
 0009D542    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 0009D547    cmp         ebx,dword ptr [eax]
>0009D549    jge         0009D564
 0009D54B    call        000981C4
 0009D550    mov         edx,dword ptr [ebp-4]
 0009D553    add         eax,dword ptr [edx+2E4];TFormBlockN.?f2E4:Integer
 0009D559    dec         eax
 0009D55A    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 0009D560    cmp         eax,dword ptr [edx]
>0009D562    jle         0009D56B
 0009D564    push        ebp
 0009D565    call        0009D484
 0009D56A    pop         ecx
 0009D56B    xor         eax,eax
 0009D56D    pop         edx
 0009D56E    pop         ecx
 0009D56F    pop         ecx
 0009D570    mov         dword ptr fs:[eax],edx
>0009D573    jmp         0009D586
>0009D575    jmp         @HandleAnyException
 0009D57A    push        ebp
 0009D57B    call        0009D484
 0009D580    pop         ecx
 0009D581    call        @DoneExcept
 0009D586    xor         eax,eax
 0009D588    pop         edx
 0009D589    pop         ecx
 0009D58A    pop         ecx
 0009D58B    mov         dword ptr fs:[eax],edx
 0009D58E    push        9D5A3
 0009D593    lea         eax,[ebp-8]
 0009D596    call        @LStrClr
 0009D59B    ret
>0009D59C    jmp         @HandleFinally
>0009D5A1    jmp         0009D593
 0009D5A3    pop         edi
 0009D5A4    pop         esi
 0009D5A5    pop         ebx
 0009D5A6    pop         ecx
 0009D5A7    pop         ecx
 0009D5A8    pop         ebp
 0009D5A9    ret
*}
end;

//0009D5AC
procedure TFormBlockN.ButtonHelpClick(Sender:TObject);
begin
{*
 0009D5AC    mov         eax,[000B59E8];^Application:TApplication
 0009D5B1    mov         eax,dword ptr [eax]
 0009D5B3    mov         edx,38
 0009D5B8    call        TApplication.HelpContext
 0009D5BD    ret
*}
end;

//0009D5C0
{*procedure TFormBlockN.CMHistoryBtnBlockNSelect(?:?; ?:?);
begin
 0009D5C0    push        ebp
 0009D5C1    mov         ebp,esp
 0009D5C3    mov         edx,dword ptr [ecx]
 0009D5C5    call        0009D390
 0009D5CA    pop         ebp
 0009D5CB    ret         4
end;*}

end.