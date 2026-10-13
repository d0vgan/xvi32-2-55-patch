//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMIni;

interface

uses
  SysUtils, Classes;

type
  TSectionList = class(TStringList)
  public
    ..:dword;//f2C
    //function IndexOf(const S:AnsiString):?; virtual;//v50//0007CFB0
    constructor Create;//0007CDD4
  end;
  TCMIniFile = class(TObject)
  public
    f4:String;//f4
    f8:byte;//f8
    fC:dword;//fC
    f10:dword;//f10
    f14:byte;//f14
    f15:byte;//f15
    f16:byte;//f16
    f17:byte;//f17
    f18:byte;//f18
    destructor Destroy; virtual;//0007D170
    //procedure v0(?:?; ?:?); virtual;//v0//0007D1AC
    //procedure v4(?:?; ?:?; ?:?; ?:?); virtual;//v4//0007D708
    //procedure v8(?:?; ?:?; ?:?); virtual;//v8//0007D74C
    //function vC(?:?; ?:?; ?:?):?; virtual;//vC//0007D830
    //procedure v10(?:?; ?:?; ?:?); virtual;//v10//0007D900
    //function v14(?:?; ?:?; ?:?):Boolean; virtual;//v14//0007D95C
    //procedure v18(?:?; ?:?; ?:?); virtual;//v18//0007D988
    //procedure v1C(?:?; ?:?); virtual;//v1C//0007D9EC
    //procedure v20(?:?); virtual;//v20//0007DA78
    //procedure v24(?:?; ?:?); virtual;//v24//0007DA88
    procedure v28; virtual;//v28//0007DD50
    procedure v2C; virtual;//v2C//0007DDA0
    //procedure v30(?:?); virtual;//v30//0007DAB8
    procedure v34; virtual;//v34//0007DB98
    //procedure v38(?:?); virtual;//v38//0007D2B8
    constructor Create;//0007D08C
  end;
    //procedure sub_0007CD00(?:?; ?:?);//0007CD00
    //procedure sub_0007CD88(?:?; ?:?);//0007CD88
    //function sub_0007CE10(?:dword; ?:TObject):?;//0007CE10
    //procedure sub_0007CE24(?:?; ?:?);//0007CE24
    //function sub_0007CE30(?:dword):?;//0007CE30
    //function IndexOf(const S:AnsiString):?;//0007CFB0
    destructor Destroy;//0007D170
    //procedure sub_0007D1AC(?:?; ?:?);//0007D1AC
    //procedure sub_0007D27C(?:?);//0007D27C
    //procedure sub_0007D2B8(?:?);//0007D2B8
    //procedure sub_0007D5A8(?:?; ?:?);//0007D5A8
    //function sub_0007D5DC(?:TCMIniFile; ?:?; ?:?; ?:?; ?:?):?;//0007D5DC
    //procedure sub_0007D708(?:?; ?:?; ?:?; ?:?);//0007D708
    //procedure sub_0007D74C(?:?; ?:?; ?:?);//0007D74C
    //function sub_0007D830(?:?; ?:?; ?:?):?;//0007D830
    //procedure sub_0007D900(?:?; ?:?; ?:?);//0007D900
    //function sub_0007D95C(?:?; ?:?; ?:?):Boolean;//0007D95C
    //procedure sub_0007D988(?:?; ?:?; ?:?);//0007D988
    //procedure sub_0007D9EC(?:?; ?:?);//0007D9EC
    //procedure sub_0007DA78(?:?);//0007DA78
    //procedure sub_0007DA88(?:?; ?:?);//0007DA88
    //procedure sub_0007DAB8(?:?);//0007DAB8
    procedure sub_0007DB98;//0007DB98
    procedure sub_0007DD50;//0007DD50
    procedure sub_0007DDA0;//0007DDA0

implementation

//0007CD00
{*procedure sub_0007CD00(?:?; ?:?);
begin
 0007CD00    push        ebp
 0007CD01    mov         ebp,esp
 0007CD03    push        ecx
 0007CD04    push        ebx
 0007CD05    push        esi
 0007CD06    mov         esi,edx
 0007CD08    mov         dword ptr [ebp-4],eax
 0007CD0B    mov         eax,dword ptr [ebp-4]
 0007CD0E    call        @LStrAddRef
 0007CD13    xor         eax,eax
 0007CD15    push        ebp
 0007CD16    push        7CD6E
 0007CD1B    push        dword ptr fs:[eax]
 0007CD1E    mov         dword ptr fs:[eax],esp
 0007CD21    mov         edx,dword ptr [ebp-4]
 0007CD24    mov         eax,7CD84;'='
 0007CD29    call        @LStrPos
 0007CD2E    mov         ebx,eax
 0007CD30    test        ebx,ebx
>0007CD32    jne         0007CD40
 0007CD34    mov         eax,esi
 0007CD36    mov         edx,dword ptr [ebp-4]
 0007CD39    call        @LStrLAsg
>0007CD3E    jmp         0007CD58
 0007CD40    push        esi
 0007CD41    mov         eax,dword ptr [ebp-4]
 0007CD44    call        @LStrLen
 0007CD49    mov         ecx,eax
 0007CD4B    sub         ecx,ebx
 0007CD4D    lea         edx,[ebx+1]
 0007CD50    mov         eax,dword ptr [ebp-4]
 0007CD53    call        @LStrCopy
 0007CD58    xor         eax,eax
 0007CD5A    pop         edx
 0007CD5B    pop         ecx
 0007CD5C    pop         ecx
 0007CD5D    mov         dword ptr fs:[eax],edx
 0007CD60    push        7CD75
 0007CD65    lea         eax,[ebp-4]
 0007CD68    call        @LStrClr
 0007CD6D    ret
>0007CD6E    jmp         @HandleFinally
>0007CD73    jmp         0007CD65
 0007CD75    pop         esi
 0007CD76    pop         ebx
 0007CD77    pop         ecx
 0007CD78    pop         ebp
 0007CD79    ret
end;*}

//0007CD88
{*procedure sub_0007CD88(?:?; ?:?);
begin
 0007CD88    push        ebx
 0007CD89    push        esi
 0007CD8A    mov         esi,edx
 0007CD8C    mov         ebx,eax
 0007CD8E    mov         eax,ebx
 0007CD90    call        @LStrLen
 0007CD95    dec         eax
>0007CD96    jle         0007CDC7
 0007CD98    cmp         byte ptr [ebx],22
>0007CD9B    jne         0007CDC7
 0007CD9D    mov         eax,ebx
 0007CD9F    call        @LStrLen
 0007CDA4    cmp         byte ptr [ebx+eax-1],22
>0007CDA9    jne         0007CDC7
 0007CDAB    push        esi
 0007CDAC    mov         eax,ebx
 0007CDAE    call        @LStrLen
 0007CDB3    mov         ecx,eax
 0007CDB5    sub         ecx,2
 0007CDB8    mov         edx,2
 0007CDBD    mov         eax,ebx
 0007CDBF    call        @LStrCopy
 0007CDC4    pop         esi
 0007CDC5    pop         ebx
 0007CDC6    ret
 0007CDC7    mov         eax,esi
 0007CDC9    mov         edx,ebx
 0007CDCB    call        @LStrLAsg
 0007CDD0    pop         esi
 0007CDD1    pop         ebx
 0007CDD2    ret
end;*}

//0007CDD4
constructor TSectionList.Create;
begin
{*
 0007CDD4    push        ebx
 0007CDD5    push        esi
 0007CDD6    test        dl,dl
>0007CDD8    je          0007CDE2
 0007CDDA    add         esp,0FFFFFFF0
 0007CDDD    call        @ClassCreate
 0007CDE2    mov         ebx,edx
 0007CDE4    mov         esi,eax
 0007CDE6    xor         edx,edx
 0007CDE8    mov         eax,esi
 0007CDEA    call        TObject.Create
 0007CDEF    xor         eax,eax
 0007CDF1    mov         dword ptr [esi+2C],eax
 0007CDF4    mov         eax,esi
 0007CDF6    test        bl,bl
>0007CDF8    je          0007CE09
 0007CDFA    call        @AfterConstruction
 0007CDFF    pop         dword ptr fs:[0]
 0007CE06    add         esp,0C
 0007CE09    mov         eax,esi
 0007CE0B    pop         esi
 0007CE0C    pop         ebx
 0007CE0D    ret
*}
end;

//0007CE10
{*function sub_0007CE10(?:dword; ?:TObject):?;
begin
 0007CE10    push        ebx
 0007CE11    push        esi
 0007CE12    mov         esi,edx
 0007CE14    mov         ebx,eax
 0007CE16    mov         edx,esi
 0007CE18    mov         eax,ebx
 0007CE1A    mov         ecx,dword ptr [eax]
 0007CE1C    call        dword ptr [ecx+18]
 0007CE1F    pop         esi
 0007CE20    pop         ebx
 0007CE21    ret
end;*}

//0007CE24
{*procedure sub_0007CE24(?:?; ?:?);
begin
 0007CE24    push        ebx
 0007CE25    mov         ecx,dword ptr [eax]
 0007CE27    mov         ebx,dword ptr [edx]
 0007CE29    mov         dword ptr [eax],ebx
 0007CE2B    mov         dword ptr [edx],ecx
 0007CE2D    pop         ebx
 0007CE2E    ret
end;*}

