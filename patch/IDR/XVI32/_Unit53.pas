//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit53;

interface

uses
  SysUtils, Classes;

    //procedure sub_00086D5C(?:?);//00086D5C
    //procedure sub_00086DC4(?:TComponent; ?:?);//00086DC4
    //procedure sub_00086E68(?:TComponent; ?:?);//00086E68
    procedure sub_00086F24(?:TForm; ?:TCMIniFile);//00086F24
    //procedure sub_0008710C(?:TComponent; ?:?);//0008710C
    //procedure sub_00087210(?:TComponent; ?:?);//00087210
    procedure sub_0008733C(?:TForm; ?:TCMIniFile);//0008733C
    //procedure sub_000876D8(?:TForm; ?:?);//000876D8
    //procedure sub_00087868(?:TForm; ?:?);//00087868
    procedure sub_00087964(?:TForm);//00087964
    procedure sub_000879C4(?:TFormMain);//000879C4
    procedure sub_00087A14(?:TForm);//00087A14
    //procedure sub_00087AEC(?:TStatusBar; ?:?; ?:?);//00087AEC
    //procedure sub_00087C20(?:?; ?:?; ?:?; ?:?);//00087C20
    //procedure sub_00087CE0(?:TListBox; ?:?);//00087CE0
    //function sub_00087DAC(?:?; ?:TPoint):?;//00087DAC
    //function sub_00087DF0(?:?; ?:?):?;//00087DF0
    //procedure sub_00087E28(?:?; ?:?);//00087E28
    //procedure sub_00087F3C(?:?; ?:?; ?:?; ?:?);//00087F3C
    //procedure sub_00087FB4(?:?; ?:?);//00087FB4
    //function sub_00088008:?;//00088008
    //function sub_0008806C(?:?; ?:?):?;//0008806C
    //procedure sub_000880DC(?:?; ?:?);//000880DC

implementation

//00086D5C
{*procedure sub_00086D5C(?:?);
begin
 00086D5C    push        ebp
 00086D5D    mov         ebp,esp
 00086D5F    push        0
 00086D61    push        ebx
 00086D62    mov         ebx,eax
 00086D64    xor         eax,eax
 00086D66    push        ebp
 00086D67    push        86DA6
 00086D6C    push        dword ptr fs:[eax]
 00086D6F    mov         dword ptr fs:[eax],esp
 00086D72    lea         edx,[ebp-4]
 00086D75    mov         eax,[000B59E8];^Application:TApplication
 00086D7A    mov         eax,dword ptr [eax]
 00086D7C    call        TApplication.GetExeName
 00086D81    mov         eax,dword ptr [ebp-4]
 00086D84    mov         ecx,ebx
 00086D86    mov         edx,86DBC;'.ini'
 00086D8B    call        ChangeFileExt
 00086D90    xor         eax,eax
 00086D92    pop         edx
 00086D93    pop         ecx
 00086D94    pop         ecx
 00086D95    mov         dword ptr fs:[eax],edx
 00086D98    push        86DAD
 00086D9D    lea         eax,[ebp-4]
 00086DA0    call        @LStrClr
 00086DA5    ret
>00086DA6    jmp         @HandleFinally
>00086DAB    jmp         00086D9D
 00086DAD    pop         ebx
 00086DAE    pop         ecx
 00086DAF    pop         ebp
 00086DB0    ret
end;*}

//00086DC4
{*procedure sub_00086DC4(?:TComponent; ?:?);
begin
 00086DC4    push        ebp
 00086DC5    mov         ebp,esp
 00086DC7    add         esp,0FFFFFFF8
 00086DCA    push        ebx
 00086DCB    push        esi
 00086DCC    push        edi
 00086DCD    xor         ecx,ecx
 00086DCF    mov         dword ptr [ebp-8],ecx
 00086DD2    mov         ebx,edx
 00086DD4    mov         dword ptr [ebp-4],eax
 00086DD7    xor         eax,eax
 00086DD9    push        ebp
 00086DDA    push        86E4D
 00086DDF    push        dword ptr fs:[eax]
 00086DE2    mov         dword ptr fs:[eax],esp
 00086DE5    mov         eax,ebx
 00086DE7    call        @LStrClr
 00086DEC    mov         eax,dword ptr [ebp-4]
 00086DEF    mov         edi,dword ptr [eax+1FC]
 00086DF5    dec         edi
 00086DF6    test        edi,edi
>00086DF8    jl          00086E37
 00086DFA    inc         edi
 00086DFB    xor         esi,esi
 00086DFD    mov         edx,esi
 00086DFF    mov         eax,dword ptr [ebp-4]
 00086E02    call        TCustomGrid.GetColWidths
 00086E07    lea         edx,[ebp-8]
 00086E0A    call        IntToStr
 00086E0F    mov         edx,dword ptr [ebp-8]
 00086E12    mov         eax,ebx
 00086E14    call        @LStrCat
 00086E19    mov         eax,dword ptr [ebp-4]
 00086E1C    mov         eax,dword ptr [eax+1FC]
 00086E22    dec         eax
 00086E23    cmp         esi,eax
>00086E25    jge         00086E33
 00086E27    mov         eax,ebx
 00086E29    mov         edx,86E64;','
 00086E2E    call        @LStrCat
 00086E33    inc         esi
 00086E34    dec         edi
>00086E35    jne         00086DFD
 00086E37    xor         eax,eax
 00086E39    pop         edx
 00086E3A    pop         ecx
 00086E3B    pop         ecx
 00086E3C    mov         dword ptr fs:[eax],edx
 00086E3F    push        86E54
 00086E44    lea         eax,[ebp-8]
 00086E47    call        @LStrClr
 00086E4C    ret
>00086E4D    jmp         @HandleFinally
>00086E52    jmp         00086E44
 00086E54    pop         edi
 00086E55    pop         esi
 00086E56    pop         ebx
 00086E57    pop         ecx
 00086E58    pop         ecx
 00086E59    pop         ebp
 00086E5A    ret
end;*}

//00086E68
{*procedure sub_00086E68(?:TComponent; ?:?);
begin
 00086E68    push        ebp
 00086E69    mov         ebp,esp
 00086E6B    add         esp,0FFFFFFF8
 00086E6E    push        ebx
 00086E6F    push        esi
 00086E70    push        edi
 00086E71    xor         ecx,ecx
 00086E73    mov         dword ptr [ebp-8],ecx
 00086E76    mov         ebx,edx
 00086E78    mov         dword ptr [ebp-4],eax
 00086E7B    xor         eax,eax
 00086E7D    push        ebp
 00086E7E    push        86F08
 00086E83    push        dword ptr fs:[eax]
 00086E86    mov         dword ptr fs:[eax],esp
 00086E89    mov         eax,ebx
 00086E8B    call        @LStrClr
 00086E90    mov         eax,dword ptr [ebp-4]
 00086E93    mov         eax,dword ptr [eax+218]
 00086E99    call        TCollection.GetCount
 00086E9E    mov         edi,eax
 00086EA0    dec         edi
 00086EA1    test        edi,edi
>00086EA3    jl          00086EF2
 00086EA5    inc         edi
 00086EA6    xor         esi,esi
 00086EA8    mov         eax,dword ptr [ebp-4]
 00086EAB    mov         eax,dword ptr [eax+218]
 00086EB1    mov         edx,esi
 00086EB3    call        THeaderSections.GetItem
 00086EB8    call        TListColumn.GetWidth
 00086EBD    lea         edx,[ebp-8]
 00086EC0    call        IntToStr
 00086EC5    mov         edx,dword ptr [ebp-8]
 00086EC8    mov         eax,ebx
 00086ECA    call        @LStrCat
 00086ECF    mov         eax,dword ptr [ebp-4]
 00086ED2    mov         eax,dword ptr [eax+218]
 00086ED8    call        TCollection.GetCount
 00086EDD    dec         eax
 00086EDE    cmp         esi,eax
>00086EE0    jge         00086EEE
 00086EE2    mov         eax,ebx
 00086EE4    mov         edx,86F20;','
 00086EE9    call        @LStrCat
 00086EEE    inc         esi
 00086EEF    dec         edi
>00086EF0    jne         00086EA8
 00086EF2    xor         eax,eax
 00086EF4    pop         edx
 00086EF5    pop         ecx
 00086EF6    pop         ecx
 00086EF7    mov         dword ptr fs:[eax],edx
 00086EFA    push        86F0F
 00086EFF    lea         eax,[ebp-8]
 00086F02    call        @LStrClr
 00086F07    ret
>00086F08    jmp         @HandleFinally
>00086F0D    jmp         00086EFF
 00086F0F    pop         edi
 00086F10    pop         esi
 00086F11    pop         ebx
 00086F12    pop         ecx
 00086F13    pop         ecx
 00086F14    pop         ebp
 00086F15    ret
end;*}

