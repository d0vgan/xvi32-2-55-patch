//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit UOSD;

interface

uses
  SysUtils, Classes, Dialogs, StdCtrls;

type
  TFormOSE = class(TForm)
  published
    SaveDialog1:TSaveDialog;//f2C4
    CheckBoxReadOnly:TCheckBox;//f2C8
    OpenDialog1:TOpenDialog;//f2CC
    EditDateiName:TEdit;//f2D0
    procedure FormDestroy(Sender:TObject);//000A153C
    procedure FormCreate(Sender:TObject);//000A1524
  public
    f2DC:String;//f2DC
    f2E0:TStringList;//f2E0
  end;
    //procedure sub_000A10F8(?:?; ?:?);//000A10F8
    //function sub_000A1204(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//000A1204

implementation

{$R *.DFM}

//000A10F8
{*procedure sub_000A10F8(?:?; ?:?);
begin
 000A10F8    push        ebp
 000A10F9    mov         ebp,esp
 000A10FB    push        0
 000A10FD    push        0
 000A10FF    push        0
 000A1101    push        ebx
 000A1102    push        esi
 000A1103    push        edi
 000A1104    mov         esi,edx
 000A1106    mov         dword ptr [ebp-4],eax
 000A1109    mov         eax,dword ptr [ebp-4]
 000A110C    call        @LStrAddRef
 000A1111    xor         eax,eax
 000A1113    push        ebp
 000A1114    push        0A11DC
 000A1119    push        dword ptr fs:[eax]
 000A111C    mov         dword ptr fs:[eax],esp
 000A111F    mov         eax,esi
 000A1121    call        @LStrClr
 000A1126    mov         edx,dword ptr [ebp-4]
 000A1129    mov         eax,0A11F4;','
 000A112E    call        @LStrPos
 000A1133    mov         ebx,eax
 000A1135    test        ebx,ebx
>000A1137    jle         000A11A2
 000A1139    push        dword ptr [esi]
 000A113B    lea         eax,[ebp-8]
 000A113E    push        eax
 000A113F    mov         edi,ebx
 000A1141    dec         edi
 000A1142    mov         ecx,edi
 000A1144    mov         edx,1
 000A1149    mov         eax,dword ptr [ebp-4]
 000A114C    call        @LStrCopy
 000A1151    push        dword ptr [ebp-8]
 000A1154    push        0A1200;'|'
 000A1159    lea         eax,[ebp-0C]
 000A115C    push        eax
 000A115D    mov         ecx,edi
 000A115F    mov         edx,1
 000A1164    mov         eax,dword ptr [ebp-4]
 000A1167    call        @LStrCopy
 000A116C    push        dword ptr [ebp-0C]
 000A116F    push        0A1200;'|'
 000A1174    mov         eax,esi
 000A1176    mov         edx,5
 000A117B    call        @LStrCatN
 000A1180    lea         eax,[ebp-4]
 000A1183    mov         ecx,ebx
 000A1185    mov         edx,1
 000A118A    call        @LStrDelete
 000A118F    mov         edx,dword ptr [ebp-4]
 000A1192    mov         eax,0A11F4;','
 000A1197    call        @LStrPos
 000A119C    mov         ebx,eax
 000A119E    test        ebx,ebx
>000A11A0    jg          000A1139
 000A11A2    cmp         dword ptr [ebp-4],0
>000A11A6    je          000A11C1
 000A11A8    push        dword ptr [esi]
 000A11AA    push        dword ptr [ebp-4]
 000A11AD    push        0A1200;'|'
 000A11B2    push        dword ptr [ebp-4]
 000A11B5    mov         eax,esi
 000A11B7    mov         edx,4
 000A11BC    call        @LStrCatN
 000A11C1    xor         eax,eax
 000A11C3    pop         edx
 000A11C4    pop         ecx
 000A11C5    pop         ecx
 000A11C6    mov         dword ptr fs:[eax],edx
 000A11C9    push        0A11E3
 000A11CE    lea         eax,[ebp-0C]
 000A11D1    mov         edx,3
 000A11D6    call        @LStrArrayClr
 000A11DB    ret
>000A11DC    jmp         @HandleFinally
>000A11E1    jmp         000A11CE
 000A11E3    pop         edi
 000A11E4    pop         esi
 000A11E5    pop         ebx
 000A11E6    mov         esp,ebp
 000A11E8    pop         ebp
 000A11E9    ret
end;*}