//0007CE30
{*function sub_0007CE30(?:dword):?;
begin
 0007CE30    push        ebp
 0007CE31    mov         ebp,esp
 0007CE33    add         esp,0FFFFFFE4
 0007CE36    push        ebx
 0007CE37    push        esi
 0007CE38    push        edi
 0007CE39    xor         edx,edx
 0007CE3B    mov         dword ptr [ebp-18],edx
 0007CE3E    mov         dword ptr [ebp-1C],edx
 0007CE41    mov         dword ptr [ebp-4],eax
 0007CE44    xor         eax,eax
 0007CE46    push        ebp
 0007CE47    push        7CF9D
 0007CE4C    push        dword ptr fs:[eax]
 0007CE4F    mov         dword ptr fs:[eax],esp
 0007CE52    mov         byte ptr [ebp-5],0
 0007CE56    mov         eax,dword ptr [ebp-4]
 0007CE59    mov         edx,dword ptr [eax]
 0007CE5B    call        dword ptr [edx+14]
 0007CE5E    dec         eax
>0007CE5F    jle         0007CF82
 0007CE65    mov         dl,1
 0007CE67    mov         eax,[0001F340];TStringList
 0007CE6C    call        TObject.Create;TStringList.Create
 0007CE71    mov         esi,eax
 0007CE73    mov         edx,dword ptr [ebp-4]
 0007CE76    mov         eax,esi
 0007CE78    mov         ecx,dword ptr [eax]
 0007CE7A    call        dword ptr [ecx+8];TStrings.Assign
 0007CE7D    mov         eax,esi
 0007CE7F    mov         edx,dword ptr [eax]
 0007CE81    call        dword ptr [edx+14];TStringList.GetCount
 0007CE84    dec         eax
 0007CE85    test        eax,eax
>0007CE87    jl          0007CEA0
 0007CE89    inc         eax
 0007CE8A    mov         dword ptr [ebp-14],eax
 0007CE8D    xor         ebx,ebx
 0007CE8F    mov         ecx,ebx
 0007CE91    mov         edx,ebx
 0007CE93    mov         eax,esi
 0007CE95    mov         edi,dword ptr [eax]
 0007CE97    call        dword ptr [edi+24];TStringList.PutObject
 0007CE9A    inc         ebx
 0007CE9B    dec         dword ptr [ebp-14]
>0007CE9E    jne         0007CE8F
 0007CEA0    mov         eax,esi
 0007CEA2    mov         edx,dword ptr [eax]
 0007CEA4    call        dword ptr [edx+7C];TStringList.Sort
 0007CEA7    xor         eax,eax
 0007CEA9    mov         dword ptr [ebp-0C],eax
 0007CEAC    mov         eax,esi
 0007CEAE    mov         edx,dword ptr [eax]
 0007CEB0    call        dword ptr [edx+14];TStringList.GetCount
 0007CEB3    dec         eax
 0007CEB4    test        eax,eax
>0007CEB6    jle         0007CF50
 0007CEBC    mov         dword ptr [ebp-14],eax
 0007CEBF    mov         ebx,1
 0007CEC4    lea         ecx,[ebp-18]
 0007CEC7    mov         edx,ebx
 0007CEC9    mov         eax,esi
 0007CECB    mov         edi,dword ptr [eax]
 0007CECD    call        dword ptr [edi+0C];TStringList.Get
 0007CED0    mov         eax,dword ptr [ebp-18]
 0007CED3    push        eax
 0007CED4    lea         ecx,[ebp-1C]
 0007CED7    mov         edx,dword ptr [ebp-0C]
 0007CEDA    mov         eax,esi
 0007CEDC    mov         edi,dword ptr [eax]
 0007CEDE    call        dword ptr [edi+0C];TStringList.Get
 0007CEE1    mov         eax,dword ptr [ebp-1C]
 0007CEE4    pop         edx
 0007CEE5    call        AnsiCompareText
 0007CEEA    test        eax,eax
>0007CEEC    je          0007CEF3
 0007CEEE    mov         dword ptr [ebp-0C],ebx
>0007CEF1    jmp         0007CF46
 0007CEF3    mov         dword ptr [ebp-10],ebx
 0007CEF6    mov         edx,dword ptr [ebp-0C]
 0007CEF9    mov         eax,esi
 0007CEFB    mov         ecx,dword ptr [eax]
 0007CEFD    call        dword ptr [ecx+18];TStringList.GetObject
 0007CF00    mov         edi,eax
 0007CF02    mov         edx,dword ptr [ebp-10]
 0007CF05    mov         eax,esi
 0007CF07    mov         ecx,dword ptr [eax]
 0007CF09    call        dword ptr [ecx+18];TStringList.GetObject
 0007CF0C    cmp         edi,eax
>0007CF0E    jle         0007CF1B
 0007CF10    lea         edx,[ebp-0C]
 0007CF13    lea         eax,[ebp-10]
 0007CF16    call        0007CE24
 0007CF1B    mov         edx,dword ptr [ebp-10]
 0007CF1E    mov         eax,esi
 0007CF20    mov         ecx,dword ptr [eax]
 0007CF22    call        dword ptr [ecx+18];TStringList.GetObject
 0007CF25    mov         edi,eax
 0007CF27    mov         edx,edi
 0007CF29    mov         eax,dword ptr [ebp-4]
 0007CF2C    call        0007CE10
 0007CF31    mov         edx,dword ptr [eax]
 0007CF33    call        dword ptr [edx+40]
 0007CF36    xor         ecx,ecx
 0007CF38    mov         edx,edi
 0007CF3A    mov         eax,dword ptr [ebp-4]
 0007CF3D    mov         edi,dword ptr [eax]
 0007CF3F    call        dword ptr [edi+24]
 0007CF42    mov         byte ptr [ebp-5],1
 0007CF46    inc         ebx
 0007CF47    dec         dword ptr [ebp-14]
>0007CF4A    jne         0007CEC4
 0007CF50    xor         ebx,ebx
>0007CF52    jmp         0007CF6F
 0007CF54    mov         edx,ebx
 0007CF56    mov         eax,dword ptr [ebp-4]
 0007CF59    mov         ecx,dword ptr [eax]
 0007CF5B    call        dword ptr [ecx+18]
 0007CF5E    test        eax,eax
>0007CF60    jne         0007CF6E
 0007CF62    mov         edx,ebx
 0007CF64    mov         eax,dword ptr [ebp-4]
 0007CF67    mov         ecx,dword ptr [eax]
 0007CF69    call        dword ptr [ecx+44]
>0007CF6C    jmp         0007CF6F
 0007CF6E    inc         ebx
 0007CF6F    mov         eax,dword ptr [ebp-4]
 0007CF72    mov         edx,dword ptr [eax]
 0007CF74    call        dword ptr [edx+14]
 0007CF77    cmp         ebx,eax
>0007CF79    jl          0007CF54
 0007CF7B    mov         eax,esi
 0007CF7D    call        TObject.Free
 0007CF82    xor         eax,eax
 0007CF84    pop         edx
 0007CF85    pop         ecx
 0007CF86    pop         ecx
 0007CF87    mov         dword ptr fs:[eax],edx
 0007CF8A    push        7CFA4
 0007CF8F    lea         eax,[ebp-1C]
 0007CF92    mov         edx,2
 0007CF97    call        @LStrArrayClr
 0007CF9C    ret
>0007CF9D    jmp         @HandleFinally
>0007CFA2    jmp         0007CF8F
 0007CFA4    mov         al,byte ptr [ebp-5]
 0007CFA7    pop         edi
 0007CFA8    pop         esi
 0007CFA9    pop         ebx
 0007CFAA    mov         esp,ebp
 0007CFAC    pop         ebp
 0007CFAD    ret
end;*}

//0007CFB0
{*function TSectionList.IndexOf(const S:AnsiString):?;
begin
 0007CFB0    push        ebp
 0007CFB1    mov         ebp,esp
 0007CFB3    add         esp,0FFFFFFEC
 0007CFB6    push        ebx
 0007CFB7    push        esi
 0007CFB8    push        edi
 0007CFB9    xor         ecx,ecx
 0007CFBB    mov         dword ptr [ebp-14],ecx
 0007CFBE    mov         dword ptr [ebp-8],edx
 0007CFC1    mov         dword ptr [ebp-4],eax
 0007CFC4    xor         eax,eax
 0007CFC6    push        ebp
 0007CFC7    push        7D078
 0007CFCC    push        dword ptr fs:[eax]
 0007CFCF    mov         dword ptr fs:[eax],esp
 0007CFD2    mov         dword ptr [ebp-0C],0FFFFFFFF
 0007CFD9    mov         eax,dword ptr [ebp-4]
 0007CFDC    mov         edx,dword ptr [eax]
 0007CFDE    call        dword ptr [edx+14];TStringList.GetCount
 0007CFE1    test        eax,eax
>0007CFE3    je          0007D062
 0007CFE5    mov         eax,dword ptr [ebp-4]
 0007CFE8    mov         eax,dword ptr [eax+2C];TSectionList....:dword
 0007CFEB    mov         dword ptr [ebp-10],eax
 0007CFEE    mov         ebx,dword ptr [ebp-10]
 0007CFF1    mov         eax,dword ptr [ebp-4]
 0007CFF4    mov         edx,dword ptr [eax]
 0007CFF6    call        dword ptr [edx+14];TStringList.GetCount
 0007CFF9    mov         esi,eax
 0007CFFB    dec         esi
 0007CFFC    sub         esi,ebx
>0007CFFE    jl          0007D02C
 0007D000    inc         esi
 0007D001    lea         ecx,[ebp-14]
 0007D004    mov         edx,ebx
 0007D006    mov         eax,dword ptr [ebp-4]
 0007D009    mov         edi,dword ptr [eax]
 0007D00B    call        dword ptr [edi+0C];TStringList.Get
 0007D00E    mov         eax,dword ptr [ebp-14]
 0007D011    mov         edx,dword ptr [ebp-8]
 0007D014    call        AnsiCompareText
 0007D019    test        eax,eax
>0007D01B    jne         0007D028
 0007D01D    mov         dword ptr [ebp-0C],ebx
 0007D020    mov         eax,dword ptr [ebp-4]
 0007D023    mov         dword ptr [eax+2C],ebx;TSectionList.....:dword
>0007D026    jmp         0007D062
 0007D028    inc         ebx
 0007D029    dec         esi
>0007D02A    jne         0007D001
 0007D02C    mov         esi,dword ptr [ebp-10]
 0007D02F    dec         esi
 0007D030    test        esi,esi
>0007D032    jl          0007D062
 0007D034    inc         esi
 0007D035    xor         ebx,ebx
 0007D037    lea         ecx,[ebp-14]
 0007D03A    mov         edx,ebx
 0007D03C    mov         eax,dword ptr [ebp-4]
 0007D03F    mov         edi,dword ptr [eax]
 0007D041    call        dword ptr [edi+0C];TStringList.Get
 0007D044    mov         eax,dword ptr [ebp-14]
 0007D047    mov         edx,dword ptr [ebp-8]
 0007D04A    call        AnsiCompareText
 0007D04F    test        eax,eax
>0007D051    jne         0007D05E
 0007D053    mov         dword ptr [ebp-0C],ebx
 0007D056    mov         eax,dword ptr [ebp-4]
 0007D059    mov         dword ptr [eax+2C],ebx;TSectionList......:dword
>0007D05C    jmp         0007D062
 0007D05E    inc         ebx
 0007D05F    dec         esi
>0007D060    jne         0007D037
 0007D062    xor         eax,eax
 0007D064    pop         edx
 0007D065    pop         ecx
 0007D066    pop         ecx
 0007D067    mov         dword ptr fs:[eax],edx
 0007D06A    push        7D07F
 0007D06F    lea         eax,[ebp-14]
 0007D072    call        @LStrClr
 0007D077    ret
>0007D078    jmp         @HandleFinally
>0007D07D    jmp         0007D06F
 0007D07F    mov         eax,dword ptr [ebp-0C]
 0007D082    pop         edi
 0007D083    pop         esi
 0007D084    pop         ebx
 0007D085    mov         esp,ebp
 0007D087    pop         ebp
 0007D088    ret
end;*}

