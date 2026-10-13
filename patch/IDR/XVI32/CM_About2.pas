//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CM_About2;

interface

uses
  SysUtils, Classes, ExtCtrls, StdCtrls, CMLabel, Buttons;

type
  TFormAbout2 = class(TForm)
  published
    Image2:TImage;//f2C4
    LabelCopyR:TLabel;//f2C8
    CMLblMail:TCMLbl;//f2CC
    BitBtnOK:TBitBtn;//f2D0
    LabelInfo:TLabel;//f2D4
    CMLbl1:TCMLbl;//f2D8
    Memo1:TMemo;//f2DC
    BitBtnDonate:TBitBtn;//f2E0
    procedure Image2Click(Sender:TObject);//000A0E0C
    procedure BitBtnDonateClick(Sender:TObject);//000A0E3C
    procedure Memo1Click(Sender:TObject);//000A0E2C
    procedure FormCreate(Sender:TObject);//000A0BD8
    procedure FormShow(Sender:TObject);//000A0DF4
  public
    f2E4:String;//f2E4
    f2E8:String;//f2E8
  end;
    procedure sub_000A0E44;//000A0E44

implementation

{$R *.DFM}

//000A0BD8
procedure TFormAbout2.FormCreate(Sender:TObject);
begin
{*
 000A0BD8    push        ebp
 000A0BD9    mov         ebp,esp
 000A0BDB    xor         ecx,ecx
 000A0BDD    push        ecx
 000A0BDE    push        ecx
 000A0BDF    push        ecx
 000A0BE0    push        ecx
 000A0BE1    push        ecx
 000A0BE2    push        ecx
 000A0BE3    push        ebx
 000A0BE4    push        esi
 000A0BE5    mov         ebx,eax
 000A0BE7    xor         eax,eax
 000A0BE9    push        ebp
 000A0BEA    push        0A0D83
 000A0BEF    push        dword ptr fs:[eax]
 000A0BF2    mov         dword ptr fs:[eax],esp
 000A0BF5    mov         edx,dword ptr ds:[0B5A68];^gvar_000B6B0F
 000A0BFB    mov         dl,byte ptr [edx]
 000A0BFD    mov         eax,dword ptr [ebx+2E0];TFormAbout2.BitBtnDonate:TBitBtn
 000A0C03    call        TControl.SetVisible
 000A0C08    lea         edx,[ebp-8]
 000A0C0B    mov         eax,139
 000A0C10    call        LoadStr;'Info about'
 000A0C15    push        dword ptr [ebp-8]
 000A0C18    push        0A0D98;' '
 000A0C1D    lea         edx,[ebp-10]
 000A0C20    mov         eax,[000B59E8];^Application:TApplication
 000A0C25    mov         eax,dword ptr [eax]
 000A0C27    call        TApplication.GetExeName
 000A0C2C    mov         eax,dword ptr [ebp-10]
 000A0C2F    lea         edx,[ebp-0C]
 000A0C32    call        00079D44
 000A0C37    push        dword ptr [ebp-0C]
 000A0C3A    push        0A0D98;' '
 000A0C3F    lea         eax,[ebp-10]
 000A0C42    mov         edx,dword ptr ds:[0B5998];^gvar_000B6AF8:ShortString
 000A0C48    call        @LStrFromString
 000A0C4D    push        dword ptr [ebp-10]
 000A0C50    lea         eax,[ebp-4]
 000A0C53    mov         edx,5
 000A0C58    call        @LStrCatN
 000A0C5D    mov         edx,dword ptr [ebp-4]
 000A0C60    mov         eax,ebx
 000A0C62    call        TControl.SetText
 000A0C67    lea         edx,[ebp-18]
 000A0C6A    mov         esi,dword ptr [ebx+2C8];TFormAbout2.LabelCopyR:TLabel
 000A0C70    mov         eax,esi
 000A0C72    call        TControl.GetText
 000A0C77    push        dword ptr [ebp-18]
 000A0C7A    push        0A0D98;' '
 000A0C7F    lea         edx,[ebp-4]
 000A0C82    mov         eax,[000B59E8];^Application:TApplication
 000A0C87    mov         eax,dword ptr [eax]
 000A0C89    call        TApplication.GetExeName
 000A0C8E    mov         eax,dword ptr [ebp-4]
 000A0C91    call        00090D20
 000A0C96    add         esp,0FFFFFFF8
 000A0C99    fstp        qword ptr [esp]
 000A0C9C    wait
 000A0C9D    lea         edx,[ebp-4]
 000A0CA0    mov         eax,0A0DA4;'yyyy'
 000A0CA5    call        FormatDateTime
 000A0CAA    push        dword ptr [ebp-4]
 000A0CAD    push        0A0DB4;' Christian Maas'
 000A0CB2    lea         eax,[ebp-14]
 000A0CB5    mov         edx,4
 000A0CBA    call        @LStrCatN
 000A0CBF    mov         edx,dword ptr [ebp-14]
 000A0CC2    mov         eax,esi
 000A0CC4    call        TControl.SetText
 000A0CC9    push        0A0DCC;'mailto:'
 000A0CCE    mov         eax,[000B575C];^gvar_000B55A0
 000A0CD3    push        dword ptr [eax]
 000A0CD5    push        0A0DDC;'?subject='
 000A0CDA    lea         edx,[ebp-8]
 000A0CDD    mov         eax,[000B59E8];^Application:TApplication
 000A0CE2    mov         eax,dword ptr [eax]
 000A0CE4    call        TApplication.GetExeName
 000A0CE9    mov         eax,dword ptr [ebp-8]
 000A0CEC    lea         edx,[ebp-4]
 000A0CEF    call        ExtractFileName
 000A0CF4    push        dword ptr [ebp-4]
 000A0CF7    mov         eax,dword ptr [ebx+2CC];TFormAbout2.CMLblMail:TCMLbl
 000A0CFD    add         eax,128;TCMLbl.URL:String
 000A0D02    mov         edx,4
 000A0D07    call        @LStrCatN
 000A0D0C    push        0A0DE8;'WAGENLNK'
 000A0D11    mov         eax,[000B5950];^HInstance:Longword
 000A0D16    mov         eax,dword ptr [eax]
 000A0D18    push        eax
 000A0D19    call        user32.LoadBitmapA
 000A0D1E    push        eax
 000A0D1F    mov         eax,dword ptr [ebx+2C4];TFormAbout2.Image2:TImage
 000A0D25    mov         eax,dword ptr [eax+118];TImage.Picture:TPicture
 000A0D2B    call        TPicture.GetBitmap
 000A0D30    pop         edx
 000A0D31    call        TBitmap.SetHandle
 000A0D36    mov         dx,0FFEC
 000A0D3A    mov         eax,dword ptr [ebx+2C4];TFormAbout2.Image2:TImage
 000A0D40    call        TControl.SetCursor
 000A0D45    mov         dx,0FFF6
 000A0D49    mov         eax,dword ptr [ebx+2DC];TFormAbout2.Memo1:TMemo
 000A0D4F    call        TControl.SetCursor
 000A0D54    mov         eax,ebx
 000A0D56    call        00087964
 000A0D5B    xor         eax,eax
 000A0D5D    pop         edx
 000A0D5E    pop         ecx
 000A0D5F    pop         ecx
 000A0D60    mov         dword ptr fs:[eax],edx
 000A0D63    push        0A0D8A
 000A0D68    lea         eax,[ebp-18]
 000A0D6B    mov         edx,2
 000A0D70    call        @LStrArrayClr
 000A0D75    lea         eax,[ebp-10]
 000A0D78    mov         edx,4
 000A0D7D    call        @LStrArrayClr
 000A0D82    ret
>000A0D83    jmp         @HandleFinally
>000A0D88    jmp         000A0D68
 000A0D8A    pop         esi
 000A0D8B    pop         ebx
 000A0D8C    mov         esp,ebp
 000A0D8E    pop         ebp
 000A0D8F    ret
*}
end;

