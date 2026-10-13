//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Insp;

interface

uses
  SysUtils, Classes, StdCtrls, ExtCtrls, Menus;

type
  TFormInspect = class(TForm)
  published
    Memo1:TMemo;//f2C4
    Panel1:TPanel;//f2C8
    Label1:TLabel;//f2CC
    PopupMenu1:TPopupMenu;//f2D0
    Configure1:TMenuItem;//f2D4
    Edit1:TMenuItem;//f2D8
    procedure Edit1Click(Sender:TObject);//00093DE8
    procedure Memo1DblClick(Sender:TObject);//00093DCC
    procedure Memo1MouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00093ED4
    procedure Configure1Click(Sender:TObject);//00093DD4
    procedure FormCreate(Sender:TObject);//000937C8
    procedure FormDestroy(Sender:TObject);//00093810
    procedure FormClose(Sender:TObject; var Action:TCloseAction);//00093818
  end;
    //procedure sub_00093834(?:?);//00093834
    //procedure sub_00093A70(?:?);//00093A70
    procedure sub_00093D60;//00093D60
    procedure sub_00093DB0;//00093DB0

implementation

{$R *.DFM}

//000937C8
procedure TFormInspect.FormCreate(Sender:TObject);
begin
{*
 000937C8    push        ebx
 000937C9    mov         ebx,eax
 000937CB    push        0B55E0
 000937D0    push        1
 000937D2    push        0CB
 000937D7    mov         eax,dword ptr [ebx+2C4];TFormInspect.Memo1:TMemo
 000937DD    call        TWinControl.GetHandle
 000937E2    push        eax
 000937E3    call        user32.SendMessageA
 000937E8    xor         edx,edx
 000937EA    mov         eax,ebx
 000937EC    call        00087868
 000937F1    mov         eax,ebx
 000937F3    call        00087964
 000937F8    mov         eax,dword ptr [ebx+2C4];TFormInspect.Memo1:TMemo
 000937FE    mov         eax,dword ptr [eax+58];TMemo.FFont:TFont
 00093801    mov         edx,80000012
 00093806    call        TFont.SetColor
 0009380B    pop         ebx
 0009380C    ret
*}
end;

//00093810
procedure TFormInspect.FormDestroy(Sender:TObject);
begin
{*
 00093810    xor         edx,edx
 00093812    call        000876D8
 00093817    ret
*}
end;

//00093818
procedure TFormInspect.FormClose(Sender:TObject; var Action:TCloseAction);
begin
{*
 00093818    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009381D    mov         eax,dword ptr [eax]
 0009381F    mov         eax,dword ptr [eax+47C]
 00093825    xor         edx,edx
 00093827    call        TMenuItem.SetChecked
 0009382C    call        00093DB0
 00093831    ret
*}
end;

