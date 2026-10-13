//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Print;

interface

uses
  SysUtils, Classes, ExtCtrls, StdCtrls, CMkomp40, CMrpt40;

type
  TFormPrint = class(TForm)
  published
    Panel1:TPanel;//f2C4
    ButtonPreviewPrint:TButton;//f2C8
    ButtonCancel:TButton;//f2CC
    ButtonHelp:TButton;//f2D0
    GroupBoxPrint:TGroupBox;//f2D4
    RadioButtonCurPage:TRadioButton;//f2D8
    RadioButtonCurSelection:TRadioButton;//f2DC
    ComboBoxPrinters:TComboBox;//f2E0
    Label1:TLabel;//f2E4
    RadioButtonAllPages:TRadioButton;//f2E8
    GroupBoxMargins:TGroupBox;//f2EC
    Label3:TLabel;//f2F0
    CMNumEditMarginLeft:TCMNumEdit;//f2F4
    Label2:TLabel;//f2F8
    CMNumEditMarginRight:TCMNumEdit;//f2FC
    Label4:TLabel;//f300
    CMNumEditMarginTop:TCMNumEdit;//f304
    Label5:TLabel;//f308
    CMNumEditMarginBottom:TCMNumEdit;//f30C
    Label7:TLabel;//f310
    ComboBoxFontSize:TComboBox;//f314
    CheckBoxOrientationLandscape:TCheckBox;//f318
    CheckBoxOffsetDecimal:TCheckBox;//f31C
    Label8:TLabel;//f320
    ComboBoxBytesPerRow:TComboBox;//f324
    CheckBoxTextBelow:TCheckBox;//f328
    CheckBoxOutputToFile:TCheckBox;//f32C
    Label6:TLabel;//f330
    ComboBoxUnit:TComboBox;//f334
    procedure ComboBoxUnitChange;//000A4234
    procedure ButtonHelpClick(Sender:TObject);//000A43C0
    procedure ComboBoxBytesPerRowKeyPress(Sender:TObject; var Key:Char);//000A43D4
    procedure ComboBoxPrintersChange;//000A431C
    procedure ButtonPreviewPrintClick(Sender:TObject);//000A4EE0
    procedure FormCreate(Sender:TObject);//000A4340
    procedure CMNumEditMarginLeftExit(Sender:TObject);//000A4314
    procedure FormDestroy(Sender:TObject);//000A43BC
  public
    f338:TCMReport;//f338
    f33C:String;//f33C
  end;
    //procedure sub_000A383C(?:?; ?:TStrings);//000A383C
    procedure sub_000A3894(?:TFormPrint);//000A3894
    //procedure sub_000A3D58(?:?);//000A3D58
    procedure sub_000A40C4(?:TFormPrint);//000A40C4
    //procedure sub_000A41BC(?:TCMNumEdit; ?:?);//000A41BC
    //procedure sub_000A41F8(?:TCMNumEdit; ?:?);//000A41F8
    //procedure sub_000A43E8(?:?);//000A43E8
    //function sub_000A4618(?:?):?;//000A4618
    //procedure sub_000A47BC(?:?);//000A47BC
    //procedure sub_000A495C(?:?);//000A495C
    //procedure sub_000A4AB4(?:?);//000A4AB4
    //procedure sub_000A4DD4(?:?);//000A4DD4

implementation

{$R *.DFM}

//000A383C
{*procedure sub_000A383C(?:?; ?:TStrings);
begin
 000A383C    push        ebx
 000A383D    mov         ebx,eax
 000A383F    or          edx,0FFFFFFFF
 000A3842    mov         eax,dword ptr [ebx+2E0]
 000A3848    call        TCustomComboBox.SetItemIndex
 000A384D    xor         edx,edx
 000A384F    mov         eax,dword ptr [ebx+2E0]
 000A3855    mov         ecx,dword ptr [eax]
 000A3857    call        dword ptr [ecx+60]
 000A385A    mov         dl,1
 000A385C    mov         eax,dword ptr [ebx+32C]
 000A3862    mov         ecx,dword ptr [eax]
 000A3864    call        dword ptr [ecx+0BC]
 000A386A    xor         edx,edx
 000A386C    mov         eax,dword ptr [ebx+32C]
 000A3872    mov         ecx,dword ptr [eax]
 000A3874    call        dword ptr [ecx+60]
 000A3877    xor         edx,edx
 000A3879    mov         eax,dword ptr [ebx+334]
 000A387F    mov         ecx,dword ptr [eax]
 000A3881    call        dword ptr [ecx+60]
 000A3884    xor         edx,edx
 000A3886    mov         eax,dword ptr [ebx+2F4]
 000A388C    mov         ecx,dword ptr [eax]
 000A388E    call        dword ptr [ecx+60]
 000A3891    pop         ebx
 000A3892    ret
end;*}

