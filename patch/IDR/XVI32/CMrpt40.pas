//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMrpt40;

interface

uses
  SysUtils, Classes, Graphics, XVI32_Print, ExtCtrls, Forms, ComCtrls, Cmbtn40;

type
  TLineSpacing = (lsHalf, lsSingle, lsSingleAndHalf, lsDouble);
  TMeasureUnit = (puMM, puInch, puChar);
  TLayoutOption = (loBorderTop, loBorderBottom, loHeaderBold, loTableHeaderLinesBold, loFooterBold, loWordWrap);
  TLayoutOptions = set of TLayoutOption;
  TPrnMetafileCanvas = class(TCanvas)
  public
    f54:dword;//f54
    destructor Destroy; virtual;//00094E84
    //constructor Create(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00094C20
  end;
  TCMReport = class(TComponent)
  public
    f28:TList;//f28
    f2C:dword;//f2C
    PreviewEnabled:Boolean;//f30
    Aborted:Boolean;//f31
    Printing:Boolean;//f32
    f34:TCanvas;//f34
    f38:TFont;//f38
    Layout:TLayoutOptions;//f45
    TableSeparator:Char;//f46
    LineNumber:Integer;//f48
    PageNumber:Integer;//f4C
    Header:String;//f50
    Footer:String;//f54
    HeaderLines:TStrings;//f58
    TableFormat:String;//f5C
    TableHeaderLines:TStrings;//f60
    TableFormatLines:TStrings;//f64
    MeasureUnit:TMeasureUnit;//f68
    LineSpacing:TLineSpacing;//f69
    f6C:dword;//f6C
    f70:dword;//f70
    f74:dword;//f74
    f78:dword;//f78
    f7C:dword;//f7C
    f80:Double;//f80
    f84:dword;//f84
    f88:Double;//f88
    f8C:dword;//f8C
    f90:Double;//f90
    f94:dword;//f94
    f98:Double;//f98
    f9C:dword;//f9C
    fA0:dword;//fA0
    fA4:dword;//fA4
    fA8:dword;//fA8
    fAC:dword;//fAC
    fB0:dword;//fB0
    OnBeginDoc:TNotifyEvent;//fB4
    OnEndDoc:TNotifyEvent;//fBC
    OnAbort:TNotifyEvent;//fC4
    OnNewLine:TNotifyEvent;//fCC
    OnBeforeNewPage:TNotifyEvent;//fD4
    OnAfterNewPage:TNotifyEvent;//fDC
    fE0:TFormPrint;//fE0
    fEC:dword;//fEC
    fF0:dword;//fF0
    f104:dword;//f104
    f108:dword;//f108
    destructor Destroy; virtual;//00095184
    constructor Create(AOwner:TComponent); virtual;//v2C//00094ED0
    procedure GetMarginPhysX;//0009593C
    procedure GetMarginPhysY;//00095954
    procedure GetPaperHeight;//0009596C
    procedure GetPaperWidth;//00095998
    procedure SetMeasureUnit(Value:TMeasureUnit);//000972F4
    procedure SetHeaderLines(Value:TStrings);//000972F8
    procedure SetTableFormatLines(Value:TStrings);//00097308
    procedure SetTableHeaderLines(Value:TStrings);//00097318
    procedure SetPreviewEnabled(Value:Boolean);//00097328
    procedure SetLineSpacing(Value:TLineSpacing);//0009732C
    //procedure SetMarginLeft(Value:Double; ?:?; ?:?);//00097344
    //function GetMarginLeft:?;//000973A8
    //procedure SetMarginRight(Value:Double; ?:?; ?:?);//000973DC
    //function GetMarginRight:?;//00097440
    //procedure SetMarginTop(Value:Double; ?:?; ?:?);//00097474
    //function GetMarginTop:?;//000974D8
    //procedure SetMarginBottom(Value:Double; ?:?; ?:?);//0009750C
    //function GetMarginBottom:?;//00097570
    //function GetFont:?;//000975A4
    procedure SetFont(Value:TFont);//000975CC
    //procedure GetTitle(?:?);//000975F8
    procedure SetTitle(Value:AnsiString);//0009760C
    procedure GetPrinterIndex;//0009765C
    procedure SetPrinterIndex(Value:Integer);//00097668
    procedure GetCopies;//00097764
    procedure SetCopies(Value:Integer);//00097770
    //function GetOrientation:?;//00097784
    procedure SetOrientation(Value:TPrinterOrientation);//00097790
    procedure SetLayout(Value:TLayoutOptions);//00097820
  end;
  TFormPreview = class(TForm)
  published
    Panel1:TPanel;//f2C4
    ScrollBox1:TScrollBox;//f2C8
    PaintBox1:TPaintBox;//f2CC
    StatusBar1:TStatusBar;//f2D0
    CMBtnFirst:TCMBtn;//f2D4
    CMBtnPrevious:TCMBtn;//f2D8
    CMBtnNext:TCMBtn;//f2DC
    CMBtnLast:TCMBtn;//f2E0
    CMBtnZoom:TCMBtn;//f2E4
    CMBtnPrint1:TCMBtn;//f2E8
    CMBtnPrintAll:TCMBtn;//f2EC
    CMBtnExit:TCMBtn;//f2F0
    CMBtnHelp:TCMBtn;//f2F4
    procedure CMBtnExitClick;//00098014
    procedure CMBtnPrintAllClick;//00097C90
    procedure CMBtnPrint1Click;//00097BF4
    procedure FormCreate(Sender:TObject);//00097878
    procedure FormKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//00097A54
    procedure CMBtnHelpClick;//0009801C
    procedure PaintBox1MouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00097F64
    procedure CMBtnPreviousClick;//00097B7C
    procedure CMBtnFirstClick;//00097B68
    procedure PaintBox1Paint(Sender:TObject);//00097A3C
    procedure CMBtnZoomClick;//00097BB8
    procedure CMBtnLastClick;//00097BA4
    procedure CMBtnNextClick;//00097B90
  public
    f2F8:dword;//f2F8
    f2FC:dword;//f2FC
    f300:dword;//f300
    f304:Double;//f304
    f30C:Integer;//f30C
    f310:Integer;//f310
    //f314:?;//f314
  end;
    //procedure sub_00094B2C(?:AnsiString; ?:?; ?:?; ?:?);//00094B2C
    //constructor sub_00094CDC(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00094CDC
    destructor Destroy;//00094E84
    constructor Create(AOwner:TComponent);//00094ED0
    destructor Destroy;//00095184
    procedure sub_000951D8(?:TCMReport);//000951D8
    procedure sub_00095334(?:TCMReport);//00095334
    //procedure sub_0009537C(?:?);//0009537C
    //procedure sub_000953B4(?:?);//000953B4
    //procedure sub_000953C4(?:?; ?:AnsiString; ?:AnsiString);//000953C4
    //function sub_00095624(?:TCMReport; ?:dword):?;//00095624
    //function sub_000956C0(?:TCMReport; ?:dword):?;//000956C0
    //function sub_0009575C(?:TCMReport; ?:?):?;//0009575C
    //function sub_000957D4(?:TCMReport; ?:?):?;//000957D4
    //function sub_0009584C(?:TCMReport; ?:?; ?:?):?;//0009584C
    //function sub_00095890(?:TCMReport; ?:?; ?:?):?;//00095890
    //procedure sub_000958D4(?:?; ?:AnsiString; ?:?);//000958D4
    //procedure sub_00095900(?:TCMReport; ?:?);//00095900
    //function sub_000959C4(?:?):?;//000959C4
    //function sub_000959D4(?:?):?;//000959D4
    procedure sub_000959EC(?:TCMReport);//000959EC
    //procedure sub_00095AA4(?:?);//00095AA4
    procedure sub_00095C40(?:TCMReport);//00095C40
    //procedure sub_00095CF8(?:dword; ?:dword; ?:?);//00095CF8
    procedure sub_00095E00(?:dword; ?:dword);//00095E00
    //procedure sub_000961DC(?:TCMReport; ?:AnsiString; ?:?);//000961DC
    //function sub_00096328(?:?):?;//00096328
    //procedure sub_00096338(?:?);//00096338
    //function sub_00096344(?:TCMReport; ?:TLineSpacing):?;//00096344
    //procedure sub_000963A8(?:?; ?:AnsiString; ?:?);//000963A8
    //function sub_00096474(?:?; ?:?; ?:?; ?:?; ?:?):?;//00096474
    //function sub_00096560(?:?; ?:?):?;//00096560
    //procedure sub_000965A0(?:?; ?:AnsiString; ?:?; ?:?; ?:?);//000965A0
    //function sub_00096958:?;//00096958
    //procedure sub_0009696C(?:?; ?:AnsiString; ?:?; ?:?; ?:?; ?:?);//0009696C
    //procedure sub_00096AA8(?:?; ?:AnsiString; ?:?; ?:?);//00096AA8
    //function sub_00096BF4(?:?; ?:AnsiString):?;//00096BF4
    //procedure sub_00096EA0(?:?; ?:?);//00096EA0
    //procedure sub_00096F18(?:?);//00096F18
    //function sub_00097838(?:?):?;//00097838
    //function sub_00097854(?:?; ?:?):Boolean;//00097854
    //procedure sub_00097E24(?:?);//00097E24
    //procedure sub_00097EB4(?:?);//00097EB4

implementation

{$R *.DFM}

//00094B2C
{*procedure sub_00094B2C(?:AnsiString; ?:?; ?:?; ?:?);
begin
 00094B2C    push        ebp
 00094B2D    mov         ebp,esp
 00094B2F    add         esp,0FFFFFFEC
 00094B32    push        ebx
 00094B33    xor         ebx,ebx
 00094B35    mov         dword ptr [ebp-10],ebx
 00094B38    mov         dword ptr [ebp-14],ebx
 00094B3B    mov         dword ptr [ebp-0C],ecx
 00094B3E    mov         dword ptr [ebp-8],edx
 00094B41    mov         dword ptr [ebp-4],eax
 00094B44    mov         eax,dword ptr [ebp-4]
 00094B47    call        @LStrAddRef
 00094B4C    mov         eax,dword ptr [ebp-8]
 00094B4F    call        @LStrAddRef
 00094B54    mov         eax,dword ptr [ebp-0C]
 00094B57    call        @LStrAddRef
 00094B5C    xor         eax,eax
 00094B5E    push        ebp
 00094B5F    push        94C0F
 00094B64    push        dword ptr fs:[eax]
 00094B67    mov         dword ptr fs:[eax],esp
 00094B6A    mov         edx,dword ptr [ebp-8]
 00094B6D    mov         eax,dword ptr [ebp-4]
 00094B70    call        @LStrPos
 00094B75    mov         ebx,eax
 00094B77    test        ebx,ebx
>00094B79    jne         00094BE9
 00094B7B    mov         edx,dword ptr [ebp-0C]
 00094B7E    mov         eax,dword ptr [ebp-4]
 00094B81    call        @LStrPos
 00094B86    mov         ebx,eax
 00094B88    test        ebx,ebx
>00094B8A    jle         00094BE9
 00094B8C    lea         eax,[ebp-10]
 00094B8F    push        eax
 00094B90    mov         ecx,ebx
 00094B92    dec         ecx
 00094B93    mov         edx,1
 00094B98    mov         eax,dword ptr [ebp-0C]
 00094B9B    call        @LStrCopy
 00094BA0    push        dword ptr [ebp-10]
 00094BA3    push        dword ptr [ebp-8]
 00094BA6    lea         eax,[ebp-14]
 00094BA9    push        eax
 00094BAA    mov         eax,dword ptr [ebp-0C]
 00094BAD    call        @LStrLen
 00094BB2    push        eax
 00094BB3    mov         eax,dword ptr [ebp-4]
 00094BB6    call        @LStrLen
 00094BBB    mov         edx,eax
 00094BBD    add         edx,ebx
 00094BBF    mov         eax,dword ptr [ebp-0C]
 00094BC2    pop         ecx
 00094BC3    call        @LStrCopy
 00094BC8    push        dword ptr [ebp-14]
 00094BCB    lea         eax,[ebp-0C]
 00094BCE    mov         edx,3
 00094BD3    call        @LStrCatN
 00094BD8    mov         edx,dword ptr [ebp-0C]
 00094BDB    mov         eax,dword ptr [ebp-4]
 00094BDE    call        @LStrPos
 00094BE3    mov         ebx,eax
 00094BE5    test        ebx,ebx
>00094BE7    jg          00094B8C
 00094BE9    mov         eax,dword ptr [ebp+8]
 00094BEC    mov         edx,dword ptr [ebp-0C]
 00094BEF    call        @LStrLAsg
 00094BF4    xor         eax,eax
 00094BF6    pop         edx
 00094BF7    pop         ecx
 00094BF8    pop         ecx
 00094BF9    mov         dword ptr fs:[eax],edx
 00094BFC    push        94C16
 00094C01    lea         eax,[ebp-14]
 00094C04    mov         edx,5
 00094C09    call        @LStrArrayClr
 00094C0E    ret
>00094C0F    jmp         @HandleFinally
>00094C14    jmp         00094C01
 00094C16    pop         ebx
 00094C17    mov         esp,ebp
 00094C19    pop         ebp
 00094C1A    ret         4
end;*}