//00093834
{*procedure sub_00093834(?:?);
begin
 00093834    push        ebp
 00093835    mov         ebp,esp
 00093837    xor         ecx,ecx
 00093839    push        ecx
 0009383A    push        ecx
 0009383B    push        ecx
 0009383C    push        ecx
 0009383D    push        ecx
 0009383E    push        ecx
 0009383F    push        ecx
 00093840    push        ecx
 00093841    push        ebx
 00093842    mov         ebx,eax
 00093844    xor         eax,eax
 00093846    push        ebp
 00093847    push        93A57
 0009384C    push        dword ptr fs:[eax]
 0009384F    mov         dword ptr fs:[eax],esp
 00093852    mov         eax,[000B5BEC];^gvar_000B6BB4
 00093857    cmp         byte ptr [eax],0
>0009385A    je          00093870
 0009385C    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 00093861    cmp         dword ptr [eax],0
>00093864    je          00093870
 00093866    mov         eax,[000B59C0];^gvar_000B6B6C
 0009386B    cmp         dword ptr [eax],0
>0009386E    jne         00093888
 00093870    mov         eax,dword ptr [ebx+2C4]
 00093876    mov         eax,dword ptr [eax+204]
 0009387C    xor         edx,edx
 0009387E    mov         ecx,dword ptr [eax]
 00093880    call        dword ptr [ecx+2C]
>00093883    jmp         00093A3C
 00093888    lea         eax,[ebp-1C]
 0009388B    call        @LStrClr
 00093890    lea         eax,[ebp-0C]
 00093893    push        eax
 00093894    lea         eax,[ebp-10]
 00093897    push        eax
 00093898    lea         eax,[ebp-14]
 0009389B    push        eax
 0009389C    lea         eax,[ebp-18]
 0009389F    push        eax
 000938A0    call        000981C4
 000938A5    lea         ecx,[ebp-8]
 000938A8    lea         edx,[ebp-4]
 000938AB    call        0009B560
 000938B0    mov         eax,[000B59FC];^gvar_000B700A:Boolean
 000938B5    cmp         byte ptr [eax],0
>000938B8    je          000938D2
 000938BA    push        dword ptr [ebp-1C]
 000938BD    push        dword ptr [ebp-4]
 000938C0    push        93A6C;#13+#10
 000938C5    lea         eax,[ebp-1C]
 000938C8    mov         edx,3
 000938CD    call        @LStrCatN
 000938D2    mov         eax,[000B57A8];^gvar_000B700B:Boolean
 000938D7    cmp         byte ptr [eax],0
>000938DA    je          0009390B
 000938DC    push        dword ptr [ebp-1C]
 000938DF    call        000981C4
 000938E4    call        000981AC
 000938E9    and         eax,0FF
 000938EE    lea         edx,[ebp-20]
 000938F1    call        IntToStr
 000938F6    push        dword ptr [ebp-20]
 000938F9    push        93A6C;#13+#10
 000938FE    lea         eax,[ebp-1C]
 00093901    mov         edx,3
 00093906    call        @LStrCatN
 0009390B    mov         eax,[000B5B18];^gvar_000B700C:Boolean
 00093910    cmp         byte ptr [eax],0
>00093913    je          0009392D
 00093915    push        dword ptr [ebp-1C]
 00093918    push        dword ptr [ebp-8]
 0009391B    push        93A6C;#13+#10
 00093920    lea         eax,[ebp-1C]
 00093923    mov         edx,3
 00093928    call        @LStrCatN
 0009392D    mov         eax,[000B5920];^gvar_000B700D:Boolean
 00093932    cmp         byte ptr [eax],0
>00093935    je          0009394F
 00093937    push        dword ptr [ebp-1C]
 0009393A    push        dword ptr [ebp-0C]
 0009393D    push        93A6C;#13+#10
 00093942    lea         eax,[ebp-1C]
 00093945    mov         edx,3
 0009394A    call        @LStrCatN
 0009394F    mov         eax,[000B56D0];^gvar_000B700E:Boolean
 00093954    cmp         byte ptr [eax],0
>00093957    je          00093971
 00093959    push        dword ptr [ebp-1C]
 0009395C    push        dword ptr [ebp-10]
 0009395F    push        93A6C;#13+#10
 00093964    lea         eax,[ebp-1C]
 00093967    mov         edx,3
 0009396C    call        @LStrCatN
 00093971    mov         eax,[000B5664];^gvar_000B700F:Boolean
 00093976    cmp         byte ptr [eax],0
>00093979    je          00093993
 0009397B    push        dword ptr [ebp-1C]
 0009397E    push        dword ptr [ebp-14]
 00093981    push        93A6C;#13+#10
 00093986    lea         eax,[ebp-1C]
 00093989    mov         edx,3
 0009398E    call        @LStrCatN
 00093993    mov         eax,[000B59CC];^gvar_000B7010:Boolean
 00093998    cmp         byte ptr [eax],0
>0009399B    je          000939B5
 0009399D    push        dword ptr [ebp-1C]
 000939A0    push        dword ptr [ebp-18]
 000939A3    push        93A6C;#13+#10
 000939A8    lea         eax,[ebp-1C]
 000939AB    mov         edx,3
 000939B0    call        @LStrCatN
 000939B5    mov         eax,[000B5980];^gvar_000B7011:Boolean
 000939BA    cmp         byte ptr [eax],0
>000939BD    je          000939E9
 000939BF    push        dword ptr [ebp-1C]
 000939C2    call        000981C4
 000939C7    call        000981AC
 000939CC    lea         edx,[ebp-20]
 000939CF    call        00075230
 000939D4    push        dword ptr [ebp-20]
 000939D7    push        93A6C;#13+#10
 000939DC    lea         eax,[ebp-1C]
 000939DF    mov         edx,3
 000939E4    call        @LStrCatN
 000939E9    mov         eax,[000B5A00];^gvar_000B7012:Boolean
 000939EE    cmp         byte ptr [eax],0
>000939F1    je          00093A18
 000939F3    push        dword ptr [ebp-1C]
 000939F6    call        00099AC0
 000939FB    lea         edx,[ebp-20]
 000939FE    call        IntToStr
 00093A03    push        dword ptr [ebp-20]
 00093A06    push        93A6C;#13+#10
 00093A0B    lea         eax,[ebp-1C]
 00093A0E    mov         edx,3
 00093A13    call        @LStrCatN
 00093A18    lea         ecx,[ebp-20]
 00093A1B    mov         edx,2
 00093A20    mov         eax,dword ptr [ebp-1C]
 00093A23    call        00075168
 00093A28    mov         edx,dword ptr [ebp-20]
 00093A2B    mov         eax,dword ptr [ebx+2C4]
 00093A31    mov         eax,dword ptr [eax+204]
 00093A37    mov         ecx,dword ptr [eax]
 00093A39    call        dword ptr [ecx+2C]
 00093A3C    xor         eax,eax
 00093A3E    pop         edx
 00093A3F    pop         ecx
 00093A40    pop         ecx
 00093A41    mov         dword ptr fs:[eax],edx
 00093A44    push        93A5E
 00093A49    lea         eax,[ebp-20]
 00093A4C    mov         edx,8
 00093A51    call        @LStrArrayClr
 00093A56    ret
>00093A57    jmp         @HandleFinally
>00093A5C    jmp         00093A49
 00093A5E    pop         ebx
 00093A5F    mov         esp,ebp
 00093A61    pop         ebp
 00093A62    ret
end;*}