//00086F24
procedure sub_00086F24(?:TForm; ?:TCMIniFile);
begin
{*
 00086F24    push        ebp
 00086F25    mov         ebp,esp
 00086F27    add         esp,0FFFFFEF0
 00086F2D    push        ebx
 00086F2E    push        esi
 00086F2F    push        edi
 00086F30    xor         ecx,ecx
 00086F32    mov         dword ptr [ebp-110],ecx
 00086F38    mov         dword ptr [ebp-8],ecx
 00086F3B    mov         dword ptr [ebp-4],edx
 00086F3E    mov         ebx,eax
 00086F40    xor         eax,eax
 00086F42    push        ebp
 00086F43    push        870AD
 00086F48    push        dword ptr fs:[eax]
 00086F4B    mov         dword ptr fs:[eax],esp
 00086F4E    lea         edx,[ebp-10C]
 00086F54    mov         eax,dword ptr [ebx]
 00086F56    call        TObject.ClassName
 00086F5B    lea         edx,[ebp-10C]
 00086F61    lea         eax,[ebp-8]
 00086F64    call        @LStrFromString
 00086F69    mov         eax,dword ptr [ebx+34]
 00086F6C    push        eax
 00086F6D    mov         ecx,870C4;'Top'
 00086F72    mov         edx,dword ptr [ebp-8]
 00086F75    mov         eax,dword ptr [ebp-4]
 00086F78    mov         esi,dword ptr [eax]
 00086F7A    call        dword ptr [esi+10]
 00086F7D    mov         eax,dword ptr [ebx+30]
 00086F80    push        eax
 00086F81    mov         ecx,870D0;'Left'
 00086F86    mov         edx,dword ptr [ebp-8]
 00086F89    mov         eax,dword ptr [ebp-4]
 00086F8C    mov         esi,dword ptr [eax]
 00086F8E    call        dword ptr [esi+10]
 00086F91    xor         eax,eax
 00086F93    mov         al,byte ptr [ebx+20B]
 00086F99    push        eax
 00086F9A    mov         ecx,870E0;'WindowState'
 00086F9F    mov         edx,dword ptr [ebp-8]
 00086FA2    mov         eax,dword ptr [ebp-4]
 00086FA5    mov         esi,dword ptr [eax]
 00086FA7    call        dword ptr [esi+10]
 00086FAA    mov         al,byte ptr [ebx+209]
 00086FB0    sub         al,2
>00086FB2    je          00086FB8
 00086FB4    sub         al,3
>00086FB6    jne         00086FE0
 00086FB8    mov         eax,dword ptr [ebx+38]
 00086FBB    push        eax
 00086FBC    mov         ecx,870F4;'Width'
 00086FC1    mov         edx,dword ptr [ebp-8]
 00086FC4    mov         eax,dword ptr [ebp-4]
 00086FC7    mov         esi,dword ptr [eax]
 00086FC9    call        dword ptr [esi+10]
 00086FCC    mov         eax,dword ptr [ebx+3C]
 00086FCF    push        eax
 00086FD0    mov         ecx,87104;'Height'
 00086FD5    mov         edx,dword ptr [ebp-8]
 00086FD8    mov         eax,dword ptr [ebp-4]
 00086FDB    mov         esi,dword ptr [eax]
 00086FDD    call        dword ptr [esi+10]
 00086FE0    mov         eax,ebx
 00086FE2    call        TComponent.GetComponentCount
 00086FE7    dec         eax
 00086FE8    test        eax,eax
>00086FEA    jl          0008708C
 00086FF0    inc         eax
 00086FF1    mov         dword ptr [ebp-0C],eax
 00086FF4    xor         esi,esi
 00086FF6    mov         edx,esi
 00086FF8    mov         eax,ebx
 00086FFA    call        TComponent.GetComponent
 00086FFF    mov         edx,dword ptr ds:[7E1D4];TCustomGrid
 00087005    call        @IsClass
 0008700A    test        al,al
>0008700C    je          0008703D
 0008700E    mov         edx,esi
 00087010    mov         eax,ebx
 00087012    call        TComponent.GetComponent
 00087017    mov         edi,eax
 00087019    lea         edx,[ebp-110]
 0008701F    mov         eax,edi
 00087021    call        00086DC4
 00087026    mov         eax,dword ptr [ebp-110]
 0008702C    push        eax
 0008702D    mov         ecx,dword ptr [edi+8];TComponent.Name:TComponentName
 00087030    mov         edx,dword ptr [ebp-8]
 00087033    mov         eax,dword ptr [ebp-4]
 00087036    mov         edi,dword ptr [eax]
 00087038    call        dword ptr [edi+8]
>0008703B    jmp         00087082
 0008703D    mov         edx,esi
 0008703F    mov         eax,ebx
 00087041    call        TComponent.GetComponent
 00087046    mov         edx,dword ptr ds:[68AB4];TListView
 0008704C    call        @IsClass
 00087051    test        al,al
>00087053    je          00087082
 00087055    mov         edx,esi
 00087057    mov         eax,ebx
 00087059    call        TComponent.GetComponent
 0008705E    mov         edi,eax
 00087060    lea         edx,[ebp-110]
 00087066    mov         eax,edi
 00087068    call        00086E68
 0008706D    mov         eax,dword ptr [ebp-110]
 00087073    push        eax
 00087074    mov         ecx,dword ptr [edi+8];TComponent.Name:TComponentName
 00087077    mov         edx,dword ptr [ebp-8]
 0008707A    mov         eax,dword ptr [ebp-4]
 0008707D    mov         edi,dword ptr [eax]
 0008707F    call        dword ptr [edi+8]
 00087082    inc         esi
 00087083    dec         dword ptr [ebp-0C]
>00087086    jne         00086FF6
 0008708C    xor         eax,eax
 0008708E    pop         edx
 0008708F    pop         ecx
 00087090    pop         ecx
 00087091    mov         dword ptr fs:[eax],edx
 00087094    push        870B4
 00087099    lea         eax,[ebp-110]
 0008709F    call        @LStrClr
 000870A4    lea         eax,[ebp-8]
 000870A7    call        @LStrClr
 000870AC    ret
>000870AD    jmp         @HandleFinally
>000870B2    jmp         00087099
 000870B4    pop         edi
 000870B5    pop         esi
 000870B6    pop         ebx
 000870B7    mov         esp,ebp
 000870B9    pop         ebp
 000870BA    ret
*}
end;

//0008710C
{*procedure sub_0008710C(?:TComponent; ?:?);
begin
 0008710C    push        ebp
 0008710D    mov         ebp,esp
 0008710F    add         esp,0FFFFFFF4
 00087112    push        ebx
 00087113    push        esi
 00087114    push        edi
 00087115    xor         ecx,ecx
 00087117    mov         dword ptr [ebp-0C],ecx
 0008711A    mov         dword ptr [ebp-8],edx
 0008711D    mov         dword ptr [ebp-4],eax
 00087120    mov         eax,dword ptr [ebp-8]
 00087123    call        @LStrAddRef
 00087128    xor         eax,eax
 0008712A    push        ebp
 0008712B    push        871F4
 00087130    push        dword ptr fs:[eax]
 00087133    mov         dword ptr fs:[eax],esp
 00087136    xor         eax,eax
 00087138    push        ebp
 00087139    push        871CF
 0008713E    push        dword ptr fs:[eax]
 00087141    mov         dword ptr fs:[eax],esp
 00087144    mov         eax,dword ptr [ebp-4]
 00087147    mov         esi,dword ptr [eax+1FC]
 0008714D    dec         esi
 0008714E    test        esi,esi
>00087150    jl          000871C5
 00087152    inc         esi
 00087153    xor         edi,edi
 00087155    mov         edx,dword ptr [ebp-8]
 00087158    mov         eax,8720C;','
 0008715D    call        @LStrPos
 00087162    mov         ebx,eax
 00087164    test        ebx,ebx
>00087166    jne         0008717E
 00087168    mov         eax,dword ptr [ebp-8]
 0008716B    call        StrToInt
 00087170    mov         ecx,eax
 00087172    mov         edx,edi
 00087174    mov         eax,dword ptr [ebp-4]
 00087177    call        TCustomGrid.SetColWidths
>0008717C    jmp         000871C1
 0008717E    lea         eax,[ebp-0C]
 00087181    push        eax
 00087182    mov         ecx,ebx
 00087184    dec         ecx
 00087185    mov         edx,1
 0008718A    mov         eax,dword ptr [ebp-8]
 0008718D    call        @LStrCopy
 00087192    mov         eax,dword ptr [ebp-0C]
 00087195    call        StrToInt
 0008719A    mov         ecx,eax
 0008719C    mov         edx,edi
 0008719E    mov         eax,dword ptr [ebp-4]
 000871A1    call        TCustomGrid.SetColWidths
 000871A6    lea         eax,[ebp-8]
 000871A9    push        eax
 000871AA    mov         eax,dword ptr [ebp-8]
 000871AD    call        @LStrLen
 000871B2    mov         ecx,eax
 000871B4    sub         ecx,ebx
 000871B6    lea         edx,[ebx+1]
 000871B9    mov         eax,dword ptr [ebp-8]
 000871BC    call        @LStrCopy
 000871C1    inc         edi
 000871C2    dec         esi
>000871C3    jne         00087155
 000871C5    xor         eax,eax
 000871C7    pop         edx
 000871C8    pop         ecx
 000871C9    pop         ecx
 000871CA    mov         dword ptr fs:[eax],edx
>000871CD    jmp         000871D9
>000871CF    jmp         @HandleAnyException
 000871D4    call        @DoneExcept
 000871D9    xor         eax,eax
 000871DB    pop         edx
 000871DC    pop         ecx
 000871DD    pop         ecx
 000871DE    mov         dword ptr fs:[eax],edx
 000871E1    push        871FB
 000871E6    lea         eax,[ebp-0C]
 000871E9    mov         edx,2
 000871EE    call        @LStrArrayClr
 000871F3    ret
>000871F4    jmp         @HandleFinally
>000871F9    jmp         000871E6
 000871FB    pop         edi
 000871FC    pop         esi
 000871FD    pop         ebx
 000871FE    mov         esp,ebp
 00087200    pop         ebp
 00087201    ret
end;*}

