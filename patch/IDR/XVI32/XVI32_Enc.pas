//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Enc;

interface

uses
  SysUtils, Classes, StdCtrls, ExtCtrls, CMkomp40, CMHstBtn;

type
  TFormEncode = class(TForm)
  published
    ButtonOK:TButton;//f2C4
    ButtonCancel:TButton;//f2C8
    GroupBox1:TGroupBox;//f2CC
    Label1:TLabel;//f2D0
    RadioGroupAs:TRadioGroup;//f2D4
    GroupBox2:TGroupBox;//f2D8
    CMRadioBtnHere:TCMRadioBtn;//f2DC
    EditHere:TEdit;//f2E0
    CMRadioBtnInsert:TCMRadioBtn;//f2E4
    CMRadioBtnOver:TCMRadioBtn;//f2E8
    LabelByteOrder:TLabel;//f2EC
    ButtonHelp:TButton;//f2F0
    CMHistoryBtnEnc:TCMHistoryBtn;//f2F4
    EditNumber:TEdit;//f2F8
    procedure FormDestroy(Sender:TObject);//0009E4A4
    procedure ButtonHelpClick(Sender:TObject);//0009E88C
    procedure FormCreate(Sender:TObject);//0009E484
    procedure ButtonOKClick(Sender:TObject);//0009E4B4
  public
    //f2FC:?;//f2FC
    f305:Boolean;//f305
  end;

implementation

{$R *.DFM}

//0009E484
procedure TFormEncode.FormCreate(Sender:TObject);
begin
{*
 0009E484    push        ebx
 0009E485    mov         ebx,eax
 0009E487    mov         eax,ebx
 0009E489    call        00087A14
 0009E48E    mov         eax,ebx
 0009E490    call        00087964
 0009E495    xor         edx,edx
 0009E497    mov         eax,dword ptr [ebx+2F4];TFormEncode.CMHistoryBtnEnc:TCMHistoryBtn
 0009E49D    call        0009CAE4
 0009E4A2    pop         ebx
 0009E4A3    ret
*}
end;

//0009E4A4
procedure TFormEncode.FormDestroy(Sender:TObject);
begin
{*
 0009E4A4    xor         edx,edx
 0009E4A6    mov         eax,dword ptr [eax+2F4];TFormEncode.CMHistoryBtnEnc:TCMHistoryBtn
 0009E4AC    call        0009CB94
 0009E4B1    ret
*}
end;

