//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit46;

interface

uses
  SysUtils, Classes;

    //procedure sub_000795EC(?:AnsiString; ?:?);//000795EC
    //procedure sub_00079634(?:?; ?:?);//00079634
    //procedure sub_000798A8(?:?; ?:?; ?:?; ?:?; ?:?);//000798A8
    //function sub_00079BF8(?:AnsiString):?;//00079BF8
    //function sub_00079CC0(?:?):?;//00079CC0
    //procedure sub_00079D44(?:?; ?:?);//00079D44

implementation

//000795EC
{*procedure sub_000795EC(?:AnsiString; ?:?);
begin
 000795EC    push        ebx
 000795ED    push        esi
 000795EE    mov         esi,edx
 000795F0    mov         ebx,eax
 000795F2    test        ebx,ebx
>000795F4    jne         00079600
 000795F6    mov         eax,esi
 000795F8    call        @LStrClr
 000795FD    pop         esi
 000795FE    pop         ebx
 000795FF    ret
 00079600    mov         eax,ebx
 00079602    call        @LStrLen
 00079607    cmp         byte ptr [ebx+eax-1],5C
>0007960C    jne         00079627
 0007960E    push        esi
 0007960F    mov         eax,ebx
 00079611    call        @LStrLen
 00079616    mov         ecx,eax
 00079618    dec         ecx
 00079619    mov         edx,1
 0007961E    mov         eax,ebx
 00079620    call        @LStrCopy
>00079625    jmp         00079630
 00079627    mov         eax,esi
 00079629    mov         edx,ebx
 0007962B    call        @LStrLAsg
 00079630    pop         esi
 00079631    pop         ebx
 00079632    ret
end;*}

