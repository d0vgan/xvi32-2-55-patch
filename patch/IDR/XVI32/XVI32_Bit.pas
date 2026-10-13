//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Bit;

interface

uses
  SysUtils, Classes, StdCtrls;

type
  TFormBit = class(TForm)
  published
    ButtonSet:TButton;//f2C4
    ButtonCancel:TButton;//f2C8
    ButtonHelp:TButton;//f2CC
    GroupBoxBits:TGroupBox;//f2D0
    ButtonReread:TButton;//f2D4
    ButtonCheckAll:TButton;//f2D8
    ButtonUncheckAll:TButton;//f2DC
    ButtonToggleAll:TButton;//f2E0
    LabelValue:TLabel;//f2E4
    procedure ButtonRereadClick(Sender:TObject);//000A5998
    procedure ButtonAllClick(Sender:TObject);//000A59DC
    procedure ButtonHelpClick(Sender:TObject);//000A5984
    procedure FormCreate(Sender:TObject);//000A56EC
    procedure ButtonSetClick(Sender:TObject);//000A5928
  public
    f308:byte;//f308
  end;
    procedure sub_000A5840(?:TFormBit);//000A5840

implementation

{$R *.DFM}

//000A56EC
procedure TFormBit.FormCreate(Sender:TObject);
begin
{*
 000A56EC    push        ebp
 000A56ED    mov         ebp,esp
 000A56EF    push        0
 000A56F1    push        0
 000A56F3    push        0
 000A56F5    push        ebx
 000A56F6    push        esi
 000A56F7    push        edi
 000A56F8    mov         esi,eax
 000A56FA    xor         eax,eax
 000A56FC    push        ebp
 000A56FD    push        0A5823
 000A5702    push        dword ptr fs:[eax]
 000A5705    mov         dword ptr fs:[eax],esp
 000A5708    mov         eax,dword ptr [esi+2D0];TFormBit.GroupBoxBits:TGroupBox
 000A570E    mov         eax,dword ptr [eax+38];TGroupBox.Width:Integer
 000A5711    sub         eax,5A
 000A5714    test        eax,eax
>000A5716    jns         000A571B
 000A5718    add         eax,7
 000A571B    sar         eax,3
 000A571E    mov         dword ptr [ebp-4],eax
 000A5721    mov         edi,7
 000A5726    mov         ecx,dword ptr [esi+2D0];TFormBit.GroupBoxBits:TGroupBox
 000A572C    mov         dl,1
 000A572E    mov         eax,[000371C8];TCheckBox
 000A5733    call        TCustomCheckBox.Create;TCheckBox.Create
 000A5738    mov         ebx,eax
 000A573A    mov         dword ptr [esi+edi*4+2E8],ebx
 000A5741    mov         edx,dword ptr [esi+2D0];TFormBit.GroupBoxBits:TGroupBox
 000A5747    mov         eax,ebx
 000A5749    mov         ecx,dword ptr [eax]
 000A574B    call        dword ptr [ecx+64];TControl.SetParent
 000A574E    mov         edx,14
 000A5753    mov         eax,ebx
 000A5755    call        TControl.SetTop
 000A575A    mov         eax,dword ptr [ebp-4]
 000A575D    add         eax,0A
 000A5760    lea         edx,[edi+1]
 000A5763    imul        edx
 000A5765    mov         edx,dword ptr [esi+2D0];TFormBit.GroupBoxBits:TGroupBox
 000A576B    mov         edx,dword ptr [edx+38];TGroupBox.Width:Integer
 000A576E    sub         edx,eax
 000A5770    mov         eax,ebx
 000A5772    call        TControl.SetLeft
 000A5777    mov         edx,dword ptr [ebp-4]
 000A577A    mov         eax,ebx
 000A577C    call        TControl.SetWidth
 000A5781    lea         edx,[ebp-0C]
 000A5784    mov         eax,edi
 000A5786    call        IntToStr
 000A578B    mov         ecx,dword ptr [ebp-0C]
 000A578E    lea         eax,[ebp-8]
 000A5791    mov         edx,0A583C;'&'
 000A5796    call        @LStrCat3
 000A579B    mov         edx,dword ptr [ebp-8]
 000A579E    mov         eax,ebx
 000A57A0    call        TControl.SetText
 000A57A5    mov         dword ptr [ebx+108],esi;TCheckBox.?f108:TMessageForm
 000A57AB    mov         dword ptr [ebx+104],0A5840;TCheckBox.FOnClick:TNotifyEvent sub_000A5840
 000A57B5    mov         dx,7
 000A57B9    sub         dx,di
 000A57BC    mov         eax,ebx
 000A57BE    call        TWinControl.SetTabOrder
 000A57C3    dec         edi
 000A57C4    cmp         edi,0FFFFFFFF
>000A57C7    jne         000A5726
 000A57CD    mov         dx,8
 000A57D1    mov         eax,dword ptr [esi+2D8];TFormBit.ButtonCheckAll:TButton
 000A57D7    call        TWinControl.SetTabOrder
 000A57DC    mov         dx,9
 000A57E0    mov         eax,dword ptr [esi+2DC];TFormBit.ButtonUncheckAll:TButton
 000A57E6    call        TWinControl.SetTabOrder
 000A57EB    mov         dx,0A
 000A57EF    mov         eax,dword ptr [esi+2E0];TFormBit.ButtonToggleAll:TButton
 000A57F5    call        TWinControl.SetTabOrder
 000A57FA    mov         eax,esi
 000A57FC    call        00087A14
 000A5801    mov         eax,esi
 000A5803    call        00087964
 000A5808    xor         eax,eax
 000A580A    pop         edx
 000A580B    pop         ecx
 000A580C    pop         ecx
 000A580D    mov         dword ptr fs:[eax],edx
 000A5810    push        0A582A
 000A5815    lea         eax,[ebp-0C]
 000A5818    mov         edx,2
 000A581D    call        @LStrArrayClr
 000A5822    ret
>000A5823    jmp         @HandleFinally
>000A5828    jmp         000A5815
 000A582A    pop         edi
 000A582B    pop         esi
 000A582C    pop         ebx
 000A582D    mov         esp,ebp
 000A582F    pop         ebp
 000A5830    ret
*}
end;