//00093A70
{*procedure sub_00093A70(?:?);
begin
 00093A70    push        ebp
 00093A71    mov         ebp,esp
 00093A73    push        0
 00093A75    push        0
 00093A77    push        ebx
 00093A78    push        esi
 00093A79    mov         esi,eax
 00093A7B    xor         eax,eax
 00093A7D    push        ebp
 00093A7E    push        93C87
 00093A83    push        dword ptr fs:[eax]
 00093A86    mov         dword ptr fs:[eax],esp
 00093A89    mov         ebx,8
 00093A8E    mov         eax,0B6B54;gvar_000B6B54
 00093A93    mov         byte ptr [eax],0FF
 00093A96    inc         eax
 00093A97    dec         ebx
>00093A98    jne         00093A93
 00093A9A    lea         eax,[ebp-4]
 00093A9D    call        @LStrClr
 00093AA2    xor         ebx,ebx
 00093AA4    mov         eax,[000B59FC];^gvar_000B700A:Boolean
 00093AA9    cmp         byte ptr [eax],0
>00093AAC    je          00093AD0
 00093AAE    push        dword ptr [ebp-4]
 00093AB1    push        93C9C;'short (±):'
 00093AB6    push        93CB0;#13+#10
 00093ABB    lea         eax,[ebp-4]
 00093ABE    mov         edx,3
 00093AC3    call        @LStrCatN
 00093AC8    mov         byte ptr [ebx+0B6B54],0;gvar_000B6B54
 00093ACF    inc         ebx
 00093AD0    mov         eax,[000B57A8];^gvar_000B700B:Boolean
 00093AD5    cmp         byte ptr [eax],0
>00093AD8    je          00093AFC
 00093ADA    push        dword ptr [ebp-4]
 00093ADD    push        93CBC;'byte (+):'
 00093AE2    push        93CB0;#13+#10
 00093AE7    lea         eax,[ebp-4]
 00093AEA    mov         edx,3
 00093AEF    call        @LStrCatN
 00093AF4    mov         byte ptr [ebx+0B6B54],1;gvar_000B6B54
 00093AFB    inc         ebx
 00093AFC    mov         eax,[000B5B18];^gvar_000B700C:Boolean
 00093B01    cmp         byte ptr [eax],0
>00093B04    je          00093B28
 00093B06    push        dword ptr [ebp-4]
 00093B09    push        93CD0;'word (+):'
 00093B0E    push        93CB0;#13+#10
 00093B13    lea         eax,[ebp-4]
 00093B16    mov         edx,3
 00093B1B    call        @LStrCatN
 00093B20    mov         byte ptr [ebx+0B6B54],2;gvar_000B6B54
 00093B27    inc         ebx
 00093B28    mov         eax,[000B5920];^gvar_000B700D:Boolean
 00093B2D    cmp         byte ptr [eax],0
>00093B30    je          00093B54
 00093B32    push        dword ptr [ebp-4]
 00093B35    push        93CE4;'integer (±):'
 00093B3A    push        93CB0;#13+#10
 00093B3F    lea         eax,[ebp-4]
 00093B42    mov         edx,3
 00093B47    call        @LStrCatN
 00093B4C    mov         byte ptr [ebx+0B6B54],3;gvar_000B6B54
 00093B53    inc         ebx
 00093B54    mov         eax,[000B56D0];^gvar_000B700E:Boolean
 00093B59    cmp         byte ptr [eax],0
>00093B5C    je          00093B80
 00093B5E    push        dword ptr [ebp-4]
 00093B61    push        93CFC;'longint (±):'
 00093B66    push        93CB0;#13+#10
 00093B6B    lea         eax,[ebp-4]
 00093B6E    mov         edx,3
 00093B73    call        @LStrCatN
 00093B78    mov         byte ptr [ebx+0B6B54],4;gvar_000B6B54
 00093B7F    inc         ebx
 00093B80    mov         eax,[000B5664];^gvar_000B700F:Boolean
 00093B85    cmp         byte ptr [eax],0
>00093B88    je          00093BAC
 00093B8A    push        dword ptr [ebp-4]
 00093B8D    push        93D14;'IEEE single:'
 00093B92    push        93CB0;#13+#10
 00093B97    lea         eax,[ebp-4]
 00093B9A    mov         edx,3
 00093B9F    call        @LStrCatN
 00093BA4    mov         byte ptr [ebx+0B6B54],5;gvar_000B6B54
 00093BAB    inc         ebx
 00093BAC    mov         eax,[000B59CC];^gvar_000B7010:Boolean
 00093BB1    cmp         byte ptr [eax],0
>00093BB4    je          00093BD8
 00093BB6    push        dword ptr [ebp-4]
 00093BB9    push        93D2C;'IEEE double:'
 00093BBE    push        93CB0;#13+#10
 00093BC3    lea         eax,[ebp-4]
 00093BC6    mov         edx,3
 00093BCB    call        @LStrCatN
 00093BD0    mov         byte ptr [ebx+0B6B54],6;gvar_000B6B54
 00093BD7    inc         ebx
 00093BD8    mov         eax,[000B5980];^gvar_000B7011:Boolean
 00093BDD    cmp         byte ptr [eax],0
>00093BE0    je          00093C03
 00093BE2    push        dword ptr [ebp-4]
 00093BE5    push        93D44;'binary:'
 00093BEA    push        93CB0;#13+#10
 00093BEF    lea         eax,[ebp-4]
 00093BF2    mov         edx,3
 00093BF7    call        @LStrCatN
 00093BFC    mov         byte ptr [ebx+0B6B54],7;gvar_000B6B54
 00093C03    mov         eax,[000B5A00];^gvar_000B7012:Boolean
 00093C08    cmp         byte ptr [eax],0
>00093C0B    je          00093C27
 00093C0D    push        dword ptr [ebp-4]
 00093C10    push        93D54;'Block Size:'
 00093C15    push        93CB0;#13+#10
 00093C1A    lea         eax,[ebp-4]
 00093C1D    mov         edx,3
 00093C22    call        @LStrCatN
 00093C27    lea         ecx,[ebp-8]
 00093C2A    mov         edx,2
 00093C2F    mov         eax,dword ptr [ebp-4]
 00093C32    call        00075168
 00093C37    mov         edx,dword ptr [ebp-8]
 00093C3A    mov         eax,dword ptr [esi+2CC]
 00093C40    call        TControl.SetText
 00093C45    mov         eax,dword ptr [esi+2CC]
 00093C4B    mov         edx,dword ptr [eax+38]
 00093C4E    add         edx,0A
 00093C51    mov         eax,dword ptr [esi+2C8]
 00093C57    call        TControl.SetWidth
 00093C5C    mov         eax,dword ptr [esi+2CC]
 00093C62    mov         edx,dword ptr [eax+3C]
 00093C65    mov         eax,esi
 00093C67    call        TCustomForm.SetClientHeight
 00093C6C    xor         eax,eax
 00093C6E    pop         edx
 00093C6F    pop         ecx
 00093C70    pop         ecx
 00093C71    mov         dword ptr fs:[eax],edx
 00093C74    push        93C8E
 00093C79    lea         eax,[ebp-8]
 00093C7C    mov         edx,2
 00093C81    call        @LStrArrayClr
 00093C86    ret
>00093C87    jmp         @HandleFinally
>00093C8C    jmp         00093C79
 00093C8E    pop         esi
 00093C8F    pop         ebx
 00093C90    pop         ecx
 00093C91    pop         ecx
 00093C92    pop         ebp
 00093C93    ret
end;*}