//0009E4B4
procedure TFormEncode.ButtonOKClick(Sender:TObject);
begin
{*
 0009E4B4    push        ebp
 0009E4B5    mov         ebp,esp
 0009E4B7    add         esp,0FFFFFEE4
 0009E4BD    push        ebx
 0009E4BE    push        esi
 0009E4BF    push        edi
 0009E4C0    xor         ecx,ecx
 0009E4C2    mov         dword ptr [ebp-114],ecx
 0009E4C8    mov         dword ptr [ebp-11C],ecx
 0009E4CE    mov         dword ptr [ebp-10],ecx
 0009E4D1    mov         esi,eax
 0009E4D3    xor         eax,eax
 0009E4D5    push        ebp
 0009E4D6    push        9E87E
 0009E4DB    push        dword ptr fs:[eax]
 0009E4DE    mov         dword ptr fs:[eax],esp
 0009E4E1    mov         eax,edx
 0009E4E3    mov         edx,dword ptr [eax]
 0009E4E5    call        dword ptr [edx+0B4]
 0009E4EB    xor         eax,eax
 0009E4ED    push        ebp
 0009E4EE    push        9E83B
 0009E4F3    push        dword ptr fs:[eax]
 0009E4F6    mov         dword ptr fs:[eax],esp
 0009E4F9    mov         eax,dword ptr [esi+2D4];TFormEncode.RadioGroupAs:TRadioGroup
 0009E4FF    mov         eax,dword ptr [eax+1F8];TRadioGroup.FItemIndex:Integer
 0009E505    cmp         eax,6
>0009E508    ja          0009E779
 0009E50E    jmp         dword ptr [eax*4+9E515]
 0009E50E    dd          0009E531
 0009E50E    dd          0009E59B
 0009E50E    dd          0009E5D9
 0009E50E    dd          0009E62C
 0009E50E    dd          0009E67F
 0009E50E    dd          0009E6D2
 0009E50E    dd          0009E725
 0009E531    lea         edx,[ebp-10]
 0009E534    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E53A    call        TControl.GetText
 0009E53F    mov         eax,dword ptr [ebp-10]
 0009E542    call        000745FC
 0009E547    movsx       ebx,ax
 0009E54A    add         ebx,80
 0009E550    cmp         ebx,0FF
>0009E556    jbe         0009E55D
 0009E558    call        @BoundErr
 0009E55D    add         ebx,0FFFFFF80
 0009E560    lea         edx,[ebp-114]
 0009E566    mov         eax,ebx
 0009E568    call        000748F8
 0009E56D    mov         edx,dword ptr [ebp-114]
 0009E573    lea         eax,[ebp-110]
 0009E579    mov         ecx,0FF
 0009E57E    call        @LStrToString
 0009E583    lea         edx,[ebp-110]
 0009E589    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E58F    mov         cl,8
 0009E591    call        @PStrNCpy
>0009E596    jmp         0009E779
 0009E59B    lea         edx,[ebp-10]
 0009E59E    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E5A4    call        TControl.GetText
 0009E5A9    mov         eax,dword ptr [ebp-10]
 0009E5AC    call        00074524
 0009E5B1    mov         ebx,eax
 0009E5B3    lea         eax,[ebp-118]
 0009E5B9    mov         edx,ebx
 0009E5BB    mov         byte ptr [eax+1],dl
 0009E5BE    mov         byte ptr [eax],1
 0009E5C1    lea         edx,[ebp-118]
 0009E5C7    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E5CD    mov         cl,8
 0009E5CF    call        @PStrNCpy
>0009E5D4    jmp         0009E779
 0009E5D9    lea         edx,[ebp-10]
 0009E5DC    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E5E2    call        TControl.GetText
 0009E5E7    mov         eax,dword ptr [ebp-10]
 0009E5EA    call        00074590
 0009E5EF    mov         ebx,eax
 0009E5F1    lea         edx,[ebp-114]
 0009E5F7    mov         eax,ebx
 0009E5F9    call        0007495C
 0009E5FE    mov         edx,dword ptr [ebp-114]
 0009E604    lea         eax,[ebp-110]
 0009E60A    mov         ecx,0FF
 0009E60F    call        @LStrToString
 0009E614    lea         edx,[ebp-110]
 0009E61A    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E620    mov         cl,8
 0009E622    call        @PStrNCpy
>0009E627    jmp         0009E779
 0009E62C    lea         edx,[ebp-10]
 0009E62F    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E635    call        TControl.GetText
 0009E63A    mov         eax,dword ptr [ebp-10]
 0009E63D    call        000745FC
 0009E642    mov         ebx,eax
 0009E644    lea         edx,[ebp-114]
 0009E64A    mov         eax,ebx
 0009E64C    call        00074910
 0009E651    mov         edx,dword ptr [ebp-114]
 0009E657    lea         eax,[ebp-110]
 0009E65D    mov         ecx,0FF
 0009E662    call        @LStrToString
 0009E667    lea         edx,[ebp-110]
 0009E66D    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E673    mov         cl,8
 0009E675    call        @PStrNCpy
>0009E67A    jmp         0009E779
 0009E67F    lea         edx,[ebp-10]
 0009E682    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E688    call        TControl.GetText
 0009E68D    mov         eax,dword ptr [ebp-10]
 0009E690    call        0007466C
 0009E695    mov         ebx,eax
 0009E697    lea         edx,[ebp-114]
 0009E69D    mov         eax,ebx
 0009E69F    call        000749A8
 0009E6A4    mov         edx,dword ptr [ebp-114]
 0009E6AA    lea         eax,[ebp-110]
 0009E6B0    mov         ecx,0FF
 0009E6B5    call        @LStrToString
 0009E6BA    lea         edx,[ebp-110]
 0009E6C0    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E6C6    mov         cl,8
 0009E6C8    call        @PStrNCpy
>0009E6CD    jmp         0009E779
 0009E6D2    lea         edx,[ebp-10]
 0009E6D5    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E6DB    call        TControl.GetText
 0009E6E0    mov         eax,dword ptr [ebp-10]
 0009E6E3    call        00074674
 0009E6E8    fstp        dword ptr [ebp-4]
 0009E6EB    wait
 0009E6EC    push        dword ptr [ebp-4]
 0009E6EF    lea         eax,[ebp-114]
 0009E6F5    call        00074A3C
 0009E6FA    mov         edx,dword ptr [ebp-114]
 0009E700    lea         eax,[ebp-110]
 0009E706    mov         ecx,0FF
 0009E70B    call        @LStrToString
 0009E710    lea         edx,[ebp-110]
 0009E716    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E71C    mov         cl,8
 0009E71E    call        @PStrNCpy
>0009E723    jmp         0009E779
 0009E725    lea         edx,[ebp-10]
 0009E728    mov         eax,dword ptr [esi+2F8];TFormEncode.EditNumber:TEdit
 0009E72E    call        TControl.GetText
 0009E733    mov         eax,dword ptr [ebp-10]
 0009E736    call        00074758
 0009E73B    fstp        qword ptr [ebp-0C]
 0009E73E    wait
 0009E73F    push        dword ptr [ebp-8]
 0009E742    push        dword ptr [ebp-0C]
 0009E745    lea         eax,[ebp-114]
 0009E74B    call        00074AD0
 0009E750    mov         edx,dword ptr [ebp-114]
 0009E756    lea         eax,[ebp-110]
 0009E75C    mov         ecx,0FF
 0009E761    call        @LStrToString
 0009E766    lea         edx,[ebp-110]
 0009E76C    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E772    mov         cl,8
 0009E774    call        @PStrNCpy
 0009E779    mov         eax,dword ptr [esi+2E8];TFormEncode.CMRadioBtnOver:TCMRadioBtn
 0009E77F    mov         edx,dword ptr [eax]
 0009E781    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009E787    mov         byte ptr [esi+305],al;TFormEncode.?f305:Boolean
 0009E78D    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 0009E792    cmp         byte ptr [eax],1
>0009E795    jne         0009E7E2
 0009E797    lea         eax,[ebp-11C]
 0009E79D    lea         edx,[esi+2FC];TFormEncode.?f2FC:?
 0009E7A3    call        @LStrFromString
 0009E7A8    mov         eax,dword ptr [ebp-11C]
 0009E7AE    lea         edx,[ebp-114]
 0009E7B4    call        00074258
 0009E7B9    mov         edx,dword ptr [ebp-114]
 0009E7BF    lea         eax,[ebp-110]
 0009E7C5    mov         ecx,0FF
 0009E7CA    call        @LStrToString
 0009E7CF    lea         edx,[ebp-110]
 0009E7D5    lea         eax,[esi+2FC];TFormEncode.?f2FC:?
 0009E7DB    mov         cl,8
 0009E7DD    call        @PStrNCpy
 0009E7E2    mov         eax,dword ptr [esi+2DC];TFormEncode.CMRadioBtnHere:TCMRadioBtn
 0009E7E8    mov         edx,dword ptr [eax]
 0009E7EA    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 0009E7F0    test        al,al
>0009E7F2    je          0009E831
 0009E7F4    lea         eax,[ebp-11C]
 0009E7FA    lea         edx,[esi+2FC];TFormEncode.?f2FC:?
 0009E800    call        @LStrFromString
 0009E805    mov         eax,dword ptr [ebp-11C]
 0009E80B    lea         ecx,[ebp-114]
 0009E811    mov         dl,1
 0009E813    call        00074D04
 0009E818    mov         edx,dword ptr [ebp-114]
 0009E81E    mov         eax,dword ptr [esi+2E0];TFormEncode.EditHere:TEdit
 0009E824    call        TControl.SetText
 0009E829    xor         eax,eax
 0009E82B    mov         dword ptr [esi+22C],eax;TFormEncode.FModalResult:TModalResult
 0009E831    xor         eax,eax
 0009E833    pop         edx
 0009E834    pop         ecx
 0009E835    pop         ecx
 0009E836    mov         dword ptr fs:[eax],edx
>0009E839    jmp         0009E852
>0009E83B    jmp         @HandleAnyException
 0009E840    call        @RaiseAgain
 0009E845    xor         eax,eax
 0009E847    mov         dword ptr [esi+22C],eax;TFormEncode.FModalResult:TModalResult
 0009E84D    call        @DoneExcept
 0009E852    xor         eax,eax
 0009E854    pop         edx
 0009E855    pop         ecx
 0009E856    pop         ecx
 0009E857    mov         dword ptr fs:[eax],edx
 0009E85A    push        9E885
 0009E85F    lea         eax,[ebp-11C]
 0009E865    call        @LStrClr
 0009E86A    lea         eax,[ebp-114]
 0009E870    call        @LStrClr
 0009E875    lea         eax,[ebp-10]
 0009E878    call        @LStrClr
 0009E87D    ret
>0009E87E    jmp         @HandleFinally
>0009E883    jmp         0009E85F
 0009E885    pop         edi
 0009E886    pop         esi
 0009E887    pop         ebx
 0009E888    mov         esp,ebp
 0009E88A    pop         ebp
 0009E88B    ret
*}
end;

//0009E88C
procedure TFormEncode.ButtonHelpClick(Sender:TObject);
begin
{*
 0009E88C    mov         eax,[000B59E8];^Application:TApplication
 0009E891    mov         eax,dword ptr [eax]
 0009E893    mov         edx,37
 0009E898    call        TApplication.HelpContext
 0009E89D    ret
*}
end;

end.