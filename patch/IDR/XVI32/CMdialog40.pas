//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMdialog40;

interface

uses
  SysUtils, Classes, StdCtrls;

type
  TProgressBox = class(TForm)
  public
    f2C4:dword;//f2C4
    f2CC:dword;//f2CC
    f2D0:dword;//f2D0
    f2D4:dword;//f2D4
    f2D8:dword;//f2D8
    f2DC:byte;//f2DC
    destructor Destroy; virtual;//0008E064
    //constructor Create(?:?; ?:?; ?:?; ?:?);//0008DC74
  end;
  TFormListBox = class(TForm)
  published
    procedure ButtonDeleteClick;//0008C918
  public
    .....ListBox:TListBox;//f2C4
  end;
  TMessageForm = class(TForm)
  end;
    //function sub_0008CB64(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0008CB64
    //function sub_0008D018(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0008D018
    procedure sub_0008D08C;//0008D08C
    procedure sub_0008D0A8;//0008D0A8
    procedure sub_0008D0C4;//0008D0C4
    procedure sub_0008D0E0;//0008D0E0
    //procedure sub_0008D0FC(?:TCanvas; ?:?);//0008D0FC
    //function sub_0008D150(?:AnsiString; ?:AnsiString; ?:?; ?:?):?;//0008D150
    //function sub_0008D4C8(?:?; ?:TStringList; ?:?; ?:?; ?:?):?;//0008D4C8
    //procedure sub_0008D880(?:AnsiString; ?:AnsiString; ?:?);//0008D880
    destructor Destroy;//0008E064
    //procedure sub_0008E11C(?:?);//0008E11C
    procedure sub_0008E140;//0008E140
    //procedure sub_0008E154(?:TProgressBox; ?:AnsiString; ?:?);//0008E154
    //function sub_0008E1A4(?:TProgressBox; ?:?; ?:?; ?:?):?;//0008E1A4
    //procedure sub_0008E238(?:?);//0008E238

implementation

//0008C918
procedure TFormListBox.ButtonDeleteClick;
begin
{*
 0008C918    push        ebx
 0008C919    push        esi
 0008C91A    mov         ebx,eax
 0008C91C    mov         esi,dword ptr [ebx+2C4];TFormListBox.......ListBox:TListBox
 0008C922    mov         eax,esi
 0008C924    call        TCustomListBox.GetItemIndex
 0008C929    mov         edx,eax
 0008C92B    mov         eax,dword ptr [esi+1EC];TListBox.FItems:TStrings
 0008C931    mov         ecx,dword ptr [eax]
 0008C933    call        dword ptr [ecx+44];TStrings.Delete
 0008C936    or          edx,0FFFFFFFF
 0008C939    mov         eax,dword ptr [ebx+2C4];TFormListBox........ListBox:TListBox
 0008C93F    call        00087CE0
 0008C944    pop         esi
 0008C945    pop         ebx
 0008C946    ret
*}
end;

