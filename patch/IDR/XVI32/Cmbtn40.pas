//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Cmbtn40;

interface

uses
  SysUtils, Classes, Menus, Graphics;

type
  TCMBtn = class(TCustomPanel)
  public
    Enabled:Boolean;//f200
    PopupMenu:TPopupMenu;//f204
    PopupButton:TMouseButton;//f208
    BevelWidth:TBevelW;//f209
    BtnLayout:TButtonLayout;//f20A
    Glyph:TBitmap;//f20C
    Margin:TMargin;//f210
    f211:byte;//f211
    WordWrap:Boolean;//f212
    PopupMark:Boolean;//f213
    f214:byte;//f214
    //f218:?;//f218
    f228:byte;//f228
    destructor Destroy; virtual;//0008A8E0
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0008A910
    constructor Create(AOwner:TComponent); virtual;//v2C//0008A7B0
    procedure Paint; virtual;//vB8//0008B83C
    procedure CMDialogChar(Message:TWMKey); message CM_DIALOGCHAR;//0008AFC0
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//0008B194
    procedure CMTextChanged; message CM_TEXTCHANGED;//0008B18C
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//0008AC7C
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//0008AC94
    procedure sub_0008A78C; dynamic;//0008A78C
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0008AE54
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//0008ACB4
    procedure SetPopupMenu(Value:TPopupMenu);//0008A764
    procedure SetPopupMark(Value:Boolean);//0008A79C
    procedure SetPopupButton(Value:TMouseButton);//0008A940
    procedure SetBevelWidth(Value:TBevelW);//0008A954
    procedure SetBtnLayout(Value:TButtonLayout);//0008A990
    procedure SetGlyph(Value:TBitmap);//0008AA00
    procedure SetMargin(Value:TMargin);//0008AC38
    procedure SetEnabled(Value:Boolean);//0008B180
    procedure SetWordWrap(Value:Boolean);//0008B1F8
  end;
    //procedure sub_0008A350(?:?; ?:Longint; ?:?);//0008A350
    //procedure sub_0008A3C4(?:?; ?:?);//0008A3C4
    //procedure sub_0008A594(?:?; ?:?);//0008A594
    //procedure sub_0008A6C4(?:TCMBtn; ?:?; ?:?; ?:?);//0008A6C4
    procedure sub_0008A78C;//0008A78C
    constructor Create(AOwner:TComponent);//0008A7B0
    destructor Destroy;//0008A8E0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0008A910
    //function sub_0008A9A4(?:TCMBtn; ?:TBitmap):?;//0008A9A4
    procedure sub_0008AC4C(?:TCMBtn);//0008AC4C
    procedure CMMouseEnter(var Message:TMessage);//0008AC7C
    procedure CMMouseLeave(var Message:TMessage);//0008AC94
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0008ACB4
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//0008AE54
    procedure CMDialogChar(Message:TWMKey);//0008AFC0
    procedure CMTextChanged;//0008B18C
    procedure CMFontChanged(var Message:TMessage);//0008B194
    //procedure sub_0008B20C(?:TCMBtn; ?:?; ?:TRect);//0008B20C
    //procedure sub_0008B304(?:?);//0008B304
    //procedure sub_0008B364(?:TCMBtn; ?:?; ?:?; ?:?);//0008B364
    //procedure sub_0008B4CC(?:TCMBtn; ?:?; ?:?);//0008B4CC
    //procedure sub_0008B668(?:TCMBtn; ?:?; ?:TMargin; ?:?);//0008B668
    //procedure sub_0008B6C0(?:TCMBtn; ?:Integer; ?:?);//0008B6C0
    //procedure sub_0008B804(?:?; ?:?; ?:?);//0008B804
    procedure Paint;//0008B83C

implementation

//0008A350
{*procedure sub_0008A350(?:?; ?:Longint; ?:?);
begin
 0008A350    push        ebx
 0008A351    push        esi
 0008A352    push        edi
 0008A353    push        ebp
 0008A354    add         esp,0FFFFFFF4
 0008A357    mov         dword ptr [esp+4],ecx
 0008A35B    mov         dword ptr [esp],edx
 0008A35E    mov         edi,eax
 0008A360    mov         eax,edi
 0008A362    mov         edx,dword ptr [eax]
 0008A364    call        dword ptr [edx+2C]
 0008A367    dec         eax
 0008A368    test        eax,eax
>0008A36A    jl          0008A3B9
 0008A36C    inc         eax
 0008A36D    mov         dword ptr [esp+8],eax
 0008A371    xor         ebp,ebp
 0008A373    mov         eax,edi
 0008A375    mov         edx,dword ptr [eax]
 0008A377    call        dword ptr [edx+20]
 0008A37A    mov         esi,eax
 0008A37C    dec         esi
 0008A37D    test        esi,esi
>0008A37F    jl          0008A3B2
 0008A381    inc         esi
 0008A382    xor         ebx,ebx
 0008A384    mov         eax,edi
 0008A386    call        TBitmap.GetCanvas
 0008A38B    mov         ecx,ebx
 0008A38D    mov         edx,ebp
 0008A38F    call        TCanvas.GetPixel
 0008A394    cmp         eax,dword ptr [esp]
>0008A397    jne         0008A3AE
 0008A399    mov         eax,dword ptr [esp+4]
 0008A39D    push        eax
 0008A39E    mov         eax,edi
 0008A3A0    call        TBitmap.GetCanvas
 0008A3A5    mov         ecx,ebx
 0008A3A7    mov         edx,ebp
 0008A3A9    call        TCanvas.SetPixel
 0008A3AE    inc         ebx
 0008A3AF    dec         esi
>0008A3B0    jne         0008A384
 0008A3B2    inc         ebp
 0008A3B3    dec         dword ptr [esp+8]
>0008A3B7    jne         0008A373
 0008A3B9    add         esp,0C
 0008A3BC    pop         ebp
 0008A3BD    pop         edi
 0008A3BE    pop         esi
 0008A3BF    pop         ebx
 0008A3C0    ret
end;*}

//0008A3C4
{*procedure sub_0008A3C4(?:?; ?:?);
begin
 0008A3C4    push        ebx
 0008A3C5    push        esi
 0008A3C6    push        edi
 0008A3C7    push        ebp
 0008A3C8    add         esp,0FFFFFFEC
 0008A3CB    mov         dword ptr [esp],edx
 0008A3CE    mov         esi,eax
 0008A3D0    mov         eax,esi
 0008A3D2    mov         edx,dword ptr [eax]
 0008A3D4    call        dword ptr [edx+2C]
 0008A3D7    mov         ebx,eax
 0008A3D9    mov         eax,esi
 0008A3DB    mov         edx,dword ptr [eax]
 0008A3DD    call        dword ptr [edx+20]
 0008A3E0    or          ebx,eax
>0008A3E2    je          0008A58A
 0008A3E8    mov         eax,esi
 0008A3EA    mov         edx,dword ptr [eax]
 0008A3EC    call        dword ptr [edx+2C]
 0008A3EF    mov         edi,eax
 0008A3F1    mov         eax,esi
 0008A3F3    mov         edx,dword ptr [eax]
 0008A3F5    call        dword ptr [edx+20]
 0008A3F8    mov         ebp,eax
 0008A3FA    mov         edx,edi
 0008A3FC    mov         eax,dword ptr [esp]
 0008A3FF    mov         ecx,dword ptr [eax]
 0008A401    call        dword ptr [ecx+40]
 0008A404    mov         edx,ebp
 0008A406    mov         eax,dword ptr [esp]
 0008A409    mov         ecx,dword ptr [eax]
 0008A40B    call        dword ptr [ecx+34]
 0008A40E    push        ebp
 0008A40F    lea         eax,[esp+8]
 0008A413    push        eax
 0008A414    mov         ecx,edi
 0008A416    xor         edx,edx
 0008A418    xor         eax,eax
 0008A41A    call        Rect
 0008A41F    mov         eax,dword ptr [esp]
 0008A422    call        TBitmap.GetCanvas
 0008A427    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0008A42A    mov         edx,8000000F
 0008A42F    call        TBrush.SetColor
 0008A434    mov         dl,1
 0008A436    mov         eax,[00028F70];TBitmap
 0008A43B    call        TBitmap.Create;TBitmap.Create
 0008A440    mov         ebx,eax
 0008A442    mov         edx,esi
 0008A444    mov         eax,ebx
 0008A446    mov         ecx,dword ptr [eax]
 0008A448    call        dword ptr [ecx+8];TBitmap.Assign
 0008A44B    mov         dl,1
 0008A44D    mov         eax,ebx
 0008A44F    mov         ecx,dword ptr [eax]
 0008A451    call        dword ptr [ecx+68];TBitmap.SetHandleType
 0008A454    mov         eax,ebx
 0008A456    call        TBitmap.GetCanvas
 0008A45B    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0008A45E    xor         edx,edx
 0008A460    call        TBrush.SetColor
 0008A465    mov         edx,edi
 0008A467    mov         eax,ebx
 0008A469    mov         ecx,dword ptr [eax]
 0008A46B    call        dword ptr [ecx+40];TBitmap.SetWidth
 0008A46E    mov         eax,ebx
 0008A470    call        TBitmap.GetMonochrome
 0008A475    test        al,al
>0008A477    je          0008A4AA
 0008A479    mov         eax,ebx
 0008A47B    call        TBitmap.GetCanvas
 0008A480    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 0008A483    mov         edx,0FFFFFF
 0008A488    call        TFont.SetColor
 0008A48D    xor         edx,edx
 0008A48F    mov         eax,ebx
 0008A491    call        TBitmap.SetMonochrome
 0008A496    mov         eax,ebx
 0008A498    call        TBitmap.GetCanvas
 0008A49D    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0008A4A0    mov         edx,0FFFFFF
 0008A4A5    call        TBrush.SetColor
 0008A4AA    mov         dl,1
 0008A4AC    mov         eax,ebx
 0008A4AE    call        TBitmap.SetMonochrome
 0008A4B3    mov         eax,dword ptr [esp]
 0008A4B6    call        TBitmap.GetCanvas
 0008A4BB    mov         esi,eax
 0008A4BD    mov         edx,8000000F
 0008A4C2    mov         eax,dword ptr [esi+14];TCanvas.Brush:TBrush
 0008A4C5    call        TBrush.SetColor
 0008A4CA    lea         edx,[esp+4]
 0008A4CE    mov         eax,esi
 0008A4D0    call        TCanvas.FillRect
 0008A4D5    mov         edx,80000014
 0008A4DA    mov         eax,dword ptr [esi+14];TCanvas.Brush:TBrush
 0008A4DD    call        TBrush.SetColor
 0008A4E2    push        0
 0008A4E4    mov         eax,esi
 0008A4E6    call        TCanvas.GetHandle
 0008A4EB    push        eax
 0008A4EC    call        gdi32.SetTextColor
 0008A4F1    push        0FFFFFF
 0008A4F6    mov         eax,esi
 0008A4F8    call        TCanvas.GetHandle
 0008A4FD    push        eax
 0008A4FE    call        gdi32.SetBkColor
 0008A503    push        0E20746
 0008A508    push        0
 0008A50A    push        0
 0008A50C    mov         eax,ebx
 0008A50E    call        TBitmap.GetCanvas
 0008A513    call        TCanvas.GetHandle
 0008A518    push        eax
 0008A519    push        ebp
 0008A51A    push        edi
 0008A51B    push        1
 0008A51D    push        1
 0008A51F    mov         eax,esi
 0008A521    call        TCanvas.GetHandle
 0008A526    push        eax
 0008A527    call        gdi32.BitBlt
 0008A52C    mov         edx,80000010
 0008A531    mov         eax,dword ptr [esi+14];TCanvas.Brush:TBrush
 0008A534    call        TBrush.SetColor
 0008A539    push        0
 0008A53B    mov         eax,esi
 0008A53D    call        TCanvas.GetHandle
 0008A542    push        eax
 0008A543    call        gdi32.SetTextColor
 0008A548    push        0FFFFFF
 0008A54D    mov         eax,esi
 0008A54F    call        TCanvas.GetHandle
 0008A554    push        eax
 0008A555    call        gdi32.SetBkColor
 0008A55A    push        0E20746
 0008A55F    push        0
 0008A561    push        0
 0008A563    mov         eax,ebx
 0008A565    call        TBitmap.GetCanvas
 0008A56A    call        TCanvas.GetHandle
 0008A56F    push        eax
 0008A570    push        ebp
 0008A571    push        edi
 0008A572    push        0
 0008A574    push        0
 0008A576    mov         eax,esi
 0008A578    call        TCanvas.GetHandle
 0008A57D    push        eax
 0008A57E    call        gdi32.BitBlt
 0008A583    mov         eax,ebx
 0008A585    call        TObject.Free
 0008A58A    add         esp,14
 0008A58D    pop         ebp
 0008A58E    pop         edi
 0008A58F    pop         esi
 0008A590    pop         ebx
 0008A591    ret
end;*}