//000A5840
procedure sub_000A5840(?:TFormBit);
begin
{*
 000A5840    push        ebp
 000A5841    mov         ebp,esp
 000A5843    add         esp,0FFFFFFE0
 000A5846    push        ebx
 000A5847    push        esi
 000A5848    push        edi
 000A5849    xor         ecx,ecx
 000A584B    mov         dword ptr [ebp-8],ecx
 000A584E    mov         dword ptr [ebp-4],ecx
 000A5851    mov         edi,eax
 000A5853    xor         eax,eax
 000A5855    push        ebp
 000A5856    push        0A5918
 000A585B    push        dword ptr fs:[eax]
 000A585E    mov         dword ptr fs:[eax],esp
 000A5861    xor         ebx,ebx
 000A5863    lea         eax,[ebp-4]
 000A5866    call        @LStrClr
 000A586B    xor         esi,esi
 000A586D    mov         eax,dword ptr [edi+esi*4+2E8]
 000A5874    mov         edx,dword ptr [eax]
 000A5876    call        dword ptr [edx+0B8]
 000A587C    mov         ecx,eax
 000A587E    mov         edx,esi
 000A5880    xor         eax,eax
 000A5882    mov         al,bl
 000A5884    call        00075210
 000A5889    mov         ebx,eax
 000A588B    mov         eax,dword ptr [edi+esi*4+2E8]
 000A5892    mov         edx,dword ptr [eax]
 000A5894    call        dword ptr [edx+0B8]
 000A589A    and         eax,7F
 000A589D    lea         edx,[ebp-8]
 000A58A0    call        IntToStr
 000A58A5    mov         edx,dword ptr [ebp-8]
 000A58A8    lea         eax,[ebp-4]
 000A58AB    mov         ecx,dword ptr [ebp-4]
 000A58AE    call        @LStrCat3
 000A58B3    inc         esi
 000A58B4    cmp         esi,8
>000A58B7    jne         000A586D
 000A58B9    lea         eax,[ebp-8]
 000A58BC    push        eax
 000A58BD    mov         esi,ebx
 000A58BF    and         esi,0FF
 000A58C5    mov         dword ptr [ebp-20],esi
 000A58C8    mov         byte ptr [ebp-1C],0
 000A58CC    mov         dword ptr [ebp-18],esi
 000A58CF    mov         byte ptr [ebp-14],0
 000A58D3    mov         eax,dword ptr [ebp-4]
 000A58D6    mov         dword ptr [ebp-10],eax
 000A58D9    mov         byte ptr [ebp-0C],0B
 000A58DD    lea         edx,[ebp-20]
 000A58E0    mov         ecx,2
 000A58E5    mov         eax,82D
 000A58EA    call        FmtLoadStr;'decimal: %d  hex: %2.2x  binary: %s'
 000A58EF    mov         edx,dword ptr [ebp-8]
 000A58F2    mov         eax,dword ptr [edi+2E4]
 000A58F8    call        TControl.SetText
 000A58FD    xor         eax,eax
 000A58FF    pop         edx
 000A5900    pop         ecx
 000A5901    pop         ecx
 000A5902    mov         dword ptr fs:[eax],edx
 000A5905    push        0A591F
 000A590A    lea         eax,[ebp-8]
 000A590D    mov         edx,2
 000A5912    call        @LStrArrayClr
 000A5917    ret
>000A5918    jmp         @HandleFinally
>000A591D    jmp         000A590A
 000A591F    pop         edi
 000A5920    pop         esi
 000A5921    pop         ebx
 000A5922    mov         esp,ebp
 000A5924    pop         ebp
 000A5925    ret
*}
end;