//0007D08C
constructor TCMIniFile.Create;
begin
{*
 0007D08C    push        ebp
 0007D08D    mov         ebp,esp
 0007D08F    push        0
 0007D091    push        0
 0007D093    push        ebx
 0007D094    push        esi
 0007D095    push        edi
 0007D096    test        dl,dl
>0007D098    je          0007D0A2
 0007D09A    add         esp,0FFFFFFF0
 0007D09D    call        @ClassCreate
 0007D0A2    mov         esi,ecx
 0007D0A4    mov         ebx,edx
 0007D0A6    mov         edi,eax
 0007D0A8    xor         eax,eax
 0007D0AA    push        ebp
 0007D0AB    push        7D139
 0007D0B0    push        dword ptr fs:[eax]
 0007D0B3    mov         dword ptr fs:[eax],esp
 0007D0B6    mov         dl,1
 0007D0B8    mov         eax,[0007CB58];TSectionList
 0007D0BD    call        TSectionList.Create;TSectionList.Create
 0007D0C2    mov         dword ptr [edi+0C],eax
 0007D0C5    mov         byte ptr [edi+14],1
 0007D0C9    mov         byte ptr [edi+15],1
 0007D0CD    mov         byte ptr [edi+16],1
 0007D0D1    mov         byte ptr [edi+17],1
 0007D0D5    mov         byte ptr [edi+18],0
 0007D0D9    xor         eax,eax
 0007D0DB    mov         dword ptr [edi+10],eax
 0007D0DE    lea         eax,[edi+4]
 0007D0E1    call        @LStrClr
 0007D0E6    test        esi,esi
>0007D0E8    jne         0007D115
 0007D0EA    lea         edx,[ebp-8]
 0007D0ED    mov         eax,[000B59E8];^Application:TApplication
 0007D0F2    mov         eax,dword ptr [eax]
 0007D0F4    call        TApplication.GetExeName
 0007D0F9    mov         eax,dword ptr [ebp-8]
 0007D0FC    lea         ecx,[ebp-4]
 0007D0FF    mov         edx,7D168;'.ini'
 0007D104    call        ChangeFileExt
 0007D109    mov         edx,dword ptr [ebp-4]
 0007D10C    mov         eax,edi
 0007D10E    call        0007D5A8
>0007D113    jmp         0007D11E
 0007D115    mov         edx,esi
 0007D117    mov         eax,edi
 0007D119    call        0007D5A8
 0007D11E    xor         eax,eax
 0007D120    pop         edx
 0007D121    pop         ecx
 0007D122    pop         ecx
 0007D123    mov         dword ptr fs:[eax],edx
 0007D126    push        7D140
 0007D12B    lea         eax,[ebp-8]
 0007D12E    mov         edx,2
 0007D133    call        @LStrArrayClr
 0007D138    ret
>0007D139    jmp         @HandleFinally
>0007D13E    jmp         0007D12B
 0007D140    mov         eax,edi
 0007D142    test        bl,bl
>0007D144    je          0007D155
 0007D146    call        @AfterConstruction
 0007D14B    pop         dword ptr fs:[0]
 0007D152    add         esp,0C
 0007D155    mov         eax,edi
 0007D157    pop         edi
 0007D158    pop         esi
 0007D159    pop         ebx
 0007D15A    pop         ecx
 0007D15B    pop         ecx
 0007D15C    pop         ebp
 0007D15D    ret
*}
end;

//0007D170
destructor TCMIniFile.Destroy;
begin
{*
 0007D170    push        ebx
 0007D171    push        esi
 0007D172    call        @BeforeDestruction
 0007D177    mov         ebx,edx
 0007D179    mov         esi,eax
 0007D17B    mov         eax,esi
 0007D17D    mov         edx,dword ptr [eax]
 0007D17F    call        dword ptr [edx+34]
 0007D182    mov         eax,esi
 0007D184    call        0007D27C
 0007D189    mov         eax,dword ptr [esi+0C]
 0007D18C    call        TObject.Free
 0007D191    mov         edx,ebx
 0007D193    and         dl,0FC
 0007D196    mov         eax,esi
 0007D198    call        TObject.Destroy
 0007D19D    test        bl,bl
>0007D19F    jle         0007D1A8
 0007D1A1    mov         eax,esi
 0007D1A3    call        @ClassDestroy
 0007D1A8    pop         esi
 0007D1A9    pop         ebx
 0007D1AA    ret
*}
end;

//0007D1AC
{*procedure sub_0007D1AC(?:?; ?:?);
begin
 0007D1AC    push        ebp
 0007D1AD    mov         ebp,esp
 0007D1AF    add         esp,0FFFFFFEC
 0007D1B2    push        ebx
 0007D1B3    push        esi
 0007D1B4    push        edi
 0007D1B5    xor         ebx,ebx
 0007D1B7    mov         dword ptr [ebp-14],ebx
 0007D1BA    mov         dword ptr [ebp-0C],ebx
 0007D1BD    mov         esi,ecx
 0007D1BF    mov         dword ptr [ebp-8],edx
 0007D1C2    mov         dword ptr [ebp-4],eax
 0007D1C5    xor         eax,eax
 0007D1C7    push        ebp
 0007D1C8    push        7D26D
 0007D1CD    push        dword ptr fs:[eax]
 0007D1D0    mov         dword ptr fs:[eax],esp
 0007D1D3    mov         ecx,esi
 0007D1D5    mov         edx,dword ptr [ebp-8]
 0007D1D8    mov         eax,dword ptr [ebp-4]
 0007D1DB    mov         ebx,dword ptr [eax]
 0007D1DD    call        dword ptr [ebx+24];TCMIniFile.sub_0007DA88
 0007D1E0    mov         eax,esi
 0007D1E2    mov         edx,dword ptr [eax]
 0007D1E4    call        dword ptr [edx+14]
 0007D1E7    dec         eax
 0007D1E8    test        eax,eax
>0007D1EA    jl          0007D248
 0007D1EC    inc         eax
 0007D1ED    mov         dword ptr [ebp-10],eax
 0007D1F0    xor         ebx,ebx
 0007D1F2    mov         eax,dword ptr [ebp-4]
 0007D1F5    cmp         byte ptr [eax+17],0;TCMIniFile.?f17:byte
>0007D1F9    je          0007D214
 0007D1FB    lea         ecx,[ebp-14]
 0007D1FE    mov         edx,ebx
 0007D200    mov         eax,esi
 0007D202    mov         edi,dword ptr [eax]
 0007D204    call        dword ptr [edi+0C]
 0007D207    mov         eax,dword ptr [ebp-14]
 0007D20A    lea         edx,[ebp-0C]
 0007D20D    call        0007CD88
>0007D212    jmp         0007D220
 0007D214    lea         ecx,[ebp-0C]
 0007D217    mov         edx,ebx
 0007D219    mov         eax,esi
 0007D21B    mov         edi,dword ptr [eax]
 0007D21D    call        dword ptr [edi+0C]
 0007D220    lea         edx,[ebp-14]
 0007D223    mov         eax,dword ptr [ebp-0C]
 0007D226    call        0007CD00
 0007D22B    mov         edx,dword ptr [ebp-14]
 0007D22E    lea         eax,[ebp-0C]
 0007D231    call        @LStrLAsg
 0007D236    mov         ecx,dword ptr [ebp-0C]
 0007D239    mov         edx,ebx
 0007D23B    mov         eax,esi
 0007D23D    mov         edi,dword ptr [eax]
 0007D23F    call        dword ptr [edi+20]
 0007D242    inc         ebx
 0007D243    dec         dword ptr [ebp-10]
>0007D246    jne         0007D1F2
 0007D248    mov         eax,esi
 0007D24A    call        TStrings.EndUpdate
 0007D24F    xor         eax,eax
 0007D251    pop         edx
 0007D252    pop         ecx
 0007D253    pop         ecx
 0007D254    mov         dword ptr fs:[eax],edx
 0007D257    push        7D274
 0007D25C    lea         eax,[ebp-14]
 0007D25F    call        @LStrClr
 0007D264    lea         eax,[ebp-0C]
 0007D267    call        @LStrClr
 0007D26C    ret
>0007D26D    jmp         @HandleFinally
>0007D272    jmp         0007D25C
 0007D274    pop         edi
 0007D275    pop         esi
 0007D276    pop         ebx
 0007D277    mov         esp,ebp
 0007D279    pop         ebp
 0007D27A    ret
end;*}