//0008A594
{*procedure sub_0008A594(?:?; ?:?);
begin
 0008A594    push        ebx
 0008A595    push        esi
 0008A596    push        edi
 0008A597    push        ebp
 0008A598    add         esp,0FFFFFFF4
 0008A59B    mov         dword ptr [esp],edx
 0008A59E    mov         ebp,eax
 0008A5A0    mov         edx,ebp
 0008A5A2    mov         eax,dword ptr [esp]
 0008A5A5    mov         ecx,dword ptr [eax]
 0008A5A7    call        dword ptr [ecx+8]
 0008A5AA    mov         eax,ebp
 0008A5AC    mov         edx,dword ptr [eax]
 0008A5AE    call        dword ptr [edx+2C]
 0008A5B1    test        eax,eax
>0008A5B3    jl          0008A6BC
 0008A5B9    inc         eax
 0008A5BA    mov         dword ptr [esp+8],eax
 0008A5BE    mov         dword ptr [esp+4],0
 0008A5C6    mov         eax,ebp
 0008A5C8    mov         edx,dword ptr [eax]
 0008A5CA    call        dword ptr [edx+20]
 0008A5CD    mov         edi,eax
 0008A5CF    test        edi,edi
>0008A5D1    jl          0008A6AE
 0008A5D7    inc         edi
 0008A5D8    xor         esi,esi
 0008A5DA    mov         eax,ebp
 0008A5DC    call        TBitmap.GetCanvas
 0008A5E1    mov         ecx,esi
 0008A5E3    mov         edx,dword ptr [esp+4]
 0008A5E7    call        TCanvas.GetPixel
 0008A5EC    call        ColorToRGB
 0008A5F1    mov         ebx,eax
 0008A5F3    mov         eax,ebp
 0008A5F5    call        TBitmap.GetCanvas
 0008A5FA    xor         ecx,ecx
 0008A5FC    xor         edx,edx
 0008A5FE    call        TCanvas.GetPixel
 0008A603    call        ColorToRGB
 0008A608    cmp         ebx,eax
>0008A60A    je          0008A6A6
 0008A610    mov         eax,ebx
 0008A612    shr         eax,10
 0008A615    mov         edx,ebx
 0008A617    shr         edx,8
 0008A61A    and         edx,0FF
 0008A620    mov         ecx,ebx
 0008A622    and         ecx,0FF
 0008A628    add         edx,eax
 0008A62A    add         ecx,edx
 0008A62C    mov         eax,ecx
 0008A62E    cmp         eax,0CD
>0008A633    jle         0008A650
 0008A635    push        0FFFFFF
 0008A63A    mov         eax,dword ptr [esp+4]
 0008A63E    call        TBitmap.GetCanvas
 0008A643    mov         ecx,esi
 0008A645    mov         edx,dword ptr [esp+8]
 0008A649    call        TCanvas.SetPixel
>0008A64E    jmp         0008A6A6
 0008A650    cmp         eax,7F
>0008A653    jle         0008A670
 0008A655    push        80000014
 0008A65A    mov         eax,dword ptr [esp+4]
 0008A65E    call        TBitmap.GetCanvas
 0008A663    mov         ecx,esi
 0008A665    mov         edx,dword ptr [esp+8]
 0008A669    call        TCanvas.SetPixel
>0008A66E    jmp         0008A6A6
 0008A670    cmp         eax,44
>0008A673    jle         0008A690
 0008A675    push        80000010
 0008A67A    mov         eax,dword ptr [esp+4]
 0008A67E    call        TBitmap.GetCanvas
 0008A683    mov         ecx,esi
 0008A685    mov         edx,dword ptr [esp+8]
 0008A689    call        TCanvas.SetPixel
>0008A68E    jmp         0008A6A6
 0008A690    push        0
 0008A692    mov         eax,dword ptr [esp+4]
 0008A696    call        TBitmap.GetCanvas
 0008A69B    mov         ecx,esi
 0008A69D    mov         edx,dword ptr [esp+8]
 0008A6A1    call        TCanvas.SetPixel
 0008A6A6    inc         esi
 0008A6A7    dec         edi
>0008A6A8    jne         0008A5DA
 0008A6AE    inc         dword ptr [esp+4]
 0008A6B2    dec         dword ptr [esp+8]
>0008A6B6    jne         0008A5C6
 0008A6BC    add         esp,0C
 0008A6BF    pop         ebp
 0008A6C0    pop         edi
 0008A6C1    pop         esi
 0008A6C2    pop         ebx
 0008A6C3    ret
end;*}

//0008A6C4
{*procedure sub_0008A6C4(?:TCMBtn; ?:?; ?:?; ?:?);
begin
 0008A6C4    push        ebp
 0008A6C5    mov         ebp,esp
 0008A6C7    push        ecx
 0008A6C8    push        ebx
 0008A6C9    push        esi
 0008A6CA    push        edi
 0008A6CB    mov         dword ptr [ebp-4],ecx
 0008A6CE    mov         ebx,edx
 0008A6D0    mov         edi,eax
 0008A6D2    mov         esi,dword ptr [ebp+8]
 0008A6D5    cmp         esi,1
>0008A6D8    jl          0008A6F8
 0008A6DA    mov         edx,dword ptr [ebx]
 0008A6DC    mov         eax,edi
 0008A6DE    call        0008A9A4
 0008A6E3    cmp         esi,eax
>0008A6E5    jg          0008A6F8
 0008A6E7    cmp         esi,1
>0008A6EA    jne         0008A706
 0008A6EC    mov         edx,dword ptr [ebx]
 0008A6EE    mov         eax,edi
 0008A6F0    call        0008A9A4
 0008A6F5    dec         eax
>0008A6F6    jne         0008A706
 0008A6F8    mov         edx,dword ptr [ebx]
 0008A6FA    mov         eax,dword ptr [ebp-4]
 0008A6FD    mov         eax,dword ptr [eax]
 0008A6FF    mov         ecx,dword ptr [eax]
 0008A701    call        dword ptr [ecx+8]
>0008A704    jmp         0008A75B
 0008A706    mov         eax,dword ptr [ebx]
 0008A708    mov         edx,dword ptr [eax]
 0008A70A    call        dword ptr [edx+20]
 0008A70D    mov         edi,eax
 0008A70F    mov         eax,dword ptr [ebp-4]
 0008A712    mov         eax,dword ptr [eax]
 0008A714    mov         edx,edi
 0008A716    mov         ecx,dword ptr [eax]
 0008A718    call        dword ptr [ecx+34]
 0008A71B    mov         eax,dword ptr [ebp-4]
 0008A71E    mov         eax,dword ptr [eax]
 0008A720    mov         edx,edi
 0008A722    mov         ecx,dword ptr [eax]
 0008A724    call        dword ptr [ecx+40]
 0008A727    push        0CC0020
 0008A72C    push        0
 0008A72E    dec         esi
 0008A72F    imul        esi,edi
 0008A732    push        esi
 0008A733    mov         eax,dword ptr [ebx]
 0008A735    call        TBitmap.GetCanvas
 0008A73A    call        TCanvas.GetHandle
 0008A73F    push        eax
 0008A740    push        edi
 0008A741    push        edi
 0008A742    push        0
 0008A744    push        0
 0008A746    mov         eax,dword ptr [ebp-4]
 0008A749    mov         eax,dword ptr [eax]
 0008A74B    call        TBitmap.GetCanvas
 0008A750    call        TCanvas.GetHandle
 0008A755    push        eax
 0008A756    call        gdi32.BitBlt
 0008A75B    pop         edi
 0008A75C    pop         esi
 0008A75D    pop         ebx
 0008A75E    pop         ecx
 0008A75F    pop         ebp
 0008A760    ret         4
end;*}

//0008A764
procedure TCMBtn.SetPopupMenu(Value:TPopupMenu);
begin
{*
 0008A764    push        ebx
 0008A765    push        esi
 0008A766    mov         esi,edx
 0008A768    mov         ebx,eax
 0008A76A    mov         dword ptr [ebx+204],esi;TCMBtn.PopupMenu:TPopupMenu
 0008A770    test        esi,esi
>0008A772    je          0008A781
 0008A774    mov         edx,ebx
 0008A776    mov         eax,esi
 0008A778    call        TComponent.FreeNotification
 0008A77D    mov         byte ptr [esi+51],0;TPopupMenu.AutoPopup:Boolean
 0008A781    mov         eax,ebx
 0008A783    mov         edx,dword ptr [eax]
 0008A785    call        dword ptr [edx+78];TWinControl.Invalidate
 0008A788    pop         esi
 0008A789    pop         ebx
 0008A78A    ret
*}
end;

//0008A78C
procedure TCMBtn.sub_0008A78C;
begin
{*
 0008A78C    push        ebx
 0008A78D    mov         ebx,dword ptr [eax+204];TCMBtn.PopupMenu:TPopupMenu
 0008A793    mov         edx,dword ptr [eax]
 0008A795    call        dword ptr [edx+78];TWinControl.Invalidate
 0008A798    mov         eax,ebx
 0008A79A    pop         ebx
 0008A79B    ret
*}
end;

//0008A79C
procedure TCMBtn.SetPopupMark(Value:Boolean);
begin
{*
 0008A79C    cmp         dl,byte ptr [eax+213];TCMBtn.PopupMark:Boolean
>0008A7A2    je          0008A7AF
 0008A7A4    mov         byte ptr [eax+213],dl;TCMBtn.PopupMark:Boolean
 0008A7AA    mov         edx,dword ptr [eax]
 0008A7AC    call        dword ptr [edx+78];TWinControl.Invalidate
 0008A7AF    ret
*}
end;

//0008A7B0
constructor TCMBtn.Create(AOwner:TComponent);
begin
{*
 0008A7B0    push        ebx
 0008A7B1    push        esi
 0008A7B2    test        dl,dl
>0008A7B4    je          0008A7BE
 0008A7B6    add         esp,0FFFFFFF0
 0008A7B9    call        @ClassCreate
 0008A7BE    mov         ebx,edx
 0008A7C0    mov         esi,eax
 0008A7C2    xor         edx,edx
 0008A7C4    mov         eax,esi
 0008A7C6    call        TCustomPanel.Create
 0008A7CB    mov         dl,1
 0008A7CD    mov         eax,[00028F70];TBitmap
 0008A7D2    call        TBitmap.Create;TBitmap.Create
 0008A7D7    mov         dword ptr [esi+20C],eax;TCMBtn.Glyph:TBitmap
 0008A7DD    mov         dl,1
 0008A7DF    mov         eax,esi
 0008A7E1    call        TCMBtn.SetBevelWidth
 0008A7E6    mov         dl,2
 0008A7E8    mov         eax,esi
 0008A7EA    call        TCMBtn.SetBtnLayout
 0008A7EF    mov         eax,dword ptr [esi+1EC];TCMBtn.........................FCanvas:TCanvas
 0008A7F5    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0008A7F8    mov         edx,dword ptr [esi+64];TCMBtn.FColor:TColor
 0008A7FB    call        TBrush.SetColor
 0008A800    mov         eax,dword ptr [esi+1EC];TCMBtn..........................FCanvas:TCanvas
 0008A806    mov         eax,dword ptr [eax+14];TCanvas.Brush:TBrush
 0008A809    xor         edx,edx
 0008A80B    call        TBrush.SetStyle
 0008A810    mov         eax,dword ptr [esi+1EC];TCMBtn...........................FCanvas:TCanvas
 0008A816    mov         eax,dword ptr [eax+10];TCanvas.Pen:TPen
 0008A819    xor         edx,edx
 0008A81B    call        TPen.SetStyle
 0008A820    mov         eax,dword ptr [esi+1EC];TCMBtn............................FCanvas:TCanvas
 0008A826    mov         eax,dword ptr [eax+10];TCanvas.Pen:TPen
 0008A829    mov         edx,8000000F
 0008A82E    call        TPen.SetColor
 0008A833    mov         eax,dword ptr [esi+1EC];TCMBtn.............................FCanvas:TCanvas
 0008A839    mov         edx,dword ptr [eax+0C];TCanvas.Font:TFont
 0008A83C    mov         eax,esi
 0008A83E    call        TControl.SetFont
 0008A843    mov         byte ptr [esi+210],2;TCMBtn.Margin:TMargin
 0008A84A    xor         edx,edx
 0008A84C    mov         eax,esi
 0008A84E    call        TCMBtn.SetPopupMenu
 0008A853    mov         byte ptr [esi+208],0;TCMBtn.PopupButton:TMouseButton
 0008A85A    mov         edx,32
 0008A85F    mov         eax,esi
 0008A861    call        TControl.SetHeight
 0008A866    mov         edx,32
 0008A86B    mov         eax,esi
 0008A86D    call        TControl.SetWidth
 0008A872    mov         eax,[0008A8DC];0xE2 gvar_0008A8DC
 0008A877    mov         dword ptr [esi+40],eax;TCMBtn.FControlStyle:TControlStyle
 0008A87A    xor         edx,edx
 0008A87C    mov         eax,esi
 0008A87E    call        TCustomPanel.SetBevelOuter
 0008A883    mov         eax,dword ptr [esi+20C];TCMBtn.Glyph:TBitmap
 0008A889    mov         dword ptr [eax+8],esi;TBitmap.?f8:TCMBtn
 0008A88C    mov         dword ptr [eax+4],8AC74;TBitmap.FOnChange:TNotifyEvent
 0008A893    mov         byte ptr [esi+211],0;TCMBtn.?f211:byte
 0008A89A    mov         dl,1
 0008A89C    mov         eax,esi
 0008A89E    call        TCMBtn.SetEnabled
 0008A8A3    xor         edx,edx
 0008A8A5    mov         eax,esi
 0008A8A7    call        TCMBtn.SetWordWrap
 0008A8AC    mov         byte ptr [esi+214],0;TCMBtn.?f214:byte
 0008A8B3    mov         byte ptr [esi+228],0;TCMBtn.?f228:byte
 0008A8BA    mov         byte ptr [esi+213],1;TCMBtn.PopupMark:Boolean
 0008A8C1    mov         eax,esi
 0008A8C3    test        bl,bl
>0008A8C5    je          0008A8D6
 0008A8C7    call        @AfterConstruction
 0008A8CC    pop         dword ptr fs:[0]
 0008A8D3    add         esp,0C
 0008A8D6    mov         eax,esi
 0008A8D8    pop         esi
 0008A8D9    pop         ebx
 0008A8DA    ret
*}
end;