//000A3894
procedure sub_000A3894(?:TFormPrint);
begin
{*
 000A3894    push        ebp
 000A3895    mov         ebp,esp
 000A3897    add         esp,0FFFFFFF4
 000A389A    push        ebx
 000A389B    push        esi
 000A389C    xor         edx,edx
 000A389E    mov         dword ptr [ebp-8],edx
 000A38A1    mov         ebx,eax
 000A38A3    xor         eax,eax
 000A38A5    push        ebp
 000A38A6    push        0A3C25
 000A38AB    push        dword ptr fs:[eax]
 000A38AE    mov         dword ptr fs:[eax],esp
 000A38B1    lea         eax,[ebp-8]
 000A38B4    call        00086D5C
 000A38B9    mov         ecx,dword ptr [ebp-8]
 000A38BC    mov         dl,1
 000A38BE    mov         eax,[0007792C];TIniFile
 000A38C3    call        TCustomIniFile.Create;TIniFile.Create
 000A38C8    mov         dword ptr [ebp-4],eax
 000A38CB    xor         eax,eax
 000A38CD    push        ebp
 000A38CE    push        0A3C08
 000A38D3    push        dword ptr fs:[eax]
 000A38D6    mov         dword ptr fs:[eax],esp
 000A38D9    push        0
 000A38DB    mov         ecx,0A3C3C;'Unit'
 000A38E0    mov         edx,0A3C4C;'Printing'
 000A38E5    mov         eax,dword ptr [ebp-4]
 000A38E8    mov         esi,dword ptr [eax]
 000A38EA    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A38ED    mov         edx,eax
 000A38EF    mov         eax,dword ptr [ebx+334]
 000A38F5    call        TCustomComboBox.SetItemIndex
 000A38FA    mov         eax,dword ptr [ebx+334]
 000A3900    call        TCustomComboBox.GetItemIndex
 000A3905    test        eax,eax
>000A3907    jne         000A39E6
 000A390D    push        5DC
 000A3912    mov         edx,0A3C4C;'Printing'
 000A3917    mov         ecx,0A3C60;'MarginLeft'
 000A391C    mov         eax,dword ptr [ebp-4]
 000A391F    mov         esi,dword ptr [eax]
 000A3921    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3924    mov         dword ptr [ebp-0C],eax
 000A3927    fild        dword ptr [ebp-0C]
 000A392A    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A3930    add         esp,0FFFFFFF4
 000A3933    fstp        tbyte ptr [esp]
 000A3936    wait
 000A3937    mov         eax,dword ptr [ebx+2F4]
 000A393D    call        TCMNumEdit.SetValue
 000A3942    push        5DC
 000A3947    mov         edx,0A3C4C;'Printing'
 000A394C    mov         ecx,0A3C78;'MarginRight'
 000A3951    mov         eax,dword ptr [ebp-4]
 000A3954    mov         esi,dword ptr [eax]
 000A3956    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3959    mov         dword ptr [ebp-0C],eax
 000A395C    fild        dword ptr [ebp-0C]
 000A395F    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A3965    add         esp,0FFFFFFF4
 000A3968    fstp        tbyte ptr [esp]
 000A396B    wait
 000A396C    mov         eax,dword ptr [ebx+2FC]
 000A3972    call        TCMNumEdit.SetValue
 000A3977    push        5DC
 000A397C    mov         edx,0A3C4C;'Printing'
 000A3981    mov         ecx,0A3C8C;'MarginTop'
 000A3986    mov         eax,dword ptr [ebp-4]
 000A3989    mov         esi,dword ptr [eax]
 000A398B    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A398E    mov         dword ptr [ebp-0C],eax
 000A3991    fild        dword ptr [ebp-0C]
 000A3994    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A399A    add         esp,0FFFFFFF4
 000A399D    fstp        tbyte ptr [esp]
 000A39A0    wait
 000A39A1    mov         eax,dword ptr [ebx+304]
 000A39A7    call        TCMNumEdit.SetValue
 000A39AC    push        5DC
 000A39B1    mov         edx,0A3C4C;'Printing'
 000A39B6    mov         ecx,0A3CA0;'MarginBottom'
 000A39BB    mov         eax,dword ptr [ebp-4]
 000A39BE    mov         esi,dword ptr [eax]
 000A39C0    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A39C3    mov         dword ptr [ebp-0C],eax
 000A39C6    fild        dword ptr [ebp-0C]
 000A39C9    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A39CF    add         esp,0FFFFFFF4
 000A39D2    fstp        tbyte ptr [esp]
 000A39D5    wait
 000A39D6    mov         eax,dword ptr [ebx+30C]
 000A39DC    call        TCMNumEdit.SetValue
>000A39E1    jmp         000A3AAE
 000A39E6    push        3B
 000A39E8    mov         edx,0A3C4C;'Printing'
 000A39ED    mov         ecx,0A3C60;'MarginLeft'
 000A39F2    mov         eax,dword ptr [ebp-4]
 000A39F5    mov         esi,dword ptr [eax]
 000A39F7    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A39FA    mov         dword ptr [ebp-0C],eax
 000A39FD    fild        dword ptr [ebp-0C]
 000A3A00    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A3A06    add         esp,0FFFFFFF4
 000A3A09    fstp        tbyte ptr [esp]
 000A3A0C    wait
 000A3A0D    mov         eax,dword ptr [ebx+2F4]
 000A3A13    call        TCMNumEdit.SetValue
 000A3A18    push        3B
 000A3A1A    mov         edx,0A3C4C;'Printing'
 000A3A1F    mov         ecx,0A3C78;'MarginRight'
 000A3A24    mov         eax,dword ptr [ebp-4]
 000A3A27    mov         esi,dword ptr [eax]
 000A3A29    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3A2C    mov         dword ptr [ebp-0C],eax
 000A3A2F    fild        dword ptr [ebp-0C]
 000A3A32    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A3A38    add         esp,0FFFFFFF4
 000A3A3B    fstp        tbyte ptr [esp]
 000A3A3E    wait
 000A3A3F    mov         eax,dword ptr [ebx+2FC]
 000A3A45    call        TCMNumEdit.SetValue
 000A3A4A    push        3B
 000A3A4C    mov         edx,0A3C4C;'Printing'
 000A3A51    mov         ecx,0A3C8C;'MarginTop'
 000A3A56    mov         eax,dword ptr [ebp-4]
 000A3A59    mov         esi,dword ptr [eax]
 000A3A5B    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3A5E    mov         dword ptr [ebp-0C],eax
 000A3A61    fild        dword ptr [ebp-0C]
 000A3A64    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A3A6A    add         esp,0FFFFFFF4
 000A3A6D    fstp        tbyte ptr [esp]
 000A3A70    wait
 000A3A71    mov         eax,dword ptr [ebx+304]
 000A3A77    call        TCMNumEdit.SetValue
 000A3A7C    push        3B
 000A3A7E    mov         edx,0A3C4C;'Printing'
 000A3A83    mov         ecx,0A3CA0;'MarginBottom'
 000A3A88    mov         eax,dword ptr [ebp-4]
 000A3A8B    mov         esi,dword ptr [eax]
 000A3A8D    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3A90    mov         dword ptr [ebp-0C],eax
 000A3A93    fild        dword ptr [ebp-0C]
 000A3A96    fdiv        dword ptr ds:[0A3C6C];100:Single
 000A3A9C    add         esp,0FFFFFFF4
 000A3A9F    fstp        tbyte ptr [esp]
 000A3AA2    wait
 000A3AA3    mov         eax,dword ptr [ebx+30C]
 000A3AA9    call        TCMNumEdit.SetValue
 000A3AAE    call        Printer
 000A3AB3    call        TPrinter.GetPrinters
 000A3AB8    mov         edx,dword ptr [eax]
 000A3ABA    call        dword ptr [edx+14];TStrings.GetCount
 000A3ABD    test        eax,eax
>000A3ABF    jne         000A3ACA
 000A3AC1    mov         eax,ebx
 000A3AC3    call        000A383C
>000A3AC8    jmp         000A3B3D
 000A3ACA    call        000A32E4
 000A3ACF    push        eax
 000A3AD0    mov         edx,0A3C4C;'Printing'
 000A3AD5    mov         ecx,0A3CB8;'PrinterIndex'
 000A3ADA    mov         eax,dword ptr [ebp-4]
 000A3ADD    mov         esi,dword ptr [eax]
 000A3ADF    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3AE2    mov         esi,eax
 000A3AE4    test        esi,esi
>000A3AE6    jl          000A3B0C
 000A3AE8    mov         eax,dword ptr [ebx+2E0]
 000A3AEE    mov         eax,dword ptr [eax+1EC]
 000A3AF4    mov         edx,dword ptr [eax]
 000A3AF6    call        dword ptr [edx+14]
 000A3AF9    cmp         esi,eax
>000A3AFB    jge         000A3B0C
 000A3AFD    mov         eax,dword ptr [ebx+2E0]
 000A3B03    mov         edx,esi
 000A3B05    call        TCustomComboBox.SetItemIndex
>000A3B0A    jmp         000A3B19
 000A3B0C    mov         eax,dword ptr [ebx+2E0]
 000A3B12    xor         edx,edx
 000A3B14    call        TCustomComboBox.SetItemIndex
 000A3B19    push        0
 000A3B1B    mov         edx,0A3C4C;'Printing'
 000A3B20    mov         ecx,0A3CD0;'OutputToFile'
 000A3B25    mov         eax,dword ptr [ebp-4]
 000A3B28    mov         esi,dword ptr [eax]
 000A3B2A    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000A3B2D    mov         edx,eax
 000A3B2F    mov         eax,dword ptr [ebx+32C]
 000A3B35    mov         ecx,dword ptr [eax]
 000A3B37    call        dword ptr [ecx+0BC]
 000A3B3D    push        1
 000A3B3F    mov         edx,0A3C4C;'Printing'
 000A3B44    mov         ecx,0A3CE8;'FontSizeIndex'
 000A3B49    mov         eax,dword ptr [ebp-4]
 000A3B4C    mov         esi,dword ptr [eax]
 000A3B4E    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000A3B51    mov         edx,eax
 000A3B53    mov         eax,dword ptr [ebx+314]
 000A3B59    call        TCustomComboBox.SetItemIndex
 000A3B5E    push        0A3D00;'16'
 000A3B63    lea         eax,[ebp-8]
 000A3B66    push        eax
 000A3B67    mov         edx,0A3C4C;'Printing'
 000A3B6C    mov         ecx,0A3D0C;'BytesPerRow'
 000A3B71    mov         eax,dword ptr [ebp-4]
 000A3B74    mov         esi,dword ptr [eax]
 000A3B76    call        dword ptr [esi];TIniFile.ReadString
 000A3B78    mov         edx,dword ptr [ebp-8]
 000A3B7B    mov         eax,dword ptr [ebx+324]
 000A3B81    call        TControl.SetText
 000A3B86    push        0
 000A3B88    mov         edx,0A3C4C;'Printing'
 000A3B8D    mov         ecx,0A3D20;'Landscape'
 000A3B92    mov         eax,dword ptr [ebp-4]
 000A3B95    mov         esi,dword ptr [eax]
 000A3B97    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000A3B9A    mov         edx,eax
 000A3B9C    mov         eax,dword ptr [ebx+318]
 000A3BA2    mov         ecx,dword ptr [eax]
 000A3BA4    call        dword ptr [ecx+0BC]
 000A3BAA    push        0
 000A3BAC    mov         edx,0A3C4C;'Printing'
 000A3BB1    mov         ecx,0A3D34;'OffsetDecimal'
 000A3BB6    mov         eax,dword ptr [ebp-4]
 000A3BB9    mov         esi,dword ptr [eax]
 000A3BBB    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000A3BBE    mov         edx,eax
 000A3BC0    mov         eax,dword ptr [ebx+31C]
 000A3BC6    mov         ecx,dword ptr [eax]
 000A3BC8    call        dword ptr [ecx+0BC]
 000A3BCE    push        0
 000A3BD0    mov         edx,0A3C4C;'Printing'
 000A3BD5    mov         ecx,0A3D4C;'TextBelow'
 000A3BDA    mov         eax,dword ptr [ebp-4]
 000A3BDD    mov         esi,dword ptr [eax]
 000A3BDF    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000A3BE2    mov         edx,eax
 000A3BE4    mov         eax,dword ptr [ebx+328]
 000A3BEA    mov         ecx,dword ptr [eax]
 000A3BEC    call        dword ptr [ecx+0BC]
 000A3BF2    xor         eax,eax
 000A3BF4    pop         edx
 000A3BF5    pop         ecx
 000A3BF6    pop         ecx
 000A3BF7    mov         dword ptr fs:[eax],edx
 000A3BFA    push        0A3C0F
 000A3BFF    mov         eax,dword ptr [ebp-4]
 000A3C02    call        TObject.Free
 000A3C07    ret
>000A3C08    jmp         @HandleFinally
>000A3C0D    jmp         000A3BFF
 000A3C0F    xor         eax,eax
 000A3C11    pop         edx
 000A3C12    pop         ecx
 000A3C13    pop         ecx
 000A3C14    mov         dword ptr fs:[eax],edx
 000A3C17    push        0A3C2C
 000A3C1C    lea         eax,[ebp-8]
 000A3C1F    call        @LStrClr
 000A3C24    ret
>000A3C25    jmp         @HandleFinally
>000A3C2A    jmp         000A3C1C
 000A3C2C    pop         esi
 000A3C2D    pop         ebx
 000A3C2E    mov         esp,ebp
 000A3C30    pop         ebp
 000A3C31    ret
*}
end;

//000A3D58
{*procedure sub_000A3D58(?:?);
begin
 000A3D58    push        ebp
 000A3D59    mov         ebp,esp
 000A3D5B    push        0
 000A3D5D    push        0
 000A3D5F    push        0
 000A3D61    push        ebx
 000A3D62    push        esi
 000A3D63    mov         ebx,eax
 000A3D65    xor         eax,eax
 000A3D67    push        ebp
 000A3D68    push        0A3F80
 000A3D6D    push        dword ptr fs:[eax]
 000A3D70    mov         dword ptr fs:[eax],esp
 000A3D73    lea         eax,[ebp-8]
 000A3D76    call        00086D5C
 000A3D7B    mov         ecx,dword ptr [ebp-8]
 000A3D7E    mov         dl,1
 000A3D80    mov         eax,[0007792C];TIniFile
 000A3D85    call        TCustomIniFile.Create;TIniFile.Create
 000A3D8A    mov         dword ptr [ebp-4],eax
 000A3D8D    xor         eax,eax
 000A3D8F    push        ebp
 000A3D90    push        0A3F5B
 000A3D95    push        dword ptr fs:[eax]
 000A3D98    mov         dword ptr fs:[eax],esp
 000A3D9B    mov         eax,dword ptr [ebx+334]
 000A3DA1    call        TCustomComboBox.GetItemIndex
 000A3DA6    push        eax
 000A3DA7    mov         ecx,0A3F98;'Unit'
 000A3DAC    mov         edx,0A3FA8;'Printing'
 000A3DB1    mov         eax,dword ptr [ebp-4]
 000A3DB4    mov         esi,dword ptr [eax]
 000A3DB6    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3DB9    mov         eax,dword ptr [ebx+2F4]
 000A3DBF    fld         tbyte ptr [eax+224]
 000A3DC5    fmul        dword ptr ds:[0A3FB4];100:Single
 000A3DCB    call        @ROUND
 000A3DD0    push        eax
 000A3DD1    mov         edx,0A3FA8;'Printing'
 000A3DD6    mov         ecx,0A3FC0;'MarginLeft'
 000A3DDB    mov         eax,dword ptr [ebp-4]
 000A3DDE    mov         esi,dword ptr [eax]
 000A3DE0    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3DE3    mov         eax,dword ptr [ebx+2FC]
 000A3DE9    fld         tbyte ptr [eax+224]
 000A3DEF    fmul        dword ptr ds:[0A3FB4];100:Single
 000A3DF5    call        @ROUND
 000A3DFA    push        eax
 000A3DFB    mov         edx,0A3FA8;'Printing'
 000A3E00    mov         ecx,0A3FD4;'MarginRight'
 000A3E05    mov         eax,dword ptr [ebp-4]
 000A3E08    mov         esi,dword ptr [eax]
 000A3E0A    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3E0D    mov         eax,dword ptr [ebx+304]
 000A3E13    fld         tbyte ptr [eax+224]
 000A3E19    fmul        dword ptr ds:[0A3FB4];100:Single
 000A3E1F    call        @ROUND
 000A3E24    push        eax
 000A3E25    mov         edx,0A3FA8;'Printing'
 000A3E2A    mov         ecx,0A3FE8;'MarginTop'
 000A3E2F    mov         eax,dword ptr [ebp-4]
 000A3E32    mov         esi,dword ptr [eax]
 000A3E34    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3E37    mov         eax,dword ptr [ebx+30C]
 000A3E3D    fld         tbyte ptr [eax+224]
 000A3E43    fmul        dword ptr ds:[0A3FB4];100:Single
 000A3E49    call        @ROUND
 000A3E4E    push        eax
 000A3E4F    mov         edx,0A3FA8;'Printing'
 000A3E54    mov         ecx,0A3FFC;'MarginBottom'
 000A3E59    mov         eax,dword ptr [ebp-4]
 000A3E5C    mov         esi,dword ptr [eax]
 000A3E5E    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3E61    mov         eax,dword ptr [ebx+2E0]
 000A3E67    call        TCustomComboBox.GetItemIndex
 000A3E6C    push        eax
 000A3E6D    mov         edx,0A3FA8;'Printing'
 000A3E72    mov         ecx,0A4014;'PrinterIndex'
 000A3E77    mov         eax,dword ptr [ebp-4]
 000A3E7A    mov         esi,dword ptr [eax]
 000A3E7C    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3E7F    mov         eax,dword ptr [ebx+314]
 000A3E85    call        TCustomComboBox.GetItemIndex
 000A3E8A    push        eax
 000A3E8B    mov         edx,0A3FA8;'Printing'
 000A3E90    mov         ecx,0A402C;'FontSizeIndex'
 000A3E95    mov         eax,dword ptr [ebp-4]
 000A3E98    mov         esi,dword ptr [eax]
 000A3E9A    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000A3E9D    lea         edx,[ebp-0C]
 000A3EA0    mov         eax,dword ptr [ebx+324]
 000A3EA6    call        TControl.GetText
 000A3EAB    mov         eax,dword ptr [ebp-0C]
 000A3EAE    push        eax
 000A3EAF    mov         edx,0A3FA8;'Printing'
 000A3EB4    mov         ecx,0A4044;'BytesPerRow'
 000A3EB9    mov         eax,dword ptr [ebp-4]
 000A3EBC    mov         esi,dword ptr [eax]
 000A3EBE    call        dword ptr [esi+4];TIniFile.WriteString
 000A3EC1    mov         eax,dword ptr [ebx+318]
 000A3EC7    mov         edx,dword ptr [eax]
 000A3EC9    call        dword ptr [edx+0B8]
 000A3ECF    push        eax
 000A3ED0    mov         edx,0A3FA8;'Printing'
 000A3ED5    mov         ecx,0A4058;'Landscape'
 000A3EDA    mov         eax,dword ptr [ebp-4]
 000A3EDD    mov         esi,dword ptr [eax]
 000A3EDF    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000A3EE2    mov         eax,dword ptr [ebx+31C]
 000A3EE8    mov         edx,dword ptr [eax]
 000A3EEA    call        dword ptr [edx+0B8]
 000A3EF0    push        eax
 000A3EF1    mov         edx,0A3FA8;'Printing'
 000A3EF6    mov         ecx,0A406C;'OffsetDecimal'
 000A3EFB    mov         eax,dword ptr [ebp-4]
 000A3EFE    mov         esi,dword ptr [eax]
 000A3F00    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000A3F03    mov         eax,dword ptr [ebx+328]
 000A3F09    mov         edx,dword ptr [eax]
 000A3F0B    call        dword ptr [edx+0B8]
 000A3F11    push        eax
 000A3F12    mov         edx,0A3FA8;'Printing'
 000A3F17    mov         ecx,0A4084;'TextBelow'
 000A3F1C    mov         eax,dword ptr [ebp-4]
 000A3F1F    mov         esi,dword ptr [eax]
 000A3F21    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000A3F24    mov         eax,dword ptr [ebx+32C]
 000A3F2A    mov         edx,dword ptr [eax]
 000A3F2C    call        dword ptr [edx+0B8]
 000A3F32    push        eax
 000A3F33    mov         edx,0A3FA8;'Printing'
 000A3F38    mov         ecx,0A4098;'OutputToFile'
 000A3F3D    mov         eax,dword ptr [ebp-4]
 000A3F40    mov         ebx,dword ptr [eax]
 000A3F42    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000A3F45    xor         eax,eax
 000A3F47    pop         edx
 000A3F48    pop         ecx
 000A3F49    pop         ecx
 000A3F4A    mov         dword ptr fs:[eax],edx
 000A3F4D    push        0A3F62
 000A3F52    mov         eax,dword ptr [ebp-4]
 000A3F55    call        TObject.Free
 000A3F5A    ret
>000A3F5B    jmp         @HandleFinally
>000A3F60    jmp         000A3F52
 000A3F62    xor         eax,eax
 000A3F64    pop         edx
 000A3F65    pop         ecx
 000A3F66    pop         ecx
 000A3F67    mov         dword ptr fs:[eax],edx
 000A3F6A    push        0A3F87
 000A3F6F    lea         eax,[ebp-0C]
 000A3F72    call        @LStrClr
 000A3F77    lea         eax,[ebp-8]
 000A3F7A    call        @LStrClr
 000A3F7F    ret
>000A3F80    jmp         @HandleFinally
>000A3F85    jmp         000A3F6F
 000A3F87    pop         esi
 000A3F88    pop         ebx
 000A3F89    mov         esp,ebp
 000A3F8B    pop         ebp
 000A3F8C    ret
end;*}