//0007D27C
{*procedure sub_0007D27C(?:?);
begin
 0007D27C    push        ebx
 0007D27D    push        esi
 0007D27E    push        edi
 0007D27F    mov         edi,dword ptr [eax+0C]
 0007D282    mov         eax,edi
 0007D284    mov         edx,dword ptr [eax]
 0007D286    call        dword ptr [edx+14]
 0007D289    mov         ebx,eax
 0007D28B    dec         ebx
 0007D28C    test        ebx,ebx
>0007D28E    jl          0007D2A5
 0007D290    inc         ebx
 0007D291    xor         esi,esi
 0007D293    mov         edx,esi
 0007D295    mov         eax,edi
 0007D297    call        0007CE10
 0007D29C    call        TObject.Free
 0007D2A1    inc         esi
 0007D2A2    dec         ebx
>0007D2A3    jne         0007D293
 0007D2A5    mov         eax,edi
 0007D2A7    mov         edx,dword ptr [eax]
 0007D2A9    call        dword ptr [edx+40]
 0007D2AC    xor         eax,eax
 0007D2AE    mov         dword ptr [edi+2C],eax
 0007D2B1    pop         edi
 0007D2B2    pop         esi
 0007D2B3    pop         ebx
 0007D2B4    ret
end;*}

//0007D2B8
{*procedure sub_0007D2B8(?:?);
begin
 0007D2B8    push        ebp
 0007D2B9    mov         ebp,esp
 0007D2BB    add         esp,0FFFFFE24
 0007D2C1    push        ebx
 0007D2C2    push        esi
 0007D2C3    push        edi
 0007D2C4    xor         ecx,ecx
 0007D2C6    mov         dword ptr [ebp-8],ecx
 0007D2C9    mov         dword ptr [ebp-0C],ecx
 0007D2CC    mov         esi,edx
 0007D2CE    mov         ebx,eax
 0007D2D0    xor         eax,eax
 0007D2D2    push        ebp
 0007D2D3    push        7D582
 0007D2D8    push        dword ptr fs:[eax]
 0007D2DB    mov         dword ptr fs:[eax],esp
 0007D2DE    xor         eax,eax
 0007D2E0    mov         dword ptr [ebp-4],eax
 0007D2E3    xor         eax,eax
 0007D2E5    mov         dword ptr [ebx+10],eax;TCMIniFile.?f10:dword
 0007D2E8    mov         eax,esi
 0007D2EA    call        FileExists
 0007D2EF    test        al,al
>0007D2F1    je          0007D567
 0007D2F7    mov         edx,esi
 0007D2F9    lea         eax,[ebp-1DC]
 0007D2FF    call        @Assign
 0007D304    lea         eax,[ebp-1DC]
 0007D30A    call        @ResetText
 0007D30F    call        @_IOTest
>0007D314    jmp         0007D52F
 0007D319    lea         edx,[ebp-0C]
 0007D31C    lea         eax,[ebp-1DC]
 0007D322    call        @ReadLString
 0007D327    lea         eax,[ebp-1DC]
 0007D32D    call        @ReadLn
 0007D332    call        @_IOTest
 0007D337    mov         eax,dword ptr [ebp-0C]
 0007D33A    mov         edx,7D598;''
 0007D33F    call        @LStrCmp
>0007D344    jne         0007D34E
 0007D346    lea         eax,[ebp-0C]
 0007D349    call        @LStrClr
 0007D34E    cmp         byte ptr [ebx+14],0;TCMIniFile.?f14:byte
>0007D352    je          0007D36A
 0007D354    cmp         dword ptr [ebp-0C],0
>0007D358    je          0007D36A
 0007D35A    mov         eax,dword ptr [ebp-0C]
 0007D35D    cmp         byte ptr [eax],3B
>0007D360    jne         0007D36A
 0007D362    lea         eax,[ebp-0C]
 0007D365    call        @LStrClr
 0007D36A    cmp         dword ptr [ebp-0C],0
>0007D36E    je          0007D52F
 0007D374    mov         eax,dword ptr [ebp-0C]
 0007D377    call        @LStrLen
 0007D37C    mov         edi,eax
 0007D37E    mov         eax,dword ptr [ebp-0C]
 0007D381    cmp         byte ptr [eax],5B
>0007D384    jne         0007D3C8
 0007D386    mov         eax,dword ptr [ebp-0C]
 0007D389    cmp         byte ptr [eax+edi-1],5D
>0007D38E    jne         0007D3C8
 0007D390    lea         eax,[ebp-8]
 0007D393    push        eax
 0007D394    mov         ecx,edi
 0007D396    sub         ecx,2
 0007D399    mov         edx,2
 0007D39E    mov         eax,dword ptr [ebp-0C]
 0007D3A1    call        @LStrCopy
 0007D3A6    mov         dl,1
 0007D3A8    mov         eax,[0001F340];TStringList
 0007D3AD    call        TObject.Create;TStringList.Create
 0007D3B2    mov         dword ptr [ebp-4],eax
 0007D3B5    mov         ecx,dword ptr [ebp-4]
 0007D3B8    mov         edx,dword ptr [ebp-8]
 0007D3BB    mov         eax,dword ptr [ebx+0C];TCMIniFile.?fC:dword
 0007D3BE    mov         esi,dword ptr [eax]
 0007D3C0    call        dword ptr [esi+38]
>0007D3C3    jmp         0007D52F
 0007D3C8    cmp         byte ptr [ebx+16],0;TCMIniFile.?f16:byte
>0007D3CC    je          0007D46F
 0007D3D2    mov         byte ptr [ebp-0D],0
 0007D3D6    mov         edx,dword ptr [ebp-0C]
 0007D3D9    mov         eax,7D5A4;'='
 0007D3DE    call        AnsiPos
 0007D3E3    mov         esi,eax
 0007D3E5    cmp         esi,1
>0007D3E8    jle         0007D411
 0007D3EA    mov         eax,dword ptr [ebp-0C]
 0007D3ED    mov         al,byte ptr [eax+esi-2]
 0007D3F1    sub         al,9
>0007D3F3    je          0007D3F9
 0007D3F5    sub         al,17
>0007D3F7    jne         0007D40B
 0007D3F9    mov         edx,esi
 0007D3FB    dec         edx
 0007D3FC    lea         eax,[ebp-0C]
 0007D3FF    mov         ecx,1
 0007D404    call        @LStrDelete
>0007D409    jmp         0007D415
 0007D40B    mov         byte ptr [ebp-0D],1
>0007D40F    jmp         0007D415
 0007D411    mov         byte ptr [ebp-0D],1
 0007D415    cmp         byte ptr [ebp-0D],0
>0007D419    je          0007D3D6
 0007D41B    mov         byte ptr [ebp-0D],0
 0007D41F    mov         edx,dword ptr [ebp-0C]
 0007D422    mov         eax,7D5A4;'='
 0007D427    call        AnsiPos
 0007D42C    mov         esi,eax
 0007D42E    cmp         esi,1
>0007D431    jle         0007D46F
 0007D433    mov         eax,dword ptr [ebp-0C]
 0007D436    call        @LStrLen
 0007D43B    cmp         esi,eax
>0007D43D    jge         0007D465
 0007D43F    mov         eax,dword ptr [ebp-0C]
 0007D442    mov         al,byte ptr [eax+esi]
 0007D445    sub         al,9
>0007D447    je          0007D44D
 0007D449    sub         al,17
>0007D44B    jne         0007D45F
 0007D44D    lea         edx,[esi+1]
 0007D450    lea         eax,[ebp-0C]
 0007D453    mov         ecx,1
 0007D458    call        @LStrDelete
>0007D45D    jmp         0007D469
 0007D45F    mov         byte ptr [ebp-0D],1
>0007D463    jmp         0007D469
 0007D465    mov         byte ptr [ebp-0D],1
 0007D469    cmp         byte ptr [ebp-0D],0
>0007D46D    je          0007D433
 0007D46F    cmp         byte ptr [ebx+17],0;TCMIniFile.?f17:byte
>0007D473    je          0007D4D3
 0007D475    mov         edx,dword ptr [ebp-0C]
 0007D478    mov         eax,7D5A4;'='
 0007D47D    call        AnsiPos
 0007D482    mov         esi,eax
 0007D484    cmp         esi,1
>0007D487    jle         0007D4D3
 0007D489    mov         eax,dword ptr [ebp-0C]
 0007D48C    call        @LStrLen
 0007D491    mov         edi,eax
 0007D493    mov         eax,edi
 0007D495    dec         eax
 0007D496    cmp         esi,eax
>0007D498    jge         0007D4D3
 0007D49A    mov         eax,dword ptr [ebp-0C]
 0007D49D    mov         al,byte ptr [eax+edi-1]
 0007D4A1    mov         edx,dword ptr [ebp-0C]
 0007D4A4    cmp         al,byte ptr [edx+esi]
>0007D4A7    jne         0007D4D3
 0007D4A9    mov         edx,dword ptr [ebp-0C]
 0007D4AC    sub         al,22
>0007D4AE    je          0007D4B4
 0007D4B0    sub         al,5
>0007D4B2    jne         0007D4D3
 0007D4B4    lea         eax,[ebp-0C]
 0007D4B7    mov         ecx,1
 0007D4BC    mov         edx,edi
 0007D4BE    call        @LStrDelete
 0007D4C3    lea         edx,[esi+1]
 0007D4C6    lea         eax,[ebp-0C]
 0007D4C9    mov         ecx,1
 0007D4CE    call        @LStrDelete
 0007D4D3    cmp         byte ptr [ebx+18],0;TCMIniFile.?f18:byte
>0007D4D7    je          0007D507
 0007D4D9    mov         eax,dword ptr [ebp-0C]
 0007D4DC    call        @LStrLen
 0007D4E1    mov         esi,eax
>0007D4E3    jmp         0007D4E6
 0007D4E5    dec         esi
 0007D4E6    test        esi,esi
>0007D4E8    jle         0007D4F4
 0007D4EA    mov         eax,dword ptr [ebp-0C]
 0007D4ED    cmp         byte ptr [eax+esi-1],21
>0007D4F2    jb          0007D4E5
 0007D4F4    lea         eax,[ebp-0C]
 0007D4F7    push        eax
 0007D4F8    mov         ecx,esi
 0007D4FA    mov         edx,1
 0007D4FF    mov         eax,dword ptr [ebp-0C]
 0007D502    call        @LStrCopy
 0007D507    cmp         byte ptr [ebx+15],0;TCMIniFile.?f15:byte
>0007D50B    je          0007D51E
 0007D50D    mov         edx,dword ptr [ebp-0C]
 0007D510    mov         eax,7D5A4;'='
 0007D515    call        AnsiPos
 0007D51A    test        eax,eax
>0007D51C    jle         0007D52F
 0007D51E    cmp         dword ptr [ebp-4],0
>0007D522    je          0007D52F
 0007D524    mov         edx,dword ptr [ebp-0C]
 0007D527    mov         eax,dword ptr [ebp-4]
 0007D52A    mov         ecx,dword ptr [eax]
 0007D52C    call        dword ptr [ecx+34];TStringList.Add
 0007D52F    lea         eax,[ebp-1DC]
 0007D535    call        @EofText
 0007D53A    call        @_IOTest
 0007D53F    test        al,al
>0007D541    je          0007D319
 0007D547    mov         eax,dword ptr [ebx+0C];TCMIniFile.?fC:dword
 0007D54A    call        0007CE30
 0007D54F    test        al,al
>0007D551    je          0007D557
 0007D553    mov         byte ptr [ebx+8],1;TCMIniFile.?f8:byte
 0007D557    lea         eax,[ebp-1DC]
 0007D55D    call        @Close
 0007D562    call        @_IOTest
 0007D567    xor         eax,eax
 0007D569    pop         edx
 0007D56A    pop         ecx
 0007D56B    pop         ecx
 0007D56C    mov         dword ptr fs:[eax],edx
 0007D56F    push        7D589
 0007D574    lea         eax,[ebp-0C]
 0007D577    mov         edx,2
 0007D57C    call        @LStrArrayClr
 0007D581    ret
>0007D582    jmp         @HandleFinally
>0007D587    jmp         0007D574
 0007D589    pop         edi
 0007D58A    pop         esi
 0007D58B    pop         ebx
 0007D58C    mov         esp,ebp
 0007D58E    pop         ebp
 0007D58F    ret
end;*}