//0008A8E0
destructor TCMBtn.Destroy;
begin
{*
 0008A8E0    push        ebx
 0008A8E1    push        esi
 0008A8E2    call        @BeforeDestruction
 0008A8E7    mov         ebx,edx
 0008A8E9    mov         esi,eax
 0008A8EB    mov         eax,dword ptr [esi+20C];TCMBtn.Glyph:TBitmap
 0008A8F1    call        TObject.Free
 0008A8F6    mov         edx,ebx
 0008A8F8    and         dl,0FC
 0008A8FB    mov         eax,esi
 0008A8FD    call        TCustomControl.Destroy
 0008A902    test        bl,bl
>0008A904    jle         0008A90D
 0008A906    mov         eax,esi
 0008A908    call        @ClassDestroy
 0008A90D    pop         esi
 0008A90E    pop         ebx
 0008A90F    ret
*}
end;

//0008A910
procedure TCMBtn.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0008A910    push        ebx
 0008A911    push        esi
 0008A912    push        edi
 0008A913    mov         ebx,ecx
 0008A915    mov         esi,edx
 0008A917    mov         edi,eax
 0008A919    mov         ecx,ebx
 0008A91B    mov         edx,esi
 0008A91D    mov         eax,edi
 0008A91F    call        TControl.Notification
 0008A924    cmp         bl,1
>0008A927    jne         0008A93A
 0008A929    cmp         esi,dword ptr [edi+204];TCMBtn.PopupMenu:TPopupMenu
>0008A92F    jne         0008A93A
 0008A931    xor         edx,edx
 0008A933    mov         eax,edi
 0008A935    call        TCMBtn.SetPopupMenu
 0008A93A    pop         edi
 0008A93B    pop         esi
 0008A93C    pop         ebx
 0008A93D    ret
*}
end;

//0008A940
procedure TCMBtn.SetPopupButton(Value:TMouseButton);
begin
{*
 0008A940    cmp         dl,byte ptr [eax+208];TCMBtn.PopupButton:TMouseButton
>0008A946    je          0008A953
 0008A948    mov         byte ptr [eax+208],dl;TCMBtn.PopupButton:TMouseButton
 0008A94E    mov         edx,dword ptr [eax]
 0008A950    call        dword ptr [edx+78];TWinControl.Invalidate
 0008A953    ret
*}
end;

//0008A954
procedure TCMBtn.SetBevelWidth(Value:TBevelW);
begin
{*
 0008A954    push        ebx
 0008A955    mov         ebx,eax
 0008A957    cmp         dl,byte ptr [ebx+209];TCMBtn.BevelWidth:TBevelW
>0008A95D    je          0008A98D
 0008A95F    mov         eax,dword ptr [ebx+38];TCMBtn.Width:Integer
 0008A962    test        eax,eax
>0008A964    jns         0008A969
 0008A966    add         eax,3
 0008A969    sar         eax,2
 0008A96C    xor         ecx,ecx
 0008A96E    mov         cl,dl
 0008A970    cmp         eax,ecx
>0008A972    jge         0008A976
 0008A974    mov         edx,eax
 0008A976    mov         byte ptr [ebx+209],dl;TCMBtn.BevelWidth:TBevelW
 0008A97C    add         edx,2
 0008A97F    mov         eax,ebx
 0008A981    call        TCMBtn.SetMargin
 0008A986    mov         eax,ebx
 0008A988    mov         edx,dword ptr [eax]
 0008A98A    call        dword ptr [edx+78];TWinControl.Invalidate
 0008A98D    pop         ebx
 0008A98E    ret
*}
end;

//0008A990
procedure TCMBtn.SetBtnLayout(Value:TButtonLayout);
begin
{*
 0008A990    cmp         dl,byte ptr [eax+20A];TCMBtn.BtnLayout:TButtonLayout
>0008A996    je          0008A9A3
 0008A998    mov         byte ptr [eax+20A],dl;TCMBtn.BtnLayout:TButtonLayout
 0008A99E    mov         edx,dword ptr [eax]
 0008A9A0    call        dword ptr [edx+78];TWinControl.Invalidate
 0008A9A3    ret
*}
end;

//0008A9A4
{*function sub_0008A9A4(?:TCMBtn; ?:TBitmap):?;
begin
 0008A9A4    push        ebx
 0008A9A5    mov         ebx,edx
 0008A9A7    test        ebx,ebx
>0008A9A9    je          0008A9B6
 0008A9AB    mov         eax,ebx
 0008A9AD    mov         edx,dword ptr [eax]
 0008A9AF    call        dword ptr [edx+20]
 0008A9B2    test        eax,eax
>0008A9B4    jne         0008A9BA
 0008A9B6    xor         eax,eax
 0008A9B8    pop         ebx
 0008A9B9    ret
 0008A9BA    mov         eax,ebx
 0008A9BC    mov         edx,dword ptr [eax]
 0008A9BE    call        dword ptr [edx+2C]
 0008A9C1    push        eax
 0008A9C2    mov         eax,ebx
 0008A9C4    mov         edx,dword ptr [eax]
 0008A9C6    call        dword ptr [edx+20]
 0008A9C9    pop         edx
 0008A9CA    xchg        eax,edx
 0008A9CB    mov         ecx,edx
 0008A9CD    cdq
 0008A9CE    idiv        eax,ecx
 0008A9D0    test        edx,edx
>0008A9D2    jne         0008A9F6
 0008A9D4    mov         eax,ebx
 0008A9D6    mov         edx,dword ptr [eax]
 0008A9D8    call        dword ptr [edx+2C]
 0008A9DB    push        eax
 0008A9DC    mov         eax,ebx
 0008A9DE    mov         edx,dword ptr [eax]
 0008A9E0    call        dword ptr [edx+20]
 0008A9E3    pop         edx
 0008A9E4    xchg        eax,edx
 0008A9E5    mov         ecx,edx
 0008A9E7    cdq
 0008A9E8    idiv        eax,ecx
 0008A9EA    cmp         eax,4
>0008A9ED    jle         0008A9FB
 0008A9EF    mov         eax,1
>0008A9F4    jmp         0008A9FB
 0008A9F6    mov         eax,1
 0008A9FB    pop         ebx
 0008A9FC    ret
end;*}

//0008AA00
procedure TCMBtn.SetGlyph(Value:TBitmap);
begin
{*
 0008AA00    push        ebx
 0008AA01    push        esi
 0008AA02    push        edi
 0008AA03    push        ebp
 0008AA04    add         esp,0FFFFFFF0
 0008AA07    mov         dword ptr [esp],edx
 0008AA0A    mov         ebp,eax
 0008AA0C    mov         edx,dword ptr [esp]
 0008AA0F    mov         eax,ebp
 0008AA11    call        0008A9A4
 0008AA16    mov         edi,eax
 0008AA18    mov         eax,edi
 0008AA1A    dec         eax
 0008AA1B    sub         eax,2
>0008AA1E    jb          0008AA33
 0008AA20    mov         eax,dword ptr [ebp+20C];TCMBtn.Glyph:TBitmap
 0008AA26    mov         edx,dword ptr [esp]
 0008AA29    mov         ecx,dword ptr [eax]
 0008AA2B    call        dword ptr [ecx+8];TBitmap.Assign
>0008AA2E    jmp         0008AC30
 0008AA33    mov         eax,dword ptr [esp]
 0008AA36    call        TBitmap.GetCanvas
 0008AA3B    xor         ecx,ecx
 0008AA3D    xor         edx,edx
 0008AA3F    call        TCanvas.GetPixel
 0008AA44    call        ColorToRGB
 0008AA49    mov         edx,eax
 0008AA4B    mov         ecx,8000000F
 0008AA50    mov         eax,dword ptr [esp]
 0008AA53    call        0008A350
 0008AA58    mov         eax,dword ptr [esp]
 0008AA5B    mov         edx,dword ptr [eax]
 0008AA5D    call        dword ptr [edx+2C]
 0008AA60    cdq
 0008AA61    idiv        eax,edi
 0008AA63    mov         ebx,eax
 0008AA65    mov         eax,dword ptr [esp]
 0008AA68    mov         edx,dword ptr [eax]
 0008AA6A    call        dword ptr [edx+20]
 0008AA6D    mov         dword ptr [esp+4],eax
 0008AA71    mov         dl,1
 0008AA73    mov         eax,[00028F70];TBitmap
 0008AA78    call        TBitmap.Create;TBitmap.Create
 0008AA7D    mov         esi,eax
 0008AA7F    mov         eax,dword ptr [esp]
 0008AA82    mov         edx,dword ptr [eax]
 0008AA84    call        dword ptr [edx+20]
 0008AA87    mov         edx,eax
 0008AA89    mov         eax,esi
 0008AA8B    mov         ecx,dword ptr [eax]
 0008AA8D    call        dword ptr [ecx+34];TBitmap.SetHeight
 0008AA90    lea         edx,[ebx+ebx*2]
 0008AA93    mov         eax,esi
 0008AA95    mov         ecx,dword ptr [eax]
 0008AA97    call        dword ptr [ecx+40];TBitmap.SetWidth
 0008AA9A    mov         dl,1
 0008AA9C    mov         eax,[00028F70];TBitmap
 0008AAA1    call        TBitmap.Create;TBitmap.Create
 0008AAA6    mov         dword ptr [esp+8],eax
 0008AAAA    mov         dl,1
 0008AAAC    mov         eax,[00028F70];TBitmap
 0008AAB1    call        TBitmap.Create;TBitmap.Create
 0008AAB6    mov         dword ptr [esp+0C],eax
 0008AABA    push        0CC0020
 0008AABF    push        0
 0008AAC1    push        0
 0008AAC3    mov         eax,dword ptr [esp+0C]
 0008AAC7    call        TBitmap.GetCanvas
 0008AACC    call        TCanvas.GetHandle
 0008AAD1    push        eax
 0008AAD2    mov         eax,dword ptr [esp+14]
 0008AAD6    push        eax
 0008AAD7    push        ebx
 0008AAD8    push        0
 0008AADA    push        0
 0008AADC    mov         eax,esi
 0008AADE    call        TBitmap.GetCanvas
 0008AAE3    call        TCanvas.GetHandle
 0008AAE8    push        eax
 0008AAE9    call        gdi32.BitBlt
 0008AAEE    cmp         edi,1
>0008AAF1    jle         0008AB27
 0008AAF3    push        0CC0020
 0008AAF8    push        0
 0008AAFA    push        ebx
 0008AAFB    mov         eax,dword ptr [esp+0C]
 0008AAFF    call        TBitmap.GetCanvas
 0008AB04    call        TCanvas.GetHandle
 0008AB09    push        eax
 0008AB0A    mov         eax,dword ptr [esp+14]
 0008AB0E    push        eax
 0008AB0F    push        ebx
 0008AB10    push        0
 0008AB12    push        ebx
 0008AB13    mov         eax,esi
 0008AB15    call        TBitmap.GetCanvas
 0008AB1A    call        TCanvas.GetHandle
 0008AB1F    push        eax
 0008AB20    call        gdi32.BitBlt
>0008AB25    jmp         0008AB78
 0008AB27    push        1
 0008AB29    lea         ecx,[esp+0C]
 0008AB2D    lea         edx,[esp+4]
 0008AB31    mov         eax,ebp
 0008AB33    call        0008A6C4
 0008AB38    mov         edx,dword ptr [esp+0C]
 0008AB3C    mov         eax,dword ptr [esp+8]
 0008AB40    call        0008A3C4
 0008AB45    push        0CC0020
 0008AB4A    push        0
 0008AB4C    push        0
 0008AB4E    mov         eax,dword ptr [esp+18]
 0008AB52    call        TBitmap.GetCanvas
 0008AB57    call        TCanvas.GetHandle
 0008AB5C    push        eax
 0008AB5D    mov         eax,dword ptr [esp+14]
 0008AB61    push        eax
 0008AB62    push        ebx
 0008AB63    push        0
 0008AB65    push        ebx
 0008AB66    mov         eax,esi
 0008AB68    call        TBitmap.GetCanvas
 0008AB6D    call        TCanvas.GetHandle
 0008AB72    push        eax
 0008AB73    call        gdi32.BitBlt
 0008AB78    cmp         edi,2
>0008AB7B    jle         0008ABB5
 0008AB7D    push        0CC0020
 0008AB82    push        0
 0008AB84    mov         edi,ebx
 0008AB86    add         edi,edi
 0008AB88    push        edi
 0008AB89    mov         eax,dword ptr [esp+0C]
 0008AB8D    call        TBitmap.GetCanvas
 0008AB92    call        TCanvas.GetHandle
 0008AB97    push        eax
 0008AB98    mov         eax,dword ptr [esp+14]
 0008AB9C    push        eax
 0008AB9D    push        ebx
 0008AB9E    push        0
 0008ABA0    push        edi
 0008ABA1    mov         eax,esi
 0008ABA3    call        TBitmap.GetCanvas
 0008ABA8    call        TCanvas.GetHandle
 0008ABAD    push        eax
 0008ABAE    call        gdi32.BitBlt
>0008ABB3    jmp         0008AC0A
 0008ABB5    push        1
 0008ABB7    lea         ecx,[esp+0C]
 0008ABBB    lea         edx,[esp+4]
 0008ABBF    mov         eax,ebp
 0008ABC1    call        0008A6C4
 0008ABC6    mov         edx,dword ptr [esp+0C]
 0008ABCA    mov         eax,dword ptr [esp+8]
 0008ABCE    call        0008A594
 0008ABD3    push        0CC0020
 0008ABD8    push        0
 0008ABDA    push        0
 0008ABDC    mov         eax,dword ptr [esp+18]
 0008ABE0    call        TBitmap.GetCanvas
 0008ABE5    call        TCanvas.GetHandle
 0008ABEA    push        eax
 0008ABEB    mov         eax,dword ptr [esp+14]
 0008ABEF    push        eax
 0008ABF0    push        ebx
 0008ABF1    push        0
 0008ABF3    mov         eax,ebx
 0008ABF5    add         eax,eax
 0008ABF7    push        eax
 0008ABF8    mov         eax,esi
 0008ABFA    call        TBitmap.GetCanvas
 0008ABFF    call        TCanvas.GetHandle
 0008AC04    push        eax
 0008AC05    call        gdi32.BitBlt
 0008AC0A    mov         eax,dword ptr [ebp+20C];TCMBtn.Glyph:TBitmap
 0008AC10    mov         edx,esi
 0008AC12    mov         ecx,dword ptr [eax]
 0008AC14    call        dword ptr [ecx+8];TBitmap.Assign
 0008AC17    mov         eax,esi
 0008AC19    call        TObject.Free
 0008AC1E    mov         eax,dword ptr [esp+8]
 0008AC22    call        TObject.Free
 0008AC27    mov         eax,dword ptr [esp+0C]
 0008AC2B    call        TObject.Free
 0008AC30    add         esp,10
 0008AC33    pop         ebp
 0008AC34    pop         edi
 0008AC35    pop         esi
 0008AC36    pop         ebx
 0008AC37    ret
*}
end;