//00093D60
procedure sub_00093D60;
begin
{*
 00093D60    cmp         dword ptr ds:[0B6B50],0;gvar_000B6B50:TFormInspect
>00093D67    jne         00093DAE
 00093D69    mov         eax,[000B59E8];^Application:TApplication
 00093D6E    mov         eax,dword ptr [eax]
 00093D70    mov         ecx,dword ptr [eax+30];TApplication.FMainForm:TForm
 00093D73    mov         dl,1
 00093D75    mov         eax,[00093578];TFormInspect
 00093D7A    call        TCustomForm.Create;TFormInspect.Create
 00093D7F    mov         [000B6B50],eax;gvar_000B6B50:TFormInspect
 00093D84    mov         eax,[000B6B50];gvar_000B6B50:TFormInspect
 00093D89    call        00093A70
 00093D8E    mov         eax,[000B6B50];gvar_000B6B50:TFormInspect
 00093D93    call        TCustomForm.Show
 00093D98    mov         eax,[000B6B50];gvar_000B6B50:TFormInspect
 00093D9D    call        00093834
 00093DA2    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00093DA7    mov         eax,dword ptr [eax]
 00093DA9    call        TControl.BringToFront
 00093DAE    ret
*}
end;

//00093DB0
procedure sub_00093DB0;
begin
{*
 00093DB0    cmp         dword ptr ds:[0B6B50],0;gvar_000B6B50:TFormInspect
>00093DB7    je          00093DCA
 00093DB9    mov         eax,[000B6B50];gvar_000B6B50:TFormInspect
 00093DBE    call        TCustomForm.Release
 00093DC3    xor         eax,eax
 00093DC5    mov         [000B6B50],eax;gvar_000B6B50:TFormInspect
 00093DCA    ret
*}
end;