//000A1204
{*function sub_000A1204(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 000A1204    push        ebp
 000A1205    mov         ebp,esp
 000A1207    push        0
 000A1209    push        0
 000A120B    push        0
 000A120D    push        0
 000A120F    push        ebx
 000A1210    push        esi
 000A1211    push        edi
 000A1212    mov         dword ptr [ebp-4],ecx
 000A1215    mov         esi,edx
 000A1217    mov         ebx,eax
 000A1219    mov         eax,dword ptr [ebp-4]
 000A121C    call        @LStrAddRef
 000A1221    mov         eax,dword ptr [ebp+1C]
 000A1224    call        @LStrAddRef
 000A1229    xor         eax,eax
 000A122B    push        ebp
 000A122C    push        0A14DF
 000A1231    push        dword ptr fs:[eax]
 000A1234    mov         dword ptr fs:[eax],esp
 000A1237    mov         eax,dword ptr [ebx+2E0]
 000A123D    mov         edx,dword ptr [eax]
 000A123F    call        dword ptr [edx+40]
 000A1242    lea         eax,[ebp-8]
 000A1245    mov         edx,dword ptr [ebp+1C]
 000A1248    call        @LStrLAsg
 000A124D    lea         edx,[ebp-0C]
 000A1250    mov         eax,dword ptr [ebp+1C]
 000A1253    call        000A10F8
 000A1258    mov         edx,dword ptr [ebp-0C]
 000A125B    lea         eax,[ebp+1C]
 000A125E    call        @LStrLAsg
 000A1263    mov         eax,esi
 000A1265    test        eax,eax
>000A1267    je          000A1272
 000A1269    sub         eax,3
>000A126C    jne         000A13AA
 000A1272    mov         eax,dword ptr [ebx+2CC]
 000A1278    add         eax,64
 000A127B    mov         edx,dword ptr [ebp-4]
 000A127E    call        @LStrAsg
 000A1283    mov         edx,dword ptr [ebp+20]
 000A1286    mov         edx,dword ptr [edx]
 000A1288    mov         eax,dword ptr [ebx+2CC]
 000A128E    call        TOpenDialog.SetInitialDir
 000A1293    mov         eax,dword ptr [ebx+2CC]
 000A1299    add         eax,54
 000A129C    mov         edx,dword ptr [ebp+1C]
 000A129F    call        @LStrAsg
 000A12A4    mov         edx,dword ptr [ebp-8]
 000A12A7    mov         eax,0A14FC;','
 000A12AC    call        @LStrPos
 000A12B1    test        eax,eax
>000A12B3    jne         000A12FC
 000A12B5    mov         eax,dword ptr [ebp-8]
 000A12B8    mov         edx,0A1508;'*.*'
 000A12BD    call        @LStrCmp
>000A12C2    je          000A12FC
 000A12C4    mov         edx,dword ptr [ebp-8]
 000A12C7    mov         eax,0A1514;'.'
 000A12CC    call        @LStrPos
 000A12D1    test        eax,eax
>000A12D3    jle         000A12FC
 000A12D5    mov         eax,dword ptr [ebx+2CC]
 000A12DB    add         eax,68
 000A12DE    push        eax
 000A12DF    mov         edx,dword ptr [ebp-8]
 000A12E2    mov         eax,0A1514;'.'
 000A12E7    call        @LStrPos
 000A12EC    mov         edx,eax
 000A12EE    inc         edx
 000A12EF    mov         ecx,0FF
 000A12F4    mov         eax,dword ptr [ebp-8]
 000A12F7    call        @LStrCopy
 000A12FC    mov         edi,dword ptr [ebx+2CC]
 000A1302    mov         eax,[000A1518];0x0 gvar_000A1518
 000A1307    mov         dword ptr [edi+50],eax
 000A130A    cmp         esi,3
>000A130D    jne         000A1321
 000A130F    mov         eax,dword ptr [ebx+2CC]
 000A1315    mov         eax,dword ptr [eax+50]
 000A1318    or          eax,dword ptr ds:[0A151C];0x40 gvar_000A151C
 000A131E    mov         dword ptr [edi+50],eax
 000A1321    mov         edi,dword ptr [ebx+2CC]
 000A1327    mov         eax,dword ptr [ebp+14]
 000A132A    mov         dword ptr [edi+2C],eax
 000A132D    mov         eax,edi
 000A132F    mov         edx,dword ptr [eax]
 000A1331    call        dword ptr [edx+3C]
 000A1334    test        al,al
>000A1336    je          000A13A0
 000A1338    lea         edx,[ebp-10]
 000A133B    mov         eax,dword ptr [ebx+2CC]
 000A1341    call        TOpenDialog.GetFileName
 000A1346    mov         edx,dword ptr [ebp-10]
 000A1349    mov         eax,[000B7070];gvar_000B7070:TFormOSE
 000A134E    add         eax,2DC
 000A1353    call        @LStrAsg
 000A1358    mov         eax,dword ptr [ebx+2CC]
 000A135E    test        byte ptr [eax+50],1
 000A1362    setne       dl
 000A1365    mov         eax,[000B7070];gvar_000B7070:TFormOSE
 000A136A    mov         eax,dword ptr [eax+2C8]
 000A1370    mov         ecx,dword ptr [eax]
 000A1372    call        dword ptr [ecx+0BC]
 000A1378    cmp         esi,3
>000A137B    jne         000A1396
 000A137D    mov         eax,dword ptr [ebx+2CC]
 000A1383    mov         edx,dword ptr [eax+70]
 000A1386    mov         eax,[000B7070];gvar_000B7070:TFormOSE
 000A138B    mov         eax,dword ptr [eax+2E0]
 000A1391    mov         ecx,dword ptr [eax]
 000A1393    call        dword ptr [ecx+8]
 000A1396    mov         edi,1
>000A139B    jmp         000A14B4
 000A13A0    mov         edi,2
>000A13A5    jmp         000A14B4
 000A13AA    cmp         esi,1
>000A13AD    jne         000A14B1
 000A13B3    mov         eax,dword ptr [ebx+2C4]
 000A13B9    add         eax,64
 000A13BC    mov         edx,dword ptr [ebp-4]
 000A13BF    call        @LStrAsg
 000A13C4    mov         edx,dword ptr [ebp+20]
 000A13C7    mov         edx,dword ptr [edx]
 000A13C9    mov         eax,dword ptr [ebx+2C4]
 000A13CF    call        TOpenDialog.SetInitialDir
 000A13D4    mov         eax,dword ptr [ebx+2C4]
 000A13DA    add         eax,54
 000A13DD    mov         edx,dword ptr [ebp+1C]
 000A13E0    call        @LStrAsg
 000A13E5    mov         eax,dword ptr [ebx+2C4]
 000A13EB    mov         edx,dword ptr ds:[0A1520];0x6 gvar_000A1520
 000A13F1    mov         dword ptr [eax+50],edx
 000A13F4    mov         edx,dword ptr [ebp-8]
 000A13F7    mov         eax,0A14FC;','
 000A13FC    call        @LStrPos
 000A1401    test        eax,eax
>000A1403    jne         000A144C
 000A1405    mov         eax,dword ptr [ebp-8]
 000A1408    mov         edx,0A1508;'*.*'
 000A140D    call        @LStrCmp
>000A1412    je          000A144C
 000A1414    mov         edx,dword ptr [ebp-8]
 000A1417    mov         eax,0A1514;'.'
 000A141C    call        @LStrPos
 000A1421    test        eax,eax
>000A1423    jle         000A144C
 000A1425    mov         eax,dword ptr [ebx+2C4]
 000A142B    add         eax,68
 000A142E    push        eax
 000A142F    mov         edx,dword ptr [ebp-8]
 000A1432    mov         eax,0A1514;'.'
 000A1437    call        @LStrPos
 000A143C    mov         edx,eax
 000A143E    inc         edx
 000A143F    mov         ecx,0FF
 000A1444    mov         eax,dword ptr [ebp-8]
 000A1447    call        @LStrCopy
 000A144C    mov         esi,dword ptr [ebx+2C4]
 000A1452    mov         eax,dword ptr [ebp+14]
 000A1455    mov         dword ptr [esi+2C],eax
 000A1458    mov         eax,esi
 000A145A    mov         edx,dword ptr [eax]
 000A145C    call        dword ptr [edx+3C]
 000A145F    test        al,al
>000A1461    je          000A14AA
 000A1463    lea         edx,[ebp-10]
 000A1466    mov         eax,dword ptr [ebx+2C4]
 000A146C    call        TOpenDialog.GetFileName
 000A1471    mov         edx,dword ptr [ebp-10]
 000A1474    mov         eax,[000B7070];gvar_000B7070:TFormOSE
 000A1479    add         eax,2DC
 000A147E    call        @LStrAsg
 000A1483    mov         eax,dword ptr [ebx+2C4]
 000A1489    test        byte ptr [eax+50],1
 000A148D    setne       dl
 000A1490    mov         eax,[000B7070];gvar_000B7070:TFormOSE
 000A1495    mov         eax,dword ptr [eax+2C8]
 000A149B    mov         ecx,dword ptr [eax]
 000A149D    call        dword ptr [ecx+0BC]
 000A14A3    mov         edi,1
>000A14A8    jmp         000A14B4
 000A14AA    mov         edi,2
>000A14AF    jmp         000A14B4
 000A14B1    cmp         esi,2
 000A14B4    xor         eax,eax
 000A14B6    pop         edx
 000A14B7    pop         ecx
 000A14B8    pop         ecx
 000A14B9    mov         dword ptr fs:[eax],edx
 000A14BC    push        0A14E6
 000A14C1    lea         eax,[ebp-10]
 000A14C4    call        @LStrClr
 000A14C9    lea         eax,[ebp-0C]
 000A14CC    mov         edx,3
 000A14D1    call        @LStrArrayClr
 000A14D6    lea         eax,[ebp+1C]
 000A14D9    call        @LStrClr
 000A14DE    ret
>000A14DF    jmp         @HandleFinally
>000A14E4    jmp         000A14C1
 000A14E6    mov         eax,edi
 000A14E8    pop         edi
 000A14E9    pop         esi
 000A14EA    pop         ebx
 000A14EB    mov         esp,ebp
 000A14ED    pop         ebp
 000A14EE    ret         1C
end;*}

//000A1524
procedure TFormOSE.FormCreate(Sender:TObject);
begin
{*
 000A1524    push        ebx
 000A1525    mov         ebx,eax
 000A1527    mov         dl,1
 000A1529    mov         eax,[0001F340];TStringList
 000A152E    call        TObject.Create;TStringList.Create
 000A1533    mov         dword ptr [ebx+2E0],eax;TFormOSE.?f2E0:TStringList
 000A1539    pop         ebx
 000A153A    ret
*}
end;

//000A153C
procedure TFormOSE.FormDestroy(Sender:TObject);
begin
{*
 000A153C    mov         eax,dword ptr [eax+2E0];TFormOSE.?f2E0:TStringList
 000A1542    call        TObject.Free
 000A1547    ret
*}
end;

Initialization
//000A1578
{*
 000A1578    sub         dword ptr ds:[0B7074],1
>000A157F    jae         000A158B
 000A1581    mov         eax,[0003F944];TImageList
 000A1586    call        RegisterClass
 000A158B    ret
*}
Finalization
end.