//000A40C4
procedure sub_000A40C4(?:TFormPrint);
begin
{*
 000A40C4    push        ebx
 000A40C5    push        esi
 000A40C6    mov         ebx,eax
 000A40C8    mov         eax,dword ptr [ebx+338]
 000A40CE    test        eax,eax
>000A40D0    je          000A41B8
 000A40D6    mov         esi,eax
 000A40D8    mov         eax,dword ptr [ebx+334]
 000A40DE    call        TCustomComboBox.GetItemIndex
 000A40E3    mov         edx,eax
 000A40E5    mov         eax,esi
 000A40E7    call        TCMReport.SetMeasureUnit
 000A40EC    mov         eax,dword ptr [ebx+2F4]
 000A40F2    fld         tbyte ptr [eax+224]
 000A40F8    add         esp,0FFFFFFF8
 000A40FB    fstp        qword ptr [esp]
 000A40FE    wait
 000A40FF    mov         eax,esi
 000A4101    call        TCMReport.SetMarginLeft
 000A4106    mov         eax,dword ptr [ebx+2FC]
 000A410C    fld         tbyte ptr [eax+224]
 000A4112    add         esp,0FFFFFFF8
 000A4115    fstp        qword ptr [esp]
 000A4118    wait
 000A4119    mov         eax,esi
 000A411B    call        TCMReport.SetMarginRight
 000A4120    mov         eax,dword ptr [ebx+304]
 000A4126    fld         tbyte ptr [eax+224]
 000A412C    add         esp,0FFFFFFF8
 000A412F    fstp        qword ptr [esp]
 000A4132    wait
 000A4133    mov         eax,esi
 000A4135    call        TCMReport.SetMarginTop
 000A413A    mov         eax,dword ptr [ebx+30C]
 000A4140    fld         tbyte ptr [eax+224]
 000A4146    add         esp,0FFFFFFF8
 000A4149    fstp        qword ptr [esp]
 000A414C    wait
 000A414D    mov         eax,esi
 000A414F    call        TCMReport.SetMarginBottom
 000A4154    mov         eax,esi
 000A4156    call        TCMReport.GetMarginLeft
 000A415B    add         esp,0FFFFFFF4
 000A415E    fstp        tbyte ptr [esp]
 000A4161    wait
 000A4162    mov         eax,dword ptr [ebx+2F4]
 000A4168    call        TCMNumEdit.SetValue
 000A416D    mov         eax,esi
 000A416F    call        TCMReport.GetMarginRight
 000A4174    add         esp,0FFFFFFF4
 000A4177    fstp        tbyte ptr [esp]
 000A417A    wait
 000A417B    mov         eax,dword ptr [ebx+2FC]
 000A4181    call        TCMNumEdit.SetValue
 000A4186    mov         eax,esi
 000A4188    call        TCMReport.GetMarginTop
 000A418D    add         esp,0FFFFFFF4
 000A4190    fstp        tbyte ptr [esp]
 000A4193    wait
 000A4194    mov         eax,dword ptr [ebx+304]
 000A419A    call        TCMNumEdit.SetValue
 000A419F    mov         eax,esi
 000A41A1    call        TCMReport.GetMarginBottom
 000A41A6    add         esp,0FFFFFFF4
 000A41A9    fstp        tbyte ptr [esp]
 000A41AC    wait
 000A41AD    mov         eax,dword ptr [ebx+30C]
 000A41B3    call        TCMNumEdit.SetValue
 000A41B8    pop         esi
 000A41B9    pop         ebx
 000A41BA    ret
*}
end;

//000A41BC
{*procedure sub_000A41BC(?:TCMNumEdit; ?:?);
begin
 000A41BC    push        ebp
 000A41BD    mov         ebp,esp
 000A41BF    push        ebx
 000A41C0    push        esi
 000A41C1    mov         ebx,eax
 000A41C3    mov         eax,dword ptr [ebp+8]
 000A41C6    mov         eax,dword ptr [eax-4]
 000A41C9    mov         esi,dword ptr [eax+338]
 000A41CF    fld         tbyte ptr [ebx+224]
 000A41D5    add         esp,0FFFFFFF8
 000A41D8    fstp        qword ptr [esp]
 000A41DB    wait
 000A41DC    mov         eax,esi
 000A41DE    call        0009584C
 000A41E3    add         esp,0FFFFFFF4
 000A41E6    fstp        tbyte ptr [esp]
 000A41E9    wait
 000A41EA    mov         eax,ebx
 000A41EC    call        TCMNumEdit.SetValue
 000A41F1    pop         esi
 000A41F2    pop         ebx
 000A41F3    pop         ebp
 000A41F4    ret
end;*}

//000A41F8
{*procedure sub_000A41F8(?:TCMNumEdit; ?:?);
begin
 000A41F8    push        ebp
 000A41F9    mov         ebp,esp
 000A41FB    push        ebx
 000A41FC    push        esi
 000A41FD    mov         ebx,eax
 000A41FF    mov         eax,dword ptr [ebp+8]
 000A4202    mov         eax,dword ptr [eax-4]
 000A4205    mov         esi,dword ptr [eax+338]
 000A420B    fld         tbyte ptr [ebx+224]
 000A4211    add         esp,0FFFFFFF8
 000A4214    fstp        qword ptr [esp]
 000A4217    wait
 000A4218    mov         eax,esi
 000A421A    call        00095890
 000A421F    add         esp,0FFFFFFF4
 000A4222    fstp        tbyte ptr [esp]
 000A4225    wait
 000A4226    mov         eax,ebx
 000A4228    call        TCMNumEdit.SetValue
 000A422D    pop         esi
 000A422E    pop         ebx
 000A422F    pop         ebp
 000A4230    ret
end;*}