//00087210
{*procedure sub_00087210(?:TComponent; ?:?);
begin
 00087210    push        ebp
 00087211    mov         ebp,esp
 00087213    add         esp,0FFFFFFF4
 00087216    push        ebx
 00087217    push        esi
 00087218    push        edi
 00087219    xor         ecx,ecx
 0008721B    mov         dword ptr [ebp-0C],ecx
 0008721E    mov         dword ptr [ebp-8],edx
 00087221    mov         dword ptr [ebp-4],eax
 00087224    mov         eax,dword ptr [ebp-8]
 00087227    call        @LStrAddRef
 0008722C    xor         eax,eax
 0008722E    push        ebp
 0008722F    push        8731F
 00087234    push        dword ptr fs:[eax]
 00087237    mov         dword ptr fs:[eax],esp
 0008723A    xor         eax,eax
 0008723C    push        ebp
 0008723D    push        872FA
 00087242    push        dword ptr fs:[eax]
 00087245    mov         dword ptr fs:[eax],esp
 00087248    mov         eax,dword ptr [ebp-4]
 0008724B    mov         eax,dword ptr [eax+218]
 00087251    call        TCollection.GetCount
 00087256    mov         esi,eax
 00087258    dec         esi
 00087259    test        esi,esi
>0008725B    jl          000872F0
 00087261    inc         esi
 00087262    xor         edi,edi
 00087264    mov         edx,dword ptr [ebp-8]
 00087267    mov         eax,87338;','
 0008726C    call        @LStrPos
 00087271    mov         ebx,eax
 00087273    test        ebx,ebx
>00087275    jne         0008729A
 00087277    mov         eax,dword ptr [ebp-4]
 0008727A    mov         eax,dword ptr [eax+218]
 00087280    mov         edx,edi
 00087282    call        THeaderSections.GetItem
 00087287    push        eax
 00087288    mov         eax,dword ptr [ebp-8]
 0008728B    call        StrToInt
 00087290    mov         edx,eax
 00087292    pop         eax
 00087293    call        TListColumn.SetWidth
>00087298    jmp         000872E8
 0008729A    lea         eax,[ebp-0C]
 0008729D    push        eax
 0008729E    mov         ecx,ebx
 000872A0    dec         ecx
 000872A1    mov         edx,1
 000872A6    mov         eax,dword ptr [ebp-8]
 000872A9    call        @LStrCopy
 000872AE    mov         eax,dword ptr [ebp-0C]
 000872B1    call        StrToInt
 000872B6    push        eax
 000872B7    mov         eax,dword ptr [ebp-4]
 000872BA    mov         eax,dword ptr [eax+218]
 000872C0    mov         edx,edi
 000872C2    call        THeaderSections.GetItem
 000872C7    pop         edx
 000872C8    call        TListColumn.SetWidth
 000872CD    lea         eax,[ebp-8]
 000872D0    push        eax
 000872D1    mov         eax,dword ptr [ebp-8]
 000872D4    call        @LStrLen
 000872D9    mov         ecx,eax
 000872DB    sub         ecx,ebx
 000872DD    lea         edx,[ebx+1]
 000872E0    mov         eax,dword ptr [ebp-8]
 000872E3    call        @LStrCopy
 000872E8    inc         edi
 000872E9    dec         esi
>000872EA    jne         00087264
 000872F0    xor         eax,eax
 000872F2    pop         edx
 000872F3    pop         ecx
 000872F4    pop         ecx
 000872F5    mov         dword ptr fs:[eax],edx
>000872F8    jmp         00087304
>000872FA    jmp         @HandleAnyException
 000872FF    call        @DoneExcept
 00087304    xor         eax,eax
 00087306    pop         edx
 00087307    pop         ecx
 00087308    pop         ecx
 00087309    mov         dword ptr fs:[eax],edx
 0008730C    push        87326
 00087311    lea         eax,[ebp-0C]
 00087314    mov         edx,2
 00087319    call        @LStrArrayClr
 0008731E    ret
>0008731F    jmp         @HandleFinally
>00087324    jmp         00087311
 00087326    pop         edi
 00087327    pop         esi
 00087328    pop         ebx
 00087329    mov         esp,ebp
 0008732B    pop         ebp
 0008732C    ret
end;*}

//0008733C
procedure sub_0008733C(?:TForm; ?:TCMIniFile);
begin
{*
 0008733C    push        ebp
 0008733D    mov         ebp,esp
 0008733F    add         esp,0FFFFFEDC
 00087345    push        ebx
 00087346    push        esi
 00087347    push        edi
 00087348    xor         ecx,ecx
 0008734A    mov         dword ptr [ebp-4],ecx
 0008734D    mov         dword ptr [ebp-20],ecx
 00087350    mov         esi,edx
 00087352    mov         ebx,eax
 00087354    xor         eax,eax
 00087356    push        ebp
 00087357    push        8763D
 0008735C    push        dword ptr fs:[eax]
 0008735F    mov         dword ptr fs:[eax],esp
 00087362    xor         edx,edx
 00087364    mov         eax,ebx
 00087366    call        TCustomForm.SetPosition
 0008736B    push        0
 0008736D    mov         ecx,87654;'resx'
 00087372    mov         edx,87664;'display'
 00087377    mov         eax,esi
 00087379    mov         edi,dword ptr [eax]
 0008737B    call        dword ptr [edi+0C]
 0008737E    mov         edi,eax
 00087380    mov         eax,[000B5BDC];^Screen:TScreen
 00087385    mov         eax,dword ptr [eax]
 00087387    call        TScreen.GetWidth
 0008738C    cmp         edi,eax
>0008738E    jne         000873D5
 00087390    push        0
 00087392    mov         ecx,87674;'resy'
 00087397    mov         edx,87664;'display'
 0008739C    mov         eax,esi
 0008739E    mov         edi,dword ptr [eax]
 000873A0    call        dword ptr [edi+0C]
 000873A3    mov         edi,eax
 000873A5    mov         eax,[000B5BDC];^Screen:TScreen
 000873AA    mov         eax,dword ptr [eax]
 000873AC    call        TScreen.GetHeight
 000873B1    cmp         edi,eax
>000873B3    jne         000873D5
 000873B5    push        0
 000873B7    mov         ecx,87684;'ppi'
 000873BC    mov         edx,87664;'display'
 000873C1    mov         eax,esi
 000873C3    mov         edi,dword ptr [eax]
 000873C5    call        dword ptr [edi+0C]
 000873C8    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 000873CE    mov         edx,dword ptr [edx]
 000873D0    cmp         eax,dword ptr [edx+34];TScreen.FPixelsPerInch:Integer
>000873D3    je          000873D9
 000873D5    xor         eax,eax
>000873D7    jmp         000873DB
 000873D9    mov         al,1
 000873DB    test        al,al
>000873DD    jne         000874A3
 000873E3    xor         edx,edx
 000873E5    mov         eax,ebx
 000873E7    call        TCustomForm.SetWindowState
 000873EC    mov         eax,[000B5BDC];^Screen:TScreen
 000873F1    mov         eax,dword ptr [eax]
 000873F3    call        TScreen.GetWidth
 000873F8    mov         edx,eax
 000873FA    sub         edx,dword ptr [ebx+38]
 000873FD    sar         edx,1
>000873FF    jns         00087404
 00087401    adc         edx,0
 00087404    add         edx,dword ptr ds:[0B6ACC];gvar_000B6ACC:Integer
 0008740A    mov         eax,ebx
 0008740C    call        TControl.SetLeft
 00087411    mov         eax,[000B5BDC];^Screen:TScreen
 00087416    mov         eax,dword ptr [eax]
 00087418    call        TScreen.GetHeight
 0008741D    mov         edx,eax
 0008741F    sub         edx,dword ptr [ebx+3C]
 00087422    sar         edx,1
>00087424    jns         00087429
 00087426    adc         edx,0
 00087429    add         edx,dword ptr ds:[0B6AD0];gvar_000B6AD0:Integer
 0008742F    mov         eax,ebx
 00087431    call        TControl.SetTop
 00087436    mov         eax,[000B5BDC];^Screen:TScreen
 0008743B    mov         eax,dword ptr [eax]
 0008743D    call        TScreen.GetWidth
 00087442    mov         ecx,32
 00087447    cdq
 00087448    idiv        eax,ecx
 0008744A    add         eax,dword ptr ds:[0B6ACC];gvar_000B6ACC:Integer
 00087450    push        eax
 00087451    mov         eax,[000B5BDC];^Screen:TScreen
 00087456    mov         eax,dword ptr [eax]
 00087458    call        TScreen.GetWidth
 0008745D    pop         edx
 0008745E    xchg        eax,edx
 0008745F    mov         ecx,edx
 00087461    cdq
 00087462    idiv        eax,ecx
 00087464    mov         dword ptr ds:[0B6ACC],edx;gvar_000B6ACC:Integer
 0008746A    mov         eax,[000B5BDC];^Screen:TScreen
 0008746F    mov         eax,dword ptr [eax]
 00087471    call        TScreen.GetHeight
 00087476    mov         ecx,32
 0008747B    cdq
 0008747C    idiv        eax,ecx
 0008747E    add         eax,dword ptr ds:[0B6AD0];gvar_000B6AD0:Integer
 00087484    push        eax
 00087485    mov         eax,[000B5BDC];^Screen:TScreen
 0008748A    mov         eax,dword ptr [eax]
 0008748C    call        TScreen.GetHeight
 00087491    pop         edx
 00087492    xchg        eax,edx
 00087493    mov         ecx,edx
 00087495    cdq
 00087496    idiv        eax,ecx
 00087498    mov         dword ptr ds:[0B6AD0],edx;gvar_000B6AD0:Integer
>0008749E    jmp         0008761F
 000874A3    lea         edx,[ebp-124]
 000874A9    mov         eax,dword ptr [ebx]
 000874AB    call        TObject.ClassName
 000874B0    lea         edx,[ebp-124]
 000874B6    lea         eax,[ebp-4]
 000874B9    call        @LStrFromString
 000874BE    push        0
 000874C0    mov         ecx,87690;'WindowState'
 000874C5    mov         edx,dword ptr [ebp-4]
 000874C8    mov         eax,esi
 000874CA    mov         edi,dword ptr [eax]
 000874CC    call        dword ptr [edi+0C]
 000874CF    sub         eax,1
>000874D2    jb          000874DB
>000874D4    je          000874E6
 000874D6    dec         eax
>000874D7    je          000874F1
>000874D9    jmp         000874FA
 000874DB    xor         edx,edx
 000874DD    mov         eax,ebx
 000874DF    call        TCustomForm.SetWindowState
>000874E4    jmp         000874FA
 000874E6    mov         dl,1
 000874E8    mov         eax,ebx
 000874EA    call        TCustomForm.SetWindowState
>000874EF    jmp         000874FA
 000874F1    mov         dl,2
 000874F3    mov         eax,ebx
 000874F5    call        TCustomForm.SetWindowState
 000874FA    mov         eax,dword ptr [ebx+38]
 000874FD    push        eax
 000874FE    mov         ecx,876A4;'Width'
 00087503    mov         edx,dword ptr [ebp-4]
 00087506    mov         eax,esi
 00087508    mov         edi,dword ptr [eax]
 0008750A    call        dword ptr [edi+0C]
 0008750D    mov         dword ptr [ebp-0C],eax
 00087510    mov         eax,dword ptr [ebx+3C]
 00087513    push        eax
 00087514    mov         ecx,876B4;'Height'
 00087519    mov         edx,dword ptr [ebp-4]
 0008751C    mov         eax,esi
 0008751E    mov         edi,dword ptr [eax]
 00087520    call        dword ptr [edi+0C]
 00087523    mov         dword ptr [ebp-10],eax
 00087526    mov         eax,dword ptr [ebx+34]
 00087529    push        eax
 0008752A    mov         ecx,876C4;'Top'
 0008752F    mov         edx,dword ptr [ebp-4]
 00087532    mov         eax,esi
 00087534    mov         edi,dword ptr [eax]
 00087536    call        dword ptr [edi+0C]
 00087539    mov         dword ptr [ebp-8],eax
 0008753C    mov         eax,dword ptr [ebx+30]
 0008753F    push        eax
 00087540    mov         ecx,876D0;'Left'
 00087545    mov         edx,dword ptr [ebp-4]
 00087548    mov         eax,esi
 0008754A    mov         edi,dword ptr [eax]
 0008754C    call        dword ptr [edi+0C]
 0008754F    mov         edi,eax
 00087551    mov         eax,dword ptr [ebp-0C]
 00087554    push        eax
 00087555    mov         eax,dword ptr [ebp-10]
 00087558    push        eax
 00087559    mov         ecx,dword ptr [ebp-8]
 0008755C    mov         edx,edi
 0008755E    mov         eax,ebx
 00087560    mov         edi,dword ptr [eax]
 00087562    call        dword ptr [edi+80]
 00087568    mov         eax,ebx
 0008756A    call        TComponent.GetComponentCount
 0008756F    dec         eax
 00087570    test        eax,eax
>00087572    jl          0008761F
 00087578    inc         eax
 00087579    mov         dword ptr [ebp-24],eax
 0008757C    mov         dword ptr [ebp-14],0
 00087583    mov         edx,dword ptr [ebp-14]
 00087586    mov         eax,ebx
 00087588    call        TComponent.GetComponent
 0008758D    mov         edx,dword ptr ds:[7E1D4];TCustomGrid
 00087593    call        @IsClass
 00087598    test        al,al
>0008759A    je          000875CC
 0008759C    mov         edx,dword ptr [ebp-14]
 0008759F    mov         eax,ebx
 000875A1    call        TComponent.GetComponent
 000875A6    mov         dword ptr [ebp-18],eax
 000875A9    push        0
 000875AB    lea         eax,[ebp-20]
 000875AE    push        eax
 000875AF    mov         eax,dword ptr [ebp-18]
 000875B2    mov         ecx,dword ptr [eax+8];TComponent.Name:TComponentName
 000875B5    mov         edx,dword ptr [ebp-4]
 000875B8    mov         eax,esi
 000875BA    mov         edi,dword ptr [eax]
 000875BC    call        dword ptr [edi+4]
 000875BF    mov         edx,dword ptr [ebp-20]
 000875C2    mov         eax,dword ptr [ebp-18]
 000875C5    call        0008710C
>000875CA    jmp         00087613
 000875CC    mov         edx,dword ptr [ebp-14]
 000875CF    mov         eax,ebx
 000875D1    call        TComponent.GetComponent
 000875D6    mov         edx,dword ptr ds:[68AB4];TListView
 000875DC    call        @IsClass
 000875E1    test        al,al
>000875E3    je          00087613
 000875E5    mov         edx,dword ptr [ebp-14]
 000875E8    mov         eax,ebx
 000875EA    call        TComponent.GetComponent
 000875EF    mov         dword ptr [ebp-1C],eax
 000875F2    push        0
 000875F4    lea         eax,[ebp-20]
 000875F7    push        eax
 000875F8    mov         eax,dword ptr [ebp-1C]
 000875FB    mov         ecx,dword ptr [eax+8];TComponent.Name:TComponentName
 000875FE    mov         edx,dword ptr [ebp-4]
 00087601    mov         eax,esi
 00087603    mov         edi,dword ptr [eax]
 00087605    call        dword ptr [edi+4]
 00087608    mov         edx,dword ptr [ebp-20]
 0008760B    mov         eax,dword ptr [ebp-1C]
 0008760E    call        00087210
 00087613    inc         dword ptr [ebp-14]
 00087616    dec         dword ptr [ebp-24]
>00087619    jne         00087583
 0008761F    xor         eax,eax
 00087621    pop         edx
 00087622    pop         ecx
 00087623    pop         ecx
 00087624    mov         dword ptr fs:[eax],edx
 00087627    push        87644
 0008762C    lea         eax,[ebp-20]
 0008762F    call        @LStrClr
 00087634    lea         eax,[ebp-4]
 00087637    call        @LStrClr
 0008763C    ret
>0008763D    jmp         @HandleFinally
>00087642    jmp         0008762C
 00087644    pop         edi
 00087645    pop         esi
 00087646    pop         ebx
 00087647    mov         esp,ebp
 00087649    pop         ebp
 0008764A    ret
*}
end;