//000A0DF4
procedure TFormAbout2.FormShow(Sender:TObject);
begin
{*
 000A0DF4    push        ebx
 000A0DF5    mov         ebx,eax
 000A0DF7    mov         eax,ebx
 000A0DF9    call        00087A14
 000A0DFE    lea         eax,[ebx+2E4];TFormAbout2.?f2E4:String
 000A0E04    call        @LStrClr
 000A0E09    pop         ebx
 000A0E0A    ret
*}
end;

//000A0E0C
procedure TFormAbout2.Image2Click(Sender:TObject);
begin
{*
 000A0E0C    push        ebx
 000A0E0D    mov         ebx,eax
 000A0E0F    mov         dl,1
 000A0E11    mov         eax,dword ptr [ebx+2DC];TFormAbout2.Memo1:TMemo
 000A0E17    call        TControl.SetVisible
 000A0E1C    mov         eax,dword ptr [ebx+2DC];TFormAbout2.Memo1:TMemo
 000A0E22    mov         edx,dword ptr [eax]
 000A0E24    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000A0E2A    pop         ebx
 000A0E2B    ret
*}
end;

//000A0E2C
procedure TFormAbout2.Memo1Click(Sender:TObject);
begin
{*
 000A0E2C    xor         edx,edx
 000A0E2E    mov         eax,dword ptr [eax+2DC];TFormAbout2.Memo1:TMemo
 000A0E34    call        TControl.SetVisible
 000A0E39    ret
*}
end;

//000A0E3C
procedure TFormAbout2.BitBtnDonateClick(Sender:TObject);
begin
{*
 000A0E3C    call        000A0E44
 000A0E41    ret
*}
end;

//000A0E44
procedure sub_000A0E44;
begin
{*
 000A0E44    push        ebp
 000A0E45    mov         ebp,esp
 000A0E47    xor         ecx,ecx
 000A0E49    mov         dl,1
 000A0E4B    mov         eax,[000A0710];TFormDonate
 000A0E50    call        TCustomForm.Create;TFormDonate.Create
 000A0E55    mov         edx,dword ptr ds:[0B5684];^gvar_000B705C:TFormDonate
 000A0E5B    mov         dword ptr [edx],eax
 000A0E5D    xor         eax,eax
 000A0E5F    push        ebp
 000A0E60    push        0A0E94
 000A0E65    push        dword ptr fs:[eax]
 000A0E68    mov         dword ptr fs:[eax],esp
 000A0E6B    mov         eax,[000B5684];^gvar_000B705C:TFormDonate
 000A0E70    mov         eax,dword ptr [eax]
 000A0E72    mov         edx,dword ptr [eax]
 000A0E74    call        dword ptr [edx+0CC]
 000A0E7A    xor         eax,eax
 000A0E7C    pop         edx
 000A0E7D    pop         ecx
 000A0E7E    pop         ecx
 000A0E7F    mov         dword ptr fs:[eax],edx
 000A0E82    push        0A0E9B
 000A0E87    mov         eax,[000B5684];^gvar_000B705C:TFormDonate
 000A0E8C    mov         eax,dword ptr [eax]
 000A0E8E    call        TCustomForm.Release
 000A0E93    ret
>000A0E94    jmp         @HandleFinally
>000A0E99    jmp         000A0E87
 000A0E9B    pop         ebp
 000A0E9C    ret
*}
end;

end.