//000A4234
procedure TFormPrint.ComboBoxUnitChange;
begin
{*
 000A4234    push        ebp
 000A4235    mov         ebp,esp
 000A4237    push        ecx
 000A4238    push        ebx
 000A4239    mov         dword ptr [ebp-4],eax
 000A423C    mov         eax,dword ptr [ebp-4]
 000A423F    mov         eax,dword ptr [eax+338];TFormPrint.?f338:TCMReport
 000A4245    test        eax,eax
>000A4247    je          000A430D
 000A424D    mov         ebx,eax
 000A424F    mov         eax,dword ptr [ebp-4]
 000A4252    mov         eax,dword ptr [eax+334];TFormPrint.ComboBoxUnit:TComboBox
 000A4258    call        TCustomComboBox.GetItemIndex
 000A425D    test        eax,eax
>000A425F    jne         000A42B6
 000A4261    cmp         byte ptr [ebx+68],0
>000A4265    je          000A4305
 000A426B    push        ebp
 000A426C    mov         eax,dword ptr [ebp-4]
 000A426F    mov         eax,dword ptr [eax+2F4];TFormPrint.CMNumEditMarginLeft:TCMNumEdit
 000A4275    call        000A41F8
 000A427A    pop         ecx
 000A427B    push        ebp
 000A427C    mov         eax,dword ptr [ebp-4]
 000A427F    mov         eax,dword ptr [eax+2FC];TFormPrint.CMNumEditMarginRight:TCMNumEdit
 000A4285    call        000A41F8
 000A428A    pop         ecx
 000A428B    push        ebp
 000A428C    mov         eax,dword ptr [ebp-4]
 000A428F    mov         eax,dword ptr [eax+304];TFormPrint.CMNumEditMarginTop:TCMNumEdit
 000A4295    call        000A41F8
 000A429A    pop         ecx
 000A429B    push        ebp
 000A429C    mov         eax,dword ptr [ebp-4]
 000A429F    mov         eax,dword ptr [eax+30C];TFormPrint.CMNumEditMarginBottom:TCMNumEdit
 000A42A5    call        000A41F8
 000A42AA    pop         ecx
 000A42AB    xor         edx,edx
 000A42AD    mov         eax,ebx
 000A42AF    call        TCMReport.SetMeasureUnit
>000A42B4    jmp         000A4305
 000A42B6    cmp         byte ptr [ebx+68],1
>000A42BA    je          000A4305
 000A42BC    mov         dl,1
 000A42BE    mov         eax,ebx
 000A42C0    call        TCMReport.SetMeasureUnit
 000A42C5    push        ebp
 000A42C6    mov         eax,dword ptr [ebp-4]
 000A42C9    mov         eax,dword ptr [eax+2F4];TFormPrint.CMNumEditMarginLeft:TCMNumEdit
 000A42CF    call        000A41BC
 000A42D4    pop         ecx
 000A42D5    push        ebp
 000A42D6    mov         eax,dword ptr [ebp-4]
 000A42D9    mov         eax,dword ptr [eax+2FC];TFormPrint.CMNumEditMarginRight:TCMNumEdit
 000A42DF    call        000A41BC
 000A42E4    pop         ecx
 000A42E5    push        ebp
 000A42E6    mov         eax,dword ptr [ebp-4]
 000A42E9    mov         eax,dword ptr [eax+304];TFormPrint.CMNumEditMarginTop:TCMNumEdit
 000A42EF    call        000A41BC
 000A42F4    pop         ecx
 000A42F5    push        ebp
 000A42F6    mov         eax,dword ptr [ebp-4]
 000A42F9    mov         eax,dword ptr [eax+30C];TFormPrint.CMNumEditMarginBottom:TCMNumEdit
 000A42FF    call        000A41BC
 000A4304    pop         ecx
 000A4305    mov         eax,dword ptr [ebp-4]
 000A4308    call        000A40C4
 000A430D    pop         ebx
 000A430E    pop         ecx
 000A430F    pop         ebp
 000A4310    ret
*}
end;

//000A4314
procedure TFormPrint.CMNumEditMarginLeftExit(Sender:TObject);
begin
{*
 000A4314    call        000A40C4
 000A4319    ret
*}
end;

//000A431C
procedure TFormPrint.ComboBoxPrintersChange;
begin
{*
 000A431C    push        ebx
 000A431D    mov         ebx,eax
 000A431F    mov         eax,dword ptr [ebx+2E0];TFormPrint.ComboBoxPrinters:TComboBox
 000A4325    call        TCustomComboBox.GetItemIndex
 000A432A    mov         edx,eax
 000A432C    mov         eax,dword ptr [ebx+338];TFormPrint.?f338:TCMReport
 000A4332    call        TCMReport.SetPrinterIndex
 000A4337    mov         eax,ebx
 000A4339    call        000A40C4
 000A433E    pop         ebx
 000A433F    ret
*}
end;

//000A4340
procedure TFormPrint.FormCreate(Sender:TObject);
begin
{*
 000A4340    push        ebx
 000A4341    push        esi
 000A4342    mov         ebx,eax
 000A4344    mov         eax,ebx
 000A4346    call        00087A14
 000A434B    call        00099AA8
 000A4350    mov         edx,eax
 000A4352    mov         eax,dword ptr [ebx+2DC];TFormPrint.RadioButtonCurSelection:TRadioButton
 000A4358    mov         ecx,dword ptr [eax]
 000A435A    call        dword ptr [ecx+60];TControl.SetEnabled
 000A435D    call        Printer
 000A4362    call        TPrinter.GetPrinters
 000A4367    mov         edx,eax
 000A4369    mov         eax,dword ptr [ebx+2E0];TFormPrint.ComboBoxPrinters:TComboBox
 000A436F    mov         eax,dword ptr [eax+1EC];TComboBox.FItems:TStrings
 000A4375    mov         ecx,dword ptr [eax]
 000A4377    call        dword ptr [ecx+8];TStrings.Assign
 000A437A    mov         eax,ebx
 000A437C    call        000A3894
 000A4381    xor         eax,eax
 000A4383    mov         dword ptr [ebx+338],eax;TFormPrint.?f338:TCMReport
 000A4389    mov         ecx,ebx
 000A438B    mov         dl,1
 000A438D    mov         eax,[00094210];TCMReport
 000A4392    call        TCMReport.Create;TCMReport.Create
 000A4397    mov         esi,eax
 000A4399    mov         dword ptr [ebx+338],esi;TFormPrint.?f338:TCMReport
 000A439F    mov         dword ptr [esi+0E0],ebx;TCMReport.?fE0:TFormPrint
 000A43A5    mov         dword ptr [esi+0DC],0A40A8;TCMReport.OnAfterNewPage:TNotifyEvent
 000A43AF    mov         eax,ebx
 000A43B1    call        000A40C4
 000A43B6    pop         esi
 000A43B7    pop         ebx
 000A43B8    ret
*}
end;

//000A43BC
procedure TFormPrint.FormDestroy(Sender:TObject);
begin
{*
 000A43BC    ret
*}
end;

//000A43C0
procedure TFormPrint.ButtonHelpClick(Sender:TObject);
begin
{*
 000A43C0    mov         eax,[000B59E8];^Application:TApplication
 000A43C5    mov         eax,dword ptr [eax]
 000A43C7    mov         edx,40
 000A43CC    call        TApplication.HelpContext
 000A43D1    ret
*}
end;

//000A43D4
procedure TFormPrint.ComboBoxBytesPerRowKeyPress(Sender:TObject; var Key:Char);
begin
{*
 000A43D4    mov         al,byte ptr [ecx]
 000A43D6    dec         eax
 000A43D7    sub         al,1B
>000A43D9    jb          000A43E4
 000A43DB    add         al,0EC
 000A43DD    sub         al,0A
>000A43DF    jb          000A43E4
 000A43E1    mov         byte ptr [ecx],0
 000A43E4    ret
*}
end;

//000A43E8
{*procedure sub_000A43E8(?:?);
begin
 000A43E8    push        ebp
 000A43E9    mov         ebp,esp
 000A43EB    push        0
 000A43ED    push        0
 000A43EF    push        0
 000A43F1    push        ebx
 000A43F2    push        esi
 000A43F3    mov         esi,dword ptr [ebp+8]
 000A43F6    add         esi,0FFFFFFFC
 000A43F9    xor         eax,eax
 000A43FB    push        ebp
 000A43FC    push        0A457F
 000A4401    push        dword ptr fs:[eax]
 000A4404    mov         dword ptr fs:[eax],esp
 000A4407    mov         eax,dword ptr [esi]
 000A4409    mov         ebx,dword ptr [eax+338]
 000A440F    mov         eax,dword ptr [esi]
 000A4411    mov         eax,dword ptr [eax+334]
 000A4417    call        TCustomComboBox.GetItemIndex
 000A441C    mov         edx,eax
 000A441E    mov         eax,ebx
 000A4420    call        TCMReport.SetMeasureUnit
 000A4425    mov         eax,dword ptr [esi]
 000A4427    mov         eax,dword ptr [eax+2F4]
 000A442D    fld         tbyte ptr [eax+224]
 000A4433    add         esp,0FFFFFFF8
 000A4436    fstp        qword ptr [esp]
 000A4439    wait
 000A443A    mov         eax,ebx
 000A443C    call        TCMReport.SetMarginLeft
 000A4441    mov         eax,dword ptr [esi]
 000A4443    mov         eax,dword ptr [eax+2FC]
 000A4449    fld         tbyte ptr [eax+224]
 000A444F    add         esp,0FFFFFFF8
 000A4452    fstp        qword ptr [esp]
 000A4455    wait
 000A4456    mov         eax,ebx
 000A4458    call        TCMReport.SetMarginRight
 000A445D    mov         eax,dword ptr [esi]
 000A445F    mov         eax,dword ptr [eax+304]
 000A4465    fld         tbyte ptr [eax+224]
 000A446B    add         esp,0FFFFFFF8
 000A446E    fstp        qword ptr [esp]
 000A4471    wait
 000A4472    mov         eax,ebx
 000A4474    call        TCMReport.SetMarginTop
 000A4479    mov         eax,dword ptr [esi]
 000A447B    mov         eax,dword ptr [eax+30C]
 000A4481    fld         tbyte ptr [eax+224]
 000A4487    add         esp,0FFFFFFF8
 000A448A    fstp        qword ptr [esp]
 000A448D    wait
 000A448E    mov         eax,ebx
 000A4490    call        TCMReport.SetMarginBottom
 000A4495    mov         eax,dword ptr [esi]
 000A4497    mov         eax,dword ptr [eax+2E0]
 000A449D    call        TCustomComboBox.GetItemIndex
 000A44A2    mov         edx,eax
 000A44A4    mov         eax,ebx
 000A44A6    call        TCMReport.SetPrinterIndex
 000A44AB    mov         eax,dword ptr [esi]
 000A44AD    mov         eax,dword ptr [eax+318]
 000A44B3    mov         edx,dword ptr [eax]
 000A44B5    call        dword ptr [edx+0B8]
 000A44BB    mov         edx,eax
 000A44BD    mov         eax,ebx
 000A44BF    call        TCMReport.SetOrientation
 000A44C4    lea         edx,[ebp-4]
 000A44C7    mov         eax,dword ptr [esi]
 000A44C9    mov         eax,dword ptr [eax+314]
 000A44CF    call        TControl.GetText
 000A44D4    mov         eax,dword ptr [ebp-4]
 000A44D7    call        StrToInt
 000A44DC    push        eax
 000A44DD    mov         eax,dword ptr [esi]
 000A44DF    mov         eax,dword ptr [eax+338]
 000A44E5    call        TCMReport.GetFont
 000A44EA    pop         edx
 000A44EB    call        TFont.SetSize
 000A44F0    lea         edx,[ebp-0C]
 000A44F3    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000A44F8    mov         eax,dword ptr [eax]
 000A44FA    call        ExtractFileName
 000A44FF    mov         ecx,dword ptr [ebp-0C]
 000A4502    lea         eax,[ebp-8]
 000A4505    mov         edx,0A4594;'XVI32 - '
 000A450A    call        @LStrCat3
 000A450F    mov         edx,dword ptr [ebp-8]
 000A4512    mov         eax,dword ptr [esi]
 000A4514    mov         eax,dword ptr [eax+338]
 000A451A    call        TCMReport.SetTitle
 000A451F    push        0A45A8;'<{File: '
 000A4524    lea         edx,[ebp-8]
 000A4527    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000A452C    mov         eax,dword ptr [eax]
 000A452E    call        ExtractFileName
 000A4533    push        dword ptr [ebp-8]
 000A4536    push        0A45BC;'}>{Printed %DATE %TIME}'
 000A453B    lea         eax,[ebx+50]
 000A453E    mov         edx,3
 000A4543    call        @LStrCatN
 000A4548    lea         eax,[ebx+54]
 000A454B    mov         edx,0A45DC;'<{Printed by XVI32 - www.chmaas.handshake.de}>{Page %PAGE}'
 000A4550    call        @LStrAsg
 000A4555    mov         eax,ebx
 000A4557    call        00095AA4
 000A455C    xor         eax,eax
 000A455E    pop         edx
 000A455F    pop         ecx
 000A4560    pop         ecx
 000A4561    mov         dword ptr fs:[eax],edx
 000A4564    push        0A4586
 000A4569    lea         eax,[ebp-0C]
 000A456C    mov         edx,2
 000A4571    call        @LStrArrayClr
 000A4576    lea         eax,[ebp-4]
 000A4579    call        @LStrClr
 000A457E    ret
>000A457F    jmp         @HandleFinally
>000A4584    jmp         000A4569
 000A4586    pop         esi
 000A4587    pop         ebx
 000A4588    mov         esp,ebp
 000A458A    pop         ebp
 000A458B    ret
end;*}