//000876D8
{*procedure sub_000876D8(?:TForm; ?:?);
begin
 000876D8    push        ebp
 000876D9    mov         ebp,esp
 000876DB    add         esp,0FFFFFFF8
 000876DE    push        ebx
 000876DF    push        esi
 000876E0    mov         dword ptr [ebp-4],edx
 000876E3    mov         ebx,eax
 000876E5    mov         eax,dword ptr [ebp-4]
 000876E8    call        @LStrAddRef
 000876ED    xor         eax,eax
 000876EF    push        ebp
 000876F0    push        8781F
 000876F5    push        dword ptr fs:[eax]
 000876F8    mov         dword ptr fs:[eax],esp
 000876FB    cmp         dword ptr [ebp-4],0
>000876FF    jne         00087709
 00087701    lea         eax,[ebp-4]
 00087704    call        00086D5C
 00087709    mov         ecx,dword ptr [ebp-4]
 0008770C    mov         dl,1
 0008770E    mov         eax,[0007CC58];TCMIniFile
 00087713    call        TCMIniFile.Create;TCMIniFile.Create
 00087718    mov         dword ptr [ebp-8],eax
 0008771B    xor         eax,eax
 0008771D    push        ebp
 0008771E    push        87802
 00087723    push        dword ptr fs:[eax]
 00087726    mov         dword ptr fs:[eax],esp
 00087729    mov         eax,[000B5BDC];^Screen:TScreen
 0008772E    mov         eax,dword ptr [eax]
 00087730    call        TScreen.GetWidth
 00087735    push        eax
 00087736    mov         ecx,87834;'resx'
 0008773B    mov         edx,87844;'display'
 00087740    mov         eax,dword ptr [ebp-8]
 00087743    mov         esi,dword ptr [eax]
 00087745    call        dword ptr [esi+10];TCMIniFile.sub_0007D900
 00087748    mov         eax,[000B5BDC];^Screen:TScreen
 0008774D    mov         eax,dword ptr [eax]
 0008774F    call        TScreen.GetHeight
 00087754    push        eax
 00087755    mov         ecx,87854;'resy'
 0008775A    mov         edx,87844;'display'
 0008775F    mov         eax,dword ptr [ebp-8]
 00087762    mov         esi,dword ptr [eax]
 00087764    call        dword ptr [esi+10];TCMIniFile.sub_0007D900
 00087767    mov         eax,[000B5BDC];^Screen:TScreen
 0008776C    mov         eax,dword ptr [eax]
 0008776E    mov         eax,dword ptr [eax+34];TScreen.FPixelsPerInch:Integer
 00087771    push        eax
 00087772    mov         ecx,87864;'ppi'
 00087777    mov         edx,87844;'display'
 0008777C    mov         eax,dword ptr [ebp-8]
 0008777F    mov         esi,dword ptr [eax]
 00087781    call        dword ptr [esi+10];TCMIniFile.sub_0007D900
 00087784    test        ebx,ebx
>00087786    je          00087794
 00087788    mov         edx,dword ptr [ebp-8]
 0008778B    mov         eax,ebx
 0008778D    call        00086F24
>00087792    jmp         000877EC
 00087794    mov         eax,[000B59E8];^Application:TApplication
 00087799    mov         eax,dword ptr [eax]
 0008779B    call        TComponent.GetComponentCount
 000877A0    mov         esi,eax
 000877A2    dec         esi
 000877A3    test        esi,esi
>000877A5    jl          000877EC
 000877A7    inc         esi
 000877A8    xor         ebx,ebx
 000877AA    mov         eax,[000B59E8];^Application:TApplication
 000877AF    mov         eax,dword ptr [eax]
 000877B1    mov         edx,ebx
 000877B3    call        TComponent.GetComponent
 000877B8    mov         edx,dword ptr ds:[554E4];TForm
 000877BE    call        @IsClass
 000877C3    test        al,al
>000877C5    je          000877E8
 000877C7    mov         eax,[000B59E8];^Application:TApplication
 000877CC    mov         eax,dword ptr [eax]
 000877CE    mov         edx,ebx
 000877D0    call        TComponent.GetComponent
 000877D5    mov         edx,dword ptr ds:[554E4];TForm
 000877DB    call        @AsClass
 000877E0    mov         edx,dword ptr [ebp-8]
 000877E3    call        00086F24
 000877E8    inc         ebx
 000877E9    dec         esi
>000877EA    jne         000877AA
 000877EC    xor         eax,eax
 000877EE    pop         edx
 000877EF    pop         ecx
 000877F0    pop         ecx
 000877F1    mov         dword ptr fs:[eax],edx
 000877F4    push        87809
 000877F9    mov         eax,dword ptr [ebp-8]
 000877FC    call        TObject.Free
 00087801    ret
>00087802    jmp         @HandleFinally
>00087807    jmp         000877F9
 00087809    xor         eax,eax
 0008780B    pop         edx
 0008780C    pop         ecx
 0008780D    pop         ecx
 0008780E    mov         dword ptr fs:[eax],edx
 00087811    push        87826
 00087816    lea         eax,[ebp-4]
 00087819    call        @LStrClr
 0008781E    ret
>0008781F    jmp         @HandleFinally
>00087824    jmp         00087816
 00087826    pop         esi
 00087827    pop         ebx
 00087828    pop         ecx
 00087829    pop         ecx
 0008782A    pop         ebp
 0008782B    ret
end;*}