//00079634
{*procedure sub_00079634(?:?; ?:?);
begin
 00079634    push        ebp
 00079635    mov         ebp,esp
 00079637    add         esp,0FFFFFEA8
 0007963D    push        ebx
 0007963E    xor         ecx,ecx
 00079640    mov         dword ptr [ebp-154],ecx
 00079646    mov         dword ptr [ebp-158],ecx
 0007964C    mov         dword ptr [ebp-8],edx
 0007964F    mov         dword ptr [ebp-4],eax
 00079652    mov         eax,dword ptr [ebp-4]
 00079655    call        @LStrAddRef
 0007965A    xor         eax,eax
 0007965C    push        ebp
 0007965D    push        79877
 00079662    push        dword ptr fs:[eax]
 00079665    mov         dword ptr fs:[eax],esp
 00079668    lea         edx,[ebp-154]
 0007966E    mov         eax,dword ptr [ebp-4]
 00079671    call        ExpandFileName
 00079676    mov         edx,dword ptr [ebp-154]
 0007967C    lea         eax,[ebp-4]
 0007967F    call        @LStrLAsg
 00079684    mov         edx,dword ptr [ebp-4]
 00079687    mov         eax,7988C;'*'
 0007968C    call        @LStrPos
 00079691    test        eax,eax
>00079693    jg          000796BE
 00079695    mov         edx,dword ptr [ebp-4]
 00079698    mov         eax,79898;'?'
 0007969D    call        @LStrPos
 000796A2    test        eax,eax
>000796A4    jg          000796BE
 000796A6    mov         eax,dword ptr [ebp-4]
 000796A9    call        FileExists
 000796AE    test        al,al
>000796B0    jne         000796CE
 000796B2    mov         eax,dword ptr [ebp-4]
 000796B5    call        00079BF8
 000796BA    test        al,al
>000796BC    jne         000796CE
 000796BE    mov         eax,dword ptr [ebp-8]
 000796C1    mov         edx,dword ptr [ebp-4]
 000796C4    call        @LStrLAsg
>000796C9    jmp         00079851
 000796CE    mov         edx,dword ptr [ebp-8]
 000796D1    mov         eax,dword ptr [ebp-4]
 000796D4    call        ExtractFileDrive
 000796D9    mov         eax,dword ptr [ebp-8]
 000796DC    mov         eax,dword ptr [eax]
 000796DE    call        @LStrLen
 000796E3    mov         dword ptr [ebp-0C],eax
 000796E6    mov         eax,dword ptr [ebp-4]
 000796E9    call        @LStrLen
 000796EE    cmp         eax,dword ptr [ebp-0C]
>000796F1    jle         00079851
 000796F7    lea         eax,[ebp-154]
 000796FD    push        eax
 000796FE    mov         edx,dword ptr [ebp-0C]
 00079701    inc         edx
 00079702    mov         ecx,1
 00079707    mov         eax,dword ptr [ebp-4]
 0007970A    call        @LStrCopy
 0007970F    mov         eax,dword ptr [ebp-154]
 00079715    mov         edx,798A4;'\'
 0007971A    call        @LStrCmp
>0007971F    jne         00079734
 00079721    mov         eax,dword ptr [ebp-8]
 00079724    mov         edx,798A4;'\'
 00079729    call        @LStrCat
 0007972E    mov         eax,dword ptr [ebp-8]
 00079731    inc         dword ptr [ebp-0C]
 00079734    lea         eax,[ebp-4]
 00079737    mov         ecx,dword ptr [ebp-0C]
 0007973A    mov         edx,1
 0007973F    call        @LStrDelete
 00079744    mov         edx,dword ptr [ebp-4]
 00079747    mov         eax,798A4;'\'
 0007974C    call        @LStrPos
 00079751    mov         dword ptr [ebp-0C],eax
 00079754    cmp         dword ptr [ebp-0C],0
 00079758    setg        bl
 0007975B    test        bl,bl
>0007975D    jne         0007976B
 0007975F    mov         eax,dword ptr [ebp-4]
 00079762    call        @LStrLen
 00079767    inc         eax
 00079768    mov         dword ptr [ebp-0C],eax
 0007976B    lea         eax,[ebp-150]
 00079771    push        eax
 00079772    lea         eax,[ebp-158]
 00079778    push        eax
 00079779    mov         ecx,dword ptr [ebp-0C]
 0007977C    dec         ecx
 0007977D    mov         edx,1
 00079782    mov         eax,dword ptr [ebp-4]
 00079785    call        @LStrCopy
 0007978A    mov         ecx,dword ptr [ebp-158]
 00079790    mov         edx,dword ptr [ebp-8]
 00079793    mov         edx,dword ptr [edx]
 00079795    lea         eax,[ebp-154]
 0007979B    call        @LStrCat3
 000797A0    mov         eax,dword ptr [ebp-154]
 000797A6    call        @LStrToPChar
 000797AB    push        eax
 000797AC    call        kernel32.FindFirstFileA
 000797B1    mov         dword ptr [ebp-10],eax
 000797B4    cmp         dword ptr [ebp-10],0FFFFFFFF
>000797B8    je          00079821
 000797BA    xor         eax,eax
 000797BC    push        ebp
 000797BD    push        7981A
 000797C2    push        dword ptr fs:[eax]
 000797C5    mov         dword ptr fs:[eax],esp
 000797C8    lea         eax,[ebp-154]
 000797CE    lea         edx,[ebp-124]
 000797D4    mov         ecx,104
 000797D9    call        @LStrFromArray
 000797DE    mov         edx,dword ptr [ebp-154]
 000797E4    mov         eax,dword ptr [ebp-8]
 000797E7    call        @LStrCat
 000797EC    mov         eax,dword ptr [ebp-8]
 000797EF    test        bl,bl
>000797F1    je          00079803
 000797F3    mov         eax,dword ptr [ebp-8]
 000797F6    mov         edx,798A4;'\'
 000797FB    call        @LStrCat
 00079800    mov         eax,dword ptr [ebp-8]
 00079803    xor         eax,eax
 00079805    pop         edx
 00079806    pop         ecx
 00079807    pop         ecx
 00079808    mov         dword ptr fs:[eax],edx
 0007980B    push        79831
 00079810    mov         eax,dword ptr [ebp-10]
 00079813    push        eax
 00079814    call        kernel32.FindClose
 00079819    ret
>0007981A    jmp         @HandleFinally
>0007981F    jmp         00079810
 00079821    mov         eax,dword ptr [ebp-8]
 00079824    mov         edx,dword ptr [ebp-4]
 00079827    call        @LStrCat
 0007982C    mov         eax,dword ptr [ebp-8]
>0007982F    jmp         00079851
 00079831    lea         eax,[ebp-4]
 00079834    mov         ecx,dword ptr [ebp-0C]
 00079837    mov         edx,1
 0007983C    call        @LStrDelete
 00079841    mov         eax,dword ptr [ebp-4]
 00079844    call        @LStrLen
 00079849    test        eax,eax
>0007984B    jne         00079744
 00079851    xor         eax,eax
 00079853    pop         edx
 00079854    pop         ecx
 00079855    pop         ecx
 00079856    mov         dword ptr fs:[eax],edx
 00079859    push        7987E
 0007985E    lea         eax,[ebp-158]
 00079864    mov         edx,2
 00079869    call        @LStrArrayClr
 0007986E    lea         eax,[ebp-4]
 00079871    call        @LStrClr
 00079876    ret
>00079877    jmp         @HandleFinally
>0007987C    jmp         0007985E
 0007987E    pop         ebx
 0007987F    mov         esp,ebp
 00079881    pop         ebp
 00079882    ret
end;*}