//00093DCC
procedure TFormInspect.Memo1DblClick(Sender:TObject);
begin
{*
 00093DCC    call        TFormInspect.Edit1Click
 00093DD1    ret
*}
end;

//00093DD4
procedure TFormInspect.Configure1Click(Sender:TObject);
begin
{*
 00093DD4    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00093DD9    mov         eax,dword ptr [eax]
 00093DDB    mov         edx,2
 00093DE0    call        000AFCA4
 00093DE5    ret
*}
end;

//00093DE8
procedure TFormInspect.Edit1Click(Sender:TObject);
begin
{*
 00093DE8    push        ebp
 00093DE9    mov         ebp,esp
 00093DEB    add         esp,0FFFFFFF8
 00093DEE    push        ebx
 00093DEF    push        esi
 00093DF0    push        edi
 00093DF1    xor         ecx,ecx
 00093DF3    mov         dword ptr [ebp-8],ecx
 00093DF6    mov         dword ptr [ebp-4],edx
 00093DF9    mov         ebx,eax
 00093DFB    xor         eax,eax
 00093DFD    push        ebp
 00093DFE    push        93EC4
 00093E03    push        dword ptr fs:[eax]
 00093E06    mov         dword ptr fs:[eax],esp
 00093E09    mov         eax,[000B5BEC];^gvar_000B6BB4
 00093E0E    cmp         byte ptr [eax],0
>00093E11    je          00093EAE
 00093E17    push        0
 00093E19    mov         esi,dword ptr [ebx+2C4];TFormInspect.Memo1:TMemo
 00093E1F    mov         eax,esi
 00093E21    mov         edx,dword ptr [eax]
 00093E23    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00093E29    mov         ecx,eax
 00093E2B    mov         edx,0C9
 00093E30    mov         eax,esi
 00093E32    call        TControl.Perform
 00093E37    mov         esi,eax
 00093E39    lea         ecx,[ebp-8]
 00093E3C    mov         eax,dword ptr [ebx+2C4];TFormInspect.Memo1:TMemo
 00093E42    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 00093E48    mov         edx,esi
 00093E4A    mov         edi,dword ptr [eax]
 00093E4C    call        dword ptr [edi+0C];TStrings.Get
 00093E4F    cmp         dword ptr [ebp-8],0
>00093E53    je          00093EAE
 00093E55    movsx       eax,byte ptr [esi+0B6B54];gvar_000B6B54
 00093E5C    cmp         eax,7
>00093E5F    jne         00093E72
 00093E61    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00093E66    mov         eax,dword ptr [eax]
 00093E68    mov         edx,dword ptr [ebp-4]
 00093E6B    call        TFormMain.Bitmanipulation1Click
>00093E70    jmp         00093EAE
 00093E72    mov         edx,eax
 00093E74    sub         edx,7
>00093E77    jae         00093EAE
 00093E79    mov         edx,dword ptr ds:[0B5910];^gvar_000B7004:Longint
 00093E7F    mov         byte ptr [edx],al
 00093E81    mov         eax,[000B5A34];^gvar_000B7005:Longint
 00093E86    mov         byte ptr [eax],1
 00093E89    lea         ecx,[ebp-8]
 00093E8C    mov         eax,dword ptr [ebx+2C4];TFormInspect.Memo1:TMemo
 00093E92    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 00093E98    mov         edx,esi
 00093E9A    mov         ebx,dword ptr [eax]
 00093E9C    call        dword ptr [ebx+0C];TStrings.Get
 00093E9F    mov         edx,dword ptr [ebp-8]
 00093EA2    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00093EA7    mov         eax,dword ptr [eax]
 00093EA9    call        000AD998
 00093EAE    xor         eax,eax
 00093EB0    pop         edx
 00093EB1    pop         ecx
 00093EB2    pop         ecx
 00093EB3    mov         dword ptr fs:[eax],edx
 00093EB6    push        93ECB
 00093EBB    lea         eax,[ebp-8]
 00093EBE    call        @LStrClr
 00093EC3    ret
>00093EC4    jmp         @HandleFinally
>00093EC9    jmp         00093EBB
 00093ECB    pop         edi
 00093ECC    pop         esi
 00093ECD    pop         ebx
 00093ECE    pop         ecx
 00093ECF    pop         ecx
 00093ED0    pop         ebp
 00093ED1    ret
*}
end;