//00087868
{*procedure sub_00087868(?:TForm; ?:?);
begin
 00087868    push        ebp
 00087869    mov         ebp,esp
 0008786B    add         esp,0FFFFFFF8
 0008786E    push        ebx
 0008786F    push        esi
 00087870    mov         dword ptr [ebp-4],edx
 00087873    mov         ebx,eax
 00087875    mov         eax,dword ptr [ebp-4]
 00087878    call        @LStrAddRef
 0008787D    xor         eax,eax
 0008787F    push        ebp
 00087880    push        87954
 00087885    push        dword ptr fs:[eax]
 00087888    mov         dword ptr fs:[eax],esp
 0008788B    cmp         dword ptr [ebp-4],0
>0008788F    jne         00087899
 00087891    lea         eax,[ebp-4]
 00087894    call        00086D5C
 00087899    mov         ecx,dword ptr [ebp-4]
 0008789C    mov         dl,1
 0008789E    mov         eax,[0007CC58];TCMIniFile
 000878A3    call        TCMIniFile.Create;TCMIniFile.Create
 000878A8    mov         dword ptr [ebp-8],eax
 000878AB    xor         eax,eax
 000878AD    push        ebp
 000878AE    push        87937
 000878B3    push        dword ptr fs:[eax]
 000878B6    mov         dword ptr fs:[eax],esp
 000878B9    test        ebx,ebx
>000878BB    je          000878C9
 000878BD    mov         edx,dword ptr [ebp-8]
 000878C0    mov         eax,ebx
 000878C2    call        0008733C
>000878C7    jmp         00087921
 000878C9    mov         eax,[000B59E8];^Application:TApplication
 000878CE    mov         eax,dword ptr [eax]
 000878D0    call        TComponent.GetComponentCount
 000878D5    mov         esi,eax
 000878D7    dec         esi
 000878D8    test        esi,esi
>000878DA    jl          00087921
 000878DC    inc         esi
 000878DD    xor         ebx,ebx
 000878DF    mov         eax,[000B59E8];^Application:TApplication
 000878E4    mov         eax,dword ptr [eax]
 000878E6    mov         edx,ebx
 000878E8    call        TComponent.GetComponent
 000878ED    mov         edx,dword ptr ds:[554E4];TForm
 000878F3    call        @IsClass
 000878F8    test        al,al
>000878FA    je          0008791D
 000878FC    mov         eax,[000B59E8];^Application:TApplication
 00087901    mov         eax,dword ptr [eax]
 00087903    mov         edx,ebx
 00087905    call        TComponent.GetComponent
 0008790A    mov         edx,dword ptr ds:[554E4];TForm
 00087910    call        @AsClass
 00087915    mov         edx,dword ptr [ebp-8]
 00087918    call        0008733C
 0008791D    inc         ebx
 0008791E    dec         esi
>0008791F    jne         000878DF
 00087921    xor         eax,eax
 00087923    pop         edx
 00087924    pop         ecx
 00087925    pop         ecx
 00087926    mov         dword ptr fs:[eax],edx
 00087929    push        8793E
 0008792E    mov         eax,dword ptr [ebp-8]
 00087931    call        TObject.Free
 00087936    ret
>00087937    jmp         @HandleFinally
>0008793C    jmp         0008792E
 0008793E    xor         eax,eax
 00087940    pop         edx
 00087941    pop         ecx
 00087942    pop         ecx
 00087943    mov         dword ptr fs:[eax],edx
 00087946    push        8795B
 0008794B    lea         eax,[ebp-4]
 0008794E    call        @LStrClr
 00087953    ret
>00087954    jmp         @HandleFinally
>00087959    jmp         0008794B
 0008795B    pop         esi
 0008795C    pop         ebx
 0008795D    pop         ecx
 0008795E    pop         ecx
 0008795F    pop         ebp
 00087960    ret
end;*}

//00087964
procedure sub_00087964(?:TForm);
begin
{*
 00087964    push        ebx
 00087965    push        esi
 00087966    push        edi
 00087967    push        ebp
 00087968    mov         ebp,eax
 0008796A    mov         eax,ebp
 0008796C    call        TComponent.GetComponentCount
 00087971    mov         esi,eax
 00087973    dec         esi
 00087974    test        esi,esi
>00087976    jl          000879BC
 00087978    inc         esi
 00087979    xor         edi,edi
 0008797B    mov         edx,edi
 0008797D    mov         eax,ebp
 0008797F    call        TComponent.GetComponent
 00087984    mov         ebx,eax
 00087986    mov         eax,ebx
 00087988    mov         edx,dword ptr ds:[34260];TLabel
 0008798E    call        @IsClass
 00087993    test        al,al
>00087995    je          000879B8
 00087997    cmp         byte ptr [ebx+11D],0
>0008799E    je          000879B8
 000879A0    xor         edx,edx
 000879A2    mov         eax,ebx
 000879A4    mov         ecx,dword ptr [eax]
 000879A6    call        dword ptr [ecx+90]
 000879AC    mov         dl,1
 000879AE    mov         eax,ebx
 000879B0    mov         ecx,dword ptr [eax]
 000879B2    call        dword ptr [ecx+90]
 000879B8    inc         edi
 000879B9    dec         esi
>000879BA    jne         0008797B
 000879BC    pop         ebp
 000879BD    pop         edi
 000879BE    pop         esi
 000879BF    pop         ebx
 000879C0    ret
*}
end;

//000879C4
procedure sub_000879C4(?:TFormMain);
begin
{*
 000879C4    push        ebx
 000879C5    push        esi
 000879C6    push        edi
 000879C7    push        ebp
 000879C8    mov         ebx,eax
 000879CA    mov         eax,[000B5BDC];^Screen:TScreen
 000879CF    mov         eax,dword ptr [eax]
 000879D1    call        TScreen.GetWidth
 000879D6    mov         esi,eax
 000879D8    sub         esi,dword ptr [ebx+38]
 000879DB    sar         esi,1
>000879DD    jns         000879E2
 000879DF    adc         esi,0
 000879E2    mov         eax,[000B5BDC];^Screen:TScreen
 000879E7    mov         eax,dword ptr [eax]
 000879E9    call        TScreen.GetHeight
 000879EE    mov         edi,eax
 000879F0    mov         ebp,dword ptr [ebx+3C]
 000879F3    sub         edi,ebp
 000879F5    sar         edi,1
>000879F7    jns         000879FC
 000879F9    adc         edi,0
 000879FC    mov         eax,dword ptr [ebx+38]
 000879FF    push        eax
 00087A00    push        ebp
 00087A01    mov         ecx,edi
 00087A03    mov         edx,esi
 00087A05    mov         eax,ebx
 00087A07    mov         ebx,dword ptr [eax]
 00087A09    call        dword ptr [ebx+80]
 00087A0F    pop         ebp
 00087A10    pop         edi
 00087A11    pop         esi
 00087A12    pop         ebx
 00087A13    ret
*}
end;