//0008AC38
procedure TCMBtn.SetMargin(Value:TMargin);
begin
{*
 0008AC38    cmp         dl,byte ptr [eax+210];TCMBtn.Margin:TMargin
>0008AC3E    je          0008AC4B
 0008AC40    mov         byte ptr [eax+210],dl;TCMBtn.Margin:TMargin
 0008AC46    mov         edx,dword ptr [eax]
 0008AC48    call        dword ptr [edx+78];TWinControl.Invalidate
 0008AC4B    ret
*}
end;

//0008AC4C
procedure sub_0008AC4C(?:TCMBtn);
begin
{*
 0008AC4C    push        ebx
 0008AC4D    push        esi
 0008AC4E    push        edi
 0008AC4F    add         esp,0FFFFFFF0
 0008AC52    mov         ebx,eax
 0008AC54    mov         edx,esp
 0008AC56    mov         eax,ebx
 0008AC58    mov         ecx,dword ptr [eax]
 0008AC5A    call        dword ptr [ecx+44]
 0008AC5D    mov         esi,esp
 0008AC5F    lea         edi,[ebx+218]
 0008AC65    mov         ecx,4
 0008AC6A    rep movs    dword ptr [edi],dword ptr [esi]
 0008AC6C    add         esp,10
 0008AC6F    pop         edi
 0008AC70    pop         esi
 0008AC71    pop         ebx
 0008AC72    ret
*}
end;

//0008AC7C
procedure TCMBtn.CMMouseEnter(var Message:TMessage);
begin
{*
 0008AC7C    mov         byte ptr [eax+214],1;TCMBtn.?f214:byte
 0008AC83    cmp         byte ptr [eax+200],0;TCMBtn.Enabled:Boolean
>0008AC8A    je          0008AC93
 0008AC8C    mov         dl,2
 0008AC8E    call        TCustomPanel.SetBevelOuter
 0008AC93    ret
*}
end;

//0008AC94
procedure TCMBtn.CMMouseLeave(var Message:TMessage);
begin
{*
 0008AC94    mov         byte ptr [eax+214],0;TCMBtn.?f214:byte
 0008AC9B    mov         byte ptr [eax+228],0;TCMBtn.?f228:byte
 0008ACA2    cmp         byte ptr [eax+200],0;TCMBtn.Enabled:Boolean
>0008ACA9    je          0008ACB2
 0008ACAB    xor         edx,edx
 0008ACAD    call        TCustomPanel.SetBevelOuter
 0008ACB2    ret
*}
end;

//0008ACB4
procedure TCMBtn.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0008ACB4    push        ebp
 0008ACB5    mov         ebp,esp
 0008ACB7    add         esp,0FFFFFFEC
 0008ACBA    push        ebx
 0008ACBB    push        esi
 0008ACBC    push        edi
 0008ACBD    mov         byte ptr [ebp-1],cl
 0008ACC0    mov         ebx,edx
 0008ACC2    mov         esi,eax
 0008ACC4    cmp         byte ptr [esi+200],0;TCMBtn.Enabled:Boolean
>0008ACCB    je          0008ADE0
 0008ACD1    cmp         byte ptr [esi+47],0;TCMBtn.FVisible:Boolean
>0008ACD5    je          0008ADE0
 0008ACDB    cmp         bl,byte ptr [esi+208];TCMBtn.PopupButton:TMouseButton
>0008ACE1    jne         0008ADE0
 0008ACE7    cmp         dword ptr [esi+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008ACEE    je          0008ADE0
 0008ACF4    lea         ecx,[ebp-14]
 0008ACF7    mov         edx,dword ptr [esi+3C];TCMBtn.Height:Integer
 0008ACFA    xor         eax,eax
 0008ACFC    call        Point
 0008AD01    lea         edx,[ebp-14]
 0008AD04    lea         ecx,[ebp-0C]
 0008AD07    mov         eax,esi
 0008AD09    call        TControl.ClientToScreen
 0008AD0E    mov         eax,esi
 0008AD10    call        0008AC4C
 0008AD15    push        80000014
 0008AD1A    xor         eax,eax
 0008AD1C    mov         al,byte ptr [esi+209];TCMBtn.BevelWidth:TBevelW
 0008AD22    push        eax
 0008AD23    lea         edx,[esi+218];TCMBtn.?f218:?
 0008AD29    mov         ecx,80000010
 0008AD2E    mov         eax,dword ptr [esi+1EC];TCMBtn..............................FCanvas:TCanvas
 0008AD34    call        Frame3D
 0008AD39    mov         ecx,dword ptr [ebp-8]
 0008AD3C    mov         edx,dword ptr [ebp-0C]
 0008AD3F    mov         eax,dword ptr [esi+204];TCMBtn.PopupMenu:TPopupMenu
 0008AD45    mov         edi,dword ptr [eax]
 0008AD47    call        dword ptr [edi+3C];TPopupMenu.Popup
 0008AD4A    lea         eax,[ebp-0C]
 0008AD4D    push        eax
 0008AD4E    call        user32.GetCursorPos
 0008AD53    test        eax,eax
>0008AD55    je          0008AD98
 0008AD57    lea         ecx,[ebp-14]
 0008AD5A    lea         edx,[ebp-0C]
 0008AD5D    mov         eax,esi
 0008AD5F    call        TControl.ScreenToClient
 0008AD64    mov         eax,dword ptr [ebp-14]
 0008AD67    mov         dword ptr [ebp-0C],eax
 0008AD6A    mov         eax,dword ptr [ebp-10]
 0008AD6D    mov         dword ptr [ebp-8],eax
 0008AD70    mov         eax,dword ptr [ebp-0C]
 0008AD73    test        eax,eax
>0008AD75    jl          0008AD8A
 0008AD77    cmp         eax,dword ptr [esi+38];TCMBtn.Width:Integer
>0008AD7A    jg          0008AD8A
 0008AD7C    cmp         dword ptr [ebp-8],0
>0008AD80    jl          0008AD8A
 0008AD82    mov         eax,dword ptr [ebp-8]
 0008AD85    cmp         eax,dword ptr [esi+3C];TCMBtn.Height:Integer
>0008AD88    jle         0008AD8E
 0008AD8A    xor         eax,eax
>0008AD8C    jmp         0008AD90
 0008AD8E    mov         al,1
 0008AD90    mov         byte ptr [esi+214],al;TCMBtn.?f214:byte
>0008AD96    jmp         0008AD9F
 0008AD98    mov         byte ptr [esi+214],0;TCMBtn.?f214:byte
 0008AD9F    cmp         byte ptr [esi+214],0;TCMBtn.?f214:byte
>0008ADA6    je          0008ADD5
 0008ADA8    mov         eax,esi
 0008ADAA    call        0008AC4C
 0008ADAF    push        80000010
 0008ADB4    xor         eax,eax
 0008ADB6    mov         al,byte ptr [esi+209];TCMBtn.BevelWidth:TBevelW
 0008ADBC    push        eax
 0008ADBD    lea         edx,[esi+218];TCMBtn.?f218:?
 0008ADC3    mov         ecx,80000014
 0008ADC8    mov         eax,dword ptr [esi+1EC];TCMBtn...............................FCanvas:TCanvas
 0008ADCE    call        Frame3D
>0008ADD3    jmp         0008AE36
 0008ADD5    xor         edx,edx
 0008ADD7    mov         eax,esi
 0008ADD9    call        TCustomPanel.SetBevelOuter
>0008ADDE    jmp         0008AE36
 0008ADE0    cmp         byte ptr [esi+200],0;TCMBtn.Enabled:Boolean
>0008ADE7    je          0008AE36
 0008ADE9    cmp         byte ptr [esi+47],0;TCMBtn.FVisible:Boolean
>0008ADED    je          0008AE36
 0008ADEF    test        bl,bl
>0008ADF1    je          0008AE04
 0008ADF3    cmp         dword ptr [esi+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008ADFA    je          0008AE36
 0008ADFC    cmp         bl,byte ptr [esi+208];TCMBtn.PopupButton:TMouseButton
>0008AE02    jne         0008AE36
 0008AE04    mov         eax,esi
 0008AE06    call        0008AC4C
 0008AE0B    push        80000014
 0008AE10    xor         eax,eax
 0008AE12    mov         al,byte ptr [esi+209];TCMBtn.BevelWidth:TBevelW
 0008AE18    push        eax
 0008AE19    lea         edx,[esi+218];TCMBtn.?f218:?
 0008AE1F    mov         ecx,80000010
 0008AE24    mov         eax,dword ptr [esi+1EC];TCMBtn................................FCanvas:TCanvas
 0008AE2A    call        Frame3D
 0008AE2F    mov         byte ptr [esi+228],1;TCMBtn.?f228:byte
 0008AE36    mov         eax,dword ptr [ebp+0C]
 0008AE39    push        eax
 0008AE3A    mov         eax,dword ptr [ebp+8]
 0008AE3D    push        eax
 0008AE3E    mov         cl,byte ptr [ebp-1]
 0008AE41    mov         edx,ebx
 0008AE43    mov         eax,esi
 0008AE45    call        TControl.MouseDown
 0008AE4A    pop         edi
 0008AE4B    pop         esi
 0008AE4C    pop         ebx
 0008AE4D    mov         esp,ebp
 0008AE4F    pop         ebp
 0008AE50    ret         8
*}
end;

//0008AE54
procedure TCMBtn.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 0008AE54    push        ebp
 0008AE55    mov         ebp,esp
 0008AE57    add         esp,0FFFFFFEC
 0008AE5A    push        ebx
 0008AE5B    push        esi
 0008AE5C    mov         byte ptr [ebp-2],cl
 0008AE5F    mov         byte ptr [ebp-1],dl
 0008AE62    mov         esi,eax
 0008AE64    cmp         byte ptr [esi+228],0;TCMBtn.?f228:byte
>0008AE6B    je          0008AFB8
 0008AE71    mov         eax,dword ptr [esi+204];TCMBtn.PopupMenu:TPopupMenu
 0008AE77    test        eax,eax
>0008AE79    je          0008AE7F
 0008AE7B    mov         byte ptr [eax+51],0;TPopupMenu.AutoPopup:Boolean
 0008AE7F    cmp         byte ptr [esi+200],0;TCMBtn.Enabled:Boolean
>0008AE86    je          0008AF9C
 0008AE8C    cmp         byte ptr [esi+47],0;TCMBtn.FVisible:Boolean
>0008AE90    je          0008AF9C
 0008AE96    cmp         byte ptr [ebp-1],0
>0008AE9A    jne         0008AF9C
 0008AEA0    mov         eax,esi
 0008AEA2    call        0008AC4C
 0008AEA7    cmp         byte ptr [esi+214],0;TCMBtn.?f214:byte
>0008AEAE    je          0008AF7C
 0008AEB4    push        8000000F
 0008AEB9    xor         eax,eax
 0008AEBB    mov         al,byte ptr [esi+209];TCMBtn.BevelWidth:TBevelW
 0008AEC1    push        eax
 0008AEC2    lea         edx,[esi+218];TCMBtn.?f218:?
 0008AEC8    mov         ecx,8000000F
 0008AECD    mov         eax,dword ptr [esi+1EC];TCMBtn.................................FCanvas:TCanvas
 0008AED3    call        Frame3D
 0008AED8    mov         byte ptr [esi+214],0;TCMBtn.?f214:byte
 0008AEDF    mov         eax,esi
 0008AEE1    mov         edx,dword ptr [eax]
 0008AEE3    call        dword ptr [edx+7C];TWinControl.Repaint
 0008AEE6    mov         eax,esi
 0008AEE8    mov         bx,0FFEC
 0008AEEC    call        @CallDynaInst;TControl.Click
 0008AEF1    lea         eax,[ebp-0C]
 0008AEF4    push        eax
 0008AEF5    call        user32.GetCursorPos
 0008AEFA    test        eax,eax
>0008AEFC    je          0008AF3F
 0008AEFE    lea         ecx,[ebp-14]
 0008AF01    lea         edx,[ebp-0C]
 0008AF04    mov         eax,esi
 0008AF06    call        TControl.ScreenToClient
 0008AF0B    mov         eax,dword ptr [ebp-14]
 0008AF0E    mov         dword ptr [ebp-0C],eax
 0008AF11    mov         eax,dword ptr [ebp-10]
 0008AF14    mov         dword ptr [ebp-8],eax
 0008AF17    mov         eax,dword ptr [ebp-0C]
 0008AF1A    test        eax,eax
>0008AF1C    jl          0008AF31
 0008AF1E    cmp         eax,dword ptr [esi+38];TCMBtn.Width:Integer
>0008AF21    jg          0008AF31
 0008AF23    cmp         dword ptr [ebp-8],0
>0008AF27    jl          0008AF31
 0008AF29    mov         eax,dword ptr [ebp-8]
 0008AF2C    cmp         eax,dword ptr [esi+3C];TCMBtn.Height:Integer
>0008AF2F    jle         0008AF35
 0008AF31    xor         eax,eax
>0008AF33    jmp         0008AF37
 0008AF35    mov         al,1
 0008AF37    mov         byte ptr [esi+214],al;TCMBtn.?f214:byte
>0008AF3D    jmp         0008AF46
 0008AF3F    mov         byte ptr [esi+214],0;TCMBtn.?f214:byte
 0008AF46    cmp         byte ptr [esi+214],0;TCMBtn.?f214:byte
>0008AF4D    je          0008AF9C
 0008AF4F    push        80000010
 0008AF54    xor         eax,eax
 0008AF56    mov         al,byte ptr [esi+209];TCMBtn.BevelWidth:TBevelW
 0008AF5C    push        eax
 0008AF5D    lea         edx,[esi+218];TCMBtn.?f218:?
 0008AF63    mov         ecx,80000014
 0008AF68    mov         eax,dword ptr [esi+1EC];TCMBtn..................................FCanvas:TCanvas
 0008AF6E    call        Frame3D
 0008AF73    mov         eax,esi
 0008AF75    mov         edx,dword ptr [eax]
 0008AF77    call        dword ptr [edx+7C];TWinControl.Repaint
>0008AF7A    jmp         0008AF9C
 0008AF7C    mov         eax,dword ptr [esi+64];TCMBtn.FColor:TColor
 0008AF7F    push        eax
 0008AF80    xor         edx,edx
 0008AF82    mov         dl,byte ptr [esi+209];TCMBtn.BevelWidth:TBevelW
 0008AF88    push        edx
 0008AF89    lea         edx,[esi+218];TCMBtn.?f218:?
 0008AF8F    mov         ecx,eax
 0008AF91    mov         eax,dword ptr [esi+1EC];TCMBtn...................................FCanvas:TCanvas
 0008AF97    call        Frame3D
 0008AF9C    mov         byte ptr [esi+228],0;TCMBtn.?f228:byte
 0008AFA3    mov         eax,dword ptr [ebp+0C]
 0008AFA6    push        eax
 0008AFA7    mov         eax,dword ptr [ebp+8]
 0008AFAA    push        eax
 0008AFAB    mov         cl,byte ptr [ebp-2]
 0008AFAE    mov         dl,byte ptr [ebp-1]
 0008AFB1    mov         eax,esi
 0008AFB3    call        TControl.MouseUp
 0008AFB8    pop         esi
 0008AFB9    pop         ebx
 0008AFBA    mov         esp,ebp
 0008AFBC    pop         ebp
 0008AFBD    ret         8
*}
end;