//000A4618
{*function sub_000A4618(?:?):?;
begin
 000A4618    push        ebp
 000A4619    mov         ebp,esp
 000A461B    push        0
 000A461D    push        0
 000A461F    push        ebx
 000A4620    xor         eax,eax
 000A4622    push        ebp
 000A4623    push        0A4744
 000A4628    push        dword ptr fs:[eax]
 000A462B    mov         dword ptr fs:[eax],esp
 000A462E    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000A4633    push        eax
 000A4634    push        0A475C;'*.txt'
 000A4639    push        3F
 000A463B    push        0
 000A463D    push        0
 000A463F    push        0
 000A4641    push        0A476C;'Favorites'
 000A4646    lea         edx,[ebp-4]
 000A4649    mov         eax,82B
 000A464E    call        LoadStr;'Save output to file'
 000A4653    mov         ecx,dword ptr [ebp-4]
 000A4656    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A465B    mov         eax,dword ptr [eax]
 000A465D    mov         edx,1
 000A4662    call        000A1204
 000A4667    dec         eax
 000A4668    sete        bl
 000A466B    test        bl,bl
>000A466D    je          000A4729
 000A4673    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A4678    mov         eax,dword ptr [eax]
 000A467A    mov         edx,dword ptr [eax+2DC]
 000A4680    mov         eax,dword ptr [ebp+8]
 000A4683    add         eax,0FFFFFE30
 000A4688    call        @Assign
 000A468D    mov         eax,dword ptr [ebp+8]
 000A4690    add         eax,0FFFFFE30
 000A4695    call        @RewritText
 000A469A    call        @_IOTest
 000A469F    lea         edx,[ebp-8]
 000A46A2    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000A46A7    mov         eax,dword ptr [eax]
 000A46A9    call        ExtractFileName
 000A46AE    mov         ecx,dword ptr [ebp-8]
 000A46B1    lea         eax,[ebp-4]
 000A46B4    mov         edx,0A4780;'File: '
 000A46B9    call        @LStrCat3
 000A46BE    mov         edx,dword ptr [ebp-4]
 000A46C1    mov         eax,dword ptr [ebp+8]
 000A46C4    add         eax,0FFFFFE30
 000A46C9    call        @Write0Bool
 000A46CE    call        @WriteLn
 000A46D3    call        @_IOTest
 000A46D8    mov         eax,dword ptr [ebp+8]
 000A46DB    add         eax,0FFFFFE30
 000A46E0    mov         edx,0A4790;'Output by XVI32 - www.chmaas.handshake.de'
 000A46E5    call        @Write0Bool
 000A46EA    call        @WriteLn
 000A46EF    call        @_IOTest
 000A46F4    mov         eax,dword ptr [ebp+8]
 000A46F7    add         eax,0FFFFFE30
 000A46FC    call        @WriteLn
 000A4701    call        @_IOTest
 000A4706    mov         eax,dword ptr [ebp+8]
 000A4709    mov         eax,dword ptr [eax-4]
 000A470C    mov         edx,dword ptr [eax+33C]
 000A4712    mov         eax,dword ptr [ebp+8]
 000A4715    add         eax,0FFFFFE30
 000A471A    call        @Write0Bool
 000A471F    call        @WriteLn
 000A4724    call        @_IOTest
 000A4729    xor         eax,eax
 000A472B    pop         edx
 000A472C    pop         ecx
 000A472D    pop         ecx
 000A472E    mov         dword ptr fs:[eax],edx
 000A4731    push        0A474B
 000A4736    lea         eax,[ebp-8]
 000A4739    mov         edx,2
 000A473E    call        @LStrArrayClr
 000A4743    ret
>000A4744    jmp         @HandleFinally
>000A4749    jmp         000A4736
 000A474B    mov         eax,ebx
 000A474D    pop         ebx
 000A474E    pop         ecx
 000A474F    pop         ecx
 000A4750    pop         ebp
 000A4751    ret
end;*}

//000A47BC
{*procedure sub_000A47BC(?:?);
begin
 000A47BC    push        ebp
 000A47BD    mov         ebp,esp
 000A47BF    add         esp,0FFFFFFF0
 000A47C2    xor         eax,eax
 000A47C4    mov         dword ptr [ebp-4],eax
 000A47C7    mov         dword ptr [ebp-8],eax
 000A47CA    xor         eax,eax
 000A47CC    push        ebp
 000A47CD    push        0A4944
 000A47D2    push        dword ptr fs:[eax]
 000A47D5    mov         dword ptr fs:[eax],esp
 000A47D8    mov         eax,dword ptr [ebp+8]
 000A47DB    mov         eax,dword ptr [eax-4]
 000A47DE    mov         eax,dword ptr [eax+328]
 000A47E4    mov         edx,dword ptr [eax]
 000A47E6    call        dword ptr [edx+0B8]
 000A47EC    test        al,al
>000A47EE    je          000A48BB
 000A47F4    mov         eax,dword ptr [ebp+8]
 000A47F7    mov         eax,dword ptr [eax-4]
 000A47FA    mov         eax,dword ptr [eax+338]
 000A4800    mov         edx,2
 000A4805    call        00097854
 000A480A    test        al,al
>000A480C    jne         000A481F
 000A480E    mov         eax,dword ptr [ebp+8]
 000A4811    mov         eax,dword ptr [eax-4]
 000A4814    mov         eax,dword ptr [eax+338]
 000A481A    call        00096328
 000A481F    lea         eax,[ebp-8]
 000A4822    push        eax
 000A4823    mov         eax,dword ptr [ebp+8]
 000A4826    mov         eax,dword ptr [eax-1D8]
 000A482C    dec         eax
 000A482D    mov         dword ptr [ebp-10],eax
 000A4830    mov         byte ptr [ebp-0C],0
 000A4834    lea         edx,[ebp-10]
 000A4837    mov         eax,dword ptr [ebp+8]
 000A483A    mov         eax,dword ptr [eax-1D4]
 000A4840    xor         ecx,ecx
 000A4842    call        Format
 000A4847    push        dword ptr [ebp-8]
 000A484A    push        0A4958;' '
 000A484F    mov         eax,dword ptr [ebp+8]
 000A4852    push        dword ptr [eax-1DC]
 000A4858    lea         eax,[ebp-4]
 000A485B    mov         edx,3
 000A4860    call        @LStrCatN
 000A4865    mov         edx,dword ptr [ebp-4]
 000A4868    mov         eax,dword ptr [ebp+8]
 000A486B    mov         eax,dword ptr [eax-4]
 000A486E    mov         eax,dword ptr [eax+338]
 000A4874    call        00096958
 000A4879    xor         al,1
 000A487B    mov         edx,dword ptr [ebp+8]
 000A487E    mov         byte ptr [edx-1DD],al
 000A4884    mov         eax,dword ptr [ebp+8]
 000A4887    cmp         byte ptr [eax-1DD],0
>000A488E    jne         000A4929
 000A4894    mov         eax,dword ptr [ebp+8]
 000A4897    mov         edx,dword ptr [eax-1E4]
 000A489D    mov         eax,dword ptr [ebp+8]
 000A48A0    mov         eax,dword ptr [eax-4]
 000A48A3    mov         eax,dword ptr [eax+338]
 000A48A9    call        00096958
 000A48AE    xor         al,1
 000A48B0    mov         edx,dword ptr [ebp+8]
 000A48B3    mov         byte ptr [edx-1DD],al
>000A48B9    jmp         000A4929
 000A48BB    lea         eax,[ebp-8]
 000A48BE    push        eax
 000A48BF    mov         eax,dword ptr [ebp+8]
 000A48C2    mov         eax,dword ptr [eax-1D8]
 000A48C8    dec         eax
 000A48C9    mov         dword ptr [ebp-10],eax
 000A48CC    mov         byte ptr [ebp-0C],0
 000A48D0    lea         edx,[ebp-10]
 000A48D3    mov         eax,dword ptr [ebp+8]
 000A48D6    mov         eax,dword ptr [eax-1D4]
 000A48DC    xor         ecx,ecx
 000A48DE    call        Format
 000A48E3    push        dword ptr [ebp-8]
 000A48E6    push        0A4958;' '
 000A48EB    mov         eax,dword ptr [ebp+8]
 000A48EE    push        dword ptr [eax-1DC]
 000A48F4    mov         eax,dword ptr [ebp+8]
 000A48F7    push        dword ptr [eax-1E8]
 000A48FD    lea         eax,[ebp-4]
 000A4900    mov         edx,4
 000A4905    call        @LStrCatN
 000A490A    mov         edx,dword ptr [ebp-4]
 000A490D    mov         eax,dword ptr [ebp+8]
 000A4910    mov         eax,dword ptr [eax-4]
 000A4913    mov         eax,dword ptr [eax+338]
 000A4919    call        00096958
 000A491E    xor         al,1
 000A4920    mov         edx,dword ptr [ebp+8]
 000A4923    mov         byte ptr [edx-1DD],al
 000A4929    xor         eax,eax
 000A492B    pop         edx
 000A492C    pop         ecx
 000A492D    pop         ecx
 000A492E    mov         dword ptr fs:[eax],edx
 000A4931    push        0A494B
 000A4936    lea         eax,[ebp-8]
 000A4939    mov         edx,2
 000A493E    call        @LStrArrayClr
 000A4943    ret
>000A4944    jmp         @HandleFinally
>000A4949    jmp         000A4936
 000A494B    mov         esp,ebp
 000A494D    pop         ebp
 000A494E    ret
end;*}