//00087A14
procedure sub_00087A14(?:TForm);
begin
{*
 00087A14    push        ebx
 00087A15    push        esi
 00087A16    push        edi
 00087A17    mov         ebx,eax
 00087A19    mov         eax,[000B5BDC];^Screen:TScreen
 00087A1E    mov         eax,dword ptr [eax]
 00087A20    mov         eax,dword ptr [eax+60];TScreen.FActiveForm:TForm
 00087A23    test        eax,eax
>00087A25    jne         00087A33
 00087A27    mov         eax,ebx
 00087A29    call        000879C4
>00087A2E    jmp         00087AE8
 00087A33    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00087A39    mov         edx,dword ptr [eax+30];TForm.Left:Integer
 00087A3C    mov         esi,edx
 00087A3E    mov         ecx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00087A44    mov         ecx,dword ptr [eax+38];TForm.Width:Integer
 00087A47    sar         ecx,1
>00087A49    jns         00087A4E
 00087A4B    adc         ecx,0
 00087A4E    add         esi,ecx
 00087A50    mov         ecx,dword ptr [ebx+38]
 00087A53    sar         ecx,1
>00087A55    jns         00087A5A
 00087A57    adc         ecx,0
 00087A5A    sub         esi,ecx
 00087A5C    mov         ecx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00087A62    mov         edi,dword ptr [eax+34];TForm.Top:Integer
 00087A65    mov         ecx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00087A6B    mov         eax,dword ptr [eax+3C];TForm.Height:Integer
 00087A6E    sar         eax,1
>00087A70    jns         00087A75
 00087A72    adc         eax,0
 00087A75    add         edi,eax
 00087A77    mov         eax,dword ptr [ebx+3C]
 00087A7A    sar         eax,1
>00087A7C    jns         00087A81
 00087A7E    adc         eax,0
 00087A81    sub         edi,eax
 00087A83    test        esi,esi
>00087A85    jge         00087A8E
 00087A87    mov         eax,[000B5BDC];^Screen:TScreen
 00087A8C    mov         esi,edx
 00087A8E    test        edi,edi
>00087A90    jge         00087A9F
 00087A92    mov         eax,[000B5BDC];^Screen:TScreen
 00087A97    mov         eax,dword ptr [eax]
 00087A99    mov         eax,dword ptr [eax+60];TScreen.FActiveForm:TForm
 00087A9C    mov         edi,dword ptr [eax+34];TForm.Top:Integer
 00087A9F    mov         eax,[000B5BDC];^Screen:TScreen
 00087AA4    mov         eax,dword ptr [eax]
 00087AA6    call        TScreen.GetWidth
 00087AAB    mov         edx,dword ptr [ebx+38]
 00087AAE    add         edx,esi
 00087AB0    cmp         eax,edx
>00087AB2    jl          00087AC9
 00087AB4    mov         eax,[000B5BDC];^Screen:TScreen
 00087AB9    mov         eax,dword ptr [eax]
 00087ABB    call        TScreen.GetHeight
 00087AC0    mov         edx,dword ptr [ebx+3C]
 00087AC3    add         edx,edi
 00087AC5    cmp         eax,edx
>00087AC7    jge         00087AD2
 00087AC9    mov         eax,ebx
 00087ACB    call        000879C4
>00087AD0    jmp         00087AE8
 00087AD2    mov         eax,dword ptr [ebx+38]
 00087AD5    push        eax
 00087AD6    mov         eax,dword ptr [ebx+3C]
 00087AD9    push        eax
 00087ADA    mov         ecx,edi
 00087ADC    mov         edx,esi
 00087ADE    mov         eax,ebx
 00087AE0    mov         ebx,dword ptr [eax]
 00087AE2    call        dword ptr [ebx+80]
 00087AE8    pop         edi
 00087AE9    pop         esi
 00087AEA    pop         ebx
 00087AEB    ret
*}
end;

//00087AEC
{*procedure sub_00087AEC(?:TStatusBar; ?:?; ?:?);
begin
 00087AEC    push        ebp
 00087AED    mov         ebp,esp
 00087AEF    add         esp,0FFFFFFF4
 00087AF2    push        ebx
 00087AF3    push        esi
 00087AF4    push        edi
 00087AF5    xor         ebx,ebx
 00087AF7    mov         dword ptr [ebp-0C],ebx
 00087AFA    mov         ebx,ecx
 00087AFC    add         ebx,ebx
 00087AFE    inc         ebx
 00087AFF    test        ebx,ebx
>00087B01    js          00087B0A
 00087B03    mov         esi,dword ptr [edx+ebx*4]
 00087B06    dec         ebx
 00087B07    push        esi
>00087B08    jns         00087B03
 00087B0A    mov         edx,esp
 00087B0C    mov         dword ptr [ebp-4],ecx
 00087B0F    mov         esi,edx
 00087B11    mov         edi,eax
 00087B13    xor         eax,eax
 00087B15    push        ebp
 00087B16    push        87BF0
 00087B1B    push        dword ptr fs:[eax]
 00087B1E    mov         dword ptr fs:[eax],esp
 00087B21    xor         ebx,ebx
 00087B23    cmp         ebx,dword ptr [ebp-4]
>00087B26    jg          00087BDA
 00087B2C    cmp         byte ptr [esi+ebx*8+4],0
>00087B31    jne         00087B3B
 00087B33    mov         eax,dword ptr [esi+ebx*8]
 00087B36    mov         dword ptr [ebp-8],eax
>00087B39    jmp         00087B51
 00087B3B    mov         ecx,87C0C;'Error: PanelsAdjust'
 00087B40    mov         dl,1
 00087B42    mov         eax,[000176E8];Exception
 00087B47    call        Exception.Create;Exception.Create
 00087B4C    call        @RaiseExcept
 00087B51    mov         al,byte ptr [esi+ebx*8+0C]
 00087B55    cmp         al,0B
>00087B57    jne         00087B67
 00087B59    lea         edx,[ebp-0C]
 00087B5C    mov         eax,dword ptr [esi+ebx*8+8]
 00087B60    call        StrPas
>00087B65    jmp         00087B89
 00087B67    cmp         al,2
>00087B69    jne         00087B79
 00087B6B    lea         eax,[ebp-0C]
 00087B6E    mov         dl,byte ptr [esi+ebx*8+8]
 00087B72    call        @LStrFromChar
>00087B77    jmp         00087B89
 00087B79    cmp         al,4
>00087B7B    jne         00087B89
 00087B7D    lea         eax,[ebp-0C]
 00087B80    mov         edx,dword ptr [esi+ebx*8+8]
 00087B84    call        @LStrFromString
 00087B89    cmp         dword ptr [ebp-0C],0
>00087B8D    jne         00087BA8
 00087B8F    mov         eax,dword ptr [edi+1EC]
 00087B95    mov         edx,dword ptr [ebp-8]
 00087B98    call        TCoolBands.GetItem
 00087B9D    mov         edx,dword ptr [eax+0C];TCoolBand.FBorderStyle:TBorderStyle
 00087BA0    lea         eax,[ebp-0C]
 00087BA3    call        @LStrLAsg
 00087BA8    add         ebx,2
 00087BAB    mov         eax,dword ptr [edi+1F0]
 00087BB1    mov         edx,dword ptr [ebp-0C]
 00087BB4    call        TCanvas.TextWidth
 00087BB9    add         eax,0A
 00087BBC    push        eax
 00087BBD    mov         eax,dword ptr [edi+1EC]
 00087BC3    mov         edx,dword ptr [ebp-8]
 00087BC6    call        TCoolBands.GetItem
 00087BCB    pop         edx
 00087BCC    call        TStatusPanel.SetWidth
 00087BD1    cmp         ebx,dword ptr [ebp-4]
>00087BD4    jle         00087B2C
 00087BDA    xor         eax,eax
 00087BDC    pop         edx
 00087BDD    pop         ecx
 00087BDE    pop         ecx
 00087BDF    mov         dword ptr fs:[eax],edx
 00087BE2    push        87BF7
 00087BE7    lea         eax,[ebp-0C]
 00087BEA    call        @LStrClr
 00087BEF    ret
>00087BF0    jmp         @HandleFinally
>00087BF5    jmp         00087BE7
 00087BF7    mov         edi,dword ptr [ebp-18]
 00087BFA    mov         esi,dword ptr [ebp-14]
 00087BFD    mov         ebx,dword ptr [ebp-10]
 00087C00    mov         esp,ebp
 00087C02    pop         ebp
 00087C03    ret
end;*}

//00087C20
{*procedure sub_00087C20(?:?; ?:?; ?:?; ?:?);
begin
 00087C20    push        ebp
 00087C21    mov         ebp,esp
 00087C23    add         esp,0FFFFFFF8
 00087C26    push        ebx
 00087C27    push        esi
 00087C28    push        edi
 00087C29    mov         dword ptr [ebp-8],ecx
 00087C2C    mov         edi,edx
 00087C2E    mov         dword ptr [ebp-4],eax
 00087C31    mov         ebx,dword ptr [ebp+8]
 00087C34    mov         eax,dword ptr [ebp-4]
 00087C37    call        @LStrAddRef
 00087C3C    xor         eax,eax
 00087C3E    push        ebp
 00087C3F    push        87CC2
 00087C44    push        dword ptr fs:[eax]
 00087C47    mov         dword ptr fs:[eax],esp
 00087C4A    mov         eax,ebx
 00087C4C    mov         edx,dword ptr [ebp-4]
 00087C4F    call        @LStrLAsg
 00087C54    mov         edx,dword ptr [ebx]
 00087C56    mov         eax,edi
 00087C58    call        TCanvas.TextWidth
 00087C5D    mov         esi,eax
 00087C5F    cmp         esi,dword ptr [ebp-8]
>00087C62    jle         00087CAC
 00087C64    lea         eax,[ebp-4]
 00087C67    push        eax
 00087C68    mov         eax,dword ptr [ebp-4]
 00087C6B    call        @LStrLen
 00087C70    mov         ecx,eax
 00087C72    dec         ecx
 00087C73    mov         edx,1
 00087C78    mov         eax,dword ptr [ebp-4]
 00087C7B    call        @LStrCopy
 00087C80    mov         eax,ebx
 00087C82    mov         ecx,87CDC;'...'
 00087C87    mov         edx,dword ptr [ebp-4]
 00087C8A    call        @LStrCat3
 00087C8F    mov         edx,dword ptr [ebx]
 00087C91    mov         eax,edi
 00087C93    call        TCanvas.TextWidth
 00087C98    mov         esi,eax
 00087C9A    cmp         esi,dword ptr [ebp-8]
>00087C9D    jle         00087CAC
 00087C9F    mov         eax,dword ptr [ebp-4]
 00087CA2    call        @LStrLen
 00087CA7    cmp         eax,2
>00087CAA    jg          00087C64
 00087CAC    xor         eax,eax
 00087CAE    pop         edx
 00087CAF    pop         ecx
 00087CB0    pop         ecx
 00087CB1    mov         dword ptr fs:[eax],edx
 00087CB4    push        87CC9
 00087CB9    lea         eax,[ebp-4]
 00087CBC    call        @LStrClr
 00087CC1    ret
>00087CC2    jmp         @HandleFinally
>00087CC7    jmp         00087CB9
 00087CC9    pop         edi
 00087CCA    pop         esi
 00087CCB    pop         ebx
 00087CCC    pop         ecx
 00087CCD    pop         ecx
 00087CCE    pop         ebp
 00087CCF    ret         4
end;*}