//00093ED4
procedure TFormInspect.Memo1MouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00093ED4    push        ebp
 00093ED5    mov         ebp,esp
 00093ED7    add         esp,0FFFFFFE4
 00093EDA    push        ebx
 00093EDB    push        esi
 00093EDC    push        edi
 00093EDD    xor         ebx,ebx
 00093EDF    mov         dword ptr [ebp-14],ebx
 00093EE2    mov         byte ptr [ebp-1],cl
 00093EE5    mov         esi,eax
 00093EE7    mov         ebx,dword ptr [ebp+0C]
 00093EEA    xor         eax,eax
 00093EEC    push        ebp
 00093EED    push        94014
 00093EF2    push        dword ptr fs:[eax]
 00093EF5    mov         dword ptr fs:[eax],esp
 00093EF8    cmp         byte ptr [ebp-1],1
>00093EFC    jne         00093FFE
 00093F02    mov         eax,[000B5BEC];^gvar_000B6BB4
 00093F07    cmp         byte ptr [eax],0
>00093F0A    jne         00093F1B
 00093F0C    xor         edx,edx
 00093F0E    mov         eax,dword ptr [esi+2D8];TFormInspect.Edit1:TMenuItem
 00093F14    call        TMenuItem.SetEnabled
>00093F19    jmp         00093F95
 00093F1B    push        0
 00093F1D    mov         edi,dword ptr [esi+2C4];TFormInspect.Memo1:TMemo
 00093F23    mov         eax,edi
 00093F25    mov         edx,dword ptr [eax]
 00093F27    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00093F2D    mov         ecx,eax
 00093F2F    mov         edx,0C9
 00093F34    mov         eax,edi
 00093F36    call        TControl.Perform
 00093F3B    mov         dword ptr [ebp-8],eax
 00093F3E    mov         eax,dword ptr [ebp-8]
 00093F41    movsx       eax,byte ptr [eax+0B6B54];gvar_000B6B54
 00093F48    sub         eax,8