//0007D5A8
{*procedure sub_0007D5A8(?:?; ?:?);
begin
 0007D5A8    push        ebx
 0007D5A9    push        esi
 0007D5AA    mov         esi,edx
 0007D5AC    mov         ebx,eax
 0007D5AE    mov         eax,ebx
 0007D5B0    mov         edx,dword ptr [eax]
 0007D5B2    call        dword ptr [edx+34]
 0007D5B5    mov         eax,ebx
 0007D5B7    call        0007D27C
 0007D5BC    lea         eax,[ebx+4]
 0007D5BF    mov         edx,esi
 0007D5C1    call        @LStrAsg
 0007D5C6    test        esi,esi
>0007D5C8    je          0007D5D3
 0007D5CA    mov         edx,esi
 0007D5CC    mov         eax,ebx
 0007D5CE    mov         ecx,dword ptr [eax]
 0007D5D0    call        dword ptr [ecx+38]
 0007D5D3    mov         byte ptr [ebx+8],0
 0007D5D7    pop         esi
 0007D5D8    pop         ebx
 0007D5D9    ret
end;*}

//0007D5DC
{*function sub_0007D5DC(?:TCMIniFile; ?:?; ?:?; ?:?; ?:?):?;
begin
 0007D5DC    push        ebp
 0007D5DD    mov         ebp,esp
 0007D5DF    add         esp,0FFFFFFF0
 0007D5E2    push        ebx
 0007D5E3    push        esi
 0007D5E4    push        edi
 0007D5E5    xor         ebx,ebx
 0007D5E7    mov         dword ptr [ebp-10],ebx
 0007D5EA    mov         dword ptr [ebp-8],ecx
 0007D5ED    mov         dword ptr [ebp-4],edx
 0007D5F0    mov         ebx,eax
 0007D5F2    xor         eax,eax
 0007D5F4    push        ebp
 0007D5F5    push        7D6F5
 0007D5FA    push        dword ptr fs:[eax]
 0007D5FD    mov         dword ptr fs:[eax],esp
 0007D600    mov         dword ptr [ebp-0C],0FFFFFFFF
 0007D607    mov         eax,dword ptr [ebx+0C]
 0007D60A    mov         edx,dword ptr [eax]
 0007D60C    call        dword ptr [edx+14]
 0007D60F    test        eax,eax
>0007D611    jle         0007D682
 0007D613    mov         esi,dword ptr [ebx+10]
 0007D616    dec         esi
 0007D617    test        esi,esi
>0007D619    jge         0007D63D
 0007D61B    mov         eax,dword ptr [ebx+0C]
 0007D61E    mov         edx,dword ptr [eax]
 0007D620    call        dword ptr [edx+14]
 0007D623    mov         esi,eax
 0007D625    dec         esi
>0007D626    jmp         0007D63D
 0007D628    inc         dword ptr [ebx+10]
 0007D62B    mov         eax,dword ptr [ebx+0C]
 0007D62E    mov         edx,dword ptr [eax]
 0007D630    call        dword ptr [edx+14]
 0007D633    cmp         eax,dword ptr [ebx+10]
>0007D636    jne         0007D63D
 0007D638    xor         eax,eax
 0007D63A    mov         dword ptr [ebx+10],eax
 0007D63D    lea         ecx,[ebp-10]
 0007D640    mov         edx,dword ptr [ebx+10]
 0007D643    mov         eax,dword ptr [ebx+0C]
 0007D646    mov         edi,dword ptr [eax]
 0007D648    call        dword ptr [edi+0C]
 0007D64B    mov         edx,dword ptr [ebp-10]
 0007D64E    mov         eax,dword ptr [ebp-4]
 0007D651    call        AnsiCompareText
 0007D656    test        eax,eax
>0007D658    je          0007D65F
 0007D65A    cmp         esi,dword ptr [ebx+10]
>0007D65D    jne         0007D628
 0007D65F    lea         ecx,[ebp-10]
 0007D662    mov         edx,dword ptr [ebx+10]
 0007D665    mov         eax,dword ptr [ebx+0C]
 0007D668    mov         esi,dword ptr [eax]
 0007D66A    call        dword ptr [esi+0C]
 0007D66D    mov         edx,dword ptr [ebp-10]
 0007D670    mov         eax,dword ptr [ebp-4]
 0007D673    call        AnsiCompareText
 0007D678    test        eax,eax
>0007D67A    jne         0007D682
 0007D67C    mov         eax,dword ptr [ebx+10]
 0007D67F    mov         dword ptr [ebp-0C],eax
 0007D682    cmp         dword ptr [ebp-0C],0FFFFFFFF
>0007D686    jne         0007D6C0
 0007D688    cmp         byte ptr [ebp+0C],0
>0007D68C    je          0007D6B4
 0007D68E    mov         dl,1
 0007D690    mov         eax,[0001F340];TStringList
 0007D695    call        TObject.Create;TStringList.Create
 0007D69A    mov         edx,dword ptr [ebp+8]
 0007D69D    mov         dword ptr [edx],eax
 0007D69F    mov         ecx,dword ptr [ebp+8]
 0007D6A2    mov         ecx,dword ptr [ecx]
 0007D6A4    mov         edx,dword ptr [ebp-4]
 0007D6A7    mov         eax,dword ptr [ebx+0C]
 0007D6AA    mov         esi,dword ptr [eax]
 0007D6AC    call        dword ptr [esi+38]
 0007D6AF    mov         dword ptr [ebx+10],eax
>0007D6B2    jmp         0007D6BB
 0007D6B4    mov         eax,dword ptr [ebp+8]
 0007D6B7    xor         edx,edx
 0007D6B9    mov         dword ptr [eax],edx
 0007D6BB    or          ebx,0FFFFFFFF
>0007D6BE    jmp         0007D6DF
 0007D6C0    mov         edx,dword ptr [ebp-0C]
 0007D6C3    mov         eax,dword ptr [ebx+0C]
 0007D6C6    call        0007CE10
 0007D6CB    mov         edx,dword ptr [ebp+8]
 0007D6CE    mov         dword ptr [edx],eax
 0007D6D0    mov         eax,dword ptr [ebp+8]
 0007D6D3    mov         eax,dword ptr [eax]
 0007D6D5    mov         edx,dword ptr [ebp-8]
 0007D6D8    call        TStrings.IndexOfName
 0007D6DD    mov         ebx,eax
 0007D6DF    xor         eax,eax
 0007D6E1    pop         edx
 0007D6E2    pop         ecx
 0007D6E3    pop         ecx
 0007D6E4    mov         dword ptr fs:[eax],edx
 0007D6E7    push        7D6FC
 0007D6EC    lea         eax,[ebp-10]
 0007D6EF    call        @LStrClr
 0007D6F4    ret
>0007D6F5    jmp         @HandleFinally
>0007D6FA    jmp         0007D6EC
 0007D6FC    mov         eax,ebx
 0007D6FE    pop         edi
 0007D6FF    pop         esi
 0007D700    pop         ebx
 0007D701    mov         esp,ebp
 0007D703    pop         ebp
 0007D704    ret         8
end;*}