//0008CB64
{*function sub_0008CB64(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0008CB64    push        ebp
 0008CB65    mov         ebp,esp
 0008CB67    add         esp,0FFFFFF68
 0008CB6D    push        ebx
 0008CB6E    push        esi
 0008CB6F    push        edi
 0008CB70    xor         ebx,ebx
 0008CB72    mov         dword ptr [ebp-98],ebx
 0008CB78    mov         word ptr [ebp-7],cx
 0008CB7C    mov         byte ptr [ebp-5],dl
 0008CB7F    mov         dword ptr [ebp-4],eax
 0008CB82    mov         ebx,dword ptr [ebp+8]
 0008CB85    xor         eax,eax
 0008CB87    push        ebp
 0008CB88    push        8CFE0
 0008CB8D    push        dword ptr fs:[eax]
 0008CB90    mov         dword ptr fs:[eax],esp
 0008CB93    push        0
 0008CB95    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 0008CB9B    mov         ecx,dword ptr [ecx]
 0008CB9D    mov         dl,1
 0008CB9F    mov         eax,[0008C948];TMessageForm
 0008CBA4    call        TCustomForm.CreateNew;TMessageForm.Create
 0008CBA9    mov         esi,eax
 0008CBAB    mov         dl,3
 0008CBAD    mov         eax,esi
 0008CBAF    call        TCustomForm.SetBorderStyle
 0008CBB4    test        ebx,ebx
>0008CBB6    jle         0008CBCB
 0008CBB8    mov         eax,ebx
 0008CBBA    cdq
 0008CBBB    xor         eax,edx
 0008CBBD    sub         eax,edx
 0008CBBF    mov         edx,eax
 0008CBC1    neg         edx
 0008CBC3    mov         eax,dword ptr [esi+58];TMessageForm.FFont:TFont
 0008CBC6    call        TFont.SetHeight
 0008CBCB    mov         eax,esi
 0008CBCD    call        TCustomForm.GetCanvas
 0008CBD2    mov         edx,dword ptr [esi+58];TMessageForm.FFont:TFont
 0008CBD5    call        TCanvas.SetFont
 0008CBDA    mov         eax,esi
 0008CBDC    call        TCustomForm.GetCanvas
 0008CBE1    lea         edx,[ebp-10]
 0008CBE4    call        0008D0FC
 0008CBE9    push        4
 0008CBEB    mov         ebx,dword ptr [ebp-10]
 0008CBEE    push        ebx
 0008CBEF    push        8
 0008CBF1    call        kernel32.MulDiv
 0008CBF6    mov         dword ptr [ebp-14],eax
 0008CBF9    push        8
 0008CBFB    mov         edi,dword ptr [ebp-0C]
 0008CBFE    push        edi
 0008CBFF    push        8
 0008CC01    call        kernel32.MulDiv
 0008CC06    mov         dword ptr [ebp-18],eax
 0008CC09    push        4
 0008CC0B    push        ebx
 0008CC0C    push        0A
 0008CC0E    call        kernel32.MulDiv
 0008CC13    mov         dword ptr [ebp-1C],eax
 0008CC16    push        8
 0008CC18    push        edi
 0008CC19    push        0A
 0008CC1B    call        kernel32.MulDiv
 0008CC20    mov         dword ptr [ebp-20],eax
 0008CC23    push        4
 0008CC25    push        ebx
 0008CC26    push        32
 0008CC28    call        kernel32.MulDiv
 0008CC2D    mov         dword ptr [ebp-24],eax
 0008CC30    push        8
 0008CC32    push        edi
 0008CC33    push        0E
 0008CC35    call        kernel32.MulDiv
 0008CC3A    mov         dword ptr [ebp-28],eax
 0008CC3D    push        4
 0008CC3F    push        ebx
 0008CC40    push        4
 0008CC42    call        kernel32.MulDiv
 0008CC47    mov         dword ptr [ebp-2C],eax
 0008CC4A    push        0
 0008CC4C    mov         eax,[000B5BDC];^Screen:TScreen
 0008CC51    mov         eax,dword ptr [eax]
 0008CC53    call        TScreen.GetWidth
 0008CC58    sar         eax,1
>0008CC5A    jns         0008CC5F
 0008CC5C    adc         eax,0
 0008CC5F    push        eax
 0008CC60    push        0
 0008CC62    push        0
 0008CC64    lea         eax,[ebp-60]
 0008CC67    push        eax
 0008CC68    call        user32.SetRect
 0008CC6D    push        410
 0008CC72    lea         eax,[ebp-60]
 0008CC75    push        eax
 0008CC76    push        0FF
 0008CC78    mov         eax,dword ptr [ebp-4]
 0008CC7B    call        @LStrToPChar
 0008CC80    push        eax
 0008CC81    mov         eax,esi
 0008CC83    call        TCustomForm.GetCanvas
 0008CC88    call        TCanvas.GetHandle
 0008CC8D    push        eax
 0008CC8E    call        user32.DrawTextA
 0008CC93    cmp         byte ptr [ebp+0C],0
>0008CC97    je          0008CCA7
 0008CC99    xor         eax,eax
 0008CC9B    mov         al,byte ptr [ebp-5]
 0008CC9E    mov         edi,dword ptr [eax*4+0B4F34]
>0008CCA5    jmp         0008CCA9
 0008CCA7    xor         edi,edi
 0008CCA9    mov         eax,dword ptr [ebp-58]
 0008CCAC    mov         dword ptr [ebp-30],eax
 0008CCAF    mov         eax,dword ptr [ebp-54]
 0008CCB2    mov         dword ptr [ebp-34],eax
 0008CCB5    test        edi,edi
>0008CCB7    je          0008CCCF
 0008CCB9    mov         eax,dword ptr [ebp-1C]
 0008CCBC    add         eax,20
 0008CCBF    add         dword ptr [ebp-30],eax
 0008CCC2    cmp         dword ptr [ebp-34],20
>0008CCC6    jge         0008CCCF
 0008CCC8    mov         dword ptr [ebp-34],20
 0008CCCF    xor         eax,eax
 0008CCD1    xor         ebx,ebx
 0008CCD3    mov         edx,ebx
 0008CCD5    cmp         dl,0F
>0008CCD8    ja          0008CCE1
 0008CCDA    and         edx,7F
 0008CCDD    bt          dword ptr [ebp-7],edx
>0008CCE1    jae         0008CCE4
 0008CCE3    inc         eax
 0008CCE4    inc         ebx
 0008CCE5    cmp         bl,0B
>0008CCE8    jne         0008CCD3
 0008CCEA    xor         ebx,ebx
 0008CCEC    test        eax,eax
>0008CCEE    je          0008CCFC
 0008CCF0    mov         ebx,dword ptr [ebp-24]
 0008CCF3    imul        ebx,eax
 0008CCF6    dec         eax
 0008CCF7    imul        dword ptr [ebp-2C]
 0008CCFA    add         ebx,eax
 0008CCFC    mov         eax,dword ptr [ebp-30]
 0008CCFF    mov         dword ptr [ebp-94],eax
 0008CD05    mov         dword ptr [ebp-90],ebx
 0008CD0B    lea         eax,[ebp-94]
 0008CD11    mov         edx,1
 0008CD16    call        000752A4
 0008CD1B    mov         edx,eax
 0008CD1D    mov         eax,dword ptr [ebp-14]
 0008CD20    add         eax,eax
 0008CD22    add         edx,eax
 0008CD24    mov         eax,esi
 0008CD26    call        TCustomForm.SetClientWidth
 0008CD2B    mov         edx,dword ptr [ebp-34]
 0008CD2E    add         edx,dword ptr [ebp-28]
 0008CD31    add         edx,dword ptr [ebp-20]
 0008CD34    mov         eax,dword ptr [ebp-18]
 0008CD37    add         eax,eax
 0008CD39    add         edx,eax
 0008CD3B    mov         eax,esi
 0008CD3D    call        TCustomForm.SetClientHeight
 0008CD42    cmp         byte ptr ds:[0B4EF8],0;gvar_000B4EF8
>0008CD49    je          0008CD54
 0008CD4B    mov         eax,esi
 0008CD4D    call        00087A14
>0008CD52    jmp         0008CD5D
 0008CD54    mov         dl,4
 0008CD56    mov         eax,esi
 0008CD58    call        TCustomForm.SetPosition
 0008CD5D    cmp         byte ptr [ebp-5],4
>0008CD61    je          0008CD8A
 0008CD63    lea         edx,[ebp-98]
 0008CD69    xor         eax,eax
 0008CD6B    mov         al,byte ptr [ebp-5]
 0008CD6E    movzx       eax,word ptr [eax*2+0B4EFC]
 0008CD76    call        LoadStr
 0008CD7B    mov         edx,dword ptr [ebp-98]
 0008CD81    mov         eax,esi
 0008CD83    call        TControl.SetText
>0008CD88    jmp         0008CDA9
 0008CD8A    lea         edx,[ebp-98]
 0008CD90    mov         eax,[000B59E8];^Application:TApplication
 0008CD95    mov         eax,dword ptr [eax]
 0008CD97    call        TApplication.GetTitle
 0008CD9C    mov         edx,dword ptr [ebp-98]
 0008CDA2    mov         eax,esi
 0008CDA4    call        TControl.SetText
 0008CDA9    test        edi,edi
>0008CDAB    je          0008CE07
 0008CDAD    mov         ecx,esi
 0008CDAF    mov         dl,1
 0008CDB1    mov         eax,[000609C4];TImage
 0008CDB6    call        TImage.Create;TImage.Create
 0008CDBB    mov         dword ptr [ebp-3C],eax
 0008CDBE    mov         edx,8CFFC;'Image_CM1'
 0008CDC3    mov         eax,dword ptr [ebp-3C]
 0008CDC6    mov         ecx,dword ptr [eax]
 0008CDC8    call        dword ptr [ecx+18];TControl.SetName
 0008CDCB    mov         edx,esi
 0008CDCD    mov         eax,dword ptr [ebp-3C]
 0008CDD0    mov         ecx,dword ptr [eax]
 0008CDD2    call        dword ptr [ecx+64];TControl.SetParent
 0008CDD5    push        edi
 0008CDD6    push        0
 0008CDD8    call        user32.LoadIconA
 0008CDDD    push        eax
 0008CDDE    mov         eax,dword ptr [ebp-3C]
 0008CDE1    mov         eax,dword ptr [eax+118];TImage.Picture:TPicture
 0008CDE7    call        TPicture.GetIcon
 0008CDEC    pop         edx
 0008CDED    call        TIcon.SetHandle
 0008CDF2    push        20
 0008CDF4    push        20
 0008CDF6    mov         ecx,dword ptr [ebp-18]
 0008CDF9    mov         edx,dword ptr [ebp-14]
 0008CDFC    mov         eax,dword ptr [ebp-3C]
 0008CDFF    mov         edi,dword ptr [eax]
 0008CE01    call        dword ptr [edi+80];TControl.SetBounds
 0008CE07    mov         ecx,esi
 0008CE09    mov         dl,1
 0008CE0B    mov         eax,[00034260];TLabel
 0008CE10    call        TCustomLabel.Create;TLabel.Create
 0008CE15    mov         edi,eax
 0008CE17    mov         edx,8D010;'Message'
 0008CE1C    mov         eax,edi
 0008CE1E    mov         ecx,dword ptr [eax]
 0008CE20    call        dword ptr [ecx+18];TControl.SetName
 0008CE23    mov         edx,esi
 0008CE25    mov         eax,edi
 0008CE27    mov         ecx,dword ptr [eax]
 0008CE29    call        dword ptr [ecx+64];TControl.SetParent
 0008CE2C    mov         dl,1
 0008CE2E    mov         eax,edi
 0008CE30    call        TCustomLabel.SetWordWrap
 0008CE35    mov         edx,dword ptr [ebp-4]
 0008CE38    mov         eax,edi
 0008CE3A    call        TControl.SetText
 0008CE3F    lea         edx,[ebp-60]
 0008CE42    mov         eax,edi
 0008CE44    call        TControl.SetBoundsRect
 0008CE49    mov         eax,dword ptr [ebp-58]
 0008CE4C    push        eax
 0008CE4D    mov         edx,dword ptr [ebp-54]
 0008CE50    push        edx
 0008CE51    mov         edx,dword ptr [ebp-30]
 0008CE54    sub         edx,eax
 0008CE56    add         edx,dword ptr [ebp-14]
 0008CE59    mov         ecx,dword ptr [ebp-18]
 0008CE5C    mov         eax,edi
 0008CE5E    mov         edi,dword ptr [eax]
 0008CE60    call        dword ptr [edi+80];TControl.SetBounds
 0008CE66    mov         eax,esi
 0008CE68    call        TControl.GetClientWidth
 0008CE6D    sub         eax,ebx
 0008CE6F    sar         eax,1
>0008CE71    jns         0008CE76
 0008CE73    adc         eax,0
 0008CE76    mov         dword ptr [ebp-38],eax
 0008CE79    xor         ebx,ebx
 0008CE7B    lea         eax,[ebp-8C]
 0008CE81    mov         dword ptr [ebp-44],eax
 0008CE84    mov         eax,0B4F48;^'Yes'
 0008CE89    mov         dword ptr [ebp-48],eax
 0008CE8C    mov         dword ptr [ebp-4C],0B4F08;gvar_000B4F08:array[11] of ?
 0008CE93    mov         eax,0B4F74
 0008CE98    mov         dword ptr [ebp-50],eax
 0008CE9B    mov         eax,ebx
 0008CE9D    cmp         al,0F
>0008CE9F    ja          0008CEA8
 0008CEA1    and         eax,7F
 0008CEA4    bt          dword ptr [ebp-7],eax
>0008CEA8    jae         0008CF38
 0008CEAE    mov         ecx,esi
 0008CEB0    mov         dl,1
 0008CEB2    mov         eax,[00036984];TButton
 0008CEB7    call        TButton.Create;TButton.Create
 0008CEBC    mov         edi,eax
 0008CEBE    mov         eax,dword ptr [ebp-44]
 0008CEC1    mov         dword ptr [eax],edi
 0008CEC3    mov         dword ptr [ebp-40],edi
 0008CEC6    mov         eax,dword ptr [ebp-48]
 0008CEC9    mov         edx,dword ptr [eax]
 0008CECB    mov         eax,dword ptr [ebp-40]
 0008CECE    mov         ecx,dword ptr [eax]
 0008CED0    call        dword ptr [ecx+18];TControl.SetName
 0008CED3    mov         edx,esi
 0008CED5    mov         eax,dword ptr [ebp-40]
 0008CED8    mov         ecx,dword ptr [eax]
 0008CEDA    call        dword ptr [ecx+64];TControl.SetParent
 0008CEDD    mov         eax,dword ptr [ebp-4C]
 0008CEE0    mov         edx,dword ptr [eax]
 0008CEE2    mov         eax,dword ptr [ebp-40]
 0008CEE5    call        TControl.SetText
 0008CEEA    mov         eax,dword ptr [ebp-50]
 0008CEED    mov         eax,dword ptr [eax]
 0008CEEF    mov         edx,dword ptr [ebp-40]
 0008CEF2    mov         dword ptr [edx+1F4],eax;TButton.ModalResult:TModalResult
 0008CEF8    mov         eax,dword ptr [ebp-24]
 0008CEFB    push        eax
 0008CEFC    mov         eax,dword ptr [ebp-28]
 0008CEFF    push        eax
 0008CF00    mov         ecx,dword ptr [ebp-34]
 0008CF03    add         ecx,dword ptr [ebp-18]
 0008CF06    add         ecx,dword ptr [ebp-20]
 0008CF09    mov         edx,dword ptr [ebp-38]
 0008CF0C    mov         eax,dword ptr [ebp-40]
 0008CF0F    mov         edi,dword ptr [eax]
 0008CF11    call        dword ptr [edi+80];TWinControl.SetBounds
 0008CF17    mov         eax,dword ptr [ebp-24]
 0008CF1A    add         eax,dword ptr [ebp-2C]
 0008CF1D    add         dword ptr [ebp-38],eax
 0008CF20    cmp         bl,0A
>0008CF23    jne         0008CF38
 0008CF25    mov         eax,dword ptr [ebp-40]
 0008CF28    mov         dword ptr [eax+108],esi;TButton.?f108:TMessageForm
 0008CF2E    mov         dword ptr [eax+104],8CAA4;TButton.FOnClick:TNotifyEvent
 0008CF38    inc         ebx
 0008CF39    add         dword ptr [ebp-50],4
 0008CF3D    add         dword ptr [ebp-4C],4
 0008CF41    add         dword ptr [ebp-48],4
 0008CF45    add         dword ptr [ebp-44],4
 0008CF49    cmp         bl,0B
>0008CF4C    jne         0008CE9B
 0008CF52    mov         al,byte ptr [ebp+10]
 0008CF55    cmp         al,0F
>0008CF57    ja          0008CF60
 0008CF59    and         eax,7F
 0008CF5C    bt          dword ptr [ebp-7],eax
>0008CF60    jae         0008CF93
 0008CF62    xor         ebx,ebx
 0008CF64    mov         bl,byte ptr [ebp+10]
 0008CF67    mov         eax,dword ptr [ebp+ebx*4-8C]
 0008CF6E    mov         dl,1
 0008CF70    call        TButton.SetDefault
 0008CF75    mov         edx,dword ptr [ebp+ebx*4-8C]
 0008CF7C    mov         eax,esi
 0008CF7E    call        TCustomForm.SetActiveControl
 0008CF83    mov         eax,dword ptr [ebp+ebx*4-8C]
 0008CF8A    mov         byte ptr [eax+1F1],1
>0008CF91    jmp         0008CFC7
 0008CF93    test        byte ptr [ebp-7],2
>0008CF97    je          0008CFAE
 0008CF99    test        byte ptr [ebp-7],8
>0008CF9D    je          0008CFAE
 0008CF9F    mov         eax,dword ptr [ebp-88]
 0008CFA5    mov         byte ptr [eax+1F1],0
>0008CFAC    jmp         0008CFC7
 0008CFAE    test        byte ptr [ebp-7],4
>0008CFB2    je          0008CFC7
 0008CFB4    test        byte ptr [ebp-7],8
>0008CFB8    jne         0008CFC7
 0008CFBA    mov         eax,dword ptr [ebp-84]
 0008CFC0    mov         byte ptr [eax+1F1],1
 0008CFC7    xor         eax,eax
 0008CFC9    pop         edx
 0008CFCA    pop         ecx
 0008CFCB    pop         ecx
 0008CFCC    mov         dword ptr fs:[eax],edx
 0008CFCF    push        8CFE7
 0008CFD4    lea         eax,[ebp-98]
 0008CFDA    call        @LStrClr
 0008CFDF    ret
>0008CFE0    jmp         @HandleFinally
>0008CFE5    jmp         0008CFD4
 0008CFE7    mov         eax,esi
 0008CFE9    pop         edi
 0008CFEA    pop         esi
 0008CFEB    pop         ebx
 0008CFEC    mov         esp,ebp
 0008CFEE    pop         ebp
 0008CFEF    ret         0C
end;*}

//0008D018
{*function sub_0008D018(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0008D018    push        ebp
 0008D019    mov         ebp,esp
 0008D01B    add         esp,0FFFFFFF8
 0008D01E    mov         word ptr [ebp-2],cx
 0008D022    mov         cl,byte ptr [ebp+14]
 0008D025    push        ecx
 0008D026    mov         cl,byte ptr [ebp+10]
 0008D029    push        ecx
 0008D02A    mov         ecx,dword ptr [ebp+0C]
 0008D02D    push        ecx
 0008D02E    mov         cx,word ptr [ebp-2]
 0008D032    call        0008CB64
 0008D037    mov         dword ptr [ebp-8],eax
 0008D03A    xor         eax,eax
 0008D03C    push        ebp
 0008D03D    push        8D079
 0008D042    push        dword ptr fs:[eax]
 0008D045    mov         dword ptr fs:[eax],esp
 0008D048    mov         eax,dword ptr [ebp-8]
 0008D04B    mov         edx,dword ptr [ebp+8]
 0008D04E    mov         dword ptr [eax+144],edx
 0008D054    mov         eax,dword ptr [ebp-8]
 0008D057    mov         edx,dword ptr [eax]
 0008D059    call        dword ptr [edx+0CC]
 0008D05F    mov         word ptr [ebp-4],ax
 0008D063    xor         eax,eax
 0008D065    pop         edx
 0008D066    pop         ecx
 0008D067    pop         ecx
 0008D068    mov         dword ptr fs:[eax],edx
 0008D06B    push        8D080
 0008D070    mov         eax,dword ptr [ebp-8]
 0008D073    call        TObject.Free
 0008D078    ret
>0008D079    jmp         @HandleFinally
>0008D07E    jmp         0008D070
 0008D080    mov         ax,word ptr [ebp-4]
 0008D084    pop         ecx
 0008D085    pop         ecx
 0008D086    pop         ebp
 0008D087    ret         10
end;*}

//0008D08C
procedure sub_0008D08C;
begin
{*
 0008D08C    push        2
 0008D08E    push        1
 0008D090    push        0
 0008D092    push        0
 0008D094    mov         cx,word ptr ds:[8D0A4];0x4 gvar_0008D0A4
 0008D09B    mov         dl,2
 0008D09D    call        0008D018
 0008D0A2    ret
*}
end;

//0008D0A8
procedure sub_0008D0A8;
begin
{*
 0008D0A8    push        2
 0008D0AA    push        1
 0008D0AC    push        0
 0008D0AE    push        0
 0008D0B0    mov         cx,word ptr ds:[8D0C0];0x4 gvar_0008D0C0
 0008D0B7    mov         dl,1
 0008D0B9    call        0008D018
 0008D0BE    ret
*}
end;

//0008D0C4
procedure sub_0008D0C4;
begin
{*
 0008D0C4    push        1
 0008D0C6    push        1
 0008D0C8    push        0
 0008D0CA    push        0
 0008D0CC    mov         cx,word ptr ds:[8D0DC];0x3 gvar_0008D0DC
 0008D0D3    mov         dl,3
 0008D0D5    call        0008D018
 0008D0DA    ret
*}
end;

//0008D0E0
procedure sub_0008D0E0;
begin
{*
 0008D0E0    push        3
 0008D0E2    push        1
 0008D0E4    push        0
 0008D0E6    push        0
 0008D0E8    mov         cx,word ptr ds:[8D0F8];0xB gvar_0008D0F8
 0008D0EF    mov         dl,3
 0008D0F1    call        0008D018
 0008D0F6    ret
*}
end;

//0008D0FC
{*procedure sub_0008D0FC(?:TCanvas; ?:?);
begin
 0008D0FC    push        ebx
 0008D0FD    push        esi
 0008D0FE    add         esp,0FFFFFFCC
 0008D101    mov         ebx,edx
 0008D103    mov         esi,eax
 0008D105    xor         eax,eax
 0008D107    mov         edx,esp
 0008D109    lea         ecx,[eax+41]
 0008D10C    mov         byte ptr [edx],cl
 0008D10E    inc         eax
 0008D10F    inc         edx
 0008D110    cmp         eax,1A
>0008D113    jne         0008D109
 0008D115    xor         eax,eax
 0008D117    lea         edx,[esp+1A]
 0008D11B    lea         ecx,[eax+61]
 0008D11E    mov         byte ptr [edx],cl
 0008D120    inc         eax
 0008D121    inc         edx
 0008D122    cmp         eax,1A
>0008D125    jne         0008D11B
 0008D127    push        ebx
 0008D128    push        34
 0008D12A    lea         eax,[esp+8]
 0008D12E    push        eax
 0008D12F    mov         eax,esi
 0008D131    call        TCanvas.GetHandle
 0008D136    push        eax
 0008D137    call        gdi32.GetTextExtentPointA
 0008D13C    mov         eax,dword ptr [ebx]
 0008D13E    mov         ecx,34
 0008D143    cdq
 0008D144    idiv        eax,ecx
 0008D146    mov         dword ptr [ebx],eax
 0008D148    add         esp,34
 0008D14B    pop         esi
 0008D14C    pop         ebx
 0008D14D    ret
end;*}

//0008D150
{*function sub_0008D150(?:AnsiString; ?:AnsiString; ?:?; ?:?):?;
begin
 0008D150    push        ebp
 0008D151    mov         ebp,esp
 0008D153    add         esp,0FFFFFFD8
 0008D156    push        ebx
 0008D157    push        esi
 0008D158    push        edi
 0008D159    xor         ebx,ebx
 0008D15B    mov         dword ptr [ebp-28],ebx
 0008D15E    mov         dword ptr [ebp-4],ecx
 0008D161    mov         esi,edx
 0008D163    mov         ebx,eax
 0008D165    xor         eax,eax
 0008D167    push        ebp
 0008D168    push        8D4B5
 0008D16D    push        dword ptr fs:[eax]
 0008D170    mov         dword ptr fs:[eax],esp
 0008D173    mov         byte ptr [ebp-5],0
 0008D177    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 0008D17D    mov         ecx,dword ptr [ecx]
 0008D17F    mov         dl,1
 0008D181    mov         eax,[000554E4];TForm
 0008D186    call        TCustomForm.Create;TForm.Create
 0008D18B    mov         dword ptr [ebp-0C],eax
 0008D18E    xor         eax,eax
 0008D190    push        ebp
 0008D191    push        8D498
 0008D196    push        dword ptr fs:[eax]
 0008D199    mov         dword ptr fs:[eax],esp
 0008D19C    mov         eax,dword ptr [ebp-0C]
 0008D19F    call        TCustomForm.GetCanvas
 0008D1A4    mov         edx,dword ptr [ebp-0C]
 0008D1A7    mov         edx,dword ptr [edx+58];TForm.FFont:TFont
 0008D1AA    call        TCanvas.SetFont
 0008D1AF    mov         eax,dword ptr [ebp-0C]
 0008D1B2    call        TCustomForm.GetCanvas
 0008D1B7    lea         edx,[ebp-14]
 0008D1BA    call        0008D0FC
 0008D1BF    mov         dl,3
 0008D1C1    mov         eax,dword ptr [ebp-0C]
 0008D1C4    call        TCustomForm.SetBorderStyle
 0008D1C9    mov         edx,ebx
 0008D1CB    mov         eax,dword ptr [ebp-0C]
 0008D1CE    call        TControl.SetText
 0008D1D3    push        4
 0008D1D5    mov         eax,dword ptr [ebp-14]
 0008D1D8    push        eax
 0008D1D9    push        0BE
 0008D1DE    call        kernel32.MulDiv
 0008D1E3    mov         edx,eax
 0008D1E5    mov         eax,dword ptr [ebp-0C]
 0008D1E8    call        TCustomForm.SetClientWidth
 0008D1ED    push        8
 0008D1EF    mov         edi,dword ptr [ebp-10]
 0008D1F2    push        edi
 0008D1F3    push        3F
 0008D1F5    call        kernel32.MulDiv
 0008D1FA    mov         edx,eax
 0008D1FC    mov         eax,dword ptr [ebp-0C]
 0008D1FF    call        TCustomForm.SetClientHeight
 0008D204    cmp         byte ptr ds:[0B4EF8],0;gvar_000B4EF8
>0008D20B    je          0008D217
 0008D20D    mov         eax,dword ptr [ebp-0C]
 0008D210    call        00087A14
>0008D215    jmp         0008D221
 0008D217    mov         dl,4
 0008D219    mov         eax,dword ptr [ebp-0C]
 0008D21C    call        TCustomForm.SetPosition
 0008D221    mov         ecx,dword ptr [ebp-0C]
 0008D224    mov         dl,1
 0008D226    mov         eax,[00034260];TLabel
 0008D22B    call        TCustomLabel.Create;TLabel.Create
 0008D230    mov         ebx,eax
 0008D232    mov         edx,dword ptr [ebp-0C]
 0008D235    mov         eax,ebx
 0008D237    mov         ecx,dword ptr [eax]
 0008D239    call        dword ptr [ecx+64];TControl.SetParent
 0008D23C    mov         dl,1
 0008D23E    mov         eax,ebx
 0008D240    mov         ecx,dword ptr [eax]
 0008D242    call        dword ptr [ecx+90];TCustomLabel.SetAutoSize
 0008D248    push        4
 0008D24A    mov         eax,dword ptr [ebp-14]
 0008D24D    push        eax
 0008D24E    push        0A
 0008D250    call        kernel32.MulDiv
 0008D255    mov         edx,eax
 0008D257    mov         eax,ebx
 0008D259    call        TControl.SetLeft
 0008D25E    push        8
 0008D260    push        edi
 0008D261    push        8
 0008D263    call        kernel32.MulDiv
 0008D268    mov         edx,eax
 0008D26A    mov         eax,ebx
 0008D26C    call        TControl.SetTop
 0008D271    mov         edx,esi
 0008D273    mov         eax,ebx
 0008D275    call        TControl.SetText
 0008D27A    mov         ecx,dword ptr [ebp-0C]
 0008D27D    mov         dl,1
 0008D27F    mov         eax,[00034A68];TEdit
 0008D284    call        TCustomEdit.Create;TEdit.Create
 0008D289    mov         esi,eax
 0008D28B    mov         edx,dword ptr [ebp-0C]
 0008D28E    mov         eax,esi
 0008D290    mov         ecx,dword ptr [eax]
 0008D292    call        dword ptr [ecx+64];TControl.SetParent
 0008D295    mov         edx,dword ptr [ebx+30];TLabel.Left:Integer
 0008D298    mov         eax,esi
 0008D29A    call        TControl.SetLeft
 0008D29F    push        8
 0008D2A1    push        edi
 0008D2A2    push        13
 0008D2A4    call        kernel32.MulDiv
 0008D2A9    mov         edx,eax
 0008D2AB    mov         eax,esi
 0008D2AD    call        TControl.SetTop
 0008D2B2    push        4
 0008D2B4    mov         eax,dword ptr [ebp-14]
 0008D2B7    push        eax
 0008D2B8    push        0AA
 0008D2BD    call        kernel32.MulDiv
 0008D2C2    mov         edx,eax
 0008D2C4    mov         eax,esi
 0008D2C6    call        TControl.SetWidth
 0008D2CB    mov         edx,0FF
 0008D2D0    mov         eax,esi
 0008D2D2    call        TCustomEdit.SetMaxLength
 0008D2D7    mov         edx,dword ptr [ebp-4]
 0008D2DA    mov         edx,dword ptr [edx]
 0008D2DC    mov         eax,esi
 0008D2DE    call        TControl.SetText
 0008D2E3    mov         eax,esi
 0008D2E5    call        TCustomEdit.SelectAll
 0008D2EA    push        8
 0008D2EC    push        edi
 0008D2ED    push        29
 0008D2EF    call        kernel32.MulDiv
 0008D2F4    mov         dword ptr [ebp-18],eax
 0008D2F7    push        4
 0008D2F9    mov         eax,dword ptr [ebp-14]
 0008D2FC    push        eax
 0008D2FD    push        32
 0008D2FF    call        kernel32.MulDiv
 0008D304    mov         dword ptr [ebp-1C],eax
 0008D307    push        8
 0008D309    push        edi
 0008D30A    push        0E
 0008D30C    call        kernel32.MulDiv
 0008D311    mov         dword ptr [ebp-20],eax
 0008D314    cmp         dword ptr [ebp+8],0
>0008D318    jne         0008D321
 0008D31A    mov         ebx,1E
>0008D31F    jmp         0008D326
 0008D321    mov         ebx,0A
 0008D326    mov         dword ptr [ebp-24],ebx
 0008D329    mov         ecx,dword ptr [ebp-0C]
 0008D32C    mov         dl,1
 0008D32E    mov         eax,[00036984];TButton
 0008D333    call        TButton.Create;TButton.Create
 0008D338    mov         edi,eax
 0008D33A    mov         edx,dword ptr [ebp-0C]
 0008D33D    mov         eax,edi
 0008D33F    mov         ecx,dword ptr [eax]
 0008D341    call        dword ptr [ecx+64];TControl.SetParent
 0008D344    mov         dword ptr [edi+1F4],1;TButton.ModalResult:TModalResult
 0008D34E    mov         dl,1
 0008D350    mov         eax,edi
 0008D352    call        TButton.SetDefault
 0008D357    mov         edx,dword ptr ds:[0B4F10];0x0 gvar_000B4F10
 0008D35D    mov         eax,edi
 0008D35F    call        TControl.SetText
 0008D364    mov         eax,dword ptr [ebp-1C]
 0008D367    push        eax
 0008D368    mov         eax,dword ptr [ebp-20]
 0008D36B    push        eax
 0008D36C    push        4
 0008D36E    mov         eax,dword ptr [ebp-14]
 0008D371    push        eax
 0008D372    push        ebx
 0008D373    call        kernel32.MulDiv
 0008D378    mov         edx,eax
 0008D37A    mov         ecx,dword ptr [ebp-18]
 0008D37D    mov         eax,edi
 0008D37F    mov         edi,dword ptr [eax]
 0008D381    call        dword ptr [edi+80];TWinControl.SetBounds
 0008D387    add         ebx,32
 0008D38A    add         ebx,dword ptr [ebp-24]
 0008D38D    mov         ecx,dword ptr [ebp-0C]
 0008D390    mov         dl,1
 0008D392    mov         eax,[00036984];TButton
 0008D397    call        TButton.Create;TButton.Create
 0008D39C    mov         edi,eax
 0008D39E    mov         edx,dword ptr [ebp-0C]
 0008D3A1    mov         eax,edi
 0008D3A3    mov         ecx,dword ptr [eax]
 0008D3A5    call        dword ptr [ecx+64];TControl.SetParent
 0008D3A8    mov         dword ptr [edi+1F4],2;TButton.ModalResult:TModalResult
 0008D3B2    mov         byte ptr [edi+1F1],1;TButton.Cancel:Boolean
 0008D3B9    mov         edx,dword ptr ds:[0B4F14];0x0 gvar_000B4F14
 0008D3BF    mov         eax,edi
 0008D3C1    call        TControl.SetText
 0008D3C6    mov         eax,dword ptr [ebp-1C]
 0008D3C9    push        eax
 0008D3CA    mov         eax,dword ptr [ebp-20]
 0008D3CD    push        eax
 0008D3CE    push        4
 0008D3D0    mov         eax,dword ptr [ebp-14]
 0008D3D3    push        eax
 0008D3D4    push        ebx
 0008D3D5    call        kernel32.MulDiv
 0008D3DA    mov         edx,eax
 0008D3DC    mov         ecx,dword ptr [ebp-18]
 0008D3DF    mov         eax,edi
 0008D3E1    mov         edi,dword ptr [eax]
 0008D3E3    call        dword ptr [edi+80];TWinControl.SetBounds
 0008D3E9    add         ebx,32
 0008D3EC    add         ebx,dword ptr [ebp-24]
 0008D3EF    cmp         dword ptr [ebp+8],0
>0008D3F3    je          0008D45B
 0008D3F5    mov         ecx,dword ptr [ebp-0C]
 0008D3F8    mov         dl,1
 0008D3FA    mov         eax,[00071500];TBitBtn
 0008D3FF    call        TBitBtn.Create;TBitBtn.Create
 0008D404    mov         edi,eax
 0008D406    mov         edx,dword ptr [ebp-0C]
 0008D409    mov         eax,edi
 0008D40B    mov         ecx,dword ptr [eax]
 0008D40D    call        dword ptr [ecx+64];TControl.SetParent
 0008D410    mov         eax,dword ptr [ebp+8]
 0008D413    mov         dword ptr [edi+144],eax;TBitBtn.HelpContext:THelpContext
 0008D419    mov         dl,3
 0008D41B    mov         eax,edi
 0008D41D    call        TBitBtn.SetKind
 0008D422    xor         edx,edx
 0008D424    mov         eax,edi
 0008D426    call        TBitBtn.SetGlyph
 0008D42B    mov         edx,dword ptr ds:[0B4F30];0x0 gvar_000B4F30
 0008D431    mov         eax,edi
 0008D433    call        TControl.SetText
 0008D438    mov         eax,dword ptr [ebp-1C]
 0008D43B    push        eax
 0008D43C    mov         eax,dword ptr [ebp-20]
 0008D43F    push        eax
 0008D440    push        4
 0008D442    mov         eax,dword ptr [ebp-14]
 0008D445    push        eax
 0008D446    push        ebx
 0008D447    call        kernel32.MulDiv
 0008D44C    mov         edx,eax
 0008D44E    mov         ecx,dword ptr [ebp-18]
 0008D451    mov         eax,edi
 0008D453    mov         ebx,dword ptr [eax]
 0008D455    call        dword ptr [ebx+80];TWinControl.SetBounds
 0008D45B    mov         eax,dword ptr [ebp-0C]
 0008D45E    mov         edx,dword ptr [eax]
 0008D460    call        dword ptr [edx+0CC];TCustomForm.ShowModal
 0008D466    dec         eax
>0008D467    jne         0008D482
 0008D469    lea         edx,[ebp-28]
 0008D46C    mov         eax,esi
 0008D46E    call        TControl.GetText
 0008D473    mov         edx,dword ptr [ebp-28]
 0008D476    mov         eax,dword ptr [ebp-4]
 0008D479    call        @LStrAsg
 0008D47E    mov         byte ptr [ebp-5],1
 0008D482    xor         eax,eax
 0008D484    pop         edx
 0008D485    pop         ecx
 0008D486    pop         ecx
 0008D487    mov         dword ptr fs:[eax],edx
 0008D48A    push        8D49F
 0008D48F    mov         eax,dword ptr [ebp-0C]
 0008D492    call        TObject.Free
 0008D497    ret
>0008D498    jmp         @HandleFinally
>0008D49D    jmp         0008D48F
 0008D49F    xor         eax,eax
 0008D4A1    pop         edx
 0008D4A2    pop         ecx
 0008D4A3    pop         ecx
 0008D4A4    mov         dword ptr fs:[eax],edx
 0008D4A7    push        8D4BC
 0008D4AC    lea         eax,[ebp-28]
 0008D4AF    call        @LStrClr
 0008D4B4    ret
>0008D4B5    jmp         @HandleFinally
>0008D4BA    jmp         0008D4AC
 0008D4BC    mov         al,byte ptr [ebp-5]
 0008D4BF    pop         edi
 0008D4C0    pop         esi
 0008D4C1    pop         ebx
 0008D4C2    mov         esp,ebp
 0008D4C4    pop         ebp
 0008D4C5    ret         4
end;*}

//0008D4C8
{*function sub_0008D4C8(?:?; ?:TStringList; ?:?; ?:?; ?:?):?;
begin
 0008D4C8    push        ebp
 0008D4C9    mov         ebp,esp
 0008D4CB    add         esp,0FFFFFFD4
 0008D4CE    push        ebx
 0008D4CF    push        esi
 0008D4D0    push        edi
 0008D4D1    xor         ebx,ebx
 0008D4D3    mov         dword ptr [ebp-2C],ebx
 0008D4D6    mov         byte ptr [ebp-5],cl
 0008D4D9    mov         dword ptr [ebp-4],edx
 0008D4DC    mov         ebx,eax
 0008D4DE    xor         eax,eax
 0008D4E0    push        ebp
 0008D4E1    push        8D86D
 0008D4E6    push        dword ptr fs:[eax]
 0008D4E9    mov         dword ptr fs:[eax],esp
 0008D4EC    mov         byte ptr [ebp-6],0
 0008D4F0    push        0
 0008D4F2    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 0008D4F8    mov         ecx,dword ptr [ecx]
 0008D4FA    mov         dl,1
 0008D4FC    mov         eax,[0008C788];TFormListBox
 0008D501    call        TCustomForm.CreateNew;TFormListBox.Create
 0008D506    mov         dword ptr [ebp-0C],eax
 0008D509    xor         eax,eax
 0008D50B    push        ebp
 0008D50C    push        8D850
 0008D511    push        dword ptr fs:[eax]
 0008D514    mov         dword ptr fs:[eax],esp
 0008D517    mov         eax,dword ptr [ebp-0C]
 0008D51A    call        TCustomForm.GetCanvas
 0008D51F    mov         edx,dword ptr [ebp-0C]
 0008D522    mov         edx,dword ptr [edx+58];TFormListBox.FFont:TFont
 0008D525    call        TCanvas.SetFont
 0008D52A    mov         eax,dword ptr [ebp-0C]
 0008D52D    call        TCustomForm.GetCanvas
 0008D532    lea         edx,[ebp-14]
 0008D535    call        0008D0FC
 0008D53A    mov         dl,3
 0008D53C    mov         eax,dword ptr [ebp-0C]
 0008D53F    call        TCustomForm.SetBorderStyle
 0008D544    mov         edx,ebx
 0008D546    mov         eax,dword ptr [ebp-0C]
 0008D549    call        TControl.SetText
 0008D54E    push        4
 0008D550    mov         esi,dword ptr [ebp-14]
 0008D553    push        esi
 0008D554    push        0FA
 0008D559    call        kernel32.MulDiv
 0008D55E    mov         edx,eax
 0008D560    mov         eax,dword ptr [ebp-0C]
 0008D563    call        TCustomForm.SetClientWidth
 0008D568    push        8
 0008D56A    mov         edi,dword ptr [ebp-10]
 0008D56D    push        edi
 0008D56E    push        58
 0008D570    call        kernel32.MulDiv
 0008D575    mov         edx,eax
 0008D577    mov         eax,dword ptr [ebp-0C]
 0008D57A    call        TCustomForm.SetClientHeight
 0008D57F    cmp         byte ptr ds:[0B4EF8],0;gvar_000B4EF8
>0008D586    je          0008D592
 0008D588    mov         eax,dword ptr [ebp-0C]
 0008D58B    call        00087A14
>0008D590    jmp         0008D59C
 0008D592    mov         dl,4
 0008D594    mov         eax,dword ptr [ebp-0C]
 0008D597    call        TCustomForm.SetPosition
 0008D59C    mov         ecx,dword ptr [ebp-0C]
 0008D59F    mov         dl,1
 0008D5A1    mov         eax,[000381BC];TListBox
 0008D5A6    call        TCustomListBox.Create;TListBox.Create
 0008D5AB    mov         ebx,eax
 0008D5AD    mov         eax,dword ptr [ebp-0C]
 0008D5B0    mov         dword ptr [eax+2C4],ebx;TFormListBox.........ListBox:TListBox
 0008D5B6    mov         edx,dword ptr [ebp-0C]
 0008D5B9    mov         eax,ebx
 0008D5BB    mov         ecx,dword ptr [eax]
 0008D5BD    call        dword ptr [ecx+64];TControl.SetParent
 0008D5C0    push        4
 0008D5C2    push        esi
 0008D5C3    push        0A
 0008D5C5    call        kernel32.MulDiv
 0008D5CA    mov         edx,eax
 0008D5CC    mov         eax,ebx
 0008D5CE    call        TControl.SetLeft
 0008D5D3    push        8
 0008D5D5    push        edi
 0008D5D6    push        8
 0008D5D8    call        kernel32.MulDiv
 0008D5DD    mov         edx,eax
 0008D5DF    mov         eax,ebx
 0008D5E1    call        TControl.SetTop
 0008D5E6    push        4
 0008D5E8    push        esi
 0008D5E9    push        0E6
 0008D5EE    call        kernel32.MulDiv
 0008D5F3    mov         edx,eax
 0008D5F5    mov         eax,ebx
 0008D5F7    call        TControl.SetWidth
 0008D5FC    push        8
 0008D5FE    push        edi
 0008D5FF    push        35
 0008D601    call        kernel32.MulDiv
 0008D606    mov         edx,eax
 0008D608    mov         eax,ebx
 0008D60A    call        TControl.SetHeight
 0008D60F    mov         eax,dword ptr [ebx+1EC];TListBox.FItems:TStrings
 0008D615    mov         edx,dword ptr [ebp-4]
 0008D618    mov         ecx,dword ptr [eax]
 0008D61A    call        dword ptr [ecx+8];TStrings.Assign
 0008D61D    mov         edx,dword ptr [ebp+0C]
 0008D620    mov         edx,dword ptr [edx]
 0008D622    mov         eax,ebx
 0008D624    call        TCustomListBox.SetItemIndex
 0008D629    mov         eax,dword ptr [ebp-0C]
 0008D62C    mov         eax,dword ptr [eax+2C4];TFormListBox..........ListBox:TListBox
 0008D632    or          edx,0FFFFFFFF
 0008D635    call        00087CE0
 0008D63A    push        8
 0008D63C    push        edi
 0008D63D    push        44
 0008D63F    call        kernel32.MulDiv
 0008D644    mov         dword ptr [ebp-18],eax
 0008D647    push        4
 0008D649    push        esi
 0008D64A    push        32
 0008D64C    call        kernel32.MulDiv
 0008D651    mov         dword ptr [ebp-1C],eax
 0008D654    push        8
 0008D656    push        edi
 0008D657    push        0E
 0008D659    call        kernel32.MulDiv
 0008D65E    mov         dword ptr [ebp-20],eax
 0008D661    mov         ebx,0A
 0008D666    mov         dword ptr [ebp-24],ebx
 0008D669    mov         ecx,dword ptr [ebp-0C]
 0008D66C    mov         dl,1
 0008D66E    mov         eax,[00036984];TButton
 0008D673    call        TButton.Create;TButton.Create
 0008D678    mov         edi,eax
 0008D67A    mov         edx,dword ptr [ebp-0C]
 0008D67D    mov         eax,edi
 0008D67F    mov         ecx,dword ptr [eax]
 0008D681    call        dword ptr [ecx+64];TControl.SetParent
 0008D684    mov         dword ptr [edi+1F4],1;TButton.ModalResult:TModalResult
 0008D68E    mov         dl,1
 0008D690    mov         eax,edi
 0008D692    call        TButton.SetDefault
 0008D697    mov         edx,dword ptr ds:[0B4F10];0x0 gvar_000B4F10
 0008D69D    mov         eax,edi
 0008D69F    call        TControl.SetText
 0008D6A4    mov         eax,dword ptr [ebp-1C]
 0008D6A7    push        eax
 0008D6A8    mov         eax,dword ptr [ebp-20]
 0008D6AB    push        eax
 0008D6AC    push        4
 0008D6AE    push        esi
 0008D6AF    push        ebx
 0008D6B0    call        kernel32.MulDiv
 0008D6B5    mov         edx,eax
 0008D6B7    mov         ecx,dword ptr [ebp-18]
 0008D6BA    mov         eax,edi
 0008D6BC    mov         edi,dword ptr [eax]
 0008D6BE    call        dword ptr [edi+80];TWinControl.SetBounds
 0008D6C4    add         ebx,32
 0008D6C7    add         ebx,dword ptr [ebp-24]
 0008D6CA    cmp         byte ptr [ebp-5],0
>0008D6CE    je          0008D74D
 0008D6D0    mov         ecx,dword ptr [ebp-0C]
 0008D6D3    mov         dl,1
 0008D6D5    mov         eax,[00036984];TButton
 0008D6DA    call        TButton.Create;TButton.Create
 0008D6DF    mov         dword ptr [ebp-28],eax
 0008D6E2    mov         edx,dword ptr [ebp-0C]
 0008D6E5    mov         eax,dword ptr [ebp-28]
 0008D6E8    mov         ecx,dword ptr [eax]
 0008D6EA    call        dword ptr [ecx+64];TControl.SetParent
 0008D6ED    mov         eax,dword ptr [ebp-28]
 0008D6F0    xor         edx,edx
 0008D6F2    mov         dword ptr [eax+1F4],edx;TButton.ModalResult:TModalResult
 0008D6F8    lea         edx,[ebp-2C]
 0008D6FB    mov         eax,13D
 0008D700    call        LoadStr;'Delete'
 0008D705    mov         edx,dword ptr [ebp-2C]
 0008D708    mov         eax,dword ptr [ebp-28]
 0008D70B    call        TControl.SetText
 0008D710    mov         eax,dword ptr [ebp-1C]
 0008D713    push        eax
 0008D714    mov         eax,dword ptr [ebp-20]
 0008D717    push        eax
 0008D718    push        4
 0008D71A    push        esi
 0008D71B    push        ebx
 0008D71C    call        kernel32.MulDiv
 0008D721    mov         edx,eax
 0008D723    mov         ecx,dword ptr [ebp-18]
 0008D726    mov         eax,dword ptr [ebp-28]
 0008D729    mov         edi,dword ptr [eax]
 0008D72B    call        dword ptr [edi+80];TWinControl.SetBounds
 0008D731    mov         eax,dword ptr [ebp-28]
 0008D734    mov         edx,dword ptr [ebp-0C]
 0008D737    mov         dword ptr [eax+108],edx;TButton.?f108:TMessageForm
 0008D73D    mov         dword ptr [eax+104],8C918;TButton.FOnClick:TNotifyEvent TFormListBox.ButtonDeleteClick
 0008D747    add         ebx,32
 0008D74A    add         ebx,dword ptr [ebp-24]
 0008D74D    mov         ecx,dword ptr [ebp-0C]
 0008D750    mov         dl,1
 0008D752    mov         eax,[00036984];TButton
 0008D757    call        TButton.Create;TButton.Create
 0008D75C    mov         edi,eax
 0008D75E    mov         edx,dword ptr [ebp-0C]
 0008D761    mov         eax,edi
 0008D763    mov         ecx,dword ptr [eax]
 0008D765    call        dword ptr [ecx+64];TControl.SetParent
 0008D768    mov         dword ptr [edi+1F4],2;TButton.ModalResult:TModalResult
 0008D772    mov         byte ptr [edi+1F1],1;TButton.Cancel:Boolean
 0008D779    mov         edx,dword ptr ds:[0B4F14];0x0 gvar_000B4F14
 0008D77F    mov         eax,edi
 0008D781    call        TControl.SetText
 0008D786    mov         eax,dword ptr [ebp-1C]
 0008D789    push        eax
 0008D78A    mov         eax,dword ptr [ebp-20]
 0008D78D    push        eax
 0008D78E    push        4
 0008D790    push        esi
 0008D791    push        ebx
 0008D792    call        kernel32.MulDiv
 0008D797    mov         edx,eax
 0008D799    mov         ecx,dword ptr [ebp-18]
 0008D79C    mov         eax,edi
 0008D79E    mov         edi,dword ptr [eax]
 0008D7A0    call        dword ptr [edi+80];TWinControl.SetBounds
 0008D7A6    add         ebx,32
 0008D7A9    add         ebx,dword ptr [ebp-24]
 0008D7AC    cmp         dword ptr [ebp+8],0
>0008D7B0    je          0008D815
 0008D7B2    mov         ecx,dword ptr [ebp-0C]
 0008D7B5    mov         dl,1
 0008D7B7    mov         eax,[00071500];TBitBtn
 0008D7BC    call        TBitBtn.Create;TBitBtn.Create
 0008D7C1    mov         edi,eax
 0008D7C3    mov         edx,dword ptr [ebp-0C]
 0008D7C6    mov         eax,edi
 0008D7C8    mov         ecx,dword ptr [eax]
 0008D7CA    call        dword ptr [ecx+64];TControl.SetParent
 0008D7CD    mov         eax,dword ptr [ebp+8]
 0008D7D0    mov         dword ptr [edi+144],eax;TBitBtn.HelpContext:THelpContext
 0008D7D6    mov         dl,3
 0008D7D8    mov         eax,edi
 0008D7DA    call        TBitBtn.SetKind
 0008D7DF    xor         edx,edx
 0008D7E1    mov         eax,edi
 0008D7E3    call        TBitBtn.SetGlyph
 0008D7E8    mov         edx,dword ptr ds:[0B4F30];0x0 gvar_000B4F30
 0008D7EE    mov         eax,edi
 0008D7F0    call        TControl.SetText
 0008D7F5    mov         eax,dword ptr [ebp-1C]
 0008D7F8    push        eax
 0008D7F9    mov         eax,dword ptr [ebp-20]
 0008D7FC    push        eax
 0008D7FD    push        4
 0008D7FF    push        esi
 0008D800    push        ebx
 0008D801    call        kernel32.MulDiv
 0008D806    mov         edx,eax
 0008D808    mov         ecx,dword ptr [ebp-18]
 0008D80B    mov         eax,edi
 0008D80D    mov         ebx,dword ptr [eax]
 0008D80F    call        dword ptr [ebx+80];TWinControl.SetBounds
 0008D815    mov         eax,dword ptr [ebp-0C]
 0008D818    mov         edx,dword ptr [eax]
 0008D81A    call        dword ptr [edx+0CC];TCustomForm.ShowModal
 0008D820    dec         eax
>0008D821    jne         0008D83A
 0008D823    mov         eax,dword ptr [ebp-0C]
 0008D826    mov         eax,dword ptr [eax+2C4];TFormListBox...........ListBox:TListBox
 0008D82C    call        TCustomListBox.GetItemIndex
 0008D831    mov         edx,dword ptr [ebp+0C]
 0008D834    mov         dword ptr [edx],eax
 0008D836    mov         byte ptr [ebp-6],1
 0008D83A    xor         eax,eax
 0008D83C    pop         edx
 0008D83D    pop         ecx
 0008D83E    pop         ecx
 0008D83F    mov         dword ptr fs:[eax],edx
 0008D842    push        8D857
 0008D847    mov         eax,dword ptr [ebp-0C]
 0008D84A    call        TObject.Free
 0008D84F    ret
>0008D850    jmp         @HandleFinally
>0008D855    jmp         0008D847
 0008D857    xor         eax,eax
 0008D859    pop         edx
 0008D85A    pop         ecx
 0008D85B    pop         ecx
 0008D85C    mov         dword ptr fs:[eax],edx
 0008D85F    push        8D874
 0008D864    lea         eax,[ebp-2C]
 0008D867    call        @LStrClr
 0008D86C    ret
>0008D86D    jmp         @HandleFinally
>0008D872    jmp         0008D864
 0008D874    mov         al,byte ptr [ebp-6]
 0008D877    pop         edi
 0008D878    pop         esi
 0008D879    pop         ebx
 0008D87A    mov         esp,ebp
 0008D87C    pop         ebp
 0008D87D    ret         8
end;*}

//0008D880
{*procedure sub_0008D880(?:AnsiString; ?:AnsiString; ?:?);
begin
 0008D880    push        ebp
 0008D881    mov         ebp,esp
 0008D883    add         esp,0FFFFFFD0
 0008D886    push        ebx
 0008D887    push        esi
 0008D888    xor         ebx,ebx
 0008D88A    mov         dword ptr [ebp-30],ebx
 0008D88D    mov         dword ptr [ebp-2C],ebx
 0008D890    mov         dword ptr [ebp-8],ecx
 0008D893    mov         dword ptr [ebp-4],edx
 0008D896    mov         ebx,eax
 0008D898    mov         eax,dword ptr [ebp-4]
 0008D89B    call        @LStrAddRef
 0008D8A0    xor         eax,eax
 0008D8A2    push        ebp
 0008D8A3    push        8DC5F
 0008D8A8    push        dword ptr fs:[eax]
 0008D8AB    mov         dword ptr fs:[eax],esp
 0008D8AE    lea         edx,[ebp-2C]
 0008D8B1    mov         eax,dword ptr [ebp-4]
 0008D8B4    call        AdjustLineBreaks
 0008D8B9    mov         edx,dword ptr [ebp-2C]
 0008D8BC    lea         eax,[ebp-4]
 0008D8BF    call        @LStrLAsg
 0008D8C4    push        0
 0008D8C6    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 0008D8CC    mov         ecx,dword ptr [ecx]
 0008D8CE    mov         dl,1
 0008D8D0    mov         eax,[000554E4];TForm
 0008D8D5    call        TCustomForm.CreateNew;TForm.Create
 0008D8DA    mov         dword ptr [ebp-0C],eax
 0008D8DD    xor         eax,eax
 0008D8DF    push        ebp
 0008D8E0    push        8DC32
 0008D8E5    push        dword ptr fs:[eax]
 0008D8E8    mov         dword ptr fs:[eax],esp
 0008D8EB    mov         eax,dword ptr [ebp-0C]
 0008D8EE    call        TCustomForm.GetCanvas
 0008D8F3    mov         edx,dword ptr [ebp-0C]
 0008D8F6    mov         edx,dword ptr [edx+58];TForm.FFont:TFont
 0008D8F9    call        TCanvas.SetFont
 0008D8FE    mov         eax,dword ptr [ebp-0C]
 0008D901    call        TCustomForm.GetCanvas
 0008D906    lea         edx,[ebp-14]
 0008D909    call        0008D0FC
 0008D90E    mov         dl,3
 0008D910    mov         eax,dword ptr [ebp-0C]
 0008D913    call        TCustomForm.SetBorderStyle
 0008D918    mov         edx,ebx
 0008D91A    mov         eax,dword ptr [ebp-0C]
 0008D91D    call        TControl.SetText
 0008D922    push        4
 0008D924    mov         eax,dword ptr [ebp-14]
 0008D927    push        eax
 0008D928    push        0FA
 0008D92D    call        kernel32.MulDiv
 0008D932    mov         edx,eax
 0008D934    mov         eax,dword ptr [ebp-0C]
 0008D937    call        TCustomForm.SetClientWidth
 0008D93C    push        8
 0008D93E    mov         esi,dword ptr [ebp-10]
 0008D941    push        esi
 0008D942    push        58
 0008D944    call        kernel32.MulDiv
 0008D949    mov         edx,eax
 0008D94B    mov         eax,dword ptr [ebp-0C]
 0008D94E    call        TCustomForm.SetClientHeight
 0008D953    cmp         byte ptr ds:[0B4EF8],0;gvar_000B4EF8
>0008D95A    je          0008D966
 0008D95C    mov         eax,dword ptr [ebp-0C]
 0008D95F    call        00087A14
>0008D964    jmp         0008D970
 0008D966    mov         dl,4
 0008D968    mov         eax,dword ptr [ebp-0C]
 0008D96B    call        TCustomForm.SetPosition
 0008D970    mov         ecx,dword ptr [ebp-0C]
 0008D973    mov         dl,1
 0008D975    mov         eax,[00035454];TMemo
 0008D97A    call        TCustomMemo.Create;TMemo.Create
 0008D97F    mov         ebx,eax
 0008D981    mov         edx,dword ptr [ebp-0C]
 0008D984    mov         eax,ebx
 0008D986    mov         ecx,dword ptr [eax]
 0008D988    call        dword ptr [ecx+64];TControl.SetParent
 0008D98B    push        4
 0008D98D    mov         eax,dword ptr [ebp-14]
 0008D990    push        eax
 0008D991    push        0A
 0008D993    call        kernel32.MulDiv
 0008D998    mov         edx,eax
 0008D99A    mov         eax,ebx
 0008D99C    call        TControl.SetLeft
 0008D9A1    push        8
 0008D9A3    push        esi
 0008D9A4    push        8
 0008D9A6    call        kernel32.MulDiv
 0008D9AB    mov         edx,eax
 0008D9AD    mov         eax,ebx
 0008D9AF    call        TControl.SetTop
 0008D9B4    push        4
 0008D9B6    mov         eax,dword ptr [ebp-14]
 0008D9B9    push        eax
 0008D9BA    push        0E6
 0008D9BF    call        kernel32.MulDiv
 0008D9C4    mov         edx,eax
 0008D9C6    mov         eax,ebx
 0008D9C8    call        TControl.SetWidth
 0008D9CD    push        8
 0008D9CF    push        esi
 0008D9D0    push        35
 0008D9D2    call        kernel32.MulDiv
 0008D9D7    mov         edx,eax
 0008D9D9    mov         eax,ebx
 0008D9DB    call        TControl.SetHeight
 0008D9E0    mov         dl,3
 0008D9E2    mov         eax,ebx
 0008D9E4    call        TCustomMemo.SetScrollBars
 0008D9E9    mov         byte ptr [ebx+20B],0;TMemo.FWantReturns:Boolean
 0008D9F0    mov         edx,dword ptr [ebp-4]
 0008D9F3    mov         eax,ebx
 0008D9F5    call        TControl.SetText
 0008D9FA    mov         dl,1
 0008D9FC    mov         eax,ebx
 0008D9FE    call        TCustomEdit.SetReadOnly
 0008DA03    xor         edx,edx
 0008DA05    mov         eax,ebx
 0008DA07    call        TCustomMemo.SetWordWrap
 0008DA0C    mov         edx,8000000F
 0008DA11    mov         eax,ebx
 0008DA13    call        TControl.SetColor
 0008DA18    push        8
 0008DA1A    push        esi
 0008DA1B    push        44
 0008DA1D    call        kernel32.MulDiv
 0008DA22    mov         dword ptr [ebp-18],eax
 0008DA25    push        4
 0008DA27    mov         eax,dword ptr [ebp-14]
 0008DA2A    push        eax
 0008DA2B    push        32
 0008DA2D    call        kernel32.MulDiv
 0008DA32    mov         dword ptr [ebp-1C],eax
 0008DA35    push        8
 0008DA37    push        esi
 0008DA38    push        0E
 0008DA3A    call        kernel32.MulDiv
 0008DA3F    mov         dword ptr [ebp-20],eax
 0008DA42    mov         dword ptr [ebp-24],0A
 0008DA49    mov         eax,dword ptr [ebp-24]
 0008DA4C    mov         dword ptr [ebp-28],eax
 0008DA4F    mov         ecx,dword ptr [ebp-0C]
 0008DA52    mov         dl,1
 0008DA54    mov         eax,[00036984];TButton
 0008DA59    call        TButton.Create;TButton.Create
 0008DA5E    mov         esi,eax
 0008DA60    mov         edx,dword ptr [ebp-0C]
 0008DA63    mov         eax,esi
 0008DA65    mov         ecx,dword ptr [eax]
 0008DA67    call        dword ptr [ecx+64];TControl.SetParent
 0008DA6A    mov         dword ptr [esi+1F4],1;TButton.ModalResult:TModalResult
 0008DA74    mov         dl,1
 0008DA76    mov         eax,esi
 0008DA78    call        TButton.SetDefault
 0008DA7D    mov         byte ptr [esi+1F1],1;TButton.Cancel:Boolean
 0008DA84    mov         edx,dword ptr ds:[0B4F10];0x0 gvar_000B4F10
 0008DA8A    mov         eax,esi
 0008DA8C    call        TControl.SetText
 0008DA91    mov         eax,dword ptr [ebp-1C]
 0008DA94    push        eax
 0008DA95    mov         eax,dword ptr [ebp-20]
 0008DA98    push        eax
 0008DA99    push        4
 0008DA9B    mov         eax,dword ptr [ebp-14]
 0008DA9E    push        eax
 0008DA9F    mov         eax,dword ptr [ebp-24]
 0008DAA2    push        eax
 0008DAA3    call        kernel32.MulDiv
 0008DAA8    mov         edx,eax
 0008DAAA    mov         ecx,dword ptr [ebp-18]
 0008DAAD    mov         eax,esi
 0008DAAF    mov         esi,dword ptr [eax]
 0008DAB1    call        dword ptr [esi+80];TWinControl.SetBounds
 0008DAB7    mov         eax,dword ptr [ebp-24]
 0008DABA    add         eax,32
 0008DABD    add         eax,dword ptr [ebp-28]
 0008DAC0    mov         dword ptr [ebp-24],eax
 0008DAC3    mov         ecx,dword ptr [ebp-0C]
 0008DAC6    mov         dl,1
 0008DAC8    mov         eax,[00071500];TBitBtn
 0008DACD    call        TBitBtn.Create;TBitBtn.Create
 0008DAD2    mov         esi,eax
 0008DAD4    mov         edx,dword ptr [ebp-0C]
 0008DAD7    mov         eax,esi
 0008DAD9    mov         ecx,dword ptr [eax]
 0008DADB    call        dword ptr [ecx+64];TControl.SetParent
 0008DADE    mov         dword ptr [esi+1F4],5;TBitBtn.ModalResult:TModalResult
 0008DAE8    xor         edx,edx
 0008DAEA    mov         eax,esi
 0008DAEC    call        TButton.SetDefault
 0008DAF1    mov         byte ptr [esi+1F1],0;TBitBtn.Cancel:Boolean
 0008DAF8    xor         edx,edx
 0008DAFA    mov         eax,esi
 0008DAFC    call        TControl.SetText
 0008DB01    mov         dl,1
 0008DB03    mov         eax,esi
 0008DB05    call        TControl.SetShowHint
 0008DB0A    lea         edx,[ebp-2C]
 0008DB0D    mov         eax,144
 0008DB12    call        LoadStr;'OK, copy memo contents to clipboard'
 0008DB17    mov         edx,dword ptr [ebp-2C]
 0008DB1A    lea         eax,[esi+74];TBitBtn.Hint:String
 0008DB1D    call        @LStrAsg
 0008DB22    mov         dl,3
 0008DB24    mov         eax,esi
 0008DB26    call        TBitBtn.SetNumGlyphs
 0008DB2B    push        8DC6C;'COPY'
 0008DB30    mov         eax,[000B5950];^HInstance:Longword
 0008DB35    mov         eax,dword ptr [eax]
 0008DB37    push        eax
 0008DB38    call        user32.LoadBitmapA
 0008DB3D    push        eax
 0008DB3E    mov         eax,esi
 0008DB40    call        TSpeedButton.GetGlyph
 0008DB45    pop         edx
 0008DB46    call        TBitmap.SetHandle
 0008DB4B    mov         eax,dword ptr [ebp-1C]
 0008DB4E    push        eax
 0008DB4F    mov         eax,dword ptr [ebp-20]
 0008DB52    push        eax
 0008DB53    push        4
 0008DB55    mov         eax,dword ptr [ebp-14]
 0008DB58    push        eax
 0008DB59    mov         eax,dword ptr [ebp-24]
 0008DB5C    push        eax
 0008DB5D    call        kernel32.MulDiv
 0008DB62    mov         edx,eax
 0008DB64    mov         ecx,dword ptr [ebp-18]
 0008DB67    mov         eax,esi
 0008DB69    mov         esi,dword ptr [eax]
 0008DB6B    call        dword ptr [esi+80];TWinControl.SetBounds
 0008DB71    mov         eax,dword ptr [ebp-24]
 0008DB74    add         eax,32
 0008DB77    add         eax,dword ptr [ebp-28]
 0008DB7A    mov         dword ptr [ebp-24],eax
 0008DB7D    cmp         dword ptr [ebp-8],0
>0008DB81    je          0008DBEC
 0008DB83    mov         ecx,dword ptr [ebp-0C]
 0008DB86    mov         dl,1
 0008DB88    mov         eax,[00071500];TBitBtn
 0008DB8D    call        TBitBtn.Create;TBitBtn.Create
 0008DB92    mov         esi,eax
 0008DB94    mov         edx,dword ptr [ebp-0C]
 0008DB97    mov         eax,esi
 0008DB99    mov         ecx,dword ptr [eax]
 0008DB9B    call        dword ptr [ecx+64];TControl.SetParent
 0008DB9E    mov         eax,dword ptr [ebp-8]
 0008DBA1    mov         dword ptr [esi+144],eax;TBitBtn.HelpContext:THelpContext
 0008DBA7    mov         dl,3
 0008DBA9    mov         eax,esi
 0008DBAB    call        TBitBtn.SetKind
 0008DBB0    xor         edx,edx
 0008DBB2    mov         eax,esi
 0008DBB4    call        TBitBtn.SetGlyph
 0008DBB9    mov         edx,dword ptr ds:[0B4F30];0x0 gvar_000B4F30
 0008DBBF    mov         eax,esi
 0008DBC1    call        TControl.SetText
 0008DBC6    mov         eax,dword ptr [ebp-1C]
 0008DBC9    push        eax
 0008DBCA    mov         eax,dword ptr [ebp-20]
 0008DBCD    push        eax
 0008DBCE    push        4
 0008DBD0    mov         eax,dword ptr [ebp-14]
 0008DBD3    push        eax
 0008DBD4    mov         eax,dword ptr [ebp-24]
 0008DBD7    push        eax
 0008DBD8    call        kernel32.MulDiv
 0008DBDD    mov         edx,eax
 0008DBDF    mov         ecx,dword ptr [ebp-18]
 0008DBE2    mov         eax,esi
 0008DBE4    mov         esi,dword ptr [eax]
 0008DBE6    call        dword ptr [esi+80];TWinControl.SetBounds
 0008DBEC    mov         eax,dword ptr [ebp-0C]
 0008DBEF    mov         edx,dword ptr [eax]
 0008DBF1    call        dword ptr [edx+0CC];TCustomForm.ShowModal
 0008DBF7    mov         eax,dword ptr [ebp-0C]
 0008DBFA    cmp         dword ptr [eax+22C],5;TForm.FModalResult:TModalResult
>0008DC01    jne         0008DC1C
 0008DC03    lea         edx,[ebp-30]
 0008DC06    mov         eax,ebx
 0008DC08    call        TControl.GetText
 0008DC0D    mov         eax,dword ptr [ebp-30]
 0008DC10    push        eax
 0008DC11    call        Clipboard
 0008DC16    pop         edx
 0008DC17    call        TClipboard.SetAsText
 0008DC1C    xor         eax,eax
 0008DC1E    pop         edx
 0008DC1F    pop         ecx
 0008DC20    pop         ecx
 0008DC21    mov         dword ptr fs:[eax],edx
 0008DC24    push        8DC39
 0008DC29    mov         eax,dword ptr [ebp-0C]
 0008DC2C    call        TObject.Free
 0008DC31    ret
>0008DC32    jmp         @HandleFinally
>0008DC37    jmp         0008DC29
 0008DC39    xor         eax,eax
 0008DC3B    pop         edx
 0008DC3C    pop         ecx
 0008DC3D    pop         ecx
 0008DC3E    mov         dword ptr fs:[eax],edx
 0008DC41    push        8DC66
 0008DC46    lea         eax,[ebp-30]
 0008DC49    call        @LStrClr
 0008DC4E    lea         eax,[ebp-2C]
 0008DC51    call        @LStrClr
 0008DC56    lea         eax,[ebp-4]
 0008DC59    call        @LStrClr
 0008DC5E    ret
>0008DC5F    jmp         @HandleFinally
>0008DC64    jmp         0008DC46
 0008DC66    pop         esi
 0008DC67    pop         ebx
 0008DC68    mov         esp,ebp
 0008DC6A    pop         ebp
 0008DC6B    ret
end;*}

//0008DC74
{*constructor TProgressBox.Create(?:?; ?:?; ?:?; ?:?);
begin
 0008DC74    push        ebp
 0008DC75    mov         ebp,esp
 0008DC77    add         esp,0FFFFFFEC
 0008DC7A    push        ebx
 0008DC7B    push        esi
 0008DC7C    push        edi
 0008DC7D    xor         ebx,ebx
 0008DC7F    mov         dword ptr [ebp-14],ebx
 0008DC82    test        dl,dl
>0008DC84    je          0008DC8E
 0008DC86    add         esp,0FFFFFFF0
 0008DC89    call        @ClassCreate
 0008DC8E    mov         esi,ecx
 0008DC90    mov         byte ptr [ebp-1],dl
 0008DC93    mov         ebx,eax
 0008DC95    xor         eax,eax
 0008DC97    push        ebp
 0008DC98    push        8E035
 0008DC9D    push        dword ptr fs:[eax]
 0008DCA0    mov         dword ptr fs:[eax],esp
 0008DCA3    push        0
 0008DCA5    mov         ecx,esi
 0008DCA7    xor         edx,edx
 0008DCA9    mov         eax,ebx
 0008DCAB    call        TCustomForm.CreateNew
 0008DCB0    mov         eax,ebx
 0008DCB2    call        TCustomForm.GetCanvas
 0008DCB7    lea         edx,[ebp-0C]
 0008DCBA    call        0008D0FC
 0008DCBF    mov         dl,3
 0008DCC1    mov         eax,ebx
 0008DCC3    call        TCustomForm.SetBorderStyle
 0008DCC8    mov         dl,3
 0008DCCA    mov         eax,ebx
 0008DCCC    call        TCustomForm.SetFormStyle
 0008DCD1    mov         dl,byte ptr ds:[8E060];0x0 gvar_0008E060
 0008DCD7    mov         eax,ebx
 0008DCD9    call        TCustomForm.SetBorderIcons
 0008DCDE    mov         edx,dword ptr [ebp+14]
 0008DCE1    mov         eax,ebx
 0008DCE3    call        TControl.SetText
 0008DCE8    mov         eax,esi
 0008DCEA    call        TWinControl.GetHandle
 0008DCEF    mov         dword ptr [ebx+2C4],eax
 0008DCF5    mov         dword ptr [ebx+270],ebx
 0008DCFB    mov         dword ptr [ebx+26C],8E258
 0008DD05    mov         dword ptr [ebx+2A8],ebx
 0008DD0B    mov         dword ptr [ebx+2A4],8E10C
 0008DD15    mov         dword ptr [ebx+290],ebx
 0008DD1B    mov         dword ptr [ebx+28C],8E11C;sub_0008E11C
 0008DD25    xor         eax,eax
 0008DD27    mov         dword ptr [ebx+2C8],eax
 0008DD2D    mov         byte ptr [ebx+2DC],0
 0008DD34    push        4
 0008DD36    mov         eax,dword ptr [ebp-0C]
 0008DD39    push        eax
 0008DD3A    push        0A0
 0008DD3F    call        kernel32.MulDiv
 0008DD44    mov         edx,eax
 0008DD46    mov         eax,ebx
 0008DD48    call        TCustomForm.SetClientWidth
 0008DD4D    push        8
 0008DD4F    mov         eax,dword ptr [ebp-8]
 0008DD52    push        eax
 0008DD53    push        7
 0008DD55    call        kernel32.MulDiv
 0008DD5A    mov         dword ptr [ebp-10],eax
 0008DD5D    mov         esi,dword ptr [ebp-10]
 0008DD60    cmp         dword ptr [ebp+10],0
>0008DD64    je          0008DDC2
 0008DD66    mov         ecx,ebx
 0008DD68    mov         dl,1
 0008DD6A    mov         eax,[00034260];TLabel
 0008DD6F    call        TCustomLabel.Create;TLabel.Create
 0008DD74    mov         edi,eax
 0008DD76    mov         dword ptr [ebx+2CC],edi
 0008DD7C    mov         edx,ebx
 0008DD7E    mov         eax,edi
 0008DD80    mov         ecx,dword ptr [eax]
 0008DD82    call        dword ptr [ecx+64];TControl.SetParent
 0008DD85    mov         dl,1
 0008DD87    mov         eax,edi
 0008DD89    mov         ecx,dword ptr [eax]
 0008DD8B    call        dword ptr [ecx+90];TCustomLabel.SetAutoSize
 0008DD91    push        4
 0008DD93    mov         eax,dword ptr [ebp-0C]
 0008DD96    push        eax
 0008DD97    push        0A
 0008DD99    call        kernel32.MulDiv
 0008DD9E    mov         edx,eax
 0008DDA0    mov         eax,edi
 0008DDA2    call        TControl.SetLeft
 0008DDA7    mov         edx,esi
 0008DDA9    mov         eax,edi
 0008DDAB    call        TControl.SetTop
 0008DDB0    add         esi,dword ptr [edi+3C];TLabel.Height:Integer
 0008DDB3    add         esi,dword ptr [ebp-10]
 0008DDB6    mov         edx,dword ptr [ebp+10]
 0008DDB9    mov         eax,edi
 0008DDBB    call        TControl.SetText
>0008DDC0    jmp         0008DDD6
 0008DDC2    xor         eax,eax
 0008DDC4    mov         dword ptr [ebx+2CC],eax
 0008DDCA    mov         eax,dword ptr [ebp-10]
 0008DDCD    sar         eax,1
>0008DDCF    jns         0008DDD4
 0008DDD1    adc         eax,0
 0008DDD4    add         esi,eax
 0008DDD6    cmp         byte ptr [ebp+0C],0
>0008DDDA    je          0008DE82
 0008DDE0    mov         ecx,ebx
 0008DDE2    mov         dl,1
 0008DDE4    mov         eax,[000785A4];TGauge
 0008DDE9    call        TGauge.Create;TGauge.Create
 0008DDEE    mov         edi,eax
 0008DDF0    mov         dword ptr [ebx+2D4],edi
 0008DDF6    mov         edx,ebx
 0008DDF8    mov         eax,edi
 0008DDFA    mov         ecx,dword ptr [eax]
 0008DDFC    call        dword ptr [ecx+64];TControl.SetParent
 0008DDFF    mov         edx,8000000D
 0008DE04    mov         eax,edi
 0008DE06    call        TGauge.SetForeColor
 0008DE0B    push        8
 0008DE0D    mov         eax,dword ptr [ebp-8]
 0008DE10    push        eax
 0008DE11    push        0C
 0008DE13    call        kernel32.MulDiv
 0008DE18    mov         edx,eax
 0008DE1A    mov         eax,edi
 0008DE1C    call        TControl.SetHeight
 0008DE21    push        4
 0008DE23    mov         eax,dword ptr [ebp-0C]
 0008DE26    push        eax
 0008DE27    push        82
 0008DE2C    call        kernel32.MulDiv
 0008DE31    mov         edx,eax
 0008DE33    mov         eax,edi
 0008DE35    call        TControl.SetWidth
 0008DE3A    mov         eax,ebx
 0008DE3C    call        TControl.GetClientWidth
 0008DE41    mov         edx,eax
 0008DE43    sub         edx,dword ptr [edi+38]
 0008DE46    sar         edx,1
>0008DE48    jns         0008DE4D
 0008DE4A    adc         edx,0
 0008DE4D    mov         eax,edi
 0008DE4F    call        TControl.SetLeft
 0008DE54    mov         eax,dword ptr [ebx+2CC]
 0008DE5A    test        eax,eax
>0008DE5C    je          0008DE66
 0008DE5E    mov         edx,dword ptr [edi+30];TGauge.Left:Integer
 0008DE61    call        TControl.SetLeft
 0008DE66    mov         edx,esi
 0008DE68    mov         eax,edi
 0008DE6A    call        TControl.SetTop
 0008DE6F    add         esi,dword ptr [edi+3C];TGauge.Height:Integer
 0008DE72    add         esi,dword ptr [ebp-10]
 0008DE75    xor         eax,eax
 0008DE77    mov         dword ptr [ebx+2D0],eax
>0008DE7D    jmp         0008DF13
 0008DE82    mov         ecx,ebx
 0008DE84    mov         dl,1
 0008DE86    mov         eax,[00067710];TProgressBar
 0008DE8B    call        TProgressBar.Create;TProgressBar.Create
 0008DE90    mov         edi,eax
 0008DE92    mov         dword ptr [ebx+2D0],edi
 0008DE98    mov         edx,ebx
 0008DE9A    mov         eax,edi
 0008DE9C    mov         ecx,dword ptr [eax]
 0008DE9E    call        dword ptr [ecx+64];TControl.SetParent
 0008DEA1    push        8
 0008DEA3    mov         eax,dword ptr [ebp-8]
 0008DEA6    push        eax
 0008DEA7    push        0C
 0008DEA9    call        kernel32.MulDiv
 0008DEAE    mov         edx,eax
 0008DEB0    mov         eax,edi
 0008DEB2    call        TControl.SetHeight
 0008DEB7    push        4
 0008DEB9    mov         eax,dword ptr [ebp-0C]
 0008DEBC    push        eax
 0008DEBD    push        82
 0008DEC2    call        kernel32.MulDiv
 0008DEC7    mov         edx,eax
 0008DEC9    mov         eax,edi
 0008DECB    call        TControl.SetWidth
 0008DED0    mov         eax,ebx
 0008DED2    call        TControl.GetClientWidth
 0008DED7    mov         edx,eax
 0008DED9    sub         edx,dword ptr [edi+38]
 0008DEDC    sar         edx,1
>0008DEDE    jns         0008DEE3
 0008DEE0    adc         edx,0
 0008DEE3    mov         eax,edi
 0008DEE5    call        TControl.SetLeft
 0008DEEA    mov         eax,dword ptr [ebx+2CC]
 0008DEF0    test        eax,eax
>0008DEF2    je          0008DEFC
 0008DEF4    mov         edx,dword ptr [edi+30];TProgressBar.Left:Integer
 0008DEF7    call        TControl.SetLeft
 0008DEFC    mov         edx,esi
 0008DEFE    mov         eax,edi
 0008DF00    call        TControl.SetTop
 0008DF05    add         esi,dword ptr [edi+3C];TProgressBar.Height:Integer
 0008DF08    add         esi,dword ptr [ebp-10]
 0008DF0B    xor         eax,eax
 0008DF0D    mov         dword ptr [ebx+2D4],eax
 0008DF13    cmp         byte ptr [ebp+8],0
>0008DF17    je          0008DFCA
 0008DF1D    mov         ecx,ebx
 0008DF1F    mov         dl,1
 0008DF21    mov         eax,[00036984];TButton
 0008DF26    call        TButton.Create;TButton.Create
 0008DF2B    mov         edi,eax
 0008DF2D    mov         dword ptr [ebx+2D8],edi
 0008DF33    mov         edx,ebx
 0008DF35    mov         eax,edi
 0008DF37    mov         ecx,dword ptr [eax]
 0008DF39    call        dword ptr [ecx+64];TControl.SetParent
 0008DF3C    mov         byte ptr [edi+1F1],1;TButton.Cancel:Boolean
 0008DF43    lea         edx,[ebp-14]
 0008DF46    mov         eax,133
 0008DF4B    call        LoadStr;'Cancel'
 0008DF50    mov         edx,dword ptr [ebp-14]
 0008DF53    mov         eax,edi
 0008DF55    call        TControl.SetText
 0008DF5A    push        8
 0008DF5C    mov         eax,dword ptr [ebp-8]
 0008DF5F    push        eax
 0008DF60    push        0F
 0008DF62    call        kernel32.MulDiv
 0008DF67    mov         edx,eax
 0008DF69    mov         eax,edi
 0008DF6B    call        TControl.SetHeight
 0008DF70    push        4
 0008DF72    mov         eax,dword ptr [ebp-0C]
 0008DF75    push        eax
 0008DF76    push        32
 0008DF78    call        kernel32.MulDiv
 0008DF7D    mov         edx,eax
 0008DF7F    mov         eax,edi
 0008DF81    call        TControl.SetWidth
 0008DF86    mov         eax,ebx
 0008DF88    call        TControl.GetClientWidth
 0008DF8D    mov         edx,eax
 0008DF8F    sub         edx,dword ptr [edi+38]
 0008DF92    sar         edx,1
>0008DF94    jns         0008DF99
 0008DF96    adc         edx,0
 0008DF99    mov         eax,edi
 0008DF9B    call        TControl.SetLeft
 0008DFA0    mov         edx,esi
 0008DFA2    mov         eax,edi
 0008DFA4    call        TControl.SetTop
 0008DFA9    add         esi,dword ptr [edi+3C];TButton.Height:Integer
 0008DFAC    add         esi,dword ptr [ebp-10]
 0008DFAF    mov         dword ptr [edi+108],ebx;TButton.?f108:TMessageForm
 0008DFB5    mov         dword ptr [edi+104],8E138;TButton.FOnClick:TNotifyEvent
 0008DFBF    mov         dl,1
 0008DFC1    mov         eax,edi
 0008DFC3    call        TControl.SetVisible
>0008DFC8    jmp         0008DFDE
 0008DFCA    xor         eax,eax
 0008DFCC    mov         dword ptr [ebx+2D8],eax
 0008DFD2    mov         eax,dword ptr [ebp-10]
 0008DFD5    sar         eax,1
>0008DFD7    jns         0008DFDC
 0008DFD9    adc         eax,0
 0008DFDC    add         esi,eax
 0008DFDE    mov         edx,esi
 0008DFE0    mov         eax,ebx
 0008DFE2    call        TCustomForm.SetClientHeight
 0008DFE7    mov         eax,[000B5BDC];^Screen:TScreen
 0008DFEC    mov         eax,dword ptr [eax]
 0008DFEE    mov         edx,dword ptr [eax+34];TScreen.FPixelsPerInch:Integer
 0008DFF1    mov         ecx,60
 0008DFF6    mov         eax,ebx
 0008DFF8    call        TWinControl.ScaleBy
 0008DFFD    cmp         byte ptr ds:[0B4EF8],0;gvar_000B4EF8
>0008E004    je          0008E00F
 0008E006    mov         eax,ebx
 0008E008    call        00087A14
>0008E00D    jmp         0008E018
 0008E00F    mov         dl,4
 0008E011    mov         eax,ebx
 0008E013    call        TCustomForm.SetPosition
 0008E018    mov         eax,ebx
 0008E01A    mov         edx,dword ptr [eax]
 0008E01C    call        dword ptr [edx+7C]
 0008E01F    xor         eax,eax
 0008E021    pop         edx
 0008E022    pop         ecx
 0008E023    pop         ecx
 0008E024    mov         dword ptr fs:[eax],edx
 0008E027    push        8E03C
 0008E02C    lea         eax,[ebp-14]
 0008E02F    call        @LStrClr
 0008E034    ret
>0008E035    jmp         @HandleFinally
>0008E03A    jmp         0008E02C
 0008E03C    mov         eax,ebx
 0008E03E    cmp         byte ptr [ebp-1],0
>0008E042    je          0008E053
 0008E044    call        @AfterConstruction
 0008E049    pop         dword ptr fs:[0]
 0008E050    add         esp,0C
 0008E053    mov         eax,ebx
 0008E055    pop         edi
 0008E056    pop         esi
 0008E057    pop         ebx
 0008E058    mov         esp,ebp
 0008E05A    pop         ebp
 0008E05B    ret         10
end;*}

//0008E064
destructor TProgressBox.Destroy;
begin
{*
 0008E064    push        ebx
 0008E065    push        esi
 0008E066    call        @BeforeDestruction
 0008E06B    mov         ebx,edx
 0008E06D    mov         esi,eax
 0008E06F    mov         eax,dword ptr [esi+2CC];TProgressBox.?f2CC:dword
 0008E075    test        eax,eax
>0008E077    je          0008E07E
 0008E079    call        TObject.Free
 0008E07E    mov         eax,dword ptr [esi+2D4];TProgressBox.?f2D4:dword
 0008E084    test        eax,eax
>0008E086    je          0008E08D
 0008E088    call        TObject.Free
 0008E08D    mov         eax,dword ptr [esi+2D0];TProgressBox.?f2D0:dword
 0008E093    test        eax,eax
>0008E095    je          0008E09C
 0008E097    call        TObject.Free
 0008E09C    cmp         dword ptr [esi+2D8],0;TProgressBox.?f2D8:dword
>0008E0A3    je          0008E0BE
 0008E0A5    xor         eax,eax
 0008E0A7    mov         dword ptr [esi+104],eax;TProgressBox.FOnClick:TNotifyEvent
 0008E0AD    mov         dword ptr [esi+108],eax;TProgressBox.?f108:TMessageForm
 0008E0B3    mov         eax,dword ptr [esi+2D8];TProgressBox.?f2D8:dword
 0008E0B9    call        TObject.Free
 0008E0BE    xor         edx,edx
 0008E0C0    mov         eax,esi
 0008E0C2    call        TCustomForm.SetFormStyle
 0008E0C7    push        0FF
 0008E0C9    mov         eax,dword ptr [esi+2C4];TProgressBox.?f2C4:dword
 0008E0CF    push        eax
 0008E0D0    call        user32.EnableWindow
 0008E0D5    xor         eax,eax
 0008E0D7    mov         dword ptr [esi+2A4],eax;TProgressBox.FOnShow:TNotifyEvent
 0008E0DD    mov         dword ptr [esi+2A8],eax;TProgressBox.?f2A8:dword
 0008E0E3    xor         eax,eax
 0008E0E5    mov         dword ptr [esi+26C],eax;TProgressBox.FOnClose:TCloseEvent
 0008E0EB    mov         dword ptr [esi+270],eax;TProgressBox.?f270:dword
 0008E0F1    mov         edx,ebx
 0008E0F3    and         dl,0FC
 0008E0F6    mov         eax,esi
 0008E0F8    call        TCustomForm.Destroy
 0008E0FD    test        bl,bl
>0008E0FF    jle         0008E108
 0008E101    mov         eax,esi
 0008E103    call        @ClassDestroy
 0008E108    pop         esi
 0008E109    pop         ebx
 0008E10A    ret
*}
end;

//0008E11C
{*procedure sub_0008E11C(?:?);
begin
 0008E11C    push        ebx
 0008E11D    mov         ebx,eax
 0008E11F    xor         edx,edx
 0008E121    mov         eax,ebx
 0008E123    call        TCustomForm.SetFormStyle
 0008E128    push        0FF
 0008E12A    mov         eax,dword ptr [ebx+2C4]
 0008E130    push        eax
 0008E131    call        user32.EnableWindow
 0008E136    pop         ebx
 0008E137    ret
end;*}

//0008E140
procedure sub_0008E140;
begin
{*
 0008E140    call        TControl.SetText
 0008E145    mov         eax,[000B59E8];^Application:TApplication
 0008E14A    mov         eax,dword ptr [eax]
 0008E14C    call        TApplication.ProcessMessages
 0008E151    ret
*}
end;

//0008E154
{*procedure sub_0008E154(?:TProgressBox; ?:AnsiString; ?:?);
begin
 0008E154    push        ebx
 0008E155    push        esi
 0008E156    mov         esi,edx
 0008E158    mov         ebx,eax
 0008E15A    test        ecx,ecx
>0008E15C    jg          0008E163
 0008E15E    mov         ecx,1
 0008E163    cmp         dword ptr [ebx+2CC],0
>0008E16A    je          0008E1A0
 0008E16C    inc         dword ptr [ebx+2C8]
 0008E172    mov         eax,dword ptr [ebx+2C8]
 0008E178    cdq
 0008E179    idiv        eax,ecx
 0008E17B    test        edx,edx
>0008E17D    jne         0008E1A0
 0008E17F    mov         edx,esi
 0008E181    mov         eax,dword ptr [ebx+2CC]
 0008E187    call        TControl.SetText
 0008E18C    mov         eax,[000B59E8];^Application:TApplication
 0008E191    mov         eax,dword ptr [eax]
 0008E193    call        TApplication.ProcessMessages
 0008E198    xor         eax,eax
 0008E19A    mov         dword ptr [ebx+2C8],eax
 0008E1A0    pop         esi
 0008E1A1    pop         ebx
 0008E1A2    ret
end;*}

//0008E1A4
{*function sub_0008E1A4(?:TProgressBox; ?:?; ?:?; ?:?):?;
begin
 0008E1A4    push        ebp
 0008E1A5    mov         ebp,esp
 0008E1A7    add         esp,0FFFFFFEC
 0008E1AA    push        ebx
 0008E1AB    push        esi
 0008E1AC    mov         esi,dword ptr [ebp+8]
 0008E1AF    mov         byte ptr [ebp-1],0
 0008E1B3    mov         ebx,dword ptr [eax+2D4]
 0008E1B9    test        ebx,ebx
>0008E1BB    je          0008E22A
 0008E1BD    test        esi,esi
>0008E1BF    jne         0008E1C6
 0008E1C1    mov         esi,1
 0008E1C6    test        ecx,ecx
>0008E1C8    jne         0008E1D8
 0008E1CA    xor         edx,edx
 0008E1CC    mov         dword ptr [ebp-0C],edx
 0008E1CF    mov         dword ptr [ebp-8],3FF00000
>0008E1D6    jmp         0008E1EA
 0008E1D8    mov         dword ptr [ebp-10],edx
 0008E1DB    fild        dword ptr [ebp-10]
 0008E1DE    mov         dword ptr [ebp-14],ecx
 0008E1E1    fild        dword ptr [ebp-14]
 0008E1E4    fdivp       st(1),st
 0008E1E6    fstp        qword ptr [ebp-0C]
 0008E1E9    wait
 0008E1EA    fild        dword ptr [ebx+11C]
 0008E1F0    fmul        qword ptr [ebp-0C]
 0008E1F3    call        @ROUND
 0008E1F8    mov         ecx,eax
 0008E1FA    add         ecx,dword ptr [ebx+118]
 0008E200    mov         eax,ecx
 0008E202    cdq
 0008E203    idiv        eax,esi
 0008E205    test        edx,edx
>0008E207    jne         0008E22A
 0008E209    cmp         ecx,dword ptr [ebx+120]
>0008E20F    je          0008E22A
 0008E211    mov         edx,ecx
 0008E213    mov         eax,ebx
 0008E215    call        TGauge.SetProgress
 0008E21A    mov         eax,[000B59E8];^Application:TApplication
 0008E21F    mov         eax,dword ptr [eax]
 0008E221    call        TApplication.ProcessMessages
 0008E226    mov         byte ptr [ebp-1],1
 0008E22A    mov         al,byte ptr [ebp-1]
 0008E22D    pop         esi
 0008E22E    pop         ebx
 0008E22F    mov         esp,ebp
 0008E231    pop         ebp
 0008E232    ret         4
end;*}

//0008E238
{*procedure sub_0008E238(?:?);
begin
 0008E238    mov         ecx,dword ptr [eax+2D8]
 0008E23E    test        ecx,ecx
>0008E240    je          0008E255
 0008E242    mov         eax,ecx
 0008E244    mov         ecx,dword ptr [eax]
 0008E246    call        dword ptr [ecx+60]
 0008E249    mov         eax,[000B59E8];^Application:TApplication
 0008E24E    mov         eax,dword ptr [eax]
 0008E250    call        TApplication.ProcessMessages
 0008E255    ret
end;*}

Initialization
//0008E314
{*
 0008E314    sub         dword ptr ds:[0B6AF0],1
>0008E31B    jae         0008E327
 0008E31D    mov         eax,8E2B8
 0008E322    call        @InitResStringImports
 0008E327    ret
*}
Finalization
//0008E25C
{*
 0008E25C    push        ebp
 0008E25D    mov         ebp,esp
 0008E25F    xor         eax,eax
 0008E261    push        ebp
 0008E262    push        8E2AD
 0008E267    push        dword ptr fs:[eax]
 0008E26A    mov         dword ptr fs:[eax],esp
 0008E26D    inc         dword ptr ds:[0B6AF0]
>0008E273    jne         0008E29F
 0008E275    mov         eax,0B4F48;^'Yes'
 0008E27A    mov         ecx,0B
 0008E27F    mov         edx,dword ptr ds:[110CC];String
 0008E285    call        @FinalizeArray
 0008E28A    mov         eax,0B4F08;gvar_000B4F08:array[11] of ?
 0008E28F    mov         ecx,0B
 0008E294    mov         edx,dword ptr ds:[110CC];String
 0008E29A    call        @FinalizeArray
 0008E29F    xor         eax,eax
 0008E2A1    pop         edx
 0008E2A2    pop         ecx
 0008E2A3    pop         ecx
 0008E2A4    mov         dword ptr fs:[eax],edx
 0008E2A7    push        8E2B4
 0008E2AC    ret
>0008E2AD    jmp         @HandleFinally
>0008E2B2    jmp         0008E2AC
 0008E2B4    pop         ebp
 0008E2B5    ret
*}
end.