//00094C20
{*constructor TPrnMetafileCanvas.Create(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00094C20    push        ebp
 00094C21    mov         ebp,esp
 00094C23    push        0
 00094C25    push        0
 00094C27    push        ebx
 00094C28    push        esi
 00094C29    push        edi
 00094C2A    test        dl,dl
>00094C2C    je          00094C36
 00094C2E    add         esp,0FFFFFFF0
 00094C31    call        @ClassCreate
 00094C36    mov         edi,ecx
 00094C38    mov         ebx,edx
 00094C3A    mov         esi,eax
 00094C3C    xor         eax,eax
 00094C3E    push        ebp
 00094C3F    push        94CB4
 00094C44    push        dword ptr fs:[eax]
 00094C47    mov         dword ptr fs:[eax],esp
 00094C4A    lea         edx,[ebp-4]
 00094C4D    mov         eax,edi
 00094C4F    call        TMetafile.GetAuthor
 00094C54    mov         eax,dword ptr [ebp-4]
 00094C57    push        eax
 00094C58    lea         edx,[ebp-8]
 00094C5B    mov         eax,edi
 00094C5D    call        TMetafile.GetDesc
 00094C62    mov         eax,dword ptr [ebp-8]
 00094C65    push        eax
 00094C66    mov         eax,dword ptr [ebp+2C]
 00094C69    push        eax
 00094C6A    mov         eax,dword ptr [ebp+28]
 00094C6D    push        eax
 00094C6E    mov         eax,dword ptr [ebp+24]
 00094C71    push        eax
 00094C72    mov         eax,dword ptr [ebp+20]
 00094C75    push        eax
 00094C76    mov         eax,dword ptr [ebp+1C]
 00094C79    push        eax
 00094C7A    mov         eax,dword ptr [ebp+18]
 00094C7D    push        eax
 00094C7E    mov         eax,dword ptr [ebp+14]
 00094C81    push        eax
 00094C82    mov         eax,dword ptr [ebp+10]
 00094C85    push        eax
 00094C86    mov         eax,dword ptr [ebp+0C]
 00094C89    push        eax
 00094C8A    mov         eax,dword ptr [ebp+8]
 00094C8D    push        eax
 00094C8E    mov         ecx,edi
 00094C90    xor         edx,edx
 00094C92    mov         eax,esi
 00094C94    call        00094CDC
 00094C99    xor         eax,eax
 00094C9B    pop         edx
 00094C9C    pop         ecx
 00094C9D    pop         ecx
 00094C9E    mov         dword ptr fs:[eax],edx
 00094CA1    push        94CBB
 00094CA6    lea         eax,[ebp-8]
 00094CA9    mov         edx,2
 00094CAE    call        @LStrArrayClr
 00094CB3    ret
>00094CB4    jmp         @HandleFinally
>00094CB9    jmp         00094CA6
 00094CBB    mov         eax,esi
 00094CBD    test        bl,bl
>00094CBF    je          00094CD0
 00094CC1    call        @AfterConstruction
 00094CC6    pop         dword ptr fs:[0]
 00094CCD    add         esp,0C
 00094CD0    mov         eax,esi
 00094CD2    pop         edi
 00094CD3    pop         esi
 00094CD4    pop         ebx
 00094CD5    pop         ecx
 00094CD6    pop         ecx
 00094CD7    pop         ebp
 00094CD8    ret         28
end;*}

//00094CDC
{*constructor sub_00094CDC(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00094CDC    push        ebp
 00094CDD    mov         ebp,esp
 00094CDF    add         esp,0FFFFFFE4
 00094CE2    push        ebx
 00094CE3    push        esi
 00094CE4    push        edi
 00094CE5    xor         ebx,ebx
 00094CE7    mov         dword ptr [ebp-1C],ebx
 00094CEA    test        dl,dl
>00094CEC    je          00094CF6
 00094CEE    add         esp,0FFFFFFF0
 00094CF1    call        @ClassCreate
 00094CF6    mov         dword ptr [ebp-8],ecx
 00094CF9    mov         byte ptr [ebp-1],dl
 00094CFC    mov         ebx,eax
 00094CFE    mov         esi,dword ptr [ebp+34]
 00094D01    xor         eax,eax
 00094D03    push        ebp
 00094D04    push        94E41
 00094D09    push        dword ptr fs:[eax]
 00094D0C    mov         dword ptr fs:[eax],esp
 00094D0F    xor         edx,edx
 00094D11    mov         eax,ebx
 00094D13    call        TCanvas.Create
 00094D18    mov         edi,dword ptr [ebp-8]
 00094D1B    mov         dword ptr [ebx+54],edi
 00094D1E    mov         eax,edi
 00094D20    call        TMetafile.GetMMWidth
 00094D25    test        eax,eax
>00094D27    jne         00094D64
 00094D29    mov         eax,dword ptr [ebx+54]
 00094D2C    mov         edx,dword ptr [eax]
 00094D2E    call        dword ptr [edx+2C]
 00094D31    test        eax,eax
>00094D33    jne         00094D43
 00094D35    imul        edx,dword ptr [ebp+1C],64
 00094D39    mov         eax,dword ptr [ebx+54]
 00094D3C    call        TMetafile.SetMMWidth
>00094D41    jmp         00094D64
 00094D43    mov         eax,dword ptr [ebp+14]
 00094D46    push        eax
 00094D47    imul        eax,dword ptr [ebp+1C],64
 00094D4B    push        eax
 00094D4C    mov         eax,dword ptr [ebx+54]
 00094D4F    mov         edx,dword ptr [eax]
 00094D51    call        dword ptr [edx+2C]
 00094D54    push        eax
 00094D55    call        kernel32.MulDiv
 00094D5A    mov         edx,eax
 00094D5C    mov         eax,dword ptr [ebx+54]
 00094D5F    call        TMetafile.SetMMWidth
 00094D64    mov         eax,dword ptr [ebx+54]
 00094D67    call        TMetafile.GetMMHeight
 00094D6C    test        eax,eax
>00094D6E    jne         00094DAB
 00094D70    mov         eax,dword ptr [ebx+54]
 00094D73    mov         edx,dword ptr [eax]
 00094D75    call        dword ptr [edx+20]
 00094D78    test        eax,eax
>00094D7A    jne         00094D8A
 00094D7C    imul        edx,dword ptr [ebp+18],64
 00094D80    mov         eax,dword ptr [ebx+54]
 00094D83    call        TMetafile.SetMMHeight
>00094D88    jmp         00094DAB
 00094D8A    mov         eax,dword ptr [ebp+10]
 00094D8D    push        eax
 00094D8E    imul        eax,dword ptr [ebp+18],64
 00094D92    push        eax
 00094D93    mov         eax,dword ptr [ebx+54]
 00094D96    mov         edx,dword ptr [eax]
 00094D98    call        dword ptr [edx+20]
 00094D9B    push        eax
 00094D9C    call        kernel32.MulDiv
 00094DA1    mov         edx,eax
 00094DA3    mov         eax,dword ptr [ebx+54]
 00094DA6    call        TMetafile.SetMMHeight
 00094DAB    mov         eax,dword ptr [ebx+54]
 00094DAE    call        TMetafile.GetMMHeight
 00094DB3    push        eax
 00094DB4    lea         eax,[ebp-18]
 00094DB7    push        eax
 00094DB8    mov         eax,dword ptr [ebx+54]
 00094DBB    call        TMetafile.GetMMWidth
 00094DC0    mov         ecx,eax
 00094DC2    xor         edx,edx
 00094DC4    xor         eax,eax
 00094DC6    call        Rect
 00094DCB    mov         eax,esi
 00094DCD    call        @LStrLen
 00094DD2    test        eax,eax
>00094DD4    jg          00094DE2
 00094DD6    mov         eax,dword ptr [ebp+30]
 00094DD9    call        @LStrLen
 00094DDE    test        eax,eax
>00094DE0    jle         00094E09
 00094DE2    push        esi
 00094DE3    push        94E74;#0
 00094DE8    push        dword ptr [ebp+30]
 00094DEB    push        94E80;#0+#0
 00094DF0    lea         eax,[ebp-1C]
 00094DF3    mov         edx,4
 00094DF8    call        @LStrCatN
 00094DFD    mov         eax,dword ptr [ebp-1C]
 00094E00    call        @LStrToPChar
 00094E05    mov         esi,eax
>00094E07    jmp         00094E0B
 00094E09    xor         esi,esi
 00094E0B    push        esi
 00094E0C    lea         eax,[ebp-18]
 00094E0F    push        eax
 00094E10    push        0
 00094E12    call        Printer
 00094E17    call        TPrinter.GetHandle
 00094E1C    push        eax
 00094E1D    call        gdi32.CreateEnhMetaFileA
 00094E22    mov         edx,eax
 00094E24    mov         eax,ebx
 00094E26    call        TCanvas.SetHandle
 00094E2B    xor         eax,eax
 00094E2D    pop         edx
 00094E2E    pop         ecx
 00094E2F    pop         ecx
 00094E30    mov         dword ptr fs:[eax],edx
 00094E33    push        94E48
 00094E38    lea         eax,[ebp-1C]
 00094E3B    call        @LStrClr
 00094E40    ret
>00094E41    jmp         @HandleFinally
>00094E46    jmp         00094E38
 00094E48    mov         eax,ebx
 00094E4A    cmp         byte ptr [ebp-1],0
>00094E4E    je          00094E5F
 00094E50    call        @AfterConstruction
 00094E55    pop         dword ptr fs:[0]
 00094E5C    add         esp,0C
 00094E5F    mov         eax,ebx
 00094E61    pop         edi
 00094E62    pop         esi
 00094E63    pop         ebx
 00094E64    mov         esp,ebp
 00094E66    pop         ebp
 00094E67    ret         30
end;*}

//00094E84
destructor TPrnMetafileCanvas.Destroy;
begin
{*
 00094E84    push        ebx
 00094E85    push        esi
 00094E86    push        edi
 00094E87    call        @BeforeDestruction
 00094E8C    mov         ebx,edx
 00094E8E    mov         edi,eax
 00094E90    mov         eax,edi
 00094E92    call        TCanvas.GetHandle
 00094E97    mov         esi,eax
 00094E99    xor         edx,edx
 00094E9B    mov         eax,edi
 00094E9D    call        TCanvas.SetHandle
 00094EA2    push        esi
 00094EA3    call        gdi32.CloseEnhMetaFile
 00094EA8    mov         edx,eax
 00094EAA    mov         eax,dword ptr [edi+54];TPrnMetafileCanvas..:dword
 00094EAD    call        TMetafile.SetHandle
 00094EB2    mov         edx,ebx
 00094EB4    and         dl,0FC
 00094EB7    mov         eax,edi
 00094EB9    call        TCanvas.Destroy
 00094EBE    test        bl,bl
>00094EC0    jle         00094EC9
 00094EC2    mov         eax,edi
 00094EC4    call        @ClassDestroy
 00094EC9    pop         edi
 00094ECA    pop         esi
 00094ECB    pop         ebx
 00094ECC    ret
*}
end;

//00094ED0
constructor TCMReport.Create(AOwner:TComponent);
begin
{*
 00094ED0    push        ebp
 00094ED1    mov         ebp,esp
 00094ED3    add         esp,0FFFFFFF8
 00094ED6    push        ebx
 00094ED7    push        esi
 00094ED8    push        edi
 00094ED9    test        dl,dl
>00094EDB    je          00094EE5
 00094EDD    add         esp,0FFFFFFF0
 00094EE0    call        @ClassCreate
 00094EE5    mov         byte ptr [ebp-5],dl
 00094EE8    mov         dword ptr [ebp-4],eax
 00094EEB    xor         edx,edx
 00094EED    mov         eax,dword ptr [ebp-4]
 00094EF0    call        TComponent.Create
 00094EF5    xor         eax,eax
 00094EF7    push        ebp
 00094EF8    push        94F21
 00094EFD    push        dword ptr fs:[eax]
 00094F00    mov         dword ptr fs:[eax],esp
 00094F03    call        Printer
 00094F08    call        TPrinter.GetPrinters
 00094F0D    mov         edx,dword ptr [eax]
 00094F0F    call        dword ptr [edx+14];TStrings.GetCount
 00094F12    test        eax,eax
 00094F14    setg        bl
 00094F17    xor         eax,eax
 00094F19    pop         edx
 00094F1A    pop         ecx
 00094F1B    pop         ecx
 00094F1C    mov         dword ptr fs:[eax],edx
>00094F1F    jmp         00094F2D
>00094F21    jmp         @HandleAnyException
 00094F26    xor         ebx,ebx
 00094F28    call        @DoneExcept
 00094F2D    test        bl,bl
>00094F2F    jne         00094F56
 00094F31    push        0
 00094F33    mov         cx,word ptr ds:[950F0];0x4 gvar_000950F0
 00094F3A    mov         dl,1
 00094F3C    mov         eax,950FC;'No printer installed!'
 00094F41    call        MessageDlg
 00094F46    or          edx,0FFFFFFFF
 00094F49    mov         eax,dword ptr [ebp-4]
 00094F4C    call        TComponent.Destroy
>00094F51    jmp         000950CD
 00094F56    mov         dl,1
 00094F58    mov         eax,[00028720];TFont
 00094F5D    call        TFont.Create;TFont.Create
 00094F62    mov         edx,dword ptr [ebp-4]
 00094F65    mov         dword ptr [edx+38],eax;TCMReport.?f38:TFont
 00094F68    call        Printer
 00094F6D    call        TPrinter.GetCanvas
 00094F72    mov         edx,dword ptr [ebp-4]
 00094F75    mov         dword ptr [edx+34],eax;TCMReport.?f34:TCanvas
 00094F78    mov         eax,dword ptr [ebp-4]
 00094F7B    mov         byte ptr [eax+68],0;TCMReport.MeasureUnit:TMeasureUnit
 00094F7F    or          edx,0FFFFFFFF
 00094F82    mov         eax,dword ptr [ebp-4]
 00094F85    call        TCMReport.SetPrinterIndex
 00094F8A    mov         eax,dword ptr [ebp-4]
 00094F8D    call        TCMReport.GetFont
 00094F92    mov         edx,9511C;'Courier New'
 00094F97    call        TFont.SetName
 00094F9C    mov         eax,dword ptr [ebp-4]
 00094F9F    call        TCMReport.GetFont
 00094FA4    mov         edx,0A
 00094FA9    call        TFont.SetSize
 00094FAE    mov         eax,dword ptr [ebp-4]
 00094FB1    call        TCMReport.GetFont
 00094FB6    mov         dl,byte ptr ds:[95128];0x0 gvar_00095128
 00094FBC    call        TFont.SetStyle
 00094FC1    mov         dl,1
 00094FC3    mov         eax,dword ptr [ebp-4]
 00094FC6    call        TCMReport.SetLineSpacing
 00094FCB    push        402E0000
 00094FD0    push        0
 00094FD2    mov         eax,dword ptr [ebp-4]
 00094FD5    call        TCMReport.SetMarginLeft
 00094FDA    push        402E0000
 00094FDF    push        0
 00094FE1    mov         eax,dword ptr [ebp-4]
 00094FE4    call        TCMReport.SetMarginRight
 00094FE9    push        402E0000
 00094FEE    push        0
 00094FF0    mov         eax,dword ptr [ebp-4]
 00094FF3    call        TCMReport.SetMarginTop
 00094FF8    push        402E0000
 00094FFD    push        0
 00094FFF    mov         eax,dword ptr [ebp-4]
 00095002    call        TCMReport.SetMarginBottom
 00095007    mov         eax,dword ptr [ebp-4]
 0009500A    add         eax,50;TCMReport.Header:String
 0009500D    mov         edx,95134;'>{Printed %DATE %TIME}'
 00095012    call        @LStrAsg
 00095017    mov         eax,dword ptr [ebp-4]
 0009501A    add         eax,54;TCMReport.Footer:String
 0009501D    mov         edx,95154;'<{Program %EXENAME %EXETIME}^{Page %PAGE}'
 00095022    call        @LStrAsg
 00095027    mov         dl,1
 00095029    mov         eax,[0001F340];TStringList
 0009502E    call        TObject.Create;TStringList.Create
 00095033    mov         edx,dword ptr [ebp-4]
 00095036    mov         dword ptr [edx+58],eax;TCMReport.HeaderLines:TStrings
 00095039    mov         dl,1
 0009503B    mov         eax,[0001F340];TStringList
 00095040    call        TObject.Create;TStringList.Create
 00095045    mov         edx,dword ptr [ebp-4]
 00095048    mov         dword ptr [edx+60],eax;TCMReport.TableHeaderLines:TStrings
 0009504B    mov         dl,1
 0009504D    mov         eax,[0001F340];TStringList
 00095052    call        TObject.Create;TStringList.Create
 00095057    mov         edx,dword ptr [ebp-4]
 0009505A    mov         dword ptr [edx+64],eax;TCMReport.TableFormatLines:TStrings
 0009505D    mov         eax,dword ptr [ebp-4]
 00095060    mov         byte ptr [eax+46],7C;TCMReport.TableSeparator:Char
 00095064    mov         eax,dword ptr [ebp-4]
 00095067    mov         dl,byte ptr ds:[95180];0x3F gvar_00095180
 0009506D    mov         byte ptr [eax+45],dl;TCMReport.Layout:TLayoutOptions
 00095070    mov         eax,dword ptr [ebp-4]
 00095073    mov         eax,dword ptr [eax+78];TCMReport.?f78:dword
 00095076    mov         edx,dword ptr [ebp-4]
 00095079    mov         dword ptr [edx+0AC],eax;TCMReport.?fAC:dword
 0009507F    mov         eax,dword ptr [ebp-4]
 00095082    mov         eax,dword ptr [eax+70];TCMReport.?f70:dword
 00095085    mov         edx,dword ptr [ebp-4]
 00095088    mov         dword ptr [edx+0B0],eax;TCMReport.?fB0:dword
 0009508E    mov         eax,dword ptr [ebp-4]
 00095091    xor         edx,edx
 00095093    mov         dword ptr [eax+48],edx;TCMReport.LineNumber:Integer
 00095096    mov         eax,dword ptr [ebp-4]
 00095099    xor         edx,edx
 0009509B    mov         dword ptr [eax+4C],edx;TCMReport.PageNumber:Integer
 0009509E    mov         eax,dword ptr [ebp-4]
 000950A1    xor         edx,edx
 000950A3    mov         dword ptr [eax+0A0],edx;TCMReport.?fA0:dword
 000950A9    mov         dl,1
 000950AB    mov         eax,[0001EEC4];TList
 000950B0    call        TObject.Create;TList.Create
 000950B5    mov         edx,dword ptr [ebp-4]
 000950B8    mov         dword ptr [edx+28],eax;TCMReport.?f28:TList
 000950BB    mov         eax,dword ptr [ebp-4]
 000950BE    xor         edx,edx
 000950C0    mov         dword ptr [eax+2C],edx;TCMReport.?f2C:dword
 000950C3    mov         dl,1
 000950C5    mov         eax,dword ptr [ebp-4]
 000950C8    call        TCMReport.SetPreviewEnabled
 000950CD    mov         eax,dword ptr [ebp-4]
 000950D0    cmp         byte ptr [ebp-5],0
>000950D4    je          000950E5
 000950D6    call        @AfterConstruction
 000950DB    pop         dword ptr fs:[0]
 000950E2    add         esp,0C
 000950E5    mov         eax,dword ptr [ebp-4]
 000950E8    pop         edi
 000950E9    pop         esi
 000950EA    pop         ebx
 000950EB    pop         ecx
 000950EC    pop         ecx
 000950ED    pop         ebp
 000950EE    ret
*}
end;

//00095184
destructor TCMReport.Destroy;
begin
{*
 00095184    push        ebx
 00095185    push        esi
 00095186    call        @BeforeDestruction
 0009518B    mov         ebx,edx
 0009518D    mov         esi,eax
 0009518F    mov         eax,esi
 00095191    call        00095334
 00095196    mov         eax,dword ptr [esi+28];TCMReport.?f28:TList
 00095199    call        TObject.Free
 0009519E    mov         eax,dword ptr [esi+58];TCMReport.HeaderLines:TStrings
 000951A1    call        TObject.Free
 000951A6    mov         eax,dword ptr [esi+60];TCMReport.TableHeaderLines:TStrings
 000951A9    call        TObject.Free
 000951AE    mov         eax,dword ptr [esi+64];TCMReport.TableFormatLines:TStrings
 000951B1    call        TObject.Free
 000951B6    mov         eax,dword ptr [esi+38];TCMReport.?f38:TFont
 000951B9    call        TObject.Free
 000951BE    mov         edx,ebx
 000951C0    and         dl,0FC
 000951C3    mov         eax,esi
 000951C5    call        TComponent.Destroy
 000951CA    test        bl,bl
>000951CC    jle         000951D5
 000951CE    mov         eax,esi
 000951D0    call        @ClassDestroy
 000951D5    pop         esi
 000951D6    pop         ebx
 000951D7    ret
*}
end;

//000951D8
procedure sub_000951D8(?:TCMReport);
begin
{*
 000951D8    push        ebp
 000951D9    mov         ebp,esp
 000951DB    add         esp,0FFFFFF04
 000951E1    push        ebx
 000951E2    mov         ebx,eax
 000951E4    lea         eax,[ebp-0FB]
 000951EA    push        eax
 000951EB    lea         eax,[ebp-4]
 000951EE    push        eax
 000951EF    call        Printer
 000951F4    lea         ecx,[ebp-0AA]
 000951FA    lea         edx,[ebp-59]
 000951FD    call        TPrinter.GetPrinter
 00095202    lea         eax,[ebp-0FB]
 00095208    push        eax
 00095209    push        0
 0009520B    call        Printer
 00095210    lea         ecx,[ebp-0AA]
 00095216    lea         edx,[ebp-59]
 00095219    call        TPrinter.SetPrinter
 0009521E    lea         eax,[ebp-0FB]
 00095224    push        eax
 00095225    lea         eax,[ebp-4]
 00095228    push        eax
 00095229    call        Printer
 0009522E    lea         ecx,[ebp-0AA]
 00095234    lea         edx,[ebp-59]
 00095237    call        TPrinter.GetPrinter
 0009523C    push        0
 0009523E    lea         eax,[ebp-0FB]
 00095244    push        eax
 00095245    lea         eax,[ebp-59]
 00095248    push        eax
 00095249    lea         eax,[ebp-0AA]
 0009524F    push        eax
 00095250    call        gdi32.CreateICA
 00095255    mov         dword ptr [ebp-8],eax
 00095258    xor         eax,eax
 0009525A    push        ebp
 0009525B    push        95327
 00095260    push        dword ptr fs:[eax]
 00095263    mov         dword ptr fs:[eax],esp
 00095266    push        58
 00095268    mov         eax,dword ptr [ebp-8]
 0009526B    push        eax
 0009526C    call        gdi32.GetDeviceCaps
 00095271    mov         dword ptr [ebx+0E4],eax
 00095277    push        5A
 00095279    mov         eax,dword ptr [ebp-8]
 0009527C    push        eax
 0009527D    call        gdi32.GetDeviceCaps
 00095282    mov         dword ptr [ebx+0E8],eax
 00095288    push        6E
 0009528A    mov         eax,dword ptr [ebp-8]
 0009528D    push        eax
 0009528E    call        gdi32.GetDeviceCaps
 00095293    mov         dword ptr [ebx+0EC],eax
 00095299    push        6F
 0009529B    mov         eax,dword ptr [ebp-8]
 0009529E    push        eax
 0009529F    call        gdi32.GetDeviceCaps
 000952A4    mov         dword ptr [ebx+0F0],eax
 000952AA    push        70
 000952AC    mov         eax,dword ptr [ebp-8]
 000952AF    push        eax
 000952B0    call        gdi32.GetDeviceCaps
 000952B5    mov         dword ptr [ebx+104],eax
 000952BB    push        71
 000952BD    mov         eax,dword ptr [ebp-8]
 000952C0    push        eax
 000952C1    call        gdi32.GetDeviceCaps
 000952C6    mov         dword ptr [ebx+108],eax
 000952CC    push        8
 000952CE    mov         eax,dword ptr [ebp-8]
 000952D1    push        eax
 000952D2    call        gdi32.GetDeviceCaps
 000952D7    mov         dword ptr [ebx+0FC],eax
 000952DD    push        0A
 000952DF    mov         eax,dword ptr [ebp-8]
 000952E2    push        eax
 000952E3    call        gdi32.GetDeviceCaps
 000952E8    mov         dword ptr [ebx+100],eax
 000952EE    push        4
 000952F0    mov         eax,dword ptr [ebp-8]
 000952F3    push        eax
 000952F4    call        gdi32.GetDeviceCaps
 000952F9    mov         dword ptr [ebx+0F4],eax
 000952FF    push        6
 00095301    mov         eax,dword ptr [ebp-8]
 00095304    push        eax
 00095305    call        gdi32.GetDeviceCaps
 0009530A    mov         dword ptr [ebx+0F8],eax
 00095310    xor         eax,eax
 00095312    pop         edx
 00095313    pop         ecx
 00095314    pop         ecx
 00095315    mov         dword ptr fs:[eax],edx
 00095318    push        9532E
 0009531D    mov         eax,dword ptr [ebp-8]
 00095320    push        eax
 00095321    call        gdi32.DeleteDC
 00095326    ret
>00095327    jmp         @HandleFinally
>0009532C    jmp         0009531D
 0009532E    pop         ebx
 0009532F    mov         esp,ebp
 00095331    pop         ebp
 00095332    ret
*}
end;

//00095334
procedure sub_00095334(?:TCMReport);
begin
{*
 00095334    push        ebx
 00095335    push        esi
 00095336    mov         esi,eax
 00095338    mov         eax,dword ptr [esi+2C];TCMReport.?f2C:dword
 0009533B    test        eax,eax
>0009533D    je          00095349
 0009533F    call        TObject.Free
 00095344    xor         eax,eax
 00095346    mov         dword ptr [esi+2C],eax;TCMReport.?f2C:dword
 00095349    mov         eax,dword ptr [esi+28];TCMReport.?f28:TList
 0009534C    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 0009534F    dec         ebx
 00095350    cmp         ebx,0
>00095353    jl          0009536A
 00095355    mov         edx,ebx
 00095357    mov         eax,dword ptr [esi+28];TCMReport.?f28:TList
 0009535A    call        TList.Get
 0009535F    call        TObject.Free
 00095364    dec         ebx
 00095365    cmp         ebx,0FFFFFFFF
>00095368    jne         00095355
 0009536A    mov         eax,dword ptr [esi+28];TCMReport.?f28:TList
 0009536D    mov         bx,0FFFF
 00095371    call        @CallDynaInst;TList.Clear
 00095376    pop         esi
 00095377    pop         ebx
 00095378    ret
*}
end;

//0009537C
{*procedure sub_0009537C(?:?);
begin
 0009537C    push        ebx
 0009537D    push        esi
 0009537E    mov         ebx,eax
 00095380    mov         eax,dword ptr [ebx+34]
 00095383    mov         eax,dword ptr [eax+0C]
 00095386    call        TFont.GetStyle
 0009538B    mov         byte ptr [ebx+44],al
 0009538E    mov         eax,dword ptr [ebx+34]
 00095391    mov         esi,dword ptr [eax+0C]
 00095394    mov         eax,esi
 00095396    call        TFont.GetStyle
 0009539B    mov         edx,eax
 0009539D    or          dl,byte ptr ds:[953B0];0x1 gvar_000953B0
 000953A3    mov         eax,esi
 000953A5    call        TFont.SetStyle
 000953AA    pop         esi
 000953AB    pop         ebx
 000953AC    ret
end;*}

//000953B4
{*procedure sub_000953B4(?:?);
begin
 000953B4    mov         edx,dword ptr [eax+34]
 000953B7    mov         edx,dword ptr [edx+0C]
 000953BA    mov         al,byte ptr [eax+44]
 000953BD    xchg        eax,edx
 000953BE    call        TFont.SetStyle
 000953C3    ret
end;*}

//000953C4
{*procedure sub_000953C4(?:?; ?:AnsiString; ?:AnsiString);
begin
 000953C4    push        ebp
 000953C5    mov         ebp,esp
 000953C7    push        0
 000953C9    push        0
 000953CB    push        0
 000953CD    push        ebx
 000953CE    push        esi
 000953CF    mov         esi,ecx
 000953D1    mov         dword ptr [ebp-4],edx
 000953D4    mov         ebx,eax
 000953D6    mov         eax,dword ptr [ebp-4]
 000953D9    call        @LStrAddRef
 000953DE    xor         eax,eax
 000953E0    push        ebp
 000953E1    push        95599
 000953E6    push        dword ptr fs:[eax]
 000953E9    mov         dword ptr fs:[eax],esp
 000953EC    lea         eax,[ebp-8]
 000953EF    push        eax
 000953F0    lea         edx,[ebp-0C]
 000953F3    mov         eax,dword ptr [ebx+48]
 000953F6    call        IntToStr
 000953FB    mov         edx,dword ptr [ebp-0C]
 000953FE    mov         ecx,dword ptr [ebp-4]
 00095401    mov         eax,955B0;'%LINE'
 00095406    call        00094B2C
 0009540B    mov         edx,dword ptr [ebp-8]
 0009540E    lea         eax,[ebp-4]
 00095411    call        @LStrLAsg
 00095416    lea         eax,[ebp-8]
 00095419    push        eax
 0009541A    lea         edx,[ebp-0C]
 0009541D    mov         eax,dword ptr [ebx+4C]
 00095420    call        IntToStr
 00095425    mov         edx,dword ptr [ebp-0C]
 00095428    mov         ecx,dword ptr [ebp-4]
 0009542B    mov         eax,955C0;'%PAGE'
 00095430    call        00094B2C
 00095435    mov         edx,dword ptr [ebp-8]
 00095438    lea         eax,[ebp-4]
 0009543B    call        @LStrLAsg
 00095440    lea         eax,[ebp-8]
 00095443    push        eax
 00095444    push        dword ptr [ebx+40]
 00095447    push        dword ptr [ebx+3C]
 0009544A    lea         edx,[ebp-0C]
 0009544D    mov         eax,[000B5824];^gvar_000B6500
 00095452    mov         eax,dword ptr [eax]
 00095454    call        FormatDateTime
 00095459    mov         edx,dword ptr [ebp-0C]
 0009545C    mov         ecx,dword ptr [ebp-4]
 0009545F    mov         eax,955D0;'%DATE'
 00095464    call        00094B2C
 00095469    mov         edx,dword ptr [ebp-8]
 0009546C    lea         eax,[ebp-4]
 0009546F    call        @LStrLAsg
 00095474    lea         eax,[ebp-8]
 00095477    push        eax
 00095478    push        dword ptr [ebx+40]
 0009547B    push        dword ptr [ebx+3C]
 0009547E    lea         edx,[ebp-0C]
 00095481    mov         eax,[000B56CC];^gvar_000B6514
 00095486    mov         eax,dword ptr [eax]
 00095488    call        FormatDateTime
 0009548D    mov         edx,dword ptr [ebp-0C]
 00095490    mov         ecx,dword ptr [ebp-4]
 00095493    mov         eax,955E0;'%TIME'
 00095498    call        00094B2C
 0009549D    mov         edx,dword ptr [ebp-8]
 000954A0    lea         eax,[ebp-4]
 000954A3    call        @LStrLAsg
 000954A8    lea         eax,[ebp-8]
 000954AB    push        eax
 000954AC    lea         edx,[ebp-8]
 000954AF    xor         eax,eax
 000954B1    call        ParamStr
 000954B6    mov         eax,dword ptr [ebp-8]
 000954B9    lea         edx,[ebp-0C]
 000954BC    call        ExtractFileName
 000954C1    mov         edx,dword ptr [ebp-0C]
 000954C4    mov         ecx,dword ptr [ebp-4]
 000954C7    mov         eax,955F0;'%EXENAME'
 000954CC    call        00094B2C
 000954D1    mov         edx,dword ptr [ebp-8]
 000954D4    lea         eax,[ebp-4]
 000954D7    call        @LStrLAsg
 000954DC    lea         eax,[ebp-8]
 000954DF    push        eax
 000954E0    lea         edx,[ebp-0C]
 000954E3    xor         eax,eax
 000954E5    call        ParamStr
 000954EA    mov         eax,dword ptr [ebp-0C]
 000954ED    call        FileAge
 000954F2    call        FileDateToDateTime
 000954F7    add         esp,0FFFFFFF8
 000954FA    fstp        qword ptr [esp]
 000954FD    wait
 000954FE    lea         edx,[ebp-0C]
 00095501    mov         eax,[000B5824];^gvar_000B6500
 00095506    mov         eax,dword ptr [eax]
 00095508    call        FormatDateTime
 0009550D    mov         edx,dword ptr [ebp-0C]
 00095510    mov         ecx,dword ptr [ebp-4]
 00095513    mov         eax,95604;'%EXEDATE'
 00095518    call        00094B2C
 0009551D    mov         edx,dword ptr [ebp-8]
 00095520    lea         eax,[ebp-4]
 00095523    call        @LStrLAsg
 00095528    lea         eax,[ebp-8]
 0009552B    push        eax
 0009552C    lea         edx,[ebp-0C]
 0009552F    xor         eax,eax
 00095531    call        ParamStr
 00095536    mov         eax,dword ptr [ebp-0C]
 00095539    call        FileAge
 0009553E    call        FileDateToDateTime
 00095543    add         esp,0FFFFFFF8
 00095546    fstp        qword ptr [esp]
 00095549    wait
 0009554A    lea         edx,[ebp-0C]
 0009554D    mov         eax,[000B56CC];^gvar_000B6514
 00095552    mov         eax,dword ptr [eax]
 00095554    call        FormatDateTime
 00095559    mov         edx,dword ptr [ebp-0C]
 0009555C    mov         ecx,dword ptr [ebp-4]
 0009555F    mov         eax,95618;'%EXETIME'
 00095564    call        00094B2C
 00095569    mov         edx,dword ptr [ebp-8]
 0009556C    lea         eax,[ebp-4]
 0009556F    call        @LStrLAsg
 00095574    mov         eax,esi
 00095576    mov         edx,dword ptr [ebp-4]
 00095579    call        @LStrLAsg
 0009557E    xor         eax,eax
 00095580    pop         edx
 00095581    pop         ecx
 00095582    pop         ecx
 00095583    mov         dword ptr fs:[eax],edx
 00095586    push        955A0
 0009558B    lea         eax,[ebp-0C]
 0009558E    mov         edx,3
 00095593    call        @LStrArrayClr
 00095598    ret
>00095599    jmp         @HandleFinally
>0009559E    jmp         0009558B
 000955A0    pop         esi
 000955A1    pop         ebx
 000955A2    mov         esp,ebp
 000955A4    pop         ebp
 000955A5    ret
end;*}

//00095624
{*function sub_00095624(?:TCMReport; ?:dword):?;
begin
 00095624    push        ebx
 00095625    push        esi
 00095626    add         esp,0FFFFFFE4
 00095629    mov         esi,edx
 0009562B    mov         ebx,eax
 0009562D    mov         al,byte ptr [ebx+68]
 00095630    test        al,al
>00095632    jne         00095652
 00095634    mov         dword ptr [esp+8],esi
 00095638    fild        dword ptr [esp+8]
 0009563C    fld         tbyte ptr ds:[956A8];25,4:Extended
 00095642    fmulp       st(1),st
 00095644    fild        dword ptr [ebx+0A4]
 0009564A    fdivp       st(1),st
 0009564C    fstp        qword ptr [esp]
 0009564F    wait
>00095650    jmp         0009569F
 00095652    cmp         al,1
>00095654    jne         0009566C
 00095656    mov         dword ptr [esp+8],esi
 0009565A    fild        dword ptr [esp+8]
 0009565E    fild        dword ptr [ebx+0A4]
 00095664    fdivp       st(1),st
 00095666    fstp        qword ptr [esp]
 00095669    wait
>0009566A    jmp         0009569F
 0009566C    lea         ecx,[esp+0C]
 00095670    mov         edx,956BC;'X'
 00095675    mov         eax,ebx
 00095677    call        000958D4
 0009567C    fild        dword ptr [esp+0C]
 00095680    mov         dword ptr [esp+8],esi
 00095684    fild        dword ptr [esp+8]
 00095688    fdivrp      st(1),st
 0009568A    call        @ROUND
 0009568F    mov         dword ptr [esp+14],eax
 00095693    mov         dword ptr [esp+18],edx
 00095697    fild        qword ptr [esp+14]
 0009569B    fstp        qword ptr [esp]
 0009569E    wait
 0009569F    fld         qword ptr [esp]
 000956A2    add         esp,1C
 000956A5    pop         esi
 000956A6    pop         ebx
 000956A7    ret
end;*}

//000956C0
{*function sub_000956C0(?:TCMReport; ?:dword):?;
begin
 000956C0    push        ebx
 000956C1    push        esi
 000956C2    add         esp,0FFFFFFE4
 000956C5    mov         esi,edx
 000956C7    mov         ebx,eax
 000956C9    mov         al,byte ptr [ebx+68]
 000956CC    test        al,al
>000956CE    jne         000956EE
 000956D0    mov         dword ptr [esp+8],esi
 000956D4    fild        dword ptr [esp+8]
 000956D8    fld         tbyte ptr ds:[95744];25,4:Extended
 000956DE    fmulp       st(1),st
 000956E0    fild        dword ptr [ebx+0A8]
 000956E6    fdivp       st(1),st
 000956E8    fstp        qword ptr [esp]
 000956EB    wait
>000956EC    jmp         0009573B
 000956EE    cmp         al,1
>000956F0    jne         00095708
 000956F2    mov         dword ptr [esp+8],esi
 000956F6    fild        dword ptr [esp+8]
 000956FA    fild        dword ptr [ebx+0A8]
 00095700    fdivp       st(1),st
 00095702    fstp        qword ptr [esp]
 00095705    wait
>00095706    jmp         0009573B
 00095708    lea         ecx,[esp+0C]
 0009570C    mov         edx,95758;'X'
 00095711    mov         eax,ebx
 00095713    call        000958D4
 00095718    fild        dword ptr [esp+10]
 0009571C    mov         dword ptr [esp+8],esi
 00095720    fild        dword ptr [esp+8]
 00095724    fdivrp      st(1),st
 00095726    call        @ROUND
 0009572B    mov         dword ptr [esp+14],eax
 0009572F    mov         dword ptr [esp+18],edx
 00095733    fild        qword ptr [esp+14]
 00095737    fstp        qword ptr [esp]
 0009573A    wait
 0009573B    fld         qword ptr [esp]
 0009573E    add         esp,1C
 00095741    pop         esi
 00095742    pop         ebx
 00095743    ret
end;*}

//0009575C
{*function sub_0009575C(?:TCMReport; ?:?):?;
begin
 0009575C    push        ebp
 0009575D    mov         ebp,esp
 0009575F    add         esp,0FFFFFFF8
 00095762    push        ebx
 00095763    mov         ebx,eax
 00095765    mov         al,byte ptr [ebx+68]
 00095768    cmp         al,1
>0009576A    jne         0009577C
 0009576C    fild        dword ptr [ebx+0A4]
 00095772    fmul        qword ptr [ebp+8]
 00095775    call        @ROUND
>0009577A    jmp         000957B2
 0009577C    test        al,al
>0009577E    jne         00095798
 00095780    fild        dword ptr [ebx+0A4]
 00095786    fmul        qword ptr [ebp+8]
 00095789    fld         tbyte ptr ds:[957BC];25,4:Extended
 0009578F    fdivp       st(1),st
 00095791    call        @ROUND
>00095796    jmp         000957B2
 00095798    lea         ecx,[ebp-8]
 0009579B    mov         edx,957D0;'X'
 000957A0    mov         eax,ebx
 000957A2    call        000958D4
 000957A7    fild        dword ptr [ebp-8]
 000957AA    fmul        qword ptr [ebp+8]
 000957AD    call        @ROUND
 000957B2    pop         ebx
 000957B3    pop         ecx
 000957B4    pop         ecx
 000957B5    pop         ebp
 000957B6    ret         8
end;*}

//000957D4
{*function sub_000957D4(?:TCMReport; ?:?):?;
begin
 000957D4    push        ebp
 000957D5    mov         ebp,esp
 000957D7    add         esp,0FFFFFFF8
 000957DA    push        ebx
 000957DB    mov         ebx,eax
 000957DD    mov         al,byte ptr [ebx+68]
 000957E0    cmp         al,1
>000957E2    jne         000957F4
 000957E4    fild        dword ptr [ebx+0A8]
 000957EA    fmul        qword ptr [ebp+8]
 000957ED    call        @ROUND
>000957F2    jmp         0009582A
 000957F4    test        al,al
>000957F6    jne         00095810
 000957F8    fild        dword ptr [ebx+0A8]
 000957FE    fmul        qword ptr [ebp+8]
 00095801    fld         tbyte ptr ds:[95834];25,4:Extended
 00095807    fdivp       st(1),st
 00095809    call        @ROUND
>0009580E    jmp         0009582A
 00095810    lea         ecx,[ebp-8]
 00095813    mov         edx,95848;'X'
 00095818    mov         eax,ebx
 0009581A    call        000958D4
 0009581F    fild        dword ptr [ebp-4]
 00095822    fmul        qword ptr [ebp+8]
 00095825    call        @ROUND
 0009582A    pop         ebx
 0009582B    pop         ecx
 0009582C    pop         ecx
 0009582D    pop         ebp
 0009582E    ret         8
end;*}

//0009584C
{*function sub_0009584C(?:TCMReport; ?:?; ?:?):?;
begin
 0009584C    push        ebp
 0009584D    mov         ebp,esp
 0009584F    add         esp,0FFFFFFF8
 00095852    mov         dl,byte ptr [eax+68]
 00095855    cmp         dl,1
>00095858    jne         00095869
 0009585A    fld         tbyte ptr ds:[95884];25,4:Extended
 00095860    fdivr       qword ptr [ebp+8]
 00095863    fstp        qword ptr [ebp-8]
 00095866    wait
>00095867    jmp         00095879
 00095869    test        dl,dl
>0009586B    jne         00095879
 0009586D    mov         eax,dword ptr [ebp+8]
 00095870    mov         dword ptr [ebp-8],eax
 00095873    mov         eax,dword ptr [ebp+0C]
 00095876    mov         dword ptr [ebp-4],eax
 00095879    fld         qword ptr [ebp-8]
 0009587C    pop         ecx
 0009587D    pop         ecx
 0009587E    pop         ebp
 0009587F    ret         8
end;*}

//00095890
{*function sub_00095890(?:TCMReport; ?:?; ?:?):?;
begin
 00095890    push        ebp
 00095891    mov         ebp,esp
 00095893    add         esp,0FFFFFFF8
 00095896    mov         dl,byte ptr [eax+68]
 00095899    cmp         dl,1
>0009589C    jne         000958AD
 0009589E    fld         tbyte ptr ds:[958C8];25,4:Extended
 000958A4    fmul        qword ptr [ebp+8]
 000958A7    fstp        qword ptr [ebp-8]
 000958AA    wait
>000958AB    jmp         000958BD
 000958AD    test        dl,dl
>000958AF    jne         000958BD
 000958B1    mov         eax,dword ptr [ebp+8]
 000958B4    mov         dword ptr [ebp-8],eax
 000958B7    mov         eax,dword ptr [ebp+0C]
 000958BA    mov         dword ptr [ebp-4],eax
 000958BD    fld         qword ptr [ebp-8]
 000958C0    pop         ecx
 000958C1    pop         ecx
 000958C2    pop         ebp
 000958C3    ret         8
end;*}

//000958D4
{*procedure sub_000958D4(?:?; ?:AnsiString; ?:?);
begin
 000958D4    push        ebx
 000958D5    push        esi
 000958D6    push        edi
 000958D7    mov         edi,ecx
 000958D9    mov         esi,edx
 000958DB    mov         ebx,eax
 000958DD    mov         edx,esi
 000958DF    mov         eax,dword ptr [ebx+34]
 000958E2    call        TCanvas.TextHeight
 000958E7    push        eax
 000958E8    mov         edx,esi
 000958EA    mov         eax,dword ptr [ebx+34]
 000958ED    call        TCanvas.TextWidth
 000958F2    mov         ecx,edi
 000958F4    pop         edx
 000958F5    call        Point
 000958FA    pop         edi
 000958FB    pop         esi
 000958FC    pop         ebx
 000958FD    ret
end;*}

//00095900
{*procedure sub_00095900(?:TCMReport; ?:?);
begin
 00095900    push        ebx
 00095901    push        esi
 00095902    push        edi
 00095903    mov         edi,edx
 00095905    push        58
 00095907    call        Printer
 0009590C    call        TPrinter.GetHandle
 00095911    push        eax
 00095912    call        gdi32.GetDeviceCaps
 00095917    mov         ebx,eax
 00095919    push        5A
 0009591B    call        Printer
 00095920    call        TPrinter.GetHandle
 00095925    push        eax
 00095926    call        gdi32.GetDeviceCaps
 0009592B    mov         esi,eax
 0009592D    mov         ecx,edi
 0009592F    mov         edx,esi
 00095931    mov         eax,ebx
 00095933    call        Point
 00095938    pop         edi
 00095939    pop         esi
 0009593A    pop         ebx
 0009593B    ret
end;*}

//0009593C
procedure TCMReport.GetMarginPhysX;
begin
{*
 0009593C    add         esp,0FFFFFFF8
 0009593F    mov         edx,dword ptr [eax+104];TCMReport.?f104:dword
 00095945    call        00095624
 0009594A    fstp        qword ptr [esp]
 0009594D    wait
 0009594E    fld         qword ptr [esp]
 00095951    pop         ecx
 00095952    pop         edx
 00095953    ret
*}
end;

//00095954
procedure TCMReport.GetMarginPhysY;
begin
{*
 00095954    add         esp,0FFFFFFF8
 00095957    mov         edx,dword ptr [eax+108];TCMReport.?f108:dword
 0009595D    call        000956C0
 00095962    fstp        qword ptr [esp]
 00095965    wait
 00095966    fld         qword ptr [esp]
 00095969    pop         ecx
 0009596A    pop         edx
 0009596B    ret
*}
end;

//0009596C
procedure TCMReport.GetPaperHeight;
begin
{*
 0009596C    add         esp,0FFFFFFF8
 0009596F    mov         edx,dword ptr [eax+0F0];TCMReport.?fF0:dword
 00095975    call        000956C0
 0009597A    fstp        qword ptr [esp]
 0009597D    wait
 0009597E    push        dword ptr [esp+4]
 00095982    push        dword ptr [esp+4]
 00095986    mov         al,2
 00095988    call        000741F8
 0009598D    fstp        qword ptr [esp]
 00095990    wait
 00095991    fld         qword ptr [esp]
 00095994    pop         ecx
 00095995    pop         edx
 00095996    ret
*}
end;

//00095998
procedure TCMReport.GetPaperWidth;
begin
{*
 00095998    add         esp,0FFFFFFF8
 0009599B    mov         edx,dword ptr [eax+0EC];TCMReport.?fEC:dword
 000959A1    call        00095624
 000959A6    fstp        qword ptr [esp]
 000959A9    wait
 000959AA    push        dword ptr [esp+4]
 000959AE    push        dword ptr [esp+4]
 000959B2    mov         al,2
 000959B4    call        000741F8
 000959B9    fstp        qword ptr [esp]
 000959BC    wait
 000959BD    fld         qword ptr [esp]
 000959C0    pop         ecx
 000959C1    pop         edx
 000959C2    ret
*}
end;

//000959C4
{*function sub_000959C4(?:?):?;
begin
 000959C4    mov         edx,dword ptr [eax+0FC]
 000959CA    sub         edx,dword ptr [eax+78]
 000959CD    sub         edx,dword ptr [eax+7C]
 000959D0    mov         eax,edx
 000959D2    ret
end;*}

//000959D4
{*function sub_000959D4(?:?):?;
begin
 000959D4    mov         edx,dword ptr [eax+100]
 000959DA    sub         edx,dword ptr [eax+70]
 000959DD    sub         edx,dword ptr [eax+74]
 000959E0    sub         edx,dword ptr [eax+0A0]
 000959E6    mov         eax,edx
 000959E8    ret
end;*}

//000959EC
procedure sub_000959EC(?:TCMReport);
begin
{*
 000959EC    push        ebp
 000959ED    mov         ebp,esp
 000959EF    push        ebx
 000959F0    push        esi
 000959F1    push        edi
 000959F2    mov         ebx,eax
 000959F4    mov         eax,ebx
 000959F6    call        00095334
 000959FB    cmp         byte ptr [ebx+30],0
>000959FF    jne         00095A4F
 00095A01    xor         eax,eax
 00095A03    push        ebp
 00095A04    push        95A23
 00095A09    push        dword ptr fs:[eax]
 00095A0C    mov         dword ptr fs:[eax],esp
 00095A0F    call        Printer
 00095A14    call        TPrinter.Abort
 00095A19    xor         eax,eax
 00095A1B    pop         edx
 00095A1C    pop         ecx
 00095A1D    pop         ecx
 00095A1E    mov         dword ptr fs:[eax],edx
>00095A21    jmp         00095A4F
>00095A23    jmp         @HandleOnException
 00095A28    dd          1
 00095A2C    dd          00032360;EPrinter
 00095A30    dd          00095A34
 00095A34    mov         ecx,95A88;'Unable to abort printing.'
 00095A39    mov         dl,1
 00095A3B    mov         eax,[00032360];EPrinter
 00095A40    call        Exception.Create;EPrinter.Create
 00095A45    call        @RaiseExcept
 00095A4A    call        @DoneExcept
 00095A4F    cmp         word ptr [ebx+0C6],0
>00095A57    je          00095A67
 00095A59    mov         edx,ebx
 00095A5B    mov         eax,dword ptr [ebx+0C8]
 00095A61    call        dword ptr [ebx+0C4]
 00095A67    call        Printer
 00095A6C    call        TPrinter.GetCanvas
 00095A71    mov         dword ptr [ebx+34],eax
 00095A74    mov         byte ptr [ebx+31],1
 00095A78    pop         edi
 00095A79    pop         esi
 00095A7A    pop         ebx
 00095A7B    pop         ebp
 00095A7C    ret
*}
end;

//00095AA4
{*procedure sub_00095AA4(?:?);
begin
 00095AA4    push        ebp
 00095AA5    mov         ebp,esp
 00095AA7    push        ebx
 00095AA8    push        esi
 00095AA9    push        edi
 00095AAA    mov         ebx,eax
 00095AAC    mov         eax,ebx
 00095AAE    call        000951D8
 00095AB3    mov         eax,ebx
 00095AB5    call        000959C4
 00095ABA    test        eax,eax
>00095ABC    jg          00095AD4
 00095ABE    mov         ecx,95BAC;'Insufficient paper width.'+#13+#10+Change left/right margin'
 00095AC3    mov         dl,1
 00095AC5    mov         eax,[000176E8];Exception
 00095ACA    call        Exception.Create;Exception.Create
 00095ACF    call        @RaiseExcept
 00095AD4    mov         eax,ebx
 00095AD6    call        000959D4
 00095ADB    test        eax,eax
>00095ADD    jg          00095AF5
 00095ADF    mov         ecx,95BE8;'Insufficient paper height'+#13+#10+Change top/bottom margin'
 00095AE4    mov         dl,1
 00095AE6    mov         eax,[000176E8];Exception
 00095AEB    call        Exception.Create;Exception.Create
 00095AF0    call        @RaiseExcept
 00095AF5    call        Printer
 00095AFA    call        TPrinter.GetCanvas
 00095AFF    mov         dword ptr [ebx+34],eax
 00095B02    mov         eax,ebx
 00095B04    call        00095334
 00095B09    xor         eax,eax
 00095B0B    mov         dword ptr [ebx+4C],eax
 00095B0E    call        00019C6C
 00095B13    fstp        qword ptr [ebx+3C]
 00095B16    wait
 00095B17    cmp         word ptr [ebx+0B6],0
>00095B1F    je          00095B2F
 00095B21    mov         edx,ebx
 00095B23    mov         eax,dword ptr [ebx+0B8]
 00095B29    call        dword ptr [ebx+0B4]
 00095B2F    cmp         byte ptr [ebx+30],0
>00095B33    jne         00095B90
 00095B35    call        Printer
 00095B3A    call        TPrinter.GetCanvas
 00095B3F    mov         dword ptr [ebx+34],eax
 00095B42    xor         eax,eax
 00095B44    push        ebp
 00095B45    push        95B64
 00095B4A    push        dword ptr fs:[eax]
 00095B4D    mov         dword ptr fs:[eax],esp
 00095B50    call        Printer
 00095B55    call        TPrinter.BeginDoc
 00095B5A    xor         eax,eax
 00095B5C    pop         edx
 00095B5D    pop         ecx
 00095B5E    pop         ecx
 00095B5F    mov         dword ptr fs:[eax],edx
>00095B62    jmp         00095B90
>00095B64    jmp         @HandleOnException
 00095B69    dd          1
 00095B6D    dd          00032360;EPrinter
 00095B71    dd          00095B75
 00095B75    mov         ecx,95C24;'Unable to begin printing.'
 00095B7A    mov         dl,1
 00095B7C    mov         eax,[00032360];EPrinter
 00095B81    call        Exception.Create;EPrinter.Create
 00095B86    call        @RaiseExcept
 00095B8B    call        @DoneExcept
 00095B90    mov         byte ptr [ebx+32],1
 00095B94    mov         byte ptr [ebx+31],0
 00095B98    mov         eax,ebx
 00095B9A    call        00096F18
 00095B9F    pop         edi
 00095BA0    pop         esi
 00095BA1    pop         ebx
 00095BA2    pop         ebp
 00095BA3    ret
end;*}

//00095C40
procedure sub_00095C40(?:TCMReport);
begin
{*
 00095C40    push        ebp
 00095C41    mov         ebp,esp
 00095C43    push        ebx
 00095C44    push        esi
 00095C45    push        edi
 00095C46    mov         ebx,eax
 00095C48    mov         al,byte ptr [ebx+30]
 00095C4B    test        al,al
 00095C4D    test        al,al
>00095C4F    jne         00095C9F
 00095C51    xor         eax,eax
 00095C53    push        ebp
 00095C54    push        95C73
 00095C59    push        dword ptr fs:[eax]
 00095C5C    mov         dword ptr fs:[eax],esp
 00095C5F    call        Printer
 00095C64    call        TPrinter.EndDoc
 00095C69    xor         eax,eax
 00095C6B    pop         edx
 00095C6C    pop         ecx
 00095C6D    pop         ecx
 00095C6E    mov         dword ptr fs:[eax],edx
>00095C71    jmp         00095C9F
>00095C73    jmp         @HandleOnException
 00095C78    dd          1
 00095C7C    dd          00032360;EPrinter
 00095C80    dd          00095C84
 00095C84    mov         ecx,95CDC;'Unable to finish printing.'
 00095C89    mov         dl,1
 00095C8B    mov         eax,[00032360];EPrinter
 00095C90    call        Exception.Create;EPrinter.Create
 00095C95    call        @RaiseExcept
 00095C9A    call        @DoneExcept
 00095C9F    cmp         word ptr [ebx+0BE],0
>00095CA7    je          00095CB7
 00095CA9    mov         edx,ebx
 00095CAB    mov         eax,dword ptr [ebx+0C0]
 00095CB1    call        dword ptr [ebx+0BC]
 00095CB7    call        Printer
 00095CBC    call        TPrinter.GetCanvas
 00095CC1    mov         dword ptr [ebx+34],eax
 00095CC4    mov         byte ptr [ebx+32],0
 00095CC8    mov         byte ptr [ebx+31],0
 00095CCC    pop         edi
 00095CCD    pop         esi
 00095CCE    pop         ebx
 00095CCF    pop         ebp
 00095CD0    ret
*}
end;

//00095CF8
{*procedure sub_00095CF8(?:dword; ?:dword; ?:?);
begin
 00095CF8    push        ebp
 00095CF9    mov         ebp,esp
 00095CFB    add         esp,0FFFFFFE8
 00095CFE    push        ebx
 00095CFF    push        esi
 00095D00    push        edi
 00095D01    xor         ebx,ebx
 00095D03    mov         dword ptr [ebp-8],ebx
 00095D06    mov         byte ptr [ebp-1],cl
 00095D09    mov         esi,edx
 00095D0B    mov         ebx,eax
 00095D0D    xor         eax,eax
 00095D0F    push        ebp
 00095D10    push        95DD2
 00095D15    push        dword ptr fs:[eax]
 00095D18    mov         dword ptr fs:[eax],esp
 00095D1B    cmp         esi,1
>00095D1E    jl          00095DBC
 00095D24    mov         eax,dword ptr [ebx+28]
 00095D27    cmp         esi,dword ptr [eax+8]
>00095D2A    jg          00095DBC
 00095D30    mov         eax,dword ptr [ebx+2C]
 00095D33    test        eax,eax
>00095D35    je          00095D41
 00095D37    call        TObject.Free
 00095D3C    xor         eax,eax
 00095D3E    mov         dword ptr [ebx+2C],eax
 00095D41    mov         edx,esi
 00095D43    dec         edx
 00095D44    mov         eax,dword ptr [ebx+28]
 00095D47    call        TList.Get
 00095D4C    mov         edi,eax
 00095D4E    lea         eax,[ebp-8]
 00095D51    push        eax
 00095D52    mov         dword ptr [ebp-18],esi
 00095D55    mov         byte ptr [ebp-14],0
 00095D59    mov         eax,dword ptr [ebx+4C]
 00095D5C    mov         dword ptr [ebp-10],eax
 00095D5F    mov         byte ptr [ebp-0C],0
 00095D63    lea         edx,[ebp-18]
 00095D66    mov         ecx,1
 00095D6B    mov         eax,95DE8;'Printing Page %d of %d'
 00095D70    call        Format
 00095D75    mov         eax,dword ptr [ebp-8]
 00095D78    push        eax
 00095D79    mov         eax,dword ptr [ebx+24]
 00095D7C    mov         eax,dword ptr [eax+2D0]
 00095D82    mov         eax,dword ptr [eax+1EC]
 00095D88    mov         edx,1
 00095D8D    call        TCoolBands.GetItem
 00095D92    pop         edx
 00095D93    call        TStatusPanel.SetText
 00095D98    push        edi
 00095D99    call        Printer
 00095D9E    call        TPrinter.GetCanvas
 00095DA3    xor         ecx,ecx
 00095DA5    xor         edx,edx
 00095DA7    call        TCanvas.Draw
 00095DAC    cmp         byte ptr [ebp-1],0
>00095DB0    je          00095DBC
 00095DB2    call        Printer
 00095DB7    call        TPrinter.NewPage
 00095DBC    xor         eax,eax
 00095DBE    pop         edx
 00095DBF    pop         ecx
 00095DC0    pop         ecx
 00095DC1    mov         dword ptr fs:[eax],edx
 00095DC4    push        95DD9
 00095DC9    lea         eax,[ebp-8]
 00095DCC    call        @LStrClr
 00095DD1    ret
>00095DD2    jmp         @HandleFinally
>00095DD7    jmp         00095DC9
 00095DD9    pop         edi
 00095DDA    pop         esi
 00095DDB    pop         ebx
 00095DDC    mov         esp,ebp
 00095DDE    pop         ebp
 00095DDF    ret
end;*}

//00095E00
procedure sub_00095E00(?:dword; ?:dword);
begin
{*
 00095E00    push        ebp
 00095E01    mov         ebp,esp
 00095E03    add         esp,0FFFFFFC8
 00095E06    push        ebx
 00095E07    push        esi
 00095E08    push        edi
 00095E09    xor         ecx,ecx
 00095E0B    mov         dword ptr [ebp-38],ecx
 00095E0E    mov         edi,edx
 00095E10    mov         esi,eax
 00095E12    xor         eax,eax
 00095E14    push        ebp
 00095E15    push        961A8
 00095E1A    push        dword ptr fs:[eax]
 00095E1D    mov         dword ptr fs:[eax],esp
 00095E20    cmp         edi,1
>00095E23    jl          00096192
 00095E29    mov         eax,dword ptr [esi+28]
 00095E2C    cmp         edi,dword ptr [eax+8]
>00095E2F    jg          00096192
 00095E35    mov         eax,dword ptr [esi+24]
 00095E38    mov         dword ptr [eax+2FC],edi
 00095E3E    mov         eax,dword ptr [esi+2C]
 00095E41    test        eax,eax
>00095E43    je          00095E4F
 00095E45    call        TObject.Free
 00095E4A    xor         eax,eax
 00095E4C    mov         dword ptr [esi+2C],eax
 00095E4F    mov         edx,edi
 00095E51    dec         edx
 00095E52    mov         eax,dword ptr [esi+28]
 00095E55    call        TList.Get
 00095E5A    mov         dword ptr [ebp-14],eax
 00095E5D    mov         eax,dword ptr [esi+24]
 00095E60    mov         edx,dword ptr [eax+2C8]
 00095E66    fild        dword ptr [edx+38]
 00095E69    fld         tbyte ptr ds:[961B8];0,95:Extended
 00095E6F    fmulp       st(1),st
 00095E71    fild        dword ptr [eax+30C]
 00095E77    fdivp       st(1),st
 00095E79    fstp        qword ptr [ebp-8]
 00095E7C    wait
 00095E7D    fild        dword ptr [edx+3C]
 00095E80    fld         tbyte ptr ds:[961B8];0,95:Extended
 00095E86    fmulp       st(1),st
 00095E88    fild        dword ptr [eax+310]
 00095E8E    fdivp       st(1),st
 00095E90    fstp        qword ptr [ebp-10]
 00095E93    wait
 00095E94    cmp         dword ptr [eax+300],2
>00095E9B    je          00095F97
 00095EA1    mov         eax,esi
 00095EA3    call        TCMReport.GetOrientation
 00095EA8    test        al,al
>00095EAA    jne         00095F27
 00095EAC    mov         edx,dword ptr [esi+24]
 00095EAF    cmp         dword ptr [edx+300],0
>00095EB6    jne         00095EF1
 00095EB8    fld         qword ptr [ebp-8]
 00095EBB    fcomp       qword ptr [ebp-10]
 00095EBE    fnstsw      al
 00095EC0    sahf
>00095EC1    jae         00095EDA
 00095EC3    mov         eax,dword ptr [ebp-8]
 00095EC6    mov         dword ptr [edx+304],eax
 00095ECC    mov         eax,dword ptr [ebp-4]
 00095ECF    mov         dword ptr [edx+308],eax
>00095ED5    jmp         00095F97
 00095EDA    mov         eax,dword ptr [ebp-10]
 00095EDD    mov         dword ptr [edx+304],eax
 00095EE3    mov         eax,dword ptr [ebp-0C]
 00095EE6    mov         dword ptr [edx+308],eax
>00095EEC    jmp         00095F97
 00095EF1    fld         qword ptr [ebp-8]
 00095EF4    fcomp       qword ptr [ebp-10]
 00095EF7    fnstsw      al
 00095EF9    sahf
>00095EFA    jbe         00095F13
 00095EFC    mov         eax,dword ptr [ebp-8]
 00095EFF    mov         dword ptr [edx+304],eax
 00095F05    mov         eax,dword ptr [ebp-4]
 00095F08    mov         dword ptr [edx+308],eax
>00095F0E    jmp         00095F97
 00095F13    mov         eax,dword ptr [ebp-10]
 00095F16    mov         dword ptr [edx+304],eax
 00095F1C    mov         eax,dword ptr [ebp-0C]
 00095F1F    mov         dword ptr [edx+308],eax
>00095F25    jmp         00095F97
 00095F27    mov         edx,dword ptr [esi+24]
 00095F2A    cmp         dword ptr [edx+300],0
>00095F31    jne         00095F66
 00095F33    fld         qword ptr [ebp-8]
 00095F36    fcomp       qword ptr [ebp-10]
 00095F39    fnstsw      al
 00095F3B    sahf
>00095F3C    jae         00095F52
 00095F3E    mov         eax,dword ptr [ebp-8]
 00095F41    mov         dword ptr [edx+304],eax
 00095F47    mov         eax,dword ptr [ebp-4]
 00095F4A    mov         dword ptr [edx+308],eax
>00095F50    jmp         00095F97
 00095F52    mov         eax,dword ptr [ebp-10]
 00095F55    mov         dword ptr [edx+304],eax
 00095F5B    mov         eax,dword ptr [ebp-0C]
 00095F5E    mov         dword ptr [edx+308],eax
>00095F64    jmp         00095F97
 00095F66    fld         qword ptr [ebp-8]
 00095F69    fcomp       qword ptr [ebp-10]
 00095F6C    fnstsw      al
 00095F6E    sahf
>00095F6F    jbe         00095F85
 00095F71    mov         eax,dword ptr [ebp-8]
 00095F74    mov         dword ptr [edx+304],eax
 00095F7A    mov         eax,dword ptr [ebp-4]
 00095F7D    mov         dword ptr [edx+308],eax
>00095F83    jmp         00095F97
 00095F85    mov         eax,dword ptr [ebp-10]
 00095F88    mov         dword ptr [edx+304],eax
 00095F8E    mov         eax,dword ptr [ebp-0C]
 00095F91    mov         dword ptr [edx+308],eax
 00095F97    mov         ebx,dword ptr [esi+24]
 00095F9A    fild        dword ptr [ebx+30C]
 00095FA0    fmul        qword ptr [ebx+304]
 00095FA6    call        @TRUNC
 00095FAB    mov         edx,eax
 00095FAD    mov         eax,dword ptr [ebx+2CC]
 00095FB3    call        TControl.SetWidth
 00095FB8    fild        dword ptr [ebx+310]
 00095FBE    fmul        qword ptr [ebx+304]
 00095FC4    call        @TRUNC
 00095FC9    mov         edx,eax
 00095FCB    mov         eax,dword ptr [ebx+2CC]
 00095FD1    call        TControl.SetHeight
 00095FD6    mov         eax,dword ptr [ebx+2CC]
 00095FDC    mov         eax,dword ptr [eax+114]
 00095FE2    mov         eax,dword ptr [eax+14]
 00095FE5    mov         edx,0FFFFFF
 00095FEA    call        TBrush.SetColor
 00095FEF    mov         eax,dword ptr [ebx+2CC]
 00095FF5    mov         edx,dword ptr [eax+38]
 00095FF8    push        edx
 00095FF9    mov         edx,dword ptr [eax+3C]
 00095FFC    push        edx
 00095FFD    mov         eax,dword ptr [eax+114]
 00096003    xor         ecx,ecx
 00096005    xor         edx,edx
 00096007    call        TCanvas.Rectangle
 0009600C    mov         eax,dword ptr [ebx+2CC]
 00096012    mov         eax,dword ptr [eax+3C]
 00096015    sub         eax,2
 00096018    push        eax
 00096019    lea         eax,[ebp-34]
 0009601C    push        eax
 0009601D    mov         eax,dword ptr [ebx+2CC]
 00096023    mov         ecx,dword ptr [eax+38]
 00096026    sub         ecx,2
 00096029    mov         edx,1
 0009602E    mov         eax,1
 00096033    call        Rect
 00096038    lea         edx,[ebp-34]
 0009603B    mov         eax,dword ptr [ebx+2CC]
 00096041    mov         eax,dword ptr [eax+114]
 00096047    call        TCanvas.FillRect
 0009604C    fild        dword ptr [ebx+314]
 00096052    fmul        qword ptr [ebx+304]
 00096058    call        @TRUNC
 0009605D    mov         dword ptr [ebp-24],eax
 00096060    fild        dword ptr [ebx+318]
 00096066    fmul        qword ptr [ebx+304]
 0009606C    call        @TRUNC
 00096071    mov         dword ptr [ebp-20],eax
 00096074    fild        dword ptr [ebx+314]
 0009607A    fmul        qword ptr [ebx+304]
 00096080    call        @TRUNC
 00096085    mov         edx,dword ptr [ebx+2CC]
 0009608B    mov         edx,dword ptr [edx+38]
 0009608E    sub         edx,eax
 00096090    mov         dword ptr [ebp-1C],edx
 00096093    fild        dword ptr [ebx+318]
 00096099    fmul        qword ptr [ebx+304]
 0009609F    call        @TRUNC
 000960A4    mov         edx,dword ptr [ebx+2CC]
 000960AA    mov         edx,dword ptr [edx+3C]
 000960AD    sub         edx,eax
 000960AF    mov         dword ptr [ebp-18],edx
 000960B2    lea         edx,[ebp-24]
 000960B5    mov         eax,dword ptr [ebx+2CC]
 000960BB    mov         eax,dword ptr [eax+114]
 000960C1    mov         ecx,dword ptr [ebp-14]
 000960C4    call        TCanvas.StretchDraw
 000960C9    lea         eax,[ebp-38]
 000960CC    push        eax
 000960CD    mov         dword ptr [ebp-34],edi
 000960D0    mov         byte ptr [ebp-30],0
 000960D4    mov         eax,dword ptr [esi+4C]
 000960D7    mov         dword ptr [ebp-2C],eax
 000960DA    mov         byte ptr [ebp-28],0
 000960DE    lea         edx,[ebp-34]
 000960E1    mov         ecx,1
 000960E6    mov         eax,961CC;'Page %d of %d'
 000960EB    call        Format
 000960F0    mov         eax,dword ptr [ebp-38]
 000960F3    push        eax
 000960F4    mov         eax,dword ptr [esi+24]
 000960F7    mov         eax,dword ptr [eax+2D0]
 000960FD    mov         eax,dword ptr [eax+1EC]
 00096103    xor         edx,edx
 00096105    call        TCoolBands.GetItem
 0009610A    pop         edx
 0009610B    call        TStatusPanel.SetText
 00096110    cmp         edi,1
>00096113    jne         00096134
 00096115    mov         ebx,dword ptr [esi+24]
 00096118    mov         eax,dword ptr [ebx+2D4]
 0009611E    xor         edx,edx
 00096120    call        TCMBtn.SetEnabled
 00096125    mov         eax,dword ptr [ebx+2D8]
 0009612B    xor         edx,edx
 0009612D    call        TCMBtn.SetEnabled
>00096132    jmp         00096151
 00096134    mov         ebx,dword ptr [esi+24]
 00096137    mov         eax,dword ptr [ebx+2D4]
 0009613D    mov         dl,1
 0009613F    call        TCMBtn.SetEnabled
 00096144    mov         eax,dword ptr [ebx+2D8]
 0009614A    mov         dl,1
 0009614C    call        TCMBtn.SetEnabled
 00096151    cmp         edi,dword ptr [esi+4C]
>00096154    jne         00096175
 00096156    mov         ebx,dword ptr [esi+24]
 00096159    mov         eax,dword ptr [ebx+2E0]
 0009615F    xor         edx,edx
 00096161    call        TCMBtn.SetEnabled
 00096166    mov         eax,dword ptr [ebx+2DC]
 0009616C    xor         edx,edx
 0009616E    call        TCMBtn.SetEnabled
>00096173    jmp         00096192
 00096175    mov         ebx,dword ptr [esi+24]
 00096178    mov         eax,dword ptr [ebx+2E0]
 0009617E    mov         dl,1
 00096180    call        TCMBtn.SetEnabled
 00096185    mov         eax,dword ptr [ebx+2DC]
 0009618B    mov         dl,1
 0009618D    call        TCMBtn.SetEnabled
 00096192    xor         eax,eax
 00096194    pop         edx
 00096195    pop         ecx
 00096196    pop         ecx
 00096197    mov         dword ptr fs:[eax],edx
 0009619A    push        961AF
 0009619F    lea         eax,[ebp-38]
 000961A2    call        @LStrClr
 000961A7    ret
>000961A8    jmp         @HandleFinally
>000961AD    jmp         0009619F
 000961AF    pop         edi
 000961B0    pop         esi
 000961B1    pop         ebx
 000961B2    mov         esp,ebp
 000961B4    pop         ebp
 000961B5    ret
*}
end;

//000961DC
{*procedure sub_000961DC(?:TCMReport; ?:AnsiString; ?:?);
begin
 000961DC    push        ebp
 000961DD    mov         ebp,esp
 000961DF    add         esp,0FFFFFFF8
 000961E2    push        ebx
 000961E3    push        esi
 000961E4    push        edi
 000961E5    mov         esi,ecx
 000961E7    mov         dword ptr [ebp-8],edx
 000961EA    mov         dword ptr [ebp-4],eax
 000961ED    mov         eax,dword ptr [ebp-8]
 000961F0    call        @LStrAddRef
 000961F5    xor         eax,eax
 000961F7    push        ebp
 000961F8    push        9631A
 000961FD    push        dword ptr fs:[eax]
 00096200    mov         dword ptr fs:[eax],esp
 00096203    xor         ecx,ecx
 00096205    mov         dl,1
 00096207    mov         eax,[000947C8];TFormPreview
 0009620C    call        TCustomForm.Create;TFormPreview.Create
 00096211    mov         ebx,eax
 00096213    mov         eax,dword ptr [ebp-4]
 00096216    mov         dword ptr [eax+24],ebx
 00096219    xor         edx,edx
 0009621B    push        ebp
 0009621C    push        962FD
 00096221    push        dword ptr fs:[edx]
 00096224    mov         dword ptr fs:[edx],esp
 00096227    mov         eax,dword ptr [ebp-4]
 0009622A    mov         dword ptr [ebx+2F8],eax;TFormPreview.?f2F8:dword
 00096230    mov         edx,dword ptr [ebp-8]
 00096233    mov         eax,ebx
 00096235    call        TControl.SetText
 0009623A    mov         eax,esi
 0009623C    mov         dword ptr [ebx+144],eax;TFormPreview.HelpContext:THelpContext
 00096242    test        eax,eax
 00096244    setg        dl
 00096247    mov         eax,dword ptr [ebx+2F4];TFormPreview.CMBtnHelp:TCMBtn
 0009624D    call        TControl.SetVisible
 00096252    mov         eax,dword ptr [ebp-4]
 00096255    mov         ecx,dword ptr [eax+0E4]
 0009625B    mov         eax,dword ptr [ebp-4]
 0009625E    mov         esi,dword ptr [eax+0E8]
 00096264    cmp         esi,ecx
>00096266    jge         0009626C
 00096268    mov         edi,ecx
>0009626A    jmp         0009626E
 0009626C    mov         edi,esi
 0009626E    mov         eax,dword ptr [ebp-4]
 00096271    mov         eax,dword ptr [eax+0EC]
 00096277    imul        edi
 00096279    cdq
 0009627A    idiv        eax,ecx
 0009627C    mov         dword ptr [ebx+30C],eax;TFormPreview.?f30C:Integer
 00096282    mov         eax,dword ptr [ebp-4]
 00096285    mov         eax,dword ptr [eax+0F0]
 0009628B    imul        edi
 0009628D    cdq
 0009628E    idiv        eax,esi
 00096290    mov         dword ptr [ebx+310],eax;TFormPreview.?f310:Integer
 00096296    lea         eax,[ebx+314];TFormPreview.?f314:?
 0009629C    push        eax
 0009629D    push        0
 0009629F    push        0
 000962A1    push        0D
 000962A3    call        Printer
 000962A8    call        TPrinter.GetHandle
 000962AD    push        eax
 000962AE    call        gdi32.Escape
 000962B3    mov         dword ptr [ebx+2FC],1;TFormPreview.?f2FC:dword
 000962BD    xor         eax,eax
 000962BF    mov         dword ptr [ebx+300],eax;TFormPreview.?f300:dword
 000962C5    mov         edx,1
 000962CA    mov         eax,dword ptr [ebp-4]
 000962CD    call        00095E00
 000962D2    mov         eax,ebx
 000962D4    mov         edx,dword ptr [eax]
 000962D6    call        dword ptr [edx+0CC];TCustomForm.ShowModal
 000962DC    xor         eax,eax
 000962DE    pop         edx
 000962DF    pop         ecx
 000962E0    pop         ecx
 000962E1    mov         dword ptr fs:[eax],edx
 000962E4    push        96304
 000962E9    mov         eax,dword ptr [ebp-4]
 000962EC    mov         eax,dword ptr [eax+24]
 000962EF    xor         edx,edx
 000962F1    mov         dword ptr [eax+2F8],edx
 000962F7    call        TCustomForm.Release
 000962FC    ret
>000962FD    jmp         @HandleFinally
>00096302    jmp         000962E9
 00096304    xor         eax,eax
 00096306    pop         edx
 00096307    pop         ecx
 00096308    pop         ecx
 00096309    mov         dword ptr fs:[eax],edx
 0009630C    push        96321
 00096311    lea         eax,[ebp-8]
 00096314    call        @LStrClr
 00096319    ret
>0009631A    jmp         @HandleFinally
>0009631F    jmp         00096311
 00096321    pop         edi
 00096322    pop         esi
 00096323    pop         ebx
 00096324    pop         ecx
 00096325    pop         ecx
 00096326    pop         ebp
 00096327    ret
end;*}

//00096328
{*function sub_00096328(?:?):?;
begin
 00096328    push        ebx
 00096329    mov         ebx,eax
 0009632B    mov         eax,ebx
 0009632D    call        00096F18
 00096332    mov         eax,dword ptr [ebx+4C]
 00096335    pop         ebx
 00096336    ret
end;*}

//00096338
{*procedure sub_00096338(?:?);
begin
 00096338    mov         dl,byte ptr [eax+69]
 0009633B    call        00096560
 00096340    ret
end;*}

//00096344
{*function sub_00096344(?:TCMReport; ?:TLineSpacing):?;
begin
 00096344    push        ebx
 00096345    push        esi
 00096346    push        edi
 00096347    add         esp,0FFFFFFF8
 0009634A    mov         ebx,edx
 0009634C    mov         esi,eax
 0009634E    mov         ecx,esp
 00096350    mov         edx,963A4;'X'
 00096355    mov         eax,esi
 00096357    call        000958D4
 0009635C    mov         eax,dword ptr [esp+4]
 00096360    sub         bl,1
>00096363    jb          00096371
>00096365    je          0009637C
 00096367    dec         bl
>00096369    je          00096380
 0009636B    dec         bl
>0009636D    je          0009638D
>0009636F    jmp         00096391
 00096371    mov         edi,eax
 00096373    sar         edi,1
>00096375    jns         00096391
 00096377    adc         edi,0
>0009637A    jmp         00096391
 0009637C    mov         edi,eax
>0009637E    jmp         00096391
 00096380    mov         edi,eax
 00096382    sar         edi,1
>00096384    jns         00096389
 00096386    adc         edi,0
 00096389    add         edi,eax
>0009638B    jmp         00096391
 0009638D    mov         edi,eax
 0009638F    add         edi,edi
 00096391    mov         eax,edi
 00096393    pop         ecx
 00096394    pop         edx
 00096395    pop         edi
 00096396    pop         esi
 00096397    pop         ebx
 00096398    ret
end;*}

//000963A8
{*procedure sub_000963A8(?:?; ?:AnsiString; ?:?);
begin
 000963A8    push        ebp
 000963A9    mov         ebp,esp
 000963AB    add         esp,0FFFFFFF4
 000963AE    push        ebx
 000963AF    push        esi
 000963B0    mov         dword ptr [ebp-0C],ecx
 000963B3    mov         dword ptr [ebp-8],edx
 000963B6    mov         dword ptr [ebp-4],eax
 000963B9    mov         eax,dword ptr [ebp-4]
 000963BC    call        @LStrAddRef
 000963C1    mov         eax,dword ptr [ebp-8]
 000963C4    call        @LStrAddRef
 000963C9    xor         eax,eax
 000963CB    push        ebp
 000963CC    push        96464
 000963D1    push        dword ptr fs:[eax]
 000963D4    mov         dword ptr fs:[eax],esp
 000963D7    mov         edx,dword ptr [ebp-4]
 000963DA    mov         eax,dword ptr [ebp-8]
 000963DD    call        @LStrPos
 000963E2    mov         esi,eax
 000963E4    test        esi,esi
>000963E6    jle         00096441
 000963E8    mov         eax,dword ptr [ebp-4]
 000963EB    call        @LStrLen
 000963F0    lea         edx,[esi+3]
 000963F3    cmp         eax,edx
>000963F5    jl          00096441
 000963F7    lea         ebx,[esi+2]
 000963FA    mov         eax,dword ptr [ebp-4]
 000963FD    call        @LStrLen
 00096402    sub         eax,ebx
>00096404    jl          00096415
 00096406    inc         eax
 00096407    mov         edx,dword ptr [ebp-4]
 0009640A    cmp         byte ptr [edx+ebx-1],7D
>0009640F    je          00096415
 00096411    inc         ebx
 00096412    dec         eax
>00096413    jne         00096407
 00096415    mov         eax,dword ptr [ebp-4]
 00096418    cmp         byte ptr [eax+ebx-1],7D
>0009641D    jne         00096437
 0009641F    mov         eax,dword ptr [ebp-0C]
 00096422    push        eax
 00096423    mov         ecx,ebx
 00096425    sub         ecx,esi
 00096427    sub         ecx,2
 0009642A    lea         edx,[esi+2]
 0009642D    mov         eax,dword ptr [ebp-4]
 00096430    call        @LStrCopy
>00096435    jmp         00096449
 00096437    mov         eax,dword ptr [ebp-0C]
 0009643A    call        @LStrClr
>0009643F    jmp         00096449
 00096441    mov         eax,dword ptr [ebp-0C]
 00096444    call        @LStrClr
 00096449    xor         eax,eax
 0009644B    pop         edx
 0009644C    pop         ecx
 0009644D    pop         ecx
 0009644E    mov         dword ptr fs:[eax],edx
 00096451    push        9646B
 00096456    lea         eax,[ebp-8]
 00096459    mov         edx,2
 0009645E    call        @LStrArrayClr
 00096463    ret
>00096464    jmp         @HandleFinally
>00096469    jmp         00096456
 0009646B    pop         esi
 0009646C    pop         ebx
 0009646D    mov         esp,ebp
 0009646F    pop         ebp
 00096470    ret
end;*}

//00096474
{*function sub_00096474(?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00096474    push        ebp
 00096475    mov         ebp,esp
 00096477    add         esp,0FFFFFFF8
 0009647A    push        ebx
 0009647B    push        esi
 0009647C    push        edi
 0009647D    xor         ebx,ebx
 0009647F    mov         dword ptr [ebp-8],ebx
 00096482    mov         ebx,ecx
 00096484    mov         dword ptr [ebp-4],edx
 00096487    mov         edi,dword ptr [ebp+8]
 0009648A    mov         esi,dword ptr [ebp+0C]
 0009648D    mov         eax,dword ptr [ebp-4]
 00096490    call        @LStrAddRef
 00096495    xor         eax,eax
 00096497    push        ebp
 00096498    push        96528
 0009649D    push        dword ptr fs:[eax]
 000964A0    mov         dword ptr fs:[eax],esp
 000964A3    lea         ecx,[ebp-8]
 000964A6    mov         edx,96544;'<{'
 000964AB    mov         eax,dword ptr [ebp-4]
 000964AE    call        000963A8
 000964B3    mov         edx,dword ptr [ebp-8]
 000964B6    mov         eax,ebx
 000964B8    call        @LStrAsg
 000964BD    lea         ecx,[ebp-8]
 000964C0    mov         edx,96550;'^{'
 000964C5    mov         eax,dword ptr [ebp-4]
 000964C8    call        000963A8
 000964CD    mov         edx,dword ptr [ebp-8]
 000964D0    mov         eax,esi
 000964D2    call        @LStrAsg
 000964D7    lea         ecx,[ebp-8]
 000964DA    mov         edx,9655C;'>{'
 000964DF    mov         eax,dword ptr [ebp-4]
 000964E2    call        000963A8
 000964E7    mov         edx,dword ptr [ebp-8]
 000964EA    mov         eax,edi
 000964EC    call        @LStrAsg
 000964F1    push        dword ptr [ebx]
 000964F3    push        dword ptr [esi]
 000964F5    push        dword ptr [edi]
 000964F7    lea         eax,[ebp-8]
 000964FA    mov         edx,3
 000964FF    call        @LStrCatN
 00096504    cmp         dword ptr [ebp-8],0
 00096508    setne       al
 0009650B    mov         ebx,eax
 0009650D    xor         eax,eax
 0009650F    pop         edx
 00096510    pop         ecx
 00096511    pop         ecx
 00096512    mov         dword ptr fs:[eax],edx
 00096515    push        9652F
 0009651A    lea         eax,[ebp-8]
 0009651D    mov         edx,2
 00096522    call        @LStrArrayClr
 00096527    ret
>00096528    jmp         @HandleFinally
>0009652D    jmp         0009651A
 0009652F    mov         eax,ebx
 00096531    pop         edi
 00096532    pop         esi
 00096533    pop         ebx
 00096534    pop         ecx
 00096535    pop         ecx
 00096536    pop         ebp
 00096537    ret         8
end;*}

//00096560
{*function sub_00096560(?:?; ?:?):?;
begin
 00096560    push        ebx
 00096561    push        esi
 00096562    mov         ebx,edx
 00096564    mov         esi,eax
 00096566    cmp         word ptr [esi+0CE],0
>0009656E    je          0009657E
 00096570    mov         edx,esi
 00096572    mov         eax,dword ptr [esi+0D0]
 00096578    call        dword ptr [esi+0CC]
 0009657E    mov         edx,ebx
 00096580    mov         eax,esi
 00096582    call        00096344
 00096587    add         dword ptr [esi+0B0],eax
 0009658D    mov         eax,dword ptr [esi+78]
 00096590    mov         dword ptr [esi+0AC],eax
 00096596    inc         dword ptr [esi+48]
 00096599    mov         eax,dword ptr [esi+48]
 0009659C    pop         esi
 0009659D    pop         ebx
 0009659E    ret
end;*}

//000965A0
{*procedure sub_000965A0(?:?; ?:AnsiString; ?:?; ?:?; ?:?);
begin
 000965A0    push        ebp
 000965A1    mov         ebp,esp
 000965A3    add         esp,0FFFFFFD4
 000965A6    push        ebx
 000965A7    push        esi
 000965A8    push        edi
 000965A9    xor         ebx,ebx
 000965AB    mov         dword ptr [ebp-2C],ebx
 000965AE    mov         dword ptr [ebp-10],ebx
 000965B1    mov         dword ptr [ebp-14],ebx
 000965B4    mov         dword ptr [ebp-18],ebx
 000965B7    mov         dword ptr [ebp-1C],ebx
 000965BA    mov         byte ptr [ebp-9],cl
 000965BD    mov         dword ptr [ebp-8],edx
 000965C0    mov         dword ptr [ebp-4],eax
 000965C3    mov         eax,dword ptr [ebp-8]
 000965C6    call        @LStrAddRef
 000965CB    xor         eax,eax
 000965CD    push        ebp
 000965CE    push        9690A
 000965D3    push        dword ptr fs:[eax]
 000965D6    mov         dword ptr fs:[eax],esp
 000965D9    mov         eax,dword ptr [ebp+8]
 000965DC    mov         byte ptr [eax],1
 000965DF    mov         eax,dword ptr [ebp-8]
 000965E2    mov         edx,96924;'$--'
 000965E7    call        @LStrCmp
>000965EC    jne         00096600
 000965EE    mov         edx,2
 000965F3    mov         eax,dword ptr [ebp-4]
 000965F6    call        00096EA0
>000965FB    jmp         000968DF
 00096600    mov         eax,dword ptr [ebp-8]
 00096603    mov         edx,96930;'$=='
 00096608    call        @LStrCmp
>0009660D    jne         00096621
 0009660F    mov         edx,4
 00096614    mov         eax,dword ptr [ebp-4]
 00096617    call        00096EA0
>0009661C    jmp         000968DF
 00096621    lea         eax,[ebp-14]
 00096624    push        eax
 00096625    lea         eax,[ebp-18]
 00096628    push        eax
 00096629    lea         ecx,[ebp-10]
 0009662C    mov         edx,dword ptr [ebp-8]
 0009662F    mov         eax,dword ptr [ebp-4]
 00096632    call        00096474
 00096637    test        al,al
>00096639    je          000966A4
 0009663B    push        0
 0009663D    lea         eax,[ebp-1D]
 00096640    push        eax
 00096641    xor         ecx,ecx
 00096643    mov         edx,dword ptr [ebp-10]
 00096646    mov         eax,dword ptr [ebp-4]
 00096649    call        000965A0
 0009664E    push        2
 00096650    lea         eax,[ebp-1E]
 00096653    push        eax
 00096654    xor         ecx,ecx
 00096656    mov         edx,dword ptr [ebp-14]
 00096659    mov         eax,dword ptr [ebp-4]
 0009665C    call        000965A0
 00096661    push        1
 00096663    lea         eax,[ebp-1F]
 00096666    push        eax
 00096667    xor         ecx,ecx
 00096669    mov         edx,dword ptr [ebp-18]
 0009666C    mov         eax,dword ptr [ebp-4]
 0009666F    call        000965A0
 00096674    mov         al,byte ptr [ebp-1D]
 00096677    and         al,byte ptr [ebp-1E]
>0009667A    je          00096682
 0009667C    cmp         byte ptr [ebp-1F],0
>00096680    jne         00096686
 00096682    xor         eax,eax
>00096684    jmp         00096688
 00096686    mov         al,1
 00096688    mov         edx,dword ptr [ebp+8]
 0009668B    mov         byte ptr [edx],al
 0009668D    cmp         byte ptr [ebp-9],0
>00096691    je          000968DF
 00096697    mov         eax,dword ptr [ebp-4]
 0009669A    call        00096338
>0009669F    jmp         000968DF
 000966A4    xor         eax,eax
 000966A6    push        ebp
 000966A7    push        966CD
 000966AC    push        dword ptr fs:[eax]
 000966AF    mov         dword ptr fs:[eax],esp
 000966B2    lea         ecx,[ebp-28]
 000966B5    mov         edx,dword ptr [ebp-8]
 000966B8    mov         eax,dword ptr [ebp-4]
 000966BB    call        000958D4
 000966C0    mov         ebx,dword ptr [ebp-28]
 000966C3    xor         eax,eax
 000966C5    pop         edx
 000966C6    pop         ecx
 000966C7    pop         ecx
 000966C8    mov         dword ptr fs:[eax],edx
>000966CB    jmp         000966E5
>000966CD    jmp         @HandleOnException
 000966D2    dd          1
 000966D6    dd          00032360;EPrinter
 000966DA    dd          000966DE
 000966DE    xor         ebx,ebx
 000966E0    call        @DoneExcept
 000966E5    mov         eax,dword ptr [ebp-4]
 000966E8    call        000959C4
 000966ED    cmp         ebx,eax
>000966EF    jle         00096800
 000966F5    mov         eax,dword ptr [ebp+8]
 000966F8    mov         byte ptr [eax],0
 000966FB    mov         eax,dword ptr [ebp-4]
 000966FE    test        byte ptr [eax+45],20
>00096702    je          000967C5
>00096708    jmp         000967B0
 0009670D    push        1
 0009670F    lea         eax,[ebp-1D]
 00096712    push        eax
 00096713    lea         eax,[ebp-1C]
 00096716    push        eax
 00096717    mov         eax,dword ptr [ebp-4]
 0009671A    call        000959C4
 0009671F    mov         ecx,eax
 00096721    mov         edx,dword ptr [ebp-8]
 00096724    mov         eax,dword ptr [ebp-4]
 00096727    call        0009696C
 0009672C    lea         edx,[ebp-2C]
 0009672F    mov         eax,dword ptr [ebp-1C]
 00096732    call        Trim
 00096737    mov         eax,dword ptr [ebp-2C]
 0009673A    call        @LStrLen
 0009673F    test        eax,eax
>00096741    jle         00096763
 00096743    mov         al,byte ptr [ebp+0C]
 00096746    push        eax
 00096747    lea         eax,[ebp-1D]
 0009674A    push        eax
 0009674B    lea         edx,[ebp-2C]
 0009674E    mov         eax,dword ptr [ebp-1C]
 00096751    call        Trim
 00096756    mov         edx,dword ptr [ebp-2C]
 00096759    mov         cl,1
 0009675B    mov         eax,dword ptr [ebp-4]
 0009675E    call        000965A0
 00096763    mov         eax,dword ptr [ebp-1C]
 00096766    call        @LStrLen
 0009676B    mov         ebx,eax
 0009676D    mov         eax,dword ptr [ebp-8]
 00096770    call        @LStrLen
 00096775    cmp         ebx,eax
>00096777    jne         00096783
 00096779    lea         eax,[ebp-8]
 0009677C    call        @LStrClr
>00096781    jmp         000967B0
 00096783    lea         eax,[ebp-8]
 00096786    push        eax
 00096787    mov         eax,dword ptr [ebp-8]
 0009678A    call        @LStrLen
 0009678F    mov         ebx,eax
 00096791    mov         eax,dword ptr [ebp-1C]
 00096794    call        @LStrLen
 00096799    sub         ebx,eax
 0009679B    push        ebx
 0009679C    mov         eax,dword ptr [ebp-1C]
 0009679F    call        @LStrLen
 000967A4    mov         edx,eax
 000967A6    inc         edx
 000967A7    mov         eax,dword ptr [ebp-8]
 000967AA    pop         ecx
 000967AB    call        @LStrCopy
 000967B0    mov         eax,dword ptr [ebp-8]
 000967B3    call        @LStrLen
 000967B8    test        eax,eax
>000967BA    jg          0009670D
>000967C0    jmp         000968DF
 000967C5    push        0
 000967C7    lea         eax,[ebp-1D]
 000967CA    push        eax
 000967CB    lea         eax,[ebp-2C]
 000967CE    push        eax
 000967CF    mov         eax,dword ptr [ebp-4]
 000967D2    call        000959C4
 000967D7    mov         ecx,eax
 000967D9    mov         edx,dword ptr [ebp-8]
 000967DC    mov         eax,dword ptr [ebp-4]
 000967DF    call        0009696C
 000967E4    mov         edx,dword ptr [ebp-2C]
 000967E7    lea         eax,[ebp-8]
 000967EA    call        @LStrLAsg
 000967EF    lea         ecx,[ebp-28]
 000967F2    mov         edx,dword ptr [ebp-8]
 000967F5    mov         eax,dword ptr [ebp-4]
 000967F8    call        000958D4
 000967FD    mov         ebx,dword ptr [ebp-28]
 00096800    mov         al,byte ptr [ebp+0C]
 00096803    dec         al
>00096805    je          0009680D
 00096807    dec         al
>00096809    je          00096828
>0009680B    jmp         0009684A
 0009680D    mov         eax,dword ptr [ebp-4]
 00096810    call        000959C4
 00096815    mov         edx,dword ptr [ebp-4]
 00096818    add         eax,dword ptr [edx+78]
 0009681B    sub         eax,ebx
 0009681D    mov         edx,dword ptr [ebp-4]
 00096820    mov         dword ptr [edx+0AC],eax
>00096826    jmp         00096859
 00096828    mov         eax,dword ptr [ebp-4]
 0009682B    call        000959C4
 00096830    sub         eax,ebx
 00096832    sar         eax,1
>00096834    jns         00096839
 00096836    adc         eax,0
 00096839    mov         edx,dword ptr [ebp-4]
 0009683C    add         eax,dword ptr [edx+78]
 0009683F    mov         edx,dword ptr [ebp-4]
 00096842    mov         dword ptr [edx+0AC],eax
>00096848    jmp         00096859
 0009684A    mov         eax,dword ptr [ebp-4]
 0009684D    mov         eax,dword ptr [eax+78]
 00096850    mov         edx,dword ptr [ebp-4]
 00096853    mov         dword ptr [edx+0AC],eax
 00096859    cmp         byte ptr [ebp-9],0
>0009685D    je          00096878
 0009685F    mov         edx,1
 00096864    mov         eax,dword ptr [ebp-4]
 00096867    call        00097854
 0009686C    test        al,al
>0009686E    jne         00096878
 00096870    mov         eax,dword ptr [ebp-4]
 00096873    call        00096328
 00096878    xor         eax,eax
 0009687A    push        ebp
 0009687B    push        968B1
 00096880    push        dword ptr fs:[eax]
 00096883    mov         dword ptr fs:[eax],esp
 00096886    mov         eax,dword ptr [ebp-8]
 00096889    push        eax
 0009688A    mov         eax,dword ptr [ebp-4]
 0009688D    mov         ecx,dword ptr [eax+0B0]
 00096893    mov         eax,dword ptr [ebp-4]
 00096896    mov         edx,dword ptr [eax+0AC]
 0009689C    mov         eax,dword ptr [ebp-4]
 0009689F    mov         eax,dword ptr [eax+34]
 000968A2    call        TCanvas.TextOut
 000968A7    xor         eax,eax
 000968A9    pop         edx
 000968AA    pop         ecx
 000968AB    pop         ecx
 000968AC    mov         dword ptr fs:[eax],edx
>000968AF    jmp         000968D1
>000968B1    jmp         @HandleAnyException
 000968B6    mov         ecx,9693C;'Unable to print a new line.'
 000968BB    mov         dl,1
 000968BD    mov         eax,[00032360];EPrinter
 000968C2    call        Exception.Create;EPrinter.Create
 000968C7    call        @RaiseExcept
 000968CC    call        @DoneExcept
 000968D1    cmp         byte ptr [ebp-9],0
>000968D5    je          000968DF
 000968D7    mov         eax,dword ptr [ebp-4]
 000968DA    call        00096338
 000968DF    xor         eax,eax
 000968E1    pop         edx
 000968E2    pop         ecx
 000968E3    pop         ecx
 000968E4    mov         dword ptr fs:[eax],edx
 000968E7    push        96911
 000968EC    lea         eax,[ebp-2C]
 000968EF    call        @LStrClr
 000968F4    lea         eax,[ebp-1C]
 000968F7    mov         edx,4
 000968FC    call        @LStrArrayClr
 00096901    lea         eax,[ebp-8]
 00096904    call        @LStrClr
 00096909    ret
>0009690A    jmp         @HandleFinally
>0009690F    jmp         000968EC
 00096911    pop         edi
 00096912    pop         esi
 00096913    pop         ebx
 00096914    mov         esp,ebp
 00096916    pop         ebp
 00096917    ret         8
end;*}

//00096958
{*function sub_00096958:?;
begin
 00096958    push        ecx
 00096959    push        0
 0009695B    lea         ecx,[esp+4]
 0009695F    push        ecx
 00096960    mov         cl,1
 00096962    call        000965A0
 00096967    mov         al,byte ptr [esp]
 0009696A    pop         edx
 0009696B    ret
end;*}

//0009696C
{*procedure sub_0009696C(?:?; ?:AnsiString; ?:?; ?:?; ?:?; ?:?);
begin
 0009696C    push        ebp
 0009696D    mov         ebp,esp
 0009696F    add         esp,0FFFFFFF4
 00096972    push        ebx
 00096973    push        esi
 00096974    push        edi
 00096975    mov         edi,ecx
 00096977    mov         dword ptr [ebp-4],edx
 0009697A    mov         esi,eax
 0009697C    mov         eax,dword ptr [ebp-4]
 0009697F    call        @LStrAddRef
 00096984    xor         eax,eax
 00096986    push        ebp
 00096987    push        96A95
 0009698C    push        dword ptr fs:[eax]
 0009698F    mov         dword ptr fs:[eax],esp
 00096992    mov         eax,dword ptr [ebp+0C]
 00096995    mov         byte ptr [eax],1
 00096998    xor         eax,eax
 0009699A    push        ebp
 0009699B    push        96A78
 000969A0    push        dword ptr fs:[eax]
 000969A3    mov         dword ptr fs:[eax],esp
 000969A6    lea         ecx,[ebp-0C]
 000969A9    mov         edx,dword ptr [ebp-4]
 000969AC    mov         eax,esi
 000969AE    call        000958D4
 000969B3    mov         ebx,dword ptr [ebp-0C]
 000969B6    cmp         edi,ebx
>000969B8    jge         00096A5F
 000969BE    mov         eax,dword ptr [ebp+0C]
 000969C1    mov         byte ptr [eax],0
>000969C4    jmp         000969F2
 000969C6    lea         eax,[ebp-4]
 000969C9    push        eax
 000969CA    mov         eax,dword ptr [ebp-4]
 000969CD    call        @LStrLen
 000969D2    mov         ecx,eax
 000969D4    dec         ecx
 000969D5    mov         edx,1
 000969DA    mov         eax,dword ptr [ebp-4]
 000969DD    call        @LStrCopy
 000969E2    lea         ecx,[ebp-0C]
 000969E5    mov         edx,dword ptr [ebp-4]
 000969E8    mov         eax,esi
 000969EA    call        000958D4
 000969EF    mov         ebx,dword ptr [ebp-0C]
 000969F2    mov         eax,dword ptr [ebp-4]
 000969F5    call        @LStrLen
 000969FA    dec         eax
>000969FB    jle         00096A01
 000969FD    cmp         edi,ebx
>000969FF    jl          000969C6
 00096A01    cmp         byte ptr [ebp+10],0
>00096A05    je          00096A5F
 00096A07    mov         eax,dword ptr [ebp-4]
 00096A0A    call        @LStrLen
 00096A0F    test        eax,eax
>00096A11    jle         00096A5F
 00096A13    mov         eax,dword ptr [ebp-4]
 00096A16    call        @LStrLen
 00096A1B    mov         ebx,eax
 00096A1D    cmp         ebx,1
>00096A20    jl          00096A46
 00096A22    mov         eax,dword ptr [ebp-4]
 00096A25    mov         al,byte ptr [eax+ebx-1]
 00096A29    add         al,0E0
 00096A2B    sub         al,2
>00096A2D    jb          00096A46
 00096A2F    sub         al,0A
>00096A31    je          00096A46
 00096A33    sub         al,2
>00096A35    je          00096A46
 00096A37    add         al,0F4
 00096A39    sub         al,2
>00096A3B    jb          00096A46
 00096A3D    sub         al,3
>00096A3F    je          00096A46
 00096A41    dec         ebx
 00096A42    test        ebx,ebx
>00096A44    jne         00096A22
 00096A46    cmp         ebx,5
>00096A49    jle         00096A5F
 00096A4B    lea         eax,[ebp-4]
 00096A4E    push        eax
 00096A4F    mov         ecx,ebx
 00096A51    dec         ecx
 00096A52    mov         edx,1
 00096A57    mov         eax,dword ptr [ebp-4]
 00096A5A    call        @LStrCopy
 00096A5F    xor         eax,eax
 00096A61    pop         edx
 00096A62    pop         ecx
 00096A63    pop         ecx
 00096A64    mov         dword ptr fs:[eax],edx
 00096A67    push        96A7F
 00096A6C    mov         eax,dword ptr [ebp+8]
 00096A6F    mov         edx,dword ptr [ebp-4]
 00096A72    call        @LStrLAsg
 00096A77    ret
>00096A78    jmp         @HandleFinally
>00096A7D    jmp         00096A6C
 00096A7F    xor         eax,eax
 00096A81    pop         edx
 00096A82    pop         ecx
 00096A83    pop         ecx
 00096A84    mov         dword ptr fs:[eax],edx
 00096A87    push        96A9C
 00096A8C    lea         eax,[ebp-4]
 00096A8F    call        @LStrClr
 00096A94    ret
>00096A95    jmp         @HandleFinally
>00096A9A    jmp         00096A8C
 00096A9C    pop         edi
 00096A9D    pop         esi
 00096A9E    pop         ebx
 00096A9F    mov         esp,ebp
 00096AA1    pop         ebp
 00096AA2    ret         0C
end;*}

//00096AA8
{*procedure sub_00096AA8(?:?; ?:AnsiString; ?:?; ?:?);
begin
 00096AA8    push        ebp
 00096AA9    mov         ebp,esp
 00096AAB    push        ecx
 00096AAC    push        ebx
 00096AAD    push        esi
 00096AAE    push        edi
 00096AAF    mov         esi,ecx
 00096AB1    mov         dword ptr [ebp-4],edx
 00096AB4    mov         ebx,eax
 00096AB6    mov         eax,dword ptr [ebp-4]
 00096AB9    call        @LStrAddRef
 00096ABE    xor         eax,eax
 00096AC0    push        ebp
 00096AC1    push        96BCB
 00096AC6    push        dword ptr fs:[eax]
 00096AC9    mov         dword ptr fs:[eax],esp
 00096ACC    cmp         dword ptr [ebp-4],0
>00096AD0    jne         00096ADF
 00096AD2    lea         eax,[ebp-4]
 00096AD5    mov         edx,96BE4;'<1'
 00096ADA    call        @LStrLAsg
 00096ADF    mov         eax,dword ptr [ebp-4]
 00096AE2    call        @LStrLen
 00096AE7    dec         eax
>00096AE8    jne         00096B08
 00096AEA    mov         eax,dword ptr [ebp-4]
 00096AED    mov         al,byte ptr [eax]
 00096AEF    sub         al,3C
>00096AF1    je          00096AFB
 00096AF3    sub         al,2
>00096AF5    je          00096AFB
 00096AF7    sub         al,20
>00096AF9    jne         00096B08
 00096AFB    lea         eax,[ebp-4]
 00096AFE    mov         edx,96BF0;'1'
 00096B03    call        @LStrCat
 00096B08    mov         eax,dword ptr [ebp-4]
 00096B0B    mov         al,byte ptr [eax]
 00096B0D    sub         al,3C
>00096B0F    je          00096B1B
 00096B11    sub         al,2
>00096B13    je          00096B49
 00096B15    sub         al,20
>00096B17    je          00096B32
>00096B19    jmp         00096B60
 00096B1B    mov         byte ptr [esi],0
 00096B1E    lea         eax,[ebp-4]
 00096B21    mov         ecx,1
 00096B26    mov         edx,1
 00096B2B    call        @LStrDelete
>00096B30    jmp         00096B63
 00096B32    mov         byte ptr [esi],2
 00096B35    lea         eax,[ebp-4]
 00096B38    mov         ecx,1
 00096B3D    mov         edx,1
 00096B42    call        @LStrDelete
>00096B47    jmp         00096B63
 00096B49    mov         byte ptr [esi],1
 00096B4C    lea         eax,[ebp-4]
 00096B4F    mov         ecx,1
 00096B54    mov         edx,1
 00096B59    call        @LStrDelete
>00096B5E    jmp         00096B63
 00096B60    mov         byte ptr [esi],0
 00096B63    xor         eax,eax
 00096B65    push        ebp
 00096B66    push        96B96
 00096B6B    push        dword ptr fs:[eax]
 00096B6E    mov         dword ptr fs:[eax],esp
 00096B71    mov         eax,dword ptr [ebp-4]
 00096B74    call        StrToFloat
 00096B79    add         esp,0FFFFFFF8
 00096B7C    fstp        qword ptr [esp]
 00096B7F    wait
 00096B80    mov         eax,ebx
 00096B82    call        0009575C
 00096B87    mov         edx,dword ptr [ebp+8]
 00096B8A    mov         dword ptr [edx],eax
 00096B8C    xor         eax,eax
 00096B8E    pop         edx
 00096B8F    pop         ecx
 00096B90    pop         ecx
 00096B91    mov         dword ptr fs:[eax],edx
>00096B94    jmp         00096BB5
>00096B96    jmp         @HandleOnException
 00096B9B    dd          1
 00096B9F    dd          00017D40;EConvertError
 00096BA3    dd          00096BA7
 00096BA7    mov         eax,dword ptr [ebp+8]
 00096BAA    mov         dword ptr [eax],1
 00096BB0    call        @DoneExcept
 00096BB5    xor         eax,eax
 00096BB7    pop         edx
 00096BB8    pop         ecx
 00096BB9    pop         ecx
 00096BBA    mov         dword ptr fs:[eax],edx
 00096BBD    push        96BD2
 00096BC2    lea         eax,[ebp-4]
 00096BC5    call        @LStrClr
 00096BCA    ret
>00096BCB    jmp         @HandleFinally
>00096BD0    jmp         00096BC2
 00096BD2    pop         edi
 00096BD3    pop         esi
 00096BD4    pop         ebx
 00096BD5    pop         ecx
 00096BD6    pop         ebp
 00096BD7    ret         4
end;*}

//00096BF4
{*function sub_00096BF4(?:?; ?:AnsiString):?;
begin
 00096BF4    push        ebp
 00096BF5    mov         ebp,esp
 00096BF7    add         esp,0FFFFFFC8
 00096BFA    push        ebx
 00096BFB    push        esi
 00096BFC    push        edi
 00096BFD    xor         ecx,ecx
 00096BFF    mov         dword ptr [ebp-28],ecx
 00096C02    mov         dword ptr [ebp-14],ecx
 00096C05    mov         ebx,edx
 00096C07    mov         dword ptr [ebp-4],eax
 00096C0A    xor         eax,eax
 00096C0C    push        ebp
 00096C0D    push        96E75
 00096C12    push        dword ptr fs:[eax]
 00096C15    mov         dword ptr fs:[eax],esp
 00096C18    mov         dl,1
 00096C1A    mov         eax,[0001F340];TStringList
 00096C1F    call        TObject.Create;TStringList.Create
 00096C24    mov         dword ptr [ebp-0C],eax
 00096C27    mov         dl,1
 00096C29    mov         eax,[0001F340];TStringList
 00096C2E    call        TObject.Create;TStringList.Create
 00096C33    mov         dword ptr [ebp-10],eax
 00096C36    mov         byte ptr [ebp-5],1
 00096C3A    xor         edx,edx
 00096C3C    push        ebp
 00096C3D    push        96E50
 00096C42    push        dword ptr fs:[edx]
 00096C45    mov         dword ptr fs:[edx],esp
 00096C48    lea         eax,[ebp-28]
 00096C4B    mov         edx,dword ptr [ebp-4]
 00096C4E    mov         dl,byte ptr [edx+46]
 00096C51    call        @LStrFromChar
 00096C56    mov         edx,dword ptr [ebp-28]
 00096C59    mov         eax,dword ptr [ebp-4]
 00096C5C    mov         eax,dword ptr [eax+5C]
 00096C5F    mov         ecx,dword ptr [ebp-0C]
 00096C62    call        00074084
 00096C67    lea         eax,[ebp-28]
 00096C6A    mov         edx,dword ptr [ebp-4]
 00096C6D    mov         dl,byte ptr [edx+46]
 00096C70    call        @LStrFromChar
 00096C75    mov         edx,dword ptr [ebp-28]
 00096C78    mov         ecx,dword ptr [ebp-10]
 00096C7B    mov         eax,ebx
 00096C7D    call        00074084
 00096C82    mov         eax,dword ptr [ebp-4]
 00096C85    mov         eax,dword ptr [eax+78]
 00096C88    mov         dword ptr [ebp-20],eax
 00096C8B    mov         edx,1
 00096C90    mov         eax,dword ptr [ebp-4]
 00096C93    call        00097854
 00096C98    test        al,al
>00096C9A    jne         00096CA4
 00096C9C    mov         eax,dword ptr [ebp-4]
 00096C9F    call        00096328
 00096CA4    mov         eax,dword ptr [ebp-0C]
 00096CA7    mov         edx,dword ptr [eax]
 00096CA9    call        dword ptr [edx+14];TStringList.GetCount
 00096CAC    mov         esi,eax
 00096CAE    dec         esi
 00096CAF    test        esi,esi
>00096CB1    jl          00096E2A
 00096CB7    inc         esi
 00096CB8    xor         ebx,ebx
 00096CBA    lea         eax,[ebp-18]
 00096CBD    push        eax
 00096CBE    lea         ecx,[ebp-28]
 00096CC1    mov         edx,ebx
 00096CC3    mov         eax,dword ptr [ebp-0C]
 00096CC6    mov         edi,dword ptr [eax]
 00096CC8    call        dword ptr [edi+0C];TStringList.Get
 00096CCB    mov         edx,dword ptr [ebp-28]
 00096CCE    lea         ecx,[ebp-19]
 00096CD1    mov         eax,dword ptr [ebp-4]
 00096CD4    call        00096AA8
 00096CD9    mov         eax,dword ptr [ebp-10]
 00096CDC    mov         edx,dword ptr [eax]
 00096CDE    call        dword ptr [edx+14];TStringList.GetCount
 00096CE1    cmp         ebx,eax
>00096CE3    jge         00096CF4
 00096CE5    lea         ecx,[ebp-14]
 00096CE8    mov         edx,ebx
 00096CEA    mov         eax,dword ptr [ebp-10]
 00096CED    mov         edi,dword ptr [eax]
 00096CEF    call        dword ptr [edi+0C];TStringList.Get
>00096CF2    jmp         00096CFC
 00096CF4    lea         eax,[ebp-14]
 00096CF7    call        @LStrClr
 00096CFC    mov         edx,dword ptr [ebp-14]
 00096CFF    mov         eax,96E90;'{$'
 00096D04    call        @LStrPos
 00096D09    test        eax,eax
>00096D0B    jle         00096D26
 00096D0D    lea         ecx,[ebp-28]
 00096D10    mov         edx,dword ptr [ebp-14]
 00096D13    mov         eax,dword ptr [ebp-4]
 00096D16    call        000953C4
 00096D1B    mov         edx,dword ptr [ebp-28]
 00096D1E    lea         eax,[ebp-14]
 00096D21    call        @LStrLAsg
 00096D26    push        0
 00096D28    lea         eax,[ebp-21]
 00096D2B    push        eax
 00096D2C    lea         eax,[ebp-28]
 00096D2F    push        eax
 00096D30    mov         ecx,dword ptr [ebp-18]
 00096D33    mov         edx,dword ptr [ebp-14]
 00096D36    mov         eax,dword ptr [ebp-4]
 00096D39    call        0009696C
 00096D3E    mov         edx,dword ptr [ebp-28]
 00096D41    lea         eax,[ebp-14]
 00096D44    call        @LStrLAsg
 00096D49    cmp         byte ptr [ebp-21],0
>00096D4D    jne         00096D53
 00096D4F    mov         byte ptr [ebp-5],0
 00096D53    lea         ecx,[ebp-30]
 00096D56    mov         edx,dword ptr [ebp-14]
 00096D59    mov         eax,dword ptr [ebp-4]
 00096D5C    call        000958D4
 00096D61    mov         eax,dword ptr [ebp-30]
 00096D64    mov         dl,byte ptr [ebp-19]
 00096D67    dec         dl
>00096D69    je          00096D71
 00096D6B    dec         dl
>00096D6D    je          00096D84
>00096D6F    jmp         00096DEF
 00096D71    mov         edx,dword ptr [ebp-20]
 00096D74    add         edx,dword ptr [ebp-18]
 00096D77    sub         edx,eax
 00096D79    mov         eax,dword ptr [ebp-4]
 00096D7C    mov         dword ptr [eax+0AC],edx
>00096D82    jmp         00096DFB
 00096D84    mov         edx,dword ptr [ebp-18]
 00096D87    sub         edx,eax
 00096D89    sar         edx,1
>00096D8B    jns         00096D90
 00096D8D    adc         edx,0
 00096D90    add         edx,dword ptr [ebp-20]
 00096D93    mov         eax,dword ptr [ebp-4]
 00096D96    mov         dword ptr [eax+0AC],edx
 00096D9C    mov         eax,dword ptr [ebp-4]
 00096D9F    cmp         byte ptr [eax+68],2
>00096DA3    jne         00096DFB
 00096DA5    lea         ecx,[ebp-30]
 00096DA8    mov         edx,96E9C;'X'
 00096DAD    mov         eax,dword ptr [ebp-4]
 00096DB0    call        000958D4
 00096DB5    mov         eax,dword ptr [ebp-4]
 00096DB8    mov         eax,dword ptr [eax+0AC]
 00096DBE    mov         edx,dword ptr [ebp-4]
 00096DC1    sub         eax,dword ptr [edx+78]
 00096DC4    cdq
 00096DC5    idiv        eax,dword ptr [ebp-30]
 00096DC8    mov         edi,eax
 00096DCA    lea         ecx,[ebp-38]
 00096DCD    mov         edx,96E9C;'X'
 00096DD2    mov         eax,dword ptr [ebp-4]
 00096DD5    call        000958D4
 00096DDA    imul        edi,dword ptr [ebp-38]
 00096DDE    mov         eax,dword ptr [ebp-4]
 00096DE1    add         edi,dword ptr [eax+78]
 00096DE4    mov         eax,dword ptr [ebp-4]
 00096DE7    mov         dword ptr [eax+0AC],edi
>00096DED    jmp         00096DFB
 00096DEF    mov         eax,dword ptr [ebp-4]
 00096DF2    mov         edx,dword ptr [ebp-20]
 00096DF5    mov         dword ptr [eax+0AC],edx
 00096DFB    mov         eax,dword ptr [ebp-14]
 00096DFE    push        eax
 00096DFF    mov         eax,dword ptr [ebp-4]
 00096E02    mov         ecx,dword ptr [eax+0B0]
 00096E08    mov         eax,dword ptr [ebp-4]
 00096E0B    mov         edx,dword ptr [eax+0AC]
 00096E11    mov         eax,dword ptr [ebp-4]
 00096E14    mov         eax,dword ptr [eax+34]
 00096E17    call        TCanvas.TextOut
 00096E1C    mov         eax,dword ptr [ebp-18]
 00096E1F    add         dword ptr [ebp-20],eax
 00096E22    inc         ebx
 00096E23    dec         esi
>00096E24    jne         00096CBA
 00096E2A    xor         eax,eax
 00096E2C    pop         edx
 00096E2D    pop         ecx
 00096E2E    pop         ecx
 00096E2F    mov         dword ptr fs:[eax],edx
 00096E32    push        96E57
 00096E37    mov         eax,dword ptr [ebp-4]
 00096E3A    call        00096338
 00096E3F    mov         eax,dword ptr [ebp-0C]
 00096E42    call        TObject.Free
 00096E47    mov         eax,dword ptr [ebp-10]
 00096E4A    call        TObject.Free
 00096E4F    ret
>00096E50    jmp         @HandleFinally
>00096E55    jmp         00096E37
 00096E57    xor         eax,eax
 00096E59    pop         edx
 00096E5A    pop         ecx
 00096E5B    pop         ecx
 00096E5C    mov         dword ptr fs:[eax],edx
 00096E5F    push        96E7C
 00096E64    lea         eax,[ebp-28]
 00096E67    call        @LStrClr
 00096E6C    lea         eax,[ebp-14]
 00096E6F    call        @LStrClr
 00096E74    ret
>00096E75    jmp         @HandleFinally
>00096E7A    jmp         00096E64
 00096E7C    mov         al,byte ptr [ebp-5]
 00096E7F    pop         edi
 00096E80    pop         esi
 00096E81    pop         ebx
 00096E82    mov         esp,ebp
 00096E84    pop         ebp
 00096E85    ret
end;*}

//00096EA0
{*procedure sub_00096EA0(?:?; ?:?);
begin
 00096EA0    push        ebx
 00096EA1    push        esi
 00096EA2    push        edi
 00096EA3    mov         edi,edx
 00096EA5    mov         ebx,eax
 00096EA7    mov         eax,ebx
 00096EA9    call        000959D4
 00096EAE    mov         edx,dword ptr [ebx+0B0]
 00096EB4    add         edx,dword ptr [ebx+6C]
 00096EB7    cmp         eax,edx
>00096EB9    jg          00096EC2
 00096EBB    mov         eax,ebx
 00096EBD    call        00096328
 00096EC2    mov         esi,dword ptr [ebx+34]
 00096EC5    mov         eax,dword ptr [ebx+0A8]
 00096ECB    mov         ecx,12C
 00096ED0    cdq
 00096ED1    idiv        eax,ecx
 00096ED3    mov         edx,eax
 00096ED5    imul        edx,edi
 00096ED8    mov         eax,dword ptr [esi+10]
 00096EDB    call        TPen.SetWidth
 00096EE0    mov         ecx,dword ptr [ebx+0B0]
 00096EE6    mov         edx,dword ptr [ebx+78]
 00096EE9    mov         eax,esi
 00096EEB    call        TCanvas.MoveTo
 00096EF0    mov         eax,ebx
 00096EF2    call        000959C4
 00096EF7    mov         edx,eax
 00096EF9    add         edx,dword ptr [ebx+78]
 00096EFC    mov         ecx,dword ptr [ebx+0B0]
 00096F02    mov         eax,esi
 00096F04    call        TCanvas.LineTo
 00096F09    xor         edx,edx
 00096F0B    mov         eax,ebx
 00096F0D    call        00096560
 00096F12    pop         edi
 00096F13    pop         esi
 00096F14    pop         ebx
 00096F15    ret
end;*}

//00096F18
{*procedure sub_00096F18(?:?);
begin
 00096F18    push        ebp
 00096F19    mov         ebp,esp
 00096F1B    add         esp,0FFFFFFF0
 00096F1E    push        ebx
 00096F1F    push        esi
 00096F20    push        edi
 00096F21    xor         edx,edx
 00096F23    mov         dword ptr [ebp-10],edx
 00096F26    mov         dword ptr [ebp-0C],edx
 00096F29    mov         ebx,eax
 00096F2B    xor         eax,eax
 00096F2D    push        ebp
 00096F2E    push        972BC
 00096F33    push        dword ptr fs:[eax]
 00096F36    mov         dword ptr fs:[eax],esp
 00096F39    cmp         word ptr [ebx+0D6],0
>00096F41    je          00096F51
 00096F43    mov         edx,ebx
 00096F45    mov         eax,dword ptr [ebx+0D8]
 00096F4B    call        dword ptr [ebx+0D4]
 00096F51    cmp         byte ptr [ebx+30],0
>00096F55    je          0009703D
 00096F5B    mov         eax,dword ptr [ebx+2C]
 00096F5E    test        eax,eax
>00096F60    je          00096F6C
 00096F62    call        TObject.Free
 00096F67    xor         eax,eax
 00096F69    mov         dword ptr [ebx+2C],eax
 00096F6C    mov         dl,1
 00096F6E    mov         eax,[00028E34];TMetafile
 00096F73    call        TMetafile.Create;TMetafile.Create
 00096F78    mov         esi,eax
 00096F7A    mov         eax,dword ptr [ebx+28]
 00096F7D    mov         edx,esi
 00096F7F    call        TList.Add
 00096F84    mov         eax,dword ptr [ebx+0E4]
 00096F8A    push        eax
 00096F8B    mov         eax,dword ptr [ebx+0E8]
 00096F91    push        eax
 00096F92    mov         eax,dword ptr [ebx+0EC]
 00096F98    push        eax
 00096F99    mov         eax,dword ptr [ebx+0F0]
 00096F9F    push        eax
 00096FA0    mov         eax,dword ptr [ebx+0F4]
 00096FA6    push        eax
 00096FA7    mov         eax,dword ptr [ebx+0F8]
 00096FAD    push        eax
 00096FAE    mov         eax,dword ptr [ebx+0FC]
 00096FB4    push        eax
 00096FB5    mov         eax,dword ptr [ebx+100]
 00096FBB    push        eax
 00096FBC    mov         eax,dword ptr [ebx+104]
 00096FC2    push        eax
 00096FC3    mov         eax,dword ptr [ebx+108]
 00096FC9    push        eax
 00096FCA    mov         ecx,esi
 00096FCC    mov         dl,1
 00096FCE    mov         eax,[0009416C];TPrnMetafileCanvas
 00096FD3    call        TPrnMetafileCanvas.Create;TPrnMetafileCanvas.Create
 00096FD8    mov         edi,eax
 00096FDA    mov         dword ptr [ebx+2C],edi
 00096FDD    mov         esi,edi
 00096FDF    mov         dword ptr [ebx+34],esi
 00096FE2    mov         edx,dword ptr [ebx+38]
 00096FE5    mov         eax,dword ptr [esi+0C];TPrnMetafileCanvas.Font:TFont
 00096FE8    mov         ecx,dword ptr [eax]
 00096FEA    call        dword ptr [ecx+8];TFont.Assign
 00096FED    mov         eax,dword ptr [ebx+2C]
 00096FF0    mov         eax,dword ptr [eax+14]
 00096FF3    mov         dl,1
 00096FF5    call        TBrush.SetStyle
 00096FFA    mov         eax,ebx
 00096FFC    call        TCMReport.GetFont
 00097001    lea         edx,[ebp-0C]
 00097004    call        TFont.GetName
 00097009    mov         edx,dword ptr [ebp-0C]
 0009700C    mov         eax,dword ptr [ebx+2C]
 0009700F    mov         eax,dword ptr [eax+0C]
 00097012    call        TFont.SetName
 00097017    mov         eax,dword ptr [ebx+0A8]
 0009701D    mov         edx,dword ptr [ebx+2C]
 00097020    mov         esi,dword ptr [edx+0C]
 00097023    mov         dword ptr [esi+18],eax
 00097026    mov         eax,ebx
 00097028    call        TCMReport.GetFont
 0009702D    call        TFont.GetSize
 00097032    mov         edx,eax
 00097034    mov         eax,esi
 00097036    call        TFont.SetSize
>0009703B    jmp         00097085
 0009703D    cmp         dword ptr [ebx+4C],0
>00097041    jle         00097085
 00097043    xor         eax,eax
 00097045    push        ebp
 00097046    push        97065
 0009704B    push        dword ptr fs:[eax]
 0009704E    mov         dword ptr fs:[eax],esp
 00097051    call        Printer
 00097056    call        TPrinter.NewPage
 0009705B    xor         eax,eax
 0009705D    pop         edx
 0009705E    pop         ecx
 0009705F    pop         ecx
 00097060    mov         dword ptr fs:[eax],edx
>00097063    jmp         00097085
>00097065    jmp         @HandleAnyException
 0009706A    mov         ecx,972D4;'Unable to print a new page.'
 0009706F    mov         dl,1
 00097071    mov         eax,[00032360];EPrinter
 00097076    call        Exception.Create;EPrinter.Create
 0009707B    call        @RaiseExcept
 00097080    call        @DoneExcept
 00097085    inc         dword ptr [ebx+4C]
 00097088    xor         eax,eax
 0009708A    mov         dword ptr [ebx+0A0],eax
 00097090    test        byte ptr [ebx+45],2
>00097094    je          0009711B
 0009709A    mov         esi,dword ptr [ebx+34]
 0009709D    mov         eax,dword ptr [ebx+78]
 000970A0    mov         dword ptr [ebx+0AC],eax
 000970A6    mov         eax,dword ptr [ebx+100]
 000970AC    sub         eax,dword ptr [ebx+74]
 000970AF    mov         dword ptr [ebx+0B0],eax
 000970B5    cmp         dword ptr [ebx+54],0
>000970B9    je          000970CF
 000970BB    fild        dword ptr [ebx+6C]
 000970BE    fmul        dword ptr ds:[972F0];1,5:Single
 000970C4    call        @ROUND
 000970C9    sub         dword ptr [ebx+0B0],eax
 000970CF    mov         eax,dword ptr [ebx+0A8]
 000970D5    mov         ecx,12C
 000970DA    cdq
 000970DB    idiv        eax,ecx
 000970DD    mov         edx,eax
 000970DF    add         edx,edx
 000970E1    mov         eax,dword ptr [esi+10]
 000970E4    call        TPen.SetWidth
 000970E9    mov         ecx,dword ptr [ebx+0B0]
 000970EF    mov         edx,dword ptr [ebx+78]
 000970F2    mov         eax,esi
 000970F4    call        TCanvas.MoveTo
 000970F9    mov         eax,ebx
 000970FB    call        000959C4
 00097100    mov         edx,eax
 00097102    add         edx,dword ptr [ebx+78]
 00097105    mov         ecx,dword ptr [ebx+0B0]
 0009710B    mov         eax,esi
 0009710D    call        TCanvas.LineTo
 00097112    mov         eax,dword ptr [ebx+6C]
 00097115    add         dword ptr [ebx+0A0],eax
 0009711B    cmp         dword ptr [ebx+54],0
>0009711F    je          0009717E
 00097121    mov         eax,dword ptr [ebx+78]
 00097124    mov         dword ptr [ebx+0AC],eax
 0009712A    mov         eax,dword ptr [ebx+100]
 00097130    sub         eax,dword ptr [ebx+74]
 00097133    sub         eax,dword ptr [ebx+6C]
 00097136    mov         dword ptr [ebx+0B0],eax
 0009713C    test        byte ptr [ebx+45],10
>00097140    je          00097149
 00097142    mov         eax,ebx
 00097144    call        0009537C
 00097149    push        0
 0009714B    lea         eax,[ebp-5]
 0009714E    push        eax
 0009714F    lea         ecx,[ebp-10]
 00097152    mov         edx,dword ptr [ebx+54]
 00097155    mov         eax,ebx
 00097157    call        000953C4
 0009715C    mov         edx,dword ptr [ebp-10]
 0009715F    xor         ecx,ecx
 00097161    mov         eax,ebx
 00097163    call        000965A0
 00097168    test        byte ptr [ebx+45],10
>0009716C    je          00097175
 0009716E    mov         eax,ebx
 00097170    call        000953B4
 00097175    mov         eax,dword ptr [ebx+6C]
 00097178    add         dword ptr [ebx+0A0],eax
 0009717E    mov         eax,dword ptr [ebx+78]
 00097181    mov         dword ptr [ebx+0AC],eax
 00097187    mov         eax,dword ptr [ebx+70]
 0009718A    mov         dword ptr [ebx+0B0],eax
 00097190    cmp         dword ptr [ebx+50],0
>00097194    je          000971C7
 00097196    test        byte ptr [ebx+45],4
>0009719A    je          000971A3
 0009719C    mov         eax,ebx
 0009719E    call        0009537C
 000971A3    lea         ecx,[ebp-10]
 000971A6    mov         edx,dword ptr [ebx+50]
 000971A9    mov         eax,ebx
 000971AB    call        000953C4
 000971B0    mov         edx,dword ptr [ebp-10]
 000971B3    mov         eax,ebx
 000971B5    call        00096958
 000971BA    test        byte ptr [ebx+45],4
>000971BE    je          000971C7
 000971C0    mov         eax,ebx
 000971C2    call        000953B4
 000971C7    test        byte ptr [ebx+45],1
>000971CB    je          00097232
 000971CD    mov         esi,dword ptr [ebx+34]
 000971D0    mov         eax,dword ptr [ebx+0A8]
 000971D6    mov         ecx,12C
 000971DB    cdq
 000971DC    idiv        eax,ecx
 000971DE    mov         edx,eax
 000971E0    add         edx,edx
 000971E2    mov         eax,dword ptr [esi+10]
 000971E5    call        TPen.SetWidth
 000971EA    cmp         dword ptr [ebx+50],0
>000971EE    je          00097200
 000971F0    mov         eax,dword ptr [ebx+6C]
 000971F3    sar         eax,1
>000971F5    jns         000971FA
 000971F7    adc         eax,0
 000971FA    add         dword ptr [ebx+0B0],eax
 00097200    mov         ecx,dword ptr [ebx+0B0]
 00097206    mov         edx,dword ptr [ebx+78]
 00097209    mov         eax,esi
 0009720B    call        TCanvas.MoveTo
 00097210    mov         eax,ebx
 00097212    call        000959C4
 00097217    mov         edx,eax
 00097219    add         edx,dword ptr [ebx+78]
 0009721C    mov         ecx,dword ptr [ebx+0B0]
 00097222    mov         eax,esi
 00097224    call        TCanvas.LineTo
 00097229    mov         eax,dword ptr [ebx+6C]
 0009722C    add         dword ptr [ebx+0B0],eax
 00097232    xor         eax,eax
 00097234    mov         dword ptr [ebx+48],eax
 00097237    cmp         word ptr [ebx+0DE],0
>0009723F    je          0009724F
 00097241    mov         edx,ebx
 00097243    mov         eax,dword ptr [ebx+0E0]
 00097249    call        dword ptr [ebx+0DC]
 0009724F    test        byte ptr [ebx+45],8
>00097253    je          0009725C
 00097255    mov         eax,ebx
 00097257    call        0009537C
 0009725C    mov         eax,dword ptr [ebx+60]
 0009725F    mov         edx,dword ptr [eax]
 00097261    call        dword ptr [edx+14]
 00097264    mov         esi,eax
 00097266    dec         esi
 00097267    test        esi,esi
>00097269    jl          00097291
 0009726B    inc         esi
 0009726C    mov         dword ptr [ebp-4],0
 00097273    lea         ecx,[ebp-10]
 00097276    mov         eax,dword ptr [ebx+60]
 00097279    mov         edx,dword ptr [ebp-4]
 0009727C    mov         edi,dword ptr [eax]
 0009727E    call        dword ptr [edi+0C]
 00097281    mov         edx,dword ptr [ebp-10]
 00097284    mov         eax,ebx
 00097286    call        00096BF4
 0009728B    inc         dword ptr [ebp-4]
 0009728E    dec         esi
>0009728F    jne         00097273
 00097291    test        byte ptr [ebx+45],8
>00097295    je          0009729E
 00097297    mov         eax,ebx
 00097299    call        000953B4
 0009729E    xor         eax,eax
 000972A0    pop         edx
 000972A1    pop         ecx
 000972A2    pop         ecx
 000972A3    mov         dword ptr fs:[eax],edx
 000972A6    push        972C3
 000972AB    lea         eax,[ebp-10]
 000972AE    call        @LStrClr
 000972B3    lea         eax,[ebp-0C]
 000972B6    call        @LStrClr
 000972BB    ret
>000972BC    jmp         @HandleFinally
>000972C1    jmp         000972AB
 000972C3    pop         edi
 000972C4    pop         esi
 000972C5    pop         ebx
 000972C6    mov         esp,ebp
 000972C8    pop         ebp
 000972C9    ret
end;*}

//000972F4
procedure TCMReport.SetMeasureUnit(Value:TMeasureUnit);
begin
{*
 000972F4    mov         byte ptr [eax+68],dl;TCMReport.MeasureUnit:TMeasureUnit
 000972F7    ret
*}
end;

//000972F8
procedure TCMReport.SetHeaderLines(Value:TStrings);
begin
{*
 000972F8    push        esi
 000972F9    mov         esi,eax
 000972FB    mov         eax,dword ptr [esi+58];TCMReport.HeaderLines:TStrings
 000972FE    mov         ecx,dword ptr [eax]
 00097300    call        dword ptr [ecx+8];TStrings.Assign
 00097303    pop         esi
 00097304    ret
*}
end;

//00097308
procedure TCMReport.SetTableFormatLines(Value:TStrings);
begin
{*
 00097308    push        esi
 00097309    mov         esi,eax
 0009730B    mov         eax,dword ptr [esi+64];TCMReport.TableFormatLines:TStrings
 0009730E    mov         ecx,dword ptr [eax]
 00097310    call        dword ptr [ecx+8];TStrings.Assign
 00097313    pop         esi
 00097314    ret
*}
end;

//00097318
procedure TCMReport.SetTableHeaderLines(Value:TStrings);
begin
{*
 00097318    push        esi
 00097319    mov         esi,eax
 0009731B    mov         eax,dword ptr [esi+60];TCMReport.TableHeaderLines:TStrings
 0009731E    mov         ecx,dword ptr [eax]
 00097320    call        dword ptr [ecx+8];TStrings.Assign
 00097323    pop         esi
 00097324    ret
*}
end;

//00097328
procedure TCMReport.SetPreviewEnabled(Value:Boolean);
begin
{*
 00097328    mov         byte ptr [eax+30],dl;TCMReport.PreviewEnabled:Boolean
 0009732B    ret
*}
end;

//0009732C
procedure TCMReport.SetLineSpacing(Value:TLineSpacing);
begin
{*
 0009732C    push        ebx
 0009732D    push        esi
 0009732E    mov         esi,eax
 00097330    mov         ebx,edx
 00097332    mov         byte ptr [esi+69],bl;TCMReport.LineSpacing:TLineSpacing
 00097335    mov         edx,ebx
 00097337    mov         eax,esi
 00097339    call        00096344
 0009733E    mov         dword ptr [esi+6C],eax;TCMReport.?f6C:dword
 00097341    pop         esi
 00097342    pop         ebx
 00097343    ret
*}
end;

//00097344
{*procedure TCMReport.SetMarginLeft(Value:Double; ?:?; ?:?);
begin
 00097344    push        ebp
 00097345    mov         ebp,esp
 00097347    push        ebx
 00097348    push        esi
 00097349    push        edi
 0009734A    mov         ebx,eax
 0009734C    push        dword ptr [ebp+0C]
 0009734F    push        dword ptr [ebp+8]
 00097352    mov         eax,ebx
 00097354    call        00095890
 00097359    fstp        qword ptr [ebx+90];TCMReport.?f90:Double
 0009735F    wait
 00097360    mov         esi,dword ptr [ebx+104];TCMReport.?f104:dword
 00097366    push        dword ptr [ebp+0C]
 00097369    push        dword ptr [ebp+8]
 0009736C    mov         eax,ebx
 0009736E    call        0009575C
 00097373    mov         edi,eax
 00097375    sub         edi,esi
 00097377    mov         dword ptr [ebx+78],edi;TCMReport.?f78:dword
 0009737A    test        edi,edi
>0009737C    jge         000973A1
 0009737E    xor         eax,eax
 00097380    mov         dword ptr [ebx+78],eax;TCMReport.?f78:dword
 00097383    mov         edx,esi
 00097385    mov         eax,ebx
 00097387    call        00095624
 0009738C    add         esp,0FFFFFFF8
 0009738F    fstp        qword ptr [esp]
 00097392    wait
 00097393    mov         eax,ebx
 00097395    call        00095890
 0009739A    fstp        qword ptr [ebx+90];TCMReport.?f90:Double
 000973A0    wait
 000973A1    pop         edi
 000973A2    pop         esi
 000973A3    pop         ebx
 000973A4    pop         ebp
 000973A5    ret         8
end;*}

//000973A8
{*function TCMReport.GetMarginLeft:?;
begin
 000973A8    add         esp,0FFFFFFF8
 000973AB    push        dword ptr [eax+94];TCMReport.?f94:dword
 000973B1    push        dword ptr [eax+90];TCMReport.?f90:Double
 000973B7    call        0009584C
 000973BC    fstp        qword ptr [esp]
 000973BF    wait
 000973C0    push        dword ptr [esp+4]
 000973C4    push        dword ptr [esp+4]
 000973C8    mov         al,2
 000973CA    call        000741F8
 000973CF    fstp        qword ptr [esp]
 000973D2    wait
 000973D3    fld         qword ptr [esp]
 000973D6    pop         ecx
 000973D7    pop         edx
 000973D8    ret
end;*}

//000973DC
{*procedure TCMReport.SetMarginRight(Value:Double; ?:?; ?:?);
begin
 000973DC    push        ebp
 000973DD    mov         ebp,esp
 000973DF    push        ebx
 000973E0    push        esi
 000973E1    push        edi
 000973E2    mov         ebx,eax
 000973E4    push        dword ptr [ebp+0C]
 000973E7    push        dword ptr [ebp+8]
 000973EA    mov         eax,ebx
 000973EC    call        00095890
 000973F1    fstp        qword ptr [ebx+98];TCMReport.?f98:Double
 000973F7    wait
 000973F8    mov         esi,dword ptr [ebx+104];TCMReport.?f104:dword
 000973FE    push        dword ptr [ebp+0C]
 00097401    push        dword ptr [ebp+8]
 00097404    mov         eax,ebx
 00097406    call        0009575C
 0009740B    mov         edi,eax
 0009740D    sub         edi,esi
 0009740F    mov         dword ptr [ebx+7C],edi;TCMReport.?f7C:dword
 00097412    test        edi,edi
>00097414    jge         00097439
 00097416    xor         eax,eax
 00097418    mov         dword ptr [ebx+7C],eax;TCMReport.?f7C:dword
 0009741B    mov         edx,esi
 0009741D    mov         eax,ebx
 0009741F    call        00095624
 00097424    add         esp,0FFFFFFF8
 00097427    fstp        qword ptr [esp]
 0009742A    wait
 0009742B    mov         eax,ebx
 0009742D    call        00095890
 00097432    fstp        qword ptr [ebx+98];TCMReport.?f98:Double
 00097438    wait
 00097439    pop         edi
 0009743A    pop         esi
 0009743B    pop         ebx
 0009743C    pop         ebp
 0009743D    ret         8
end;*}

//00097440
{*function TCMReport.GetMarginRight:?;
begin
 00097440    add         esp,0FFFFFFF8
 00097443    push        dword ptr [eax+9C];TCMReport.?f9C:dword
 00097449    push        dword ptr [eax+98];TCMReport.?f98:Double
 0009744F    call        0009584C
 00097454    fstp        qword ptr [esp]
 00097457    wait
 00097458    push        dword ptr [esp+4]
 0009745C    push        dword ptr [esp+4]
 00097460    mov         al,2
 00097462    call        000741F8
 00097467    fstp        qword ptr [esp]
 0009746A    wait
 0009746B    fld         qword ptr [esp]
 0009746E    pop         ecx
 0009746F    pop         edx
 00097470    ret
end;*}

//00097474
{*procedure TCMReport.SetMarginTop(Value:Double; ?:?; ?:?);
begin
 00097474    push        ebp
 00097475    mov         ebp,esp
 00097477    push        ebx
 00097478    push        esi
 00097479    push        edi
 0009747A    mov         ebx,eax
 0009747C    push        dword ptr [ebp+0C]
 0009747F    push        dword ptr [ebp+8]
 00097482    mov         eax,ebx
 00097484    call        00095890
 00097489    fstp        qword ptr [ebx+80];TCMReport.?f80:Double
 0009748F    wait
 00097490    mov         esi,dword ptr [ebx+108];TCMReport.?f108:dword
 00097496    push        dword ptr [ebp+0C]
 00097499    push        dword ptr [ebp+8]
 0009749C    mov         eax,ebx
 0009749E    call        000957D4
 000974A3    mov         edi,eax
 000974A5    sub         edi,esi
 000974A7    mov         dword ptr [ebx+70],edi;TCMReport.?f70:dword
 000974AA    test        edi,edi
>000974AC    jge         000974D1
 000974AE    xor         eax,eax
 000974B0    mov         dword ptr [ebx+70],eax;TCMReport.?f70:dword
 000974B3    mov         edx,esi
 000974B5    mov         eax,ebx
 000974B7    call        000956C0
 000974BC    add         esp,0FFFFFFF8
 000974BF    fstp        qword ptr [esp]
 000974C2    wait
 000974C3    mov         eax,ebx
 000974C5    call        00095890
 000974CA    fstp        qword ptr [ebx+80];TCMReport.?f80:Double
 000974D0    wait
 000974D1    pop         edi
 000974D2    pop         esi
 000974D3    pop         ebx
 000974D4    pop         ebp
 000974D5    ret         8
end;*}

//000974D8
{*function TCMReport.GetMarginTop:?;
begin
 000974D8    add         esp,0FFFFFFF8
 000974DB    push        dword ptr [eax+84];TCMReport.?f84:dword
 000974E1    push        dword ptr [eax+80];TCMReport.?f80:Double
 000974E7    call        0009584C
 000974EC    fstp        qword ptr [esp]
 000974EF    wait
 000974F0    push        dword ptr [esp+4]
 000974F4    push        dword ptr [esp+4]
 000974F8    mov         al,2
 000974FA    call        000741F8
 000974FF    fstp        qword ptr [esp]
 00097502    wait
 00097503    fld         qword ptr [esp]
 00097506    pop         ecx
 00097507    pop         edx
 00097508    ret
end;*}

//0009750C
{*procedure TCMReport.SetMarginBottom(Value:Double; ?:?; ?:?);
begin
 0009750C    push        ebp
 0009750D    mov         ebp,esp
 0009750F    push        ebx
 00097510    push        esi
 00097511    push        edi
 00097512    mov         ebx,eax
 00097514    push        dword ptr [ebp+0C]
 00097517    push        dword ptr [ebp+8]
 0009751A    mov         eax,ebx
 0009751C    call        00095890
 00097521    fstp        qword ptr [ebx+88];TCMReport.?f88:Double
 00097527    wait
 00097528    mov         esi,dword ptr [ebx+108];TCMReport.?f108:dword
 0009752E    push        dword ptr [ebp+0C]
 00097531    push        dword ptr [ebp+8]
 00097534    mov         eax,ebx
 00097536    call        000957D4
 0009753B    mov         edi,eax
 0009753D    sub         edi,esi
 0009753F    mov         dword ptr [ebx+74],edi;TCMReport.?f74:dword
 00097542    test        edi,edi
>00097544    jge         00097569
 00097546    xor         eax,eax
 00097548    mov         dword ptr [ebx+74],eax;TCMReport.?f74:dword
 0009754B    mov         edx,esi
 0009754D    mov         eax,ebx
 0009754F    call        000956C0
 00097554    add         esp,0FFFFFFF8
 00097557    fstp        qword ptr [esp]
 0009755A    wait
 0009755B    mov         eax,ebx
 0009755D    call        00095890
 00097562    fstp        qword ptr [ebx+88];TCMReport.?f88:Double
 00097568    wait
 00097569    pop         edi
 0009756A    pop         esi
 0009756B    pop         ebx
 0009756C    pop         ebp
 0009756D    ret         8
end;*}

//00097570
{*function TCMReport.GetMarginBottom:?;
begin
 00097570    add         esp,0FFFFFFF8
 00097573    push        dword ptr [eax+8C];TCMReport.?f8C:dword
 00097579    push        dword ptr [eax+88];TCMReport.?f88:Double
 0009757F    call        0009584C
 00097584    fstp        qword ptr [esp]
 00097587    wait
 00097588    push        dword ptr [esp+4]
 0009758C    push        dword ptr [esp+4]
 00097590    mov         al,2
 00097592    call        000741F8
 00097597    fstp        qword ptr [esp]
 0009759A    wait
 0009759B    fld         qword ptr [esp]
 0009759E    pop         ecx
 0009759F    pop         edx
 000975A0    ret
end;*}

//000975A4
{*function TCMReport.GetFont:?;
begin
 000975A4    push        ebx
 000975A5    push        esi
 000975A6    push        edi
 000975A7    mov         ebx,eax
 000975A9    mov         esi,dword ptr [ebx+38];TCMReport.?f38:TFont
 000975AC    mov         edi,esi
 000975AE    mov         eax,dword ptr [ebx+34];TCMReport.?f34:TCanvas
 000975B1    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 000975B4    mov         edx,esi
 000975B6    mov         ecx,dword ptr [eax]
 000975B8    call        dword ptr [ecx+8];TFont.Assign
 000975BB    mov         dl,byte ptr [ebx+69];TCMReport.LineSpacing:TLineSpacing
 000975BE    mov         eax,ebx
 000975C0    call        TCMReport.SetLineSpacing
 000975C5    mov         eax,edi
 000975C7    pop         edi
 000975C8    pop         esi
 000975C9    pop         ebx
 000975CA    ret
end;*}

//000975CC
procedure TCMReport.SetFont(Value:TFont);
begin
{*
 000975CC    push        ebx
 000975CD    push        esi
 000975CE    mov         esi,edx
 000975D0    mov         ebx,eax
 000975D2    mov         edx,esi
 000975D4    mov         eax,dword ptr [ebx+38];TCMReport.?f38:TFont
 000975D7    mov         ecx,dword ptr [eax]
 000975D9    call        dword ptr [ecx+8];TFont.Assign
 000975DC    mov         eax,dword ptr [ebx+34];TCMReport.?f34:TCanvas
 000975DF    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 000975E2    mov         edx,esi
 000975E4    mov         ecx,dword ptr [eax]
 000975E6    call        dword ptr [ecx+8];TFont.Assign
 000975E9    mov         dl,byte ptr [ebx+69];TCMReport.LineSpacing:TLineSpacing
 000975EC    mov         eax,ebx
 000975EE    call        TCMReport.SetLineSpacing
 000975F3    pop         esi
 000975F4    pop         ebx
 000975F5    ret
*}
end;

//000975F8
{*procedure TCMReport.GetTitle(?:?);
begin
 000975F8    push        ebx
 000975F9    mov         ebx,edx
 000975FB    call        Printer
 00097600    mov         edx,dword ptr [eax+18];TPrinter.FTitle:String
 00097603    mov         eax,ebx
 00097605    call        @LStrLAsg
 0009760A    pop         ebx
 0009760B    ret
end;*}

//0009760C
procedure TCMReport.SetTitle(Value:AnsiString);
begin
{*
 0009760C    push        ebp
 0009760D    mov         ebp,esp
 0009760F    push        ecx
 00097610    mov         dword ptr [ebp-4],edx
 00097613    mov         eax,dword ptr [ebp-4]
 00097616    call        @LStrAddRef
 0009761B    xor         eax,eax
 0009761D    push        ebp
 0009761E    push        9764F
 00097623    push        dword ptr fs:[eax]
 00097626    mov         dword ptr fs:[eax],esp
 00097629    call        Printer
 0009762E    add         eax,18;TPrinter.FTitle:String
 00097631    mov         edx,dword ptr [ebp-4]
 00097634    call        @LStrAsg
 00097639    xor         eax,eax
 0009763B    pop         edx
 0009763C    pop         ecx
 0009763D    pop         ecx
 0009763E    mov         dword ptr fs:[eax],edx
 00097641    push        97656
 00097646    lea         eax,[ebp-4]
 00097649    call        @LStrClr
 0009764E    ret
>0009764F    jmp         @HandleFinally
>00097654    jmp         00097646
 00097656    pop         ecx
 00097657    pop         ebp
 00097658    ret
*}
end;

//0009765C
procedure TCMReport.GetPrinterIndex;
begin
{*
 0009765C    call        Printer
 00097661    call        TPrinter.GetPrinterIndex
 00097666    ret
*}
end;

//00097668
procedure TCMReport.SetPrinterIndex(Value:Integer);
begin
{*
 00097668    push        ebx
 00097669    push        esi
 0009766A    add         esp,0FFFFFFF8
 0009766D    mov         esi,edx
 0009766F    mov         ebx,eax
 00097671    call        Printer
 00097676    call        TPrinter.GetPrinters
 0009767B    mov         edx,dword ptr [eax]
 0009767D    call        dword ptr [edx+14];TStrings.GetCount
 00097680    dec         eax
 00097681    cmp         esi,eax
>00097683    jle         00097688
 00097685    or          esi,0FFFFFFFF
 00097688    call        Printer
 0009768D    mov         edx,esi
 0009768F    call        TPrinter.SetPrinterIndex
 00097694    mov         eax,ebx
 00097696    call        000951D8
 0009769B    mov         eax,ebx
 0009769D    call        TCMReport.GetFont
 000976A2    push        eax
 000976A3    call        Printer
 000976A8    call        TPrinter.GetCanvas
 000976AD    mov         eax,dword ptr [eax+0C];TCanvas.Font:TFont
 000976B0    pop         edx
 000976B1    mov         ecx,dword ptr [eax]
 000976B3    call        dword ptr [ecx+8];TFont.Assign
 000976B6    mov         edx,esp
 000976B8    mov         eax,ebx
 000976BA    call        00095900
 000976BF    mov         eax,dword ptr [esp]
 000976C2    mov         dword ptr [ebx+0A4],eax;TCMReport.?fA4:dword
 000976C8    mov         edx,esp
 000976CA    mov         eax,ebx
 000976CC    call        00095900
 000976D1    mov         eax,dword ptr [esp+4]
 000976D5    mov         dword ptr [ebx+0A8],eax;TCMReport.?fA8:dword
 000976DB    push        dword ptr [ebx+94];TCMReport.?f94:dword
 000976E1    push        dword ptr [ebx+90];TCMReport.?f90:Double
 000976E7    mov         eax,ebx
 000976E9    call        0009584C
 000976EE    add         esp,0FFFFFFF8
 000976F1    fstp        qword ptr [esp]
 000976F4    wait
 000976F5    mov         eax,ebx
 000976F7    call        TCMReport.SetMarginLeft
 000976FC    push        dword ptr [ebx+9C];TCMReport.?f9C:dword
 00097702    push        dword ptr [ebx+98];TCMReport.?f98:Double
 00097708    mov         eax,ebx
 0009770A    call        0009584C
 0009770F    add         esp,0FFFFFFF8
 00097712    fstp        qword ptr [esp]
 00097715    wait
 00097716    mov         eax,ebx
 00097718    call        TCMReport.SetMarginRight
 0009771D    push        dword ptr [ebx+84];TCMReport.?f84:dword
 00097723    push        dword ptr [ebx+80];TCMReport.?f80:Double
 00097729    mov         eax,ebx
 0009772B    call        0009584C
 00097730    add         esp,0FFFFFFF8
 00097733    fstp        qword ptr [esp]
 00097736    wait
 00097737    mov         eax,ebx
 00097739    call        TCMReport.SetMarginTop
 0009773E    push        dword ptr [ebx+8C];TCMReport.?f8C:dword
 00097744    push        dword ptr [ebx+88];TCMReport.?f88:Double
 0009774A    mov         eax,ebx
 0009774C    call        0009584C
 00097751    add         esp,0FFFFFFF8
 00097754    fstp        qword ptr [esp]
 00097757    wait
 00097758    mov         eax,ebx
 0009775A    call        TCMReport.SetMarginBottom
 0009775F    pop         ecx
 00097760    pop         edx
 00097761    pop         esi
 00097762    pop         ebx
 00097763    ret
*}
end;

//00097764
procedure TCMReport.GetCopies;
begin
{*
 00097764    call        Printer
 00097769    call        TPrinter.GetNumCopies
 0009776E    ret
*}
end;

//00097770
procedure TCMReport.SetCopies(Value:Integer);
begin
{*
 00097770    push        ebx
 00097771    mov         ebx,edx
 00097773    call        Printer
 00097778    mov         edx,ebx
 0009777A    call        TPrinter.SetNumCopies
 0009777F    pop         ebx
 00097780    ret
*}
end;

//00097784
{*function TCMReport.GetOrientation:?;
begin
 00097784    call        Printer
 00097789    call        TPrinter.GetOrientation
 0009778E    ret
end;*}

//00097790
procedure TCMReport.SetOrientation(Value:TPrinterOrientation);
begin
{*
 00097790    push        ebx
 00097791    push        esi
 00097792    add         esp,0FFFFFFE0
 00097795    mov         ebx,edx
 00097797    mov         esi,eax
 00097799    mov         eax,esi
 0009779B    call        TCMReport.GetMarginLeft
 000977A0    fstp        qword ptr [esp]
 000977A3    wait
 000977A4    mov         eax,esi
 000977A6    call        TCMReport.GetMarginRight
 000977AB    fstp        qword ptr [esp+8]
 000977AF    wait
 000977B0    mov         eax,esi
 000977B2    call        TCMReport.GetMarginTop
 000977B7    fstp        qword ptr [esp+10]
 000977BB    wait
 000977BC    mov         eax,esi
 000977BE    call        TCMReport.GetMarginBottom
 000977C3    fstp        qword ptr [esp+18]
 000977C7    wait
 000977C8    call        Printer
 000977CD    mov         edx,ebx
 000977CF    call        TPrinter.SetOrientation
 000977D4    push        dword ptr [esp+4]
 000977D8    push        dword ptr [esp+4]
 000977DC    mov         eax,esi
 000977DE    call        TCMReport.SetMarginLeft
 000977E3    push        dword ptr [esp+0C]
 000977E7    push        dword ptr [esp+0C]
 000977EB    mov         eax,esi
 000977ED    call        TCMReport.SetMarginRight
 000977F2    push        dword ptr [esp+14]
 000977F6    push        dword ptr [esp+14]
 000977FA    mov         eax,esi
 000977FC    call        TCMReport.SetMarginTop
 00097801    push        dword ptr [esp+1C]
 00097805    push        dword ptr [esp+1C]
 00097809    mov         eax,esi
 0009780B    call        TCMReport.SetMarginBottom
 00097810    mov         dl,byte ptr [esi+69];TCMReport.LineSpacing:TLineSpacing
 00097813    mov         eax,esi
 00097815    call        TCMReport.SetLineSpacing
 0009781A    add         esp,20
 0009781D    pop         esi
 0009781E    pop         ebx
 0009781F    ret
*}
end;

//00097820
procedure TCMReport.SetLayout(Value:TLayoutOptions);
begin
{*
 00097820    push        ebx
 00097821    push        ecx
 00097822    mov         byte ptr [esp],dl
 00097825    mov         ebx,eax
 00097827    mov         al,byte ptr [esp]
 0009782A    cmp         al,byte ptr [ebx+45];TCMReport.Layout:TLayoutOptions
>0009782D    je          00097835
 0009782F    mov         al,byte ptr [esp]
 00097832    mov         byte ptr [ebx+45],al;TCMReport.Layout:TLayoutOptions
 00097835    pop         edx
 00097836    pop         ebx
 00097837    ret
*}
end;

//00097838
{*function sub_00097838(?:?):?;
begin
 00097838    push        ebx
 00097839    mov         ebx,eax
 0009783B    mov         eax,ebx
 0009783D    call        000959D4
 00097842    add         eax,dword ptr [ebx+70]
 00097845    sub         eax,dword ptr [ebx+0B0]
 0009784B    cdq
 0009784C    idiv        eax,dword ptr [ebx+6C]
 0009784F    pop         ebx
 00097850    ret
end;*}

//00097854
{*function sub_00097854(?:?; ?:?):Boolean;
begin
 00097854    push        ebx
 00097855    push        esi
 00097856    mov         esi,edx
 00097858    mov         ebx,eax
 0009785A    mov         eax,ebx
 0009785C    call        000959D4
 00097861    add         eax,dword ptr [ebx+70]
 00097864    imul        esi,dword ptr [ebx+6C]
 00097868    add         esi,dword ptr [ebx+0B0]
 0009786E    cmp         eax,esi
 00097870    setg        al
 00097873    pop         esi
 00097874    pop         ebx
 00097875    ret
end;*}

//00097878
procedure TFormPreview.FormCreate(Sender:TObject);
begin
{*
 00097878    push        ebx
 00097879    push        esi
 0009787A    mov         ebx,eax
 0009787C    mov         esi,dword ptr ds:[0B5950];^HInstance:Longword
 00097882    xor         eax,eax
 00097884    mov         dword ptr [ebx+2F8],eax;TFormPreview.?f2F8:dword
 0009788A    push        979E8;'FIRST'
 0009788F    mov         eax,dword ptr [esi]
 00097891    push        eax
 00097892    call        user32.LoadBitmapA
 00097897    mov         edx,eax
 00097899    mov         eax,dword ptr [ebx+2D4];TFormPreview.CMBtnFirst:TCMBtn
 0009789F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000978A5    call        TBitmap.SetHandle
 000978AA    push        979F0;'PREVIOUS'
 000978AF    mov         eax,dword ptr [esi]
 000978B1    push        eax
 000978B2    call        user32.LoadBitmapA
 000978B7    mov         edx,eax
 000978B9    mov         eax,dword ptr [ebx+2D8];TFormPreview.CMBtnPrevious:TCMBtn
 000978BF    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000978C5    call        TBitmap.SetHandle
 000978CA    push        979FC;'NEXT'
 000978CF    mov         eax,dword ptr [esi]
 000978D1    push        eax
 000978D2    call        user32.LoadBitmapA
 000978D7    mov         edx,eax
 000978D9    mov         eax,dword ptr [ebx+2DC];TFormPreview.CMBtnNext:TCMBtn
 000978DF    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000978E5    call        TBitmap.SetHandle
 000978EA    push        97A04;'LAST'
 000978EF    mov         eax,dword ptr [esi]
 000978F1    push        eax
 000978F2    call        user32.LoadBitmapA
 000978F7    mov         edx,eax
 000978F9    mov         eax,dword ptr [ebx+2E0];TFormPreview.CMBtnLast:TCMBtn
 000978FF    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 00097905    call        TBitmap.SetHandle
 0009790A    push        97A0C;'FIND'
 0009790F    mov         eax,dword ptr [esi]
 00097911    push        eax
 00097912    call        user32.LoadBitmapA
 00097917    mov         edx,eax
 00097919    mov         eax,dword ptr [ebx+2E4];TFormPreview.CMBtnZoom:TCMBtn
 0009791F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 00097925    call        TBitmap.SetHandle
 0009792A    push        97A14;'PRINT1'
 0009792F    mov         eax,dword ptr [esi]
 00097931    push        eax
 00097932    call        user32.LoadBitmapA
 00097937    mov         edx,eax
 00097939    mov         eax,dword ptr [ebx+2E8];TFormPreview.CMBtnPrint1:TCMBtn
 0009793F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 00097945    call        TBitmap.SetHandle
 0009794A    push        97A1C;'PRINT'
 0009794F    mov         eax,dword ptr [esi]
 00097951    push        eax
 00097952    call        user32.LoadBitmapA
 00097957    mov         edx,eax
 00097959    mov         eax,dword ptr [ebx+2EC];TFormPreview.CMBtnPrintAll:TCMBtn
 0009795F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 00097965    call        TBitmap.SetHandle
 0009796A    push        97A24;'EXIT'
 0009796F    mov         eax,dword ptr [esi]
 00097971    push        eax
 00097972    call        user32.LoadBitmapA
 00097977    mov         edx,eax
 00097979    mov         eax,dword ptr [ebx+2F0];TFormPreview.CMBtnExit:TCMBtn
 0009797F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 00097985    call        TBitmap.SetHandle
 0009798A    push        97A2C;'HELP2'
 0009798F    mov         eax,dword ptr [esi]
 00097991    push        eax
 00097992    call        user32.LoadBitmapA
 00097997    mov         edx,eax
 00097999    mov         eax,dword ptr [ebx+2F4];TFormPreview.CMBtnHelp:TCMBtn
 0009799F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000979A5    call        TBitmap.SetHandle
 000979AA    mov         dl,2
 000979AC    mov         eax,ebx
 000979AE    call        TCustomForm.SetWindowState
 000979B3    push        97A34;'ZOOM'
 000979B8    mov         eax,dword ptr [esi]
 000979BA    push        eax
 000979BB    call        user32.LoadCursorA
 000979C0    mov         ecx,eax
 000979C2    mov         eax,[000B5BDC];^Screen:TScreen
 000979C7    mov         eax,dword ptr [eax]
 000979C9    mov         edx,0C
 000979CE    call        TScreen.SetCursors
 000979D3    mov         dx,0C
 000979D7    mov         eax,dword ptr [ebx+2CC];TFormPreview.PaintBox1:TPaintBox
 000979DD    call        TControl.SetCursor
 000979E2    pop         esi
 000979E3    pop         ebx
 000979E4    ret
*}
end;

//00097A3C
procedure TFormPreview.PaintBox1Paint(Sender:TObject);
begin
{*
 00097A3C    mov         edx,dword ptr [eax+2F8];TFormPreview.?f2F8:dword
 00097A42    test        edx,edx
>00097A44    je          00097A52
 00097A46    mov         eax,dword ptr [eax+2FC];TFormPreview.?f2FC:dword
 00097A4C    xchg        eax,edx
 00097A4D    call        00095E00
 00097A52    ret
*}
end;

//00097A54
procedure TFormPreview.FormKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 00097A54    push        ebp
 00097A55    mov         ebp,esp
 00097A57    push        ecx
 00097A58    push        ebx
 00097A59    push        esi
 00097A5A    push        edi
 00097A5B    mov         esi,ecx
 00097A5D    mov         dword ptr [ebp-4],edx
 00097A60    cmp         word ptr [esi],1B
>00097A64    jne         00097A70
 00097A66    call        TCustomForm.Close
>00097A6B    jmp         00097B52
 00097A70    mov         ebx,dword ptr [eax+2C8];TFormPreview.ScrollBox1:TScrollBox
 00097A76    mov         edx,dword ptr [ebx+1F0];TScrollBox.VertScrollBar:TControlScrollBar
 00097A7C    cmp         byte ptr [edx+1C],0;TControlScrollBar.Visible:Boolean
>00097A80    je          00097ACE
 00097A82    cmp         word ptr [esi],28
>00097A86    jne         00097A99
 00097A88    mov         eax,dword ptr [edx+0C];TControlScrollBar.Position:Integer
 00097A8B    movzx       ecx,word ptr [edx+8];TControlScrollBar.Increment:TScrollBarInc
 00097A8F    add         eax,ecx
 00097A91    xchg        eax,edx
 00097A92    call        TControlScrollBar.SetPosition
>00097A97    jmp         00097ACE
 00097A99    cmp         word ptr [esi],26
>00097A9D    jne         00097AB0
 00097A9F    mov         eax,dword ptr [edx+0C];TControlScrollBar.Position:Integer
 00097AA2    movzx       ecx,word ptr [edx+8];TControlScrollBar.Increment:TScrollBarInc
 00097AA6    sub         eax,ecx
 00097AA8    xchg        eax,edx
 00097AA9    call        TControlScrollBar.SetPosition
>00097AAE    jmp         00097ACE
 00097AB0    cmp         word ptr [esi],22
>00097AB4    jne         00097AC0
 00097AB6    mov         edx,dword ptr [ebp-4]
 00097AB9    call        TFormPreview.CMBtnNextClick
>00097ABE    jmp         00097ACE
 00097AC0    cmp         word ptr [esi],21
>00097AC4    jne         00097ACE
 00097AC6    mov         edx,dword ptr [ebp-4]
 00097AC9    call        TFormPreview.CMBtnPreviousClick
 00097ACE    mov         eax,dword ptr [ebx+1EC];TScrollBox.HorzScrollBar:TControlScrollBar
 00097AD4    cmp         byte ptr [eax+1C],0;TControlScrollBar.Visible:Boolean
>00097AD8    je          00097B52
 00097ADA    mov         edi,eax
 00097ADC    cmp         word ptr [esi],27
>00097AE0    jne         00097AF4
 00097AE2    mov         edx,dword ptr [edi+0C];TControlScrollBar.Position:Integer
 00097AE5    movzx       eax,word ptr [edi+8];TControlScrollBar.Increment:TScrollBarInc
 00097AE9    add         edx,eax
 00097AEB    mov         eax,edi
 00097AED    call        TControlScrollBar.SetPosition
>00097AF2    jmp         00097B52
 00097AF4    cmp         word ptr [esi],25
>00097AF8    jne         00097B0C
 00097AFA    mov         edx,dword ptr [edi+0C];TControlScrollBar.Position:Integer
 00097AFD    movzx       eax,word ptr [edi+8];TControlScrollBar.Increment:TScrollBarInc
 00097B01    sub         edx,eax
 00097B03    mov         eax,edi
 00097B05    call        TControlScrollBar.SetPosition
>00097B0A    jmp         00097B52
 00097B0C    cmp         word ptr [esi],24
>00097B10    jne         00097B30
 00097B12    fild        dword ptr [ebx+38];TScrollBox.Width:Integer
 00097B15    fld         tbyte ptr ds:[97B5C];0,95:Extended
 00097B1B    fmulp       st(1),st
 00097B1D    call        @TRUNC
 00097B22    mov         edx,dword ptr [edi+0C];TControlScrollBar.Position:Integer
 00097B25    sub         edx,eax
 00097B27    mov         eax,edi
 00097B29    call        TControlScrollBar.SetPosition
>00097B2E    jmp         00097B52
 00097B30    cmp         word ptr [esi],23
>00097B34    jne         00097B52
 00097B36    fild        dword ptr [ebx+38];TScrollBox.Width:Integer
 00097B39    fld         tbyte ptr ds:[97B5C];0,95:Extended
 00097B3F    fmulp       st(1),st
 00097B41    call        @TRUNC
 00097B46    mov         edx,eax
 00097B48    add         edx,dword ptr [edi+0C];TControlScrollBar.Position:Integer
 00097B4B    mov         eax,edi
 00097B4D    call        TControlScrollBar.SetPosition
 00097B52    pop         edi
 00097B53    pop         esi
 00097B54    pop         ebx
 00097B55    pop         ecx
 00097B56    pop         ebp
 00097B57    ret         4
*}
end;

//00097B68
procedure TFormPreview.CMBtnFirstClick;
begin
{*
 00097B68    mov         edx,1
 00097B6D    mov         eax,dword ptr [eax+2F8];TFormPreview.?f2F8:dword
 00097B73    call        00095E00
 00097B78    ret
*}
end;

//00097B7C
procedure TFormPreview.CMBtnPreviousClick;
begin
{*
 00097B7C    mov         edx,dword ptr [eax+2FC];TFormPreview.?f2FC:dword
 00097B82    dec         edx
 00097B83    mov         eax,dword ptr [eax+2F8];TFormPreview.?f2F8:dword
 00097B89    call        00095E00
 00097B8E    ret
*}
end;

//00097B90
procedure TFormPreview.CMBtnNextClick;
begin
{*
 00097B90    mov         edx,dword ptr [eax+2FC];TFormPreview.?f2FC:dword
 00097B96    inc         edx
 00097B97    mov         eax,dword ptr [eax+2F8];TFormPreview.?f2F8:dword
 00097B9D    call        00095E00
 00097BA2    ret
*}
end;

//00097BA4
procedure TFormPreview.CMBtnLastClick;
begin
{*
 00097BA4    mov         edx,dword ptr [eax+2F8];TFormPreview.?f2F8:dword
 00097BAA    mov         ecx,dword ptr [edx+4C]
 00097BAD    mov         eax,edx
 00097BAF    mov         edx,ecx
 00097BB1    call        00095E00
 00097BB6    ret
*}
end;

//00097BB8
procedure TFormPreview.CMBtnZoomClick;
begin
{*
 00097BB8    mov         edx,dword ptr [eax+300];TFormPreview.?f300:dword
 00097BBE    cmp         edx,2
>00097BC1    jne         00097BCD
 00097BC3    xor         edx,edx
 00097BC5    mov         dword ptr [eax+300],edx;TFormPreview.?f300:dword
>00097BCB    jmp         00097BE8
 00097BCD    test        edx,edx
>00097BCF    jne         00097BDD
 00097BD1    mov         dword ptr [eax+300],1;TFormPreview.?f300:dword
>00097BDB    jmp         00097BE8
 00097BDD    dec         edx
>00097BDE    jne         00097BE8
 00097BE0    xor         edx,edx
 00097BE2    mov         dword ptr [eax+300],edx;TFormPreview.?f300:dword
 00097BE8    mov         eax,dword ptr [eax+2CC];TFormPreview.PaintBox1:TPaintBox
 00097BEE    mov         edx,dword ptr [eax]
 00097BF0    call        dword ptr [edx+7C];TControl.Repaint
 00097BF3    ret
*}
end;

//00097BF4
procedure TFormPreview.CMBtnPrint1Click;
begin
{*
 00097BF4    push        ebp
 00097BF5    mov         ebp,esp
 00097BF7    push        0
 00097BF9    push        ebx
 00097BFA    mov         ebx,eax
 00097BFC    xor         eax,eax
 00097BFE    push        ebp
 00097BFF    push        97C84
 00097C04    push        dword ptr fs:[eax]
 00097C07    mov         dword ptr fs:[eax],esp
 00097C0A    call        Printer
 00097C0F    call        TPrinter.BeginDoc
 00097C14    call        Printer
 00097C19    add         eax,18;TPrinter.FTitle:String
 00097C1C    push        eax
 00097C1D    lea         edx,[ebp-4]
 00097C20    mov         eax,dword ptr [ebx+2F8];TFormPreview.?f2F8:dword
 00097C26    call        TCMReport.GetTitle
 00097C2B    mov         edx,dword ptr [ebp-4]
 00097C2E    pop         eax
 00097C2F    call        @LStrAsg
 00097C34    xor         ecx,ecx
 00097C36    mov         edx,dword ptr [ebx+2FC];TFormPreview.?f2FC:dword
 00097C3C    mov         eax,dword ptr [ebx+2F8];TFormPreview.?f2F8:dword
 00097C42    call        00095CF8
 00097C47    call        Printer
 00097C4C    call        TPrinter.EndDoc
 00097C51    mov         eax,dword ptr [ebx+2D0];TFormPreview.StatusBar1:TStatusBar
 00097C57    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 00097C5D    mov         edx,1
 00097C62    call        TCoolBands.GetItem
 00097C67    xor         edx,edx
 00097C69    call        TStatusPanel.SetText
 00097C6E    xor         eax,eax
 00097C70    pop         edx
 00097C71    pop         ecx
 00097C72    pop         ecx
 00097C73    mov         dword ptr fs:[eax],edx
 00097C76    push        97C8B
 00097C7B    lea         eax,[ebp-4]
 00097C7E    call        @LStrClr
 00097C83    ret
>00097C84    jmp         @HandleFinally
>00097C89    jmp         00097C7B
 00097C8B    pop         ebx
 00097C8C    pop         ecx
 00097C8D    pop         ebp
 00097C8E    ret
*}
end;

//00097C90
procedure TFormPreview.CMBtnPrintAllClick;
begin
{*
 00097C90    push        ebp
 00097C91    mov         ebp,esp
 00097C93    add         esp,0FFFFFFF0
 00097C96    push        ebx
 00097C97    push        esi
 00097C98    push        edi
 00097C99    xor         ecx,ecx
 00097C9B    mov         dword ptr [ebp-8],ecx
 00097C9E    mov         esi,eax
 00097CA0    xor         eax,eax
 00097CA2    push        ebp
 00097CA3    push        97DDB
 00097CA8    push        dword ptr fs:[eax]
 00097CAB    mov         dword ptr fs:[eax],esp
 00097CAE    push        97DF4;'Printing...'
 00097CB3    push        97E08;'Page: 1'
 00097CB8    push        1
 00097CBA    push        1
 00097CBC    mov         ecx,esi
 00097CBE    mov         dl,1
 00097CC0    mov         eax,[0008C62C];TProgressBox
 00097CC5    call        TProgressBox.Create;TProgressBox.Create
 00097CCA    mov         dword ptr [ebp-4],eax
 00097CCD    xor         edx,edx
 00097CCF    push        ebp
 00097CD0    push        97DBE
 00097CD5    push        dword ptr fs:[edx]
 00097CD8    mov         dword ptr fs:[edx],esp
 00097CDB    mov         eax,dword ptr [ebp-4]
 00097CDE    call        TCustomForm.Show
 00097CE3    call        Printer
 00097CE8    call        TPrinter.BeginDoc
 00097CED    call        Printer
 00097CF2    add         eax,18;TPrinter.FTitle:String
 00097CF5    push        eax
 00097CF6    lea         edx,[ebp-8]
 00097CF9    mov         eax,dword ptr [esi+2F8];TFormPreview.?f2F8:dword
 00097CFF    call        TCMReport.GetTitle
 00097D04    mov         edx,dword ptr [ebp-8]
 00097D07    pop         eax
 00097D08    call        @LStrAsg
 00097D0D    mov         eax,dword ptr [esi+2F8];TFormPreview.?f2F8:dword
 00097D13    mov         edi,dword ptr [eax+4C]
 00097D16    test        edi,edi
>00097D18    jle         00097D81
 00097D1A    mov         ebx,1
 00097D1F    push        1
 00097D21    mov         eax,dword ptr [esi+2F8];TFormPreview.?f2F8:dword
 00097D27    mov         ecx,dword ptr [eax+4C]
 00097D2A    mov         edx,ebx
 00097D2C    mov         eax,dword ptr [ebp-4]
 00097D2F    call        0008E1A4
 00097D34    lea         eax,[ebp-8]
 00097D37    push        eax
 00097D38    mov         dword ptr [ebp-10],ebx
 00097D3B    mov         byte ptr [ebp-0C],0
 00097D3F    lea         edx,[ebp-10]
 00097D42    xor         ecx,ecx
 00097D44    mov         eax,97E18;'Page: %d'
 00097D49    call        Format
 00097D4E    mov         edx,dword ptr [ebp-8]
 00097D51    mov         ecx,1
 00097D56    mov         eax,dword ptr [ebp-4]
 00097D59    call        0008E154
 00097D5E    mov         eax,dword ptr [ebp-4]
 00097D61    cmp         byte ptr [eax+2DC],0;TProgressBox.?f2DC:byte
>00097D68    jne         00097D81
 00097D6A    mov         eax,dword ptr [esi+2F8];TFormPreview.?f2F8:dword
 00097D70    cmp         ebx,dword ptr [eax+4C]
 00097D73    setl        cl
 00097D76    mov         edx,ebx
 00097D78    call        00095CF8
 00097D7D    inc         ebx
 00097D7E    dec         edi
>00097D7F    jne         00097D1F
 00097D81    call        Printer
 00097D86    call        TPrinter.EndDoc
 00097D8B    mov         eax,dword ptr [esi+2D0];TFormPreview.StatusBar1:TStatusBar
 00097D91    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 00097D97    mov         edx,1
 00097D9C    call        TCoolBands.GetItem
 00097DA1    xor         edx,edx
 00097DA3    call        TStatusPanel.SetText
 00097DA8    xor         eax,eax
 00097DAA    pop         edx
 00097DAB    pop         ecx
 00097DAC    pop         ecx
 00097DAD    mov         dword ptr fs:[eax],edx
 00097DB0    push        97DC5
 00097DB5    mov         eax,dword ptr [ebp-4]
 00097DB8    call        TObject.Free
 00097DBD    ret
>00097DBE    jmp         @HandleFinally
>00097DC3    jmp         00097DB5
 00097DC5    xor         eax,eax
 00097DC7    pop         edx
 00097DC8    pop         ecx
 00097DC9    pop         ecx
 00097DCA    mov         dword ptr fs:[eax],edx
 00097DCD    push        97DE2
 00097DD2    lea         eax,[ebp-8]
 00097DD5    call        @LStrClr
 00097DDA    ret
>00097DDB    jmp         @HandleFinally
>00097DE0    jmp         00097DD2
 00097DE2    pop         edi
 00097DE3    pop         esi
 00097DE4    pop         ebx
 00097DE5    mov         esp,ebp
 00097DE7    pop         ebp
 00097DE8    ret
*}
end;

//00097E24
{*procedure sub_00097E24(?:?);
begin
 00097E24    push        ebp
 00097E25    mov         ebp,esp
 00097E27    push        ecx
 00097E28    push        ebx
 00097E29    mov         eax,dword ptr [ebp+8]
 00097E2C    mov         eax,dword ptr [eax-4]
 00097E2F    mov         eax,dword ptr [eax+2C8]
 00097E35    mov         ebx,dword ptr [eax+1EC]
 00097E3B    mov         eax,ebx
 00097E3D    call        TControlScrollBar.GetScrollPos
 00097E42    mov         dword ptr [ebp-4],eax
 00097E45    fild        dword ptr [ebp-4]
 00097E48    fild        dword ptr [ebx+10]
 00097E4B    fdivp       st(1),st
 00097E4D    mov         eax,dword ptr [ebp+8]
 00097E50    fild        dword ptr [eax+0C]
 00097E53    faddp       st(1),st
 00097E55    mov         eax,dword ptr [ebp+8]
 00097E58    mov         eax,dword ptr [eax-4]
 00097E5B    fdiv        qword ptr [eax+304]
 00097E61    call        @TRUNC
 00097E66    mov         edx,dword ptr [ebp+8]
 00097E69    mov         dword ptr [edx-8],eax
 00097E6C    mov         eax,dword ptr [ebp+8]
 00097E6F    mov         eax,dword ptr [eax-4]
 00097E72    mov         eax,dword ptr [eax+2C8]
 00097E78    mov         ebx,dword ptr [eax+1F0]
 00097E7E    mov         eax,ebx
 00097E80    call        TControlScrollBar.GetScrollPos
 00097E85    mov         dword ptr [ebp-4],eax
 00097E88    fild        dword ptr [ebp-4]
 00097E8B    fild        dword ptr [ebx+10]
 00097E8E    fdivp       st(1),st
 00097E90    mov         eax,dword ptr [ebp+8]
 00097E93    fild        dword ptr [eax+8]
 00097E96    faddp       st(1),st
 00097E98    mov         eax,dword ptr [ebp+8]
 00097E9B    mov         eax,dword ptr [eax-4]
 00097E9E    fdiv        qword ptr [eax+304]
 00097EA4    call        @TRUNC
 00097EA9    mov         edx,dword ptr [ebp+8]
 00097EAC    mov         dword ptr [edx-0C],eax
 00097EAF    pop         ebx
 00097EB0    pop         ecx
 00097EB1    pop         ebp
 00097EB2    ret
end;*}

//00097EB4
{*procedure sub_00097EB4(?:?);
begin
 00097EB4    push        ebp
 00097EB5    mov         ebp,esp
 00097EB7    push        ebx
 00097EB8    push        esi
 00097EB9    push        edi
 00097EBA    mov         edi,dword ptr [ebp+8]
 00097EBD    add         edi,0FFFFFFFC
 00097EC0    mov         eax,dword ptr [edi]
 00097EC2    mov         eax,dword ptr [eax+2CC]
 00097EC8    mov         edx,dword ptr [eax]
 00097ECA    call        dword ptr [edx+7C]
 00097ECD    mov         eax,dword ptr [edi]
 00097ECF    mov         esi,dword ptr [eax+2C8]
 00097ED5    mov         ebx,dword ptr [esi+1EC]
 00097EDB    mov         eax,dword ptr [ebp+8]
 00097EDE    fild        dword ptr [eax-8]
 00097EE1    mov         eax,dword ptr [edi]
 00097EE3    fmul        qword ptr [eax+304]
 00097EE9    fild        dword ptr [esi+38]
 00097EEC    fdiv        dword ptr ds:[97F60];2:Single
 00097EF2    fsubp       st(1),st
 00097EF4    fild        dword ptr [ebx+10]
 00097EF7    fmulp       st(1),st
 00097EF9    mov         eax,dword ptr [edi]
 00097EFB    mov         eax,dword ptr [eax+2CC]
 00097F01    fild        dword ptr [eax+38]
 00097F04    fdivp       st(1),st
 00097F06    call        @TRUNC
 00097F0B    mov         edx,eax
 00097F0D    mov         eax,ebx
 00097F0F    call        TControlScrollBar.SetPosition
 00097F14    mov         eax,dword ptr [edi]
 00097F16    mov         esi,dword ptr [eax+2C8]
 00097F1C    mov         ebx,dword ptr [esi+1F0]
 00097F22    mov         eax,dword ptr [ebp+8]
 00097F25    fild        dword ptr [eax-0C]
 00097F28    mov         eax,dword ptr [edi]
 00097F2A    fmul        qword ptr [eax+304]
 00097F30    fild        dword ptr [esi+3C]
 00097F33    fdiv        dword ptr ds:[97F60];2:Single
 00097F39    fsubp       st(1),st
 00097F3B    fild        dword ptr [ebx+10]
 00097F3E    fmulp       st(1),st
 00097F40    mov         eax,dword ptr [edi]
 00097F42    mov         eax,dword ptr [eax+2CC]
 00097F48    fild        dword ptr [eax+3C]
 00097F4B    fdivp       st(1),st
 00097F4D    call        @TRUNC
 00097F52    mov         edx,eax
 00097F54    mov         eax,ebx
 00097F56    call        TControlScrollBar.SetPosition
 00097F5B    pop         edi
 00097F5C    pop         esi
 00097F5D    pop         ebx
 00097F5E    pop         ebp
 00097F5F    ret
end;*}

//00097F64
procedure TFormPreview.PaintBox1MouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00097F64    push        ebp
 00097F65    mov         ebp,esp
 00097F67    add         esp,0FFFFFFF4
 00097F6A    mov         dword ptr [ebp-4],eax
 00097F6D    mov         eax,dword ptr [ebp-4]
 00097F70    mov         dword ptr [eax+300],2;TFormPreview.?f300:dword
 00097F7A    test        cl,cl
>00097F7C    jne         00097FBB
 00097F7E    mov         eax,dword ptr [ebp-4]
 00097F81    fld         qword ptr [eax+304];TFormPreview.?f304:Double
 00097F87    fcomp       dword ptr ds:[98004];1,5:Single
 00097F8D    fnstsw      al
 00097F8F    sahf
>00097F90    jae         00097FBB
 00097F92    push        ebp
 00097F93    call        00097E24
 00097F98    pop         ecx
 00097F99    fld         dword ptr ds:[98004];1,5:Single
 00097F9F    mov         eax,dword ptr [ebp-4]
 00097FA2    fmul        qword ptr [eax+304];TFormPreview.?f304:Double
 00097FA8    mov         eax,dword ptr [ebp-4]
 00097FAB    fstp        qword ptr [eax+304];TFormPreview.?f304:Double
 00097FB1    wait
 00097FB2    push        ebp
 00097FB3    call        00097EB4
 00097FB8    pop         ecx
>00097FB9    jmp         00097FFB
 00097FBB    cmp         cl,1
>00097FBE    jne         00097FFB
 00097FC0    fld         tbyte ptr ds:[98008];0,03:Extended
 00097FC6    mov         eax,dword ptr [ebp-4]
 00097FC9    fcomp       qword ptr [eax+304];TFormPreview.?f304:Double
 00097FCF    fnstsw      al
 00097FD1    sahf
>00097FD2    jae         00097FFB
 00097FD4    push        ebp
 00097FD5    call        00097E24
 00097FDA    pop         ecx
 00097FDB    mov         eax,dword ptr [ebp-4]
 00097FDE    fld         qword ptr [eax+304];TFormPreview.?f304:Double
 00097FE4    fdiv        dword ptr ds:[98004];1,5:Single
 00097FEA    mov         eax,dword ptr [ebp-4]
 00097FED    fstp        qword ptr [eax+304];TFormPreview.?f304:Double
 00097FF3    wait
 00097FF4    push        ebp
 00097FF5    call        00097EB4
 00097FFA    pop         ecx
 00097FFB    mov         esp,ebp
 00097FFD    pop         ebp
 00097FFE    ret         0C
*}
end;

//00098014
procedure TFormPreview.CMBtnExitClick;
begin
{*
 00098014    call        TCustomForm.Close
 00098019    ret
*}
end;

//0009801C
procedure TFormPreview.CMBtnHelpClick;
begin
{*
 0009801C    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 00098022    mov         edx,dword ptr [edx]
 00098024    mov         eax,dword ptr [eax+144];TFormPreview.HelpContext:THelpContext
 0009802A    xchg        eax,edx
 0009802B    call        TApplication.HelpContext
 00098030    ret
*}
end;

Initialization
//00098070
{*
 00098070    sub         dword ptr ds:[0B6B60],1
>00098077    jae         00098083
 00098079    mov         eax,[00094210];TCMReport
 0009807E    call        RegisterClass
 00098083    ret
*}
Finalization
//00098034
{*
 00098034    push        ebp
 00098035    mov         ebp,esp
 00098037    xor         eax,eax
 00098039    push        ebp
 0009803A    push        98065
 0009803F    push        dword ptr fs:[eax]
 00098042    mov         dword ptr fs:[eax],esp
 00098045    inc         dword ptr ds:[0B6B60]
>0009804B    jne         00098057
 0009804D    mov         eax,[00094210];TCMReport
 00098052    call        UnRegisterClass
 00098057    xor         eax,eax
 00098059    pop         edx
 0009805A    pop         ecx
 0009805B    pop         ecx
 0009805C    mov         dword ptr fs:[eax],edx
 0009805F    push        9806C
 00098064    ret
>00098065    jmp         @HandleFinally
>0009806A    jmp         00098064
 0009806C    pop         ebp
 0009806D    ret
*}
end.