//0007D708
{*procedure sub_0007D708(?:?; ?:?; ?:?; ?:?);
begin
 0007D708    push        ebp
 0007D709    mov         ebp,esp
 0007D70B    add         esp,0FFFFFFF8
 0007D70E    push        ebx
 0007D70F    push        esi
 0007D710    mov         ebx,ecx
 0007D712    mov         dword ptr [ebp-4],edx
 0007D715    mov         esi,dword ptr [ebp+8]
 0007D718    push        0
 0007D71A    lea         edx,[ebp-8]
 0007D71D    push        edx
 0007D71E    mov         ecx,ebx
 0007D720    mov         edx,dword ptr [ebp-4]
 0007D723    call        0007D5DC
 0007D728    inc         eax
>0007D729    jne         0007D737
 0007D72B    mov         eax,esi
 0007D72D    mov         edx,dword ptr [ebp+0C]
 0007D730    call        @LStrLAsg
>0007D735    jmp         0007D743
 0007D737    mov         ecx,esi
 0007D739    mov         edx,ebx
 0007D73B    mov         eax,dword ptr [ebp-8]
 0007D73E    call        TStrings.GetValue
 0007D743    pop         esi
 0007D744    pop         ebx
 0007D745    pop         ecx
 0007D746    pop         ecx
 0007D747    pop         ebp
 0007D748    ret         8
end;*}

//0007D74C
{*procedure sub_0007D74C(?:?; ?:?; ?:?);
begin
 0007D74C    push        ebp
 0007D74D    mov         ebp,esp
 0007D74F    push        0
 0007D751    push        0
 0007D753    push        0
 0007D755    push        ebx
 0007D756    push        esi
 0007D757    push        edi
 0007D758    mov         ebx,ecx
 0007D75A    mov         edi,edx
 0007D75C    mov         esi,eax
 0007D75E    xor         eax,eax
 0007D760    push        ebp
 0007D761    push        7D813
 0007D766    push        dword ptr fs:[eax]
 0007D769    mov         dword ptr fs:[eax],esp
 0007D76C    test        ebx,ebx
>0007D76E    jne         0007D78E
 0007D770    test        edi,edi
>0007D772    jne         0007D783
 0007D774    cmp         dword ptr [ebp+8],0
>0007D778    jne         0007D783
 0007D77A    mov         eax,esi
 0007D77C    mov         edx,dword ptr [eax]
 0007D77E    call        dword ptr [edx+34];TCMIniFile.sub_0007DB98
>0007D781    jmp         0007D7F8
 0007D783    mov         edx,edi
 0007D785    mov         eax,esi
 0007D787    mov         ecx,dword ptr [eax]
 0007D789    call        dword ptr [ecx+28];TCMIniFile.sub_0007DD50
>0007D78C    jmp         0007D7F8
 0007D78E    push        ebx
 0007D78F    push        7D82C;'='
 0007D794    push        dword ptr [ebp+8]
 0007D797    lea         eax,[ebp-8]
 0007D79A    mov         edx,3
 0007D79F    call        @LStrCatN
 0007D7A4    push        1
 0007D7A6    lea         eax,[ebp-4]
 0007D7A9    push        eax
 0007D7AA    mov         ecx,ebx
 0007D7AC    mov         edx,edi
 0007D7AE    mov         eax,esi
 0007D7B0    call        0007D5DC
 0007D7B5    mov         ebx,eax
 0007D7B7    cmp         ebx,0FFFFFFFF
>0007D7BA    jne         0007D7CD
 0007D7BC    mov         edx,dword ptr [ebp-8]
 0007D7BF    mov         eax,dword ptr [ebp-4]
 0007D7C2    mov         ecx,dword ptr [eax]
 0007D7C4    call        dword ptr [ecx+34]
 0007D7C7    mov         byte ptr [esi+8],1;TCMIniFile.?f8:byte
>0007D7CB    jmp         0007D7F8
 0007D7CD    lea         ecx,[ebp-0C]
 0007D7D0    mov         edx,ebx
 0007D7D2    mov         eax,dword ptr [ebp-4]
 0007D7D5    mov         edi,dword ptr [eax]
 0007D7D7    call        dword ptr [edi+0C]
 0007D7DA    mov         eax,dword ptr [ebp-0C]
 0007D7DD    mov         edx,dword ptr [ebp-8]
 0007D7E0    call        @LStrCmp
>0007D7E5    je          0007D7F8
 0007D7E7    mov         byte ptr [esi+8],1;TCMIniFile.?f8:byte
 0007D7EB    mov         ecx,dword ptr [ebp-8]
 0007D7EE    mov         edx,ebx
 0007D7F0    mov         eax,dword ptr [ebp-4]
 0007D7F3    mov         ebx,dword ptr [eax]
 0007D7F5    call        dword ptr [ebx+20]
 0007D7F8    xor         eax,eax
 0007D7FA    pop         edx
 0007D7FB    pop         ecx
 0007D7FC    pop         ecx
 0007D7FD    mov         dword ptr fs:[eax],edx
 0007D800    push        7D81A
 0007D805    lea         eax,[ebp-0C]
 0007D808    mov         edx,2
 0007D80D    call        @LStrArrayClr
 0007D812    ret
>0007D813    jmp         @HandleFinally
>0007D818    jmp         0007D805
 0007D81A    pop         edi
 0007D81B    pop         esi
 0007D81C    pop         ebx
 0007D81D    mov         esp,ebp
 0007D81F    pop         ebp
 0007D820    ret         4
end;*}

//0007D830
{*function sub_0007D830(?:?; ?:?; ?:?):?;
begin
 0007D830    push        ebp
 0007D831    mov         ebp,esp
 0007D833    push        0
 0007D835    push        0
 0007D837    push        0
 0007D839    push        ebx
 0007D83A    push        esi
 0007D83B    mov         dword ptr [ebp-4],ecx
 0007D83E    mov         esi,edx
 0007D840    mov         ebx,eax
 0007D842    xor         eax,eax
 0007D844    push        ebp
 0007D845    push        7D8D7
 0007D84A    push        dword ptr fs:[eax]
 0007D84D    mov         dword ptr fs:[eax],esp
 0007D850    push        0
 0007D852    lea         eax,[ebp-8]
 0007D855    push        eax
 0007D856    mov         ecx,dword ptr [ebp-4]
 0007D859    mov         edx,esi
 0007D85B    mov         eax,ebx
 0007D85D    mov         ebx,dword ptr [eax]
 0007D85F    call        dword ptr [ebx+4];TCMIniFile.sub_0007D708
 0007D862    lea         eax,[ebp-0C]
 0007D865    push        eax
 0007D866    mov         ecx,2
 0007D86B    mov         edx,1
 0007D870    mov         eax,dword ptr [ebp-8]
 0007D873    call        @LStrCopy
 0007D878    mov         eax,dword ptr [ebp-0C]
 0007D87B    mov         edx,7D8F0;'0x'
 0007D880    call        CompareText
 0007D885    test        eax,eax
>0007D887    jne         0007D8AF
 0007D889    lea         eax,[ebp-0C]
 0007D88C    push        eax
 0007D88D    mov         ecx,0FF
 0007D892    mov         edx,3
 0007D897    mov         eax,dword ptr [ebp-8]
 0007D89A    call        @LStrCopy
 0007D89F    mov         ecx,dword ptr [ebp-0C]
 0007D8A2    lea         eax,[ebp-8]
 0007D8A5    mov         edx,7D8FC;'$'
 0007D8AA    call        @LStrCat3
 0007D8AF    mov         edx,dword ptr [ebp+8]
 0007D8B2    mov         eax,dword ptr [ebp-8]
 0007D8B5    call        StrToIntDef
 0007D8BA    mov         ebx,eax
 0007D8BC    xor         eax,eax
 0007D8BE    pop         edx
 0007D8BF    pop         ecx
 0007D8C0    pop         ecx
 0007D8C1    mov         dword ptr fs:[eax],edx
 0007D8C4    push        7D8DE
 0007D8C9    lea         eax,[ebp-0C]
 0007D8CC    mov         edx,2
 0007D8D1    call        @LStrArrayClr
 0007D8D6    ret
>0007D8D7    jmp         @HandleFinally
>0007D8DC    jmp         0007D8C9
 0007D8DE    mov         eax,ebx
 0007D8E0    pop         esi
 0007D8E1    pop         ebx
 0007D8E2    mov         esp,ebp
 0007D8E4    pop         ebp
 0007D8E5    ret         4
end;*}

//0007D900
{*procedure sub_0007D900(?:?; ?:?; ?:?);
begin
 0007D900    push        ebp
 0007D901    mov         ebp,esp
 0007D903    push        0
 0007D905    push        ebx
 0007D906    push        esi
 0007D907    push        edi
 0007D908    mov         edi,ecx
 0007D90A    mov         esi,edx
 0007D90C    mov         ebx,eax
 0007D90E    xor         eax,eax
 0007D910    push        ebp
 0007D911    push        7D94C
 0007D916    push        dword ptr fs:[eax]
 0007D919    mov         dword ptr fs:[eax],esp
 0007D91C    lea         edx,[ebp-4]
 0007D91F    mov         eax,dword ptr [ebp+8]
 0007D922    call        IntToStr
 0007D927    mov         eax,dword ptr [ebp-4]
 0007D92A    push        eax
 0007D92B    mov         ecx,edi
 0007D92D    mov         edx,esi
 0007D92F    mov         eax,ebx
 0007D931    mov         ebx,dword ptr [eax]
 0007D933    call        dword ptr [ebx+8];TCMIniFile.sub_0007D74C
 0007D936    xor         eax,eax
 0007D938    pop         edx
 0007D939    pop         ecx
 0007D93A    pop         ecx
 0007D93B    mov         dword ptr fs:[eax],edx
 0007D93E    push        7D953
 0007D943    lea         eax,[ebp-4]
 0007D946    call        @LStrClr
 0007D94B    ret
>0007D94C    jmp         @HandleFinally
>0007D951    jmp         0007D943
 0007D953    pop         edi
 0007D954    pop         esi
 0007D955    pop         ebx
 0007D956    pop         ecx
 0007D957    pop         ebp
 0007D958    ret         4
end;*}