//0008AFC0
procedure TCMBtn.CMDialogChar(Message:TWMKey);
begin
{*
 0008AFC0    push        ebp
 0008AFC1    mov         ebp,esp
 0008AFC3    add         esp,0FFFFFFF0
 0008AFC6    push        ebx
 0008AFC7    push        esi
 0008AFC8    push        edi
 0008AFC9    xor         ecx,ecx
 0008AFCB    mov         dword ptr [ebp-10],ecx
 0008AFCE    mov         dword ptr [ebp-4],edx
 0008AFD1    mov         esi,eax
 0008AFD3    xor         eax,eax
 0008AFD5    push        ebp
 0008AFD6    push        8B16C
 0008AFDB    push        dword ptr fs:[eax]
 0008AFDE    mov         dword ptr fs:[eax],esp
 0008AFE1    cmp         byte ptr [esi+200],0;TCMBtn.Enabled:Boolean
>0008AFE8    je          0008B156
 0008AFEE    cmp         byte ptr [esi+47],0;TCMBtn.FVisible:Boolean
>0008AFF2    je          0008B156
 0008AFF8    lea         edx,[ebp-10]
 0008AFFB    mov         eax,esi
 0008AFFD    call        TControl.GetText
 0008B002    mov         edx,dword ptr [ebp-10]
 0008B005    mov         eax,dword ptr [ebp-4]
 0008B008    mov         ax,word ptr [eax+4]
 0008B00C    call        IsAccel
 0008B011    test        al,al
>0008B013    je          0008B156
 0008B019    xor         eax,eax
 0008B01B    mov         dword ptr [ebp-8],eax
 0008B01E    mov         eax,dword ptr [esi+24];TCMBtn.FParent:TWinControl
 0008B021    call        TWinControl.GetControlCount
 0008B026    mov         edi,eax
 0008B028    dec         edi
 0008B029    test        edi,edi
>0008B02B    jl          0008B078
 0008B02D    inc         edi
 0008B02E    xor         ebx,ebx
 0008B030    mov         edx,ebx
 0008B032    mov         eax,dword ptr [esi+24];TCMBtn.FParent:TWinControl
 0008B035    call        TWinControl.GetControl
 0008B03A    mov         edx,dword ptr ds:[89F04];TCMBtn
 0008B040    call        @IsClass
 0008B045    test        al,al
>0008B047    je          0008B074
 0008B049    mov         edx,ebx
 0008B04B    mov         eax,dword ptr [esi+24];TCMBtn.FParent:TWinControl
 0008B04E    call        TWinControl.GetControl
 0008B053    cmp         byte ptr [eax+214],0
>0008B05A    je          0008B074
 0008B05C    mov         edx,ebx
 0008B05E    mov         eax,dword ptr [esi+24];TCMBtn.FParent:TWinControl
 0008B061    call        TWinControl.GetControl
 0008B066    mov         edx,dword ptr ds:[89F04];TCMBtn
 0008B06C    call        @AsClass
 0008B071    mov         dword ptr [ebp-8],eax
 0008B074    inc         ebx
 0008B075    dec         edi
>0008B076    jne         0008B030
 0008B078    cmp         dword ptr [ebp-8],0
>0008B07C    je          0008B090
 0008B07E    mov         eax,dword ptr [ebp-8]
 0008B081    mov         byte ptr [eax+214],0;TCMBtn.?f214:byte
 0008B088    mov         eax,dword ptr [ebp-8]
 0008B08B    mov         edx,dword ptr [eax]
 0008B08D    call        dword ptr [edx+7C];TWinControl.Repaint
 0008B090    mov         edx,dword ptr [ebp-4]
 0008B093    mov         eax,esi
 0008B095    call        TCMBtn.CMMouseEnter
 0008B09A    mov         eax,esi
 0008B09C    mov         edx,dword ptr [eax]
 0008B09E    call        dword ptr [edx+7C];TWinControl.Repaint
 0008B0A1    push        64
 0008B0A3    call        kernel32.Sleep
 0008B0A8    cmp         dword ptr [esi+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008B0AF    je          0008B0BC
 0008B0B1    mov         al,byte ptr [esi+208];TCMBtn.PopupButton:TMouseButton
 0008B0B7    mov         byte ptr [ebp-9],al
>0008B0BA    jmp         0008B0C0
 0008B0BC    mov         byte ptr [ebp-9],0
 0008B0C0    mov         eax,dword ptr [esi+30];TCMBtn.Left:Integer
 0008B0C3    push        eax
 0008B0C4    mov         eax,dword ptr [esi+34];TCMBtn.Top:Integer
 0008B0C7    push        eax
 0008B0C8    mov         cl,byte ptr ds:[8B17C];0x0 gvar_0008B17C
 0008B0CE    mov         dl,byte ptr [ebp-9]
 0008B0D1    mov         eax,esi
 0008B0D3    mov         bx,0FFDB
 0008B0D7    call        @CallDynaInst;TCMBtn.MouseDown
 0008B0DC    mov         byte ptr [esi+214],0;TCMBtn.?f214:byte
 0008B0E3    mov         eax,dword ptr [esi+30];TCMBtn.Left:Integer
 0008B0E6    push        eax
 0008B0E7    mov         eax,dword ptr [esi+34];TCMBtn.Top:Integer
 0008B0EA    push        eax
 0008B0EB    mov         cl,byte ptr ds:[8B17C];0x0 gvar_0008B17C
 0008B0F1    mov         dl,byte ptr [ebp-9]
 0008B0F4    mov         eax,esi
 0008B0F6    mov         bx,0FFD9
 0008B0FA    call        @CallDynaInst;TCMBtn.MouseUp
 0008B0FF    cmp         dword ptr [esi+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008B106    jne         0008B113
 0008B108    mov         eax,esi
 0008B10A    mov         bx,0FFEC
 0008B10E    call        @CallDynaInst;TControl.Click
 0008B113    mov         edx,dword ptr [ebp-4]
 0008B116    mov         eax,esi
 0008B118    call        TCMBtn.CMMouseLeave
 0008B11D    mov         eax,esi
 0008B11F    mov         edx,dword ptr [eax]
 0008B121    call        dword ptr [edx+7C];TWinControl.Repaint
 0008B124    push        64
 0008B126    call        kernel32.Sleep
 0008B12B    mov         eax,dword ptr [ebp-4]
 0008B12E    mov         dword ptr [eax+0C],1
 0008B135    cmp         dword ptr [esi+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008B13C    je          0008B156
 0008B13E    cmp         dword ptr [ebp-8],0
>0008B142    je          0008B156
 0008B144    mov         eax,dword ptr [ebp-8]
 0008B147    mov         byte ptr [eax+214],1;TCMBtn.?f214:byte
 0008B14E    mov         eax,dword ptr [ebp-8]
 0008B151    mov         edx,dword ptr [eax]
 0008B153    call        dword ptr [edx+7C];TWinControl.Repaint
 0008B156    xor         eax,eax
 0008B158    pop         edx
 0008B159    pop         ecx
 0008B15A    pop         ecx
 0008B15B    mov         dword ptr fs:[eax],edx
 0008B15E    push        8B173
 0008B163    lea         eax,[ebp-10]
 0008B166    call        @LStrClr
 0008B16B    ret
>0008B16C    jmp         @HandleFinally
>0008B171    jmp         0008B163
 0008B173    pop         edi
 0008B174    pop         esi
 0008B175    pop         ebx
 0008B176    mov         esp,ebp
 0008B178    pop         ebp
 0008B179    ret
*}
end;

//0008B180
procedure TCMBtn.SetEnabled(Value:Boolean);
begin
{*
 0008B180    mov         byte ptr [eax+200],dl;TCMBtn.Enabled:Boolean
 0008B186    mov         edx,dword ptr [eax]
 0008B188    call        dword ptr [edx+78];TWinControl.Invalidate
 0008B18B    ret
*}
end;

//0008B18C
procedure TCMBtn.CMTextChanged;
begin
{*
 0008B18C    mov         edx,dword ptr [eax]
 0008B18E    call        dword ptr [edx+78];TWinControl.Invalidate
 0008B191    ret
*}
end;

//0008B194
procedure TCMBtn.CMFontChanged(var Message:TMessage);
begin
{*
 0008B194    push        ebp
 0008B195    mov         ebp,esp
 0008B197    push        0
 0008B199    push        esi
 0008B19A    mov         esi,eax
 0008B19C    xor         eax,eax
 0008B19E    push        ebp
 0008B19F    push        8B1ED
 0008B1A4    push        dword ptr fs:[eax]
 0008B1A7    mov         dword ptr fs:[eax],esp
 0008B1AA    mov         eax,esi
 0008B1AC    call        TWinControl.CMFontChanged
 0008B1B1    lea         edx,[ebp-4]
 0008B1B4    mov         eax,dword ptr [esi+58];TCMBtn.FFont:TFont
 0008B1B7    call        TFont.GetName
 0008B1BC    mov         edx,dword ptr [ebp-4]
 0008B1BF    mov         eax,dword ptr [esi+1EC];TCMBtn....................................FCanvas:TCanvas
 0008B1C5    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 0008B1C8    call        TFont.SetName
 0008B1CD    mov         eax,esi
 0008B1CF    mov         edx,dword ptr [eax]
 0008B1D1    call        dword ptr [edx+0B8];TCMBtn.Paint
 0008B1D7    xor         eax,eax
 0008B1D9    pop         edx
 0008B1DA    pop         ecx
 0008B1DB    pop         ecx
 0008B1DC    mov         dword ptr fs:[eax],edx
 0008B1DF    push        8B1F4
 0008B1E4    lea         eax,[ebp-4]
 0008B1E7    call        @LStrClr
 0008B1EC    ret
>0008B1ED    jmp         @HandleFinally
>0008B1F2    jmp         0008B1E4
 0008B1F4    pop         esi
 0008B1F5    pop         ecx
 0008B1F6    pop         ebp
 0008B1F7    ret
*}
end;

//0008B1F8
procedure TCMBtn.SetWordWrap(Value:Boolean);
begin
{*
 0008B1F8    cmp         dl,byte ptr [eax+212];TCMBtn.WordWrap:Boolean
>0008B1FE    je          0008B20B
 0008B200    mov         byte ptr [eax+212],dl;TCMBtn.WordWrap:Boolean
 0008B206    mov         edx,dword ptr [eax]
 0008B208    call        dword ptr [edx+78];TWinControl.Invalidate
 0008B20B    ret
*}
end;

//0008B20C
{*procedure sub_0008B20C(?:TCMBtn; ?:?; ?:TRect);
begin
 0008B20C    push        ebx
 0008B20D    push        esi
 0008B20E    push        edi
 0008B20F    add         esp,0FFFFFFE0
 0008B212    mov         esi,ecx
 0008B214    lea         edi,[esp]
 0008B217    mov         ecx,4
 0008B21C    rep movs    dword ptr [edi],dword ptr [esi]
 0008B21E    mov         esi,edx
 0008B220    mov         ebx,eax
 0008B222    cmp         dword ptr [ebx+20C],0
>0008B229    jne         0008B25D
 0008B22B    movzx       edi,byte ptr [ebx+210]
 0008B232    mov         eax,dword ptr [ebx+3C]
 0008B235    sub         eax,edi
 0008B237    push        eax
 0008B238    lea         eax,[esp+14]
 0008B23C    push        eax
 0008B23D    mov         ecx,dword ptr [ebx+38]
 0008B240    sub         ecx,edi
 0008B242    mov         edx,edi
 0008B244    mov         eax,edi
 0008B246    call        Rect
 0008B24B    mov         edi,esi
 0008B24D    lea         esi,[esp+10]
 0008B251    mov         ecx,4
 0008B256    rep movs    dword ptr [edi],dword ptr [esi]
>0008B258    jmp         0008B2FC
 0008B25D    cmp         byte ptr [ebx+20A],0
>0008B264    jne         0008B276
 0008B266    xor         eax,eax
 0008B268    mov         al,byte ptr [ebx+210]
 0008B26E    add         eax,dword ptr [esp+8]
 0008B272    mov         dword ptr [esi],eax
>0008B274    jmp         0008B280
 0008B276    xor         eax,eax
 0008B278    mov         al,byte ptr [ebx+210]
 0008B27E    mov         dword ptr [esi],eax
 0008B280    cmp         byte ptr [ebx+20A],1
>0008B287    jne         0008B29B
 0008B289    xor         eax,eax
 0008B28B    mov         al,byte ptr [ebx+210]
 0008B291    mov         edx,dword ptr [esp]
 0008B294    sub         edx,eax
 0008B296    mov         dword ptr [esi+8],edx
>0008B299    jmp         0008B2AB
 0008B29B    xor         eax,eax
 0008B29D    mov         al,byte ptr [ebx+210]
 0008B2A3    mov         edx,dword ptr [ebx+38]
 0008B2A6    sub         edx,eax
 0008B2A8    mov         dword ptr [esi+8],edx
 0008B2AB    cmp         byte ptr [ebx+20A],2
>0008B2B2    jne         0008B2C5
 0008B2B4    xor         eax,eax
 0008B2B6    mov         al,byte ptr [ebx+210]
 0008B2BC    add         eax,dword ptr [esp+0C]
 0008B2C0    mov         dword ptr [esi+4],eax
>0008B2C3    jmp         0008B2D0
 0008B2C5    xor         eax,eax
 0008B2C7    mov         al,byte ptr [ebx+210]
 0008B2CD    mov         dword ptr [esi+4],eax
 0008B2D0    cmp         byte ptr [ebx+20A],3
>0008B2D7    jne         0008B2EC
 0008B2D9    xor         eax,eax
 0008B2DB    mov         al,byte ptr [ebx+210]
 0008B2E1    mov         edx,dword ptr [esp+4]
 0008B2E5    sub         edx,eax
 0008B2E7    mov         dword ptr [esi+0C],edx
>0008B2EA    jmp         0008B2FC
 0008B2EC    xor         eax,eax
 0008B2EE    mov         al,byte ptr [ebx+210]
 0008B2F4    mov         edx,dword ptr [ebx+3C]
 0008B2F7    sub         edx,eax
 0008B2F9    mov         dword ptr [esi+0C],edx
 0008B2FC    add         esp,20
 0008B2FF    pop         edi
 0008B300    pop         esi
 0008B301    pop         ebx
 0008B302    ret
end;*}

//0008B304
{*procedure sub_0008B304(?:?);
begin
 0008B304    push        ebp
 0008B305    mov         ebp,esp
 0008B307    push        esi
 0008B308    push        edi
 0008B309    mov         eax,dword ptr [ebp+8]
 0008B30C    mov         eax,dword ptr [eax-14]
 0008B30F    mov         edx,dword ptr [ebp+8]
 0008B312    mov         esi,eax
 0008B314    lea         edi,[edx-10]
 0008B317    mov         ecx,4
 0008B31C    rep movs    dword ptr [edi],dword ptr [esi]
 0008B31E    mov         eax,dword ptr [ebp+8]
 0008B321    mov         eax,dword ptr [eax-1C]
 0008B324    push        eax
 0008B325    mov         eax,dword ptr [ebp+8]
 0008B328    add         eax,0FFFFFFF0
 0008B32B    push        eax
 0008B32C    mov         eax,dword ptr [ebp+8]
 0008B32F    mov         eax,dword ptr [eax+8]
 0008B332    mov         eax,dword ptr [eax]
 0008B334    call        @LStrLen
 0008B339    push        eax
 0008B33A    mov         eax,dword ptr [ebp+8]
 0008B33D    mov         eax,dword ptr [eax+8]
 0008B340    mov         eax,dword ptr [eax]
 0008B342    call        @LStrToPChar
 0008B347    push        eax
 0008B348    mov         eax,dword ptr [ebp+8]
 0008B34B    mov         eax,dword ptr [eax-18]
 0008B34E    mov         eax,dword ptr [eax+1EC]
 0008B354    call        TCanvas.GetHandle
 0008B359    push        eax
 0008B35A    call        user32.DrawTextA
 0008B35F    pop         edi
 0008B360    pop         esi
 0008B361    pop         ebp
 0008B362    ret
end;*}

//0008B364
{*procedure sub_0008B364(?:TCMBtn; ?:?; ?:?; ?:?);
begin
 0008B364    push        ebp
 0008B365    mov         ebp,esp
 0008B367    add         esp,0FFFFFFD8
 0008B36A    push        ebx
 0008B36B    push        esi
 0008B36C    push        edi
 0008B36D    xor         ebx,ebx
 0008B36F    mov         dword ptr [ebp-28],ebx
 0008B372    mov         dword ptr [ebp-24],ebx
 0008B375    mov         dword ptr [ebp-14],ecx
 0008B378    mov         dword ptr [ebp-20],edx
 0008B37B    mov         dword ptr [ebp-18],eax
 0008B37E    mov         eax,dword ptr [ebp-20]
 0008B381    call        @LStrAddRef
 0008B386    xor         eax,eax
 0008B388    push        ebp
 0008B389    push        8B4B0
 0008B38E    push        dword ptr fs:[eax]
 0008B391    mov         dword ptr fs:[eax],esp
 0008B394    mov         eax,dword ptr [ebp+8]
 0008B397    mov         edx,dword ptr [ebp-20]
 0008B39A    call        @LStrLAsg
 0008B39F    lea         edx,[ebp-24]
 0008B3A2    mov         eax,dword ptr [ebp-18]
 0008B3A5    mov         eax,dword ptr [eax+58]
 0008B3A8    call        TFont.GetName
 0008B3AD    mov         edx,dword ptr [ebp-24]
 0008B3B0    mov         eax,dword ptr [ebp-18]
 0008B3B3    mov         eax,dword ptr [eax+1EC]
 0008B3B9    mov         eax,dword ptr [eax+0C]
 0008B3BC    call        TFont.SetName
 0008B3C1    mov         dword ptr [ebp-1C],400
 0008B3C8    mov         eax,dword ptr [ebp-18]
 0008B3CB    cmp         byte ptr [eax+212],0
>0008B3D2    je          0008B3D8
 0008B3D4    or          dword ptr [ebp-1C],10
 0008B3D8    push        ebp
 0008B3D9    call        0008B304
 0008B3DE    pop         ecx
 0008B3DF    mov         eax,dword ptr [ebp-14]
 0008B3E2    mov         eax,dword ptr [eax+8]
 0008B3E5    cmp         eax,dword ptr [ebp-8]
>0008B3E8    jl          0008B3F9
 0008B3EA    mov         eax,dword ptr [ebp-14]
 0008B3ED    mov         eax,dword ptr [eax+0C]
 0008B3F0    cmp         eax,dword ptr [ebp-4]
>0008B3F3    jge         0008B47B
 0008B3F9    lea         eax,[ebp-20]
 0008B3FC    push        eax
 0008B3FD    mov         eax,dword ptr [ebp-20]
 0008B400    call        @LStrLen
 0008B405    mov         ecx,eax
 0008B407    dec         ecx
 0008B408    mov         edx,1
 0008B40D    mov         eax,dword ptr [ebp-20]
 0008B410    call        @LStrCopy
 0008B415    mov         eax,dword ptr [ebp+8]
 0008B418    mov         ecx,8B4C8;'...'
 0008B41D    mov         edx,dword ptr [ebp-20]
 0008B420    call        @LStrCat3
 0008B425    push        ebp
 0008B426    call        0008B304
 0008B42B    pop         ecx
 0008B42C    mov         eax,dword ptr [ebp-14]
 0008B42F    mov         eax,dword ptr [eax+8]
 0008B432    cmp         eax,dword ptr [ebp-8]
>0008B435    jle         0008B442
 0008B437    mov         eax,dword ptr [ebp-14]
 0008B43A    mov         eax,dword ptr [eax+0C]
 0008B43D    cmp         eax,dword ptr [ebp-4]
>0008B440    jg          0008B44F
 0008B442    mov         eax,dword ptr [ebp-20]
 0008B445    call        @LStrLen
 0008B44A    cmp         eax,2
>0008B44D    jg          0008B3F9
 0008B44F    lea         eax,[ebp-28]
 0008B452    push        eax
 0008B453    mov         eax,dword ptr [ebp-20]
 0008B456    call        @LStrLen
 0008B45B    mov         ecx,eax
 0008B45D    dec         ecx
 0008B45E    mov         edx,1
 0008B463    mov         eax,dword ptr [ebp-20]
 0008B466    call        @LStrCopy
 0008B46B    mov         edx,dword ptr [ebp-28]
 0008B46E    mov         eax,dword ptr [ebp+8]
 0008B471    mov         ecx,8B4C8;'...'
 0008B476    call        @LStrCat3
 0008B47B    mov         eax,dword ptr [ebp-14]
 0008B47E    mov         edi,eax
 0008B480    lea         esi,[ebp-10]
 0008B483    mov         ecx,4
 0008B488    rep movs    dword ptr [edi],dword ptr [esi]
 0008B48A    xor         eax,eax
 0008B48C    pop         edx
 0008B48D    pop         ecx
 0008B48E    pop         ecx
 0008B48F    mov         dword ptr fs:[eax],edx
 0008B492    push        8B4B7
 0008B497    lea         eax,[ebp-28]
 0008B49A    call        @LStrClr
 0008B49F    lea         eax,[ebp-24]
 0008B4A2    call        @LStrClr
 0008B4A7    lea         eax,[ebp-20]
 0008B4AA    call        @LStrClr
 0008B4AF    ret
>0008B4B0    jmp         @HandleFinally
>0008B4B5    jmp         0008B497
 0008B4B7    pop         edi
 0008B4B8    pop         esi
 0008B4B9    pop         ebx
 0008B4BA    mov         esp,ebp
 0008B4BC    pop         ebp
 0008B4BD    ret         4
end;*}

//0008B4CC
{*procedure sub_0008B4CC(?:TCMBtn; ?:?; ?:?);
begin
 0008B4CC    push        ebp
 0008B4CD    mov         ebp,esp
 0008B4CF    add         esp,0FFFFFFE8
 0008B4D2    push        ebx
 0008B4D3    push        esi
 0008B4D4    push        edi
 0008B4D5    xor         ebx,ebx
 0008B4D7    mov         dword ptr [ebp-18],ebx
 0008B4DA    mov         esi,ecx
 0008B4DC    lea         edi,[ebp-14]
 0008B4DF    mov         ecx,4
 0008B4E4    rep movs    dword ptr [edi],dword ptr [esi]
 0008B4E6    mov         dword ptr [ebp-4],edx
 0008B4E9    mov         ebx,eax
 0008B4EB    mov         eax,dword ptr [ebp-4]
 0008B4EE    call        @LStrAddRef
 0008B4F3    xor         eax,eax
 0008B4F5    push        ebp
 0008B4F6    push        8B65A
 0008B4FB    push        dword ptr fs:[eax]
 0008B4FE    mov         dword ptr fs:[eax],esp
 0008B501    mov         esi,dword ptr [ebx+1EC]
 0008B507    lea         edx,[ebp-18]
 0008B50A    mov         eax,dword ptr [ebx+58]
 0008B50D    call        TFont.GetName
 0008B512    mov         edx,dword ptr [ebp-18]
 0008B515    mov         eax,dword ptr [esi+0C]
 0008B518    call        TFont.SetName
 0008B51D    mov         eax,dword ptr [ebx+58]
 0008B520    call        TFont.GetSize
 0008B525    mov         edx,eax
 0008B527    mov         eax,dword ptr [esi+0C]
 0008B52A    call        TFont.SetSize
 0008B52F    mov         eax,dword ptr [ebx+58]
 0008B532    call        TFont.GetStyle
 0008B537    mov         edx,eax
 0008B539    mov         eax,dword ptr [esi+0C]
 0008B53C    call        TFont.SetStyle
 0008B541    mov         eax,dword ptr [ebx+58]
 0008B544    mov         edx,dword ptr [eax+14]
 0008B547    mov         eax,dword ptr [esi+0C]
 0008B54A    call        TFont.SetColor
 0008B54F    mov         dl,1
 0008B551    mov         eax,dword ptr [esi+14]
 0008B554    call        TBrush.SetStyle
 0008B559    cmp         byte ptr [ebx+212],0
>0008B560    je          0008B569
 0008B562    mov         esi,10
>0008B567    jmp         0008B56B
 0008B569    xor         esi,esi
 0008B56B    cmp         dword ptr [ebp-4],0
>0008B56F    je          0008B63C
 0008B575    mov         edi,dword ptr [ebx+1EC]
 0008B57B    cmp         byte ptr [ebx+200],0
>0008B582    je          0008B5AD
 0008B584    push        esi
 0008B585    lea         eax,[ebp-14]
 0008B588    push        eax
 0008B589    mov         eax,dword ptr [ebp-4]
 0008B58C    call        @LStrLen
 0008B591    push        eax
 0008B592    mov         eax,dword ptr [ebp-4]
 0008B595    call        @LStrToPChar
 0008B59A    push        eax
 0008B59B    mov         eax,edi
 0008B59D    call        TCanvas.GetHandle
 0008B5A2    push        eax
 0008B5A3    call        user32.DrawTextA
>0008B5A8    jmp         0008B63C
 0008B5AD    mov         eax,dword ptr [edi+0C]
 0008B5B0    mov         edi,dword ptr [eax+14]
 0008B5B3    mov         edx,80000014
 0008B5B8    call        TFont.SetColor
 0008B5BD    push        esi
 0008B5BE    lea         eax,[ebp-14]
 0008B5C1    push        eax
 0008B5C2    mov         eax,dword ptr [ebp-4]
 0008B5C5    call        @LStrLen
 0008B5CA    push        eax
 0008B5CB    mov         eax,dword ptr [ebp-4]
 0008B5CE    call        @LStrToPChar
 0008B5D3    push        eax
 0008B5D4    mov         eax,dword ptr [ebx+1EC]
 0008B5DA    call        TCanvas.GetHandle
 0008B5DF    push        eax
 0008B5E0    call        user32.DrawTextA
 0008B5E5    mov         eax,dword ptr [ebx+1EC]
 0008B5EB    mov         eax,dword ptr [eax+0C]
 0008B5EE    mov         edx,80000010
 0008B5F3    call        TFont.SetColor
 0008B5F8    dec         dword ptr [ebp-14]
 0008B5FB    dec         dword ptr [ebp-10]
 0008B5FE    dec         dword ptr [ebp-0C]
 0008B601    dec         dword ptr [ebp-8]
 0008B604    push        esi
 0008B605    lea         eax,[ebp-14]
 0008B608    push        eax
 0008B609    mov         eax,dword ptr [ebp-4]
 0008B60C    call        @LStrLen
 0008B611    push        eax
 0008B612    mov         eax,dword ptr [ebp-4]
 0008B615    call        @LStrToPChar
 0008B61A    push        eax
 0008B61B    mov         eax,dword ptr [ebx+1EC]
 0008B621    call        TCanvas.GetHandle
 0008B626    push        eax
 0008B627    call        user32.DrawTextA
 0008B62C    mov         eax,dword ptr [ebx+1EC]
 0008B632    mov         eax,dword ptr [eax+0C]
 0008B635    mov         edx,edi
 0008B637    call        TFont.SetColor
 0008B63C    xor         eax,eax
 0008B63E    pop         edx
 0008B63F    pop         ecx
 0008B640    pop         ecx
 0008B641    mov         dword ptr fs:[eax],edx
 0008B644    push        8B661
 0008B649    lea         eax,[ebp-18]
 0008B64C    call        @LStrClr
 0008B651    lea         eax,[ebp-4]
 0008B654    call        @LStrClr
 0008B659    ret
>0008B65A    jmp         @HandleFinally
>0008B65F    jmp         0008B649
 0008B661    pop         edi
 0008B662    pop         esi
 0008B663    pop         ebx
 0008B664    mov         esp,ebp
 0008B666    pop         ebp
 0008B667    ret
end;*}

//0008B668
{*procedure sub_0008B668(?:TCMBtn; ?:?; ?:TMargin; ?:?);
begin
 0008B668    push        ebp
 0008B669    mov         ebp,esp
 0008B66B    add         esp,0FFFFFFF4
 0008B66E    push        ebx
 0008B66F    push        esi
 0008B670    push        edi
 0008B671    mov         dword ptr [ebp-0C],ecx
 0008B674    mov         dword ptr [ebp-8],edx
 0008B677    mov         dword ptr [ebp-4],eax
 0008B67A    xor         esi,esi
 0008B67C    mov         edi,esi
 0008B67E    neg         edi
 0008B680    mov         ebx,6
 0008B685    sub         ebx,esi
 0008B687    neg         ebx
 0008B689    sub         ebx,edi
>0008B68B    jg          0008B6AE
 0008B68D    dec         ebx
 0008B68E    mov         eax,dword ptr [ebp+8]
 0008B691    push        eax
 0008B692    mov         ecx,dword ptr [ebp-0C]
 0008B695    add         ecx,esi
 0008B697    mov         edx,dword ptr [ebp-8]
 0008B69A    sub         edx,edi
 0008B69C    mov         eax,dword ptr [ebp-4]
 0008B69F    mov         eax,dword ptr [eax+1EC]
 0008B6A5    call        TCanvas.SetPixel
 0008B6AA    dec         edi
 0008B6AB    inc         ebx
>0008B6AC    jne         0008B68E
 0008B6AE    inc         esi
 0008B6AF    cmp         esi,4
>0008B6B2    jne         0008B67C
 0008B6B4    pop         edi
 0008B6B5    pop         esi
 0008B6B6    pop         ebx
 0008B6B7    mov         esp,ebp
 0008B6B9    pop         ebp
 0008B6BA    ret         4
end;*}

//0008B6C0
{*procedure sub_0008B6C0(?:TCMBtn; ?:Integer; ?:?);
begin
 0008B6C0    push        ebp
 0008B6C1    mov         ebp,esp
 0008B6C3    add         esp,0FFFFFFE8
 0008B6C6    push        ebx
 0008B6C7    push        esi
 0008B6C8    push        edi
 0008B6C9    xor         ebx,ebx
 0008B6CB    mov         dword ptr [ebp-18],ebx
 0008B6CE    mov         esi,ecx
 0008B6D0    mov         dword ptr [ebp-4],edx
 0008B6D3    mov         ebx,eax
 0008B6D5    xor         eax,eax
 0008B6D7    push        ebp
 0008B6D8    push        8B7F6
 0008B6DD    push        dword ptr fs:[eax]
 0008B6E0    mov         dword ptr fs:[eax],esp
 0008B6E3    cmp         dword ptr [ebx+20C],0
>0008B6EA    jne         0008B70E
 0008B6EC    push        0
 0008B6EE    lea         eax,[ebp-14]
 0008B6F1    push        eax
 0008B6F2    xor         ecx,ecx
 0008B6F4    xor         edx,edx
 0008B6F6    xor         eax,eax
 0008B6F8    call        Rect
 0008B6FD    mov         edi,esi
 0008B6FF    lea         esi,[ebp-14]
 0008B702    mov         ecx,4
 0008B707    rep movs    dword ptr [edi],dword ptr [esi]
>0008B709    jmp         0008B7E0
 0008B70E    mov         eax,dword ptr [ebx+20C]
 0008B714    mov         edx,dword ptr [eax]
 0008B716    call        dword ptr [edx+20]
 0008B719    mov         edi,eax
 0008B71B    lea         edx,[ebp-18]
 0008B71E    mov         eax,ebx
 0008B720    call        TControl.GetText
 0008B725    cmp         dword ptr [ebp-18],0
>0008B729    jne         0008B74E
 0008B72B    mov         eax,dword ptr [ebx+38]
 0008B72E    sub         eax,dword ptr [ebp-4]
 0008B731    sar         eax,1
>0008B733    jns         0008B738
 0008B735    adc         eax,0
 0008B738    mov         dword ptr [esi],eax
 0008B73A    mov         eax,dword ptr [ebx+3C]
 0008B73D    sub         eax,edi
 0008B73F    sar         eax,1
>0008B741    jns         0008B746
 0008B743    adc         eax,0
 0008B746    mov         dword ptr [esi+4],eax
>0008B749    jmp         0008B7D2
 0008B74E    mov         al,byte ptr [ebx+20A]
 0008B754    sub         al,2
>0008B756    jb          0008B76D
>0008B758    je          0008B760
 0008B75A    dec         al
>0008B75C    je          0008B77E
>0008B75E    jmp         0008B790
 0008B760    xor         eax,eax
 0008B762    mov         al,byte ptr [ebx+210]
 0008B768    mov         dword ptr [esi+4],eax
>0008B76B    jmp         0008B790
 0008B76D    mov         eax,dword ptr [ebx+3C]
 0008B770    sub         eax,edi
 0008B772    sar         eax,1
>0008B774    jns         0008B779
 0008B776    adc         eax,0
 0008B779    mov         dword ptr [esi+4],eax
>0008B77C    jmp         0008B790
 0008B77E    mov         eax,dword ptr [ebx+3C]
 0008B781    sub         eax,edi
 0008B783    xor         edx,edx
 0008B785    mov         dl,byte ptr [ebx+210]
 0008B78B    sub         eax,edx
 0008B78D    mov         dword ptr [esi+4],eax
 0008B790    mov         al,byte ptr [ebx+20A]
 0008B796    sub         al,1
>0008B798    jb          0008B7A3
>0008B79A    je          0008B7AF
 0008B79C    dec         eax
 0008B79D    sub         al,2
>0008B79F    jb          0008B7C3
>0008B7A1    jmp         0008B7D2
 0008B7A3    xor         eax,eax
 0008B7A5    mov         al,byte ptr [ebx+210]
 0008B7AB    mov         dword ptr [esi],eax
>0008B7AD    jmp         0008B7D2
 0008B7AF    mov         eax,dword ptr [ebx+38]
 0008B7B2    sub         eax,dword ptr [ebp-4]
 0008B7B5    xor         edx,edx
 0008B7B7    mov         dl,byte ptr [ebx+210]
 0008B7BD    sub         eax,edx
 0008B7BF    mov         dword ptr [esi],eax
>0008B7C1    jmp         0008B7D2
 0008B7C3    mov         eax,dword ptr [ebx+38]
 0008B7C6    sub         eax,dword ptr [ebp-4]
 0008B7C9    sar         eax,1
>0008B7CB    jns         0008B7D0
 0008B7CD    adc         eax,0
 0008B7D0    mov         dword ptr [esi],eax
 0008B7D2    add         edi,dword ptr [esi+4]
 0008B7D5    mov         dword ptr [esi+0C],edi
 0008B7D8    mov         eax,dword ptr [esi]
 0008B7DA    add         eax,dword ptr [ebp-4]
 0008B7DD    mov         dword ptr [esi+8],eax
 0008B7E0    xor         eax,eax
 0008B7E2    pop         edx
 0008B7E3    pop         ecx
 0008B7E4    pop         ecx
 0008B7E5    mov         dword ptr fs:[eax],edx
 0008B7E8    push        8B7FD
 0008B7ED    lea         eax,[ebp-18]
 0008B7F0    call        @LStrClr
 0008B7F5    ret
>0008B7F6    jmp         @HandleFinally
>0008B7FB    jmp         0008B7ED
 0008B7FD    pop         edi
 0008B7FE    pop         esi
 0008B7FF    pop         ebx
 0008B800    mov         esp,ebp
 0008B802    pop         ebp
 0008B803    ret
end;*}

//0008B804
{*procedure sub_0008B804(?:?; ?:?; ?:?);
begin
 0008B804    push        ebp
 0008B805    mov         ebp,esp
 0008B807    push        ebx
 0008B808    mov         ebx,edx
 0008B80A    mov         edx,eax
 0008B80C    dec         edx
 0008B80D    mov         eax,dword ptr [ebp+8]
 0008B810    imul        edx,dword ptr [eax-4]
 0008B814    mov         dword ptr [ebx],edx
 0008B816    mov         eax,dword ptr [ebp+8]
 0008B819    add         edx,dword ptr [eax-4]
 0008B81C    mov         dword ptr [ebx+8],edx
 0008B81F    xor         eax,eax
 0008B821    mov         dword ptr [ebx+4],eax
 0008B824    mov         eax,dword ptr [ebp+8]
 0008B827    mov         eax,dword ptr [eax-8]
 0008B82A    mov         eax,dword ptr [eax+20C]
 0008B830    mov         edx,dword ptr [eax]
 0008B832    call        dword ptr [edx+20]
 0008B835    mov         dword ptr [ebx+0C],eax
 0008B838    pop         ebx
 0008B839    pop         ebp
 0008B83A    ret
end;*}

//0008B83C
procedure TCMBtn.Paint;
begin
{*
 0008B83C    push        ebp
 0008B83D    mov         ebp,esp
 0008B83F    add         esp,0FFFFFFA0
 0008B842    push        ebx
 0008B843    push        esi
 0008B844    push        edi
 0008B845    xor         edx,edx
 0008B847    mov         dword ptr [ebp-60],edx
 0008B84A    mov         dword ptr [ebp-0C],edx
 0008B84D    mov         dword ptr [ebp-8],eax
 0008B850    lea         ebx,[ebp-8]
 0008B853    xor         eax,eax
 0008B855    push        ebp
 0008B856    push        8BB4A
 0008B85B    push        dword ptr fs:[eax]
 0008B85E    mov         dword ptr fs:[eax],esp
 0008B861    mov         eax,dword ptr [ebx]
 0008B863    test        byte ptr [eax+20],10;TCMBtn.FComponentState:TComponentState
>0008B867    jne         0008B875
 0008B869    mov         eax,dword ptr [ebx]
 0008B86B    cmp         byte ptr [eax+47],0;TCMBtn.FVisible:Boolean
>0008B86F    je          0008BB2C
 0008B875    mov         eax,dword ptr [ebx]
 0008B877    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 0008B87D    mov         edx,dword ptr [eax]
 0008B87F    call        dword ptr [edx+2C];TBitmap.GetWidth
 0008B882    mov         ecx,3
 0008B887    cdq
 0008B888    idiv        eax,ecx
 0008B88A    mov         dword ptr [ebp-4],eax
 0008B88D    mov         eax,dword ptr [ebx]
 0008B88F    call        0008AC4C
 0008B894    mov         eax,dword ptr [ebx]
 0008B896    mov         esi,dword ptr [eax+1EC];TCMBtn.....................................FCanvas:TCanvas
 0008B89C    xor         edx,edx
 0008B89E    mov         eax,dword ptr [esi+14];TCanvas.Brush:TBrush
 0008B8A1    call        TBrush.SetStyle
 0008B8A6    mov         eax,dword ptr [ebx]
 0008B8A8    mov         edx,dword ptr [eax+64];TCMBtn.FColor:TColor
 0008B8AB    mov         eax,dword ptr [esi+14];TCanvas.Brush:TBrush
 0008B8AE    call        TBrush.SetColor
 0008B8B3    mov         edx,8000000F
 0008B8B8    mov         eax,dword ptr [esi+10];TCanvas.Pen:TPen
 0008B8BB    call        TPen.SetColor
 0008B8C0    mov         eax,dword ptr [ebx]
 0008B8C2    mov         eax,dword ptr [eax+38];TCMBtn.Width:Integer
 0008B8C5    push        eax
 0008B8C6    mov         eax,dword ptr [ebx]
 0008B8C8    mov         eax,dword ptr [eax+3C];TCMBtn.Height:Integer
 0008B8CB    push        eax
 0008B8CC    mov         eax,dword ptr [ebx]
 0008B8CE    mov         eax,dword ptr [eax+1EC];TCMBtn......................................FCanvas:TCanvas
 0008B8D4    xor         ecx,ecx
 0008B8D6    xor         edx,edx
 0008B8D8    call        TCanvas.Rectangle
 0008B8DD    mov         eax,dword ptr [ebx]
 0008B8DF    test        byte ptr [eax+20],10;TCMBtn.FComponentState:TComponentState
>0008B8E3    je          0008B915
 0008B8E5    mov         eax,dword ptr [ebx]
 0008B8E7    call        0008AC4C
 0008B8EC    push        80000010
 0008B8F1    mov         eax,dword ptr [ebx]
 0008B8F3    movzx       eax,byte ptr [eax+209];TCMBtn.BevelWidth:TBevelW
 0008B8FA    push        eax
 0008B8FB    mov         eax,dword ptr [ebx]
 0008B8FD    lea         edx,[eax+218];TCMBtn.?f218:?
 0008B903    mov         eax,dword ptr [ebx]
 0008B905    mov         eax,dword ptr [eax+1EC];TCMBtn.......................................FCanvas:TCanvas
 0008B90B    mov         ecx,80000014
 0008B910    call        Frame3D
 0008B915    lea         ecx,[ebp-3C]
 0008B918    mov         edx,dword ptr [ebp-4]
 0008B91B    mov         eax,dword ptr [ebx]
 0008B91D    call        0008B6C0
 0008B922    mov         eax,dword ptr [ebx]
 0008B924    cmp         byte ptr [eax+200],0;TCMBtn.Enabled:Boolean
>0008B92B    je          0008BA15
 0008B931    mov         eax,dword ptr [ebx]
 0008B933    cmp         byte ptr [eax+214],0;TCMBtn.?f214:byte
>0008B93A    je          0008B983
 0008B93C    push        ebp
 0008B93D    lea         edx,[ebp-5C]
 0008B940    mov         eax,1
 0008B945    call        0008B804
 0008B94A    pop         ecx
 0008B94B    lea         esi,[ebp-5C]
 0008B94E    lea         edi,[ebp-4C]
 0008B951    mov         ecx,4
 0008B956    rep movs    dword ptr [edi],dword ptr [esi]
 0008B958    push        80000010
 0008B95D    mov         eax,dword ptr [ebx]
 0008B95F    movzx       eax,byte ptr [eax+209];TCMBtn.BevelWidth:TBevelW
 0008B966    push        eax
 0008B967    mov         eax,dword ptr [ebx]
 0008B969    lea         edx,[eax+218];TCMBtn.?f218:?
 0008B96F    mov         eax,dword ptr [ebx]
 0008B971    mov         eax,dword ptr [eax+1EC];TCMBtn........................................FCanvas:TCanvas
 0008B977    mov         ecx,80000014
 0008B97C    call        Frame3D
>0008B981    jmp         0008B9D0
 0008B983    push        ebp
 0008B984    mov         eax,dword ptr [ebx]
 0008B986    mov         edx,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 0008B98C    mov         eax,dword ptr [ebx]
 0008B98E    call        0008A9A4
 0008B993    lea         edx,[ebp-5C]
 0008B996    call        0008B804
 0008B99B    pop         ecx
 0008B99C    lea         esi,[ebp-5C]
 0008B99F    lea         edi,[ebp-4C]
 0008B9A2    mov         ecx,4
 0008B9A7    rep movs    dword ptr [edi],dword ptr [esi]
 0008B9A9    mov         eax,dword ptr [ebx]
 0008B9AB    mov         eax,dword ptr [eax+64];TCMBtn.FColor:TColor
 0008B9AE    push        eax
 0008B9AF    mov         edx,dword ptr [ebx]
 0008B9B1    movzx       edx,byte ptr [edx+209];TCMBtn.BevelWidth:TBevelW
 0008B9B8    push        edx
 0008B9B9    mov         ecx,eax
 0008B9BB    mov         eax,dword ptr [ebx]
 0008B9BD    lea         edx,[eax+218];TCMBtn.?f218:?
 0008B9C3    mov         eax,dword ptr [ebx]
 0008B9C5    mov         eax,dword ptr [eax+1EC];TCMBtn.........................................FCanvas:TCanvas
 0008B9CB    call        Frame3D
 0008B9D0    mov         eax,dword ptr [ebx]
 0008B9D2    cmp         dword ptr [eax+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008B9D9    je          0008BA90
 0008B9DF    mov         eax,dword ptr [ebx]
 0008B9E1    cmp         byte ptr [eax+213],0;TCMBtn.PopupMark:Boolean
>0008B9E8    je          0008BA90
 0008B9EE    mov         edx,dword ptr [ebx]
 0008B9F0    mov         edx,dword ptr [edx+58];TCMBtn.FFont:TFont
 0008B9F3    mov         edx,dword ptr [edx+14];TFont.Color:TColor
 0008B9F6    push        edx
 0008B9F7    mov         edx,dword ptr [ebx]
 0008B9F9    mov         edx,dword ptr [edx+38];TCMBtn.Width:Integer
 0008B9FC    mov         eax,dword ptr [ebx]
 0008B9FE    movzx       eax,byte ptr [eax+210];TCMBtn.Margin:TMargin
 0008BA05    sub         edx,eax
 0008BA07    sub         edx,7
 0008BA0A    mov         ecx,eax
 0008BA0C    mov         eax,dword ptr [ebx]
 0008BA0E    call        0008B668
>0008BA13    jmp         0008BA90
 0008BA15    push        ebp
 0008BA16    lea         edx,[ebp-5C]
 0008BA19    mov         eax,2
 0008BA1E    call        0008B804
 0008BA23    pop         ecx
 0008BA24    lea         esi,[ebp-5C]
 0008BA27    lea         edi,[ebp-4C]
 0008BA2A    mov         ecx,4
 0008BA2F    rep movs    dword ptr [edi],dword ptr [esi]
 0008BA31    mov         eax,dword ptr [ebx]
 0008BA33    cmp         dword ptr [eax+204],0;TCMBtn.PopupMenu:TPopupMenu
>0008BA3A    je          0008BA90
 0008BA3C    mov         eax,dword ptr [ebx]
 0008BA3E    cmp         byte ptr [eax+213],0;TCMBtn.PopupMark:Boolean
>0008BA45    je          0008BA90
 0008BA47    push        80000014
 0008BA4C    mov         edx,dword ptr [ebx]
 0008BA4E    mov         edx,dword ptr [edx+38];TCMBtn.Width:Integer
 0008BA51    mov         eax,dword ptr [ebx]
 0008BA53    mov         al,byte ptr [eax+210];TCMBtn.Margin:TMargin
 0008BA59    xor         ecx,ecx
 0008BA5B    mov         cl,al
 0008BA5D    sub         edx,ecx
 0008BA5F    sub         edx,7
 0008BA62    inc         edx
 0008BA63    xor         ecx,ecx
 0008BA65    mov         cl,al
 0008BA67    inc         ecx
 0008BA68    mov         eax,dword ptr [ebx]
 0008BA6A    call        0008B668
 0008BA6F    push        80000010
 0008BA74    mov         edx,dword ptr [ebx]
 0008BA76    mov         edx,dword ptr [edx+38];TCMBtn.Width:Integer
 0008BA79    mov         eax,dword ptr [ebx]
 0008BA7B    movzx       eax,byte ptr [eax+210];TCMBtn.Margin:TMargin
 0008BA82    sub         edx,eax
 0008BA84    sub         edx,7
 0008BA87    mov         ecx,eax
 0008BA89    mov         eax,dword ptr [ebx]
 0008BA8B    call        0008B668
 0008BA90    lea         eax,[ebp-4C]
 0008BA93    push        eax
 0008BA94    mov         eax,dword ptr [ebx]
 0008BA96    mov         esi,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 0008BA9C    mov         eax,esi
 0008BA9E    call        TBitmap.GetCanvas
 0008BAA3    xor         ecx,ecx
 0008BAA5    xor         edx,edx
 0008BAA7    call        TCanvas.GetPixel
 0008BAAC    call        ColorToRGB
 0008BAB1    push        eax
 0008BAB2    mov         ecx,esi
 0008BAB4    lea         edx,[ebp-3C]
 0008BAB7    mov         eax,dword ptr [ebx]
 0008BAB9    mov         eax,dword ptr [eax+1EC];TCMBtn..........................................FCanvas:TCanvas
 0008BABF    call        TCanvas.BrushCopy
 0008BAC4    lea         edx,[ebp-1C]
 0008BAC7    lea         ecx,[ebp-3C]
 0008BACA    mov         eax,dword ptr [ebx]
 0008BACC    call        0008B20C
 0008BAD1    lea         esi,[ebp-1C]
 0008BAD4    lea         edi,[ebp-2C]
 0008BAD7    mov         ecx,4
 0008BADC    rep movs    dword ptr [edi],dword ptr [esi]
 0008BADE    lea         eax,[ebp-0C]
 0008BAE1    push        eax
 0008BAE2    lea         edx,[ebp-60]
 0008BAE5    mov         eax,dword ptr [ebx]
 0008BAE7    call        TControl.GetText
 0008BAEC    mov         edx,dword ptr [ebp-60]
 0008BAEF    lea         ecx,[ebp-2C]
 0008BAF2    mov         eax,dword ptr [ebx]
 0008BAF4    call        0008B364
 0008BAF9    mov         eax,dword ptr [ebp-14]
 0008BAFC    sub         eax,dword ptr [ebp-24]
 0008BAFF    sar         eax,1
>0008BB01    jns         0008BB06
 0008BB03    adc         eax,0
 0008BB06    mov         edx,dword ptr [ebp-10]
 0008BB09    sub         edx,dword ptr [ebp-20]
 0008BB0C    sar         edx,1
>0008BB0E    jns         0008BB13
 0008BB10    adc         edx,0
 0008BB13    add         dword ptr [ebp-28],edx
 0008BB16    add         dword ptr [ebp-20],edx
 0008BB19    add         dword ptr [ebp-2C],eax
 0008BB1C    add         dword ptr [ebp-24],eax
 0008BB1F    lea         ecx,[ebp-2C]
 0008BB22    mov         edx,dword ptr [ebp-0C]
 0008BB25    mov         eax,dword ptr [ebx]
 0008BB27    call        0008B4CC
 0008BB2C    xor         eax,eax
 0008BB2E    pop         edx
 0008BB2F    pop         ecx
 0008BB30    pop         ecx
 0008BB31    mov         dword ptr fs:[eax],edx
 0008BB34    push        8BB51
 0008BB39    lea         eax,[ebp-60]
 0008BB3C    call        @LStrClr
 0008BB41    lea         eax,[ebp-0C]
 0008BB44    call        @LStrClr
 0008BB49    ret
>0008BB4A    jmp         @HandleFinally
>0008BB4F    jmp         0008BB39
 0008BB51    pop         edi
 0008BB52    pop         esi
 0008BB53    pop         ebx
 0008BB54    mov         esp,ebp
 0008BB56    pop         ebp
 0008BB57    ret
*}
end;

end.