//000A5928
procedure TFormBit.ButtonSetClick(Sender:TObject);
begin
{*
 000A5928    push        ebx
 000A5929    push        esi
 000A592A    push        edi
 000A592B    mov         edi,eax
 000A592D    xor         ebx,ebx
 000A592F    xor         esi,esi
 000A5931    mov         eax,dword ptr [edi+esi*4+2E8]
 000A5938    mov         edx,dword ptr [eax]
 000A593A    call        dword ptr [edx+0B8]
 000A5940    mov         ecx,eax
 000A5942    mov         edx,esi
 000A5944    xor         eax,eax
 000A5946    mov         al,bl
 000A5948    call        00075210
 000A594D    mov         ebx,eax
 000A594F    inc         esi
 000A5950    cmp         esi,8
>000A5953    jne         000A5931
 000A5955    xor         edx,edx
 000A5957    mov         eax,edi
 000A5959    call        000A5840
 000A595E    cmp         bl,byte ptr [edi+308];TFormBit.?f308:byte
>000A5964    je          000A597F
 000A5966    call        000981C4
 000A596B    mov         edx,ebx
 000A596D    call        000981B8
 000A5972    mov         eax,[000B5778];^gvar_000B6BA5
 000A5977    mov         byte ptr [eax],1
 000A597A    call        00099890
 000A597F    pop         edi
 000A5980    pop         esi
 000A5981    pop         ebx
 000A5982    ret
*}
end;

//000A5984
procedure TFormBit.ButtonHelpClick(Sender:TObject);
begin
{*
 000A5984    mov         eax,[000B59E8];^Application:TApplication
 000A5989    mov         eax,dword ptr [eax]
 000A598B    mov         edx,9
 000A5990    call        TApplication.HelpContext
 000A5995    ret
*}
end;

//000A5998
procedure TFormBit.ButtonRereadClick(Sender:TObject);
begin
{*
 000A5998    push        ebx
 000A5999    push        esi
 000A599A    push        edi
 000A599B    mov         esi,eax
 000A599D    call        000981C4
 000A59A2    call        000981AC
 000A59A7    mov         ebx,eax
 000A59A9    xor         edi,edi
 000A59AB    mov         edx,edi
 000A59AD    xor         eax,eax
 000A59AF    mov         al,bl
 000A59B1    call        00075200
 000A59B6    mov         edx,eax
 000A59B8    mov         eax,dword ptr [esi+edi*4+2E8]
 000A59BF    mov         ecx,dword ptr [eax]
 000A59C1    call        dword ptr [ecx+0BC]
 000A59C7    inc         edi
 000A59C8    cmp         edi,8
>000A59CB    jne         000A59AB
 000A59CD    xor         edx,edx
 000A59CF    mov         eax,esi
 000A59D1    call        000A5840
 000A59D6    pop         edi
 000A59D7    pop         esi
 000A59D8    pop         ebx
 000A59D9    ret
*}
end;

//000A59DC
procedure TFormBit.ButtonAllClick(Sender:TObject);
begin
{*
 000A59DC    push        ebx
 000A59DD    push        esi
 000A59DE    push        edi
 000A59DF    push        ebp
 000A59E0    mov         edi,edx
 000A59E2    mov         esi,eax
 000A59E4    xor         ebx,ebx
 000A59E6    cmp         edi,dword ptr [esi+2E0];TFormBit.ButtonToggleAll:TButton
>000A59EC    jne         000A5A10
 000A59EE    mov         ebp,dword ptr [esi+ebx*4+2E8]
 000A59F5    mov         eax,ebp
 000A59F7    mov         edx,dword ptr [eax]
 000A59F9    call        dword ptr [edx+0B8]
 000A59FF    mov         edx,eax
 000A5A01    xor         dl,1
 000A5A04    mov         eax,ebp
 000A5A06    mov         ecx,dword ptr [eax]
 000A5A08    call        dword ptr [ecx+0BC]
>000A5A0E    jmp         000A5A28
 000A5A10    cmp         edi,dword ptr [esi+2D8];TFormBit.ButtonCheckAll:TButton
 000A5A16    sete        dl
 000A5A19    mov         eax,dword ptr [esi+ebx*4+2E8]
 000A5A20    mov         ecx,dword ptr [eax]
 000A5A22    call        dword ptr [ecx+0BC]
 000A5A28    inc         ebx
 000A5A29    cmp         ebx,8
>000A5A2C    jne         000A59E6
 000A5A2E    xor         edx,edx
 000A5A30    mov         eax,esi
 000A5A32    call        000A5840
 000A5A37    pop         ebp
 000A5A38    pop         edi
 000A5A39    pop         esi
 000A5A3A    pop         ebx
 000A5A3B    ret
*}
end;

end.