//000A495C
{*procedure sub_000A495C(?:?);
begin
 000A495C    push        ebp
 000A495D    mov         ebp,esp
 000A495F    add         esp,0FFFFFFF0
 000A4962    xor         eax,eax
 000A4964    mov         dword ptr [ebp-4],eax
 000A4967    mov         dword ptr [ebp-8],eax
 000A496A    xor         eax,eax
 000A496C    push        ebp
 000A496D    push        0A4A9A
 000A4972    push        dword ptr fs:[eax]
 000A4975    mov         dword ptr fs:[eax],esp
 000A4978    mov         eax,dword ptr [ebp+8]
 000A497B    mov         eax,dword ptr [eax-4]
 000A497E    mov         eax,dword ptr [eax+328]
 000A4984    mov         edx,dword ptr [eax]
 000A4986    call        dword ptr [edx+0B8]
 000A498C    test        al,al
>000A498E    je          000A4A16
 000A4994    lea         eax,[ebp-8]
 000A4997    push        eax
 000A4998    mov         eax,dword ptr [ebp+8]
 000A499B    mov         eax,dword ptr [eax-1D8]
 000A49A1    dec         eax
 000A49A2    mov         dword ptr [ebp-10],eax
 000A49A5    mov         byte ptr [ebp-0C],0
 000A49A9    lea         edx,[ebp-10]
 000A49AC    mov         eax,dword ptr [ebp+8]
 000A49AF    mov         eax,dword ptr [eax-1D4]
 000A49B5    xor         ecx,ecx
 000A49B7    call        Format
 000A49BC    push        dword ptr [ebp-8]
 000A49BF    push        0A4AB0;' '
 000A49C4    mov         eax,dword ptr [ebp+8]
 000A49C7    push        dword ptr [eax-1DC]
 000A49CD    lea         eax,[ebp-4]
 000A49D0    mov         edx,3
 000A49D5    call        @LStrCatN
 000A49DA    mov         edx,dword ptr [ebp-4]
 000A49DD    mov         eax,dword ptr [ebp+8]
 000A49E0    add         eax,0FFFFFE30
 000A49E5    call        @Write0Bool
 000A49EA    call        @WriteLn
 000A49EF    call        @_IOTest
 000A49F4    mov         eax,dword ptr [ebp+8]
 000A49F7    mov         edx,dword ptr [eax-1E4]
 000A49FD    mov         eax,dword ptr [ebp+8]
 000A4A00    add         eax,0FFFFFE30
 000A4A05    call        @Write0Bool
 000A4A0A    call        @WriteLn
 000A4A0F    call        @_IOTest
>000A4A14    jmp         000A4A7F
 000A4A16    lea         eax,[ebp-8]
 000A4A19    push        eax
 000A4A1A    mov         eax,dword ptr [ebp+8]
 000A4A1D    mov         eax,dword ptr [eax-1D8]
 000A4A23    dec         eax
 000A4A24    mov         dword ptr [ebp-10],eax
 000A4A27    mov         byte ptr [ebp-0C],0
 000A4A2B    lea         edx,[ebp-10]
 000A4A2E    mov         eax,dword ptr [ebp+8]
 000A4A31    mov         eax,dword ptr [eax-1D4]
 000A4A37    xor         ecx,ecx
 000A4A39    call        Format
 000A4A3E    push        dword ptr [ebp-8]
 000A4A41    push        0A4AB0;' '
 000A4A46    mov         eax,dword ptr [ebp+8]
 000A4A49    push        dword ptr [eax-1DC]
 000A4A4F    mov         eax,dword ptr [ebp+8]
 000A4A52    push        dword ptr [eax-1E8]
 000A4A58    lea         eax,[ebp-4]
 000A4A5B    mov         edx,4
 000A4A60    call        @LStrCatN
 000A4A65    mov         edx,dword ptr [ebp-4]
 000A4A68    mov         eax,dword ptr [ebp+8]
 000A4A6B    add         eax,0FFFFFE30
 000A4A70    call        @Write0Bool
 000A4A75    call        @WriteLn
 000A4A7A    call        @_IOTest
 000A4A7F    xor         eax,eax
 000A4A81    pop         edx
 000A4A82    pop         ecx
 000A4A83    pop         ecx
 000A4A84    mov         dword ptr fs:[eax],edx
 000A4A87    push        0A4AA1
 000A4A8C    lea         eax,[ebp-8]
 000A4A8F    mov         edx,2
 000A4A94    call        @LStrArrayClr
 000A4A99    ret
>000A4A9A    jmp         @HandleFinally
>000A4A9F    jmp         000A4A8C
 000A4AA1    mov         esp,ebp
 000A4AA3    pop         ebp
 000A4AA4    ret
end;*}

//000A4AB4
{*procedure sub_000A4AB4(?:?);
begin
 000A4AB4    push        ebp
 000A4AB5    mov         ebp,esp
 000A4AB7    add         esp,0FFFFFFF4
 000A4ABA    push        ebx
 000A4ABB    push        esi
 000A4ABC    push        edi
 000A4ABD    xor         eax,eax
 000A4ABF    mov         dword ptr [ebp-4],eax
 000A4AC2    mov         edi,dword ptr [ebp+8]
 000A4AC5    add         edi,0FFFFFE24
 000A4ACB    xor         eax,eax
 000A4ACD    push        ebp
 000A4ACE    push        0A4D9A
 000A4AD3    push        dword ptr fs:[eax]
 000A4AD6    mov         dword ptr fs:[eax],esp
 000A4AD9    mov         eax,dword ptr [ebp+8]
 000A4ADC    mov         eax,dword ptr [eax-1D8]
 000A4AE2    mov         edx,dword ptr [ebp+8]
 000A4AE5    cmp         eax,dword ptr [edx-1EC]
>000A4AEB    jg          000A4D84
 000A4AF1    mov         eax,edi
 000A4AF3    call        @LStrClr
 000A4AF8    mov         eax,dword ptr [ebp+8]
 000A4AFB    add         eax,0FFFFFE18
 000A4B00    call        @LStrClr
 000A4B05    mov         eax,dword ptr [ebp+8]
 000A4B08    add         eax,0FFFFFE1C
 000A4B0D    mov         edx,0A4DB0;'           '
 000A4B12    call        @LStrLAsg
 000A4B17    mov         eax,dword ptr [ebp+8]
 000A4B1A    mov         ebx,dword ptr [eax-1D8]
 000A4B20    mov         eax,dword ptr [ebp+8]
 000A4B23    mov         esi,dword ptr [eax-1D8]
 000A4B29    mov         eax,dword ptr [ebp+8]
 000A4B2C    movzx       eax,byte ptr [eax-1ED]
 000A4B33    add         esi,eax
 000A4B35    dec         esi
 000A4B36    sub         esi,ebx
>000A4B38    jl          000A4BEA
 000A4B3E    inc         esi
 000A4B3F    mov         eax,dword ptr [ebp+8]
 000A4B42    cmp         ebx,dword ptr [eax-1EC]
>000A4B48    jg          000A4BEA
 000A4B4E    mov         eax,dword ptr [ebp+8]
 000A4B51    inc         dword ptr [eax-1F4]
 000A4B57    push        dword ptr [edi]
 000A4B59    mov         eax,ebx
 000A4B5B    call        000981AC
 000A4B60    lea         edx,[ebp-4]
 000A4B63    call        00074C9C
 000A4B68    push        dword ptr [ebp-4]
 000A4B6B    push        0A4DC4;' '
 000A4B70    mov         eax,edi
 000A4B72    mov         edx,3
 000A4B77    call        @LStrCatN
 000A4B7C    mov         eax,ebx
 000A4B7E    call        000981AC
 000A4B83    mov         dl,2E
 000A4B85    call        00099AA0
 000A4B8A    mov         edx,eax
 000A4B8C    lea         eax,[ebp-4]
 000A4B8F    call        @LStrFromChar
 000A4B94    mov         edx,dword ptr [ebp-4]
 000A4B97    mov         eax,dword ptr [ebp+8]
 000A4B9A    add         eax,0FFFFFE18
 000A4B9F    call        @LStrCat
 000A4BA4    mov         eax,dword ptr [ebp+8]
 000A4BA7    mov         eax,dword ptr [ebp+8]
 000A4BAA    push        dword ptr [eax-1E4]
 000A4BB0    push        0A4DD0;'  '
 000A4BB5    mov         eax,ebx
 000A4BB7    call        000981AC
 000A4BBC    mov         dl,20
 000A4BBE    call        00099AA0
 000A4BC3    mov         edx,eax
 000A4BC5    lea         eax,[ebp-4]
 000A4BC8    call        @LStrFromChar
 000A4BCD    push        dword ptr [ebp-4]
 000A4BD0    mov         eax,dword ptr [ebp+8]
 000A4BD3    add         eax,0FFFFFE1C
 000A4BD8    mov         edx,3
 000A4BDD    call        @LStrCatN
 000A4BE2    inc         ebx
 000A4BE3    dec         esi
>000A4BE4    jne         000A4B3F
 000A4BEA    lea         ecx,[ebp-4]
 000A4BED    mov         eax,dword ptr [ebp+8]
 000A4BF0    movzx       eax,byte ptr [eax-1ED]
 000A4BF7    lea         edx,[eax+eax*2]
 000A4BFA    mov         eax,dword ptr [edi]
 000A4BFC    call        000743E4
 000A4C01    mov         edx,dword ptr [ebp-4]
 000A4C04    mov         eax,edi
 000A4C06    call        @LStrLAsg
 000A4C0B    mov         eax,dword ptr [ebp+8]
 000A4C0E    mov         eax,dword ptr [eax-4]
 000A4C11    mov         eax,dword ptr [eax+32C]
 000A4C17    mov         edx,dword ptr [eax]
 000A4C19    call        dword ptr [edx+0B8]
 000A4C1F    test        al,al
>000A4C21    je          000A4C2F
 000A4C23    mov         eax,dword ptr [ebp+8]
 000A4C26    push        eax
 000A4C27    call        000A495C
 000A4C2C    pop         ecx
>000A4C2D    jmp         000A4C49
 000A4C2F    mov         eax,dword ptr [ebp+8]
 000A4C32    push        eax
 000A4C33    call        000A47BC
 000A4C38    pop         ecx
 000A4C39    mov         eax,dword ptr [ebp+8]
 000A4C3C    cmp         byte ptr [eax-1DD],0
>000A4C43    jne         000A4D84
 000A4C49    mov         eax,dword ptr [ebp+8]
 000A4C4C    movzx       eax,byte ptr [eax-1ED]
 000A4C53    mov         edx,dword ptr [ebp+8]
 000A4C56    add         dword ptr [edx-1D8],eax
 000A4C5C    mov         eax,dword ptr [ebp+8]
 000A4C5F    mov         eax,dword ptr [eax-1F4]
 000A4C65    and         eax,8000003F
>000A4C6A    jns         000A4C71
 000A4C6C    dec         eax
 000A4C6D    or          eax,0FFFFFFC0
 000A4C70    inc         eax
 000A4C71    test        eax,eax
>000A4C73    jne         000A4D6C
 000A4C79    push        2
 000A4C7B    mov         eax,dword ptr [ebp+8]
 000A4C7E    mov         ecx,dword ptr [eax-1F8]
 000A4C84    mov         eax,dword ptr [ebp+8]
 000A4C87    mov         edx,dword ptr [eax-1F4]
 000A4C8D    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A4C92    mov         eax,dword ptr [eax]
 000A4C94    call        0008E1A4
 000A4C99    mov         eax,dword ptr [ebp+8]
 000A4C9C    mov         eax,dword ptr [eax-4]
 000A4C9F    mov         eax,dword ptr [eax+32C]
 000A4CA5    mov         edx,dword ptr [eax]
 000A4CA7    call        dword ptr [edx+0B8]
 000A4CAD    test        al,al
>000A4CAF    je          000A4D01
 000A4CB1    lea         eax,[ebp-4]
 000A4CB4    push        eax
 000A4CB5    mov         eax,dword ptr [ebp+8]
 000A4CB8    mov         eax,dword ptr [eax-1F4]
 000A4CBE    mov         edx,dword ptr [ebp+8]
 000A4CC1    movzx       edx,byte ptr [edx-1ED]
 000A4CC8    mov         ecx,edx
 000A4CCA    cdq
 000A4CCB    idiv        eax,ecx
 000A4CCD    mov         ecx,32
 000A4CD2    cdq
 000A4CD3    idiv        eax,ecx
 000A4CD5    mov         dword ptr [ebp-0C],eax
 000A4CD8    mov         byte ptr [ebp-8],0
 000A4CDC    lea         edx,[ebp-0C]
 000A4CDF    xor         ecx,ecx
 000A4CE1    mov         eax,828
 000A4CE6    call        FmtLoadStr;'Page: %d'
 000A4CEB    mov         edx,dword ptr [ebp-4]
 000A4CEE    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A4CF3    mov         eax,dword ptr [eax]
 000A4CF5    mov         ecx,1
 000A4CFA    call        0008E154
>000A4CFF    jmp         000A4D3E
 000A4D01    lea         eax,[ebp-4]
 000A4D04    push        eax
 000A4D05    mov         eax,dword ptr [ebp+8]
 000A4D08    mov         eax,dword ptr [eax-4]
 000A4D0B    mov         eax,dword ptr [eax+338]
 000A4D11    mov         eax,dword ptr [eax+4C]
 000A4D14    mov         dword ptr [ebp-0C],eax
 000A4D17    mov         byte ptr [ebp-8],0
 000A4D1B    lea         edx,[ebp-0C]
 000A4D1E    xor         ecx,ecx
 000A4D20    mov         eax,828
 000A4D25    call        FmtLoadStr;'Page: %d'
 000A4D2A    mov         edx,dword ptr [ebp-4]
 000A4D2D    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A4D32    mov         eax,dword ptr [eax]
 000A4D34    mov         ecx,1
 000A4D39    call        0008E154
 000A4D3E    mov         eax,[000B59E8];^Application:TApplication
 000A4D43    mov         eax,dword ptr [eax]
 000A4D45    call        TApplication.ProcessMessages
 000A4D4A    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A4D4F    mov         eax,dword ptr [eax]
 000A4D51    mov         al,byte ptr [eax+2DC]
 000A4D57    mov         edx,dword ptr [ebp+8]
 000A4D5A    mov         byte ptr [edx-1F9],al
 000A4D60    mov         eax,dword ptr [ebp+8]
 000A4D63    cmp         byte ptr [eax-1F9],0
>000A4D6A    jne         000A4D84
 000A4D6C    mov         eax,dword ptr [ebp+8]
 000A4D6F    mov         eax,dword ptr [eax-1D8]
 000A4D75    mov         edx,dword ptr [ebp+8]
 000A4D78    cmp         eax,dword ptr [edx-1EC]
>000A4D7E    jle         000A4AF1
 000A4D84    xor         eax,eax
 000A4D86    pop         edx
 000A4D87    pop         ecx
 000A4D88    pop         ecx
 000A4D89    mov         dword ptr fs:[eax],edx
 000A4D8C    push        0A4DA1
 000A4D91    lea         eax,[ebp-4]
 000A4D94    call        @LStrClr
 000A4D99    ret
>000A4D9A    jmp         @HandleFinally
>000A4D9F    jmp         000A4D91
 000A4DA1    pop         edi
 000A4DA2    pop         esi
 000A4DA3    pop         ebx
 000A4DA4    mov         esp,ebp
 000A4DA6    pop         ebp
 000A4DA7    ret
end;*}