//0007D95C
{*function sub_0007D95C(?:?; ?:?; ?:?):Boolean;
begin
 0007D95C    push        ebp
 0007D95D    mov         ebp,esp
 0007D95F    push        ecx
 0007D960    push        ebx
 0007D961    push        esi
 0007D962    mov         dword ptr [ebp-4],ecx
 0007D965    mov         esi,edx
 0007D967    mov         ebx,eax
 0007D969    xor         eax,eax
 0007D96B    mov         al,byte ptr [ebp+8]
 0007D96E    push        eax
 0007D96F    mov         ecx,dword ptr [ebp-4]
 0007D972    mov         edx,esi
 0007D974    mov         eax,ebx
 0007D976    mov         ebx,dword ptr [eax]
 0007D978    call        dword ptr [ebx+0C];TCMIniFile.sub_0007D830
 0007D97B    test        eax,eax
 0007D97D    setne       al
 0007D980    pop         esi
 0007D981    pop         ebx
 0007D982    pop         ecx
 0007D983    pop         ebp
 0007D984    ret         4
end;*}

//0007D988
{*procedure sub_0007D988(?:?; ?:?; ?:?);
begin
 0007D988    push        ebp
 0007D989    mov         ebp,esp
 0007D98B    push        0
 0007D98D    push        ebx
 0007D98E    push        esi
 0007D98F    push        edi
 0007D990    mov         edi,ecx
 0007D992    mov         esi,edx
 0007D994    mov         ebx,eax
 0007D996    xor         eax,eax
 0007D998    push        ebp
 0007D999    push        7D9DD
 0007D99E    push        dword ptr fs:[eax]
 0007D9A1    mov         dword ptr fs:[eax],esp
 0007D9A4    lea         eax,[ebp-4]
 0007D9A7    xor         edx,edx
 0007D9A9    mov         dl,byte ptr [ebp+8]
 0007D9AC    lea         edx,[edx*2+0B4EA0]
 0007D9B3    call        @LStrFromString
 0007D9B8    mov         eax,dword ptr [ebp-4]
 0007D9BB    push        eax
 0007D9BC    mov         ecx,edi
 0007D9BE    mov         edx,esi
 0007D9C0    mov         eax,ebx
 0007D9C2    mov         ebx,dword ptr [eax]
 0007D9C4    call        dword ptr [ebx+8];TCMIniFile.sub_0007D74C
 0007D9C7    xor         eax,eax
 0007D9C9    pop         edx
 0007D9CA    pop         ecx
 0007D9CB    pop         ecx
 0007D9CC    mov         dword ptr fs:[eax],edx
 0007D9CF    push        7D9E4
 0007D9D4    lea         eax,[ebp-4]
 0007D9D7    call        @LStrClr
 0007D9DC    ret
>0007D9DD    jmp         @HandleFinally
>0007D9E2    jmp         0007D9D4
 0007D9E4    pop         edi
 0007D9E5    pop         esi
 0007D9E6    pop         ebx
 0007D9E7    pop         ecx
 0007D9E8    pop         ebp
 0007D9E9    ret         4
end;*}

//0007D9EC
{*procedure sub_0007D9EC(?:?; ?:?);
begin
 0007D9EC    push        ebp
 0007D9ED    mov         ebp,esp
 0007D9EF    add         esp,0FFFFFFF4
 0007D9F2    push        ebx
 0007D9F3    push        esi
 0007D9F4    xor         ebx,ebx
 0007D9F6    mov         dword ptr [ebp-0C],ebx
 0007D9F9    mov         dword ptr [ebp-4],ecx
 0007D9FC    mov         ebx,eax
 0007D9FE    xor         eax,eax
 0007DA00    push        ebp
 0007DA01    push        7DA69
 0007DA06    push        dword ptr fs:[eax]
 0007DA09    mov         dword ptr fs:[eax],esp
 0007DA0C    mov         eax,dword ptr [ebx+0C];TCMIniFile.?fC:dword
 0007DA0F    mov         ecx,dword ptr [eax]
 0007DA11    call        dword ptr [ecx+50]
 0007DA14    cmp         eax,0FFFFFFFF
>0007DA17    je          0007DA53
 0007DA19    mov         edx,dword ptr [ebx+0C];TCMIniFile.?fC:dword
 0007DA1C    xchg        eax,edx
 0007DA1D    call        0007CE10
 0007DA22    mov         dword ptr [ebp-8],eax
 0007DA25    mov         eax,dword ptr [ebp-8]
 0007DA28    mov         edx,dword ptr [eax]
 0007DA2A    call        dword ptr [edx+14]
 0007DA2D    mov         ebx,eax
 0007DA2F    dec         ebx
 0007DA30    test        ebx,ebx
>0007DA32    jl          0007DA53
 0007DA34    inc         ebx
 0007DA35    xor         esi,esi
 0007DA37    lea         ecx,[ebp-0C]
 0007DA3A    mov         edx,esi
 0007DA3C    mov         eax,dword ptr [ebp-8]
 0007DA3F    call        TStrings.GetName
 0007DA44    mov         edx,dword ptr [ebp-0C]
 0007DA47    mov         eax,dword ptr [ebp-4]
 0007DA4A    mov         ecx,dword ptr [eax]
 0007DA4C    call        dword ptr [ecx+34]
 0007DA4F    inc         esi
 0007DA50    dec         ebx
>0007DA51    jne         0007DA37
 0007DA53    xor         eax,eax
 0007DA55    pop         edx
 0007DA56    pop         ecx
 0007DA57    pop         ecx
 0007DA58    mov         dword ptr fs:[eax],edx
 0007DA5B    push        7DA70
 0007DA60    lea         eax,[ebp-0C]
 0007DA63    call        @LStrClr
 0007DA68    ret
>0007DA69    jmp         @HandleFinally
>0007DA6E    jmp         0007DA60
 0007DA70    pop         esi
 0007DA71    pop         ebx
 0007DA72    mov         esp,ebp
 0007DA74    pop         ebp
 0007DA75    ret
end;*}

//0007DA78
{*procedure sub_0007DA78(?:?);
begin
 0007DA78    push        esi
 0007DA79    mov         esi,eax
 0007DA7B    mov         eax,edx
 0007DA7D    mov         edx,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DA80    mov         ecx,dword ptr [eax]
 0007DA82    call        dword ptr [ecx+8]
 0007DA85    pop         esi
 0007DA86    ret
end;*}

//0007DA88
{*procedure sub_0007DA88(?:?; ?:?);
begin
 0007DA88    push        ebx
 0007DA89    push        esi
 0007DA8A    push        edi
 0007DA8B    mov         edi,ecx
 0007DA8D    mov         esi,eax
 0007DA8F    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DA92    mov         ecx,dword ptr [eax]
 0007DA94    call        dword ptr [ecx+50]
 0007DA97    mov         ebx,eax
 0007DA99    cmp         ebx,0FFFFFFFF
>0007DA9C    je          0007DAB1
 0007DA9E    mov         edx,ebx
 0007DAA0    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DAA3    call        0007CE10
 0007DAA8    mov         edx,eax
 0007DAAA    mov         eax,edi
 0007DAAC    mov         ecx,dword ptr [eax]
 0007DAAE    call        dword ptr [ecx+3C]
 0007DAB1    pop         edi
 0007DAB2    pop         esi
 0007DAB3    pop         ebx
 0007DAB4    ret
end;*}

//0007DAB8
{*procedure sub_0007DAB8(?:?);
begin
 0007DAB8    push        ebp
 0007DAB9    mov         ebp,esp
 0007DABB    add         esp,0FFFFFFEC
 0007DABE    push        ebx
 0007DABF    push        esi
 0007DAC0    push        edi
 0007DAC1    xor         ecx,ecx
 0007DAC3    mov         dword ptr [ebp-10],ecx
 0007DAC6    mov         dword ptr [ebp-14],ecx
 0007DAC9    mov         dword ptr [ebp-4],edx
 0007DACC    xor         edx,edx
 0007DACE    push        ebp
 0007DACF    push        7DB71
 0007DAD4    push        dword ptr fs:[edx]
 0007DAD7    mov         dword ptr fs:[edx],esp
 0007DADA    mov         eax,dword ptr [eax+0C];TCMIniFile.?fC:dword
 0007DADD    mov         dword ptr [ebp-8],eax
 0007DAE0    mov         eax,dword ptr [ebp-8]
 0007DAE3    mov         edx,dword ptr [eax]
 0007DAE5    call        dword ptr [edx+14]
 0007DAE8    dec         eax
 0007DAE9    test        eax,eax
>0007DAEB    jl          0007DB56
 0007DAED    inc         eax
 0007DAEE    mov         dword ptr [ebp-0C],eax
 0007DAF1    xor         ebx,ebx
 0007DAF3    mov         edx,ebx
 0007DAF5    mov         eax,dword ptr [ebp-8]
 0007DAF8    call        0007CE10
 0007DAFD    mov         esi,eax
 0007DAFF    mov         eax,esi
 0007DB01    mov         edx,dword ptr [eax]
 0007DB03    call        dword ptr [edx+14]
 0007DB06    test        eax,eax
>0007DB08    jle         0007DB50
 0007DB0A    push        7DB88;'['
 0007DB0F    lea         ecx,[ebp-14]
 0007DB12    mov         edx,ebx
 0007DB14    mov         eax,dword ptr [ebp-8]
 0007DB17    mov         edi,dword ptr [eax]
 0007DB19    call        dword ptr [edi+0C]
 0007DB1C    push        dword ptr [ebp-14]
 0007DB1F    push        7DB94;']'
 0007DB24    lea         eax,[ebp-10]
 0007DB27    mov         edx,3
 0007DB2C    call        @LStrCatN
 0007DB31    mov         edx,dword ptr [ebp-10]
 0007DB34    mov         eax,dword ptr [ebp-4]
 0007DB37    mov         ecx,dword ptr [eax]
 0007DB39    call        dword ptr [ecx+34]
 0007DB3C    mov         edx,esi
 0007DB3E    mov         eax,dword ptr [ebp-4]
 0007DB41    mov         ecx,dword ptr [eax]
 0007DB43    call        dword ptr [ecx+3C]
 0007DB46    xor         edx,edx
 0007DB48    mov         eax,dword ptr [ebp-4]
 0007DB4B    mov         ecx,dword ptr [eax]
 0007DB4D    call        dword ptr [ecx+34]
 0007DB50    inc         ebx
 0007DB51    dec         dword ptr [ebp-0C]
>0007DB54    jne         0007DAF3
 0007DB56    xor         eax,eax
 0007DB58    pop         edx
 0007DB59    pop         ecx
 0007DB5A    pop         ecx
 0007DB5B    mov         dword ptr fs:[eax],edx
 0007DB5E    push        7DB78
 0007DB63    lea         eax,[ebp-14]
 0007DB66    mov         edx,2
 0007DB6B    call        @LStrArrayClr
 0007DB70    ret
>0007DB71    jmp         @HandleFinally
>0007DB76    jmp         0007DB63
 0007DB78    pop         edi
 0007DB79    pop         esi
 0007DB7A    pop         ebx
 0007DB7B    mov         esp,ebp
 0007DB7D    pop         ebp
 0007DB7E    ret
end;*}