//00087CE0
{*procedure sub_00087CE0(?:TListBox; ?:?);
begin
 00087CE0    push        ebp
 00087CE1    mov         ebp,esp
 00087CE3    add         esp,0FFFFFFF0
 00087CE6    push        ebx
 00087CE7    push        esi
 00087CE8    xor         ecx,ecx
 00087CEA    mov         dword ptr [ebp-10],ecx
 00087CED    mov         dword ptr [ebp-4],edx
 00087CF0    mov         ebx,eax
 00087CF2    xor         eax,eax
 00087CF4    push        ebp
 00087CF5    push        87D9F
 00087CFA    push        dword ptr fs:[eax]
 00087CFD    mov         dword ptr fs:[eax],esp
 00087D00    cmp         dword ptr [ebp-4],0
>00087D04    jl          00087D20
 00087D06    push        0
 00087D08    mov         eax,dword ptr [ebp-4]
 00087D0B    push        eax
 00087D0C    push        194
 00087D11    mov         eax,ebx
 00087D13    call        TWinControl.GetHandle
 00087D18    push        eax
 00087D19    call        user32.SendMessageA
>00087D1E    jmp         00087D89
 00087D20    mov         eax,dword ptr [ebx+1EC]
 00087D26    mov         edx,dword ptr [eax]
 00087D28    call        dword ptr [edx+14]
 00087D2B    dec         eax
 00087D2C    test        eax,eax
>00087D2E    jl          00087D6A
 00087D30    inc         eax
 00087D31    mov         dword ptr [ebp-0C],eax
 00087D34    mov         dword ptr [ebp-8],0
 00087D3B    lea         ecx,[ebp-10]
 00087D3E    mov         edx,dword ptr [ebp-8]
 00087D41    mov         eax,dword ptr [ebx+1EC]
 00087D47    mov         esi,dword ptr [eax]
 00087D49    call        dword ptr [esi+0C]
 00087D4C    mov         edx,dword ptr [ebp-10]
 00087D4F    mov         eax,dword ptr [ebx+1F4]
 00087D55    call        TCanvas.TextWidth
 00087D5A    cmp         eax,dword ptr [ebp-4]
>00087D5D    jle         00087D62
 00087D5F    mov         dword ptr [ebp-4],eax
 00087D62    inc         dword ptr [ebp-8]
 00087D65    dec         dword ptr [ebp-0C]
>00087D68    jne         00087D3B
 00087D6A    push        0
 00087D6C    push        20
 00087D6E    call        user32.GetSystemMetrics
 00087D73    add         eax,dword ptr [ebp-4]
 00087D76    push        eax
 00087D77    push        194
 00087D7C    mov         eax,ebx
 00087D7E    call        TWinControl.GetHandle
 00087D83    push        eax
 00087D84    call        user32.SendMessageA
 00087D89    xor         eax,eax
 00087D8B    pop         edx
 00087D8C    pop         ecx
 00087D8D    pop         ecx
 00087D8E    mov         dword ptr fs:[eax],edx
 00087D91    push        87DA6
 00087D96    lea         eax,[ebp-10]
 00087D99    call        @LStrClr
 00087D9E    ret
>00087D9F    jmp         @HandleFinally
>00087DA4    jmp         00087D96
 00087DA6    pop         esi
 00087DA7    pop         ebx
 00087DA8    mov         esp,ebp
 00087DAA    pop         ebp
 00087DAB    ret
end;*}

//00087DAC
{*function sub_00087DAC(?:?; ?:TPoint):?;
begin
 00087DAC    push        ebx
 00087DAD    push        esi
 00087DAE    push        edi
 00087DAF    push        ebp
 00087DB0    push        ecx
 00087DB1    mov         dword ptr [esp],edx
 00087DB4    mov         ebp,eax
 00087DB6    xor         edi,edi
 00087DB8    mov         eax,dword ptr [ebp+1EC]
 00087DBE    call        TCollection.GetCount
 00087DC3    mov         ebx,eax
 00087DC5    dec         ebx
 00087DC6    test        ebx,ebx
>00087DC8    jl          00087DE6
 00087DCA    inc         ebx
 00087DCB    xor         esi,esi
 00087DCD    mov         eax,dword ptr [ebp+1EC]
 00087DD3    mov         edx,esi
 00087DD5    call        TCoolBands.GetItem
 00087DDA    add         edi,dword ptr [eax+10];TCoolBand.FHorizontalOnly:Boolean
 00087DDD    cmp         edi,dword ptr [esp]
>00087DE0    jg          00087DE6
 00087DE2    inc         esi
 00087DE3    dec         ebx
>00087DE4    jne         00087DCD
 00087DE6    mov         eax,esi
 00087DE8    pop         edx
 00087DE9    pop         ebp
 00087DEA    pop         edi
 00087DEB    pop         esi
 00087DEC    pop         ebx
 00087DED    ret
end;*}

//00087DF0
{*function sub_00087DF0(?:?; ?:?):?;
begin
 00087DF0    push        ebx
 00087DF1    push        esi
 00087DF2    push        edi
 00087DF3    push        ebp
 00087DF4    mov         ebp,eax
 00087DF6    xor         edi,edi
 00087DF8    mov         ebx,edx
 00087DFA    dec         ebx
 00087DFB    test        ebx,ebx
>00087DFD    jl          00087E1B
 00087DFF    inc         ebx
 00087E00    xor         esi,esi
 00087E02    mov         eax,dword ptr [ebp+1EC]
 00087E08    mov         edx,esi
 00087E0A    call        TCoolBands.GetItem
 00087E0F    mov         eax,dword ptr [eax+10];TCoolBand.FHorizontalOnly:Boolean
 00087E12    add         eax,4
 00087E15    add         edi,eax
 00087E17    inc         esi
 00087E18    dec         ebx
>00087E19    jne         00087E02
 00087E1B    mov         eax,dword ptr [ebp+38]
 00087E1E    sub         eax,edi
 00087E20    pop         ebp
 00087E21    pop         edi
 00087E22    pop         esi
 00087E23    pop         ebx
 00087E24    ret
end;*}

//00087E28
{*procedure sub_00087E28(?:?; ?:?);
begin
 00087E28    push        ebp
 00087E29    mov         ebp,esp
 00087E2B    add         esp,0FFFFFFF4
 00087E2E    push        ebx
 00087E2F    push        esi
 00087E30    push        edi
 00087E31    mov         ecx,edx
 00087E33    test        ecx,ecx
>00087E35    js          00087E3E
 00087E37    mov         ebx,dword ptr [eax+ecx*4]
 00087E3A    dec         ecx
 00087E3B    push        ebx
>00087E3C    jns         00087E37
 00087E3E    mov         eax,esp
 00087E40    mov         dword ptr [ebp-8],edx
 00087E43    mov         dword ptr [ebp-4],eax
 00087E46    xor         eax,eax
 00087E48    mov         dword ptr [ebp-0C],eax
 00087E4B    mov         eax,dword ptr [ebp-0C]
 00087E4E    cmp         eax,dword ptr [ebp-8]
>00087E51    jge         00087F2E
 00087E57    mov         eax,dword ptr [ebp-4]
 00087E5A    mov         edx,dword ptr [ebp-0C]
 00087E5D    mov         ebx,dword ptr [eax+edx*4]
 00087E60    mov         eax,ebx
 00087E62    mov         edx,dword ptr ds:[378C0];TRadioButton
 00087E68    call        @IsClass
 00087E6D    test        al,al
>00087E6F    je          00087F1E
 00087E75    mov         eax,dword ptr [ebp-4]
 00087E78    mov         edx,dword ptr [ebp-0C]
 00087E7B    mov         eax,ebx
 00087E7D    mov         edx,dword ptr ds:[378C0];TRadioButton
 00087E83    call        @AsClass
 00087E88    mov         esi,eax
 00087E8A    mov         eax,dword ptr [ebp-4]
 00087E8D    mov         edx,dword ptr [ebp-0C]
 00087E90    mov         ebx,dword ptr [eax+edx*4+4]
 00087E94    mov         eax,ebx
 00087E96    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00087E9C    call        @IsClass
 00087EA1    test        al,al
>00087EA3    je          00087F1E
 00087EA5    mov         eax,dword ptr [ebp-4]
 00087EA8    mov         edx,dword ptr [ebp-0C]
 00087EAB    mov         eax,esi
 00087EAD    mov         edx,dword ptr [eax]
 00087EAF    call        dword ptr [edx+0B8];TRadioButton.GetChecked
 00087EB5    test        al,al
>00087EB7    je          00087F09
 00087EB9    mov         dl,1
 00087EBB    mov         eax,ebx
 00087EBD    mov         ecx,dword ptr [eax]
 00087EBF    call        dword ptr [ecx+60]
 00087EC2    mov         edx,80000005
 00087EC7    mov         esi,ebx
 00087EC9    mov         eax,esi
 00087ECB    call        TControl.SetColor
 00087ED0    xor         eax,eax
 00087ED2    push        ebp
 00087ED3    push        87EFD
 00087ED8    push        dword ptr fs:[eax]
 00087EDB    mov         dword ptr fs:[eax],esp
 00087EDE    mov         eax,esi
 00087EE0    call        TWinControl.HandleAllocated
 00087EE5    test        al,al
>00087EE7    je          00087EF3
 00087EE9    mov         eax,esi
 00087EEB    mov         edx,dword ptr [eax]
 00087EED    call        dword ptr [edx+0B4]
 00087EF3    xor         eax,eax
 00087EF5    pop         edx
 00087EF6    pop         ecx
 00087EF7    pop         ecx
 00087EF8    mov         dword ptr fs:[eax],edx
>00087EFB    jmp         00087F1E
>00087EFD    jmp         @HandleAnyException
 00087F02    call        @DoneExcept
>00087F07    jmp         00087F1E
 00087F09    xor         edx,edx
 00087F0B    mov         eax,ebx
 00087F0D    mov         ecx,dword ptr [eax]
 00087F0F    call        dword ptr [ecx+60]
 00087F12    mov         edx,8000000F
 00087F17    mov         eax,ebx
 00087F19    call        TControl.SetColor
 00087F1E    add         dword ptr [ebp-0C],2
 00087F22    mov         eax,dword ptr [ebp-0C]
 00087F25    cmp         eax,dword ptr [ebp-8]
>00087F28    jl          00087E57
 00087F2E    mov         edi,dword ptr [ebp-18]
 00087F31    mov         esi,dword ptr [ebp-14]
 00087F34    mov         ebx,dword ptr [ebp-10]
 00087F37    mov         esp,ebp
 00087F39    pop         ebp
 00087F3A    ret
end;*}