//000A4DD4
{*procedure sub_000A4DD4(?:?);
begin
 000A4DD4    push        ebp
 000A4DD5    mov         ebp,esp
 000A4DD7    add         esp,0FFFFFFF8
 000A4DDA    push        ebx
 000A4DDB    mov         eax,dword ptr [ebp+8]
 000A4DDE    mov         eax,dword ptr [eax-4]
 000A4DE1    mov         eax,dword ptr [eax+32C]
 000A4DE7    mov         edx,dword ptr [eax]
 000A4DE9    call        dword ptr [edx+0B8]
 000A4DEF    test        al,al
>000A4DF1    jne         000A4E96
 000A4DF7    mov         eax,dword ptr [ebp+8]
 000A4DFA    mov         eax,dword ptr [eax-4]
 000A4DFD    mov         eax,dword ptr [eax+328]
 000A4E03    mov         edx,dword ptr [eax]
 000A4E05    call        dword ptr [edx+0B8]
 000A4E0B    test        al,al
>000A4E0D    je          000A4E38
 000A4E0F    mov         eax,dword ptr [ebp+8]
 000A4E12    mov         eax,dword ptr [eax-4]
 000A4E15    mov         eax,dword ptr [eax+338]
 000A4E1B    call        00097838
 000A4E20    mov         ebx,eax
 000A4E22    sar         ebx,1
>000A4E24    jns         000A4E29
 000A4E26    adc         ebx,0
 000A4E29    mov         eax,dword ptr [ebp+8]
 000A4E2C    movzx       eax,byte ptr [eax-1ED]
 000A4E33    imul        ebx,eax
>000A4E36    jmp         000A4E58
 000A4E38    mov         eax,dword ptr [ebp+8]
 000A4E3B    mov         eax,dword ptr [eax-4]
 000A4E3E    mov         eax,dword ptr [eax+338]
 000A4E44    call        00097838
 000A4E49    mov         ebx,eax
 000A4E4B    mov         eax,dword ptr [ebp+8]
 000A4E4E    movzx       eax,byte ptr [eax-1ED]
 000A4E55    imul        ebx,eax
 000A4E58    mov         eax,dword ptr [ebp+8]
 000A4E5B    mov         eax,dword ptr [eax-1EC]
 000A4E61    mov         edx,ebx
 000A4E63    call        000755F4
 000A4E68    mov         edx,dword ptr [ebp+8]
 000A4E6B    mov         dword ptr [edx-1EC],eax
 000A4E71    mov         eax,dword ptr [ebp+8]
 000A4E74    mov         eax,dword ptr [eax-1EC]
 000A4E7A    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000A4E80    cmp         eax,dword ptr [edx]
>000A4E82    jle         000A4EDA
 000A4E84    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A4E89    mov         eax,dword ptr [eax]
 000A4E8B    mov         edx,dword ptr [ebp+8]
 000A4E8E    mov         dword ptr [edx-1EC],eax
>000A4E94    jmp         000A4EDA
 000A4E96    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A4E9B    mov         eax,dword ptr [eax]
 000A4E9D    mov         dword ptr [ebp-8],eax
 000A4EA0    mov         eax,dword ptr [ebp+8]
 000A4EA3    mov         eax,dword ptr [eax-1EC]
 000A4EA9    mov         edx,dword ptr [ebp+8]
 000A4EAC    movzx       edx,byte ptr [edx-1ED]
 000A4EB3    mov         ecx,edx
 000A4EB5    cdq
 000A4EB6    idiv        eax,ecx
 000A4EB8    mov         eax,dword ptr [ebp+8]
 000A4EBB    add         edx,dword ptr [eax-1EC]
 000A4EC1    mov         dword ptr [ebp-4],edx
 000A4EC4    lea         eax,[ebp-8]
 000A4EC7    mov         edx,1
 000A4ECC    call        00075288
 000A4ED1    mov         edx,dword ptr [ebp+8]
 000A4ED4    mov         dword ptr [edx-1EC],eax
 000A4EDA    pop         ebx
 000A4EDB    pop         ecx
 000A4EDC    pop         ecx
 000A4EDD    pop         ebp
 000A4EDE    ret
end;*}