//0007DB98
procedure sub_0007DB98;
begin
{*
 0007DB98    push        ebp
 0007DB99    mov         ebp,esp
 0007DB9B    add         esp,0FFFFFE18
 0007DBA1    push        ebx
 0007DBA2    push        esi
 0007DBA3    push        edi
 0007DBA4    xor         edx,edx
 0007DBA6    mov         dword ptr [ebp-1E4],edx
 0007DBAC    mov         dword ptr [ebp-1E8],edx
 0007DBB2    mov         dword ptr [ebp-4],eax
 0007DBB5    xor         eax,eax
 0007DBB7    push        ebp
 0007DBB8    push        7DD2A
 0007DBBD    push        dword ptr fs:[eax]
 0007DBC0    mov         dword ptr fs:[eax],esp
 0007DBC3    mov         eax,dword ptr [ebp-4]
 0007DBC6    cmp         byte ptr [eax+8],0;TCMIniFile.?f8:byte
>0007DBCA    je          0007DD0C
 0007DBD0    mov         eax,dword ptr [ebp-4]
 0007DBD3    cmp         dword ptr [eax+4],0;TCMIniFile.?f4:String
>0007DBD7    je          0007DD05
 0007DBDD    mov         eax,dword ptr [ebp-4]
 0007DBE0    mov         edx,dword ptr [eax+4];TCMIniFile.?f4:String
 0007DBE3    lea         eax,[ebp-1E0]
 0007DBE9    call        @Assign
 0007DBEE    lea         eax,[ebp-1E0]
 0007DBF4    call        @RewritText
 0007DBF9    call        @_IOTest
 0007DBFE    mov         eax,dword ptr [ebp-4]
 0007DC01    mov         eax,dword ptr [eax+0C];TCMIniFile.?fC:dword
 0007DC04    mov         dword ptr [ebp-10],eax
 0007DC07    mov         eax,dword ptr [ebp-10]
 0007DC0A    mov         edx,dword ptr [eax]
 0007DC0C    call        dword ptr [edx+14]
 0007DC0F    dec         eax
 0007DC10    test        eax,eax
>0007DC12    jl          0007DCF5
 0007DC18    inc         eax
 0007DC19    mov         dword ptr [ebp-14],eax
 0007DC1C    mov         dword ptr [ebp-0C],0
 0007DC23    mov         edx,dword ptr [ebp-0C]
 0007DC26    mov         eax,dword ptr [ebp-10]
 0007DC29    call        0007CE10
 0007DC2E    mov         esi,eax
 0007DC30    mov         eax,esi
 0007DC32    mov         edx,dword ptr [eax]
 0007DC34    call        dword ptr [edx+14]
 0007DC37    test        eax,eax
>0007DC39    jle         0007DCE9
 0007DC3F    push        7DD40;'['
 0007DC44    lea         ecx,[ebp-1E8]
 0007DC4A    mov         edx,dword ptr [ebp-0C]
 0007DC4D    mov         eax,dword ptr [ebp-10]
 0007DC50    mov         ebx,dword ptr [eax]
 0007DC52    call        dword ptr [ebx+0C]
 0007DC55    push        dword ptr [ebp-1E8]
 0007DC5B    push        7DD4C;']'
 0007DC60    lea         eax,[ebp-1E4]
 0007DC66    mov         edx,3
 0007DC6B    call        @LStrCatN
 0007DC70    mov         edx,dword ptr [ebp-1E4]
 0007DC76    lea         eax,[ebp-1E0]
 0007DC7C    call        @Write0Bool
 0007DC81    call        @WriteLn
 0007DC86    call        @_IOTest
 0007DC8B    mov         eax,esi
 0007DC8D    mov         edx,dword ptr [eax]
 0007DC8F    call        dword ptr [edx+14]
 0007DC92    mov         ebx,eax
 0007DC94    dec         ebx
 0007DC95    test        ebx,ebx
>0007DC97    jl          0007DCD2
 0007DC99    inc         ebx
 0007DC9A    mov         dword ptr [ebp-8],0
 0007DCA1    lea         ecx,[ebp-1E4]
 0007DCA7    mov         edx,dword ptr [ebp-8]
 0007DCAA    mov         eax,esi
 0007DCAC    mov         edi,dword ptr [eax]
 0007DCAE    call        dword ptr [edi+0C]
 0007DCB1    mov         edx,dword ptr [ebp-1E4]
 0007DCB7    lea         eax,[ebp-1E0]
 0007DCBD    call        @Write0Bool
 0007DCC2    call        @WriteLn
 0007DCC7    call        @_IOTest
 0007DCCC    inc         dword ptr [ebp-8]
 0007DCCF    dec         ebx
>0007DCD0    jne         0007DCA1
 0007DCD2    xor         edx,edx
 0007DCD4    lea         eax,[ebp-1E0]
 0007DCDA    call        @Write0Bool
 0007DCDF    call        @WriteLn
 0007DCE4    call        @_IOTest
 0007DCE9    inc         dword ptr [ebp-0C]
 0007DCEC    dec         dword ptr [ebp-14]
>0007DCEF    jne         0007DC23
 0007DCF5    lea         eax,[ebp-1E0]
 0007DCFB    call        @Close
 0007DD00    call        @_IOTest
 0007DD05    mov         eax,dword ptr [ebp-4]
 0007DD08    mov         byte ptr [eax+8],0;TCMIniFile.?f8:byte
 0007DD0C    xor         eax,eax
 0007DD0E    pop         edx
 0007DD0F    pop         ecx
 0007DD10    pop         ecx
 0007DD11    mov         dword ptr fs:[eax],edx
 0007DD14    push        7DD31
 0007DD19    lea         eax,[ebp-1E8]
 0007DD1F    mov         edx,2
 0007DD24    call        @LStrArrayClr
 0007DD29    ret
>0007DD2A    jmp         @HandleFinally
>0007DD2F    jmp         0007DD19
 0007DD31    pop         edi
 0007DD32    pop         esi
 0007DD33    pop         ebx
 0007DD34    mov         esp,ebp
 0007DD36    pop         ebp
 0007DD37    ret
*}
end;

//0007DD50
procedure sub_0007DD50;
begin
{*
 0007DD50    push        ebx
 0007DD51    push        esi
 0007DD52    mov         esi,eax
 0007DD54    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DD57    mov         ecx,dword ptr [eax]
 0007DD59    call        dword ptr [ecx+50]
 0007DD5C    mov         ebx,eax
 0007DD5E    cmp         ebx,0FFFFFFFF
>0007DD61    je          0007DD9A
 0007DD63    mov         edx,ebx
 0007DD65    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DD68    call        0007CE10
 0007DD6D    call        TObject.Free
 0007DD72    mov         edx,ebx
 0007DD74    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DD77    mov         ecx,dword ptr [eax]
 0007DD79    call        dword ptr [ecx+44]
 0007DD7C    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DD7F    xor         edx,edx
 0007DD81    mov         dword ptr [eax+2C],edx
 0007DD84    mov         byte ptr [esi+8],1;TCMIniFile.?f8:byte
 0007DD88    mov         eax,dword ptr [esi+0C];TCMIniFile.?fC:dword
 0007DD8B    mov         edx,dword ptr [eax]
 0007DD8D    call        dword ptr [edx+14]
 0007DD90    cmp         eax,dword ptr [esi+10];TCMIniFile.?f10:dword
>0007DD93    jg          0007DD9A
 0007DD95    xor         eax,eax
 0007DD97    mov         dword ptr [esi+10],eax;TCMIniFile.?f10:dword
 0007DD9A    pop         esi
 0007DD9B    pop         ebx
 0007DD9C    ret
*}
end;

//0007DDA0
procedure sub_0007DDA0;
begin
{*
 0007DDA0    push        ebx
 0007DDA1    push        esi
 0007DDA2    push        ecx
 0007DDA3    mov         ebx,eax
 0007DDA5    push        1
 0007DDA7    lea         eax,[esp+4]
 0007DDAB    push        eax
 0007DDAC    mov         eax,ebx
 0007DDAE    call        0007D5DC
 0007DDB3    mov         esi,eax
 0007DDB5    cmp         esi,0FFFFFFFF
>0007DDB8    jle         0007DDC8
 0007DDBA    mov         byte ptr [ebx+8],1;TCMIniFile.?f8:byte
 0007DDBE    mov         edx,esi
 0007DDC0    mov         eax,dword ptr [esp]
 0007DDC3    mov         ecx,dword ptr [eax]
 0007DDC5    call        dword ptr [ecx+44]
 0007DDC8    pop         edx
 0007DDC9    pop         esi
 0007DDCA    pop         ebx
 0007DDCB    ret
*}
end;

end.