//000798A8
{*procedure sub_000798A8(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 000798A8    push        ebp
 000798A9    mov         ebp,esp
 000798AB    push        ecx
 000798AC    mov         ecx,4
 000798B1    push        0
 000798B3    push        0
 000798B5    dec         ecx
>000798B6    jne         000798B1
 000798B8    xchg        ecx,dword ptr [ebp-4]
 000798BB    push        ebx
 000798BC    push        esi
 000798BD    push        edi
 000798BE    mov         byte ptr [ebp-9],cl
 000798C1    mov         dword ptr [ebp-8],edx
 000798C4    mov         dword ptr [ebp-4],eax
 000798C7    mov         eax,dword ptr [ebp-4]
 000798CA    call        @LStrAddRef
 000798CF    xor         eax,eax
 000798D1    push        ebp
 000798D2    push        79BBE
 000798D7    push        dword ptr fs:[eax]
 000798DA    mov         dword ptr fs:[eax],esp
 000798DD    mov         eax,dword ptr [ebp+8]
 000798E0    mov         edx,dword ptr [ebp-4]
 000798E3    call        @LStrLAsg
 000798E8    mov         eax,dword ptr [ebp-4]
 000798EB    call        @LStrLen
 000798F0    cmp         eax,dword ptr [ebp-8]
>000798F3    jle         00079B9B
 000798F9    mov         dl,1
 000798FB    mov         eax,[0001F340];TStringList
 00079900    call        TObject.Create;TStringList.Create
 00079905    mov         dword ptr [ebp-10],eax
 00079908    xor         eax,eax
 0007990A    push        ebp
 0007990B    push        79B94
 00079910    push        dword ptr fs:[eax]
 00079913    mov         dword ptr fs:[eax],esp
 00079916    mov         ecx,dword ptr [ebp-10]
 00079919    mov         edx,79BD8;'\'
 0007991E    mov         eax,dword ptr [ebp-4]
 00079921    call        00074084
 00079926    mov         eax,dword ptr [ebp-10]
 00079929    mov         edx,dword ptr [eax]
 0007992B    call        dword ptr [edx+14];TStringList.GetCount
 0007992E    dec         eax
>0007992F    jne         0007993B
 00079931    call        @TryFinallyExit
>00079936    jmp         00079B9B
 0007993B    xor         ebx,ebx
 0007993D    lea         eax,[ebp-14]
 00079940    call        @LStrClr
 00079945    mov         eax,dword ptr [ebp-10]
 00079948    mov         edx,dword ptr [eax]
 0007994A    call        dword ptr [edx+14];TStringList.GetCount
 0007994D    mov         edx,eax
 0007994F    dec         edx
 00079950    lea         ecx,[ebp-18]
 00079953    mov         eax,dword ptr [ebp-10]
 00079956    mov         esi,dword ptr [eax]
 00079958    call        dword ptr [esi+0C];TStringList.Get
 0007995B    mov         eax,dword ptr [ebp-10]
 0007995E    mov         edx,dword ptr [eax]
 00079960    call        dword ptr [edx+14];TStringList.GetCount
 00079963    mov         esi,eax
 00079965    sub         esi,2
 00079968    lea         ecx,[ebp-20]
 0007996B    xor         edx,edx
 0007996D    mov         eax,dword ptr [ebp-10]
 00079970    mov         edi,dword ptr [eax]
 00079972    call        dword ptr [edi+0C];TStringList.Get
 00079975    mov         eax,dword ptr [ebp-20]
 00079978    call        @LStrLen
 0007997D    dec         eax
>0007997E    jle         000799F1
 00079980    lea         ecx,[ebp-24]
 00079983    xor         edx,edx
 00079985    mov         eax,dword ptr [ebp-10]
 00079988    mov         edi,dword ptr [eax]
 0007998A    call        dword ptr [edi+0C];TStringList.Get
 0007998D    mov         eax,dword ptr [ebp-24]
 00079990    lea         ecx,[ebp-20]
 00079993    mov         edx,1
 00079998    call        00075108
 0007999D    mov         eax,dword ptr [ebp-20]
 000799A0    mov         edx,79BE4;':'
 000799A5    call        @LStrCmp
>000799AA    jne         000799F1
 000799AC    cmp         byte ptr [ebp-9],0
>000799B0    je          000799C9
 000799B2    mov         eax,dword ptr [ebp-10]
 000799B5    mov         edx,dword ptr [eax]
 000799B7    call        dword ptr [edx+14];TStringList.GetCount
 000799BA    cmp         eax,2
>000799BD    jne         000799C9
 000799BF    call        @TryFinallyExit
>000799C4    jmp         00079B9B
 000799C9    cmp         byte ptr [ebp-9],0
>000799CD    je          000799F1
 000799CF    mov         ebx,1
 000799D4    lea         ecx,[ebp-20]
 000799D7    xor         edx,edx
 000799D9    mov         eax,dword ptr [ebp-10]
 000799DC    mov         edi,dword ptr [eax]
 000799DE    call        dword ptr [edi+0C];TStringList.Get
 000799E1    mov         edx,dword ptr [ebp-20]
 000799E4    lea         eax,[ebp-14]
 000799E7    mov         ecx,79BD8;'\'
 000799EC    call        @LStrCat3
 000799F1    lea         eax,[ebp-1C]
 000799F4    call        @LStrClr
 000799F9    cmp         byte ptr [ebp+0C],0
>000799FD    je          00079A8E
 00079A03    sub         ebx,esi
>00079A05    jg          00079A6E
 00079A07    dec         ebx
 00079A08    xchg        esi,ebx
 00079A0A    push        dword ptr [ebp-14]
 00079A0D    push        dword ptr [ebp-1C]
 00079A10    lea         ecx,[ebp-24]
 00079A13    mov         edx,ebx
 00079A15    mov         eax,dword ptr [ebp-10]
 00079A18    mov         edi,dword ptr [eax]
 00079A1A    call        dword ptr [edi+0C];TStringList.Get
 00079A1D    push        dword ptr [ebp-24]
 00079A20    push        79BD8;'\'
 00079A25    push        dword ptr [ebp-18]
 00079A28    lea         eax,[ebp-20]
 00079A2B    mov         edx,5
 00079A30    call        @LStrCatN
 00079A35    mov         eax,dword ptr [ebp-20]
 00079A38    call        @LStrLen
 00079A3D    add         eax,4
 00079A40    cmp         eax,dword ptr [ebp-8]
>00079A43    jg          00079A6E
 00079A45    lea         ecx,[ebp-20]
 00079A48    mov         edx,ebx
 00079A4A    mov         eax,dword ptr [ebp-10]
 00079A4D    mov         edi,dword ptr [eax]
 00079A4F    call        dword ptr [edi+0C];TStringList.Get
 00079A52    push        dword ptr [ebp-20]
 00079A55    push        79BD8;'\'
 00079A5A    push        dword ptr [ebp-1C]
 00079A5D    lea         eax,[ebp-1C]
 00079A60    mov         edx,3
 00079A65    call        @LStrCatN
 00079A6A    dec         ebx
 00079A6B    inc         esi
>00079A6C    jne         00079A0A
 00079A6E    push        dword ptr [ebp-14]
 00079A71    push        79BF0;'...\'
 00079A76    push        dword ptr [ebp-1C]
 00079A79    push        dword ptr [ebp-18]
 00079A7C    mov         eax,dword ptr [ebp+8]
 00079A7F    mov         edx,4
 00079A84    call        @LStrCatN
>00079A89    jmp         00079B12
 00079A8E    sub         esi,ebx
>00079A90    jl          00079AF7
 00079A92    inc         esi
 00079A93    push        dword ptr [ebp-14]
 00079A96    lea         ecx,[ebp-24]
 00079A99    mov         edx,ebx
 00079A9B    mov         eax,dword ptr [ebp-10]
 00079A9E    mov         edi,dword ptr [eax]
 00079AA0    call        dword ptr [edi+0C];TStringList.Get
 00079AA3    push        dword ptr [ebp-24]
 00079AA6    push        79BD8;'\'
 00079AAB    push        dword ptr [ebp-1C]
 00079AAE    push        dword ptr [ebp-18]
 00079AB1    lea         eax,[ebp-20]
 00079AB4    mov         edx,5
 00079AB9    call        @LStrCatN
 00079ABE    mov         eax,dword ptr [ebp-20]
 00079AC1    call        @LStrLen
 00079AC6    add         eax,4
 00079AC9    cmp         eax,dword ptr [ebp-8]
>00079ACC    jg          00079AF7
 00079ACE    push        dword ptr [ebp-1C]
 00079AD1    lea         ecx,[ebp-20]
 00079AD4    mov         edx,ebx
 00079AD6    mov         eax,dword ptr [ebp-10]
 00079AD9    mov         edi,dword ptr [eax]
 00079ADB    call        dword ptr [edi+0C];TStringList.Get
 00079ADE    push        dword ptr [ebp-20]
 00079AE1    push        79BD8;'\'
 00079AE6    lea         eax,[ebp-1C]
 00079AE9    mov         edx,3
 00079AEE    call        @LStrCatN
 00079AF3    inc         ebx
 00079AF4    dec         esi
>00079AF5    jne         00079A93
 00079AF7    push        dword ptr [ebp-14]
 00079AFA    push        dword ptr [ebp-1C]
 00079AFD    push        79BF0;'...\'
 00079B02    push        dword ptr [ebp-18]
 00079B05    mov         eax,dword ptr [ebp+8]
 00079B08    mov         edx,4
 00079B0D    call        @LStrCatN
 00079B12    lea         eax,[ebp-20]
 00079B15    push        eax
 00079B16    mov         eax,dword ptr [ebp+8]
 00079B19    mov         eax,dword ptr [eax]
 00079B1B    mov         ecx,4
 00079B20    mov         edx,1
 00079B25    call        @LStrCopy
 00079B2A    mov         eax,dword ptr [ebp-20]
 00079B2D    mov         edx,79BF0;'...\'
 00079B32    call        @LStrCmp
>00079B37    jne         00079B5B
 00079B39    mov         eax,dword ptr [ebp+8]
 00079B3C    push        eax
 00079B3D    mov         eax,dword ptr [ebp+8]
 00079B40    mov         eax,dword ptr [eax]
 00079B42    call        @LStrLen
 00079B47    mov         ecx,eax
 00079B49    sub         ecx,4
 00079B4C    mov         eax,dword ptr [ebp+8]
 00079B4F    mov         eax,dword ptr [eax]
 00079B51    mov         edx,5
 00079B56    call        @LStrCopy
 00079B5B    mov         eax,dword ptr [ebp+8]
 00079B5E    mov         eax,dword ptr [eax]
 00079B60    call        @LStrLen
 00079B65    mov         ebx,eax
 00079B67    mov         eax,dword ptr [ebp-4]
 00079B6A    call        @LStrLen
 00079B6F    cmp         ebx,eax
>00079B71    jl          00079B7E
 00079B73    mov         eax,dword ptr [ebp+8]
 00079B76    mov         edx,dword ptr [ebp-4]
 00079B79    call        @LStrLAsg
 00079B7E    xor         eax,eax
 00079B80    pop         edx
 00079B81    pop         ecx
 00079B82    pop         ecx
 00079B83    mov         dword ptr fs:[eax],edx
 00079B86    push        79B9B
 00079B8B    mov         eax,dword ptr [ebp-10]
 00079B8E    call        TObject.Free
 00079B93    ret
>00079B94    jmp         @HandleFinally
>00079B99    jmp         00079B8B
 00079B9B    xor         eax,eax
 00079B9D    pop         edx
 00079B9E    pop         ecx
 00079B9F    pop         ecx
 00079BA0    mov         dword ptr fs:[eax],edx
 00079BA3    push        79BC5
 00079BA8    lea         eax,[ebp-24]
 00079BAB    mov         edx,5
 00079BB0    call        @LStrArrayClr
 00079BB5    lea         eax,[ebp-4]
 00079BB8    call        @LStrClr
 00079BBD    ret
>00079BBE    jmp         @HandleFinally
>00079BC3    jmp         00079BA8
 00079BC5    pop         edi
 00079BC6    pop         esi
 00079BC7    pop         ebx
 00079BC8    mov         esp,ebp
 00079BCA    pop         ebp
 00079BCB    ret         8
end;*}

//00079BF8
{*function sub_00079BF8(?:AnsiString):?;
begin
 00079BF8    push        ebp
 00079BF9    mov         ebp,esp
 00079BFB    add         esp,0FFFFFEA4
 00079C01    push        ebx
 00079C02    xor         edx,edx
 00079C04    mov         dword ptr [ebp-15C],edx
 00079C0A    mov         ebx,eax
 00079C0C    lea         eax,[ebp-158]
 00079C12    mov         edx,dword ptr ds:[176C8];TSearchRec
 00079C18    call        @AddRefRecord
 00079C1D    xor         eax,eax
 00079C1F    push        ebp
 00079C20    push        79CA2
 00079C25    push        dword ptr fs:[eax]
 00079C28    mov         dword ptr fs:[eax],esp
 00079C2B    test        ebx,ebx
>00079C2D    jne         00079C33
 00079C2F    xor         ebx,ebx
>00079C31    jmp         00079C78
 00079C33    lea         edx,[ebp-15C]
 00079C39    mov         eax,ebx
 00079C3B    call        000795EC
 00079C40    lea         eax,[ebp-15C]
 00079C46    mov         edx,79CB8;'\*.*'
 00079C4B    call        @LStrCat
 00079C50    mov         eax,dword ptr [ebp-15C]
 00079C56    lea         ecx,[ebp-158]
 00079C5C    mov         edx,10
 00079C61    call        FindFirst
 00079C66    test        eax,eax
 00079C68    sete        al
 00079C6B    mov         ebx,eax
 00079C6D    lea         eax,[ebp-158]
 00079C73    call        FindClose
 00079C78    xor         eax,eax
 00079C7A    pop         edx
 00079C7B    pop         ecx
 00079C7C    pop         ecx
 00079C7D    mov         dword ptr fs:[eax],edx
 00079C80    push        79CA9
 00079C85    lea         eax,[ebp-15C]
 00079C8B    call        @LStrClr
 00079C90    lea         eax,[ebp-158]
 00079C96    mov         edx,dword ptr ds:[176C8];TSearchRec
 00079C9C    call        @FinalizeRecord
 00079CA1    ret
>00079CA2    jmp         @HandleFinally
>00079CA7    jmp         00079C85
 00079CA9    mov         eax,ebx
 00079CAB    pop         ebx
 00079CAC    mov         esp,ebp
 00079CAE    pop         ebp
 00079CAF    ret
end;*}

//00079CC0
{*function sub_00079CC0(?:?):?;
begin
 00079CC0    push        ebp
 00079CC1    mov         ebp,esp
 00079CC3    add         esp,0FFFFFEA8
 00079CC9    push        ebx
 00079CCA    mov         ebx,eax
 00079CCC    lea         eax,[ebp-158]
 00079CD2    mov         edx,dword ptr ds:[176C8];TSearchRec
 00079CD8    call        @AddRefRecord
 00079CDD    xor         eax,eax
 00079CDF    push        ebp
 00079CE0    push        79D36
 00079CE5    push        dword ptr fs:[eax]
 00079CE8    mov         dword ptr fs:[eax],esp
 00079CEB    lea         ecx,[ebp-158]
 00079CF1    mov         edx,3F
 00079CF6    mov         eax,ebx
 00079CF8    call        FindFirst
 00079CFD    test        eax,eax
>00079CFF    jne         00079D09
 00079D01    mov         ebx,dword ptr [ebp-154]
>00079D07    jmp         00079D0C
 00079D09    or          ebx,0FFFFFFFF
 00079D0C    lea         eax,[ebp-158]
 00079D12    call        FindClose
 00079D17    xor         eax,eax
 00079D19    pop         edx
 00079D1A    pop         ecx
 00079D1B    pop         ecx
 00079D1C    mov         dword ptr fs:[eax],edx
 00079D1F    push        79D3D
 00079D24    lea         eax,[ebp-158]
 00079D2A    mov         edx,dword ptr ds:[176C8];TSearchRec
 00079D30    call        @FinalizeRecord
 00079D35    ret
>00079D36    jmp         @HandleFinally
>00079D3B    jmp         00079D24
 00079D3D    mov         eax,ebx
 00079D3F    pop         ebx
 00079D40    mov         esp,ebp
 00079D42    pop         ebp
 00079D43    ret
end;*}

//00079D44
{*procedure sub_00079D44(?:?; ?:?);
begin
 00079D44    push        ebp
 00079D45    mov         ebp,esp
 00079D47    push        ecx
 00079D48    push        ebx
 00079D49    push        esi
 00079D4A    mov         ebx,edx
 00079D4C    mov         dword ptr [ebp-4],eax
 00079D4F    mov         eax,dword ptr [ebp-4]
 00079D52    call        @LStrAddRef
 00079D57    xor         eax,eax
 00079D59    push        ebp
 00079D5A    push        79DA7
 00079D5F    push        dword ptr fs:[eax]
 00079D62    mov         dword ptr fs:[eax],esp
 00079D65    mov         edx,ebx
 00079D67    mov         eax,dword ptr [ebp-4]
 00079D6A    call        ExtractFileName
 00079D6F    mov         edx,dword ptr [ebx]
 00079D71    mov         eax,79DBC;'.'
 00079D76    call        000742A0
 00079D7B    mov         esi,eax
 00079D7D    test        esi,esi
>00079D7F    jle         00079D91
 00079D81    push        ebx
 00079D82    mov         ecx,esi
 00079D84    dec         ecx
 00079D85    mov         eax,dword ptr [ebx]
 00079D87    mov         edx,1
 00079D8C    call        @LStrCopy
 00079D91    xor         eax,eax
 00079D93    pop         edx
 00079D94    pop         ecx
 00079D95    pop         ecx
 00079D96    mov         dword ptr fs:[eax],edx
 00079D99    push        79DAE
 00079D9E    lea         eax,[ebp-4]
 00079DA1    call        @LStrClr
 00079DA6    ret
>00079DA7    jmp         @HandleFinally
>00079DAC    jmp         00079D9E
 00079DAE    pop         esi
 00079DAF    pop         ebx
 00079DB0    pop         ecx
 00079DB1    pop         ebp
 00079DB2    ret
end;*}

end.