//000A4EE0
procedure TFormPrint.ButtonPreviewPrintClick(Sender:TObject);
begin
{*
 000A4EE0    push        ebp
 000A4EE1    mov         ebp,esp
 000A4EE3    add         esp,0FFFFFDEC
 000A4EE9    push        ebx
 000A4EEA    push        esi
 000A4EEB    push        edi
 000A4EEC    xor         ecx,ecx
 000A4EEE    mov         dword ptr [ebp-208],ecx
 000A4EF4    mov         dword ptr [ebp-214],ecx
 000A4EFA    mov         dword ptr [ebp-204],ecx
 000A4F00    mov         dword ptr [ebp-1D4],ecx
 000A4F06    mov         dword ptr [ebp-200],ecx
 000A4F0C    mov         dword ptr [ebp-1DC],ecx
 000A4F12    mov         dword ptr [ebp-1E8],ecx
 000A4F18    mov         dword ptr [ebp-1E4],ecx
 000A4F1E    mov         dword ptr [ebp-4],eax
 000A4F21    xor         eax,eax
 000A4F23    push        ebp
 000A4F24    push        0A53A9
 000A4F29    push        dword ptr fs:[eax]
 000A4F2C    mov         dword ptr fs:[eax],esp
 000A4F2F    mov         byte ptr [ebp-1F9],0
 000A4F36    mov         byte ptr [ebp-1DD],0
 000A4F3D    lea         edx,[ebp-204]
 000A4F43    mov         eax,dword ptr [ebp-4]
 000A4F46    mov         eax,dword ptr [eax+324];TFormPrint.ComboBoxBytesPerRow:TComboBox
 000A4F4C    call        TControl.GetText
 000A4F51    mov         eax,dword ptr [ebp-204]
 000A4F57    call        StrToInt
 000A4F5C    mov         byte ptr [ebp-1ED],al
 000A4F62    mov         eax,dword ptr [ebp-4]
 000A4F65    mov         eax,dword ptr [eax+31C];TFormPrint.CheckBoxOffsetDecimal:TCheckBox
 000A4F6B    mov         edx,dword ptr [eax]
 000A4F6D    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 000A4F73    test        al,al
>000A4F75    je          000A4FAB
 000A4F77    lea         eax,[ebp-1D4]
 000A4F7D    mov         edx,0A53C0;'%9.9d: '
 000A4F82    call        @LStrLAsg
 000A4F87    lea         eax,[ebp-200]
 000A4F8D    mov         edx,0A53D0;'%2.2d '
 000A4F92    call        @LStrLAsg
 000A4F97    mov         eax,dword ptr [ebp-4]
 000A4F9A    add         eax,33C;TFormPrint.?f33C:String
 000A4F9F    mov         edx,0A53E0;'Offset dec. '
 000A4FA4    call        @LStrAsg
>000A4FA9    jmp         000A4FDD
 000A4FAB    lea         eax,[ebp-1D4]
 000A4FB1    mov         edx,0A53F8;'%9.9x: '
 000A4FB6    call        @LStrLAsg
 000A4FBB    lea         eax,[ebp-200]
 000A4FC1    mov         edx,0A5408;'%2.2x '
 000A4FC6    call        @LStrLAsg
 000A4FCB    mov         eax,dword ptr [ebp-4]
 000A4FCE    add         eax,33C;TFormPrint.?f33C:String
 000A4FD3    mov         edx,0A5418;'Offset hex. '
 000A4FD8    call        @LStrAsg
 000A4FDD    xor         ebx,ebx
 000A4FDF    mov         bl,byte ptr [ebp-1ED]
 000A4FE5    dec         ebx
 000A4FE6    test        ebx,ebx
>000A4FE8    jl          000A502B
 000A4FEA    inc         ebx
 000A4FEB    xor         esi,esi
 000A4FED    lea         eax,[ebp-208]
 000A4FF3    push        eax
 000A4FF4    mov         dword ptr [ebp-210],esi
 000A4FFA    mov         byte ptr [ebp-20C],0
 000A5001    lea         edx,[ebp-210]
 000A5007    xor         ecx,ecx
 000A5009    mov         eax,dword ptr [ebp-200]
 000A500F    call        Format
 000A5014    mov         edx,dword ptr [ebp-208]
 000A501A    mov         eax,dword ptr [ebp-4]
 000A501D    add         eax,33C;TFormPrint.?f33C:String
 000A5022    call        @LStrCat
 000A5027    inc         esi
 000A5028    dec         ebx
>000A5029    jne         000A4FED
 000A502B    mov         eax,dword ptr [ebp-4]
 000A502E    mov         eax,dword ptr [eax+32C];TFormPrint.CheckBoxOutputToFile:TCheckBox
 000A5034    mov         edx,dword ptr [eax]
 000A5036    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 000A503C    test        al,al
>000A503E    je          000A505B
 000A5040    push        ebp
 000A5041    call        000A4618
 000A5046    pop         ecx
 000A5047    test        al,al
>000A5049    jne         000A50B6
 000A504B    mov         eax,dword ptr [ebp-4]
 000A504E    xor         edx,edx
 000A5050    mov         dword ptr [eax+22C],edx;TFormPrint.FModalResult:TModalResult
>000A5056    jmp         000A5349
 000A505B    xor         eax,eax
 000A505D    push        ebp
 000A505E    push        0A507A
 000A5063    push        dword ptr fs:[eax]
 000A5066    mov         dword ptr fs:[eax],esp
 000A5069    push        ebp
 000A506A    call        000A43E8
 000A506F    pop         ecx
 000A5070    xor         eax,eax
 000A5072    pop         edx
 000A5073    pop         ecx
 000A5074    pop         ecx
 000A5075    mov         dword ptr fs:[eax],edx
>000A5078    jmp         000A50B6
>000A507A    jmp         @HandleAnyException
 000A507F    mov         eax,dword ptr [ebp-4]
 000A5082    xor         edx,edx
 000A5084    mov         dword ptr [eax+22C],edx;TFormPrint.FModalResult:TModalResult
 000A508A    lea         edx,[ebp-208]
 000A5090    mov         eax,829
 000A5095    call        LoadStr;'Insufficient paper width/height. Change settings
Margins/Font size/Orientation/Bytes per row
or select "Print text below".'
 000A509A    mov         ecx,dword ptr [ebp-208]
 000A50A0    mov         dl,1
 000A50A2    mov         eax,[000176E8];Exception
 000A50A7    call        Exception.Create;Exception.Create
 000A50AC    call        @RaiseExcept
 000A50B1    call        @DoneExcept
 000A50B6    mov         eax,dword ptr [ebp-4]
 000A50B9    mov         eax,dword ptr [eax+2D8];TFormPrint.RadioButtonCurPage:TRadioButton
 000A50BF    mov         edx,dword ptr [eax]
 000A50C1    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 000A50C7    test        al,al
>000A50C9    je          000A511B
 000A50CB    mov         eax,[000B5984];^gvar_000B6B84
 000A50D0    mov         eax,dword ptr [eax]
 000A50D2    mov         dword ptr [ebp-1D8],eax
 000A50D8    mov         eax,dword ptr [ebp-1D8]
 000A50DE    dec         eax
 000A50DF    xor         edx,edx
 000A50E1    mov         dl,byte ptr [ebp-1ED]
 000A50E7    mov         ecx,edx
 000A50E9    cdq
 000A50EA    idiv        eax,ecx
 000A50EC    sub         dword ptr [ebp-1D8],edx
 000A50F2    cmp         dword ptr [ebp-1D8],1
>000A50F9    jge         000A5105
 000A50FB    mov         dword ptr [ebp-1D8],1
 000A5105    mov         eax,[000B5720];^gvar_000B6B88
 000A510A    mov         eax,dword ptr [eax]
 000A510C    mov         dword ptr [ebp-1EC],eax
 000A5112    push        ebp
 000A5113    call        000A4DD4
 000A5118    pop         ecx
>000A5119    jmp         000A5197
 000A511B    mov         eax,dword ptr [ebp-4]
 000A511E    mov         eax,dword ptr [eax+2DC];TFormPrint.RadioButtonCurSelection:TRadioButton
 000A5124    mov         edx,dword ptr [eax]
 000A5126    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 000A512C    test        al,al
>000A512E    je          000A5180
 000A5130    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000A5135    mov         eax,dword ptr [eax]
 000A5137    mov         dword ptr [ebp-1D8],eax
 000A513D    mov         eax,dword ptr [ebp-1D8]
 000A5143    dec         eax
 000A5144    xor         edx,edx
 000A5146    mov         dl,byte ptr [ebp-1ED]
 000A514C    mov         ecx,edx
 000A514E    cdq
 000A514F    idiv        eax,ecx
 000A5151    sub         dword ptr [ebp-1D8],edx
 000A5157    cmp         dword ptr [ebp-1D8],1
>000A515E    jge         000A516A
 000A5160    mov         dword ptr [ebp-1D8],1
 000A516A    mov         eax,[000B5970];^gvar_000B6B90
 000A516F    mov         eax,dword ptr [eax]
 000A5171    mov         dword ptr [ebp-1EC],eax
 000A5177    push        ebp
 000A5178    call        000A4DD4
 000A517D    pop         ecx
>000A517E    jmp         000A5197
 000A5180    mov         dword ptr [ebp-1D8],1
 000A518A    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A518F    mov         eax,dword ptr [eax]
 000A5191    mov         dword ptr [ebp-1EC],eax
 000A5197    mov         eax,dword ptr [ebp-1EC]
 000A519D    sub         eax,dword ptr [ebp-1D8]
 000A51A3    inc         eax
 000A51A4    mov         dword ptr [ebp-1F8],eax
 000A51AA    xor         eax,eax
 000A51AC    mov         dword ptr [ebp-1F4],eax
 000A51B2    lea         edx,[ebp-208]
 000A51B8    mov         eax,826
 000A51BD    call        LoadStr;'Generating Preview...'
 000A51C2    mov         eax,dword ptr [ebp-208]
 000A51C8    push        eax
 000A51C9    lea         eax,[ebp-214]
 000A51CF    push        eax
 000A51D0    mov         dword ptr [ebp-210],1
 000A51DA    mov         byte ptr [ebp-20C],0
 000A51E1    lea         edx,[ebp-210]
 000A51E7    xor         ecx,ecx
 000A51E9    mov         eax,828
 000A51EE    call        FmtLoadStr;'Page: %d'
 000A51F3    mov         eax,dword ptr [ebp-214]
 000A51F9    push        eax
 000A51FA    push        1
 000A51FC    push        1
 000A51FE    mov         ecx,dword ptr [ebp-4]
 000A5201    mov         dl,1
 000A5203    mov         eax,[0008C62C];TProgressBox
 000A5208    call        TProgressBox.Create;TProgressBox.Create
 000A520D    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000A5213    mov         dword ptr [edx],eax
 000A5215    xor         eax,eax
 000A5217    push        ebp
 000A5218    push        0A529C
 000A521D    push        dword ptr fs:[eax]
 000A5220    mov         dword ptr fs:[eax],esp
 000A5223    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A5228    mov         eax,dword ptr [eax]
 000A522A    call        TCustomForm.Show
 000A522F    mov         byte ptr [ebp-1FA],0
 000A5236    push        ebp
 000A5237    call        000A4AB4
 000A523C    pop         ecx
 000A523D    mov         eax,dword ptr [ebp-4]
 000A5240    mov         eax,dword ptr [eax+32C];TFormPrint.CheckBoxOutputToFile:TCheckBox
 000A5246    mov         edx,dword ptr [eax]
 000A5248    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 000A524E    test        al,al
>000A5250    je          000A5264
 000A5252    lea         eax,[ebp-1D0]
 000A5258    call        @Close
 000A525D    call        @_IOTest
>000A5262    jmp         000A5272
 000A5264    mov         eax,dword ptr [ebp-4]
 000A5267    mov         eax,dword ptr [eax+338];TFormPrint.?f338:TCMReport
 000A526D    call        00095C40
 000A5272    mov         byte ptr [ebp-1FA],1
 000A5279    xor         eax,eax
 000A527B    pop         edx
 000A527C    pop         ecx
 000A527D    pop         ecx
 000A527E    mov         dword ptr fs:[eax],edx
 000A5281    push        0A52A3
 000A5286    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A528B    mov         eax,dword ptr [eax]
 000A528D    call        TObject.Free
 000A5292    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A5297    xor         edx,edx
 000A5299    mov         dword ptr [eax],edx
 000A529B    ret
>000A529C    jmp         @HandleFinally
>000A52A1    jmp         000A5286
 000A52A3    cmp         byte ptr [ebp-1FA],0
>000A52AA    jne         000A52BF
 000A52AC    mov         eax,dword ptr [ebp-4]
 000A52AF    mov         eax,dword ptr [eax+338];TFormPrint.?f338:TCMReport
 000A52B5    call        000959EC
>000A52BA    jmp         000A5349
 000A52BF    mov         eax,dword ptr [ebp-4]
 000A52C2    mov         eax,dword ptr [eax+32C];TFormPrint.CheckBoxOutputToFile:TCheckBox
 000A52C8    mov         edx,dword ptr [eax]
 000A52CA    call        dword ptr [edx+0B8];TCustomCheckBox.GetChecked
 000A52D0    test        al,al
>000A52D2    jne         000A5349
 000A52D4    cmp         byte ptr [ebp-1DD],0
>000A52DB    je          000A5311
 000A52DD    lea         edx,[ebp-208]
 000A52E3    mov         eax,829
 000A52E8    call        LoadStr;'Insufficient paper width/height. Change settings
Margins/Font size/Orientation/Bytes per row
or select "Print text below".'
 000A52ED    mov         eax,dword ptr [ebp-208]
 000A52F3    call        0008D0A8
 000A52F8    mov         eax,dword ptr [ebp-4]
 000A52FB    xor         edx,edx
 000A52FD    mov         dword ptr [eax+22C],edx;TFormPrint.FModalResult:TModalResult
 000A5303    mov         eax,dword ptr [ebp-4]
 000A5306    mov         eax,dword ptr [eax+338];TFormPrint.?f338:TCMReport
 000A530C    call        000959EC
 000A5311    cmp         byte ptr [ebp-1F9],0
>000A5318    jne         000A5349
 000A531A    cmp         byte ptr [ebp-1DD],0
>000A5321    jne         000A5349
 000A5323    mov         eax,dword ptr [ebp-4]
 000A5326    mov         eax,dword ptr [eax+338];TFormPrint.?f338:TCMReport
 000A532C    mov         ecx,41
 000A5331    mov         edx,0A5430;'Preview'
 000A5336    call        000961DC
 000A533B    mov         eax,dword ptr [ebp-4]
 000A533E    mov         eax,dword ptr [eax+338];TFormPrint.?f338:TCMReport
 000A5344    call        000959EC
 000A5349    xor         eax,eax
 000A534B    pop         edx
 000A534C    pop         ecx
 000A534D    pop         ecx
 000A534E    mov         dword ptr fs:[eax],edx
 000A5351    push        0A53B0
 000A5356    lea         eax,[ebp-214]
 000A535C    call        @LStrClr
 000A5361    lea         eax,[ebp-208]
 000A5367    call        @LStrClr
 000A536C    lea         eax,[ebp-204]
 000A5372    call        @LStrClr
 000A5377    lea         eax,[ebp-200]
 000A537D    call        @LStrClr
 000A5382    lea         eax,[ebp-1E8]
 000A5388    mov         edx,2
 000A538D    call        @LStrArrayClr
 000A5392    lea         eax,[ebp-1DC]
 000A5398    call        @LStrClr
 000A539D    lea         eax,[ebp-1D4]
 000A53A3    call        @LStrClr
 000A53A8    ret
>000A53A9    jmp         @HandleFinally
>000A53AE    jmp         000A5356
 000A53B0    pop         edi
 000A53B1    pop         esi
 000A53B2    pop         ebx
 000A53B3    mov         esp,ebp
 000A53B5    pop         ebp
 000A53B6    ret
*}
end;

end.