//00087F3C
{*procedure sub_00087F3C(?:?; ?:?; ?:?; ?:?);
begin
 00087F3C    push        ebp
 00087F3D    mov         ebp,esp
 00087F3F    add         esp,0FFFFFFF4
 00087F42    push        ebx
 00087F43    push        esi
 00087F44    push        edi
 00087F45    mov         ebx,dword ptr [ebp+8]
 00087F48    test        ebx,ebx
>00087F4A    js          00087F53
 00087F4C    mov         esi,dword ptr [ecx+ebx*4]
 00087F4F    dec         ebx
 00087F50    push        esi
>00087F51    jns         00087F4C
 00087F53    mov         ecx,esp
 00087F55    mov         dword ptr [ebp-0C],ecx
 00087F58    mov         dword ptr [ebp-8],edx
 00087F5B    mov         byte ptr [ebp-1],al
 00087F5E    mov         eax,dword ptr [ebp+8]
 00087F61    cmp         dword ptr [ebp-8],0
>00087F65    jl          00087FA3
 00087F67    cmp         eax,dword ptr [ebp-8]
>00087F6A    jl          00087FA3
 00087F6C    mov         esi,eax
 00087F6E    test        esi,esi
>00087F70    jl          00087FA3
 00087F72    inc         esi
 00087F73    xor         edi,edi
 00087F75    mov         ebx,dword ptr [ebp-0C]
 00087F78    cmp         edi,dword ptr [ebp-8]
>00087F7B    jne         00087F8C
 00087F7D    mov         dl,byte ptr [ebp-1]
 00087F80    mov         eax,dword ptr [ebx]
 00087F82    mov         ecx,dword ptr [eax]
 00087F84    call        dword ptr [ecx+0BC]
>00087F8A    jmp         00087F9C
 00087F8C    mov         dl,byte ptr [ebp-1]
 00087F8F    xor         dl,1
 00087F92    mov         eax,dword ptr [ebx]
 00087F94    mov         ecx,dword ptr [eax]
 00087F96    call        dword ptr [ecx+0BC]
 00087F9C    inc         edi
 00087F9D    add         ebx,4
 00087FA0    dec         esi
>00087FA1    jne         00087F78
 00087FA3    mov         edi,dword ptr [ebp-18]
 00087FA6    mov         esi,dword ptr [ebp-14]
 00087FA9    mov         ebx,dword ptr [ebp-10]
 00087FAC    mov         esp,ebp
 00087FAE    pop         ebp
 00087FAF    ret         4
end;*}

//00087FB4
{*procedure sub_00087FB4(?:?; ?:?);
begin
 00087FB4    push        ebp
 00087FB5    mov         ebp,esp
 00087FB7    push        ecx
 00087FB8    push        ebx
 00087FB9    push        esi
 00087FBA    push        edi
 00087FBB    mov         ecx,edx
 00087FBD    test        ecx,ecx
>00087FBF    js          00087FC8
 00087FC1    mov         ebx,dword ptr [eax+ecx*4]
 00087FC4    dec         ecx
 00087FC5    push        ebx
>00087FC6    jns         00087FC1
 00087FC8    mov         eax,esp
 00087FCA    mov         dword ptr [ebp-4],0FFFFFFFF
 00087FD1    mov         esi,edx
 00087FD3    test        esi,esi
>00087FD5    jl          00087FF6
 00087FD7    inc         esi
 00087FD8    xor         edi,edi
 00087FDA    mov         ebx,eax
 00087FDC    mov         eax,dword ptr [ebx]
 00087FDE    mov         edx,dword ptr [eax]
 00087FE0    call        dword ptr [edx+0B8]
 00087FE6    test        al,al
>00087FE8    je          00087FEF
 00087FEA    mov         dword ptr [ebp-4],edi
>00087FED    jmp         00087FF6
 00087FEF    inc         edi
 00087FF0    add         ebx,4
 00087FF3    dec         esi
>00087FF4    jne         00087FDC
 00087FF6    mov         eax,dword ptr [ebp-4]
 00087FF9    mov         edi,dword ptr [ebp-10]
 00087FFC    mov         esi,dword ptr [ebp-0C]
 00087FFF    mov         ebx,dword ptr [ebp-8]
 00088002    mov         esp,ebp
 00088004    pop         ebp
 00088005    ret
end;*}

//00088008
{*function sub_00088008:?;
begin
 00088008    push        ebx
 00088009    push        esi
 0008800A    push        edi
 0008800B    mov         eax,[000B5BDC];^Screen:TScreen
 00088010    mov         eax,dword ptr [eax]
 00088012    mov         eax,dword ptr [eax+60];TScreen.FActiveForm:TForm
 00088015    test        eax,eax
>00088017    je          00088023
 00088019    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 0008801F    mov         edi,eax
>00088021    jmp         00088063
 00088023    mov         eax,[000B5BDC];^Screen:TScreen
 00088028    mov         eax,dword ptr [eax]
 0008802A    call        TScreen.GetFormCount
 0008802F    mov         esi,eax
 00088031    dec         esi
 00088032    test        esi,esi
>00088034    jl          00088063
 00088036    inc         esi
 00088037    xor         ebx,ebx
 00088039    mov         eax,[000B5BDC];^Screen:TScreen
 0008803E    mov         eax,dword ptr [eax]
 00088040    mov         edx,ebx
 00088042    call        TScreen.GetForm
 00088047    cmp         byte ptr [eax+47],0;TForm.FVisible:Boolean
>0008804B    je          0008805F
 0008804D    mov         eax,[000B5BDC];^Screen:TScreen
 00088052    mov         eax,dword ptr [eax]
 00088054    mov         edx,ebx
 00088056    call        TScreen.GetForm
 0008805B    mov         edi,eax
>0008805D    jmp         00088063
 0008805F    inc         ebx
 00088060    dec         esi
>00088061    jne         00088039
 00088063    mov         eax,edi
 00088065    pop         edi
 00088066    pop         esi
 00088067    pop         ebx
 00088068    ret
end;*}

//0008806C
{*function sub_0008806C(?:?; ?:?):?;
begin
 0008806C    push        ebx
 0008806D    push        esi
 0008806E    push        edi
 0008806F    push        ebp
 00088070    add         esp,0FFFFFFF8
 00088073    mov         dword ptr [esp],edx
 00088076    mov         edi,eax
 00088078    xor         eax,eax
 0008807A    mov         dword ptr [esp+4],eax
 0008807E    mov         eax,edi
 00088080    call        TComponent.GetComponentCount
 00088085    mov         esi,eax
 00088087    dec         esi
 00088088    test        esi,esi
>0008808A    jl          000880D0
 0008808C    inc         esi
 0008808D    xor         ebx,ebx
 0008808F    mov         edx,ebx
 00088091    mov         eax,edi
 00088093    call        TComponent.GetComponent
 00088098    mov         edx,dword ptr ds:[371C8];TCheckBox
 0008809E    call        @IsClass
 000880A3    test        al,al
>000880A5    je          000880CC
 000880A7    mov         edx,ebx
 000880A9    mov         eax,edi
 000880AB    call        TComponent.GetComponent
 000880B0    mov         ebp,eax
 000880B2    mov         eax,dword ptr [ebp+0C];TComponent.Tag:Integer
 000880B5    cmp         eax,dword ptr [esp]
>000880B8    jne         000880CC
 000880BA    mov         eax,ebp
 000880BC    mov         edx,dword ptr [eax]
 000880BE    call        dword ptr [edx+0B8]
 000880C4    test        al,al
>000880C6    je          000880CC
 000880C8    inc         dword ptr [esp+4]
 000880CC    inc         ebx
 000880CD    dec         esi
>000880CE    jne         0008808F
 000880D0    mov         eax,dword ptr [esp+4]
 000880D4    pop         ecx
 000880D5    pop         edx
 000880D6    pop         ebp
 000880D7    pop         edi
 000880D8    pop         esi
 000880D9    pop         ebx
 000880DA    ret
end;*}

//000880DC
{*procedure sub_000880DC(?:?; ?:?);
begin
 000880DC    push        ebx
 000880DD    push        esi
 000880DE    push        edi
 000880DF    push        ebp
 000880E0    mov         ebp,edx
 000880E2    mov         edi,eax
 000880E4    mov         eax,edi
 000880E6    call        TPageControl.GetPageCount
 000880EB    mov         esi,eax
 000880ED    dec         esi
 000880EE    test        esi,esi
>000880F0    jl          0008811F
 000880F2    inc         esi
 000880F3    xor         ebx,ebx
 000880F5    mov         edx,ebx
 000880F7    mov         eax,edi
 000880F9    call        TPageControl.GetPage
 000880FE    call        TTabSheet.GetPageIndex
 00088103    cmp         ebp,eax
>00088105    jne         0008811B
 00088107    mov         edx,ebx
 00088109    mov         eax,edi
 0008810B    call        TPageControl.GetPage
 00088110    mov         edx,eax
 00088112    mov         eax,edi
 00088114    call        TPageControl.SetActivePage
>00088119    jmp         0008811F
 0008811B    inc         ebx
 0008811C    dec         esi
>0008811D    jne         000880F5
 0008811F    pop         ebp
 00088120    pop         edi
 00088121    pop         esi
 00088122    pop         ebx
 00088123    ret
end;*}

end.