>00093F4B    jae         00093F88
 00093F4D    lea         ecx,[ebp-14]
 00093F50    mov         eax,dword ptr [esi+2C4];TFormInspect.Memo1:TMemo
 00093F56    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 00093F5C    mov         edx,dword ptr [ebp-8]
 00093F5F    mov         edi,dword ptr [eax]
 00093F61    call        dword ptr [edi+0C];TStrings.Get
 00093F64    cmp         dword ptr [ebp-14],0
>00093F68    jne         00093F79
 00093F6A    xor         edx,edx
 00093F6C    mov         eax,dword ptr [esi+2D8];TFormInspect.Edit1:TMenuItem
 00093F72    call        TMenuItem.SetEnabled
>00093F77    jmp         00093F95
 00093F79    mov         dl,1
 00093F7B    mov         eax,dword ptr [esi+2D8];TFormInspect.Edit1:TMenuItem
 00093F81    call        TMenuItem.SetEnabled
>00093F86    jmp         00093F95
 00093F88    xor         edx,edx
 00093F8A    mov         eax,dword ptr [esi+2D8];TFormInspect.Edit1:TMenuItem
 00093F90    call        TMenuItem.SetEnabled
 00093F95    mov         dx,word ptr [ebp+8]
 00093F99    mov         eax,ebx
 00093F9B    call        00017224
 00093FA0    push        eax
 00093FA1    push        0
 00093FA3    push        0D7
 00093FA8    mov         edi,dword ptr [esi+2C4];TFormInspect.Memo1:TMemo
 00093FAE    mov         eax,edi
 00093FB0    call        TWinControl.GetHandle
 00093FB5    push        eax
 00093FB6    call        user32.SendMessageA
 00093FBB    mov         edx,eax
 00093FBD    mov         eax,edi
 00093FBF    mov         ecx,dword ptr [eax]
 00093FC1    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
 00093FC7    mov         dword ptr [ebp-10],ebx
 00093FCA    mov         eax,dword ptr [ebp+8]
 00093FCD    mov         dword ptr [ebp-0C],eax
 00093FD0    lea         ecx,[ebp-1C]
 00093FD3    lea         edx,[ebp-10]
 00093FD6    mov         eax,dword ptr [esi+2C4];TFormInspect.Memo1:TMemo
 00093FDC    call        TControl.ClientToScreen
 00093FE1    mov         eax,dword ptr [ebp-1C]
 00093FE4    mov         dword ptr [ebp-10],eax
 00093FE7    mov         eax,dword ptr [ebp-18]
 00093FEA    mov         dword ptr [ebp-0C],eax
 00093FED    mov         ecx,dword ptr [ebp-0C]
 00093FF0    mov         edx,dword ptr [ebp-10]
 00093FF3    mov         eax,dword ptr [esi+2D0];TFormInspect.PopupMenu1:TPopupMenu
 00093FF9    mov         ebx,dword ptr [eax]
 00093FFB    call        dword ptr [ebx+3C];TPopupMenu.Popup
 00093FFE    xor         eax,eax
 00094000    pop         edx
 00094001    pop         ecx
 00094002    pop         ecx
 00094003    mov         dword ptr fs:[eax],edx
 00094006    push        9401B
 0009400B    lea         eax,[ebp-14]
 0009400E    call        @LStrClr
 00094013    ret
>00094014    jmp         @HandleFinally
>00094019    jmp         0009400B
 0009401B    pop         edi
 0009401C    pop         esi
 0009401D    pop         ebx
 0009401E    mov         esp,ebp
 00094020    pop         ebp
 00094021    ret         0C
*}
end;

end.