//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit67;

interface

uses
  SysUtils, Classes;

    //function sub_0008F4F4(?:TCMStrGrid):?;//0008F4F4
    //function sub_0008F54C(?:?):?;//0008F54C
    //function sub_0008F560(?:?):?;//0008F560
    //procedure sub_0008F57C(?:AnsiString; ?:?);//0008F57C
    //function sub_0008F7B8(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0008F7B8
    //function sub_0008FAB0(?:AnsiString; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0008FAB0
    //procedure sub_0008FDA8(?:?; ?:AnsiString; ?:?);//0008FDA8
    //function sub_0008FEF4(?:AnsiString; ?:?; ?:AnsiString; ?:?):?;//0008FEF4
    //function sub_00090210(?:?; ?:?; ?:?; ?:?; ?:?):?;//00090210
    //procedure sub_0009034C(?:?; ?:?);//0009034C
    //function sub_00090430(?:?):?;//00090430

implementation

//0008F4F4
{*function sub_0008F4F4(?:TCMStrGrid):?;
begin
 0008F4F4    push        ebx
 0008F4F5    add         esp,0FFFFFFF0
 0008F4F8    mov         ebx,eax
 0008F4FA    push        esp
 0008F4FB    call        user32.GetCursorPos
 0008F500    test        eax,eax
>0008F502    je          0008F544
 0008F504    lea         ecx,[esp+8]
 0008F508    mov         edx,esp
 0008F50A    mov         eax,ebx
 0008F50C    call        TControl.ScreenToClient
 0008F511    mov         eax,dword ptr [esp+8]
 0008F515    mov         dword ptr [esp],eax
 0008F518    mov         eax,dword ptr [esp+0C]
 0008F51C    mov         dword ptr [esp+4],eax
 0008F520    mov         eax,dword ptr [esp]
 0008F523    test        eax,eax
>0008F525    jl          0008F53C
 0008F527    cmp         eax,dword ptr [ebx+38]
>0008F52A    jg          0008F53C
 0008F52C    cmp         dword ptr [esp+4],0
>0008F531    jl          0008F53C
 0008F533    mov         eax,dword ptr [esp+4]
 0008F537    cmp         eax,dword ptr [ebx+3C]
>0008F53A    jle         0008F540
 0008F53C    xor         eax,eax
>0008F53E    jmp         0008F546
 0008F540    mov         al,1
>0008F542    jmp         0008F546
 0008F544    xor         eax,eax
 0008F546    add         esp,10
 0008F549    pop         ebx
 0008F54A    ret
end;*}

//0008F54C
{*function sub_0008F54C(?:?):?;
begin
 0008F54C    sub         eax,3
>0008F54F    je          0008F559
 0008F551    sub         eax,4
>0008F554    jne         0008F55C
 0008F556    mov         al,1
 0008F558    ret
 0008F559    mov         al,2
 0008F55B    ret
 0008F55C    xor         eax,eax
 0008F55E    ret
end;*}

//0008F560
{*function sub_0008F560(?:?):?;
begin
 0008F560    dec         al
>0008F562    je          0008F56A
 0008F564    dec         al
>0008F566    je          0008F570
>0008F568    jmp         0008F576
 0008F56A    mov         eax,7
 0008F56F    ret
 0008F570    mov         eax,3
 0008F575    ret
 0008F576    mov         eax,1
 0008F57B    ret
end;*}

//0008F57C
{*procedure sub_0008F57C(?:AnsiString; ?:?);
begin
 0008F57C    push        ebp
 0008F57D    mov         ebp,esp
 0008F57F    add         esp,0FFFFFFF4
 0008F582    push        ebx
 0008F583    xor         ecx,ecx
 0008F585    mov         dword ptr [ebp-0C],ecx
 0008F588    mov         ebx,edx
 0008F58A    mov         dword ptr [ebp-4],eax
 0008F58D    mov         eax,dword ptr [ebp-4]
 0008F590    call        @LStrAddRef
 0008F595    xor         eax,eax
 0008F597    push        ebp
 0008F598    push        8F6CF
 0008F59D    push        dword ptr fs:[eax]
 0008F5A0    mov         dword ptr fs:[eax],esp
 0008F5A3    mov         eax,ebx
 0008F5A5    mov         edx,dword ptr [ebp-4]
 0008F5A8    call        @LStrLAsg
 0008F5AD    mov         ecx,8F6E4;'Software\Microsoft\Windows\CurrentVersion\Explorer'
 0008F5B2    mov         dl,1
 0008F5B4    mov         eax,[0008940C];TRegIniFile
 0008F5B9    call        TRegIniFile.Create;TRegIniFile.Create
 0008F5BE    mov         dword ptr [ebp-8],eax
 0008F5C1    xor         eax,eax
 0008F5C3    push        ebp
 0008F5C4    push        8F6AA
 0008F5C9    push        dword ptr fs:[eax]
 0008F5CC    mov         dword ptr fs:[eax],esp
 0008F5CF    lea         edx,[ebp-0C]
 0008F5D2    mov         eax,dword ptr [ebp-4]
 0008F5D5    call        AnsiUpperCase
 0008F5DA    mov         eax,dword ptr [ebp-0C]
 0008F5DD    mov         edx,8F720;'DESKTOP'
 0008F5E2    call        @LStrCmp
>0008F5E7    jne         0008F603
 0008F5E9    push        0
 0008F5EB    push        ebx
 0008F5EC    mov         ecx,8F730;'Desktop'
 0008F5F1    mov         edx,8F740;'Shell Folders'
 0008F5F6    mov         eax,dword ptr [ebp-8]
 0008F5F9    call        TRegIniFile.ReadString
>0008F5FE    jmp         0008F694
 0008F603    lea         edx,[ebp-0C]
 0008F606    mov         eax,dword ptr [ebp-4]
 0008F609    call        AnsiUpperCase
 0008F60E    mov         eax,dword ptr [ebp-0C]
 0008F611    mov         edx,8F758;'SENDTO'
 0008F616    call        @LStrCmp
>0008F61B    jne         0008F634
 0008F61D    push        0
 0008F61F    push        ebx
 0008F620    mov         ecx,8F768;'SendTo'
 0008F625    mov         edx,8F740;'Shell Folders'
 0008F62A    mov         eax,dword ptr [ebp-8]
 0008F62D    call        TRegIniFile.ReadString
>0008F632    jmp         0008F694
 0008F634    lea         edx,[ebp-0C]
 0008F637    mov         eax,dword ptr [ebp-4]
 0008F63A    call        AnsiUpperCase
 0008F63F    mov         eax,dword ptr [ebp-0C]
 0008F642    mov         edx,8F778;'PROGRAMS'
 0008F647    call        @LStrCmp
>0008F64C    jne         0008F665
 0008F64E    push        0
 0008F650    push        ebx
 0008F651    mov         ecx,8F78C;'Programs'
 0008F656    mov         edx,8F740;'Shell Folders'
 0008F65B    mov         eax,dword ptr [ebp-8]
 0008F65E    call        TRegIniFile.ReadString
>0008F663    jmp         0008F694
 0008F665    lea         edx,[ebp-0C]
 0008F668    mov         eax,dword ptr [ebp-4]
 0008F66B    call        AnsiUpperCase
 0008F670    mov         eax,dword ptr [ebp-0C]
 0008F673    mov         edx,8F7A0;'STARTUP'
 0008F678    call        @LStrCmp
>0008F67D    jne         0008F694
 0008F67F    push        0
 0008F681    push        ebx
 0008F682    mov         ecx,8F7B0;'Startup'
 0008F687    mov         edx,8F740;'Shell Folders'
 0008F68C    mov         eax,dword ptr [ebp-8]
 0008F68F    call        TRegIniFile.ReadString
 0008F694    xor         eax,eax
 0008F696    pop         edx
 0008F697    pop         ecx
 0008F698    pop         ecx
 0008F699    mov         dword ptr fs:[eax],edx
 0008F69C    push        8F6B1
 0008F6A1    mov         eax,dword ptr [ebp-8]
 0008F6A4    call        TObject.Free
 0008F6A9    ret
>0008F6AA    jmp         @HandleFinally
>0008F6AF    jmp         0008F6A1
 0008F6B1    xor         eax,eax
 0008F6B3    pop         edx
 0008F6B4    pop         ecx
 0008F6B5    pop         ecx
 0008F6B6    mov         dword ptr fs:[eax],edx
 0008F6B9    push        8F6D6
 0008F6BE    lea         eax,[ebp-0C]
 0008F6C1    call        @LStrClr
 0008F6C6    lea         eax,[ebp-4]
 0008F6C9    call        @LStrClr
 0008F6CE    ret
>0008F6CF    jmp         @HandleFinally
>0008F6D4    jmp         0008F6BE
 0008F6D6    pop         ebx
 0008F6D7    mov         esp,ebp
 0008F6D9    pop         ebp
 0008F6DA    ret
end;*}

//0008F7B8
{*function sub_0008F7B8(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0008F7B8    push        ebp
 0008F7B9    mov         ebp,esp
 0008F7BB    add         esp,0FFFFFB88
 0008F7C1    push        ebx
 0008F7C2    push        esi
 0008F7C3    push        edi
 0008F7C4    xor         ebx,ebx
 0008F7C6    mov         dword ptr [ebp-474],ebx
 0008F7CC    mov         dword ptr [ebp-478],ebx
 0008F7D2    mov         dword ptr [ebp-10],ebx
 0008F7D5    mov         dword ptr [ebp-14],ebx
 0008F7D8    mov         ebx,ecx
 0008F7DA    mov         dword ptr [ebp-8],edx
 0008F7DD    mov         dword ptr [ebp-4],eax
 0008F7E0    mov         eax,dword ptr [ebp-4]
 0008F7E3    call        @LStrAddRef
 0008F7E8    mov         eax,dword ptr [ebp-8]
 0008F7EB    call        @LStrAddRef
 0008F7F0    xor         eax,eax
 0008F7F2    push        ebp
 0008F7F3    push        8FA8F
 0008F7F8    push        dword ptr fs:[eax]
 0008F7FB    mov         dword ptr fs:[eax],esp
 0008F7FE    mov         byte ptr [ebp-9],0
 0008F802    cmp         byte ptr ds:[0B6B34],0;gvar_000B6B34
>0008F809    jne         0008F819
 0008F80B    push        0
 0008F80D    call        ole32.CoInitialize
 0008F812    mov         byte ptr ds:[0B6B34],1;gvar_000B6B34
 0008F819    lea         eax,[ebp-10]
 0008F81C    call        @IntfClear
 0008F821    push        eax
 0008F822    mov         eax,[000B5BA4];^gvar_000B4DC8
 0008F827    push        eax
 0008F828    push        1
 0008F82A    push        0
 0008F82C    mov         eax,[000B56D8];^gvar_000B4DB8
 0008F831    push        eax
 0008F832    call        ole32.CoCreateInstance
 0008F837    test        eax,eax
>0008F839    jne         0008FA54
 0008F83F    xor         edx,edx
 0008F841    push        ebp
 0008F842    push        8FA4A
 0008F847    push        dword ptr fs:[edx]
 0008F84A    mov         dword ptr fs:[edx],esp
 0008F84D    lea         eax,[ebp-14]
 0008F850    call        @IntfClear
 0008F855    push        eax
 0008F856    push        0B55D0
 0008F85B    mov         eax,dword ptr [ebp-10]
 0008F85E    push        eax
 0008F85F    mov         eax,dword ptr [eax]
 0008F861    call        dword ptr [eax]
 0008F863    test        eax,eax
>0008F865    je          0008F874
 0008F867    xor         eax,eax
 0008F869    pop         edx
 0008F86A    pop         ecx
 0008F86B    pop         ecx
 0008F86C    mov         dword ptr fs:[eax],edx
>0008F86F    jmp         0008FA54
 0008F874    xor         edx,edx
 0008F876    push        ebp
 0008F877    push        8FA36
 0008F87C    push        dword ptr fs:[edx]
 0008F87F    mov         dword ptr fs:[edx],esp
 0008F882    lea         edx,[ebp-478]
 0008F888    mov         eax,dword ptr [ebp-8]
 0008F88B    call        0008F57C
 0008F890    push        dword ptr [ebp-478]
 0008F896    push        8FAAC;'\'
 0008F89B    push        dword ptr [ebp-4]
 0008F89E    lea         eax,[ebp-474]
 0008F8A4    mov         edx,3
 0008F8A9    call        @LStrCatN
 0008F8AE    mov         edx,dword ptr [ebp-474]
 0008F8B4    lea         eax,[ebp-123]
 0008F8BA    call        StrPCopy
 0008F8BF    push        104
 0008F8C4    lea         eax,[ebp-32E]
 0008F8CA    push        eax
 0008F8CB    push        0FF
 0008F8CD    lea         eax,[ebp-123]
 0008F8D3    push        eax
 0008F8D4    push        0
 0008F8D6    push        0
 0008F8D8    call        kernel32.MultiByteToWideChar
 0008F8DD    push        0
 0008F8DF    lea         eax,[ebp-32E]
 0008F8E5    push        eax
 0008F8E6    mov         eax,dword ptr [ebp-14]
 0008F8E9    push        eax
 0008F8EA    mov         eax,dword ptr [eax]
 0008F8EC    call        dword ptr [eax+14]
 0008F8EF    test        eax,eax
>0008F8F1    je          0008F908
 0008F8F3    xor         eax,eax
 0008F8F5    pop         edx
 0008F8F6    pop         ecx
 0008F8F7    pop         ecx
 0008F8F8    mov         dword ptr fs:[eax],edx
 0008F8FB    xor         eax,eax
 0008F8FD    pop         edx
 0008F8FE    pop         ecx
 0008F8FF    pop         ecx
 0008F900    mov         dword ptr fs:[eax],edx
>0008F903    jmp         0008FA54
 0008F908    push        2
 0008F90A    lea         eax,[ebp-470]
 0008F910    push        eax
 0008F911    push        104
 0008F916    lea         eax,[ebp-123]
 0008F91C    push        eax
 0008F91D    mov         eax,dword ptr [ebp-10]
 0008F920    push        eax
 0008F921    mov         eax,dword ptr [eax]
 0008F923    call        dword ptr [eax+0C]
 0008F926    lea         edx,[ebp-474]
 0008F92C    lea         eax,[ebp-123]
 0008F932    call        StrPas
 0008F937    mov         edx,dword ptr [ebp-474]
 0008F93D    mov         eax,ebx
 0008F93F    call        @LStrAsg
 0008F944    push        104
 0008F949    lea         eax,[ebp-123]
 0008F94F    push        eax
 0008F950    mov         eax,dword ptr [ebp-10]
 0008F953    push        eax
 0008F954    mov         eax,dword ptr [eax]
 0008F956    call        dword ptr [eax+28]
 0008F959    lea         edx,[ebp-474]
 0008F95F    lea         eax,[ebp-123]
 0008F965    call        StrPas
 0008F96A    mov         edx,dword ptr [ebp-474]
 0008F970    mov         eax,dword ptr [ebp+1C]
 0008F973    call        @LStrAsg
 0008F978    push        104
 0008F97D    lea         eax,[ebp-123]
 0008F983    push        eax
 0008F984    mov         eax,dword ptr [ebp-10]
 0008F987    push        eax
 0008F988    mov         eax,dword ptr [eax]
 0008F98A    call        dword ptr [eax+20]
 0008F98D    lea         edx,[ebp-474]
 0008F993    lea         eax,[ebp-123]
 0008F999    call        StrPas
 0008F99E    mov         edx,dword ptr [ebp-474]
 0008F9A4    mov         eax,dword ptr [ebp+18]
 0008F9A7    call        @LStrAsg
 0008F9AC    lea         eax,[ebp-18]
 0008F9AF    push        eax
 0008F9B0    push        104
 0008F9B5    lea         eax,[ebp-123]
 0008F9BB    push        eax
 0008F9BC    mov         eax,dword ptr [ebp-10]
 0008F9BF    push        eax
 0008F9C0    mov         eax,dword ptr [eax]
 0008F9C2    call        dword ptr [eax+40]
 0008F9C5    lea         edx,[ebp-474]
 0008F9CB    lea         eax,[ebp-123]
 0008F9D1    call        StrPas
 0008F9D6    mov         edx,dword ptr [ebp-474]
 0008F9DC    mov         eax,dword ptr [ebp+0C]
 0008F9DF    call        @LStrAsg
 0008F9E4    mov         eax,dword ptr [ebp+8]
 0008F9E7    mov         edx,dword ptr [ebp-18]
 0008F9EA    mov         dword ptr [eax],edx
 0008F9EC    xor         eax,eax
 0008F9EE    mov         dword ptr [ebp-1C],eax
 0008F9F1    lea         eax,[ebp-1C]
 0008F9F4    push        eax
 0008F9F5    mov         eax,dword ptr [ebp-10]
 0008F9F8    push        eax
 0008F9F9    mov         eax,dword ptr [eax]
 0008F9FB    call        dword ptr [eax+38]
 0008F9FE    mov         eax,dword ptr [ebp-1C]
 0008FA01    call        0008F54C
 0008FA06    mov         edx,dword ptr [ebp+10]
 0008FA09    mov         byte ptr [edx],al
 0008FA0B    mov         word ptr [ebp-1E],0
 0008FA11    lea         eax,[ebp-1E]
 0008FA14    push        eax
 0008FA15    mov         eax,dword ptr [ebp-10]
 0008FA18    push        eax
 0008FA19    mov         eax,dword ptr [eax]
 0008FA1B    call        dword ptr [eax+30]
 0008FA1E    mov         eax,dword ptr [ebp+14]
 0008FA21    mov         dx,word ptr [ebp-1E]
 0008FA25    mov         word ptr [eax],dx
 0008FA28    mov         byte ptr [ebp-9],1
 0008FA2C    xor         eax,eax
 0008FA2E    pop         edx
 0008FA2F    pop         ecx
 0008FA30    pop         ecx
 0008FA31    mov         dword ptr fs:[eax],edx
>0008FA34    jmp         0008FA40
>0008FA36    jmp         @HandleAnyException
 0008FA3B    call        @DoneExcept
 0008FA40    xor         eax,eax
 0008FA42    pop         edx
 0008FA43    pop         ecx
 0008FA44    pop         ecx
 0008FA45    mov         dword ptr fs:[eax],edx
>0008FA48    jmp         0008FA54
>0008FA4A    jmp         @HandleAnyException
 0008FA4F    call        @DoneExcept
 0008FA54    xor         eax,eax
 0008FA56    pop         edx
 0008FA57    pop         ecx
 0008FA58    pop         ecx
 0008FA59    mov         dword ptr fs:[eax],edx
 0008FA5C    push        8FA96
 0008FA61    lea         eax,[ebp-478]
 0008FA67    mov         edx,2
 0008FA6C    call        @LStrArrayClr
 0008FA71    lea         eax,[ebp-14]
 0008FA74    call        @IntfClear
 0008FA79    lea         eax,[ebp-10]
 0008FA7C    call        @IntfClear
 0008FA81    lea         eax,[ebp-8]
 0008FA84    mov         edx,2
 0008FA89    call        @LStrArrayClr
 0008FA8E    ret
>0008FA8F    jmp         @HandleFinally
>0008FA94    jmp         0008FA61
 0008FA96    mov         al,byte ptr [ebp-9]
 0008FA99    pop         edi
 0008FA9A    pop         esi
 0008FA9B    pop         ebx
 0008FA9C    mov         esp,ebp
 0008FA9E    pop         ebp
 0008FA9F    ret         18
end;*}

//0008FAB0
{*function sub_0008FAB0(?:AnsiString; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0008FAB0    push        ebp
 0008FAB1    mov         ebp,esp
 0008FAB3    add         esp,0FFFFFCD0
 0008FAB9    push        ebx
 0008FABA    push        esi
 0008FABB    push        edi
 0008FABC    xor         ebx,ebx
 0008FABE    mov         dword ptr [ebp-32C],ebx
 0008FAC4    mov         dword ptr [ebp-330],ebx
 0008FACA    mov         dword ptr [ebp-14],ebx
 0008FACD    mov         dword ptr [ebp-18],ebx
 0008FAD0    mov         dword ptr [ebp-0C],ecx
 0008FAD3    mov         dword ptr [ebp-8],edx
 0008FAD6    mov         dword ptr [ebp-4],eax
 0008FAD9    mov         eax,dword ptr [ebp-4]
 0008FADC    call        @LStrAddRef
 0008FAE1    mov         eax,dword ptr [ebp-8]
 0008FAE4    call        @LStrAddRef
 0008FAE9    mov         eax,dword ptr [ebp-0C]
 0008FAEC    call        @LStrAddRef
 0008FAF1    mov         eax,dword ptr [ebp+1C]
 0008FAF4    call        @LStrAddRef
 0008FAF9    mov         eax,dword ptr [ebp+18]
 0008FAFC    call        @LStrAddRef
 0008FB01    mov         eax,dword ptr [ebp+0C]
 0008FB04    call        @LStrAddRef
 0008FB09    xor         eax,eax
 0008FB0B    push        ebp
 0008FB0C    push        8FD88
 0008FB11    push        dword ptr fs:[eax]
 0008FB14    mov         dword ptr fs:[eax],esp
 0008FB17    mov         byte ptr [ebp-0D],0
 0008FB1B    cmp         byte ptr ds:[0B6B34],0;gvar_000B6B34
>0008FB22    jne         0008FB32
 0008FB24    push        0
 0008FB26    call        ole32.CoInitialize
 0008FB2B    mov         byte ptr ds:[0B6B34],1;gvar_000B6B34
 0008FB32    lea         eax,[ebp-14]
 0008FB35    call        @IntfClear
 0008FB3A    push        eax
 0008FB3B    mov         eax,[000B5BA4];^gvar_000B4DC8
 0008FB40    push        eax
 0008FB41    push        1
 0008FB43    push        0
 0008FB45    mov         eax,[000B56D8];^gvar_000B4DB8
 0008FB4A    push        eax
 0008FB4B    call        ole32.CoCreateInstance
 0008FB50    test        eax,eax
>0008FB52    jne         0008FD38
 0008FB58    xor         edx,edx
 0008FB5A    push        ebp
 0008FB5B    push        8FD2E
 0008FB60    push        dword ptr fs:[edx]
 0008FB63    mov         dword ptr fs:[edx],esp
 0008FB66    lea         eax,[ebp-18]
 0008FB69    call        @IntfClear
 0008FB6E    push        eax
 0008FB6F    push        0B55D0
 0008FB74    mov         eax,dword ptr [ebp-14]
 0008FB77    push        eax
 0008FB78    mov         eax,dword ptr [eax]
 0008FB7A    call        dword ptr [eax]
 0008FB7C    test        eax,eax
>0008FB7E    je          0008FB8D
 0008FB80    xor         eax,eax
 0008FB82    pop         edx
 0008FB83    pop         ecx
 0008FB84    pop         ecx
 0008FB85    mov         dword ptr fs:[eax],edx
>0008FB88    jmp         0008FD38
 0008FB8D    xor         edx,edx
 0008FB8F    push        ebp
 0008FB90    push        8FD1A
 0008FB95    push        dword ptr fs:[edx]
 0008FB98    mov         dword ptr fs:[edx],esp
 0008FB9B    mov         eax,dword ptr [ebp-0C]
 0008FB9E    call        @LStrToPChar
 0008FBA3    push        eax
 0008FBA4    mov         eax,dword ptr [ebp-14]
 0008FBA7    push        eax
 0008FBA8    mov         eax,dword ptr [eax]
 0008FBAA    call        dword ptr [eax+50]
 0008FBAD    test        eax,eax
>0008FBAF    je          0008FBC6
 0008FBB1    xor         eax,eax
 0008FBB3    pop         edx
 0008FBB4    pop         ecx
 0008FBB5    pop         ecx
 0008FBB6    mov         dword ptr fs:[eax],edx
 0008FBB9    xor         eax,eax
 0008FBBB    pop         edx
 0008FBBC    pop         ecx
 0008FBBD    pop         ecx
 0008FBBE    mov         dword ptr fs:[eax],edx
>0008FBC1    jmp         0008FD38
 0008FBC6    mov         eax,dword ptr [ebp+1C]
 0008FBC9    call        @LStrToPChar
 0008FBCE    push        eax
 0008FBCF    mov         eax,dword ptr [ebp-14]
 0008FBD2    push        eax
 0008FBD3    mov         eax,dword ptr [eax]
 0008FBD5    call        dword ptr [eax+2C]
 0008FBD8    test        eax,eax
>0008FBDA    je          0008FBF1
 0008FBDC    xor         eax,eax
 0008FBDE    pop         edx
 0008FBDF    pop         ecx
 0008FBE0    pop         ecx
 0008FBE1    mov         dword ptr fs:[eax],edx
 0008FBE4    xor         eax,eax
 0008FBE6    pop         edx
 0008FBE7    pop         ecx
 0008FBE8    pop         ecx
 0008FBE9    mov         dword ptr fs:[eax],edx
>0008FBEC    jmp         0008FD38
 0008FBF1    mov         eax,dword ptr [ebp+18]
 0008FBF4    call        @LStrToPChar
 0008FBF9    push        eax
 0008FBFA    mov         eax,dword ptr [ebp-14]
 0008FBFD    push        eax
 0008FBFE    mov         eax,dword ptr [eax]
 0008FC00    call        dword ptr [eax+24]
 0008FC03    test        eax,eax
>0008FC05    je          0008FC1C
 0008FC07    xor         eax,eax
 0008FC09    pop         edx
 0008FC0A    pop         ecx
 0008FC0B    pop         ecx
 0008FC0C    mov         dword ptr fs:[eax],edx
 0008FC0F    xor         eax,eax
 0008FC11    pop         edx
 0008FC12    pop         ecx
 0008FC13    pop         ecx
 0008FC14    mov         dword ptr fs:[eax],edx
>0008FC17    jmp         0008FD38
 0008FC1C    mov         ax,word ptr [ebp+14]
 0008FC20    push        eax
 0008FC21    mov         eax,dword ptr [ebp-14]
 0008FC24    push        eax
 0008FC25    mov         eax,dword ptr [eax]
 0008FC27    call        dword ptr [eax+34]
 0008FC2A    test        eax,eax
>0008FC2C    je          0008FC43
 0008FC2E    xor         eax,eax
 0008FC30    pop         edx
 0008FC31    pop         ecx
 0008FC32    pop         ecx
 0008FC33    mov         dword ptr fs:[eax],edx
 0008FC36    xor         eax,eax
 0008FC38    pop         edx
 0008FC39    pop         ecx
 0008FC3A    pop         ecx
 0008FC3B    mov         dword ptr fs:[eax],edx
>0008FC3E    jmp         0008FD38
 0008FC43    mov         al,byte ptr [ebp+10]
 0008FC46    call        0008F560
 0008FC4B    push        eax
 0008FC4C    mov         eax,dword ptr [ebp-14]
 0008FC4F    push        eax
 0008FC50    mov         eax,dword ptr [eax]
 0008FC52    call        dword ptr [eax+3C]
 0008FC55    test        eax,eax
>0008FC57    je          0008FC6E
 0008FC59    xor         eax,eax
 0008FC5B    pop         edx
 0008FC5C    pop         ecx
 0008FC5D    pop         ecx
 0008FC5E    mov         dword ptr fs:[eax],edx
 0008FC61    xor         eax,eax
 0008FC63    pop         edx
 0008FC64    pop         ecx
 0008FC65    pop         ecx
 0008FC66    mov         dword ptr fs:[eax],edx
>0008FC69    jmp         0008FD38
 0008FC6E    mov         eax,dword ptr [ebp+8]
 0008FC71    push        eax
 0008FC72    mov         eax,dword ptr [ebp+0C]
 0008FC75    call        @LStrToPChar
 0008FC7A    push        eax
 0008FC7B    mov         eax,dword ptr [ebp-14]
 0008FC7E    push        eax
 0008FC7F    mov         eax,dword ptr [eax]
 0008FC81    call        dword ptr [eax+44]
 0008FC84    test        eax,eax
>0008FC86    je          0008FC9D
 0008FC88    xor         eax,eax
 0008FC8A    pop         edx
 0008FC8B    pop         ecx
 0008FC8C    pop         ecx
 0008FC8D    mov         dword ptr fs:[eax],edx
 0008FC90    xor         eax,eax
 0008FC92    pop         edx
 0008FC93    pop         ecx
 0008FC94    pop         ecx
 0008FC95    mov         dword ptr fs:[eax],edx
>0008FC98    jmp         0008FD38
 0008FC9D    lea         edx,[ebp-330]
 0008FCA3    mov         eax,dword ptr [ebp-8]
 0008FCA6    call        0008F57C
 0008FCAB    push        dword ptr [ebp-330]
 0008FCB1    push        8FDA4;'\'
 0008FCB6    push        dword ptr [ebp-4]
 0008FCB9    lea         eax,[ebp-32C]
 0008FCBF    mov         edx,3
 0008FCC4    call        @LStrCatN
 0008FCC9    mov         edx,dword ptr [ebp-32C]
 0008FCCF    lea         eax,[ebp-11D]
 0008FCD5    call        StrPCopy
 0008FCDA    push        104
 0008FCDF    lea         eax,[ebp-328]
 0008FCE5    push        eax
 0008FCE6    push        0FF
 0008FCE8    lea         eax,[ebp-11D]
 0008FCEE    push        eax
 0008FCEF    push        0
 0008FCF1    push        0
 0008FCF3    call        kernel32.MultiByteToWideChar
 0008FCF8    push        0
 0008FCFA    lea         eax,[ebp-328]
 0008FD00    push        eax
 0008FD01    mov         eax,dword ptr [ebp-18]
 0008FD04    push        eax
 0008FD05    mov         eax,dword ptr [eax]
 0008FD07    call        dword ptr [eax+18]
 0008FD0A    test        eax,eax
 0008FD0C    sete        byte ptr [ebp-0D]
 0008FD10    xor         eax,eax
 0008FD12    pop         edx
 0008FD13    pop         ecx
 0008FD14    pop         ecx
 0008FD15    mov         dword ptr fs:[eax],edx
>0008FD18    jmp         0008FD24
>0008FD1A    jmp         @HandleAnyException
 0008FD1F    call        @DoneExcept
 0008FD24    xor         eax,eax
 0008FD26    pop         edx
 0008FD27    pop         ecx
 0008FD28    pop         ecx
 0008FD29    mov         dword ptr fs:[eax],edx
>0008FD2C    jmp         0008FD38
>0008FD2E    jmp         @HandleAnyException
 0008FD33    call        @DoneExcept
 0008FD38    xor         eax,eax
 0008FD3A    pop         edx
 0008FD3B    pop         ecx
 0008FD3C    pop         ecx
 0008FD3D    mov         dword ptr fs:[eax],edx
 0008FD40    push        8FD8F
 0008FD45    lea         eax,[ebp-330]
 0008FD4B    mov         edx,2
 0008FD50    call        @LStrArrayClr
 0008FD55    lea         eax,[ebp-18]
 0008FD58    call        @IntfClear
 0008FD5D    lea         eax,[ebp-14]
 0008FD60    call        @IntfClear
 0008FD65    lea         eax,[ebp-0C]
 0008FD68    mov         edx,3
 0008FD6D    call        @LStrArrayClr
 0008FD72    lea         eax,[ebp+0C]
 0008FD75    call        @LStrClr
 0008FD7A    lea         eax,[ebp+18]
 0008FD7D    mov         edx,2
 0008FD82    call        @LStrArrayClr
 0008FD87    ret
>0008FD88    jmp         @HandleFinally
>0008FD8D    jmp         0008FD45
 0008FD8F    mov         al,byte ptr [ebp-0D]
 0008FD92    pop         edi
 0008FD93    pop         esi
 0008FD94    pop         ebx
 0008FD95    mov         esp,ebp
 0008FD97    pop         ebp
 0008FD98    ret         18
end;*}

//0008FDA8
{*procedure sub_0008FDA8(?:?; ?:AnsiString; ?:?);
begin
 0008FDA8    push        ebp
 0008FDA9    mov         ebp,esp
 0008FDAB    add         esp,0FFFFFE7C
 0008FDB1    push        ebx
 0008FDB2    xor         ebx,ebx
 0008FDB4    mov         dword ptr [ebp-184],ebx
 0008FDBA    mov         dword ptr [ebp-0C],ebx
 0008FDBD    mov         dword ptr [ebp-10],ebx
 0008FDC0    mov         dword ptr [ebp-14],ebx
 0008FDC3    mov         dword ptr [ebp-18],ebx
 0008FDC6    mov         dword ptr [ebp-1C],ebx
 0008FDC9    mov         ebx,ecx
 0008FDCB    mov         dword ptr [ebp-8],edx
 0008FDCE    mov         dword ptr [ebp-4],eax
 0008FDD1    mov         eax,dword ptr [ebp-4]
 0008FDD4    call        @LStrAddRef
 0008FDD9    mov         eax,dword ptr [ebp-8]
 0008FDDC    call        @LStrAddRef
 0008FDE1    lea         eax,[ebp-180]
 0008FDE7    mov         edx,dword ptr ds:[176C8];TSearchRec
 0008FDED    call        @AddRefRecord
 0008FDF2    xor         eax,eax
 0008FDF4    push        ebp
 0008FDF5    push        8FED7
 0008FDFA    push        dword ptr fs:[eax]
 0008FDFD    mov         dword ptr fs:[eax],esp
 0008FE00    mov         eax,ebx
 0008FE02    call        @LStrClr
 0008FE07    lea         edx,[ebp-0C]
 0008FE0A    mov         eax,dword ptr [ebp-8]
 0008FE0D    call        0008F57C
 0008FE12    lea         eax,[ebp-184]
 0008FE18    mov         ecx,8FEEC;'\*.lnk'
 0008FE1D    mov         edx,dword ptr [ebp-0C]
 0008FE20    call        @LStrCat3
 0008FE25    mov         eax,dword ptr [ebp-184]
 0008FE2B    lea         ecx,[ebp-180]
 0008FE31    mov         edx,3F
 0008FE36    call        FindFirst
 0008FE3B    test        eax,eax
>0008FE3D    jne         0008FE95
 0008FE3F    lea         eax,[ebp-14]
 0008FE42    push        eax
 0008FE43    lea         eax,[ebp-18]
 0008FE46    push        eax
 0008FE47    lea         eax,[ebp-1E]
 0008FE4A    push        eax
 0008FE4B    lea         eax,[ebp-25]
 0008FE4E    push        eax
 0008FE4F    lea         eax,[ebp-1C]
 0008FE52    push        eax
 0008FE53    lea         eax,[ebp-24]
 0008FE56    push        eax
 0008FE57    lea         ecx,[ebp-10]
 0008FE5A    mov         edx,dword ptr [ebp-8]
 0008FE5D    mov         eax,dword ptr [ebp-174]
 0008FE63    call        0008F7B8
 0008FE68    mov         edx,dword ptr [ebp-10]
 0008FE6B    mov         eax,dword ptr [ebp-4]
 0008FE6E    call        AnsiCompareText
 0008FE73    test        eax,eax
>0008FE75    jne         0008FE86
 0008FE77    mov         eax,ebx
 0008FE79    mov         edx,dword ptr [ebp-174]
 0008FE7F    call        @LStrLAsg
>0008FE84    jmp         0008FE95
 0008FE86    lea         eax,[ebp-180]
 0008FE8C    call        FindNext
 0008FE91    test        eax,eax
>0008FE93    je          0008FE3F
 0008FE95    lea         eax,[ebp-180]
 0008FE9B    call        FindClose
 0008FEA0    xor         eax,eax
 0008FEA2    pop         edx
 0008FEA3    pop         ecx
 0008FEA4    pop         ecx
 0008FEA5    mov         dword ptr fs:[eax],edx
 0008FEA8    push        8FEDE
 0008FEAD    lea         eax,[ebp-184]
 0008FEB3    call        @LStrClr
 0008FEB8    lea         eax,[ebp-180]
 0008FEBE    mov         edx,dword ptr ds:[176C8];TSearchRec
 0008FEC4    call        @FinalizeRecord
 0008FEC9    lea         eax,[ebp-1C]
 0008FECC    mov         edx,7
 0008FED1    call        @LStrArrayClr
 0008FED6    ret
>0008FED7    jmp         @HandleFinally
>0008FEDC    jmp         0008FEAD
 0008FEDE    pop         ebx
 0008FEDF    mov         esp,ebp
 0008FEE1    pop         ebp
 0008FEE2    ret
end;*}

//0008FEF4
{*function sub_0008FEF4(?:AnsiString; ?:?; ?:AnsiString; ?:?):?;
begin
 0008FEF4    push        ebp
 0008FEF5    mov         ebp,esp
 0008FEF7    add         esp,0FFFFFFE8
 0008FEFA    push        ebx
 0008FEFB    push        esi
 0008FEFC    push        edi
 0008FEFD    xor         ebx,ebx
 0008FEFF    mov         dword ptr [ebp-10],ebx
 0008FF02    mov         dword ptr [ebp-14],ebx
 0008FF05    mov         dword ptr [ebp-18],ebx
 0008FF08    mov         dword ptr [ebp-8],ecx
 0008FF0B    mov         dword ptr [ebp-4],edx
 0008FF0E    mov         esi,eax
 0008FF10    mov         edi,dword ptr [ebp+8]
 0008FF13    mov         eax,dword ptr [ebp-4]
 0008FF16    call        @LStrAddRef
 0008FF1B    mov         eax,dword ptr [ebp-8]
 0008FF1E    call        @LStrAddRef
 0008FF23    xor         eax,eax
 0008FF25    push        ebp
 0008FF26    push        900AE
 0008FF2B    push        dword ptr fs:[eax]
 0008FF2E    mov         dword ptr fs:[eax],esp
 0008FF31    mov         byte ptr [ebp-9],1
 0008FF35    lea         edx,[ebp-14]
 0008FF38    mov         eax,[000B59E8];^Application:TApplication
 0008FF3D    mov         eax,dword ptr [eax]
 0008FF3F    call        TApplication.GetExeName
 0008FF44    mov         eax,dword ptr [ebp-14]
 0008FF47    lea         ecx,[ebp-10]
 0008FF4A    mov         edx,dword ptr [ebp-8]
 0008FF4D    call        0008FDA8
 0008FF52    cmp         dword ptr [ebp-10],0
>0008FF56    jne         00090086
 0008FF5C    movzx       eax,di
 0008FF5F    push        eax
 0008FF60    push        900CC;'Link in '
 0008FF65    push        dword ptr [ebp-8]
 0008FF68    push        900E0;' folder not yet existing'
 0008FF6D    lea         eax,[ebp-10]
 0008FF70    mov         edx,3
 0008FF75    call        @LStrCatN
 0008FF7A    mov         eax,dword ptr [ebp-10]
 0008FF7D    mov         ecx,esi
 0008FF7F    mov         edx,90104;'Create link with name:'
 0008FF84    call        0008D150
 0008FF89    mov         ebx,eax
 0008FF8B    test        bl,bl
>0008FF8D    je          0009007E
 0008FF93    mov         edx,dword ptr [esi]
 0008FF95    mov         eax,90124;'.'
 0008FF9A    call        @LStrPos
 0008FF9F    test        eax,eax
>0008FFA1    jle         0008FFBF
 0008FFA3    push        esi
 0008FFA4    mov         edx,dword ptr [esi]
 0008FFA6    mov         eax,90124;'.'
 0008FFAB    call        @LStrPos
 0008FFB0    mov         ecx,eax
 0008FFB2    dec         ecx
 0008FFB3    mov         eax,dword ptr [esi]
 0008FFB5    mov         edx,1
 0008FFBA    call        @LStrCopy
 0008FFBF    cmp         dword ptr [esi],0
>0008FFC2    jne         0008FFD3
 0008FFC4    mov         eax,90130;'Please enter a name for this link.'
 0008FFC9    call        0008D0A8
>0008FFCE    jmp         0009007E
 0008FFD3    lea         edx,[ebp-14]
 0008FFD6    mov         eax,dword ptr [ebp-8]
 0008FFD9    call        0008F57C
 0008FFDE    push        dword ptr [ebp-14]
 0008FFE1    push        9015C;'\'
 0008FFE6    push        dword ptr [esi]
 0008FFE8    push        90168;'.lnk'
 0008FFED    lea         eax,[ebp-10]
 0008FFF0    mov         edx,4
 0008FFF5    call        @LStrCatN
 0008FFFA    mov         eax,dword ptr [ebp-10]
 0008FFFD    call        FileExists
 00090002    test        al,al
>00090004    je          00090012
 00090006    mov         eax,90178;'Shell link with this name already existing.'+#13+#10+Please select a differen...
 0009000B    call        0008D0A8
>00090010    jmp         0009007E
 00090012    xor         ebx,ebx
 00090014    mov         eax,dword ptr [ebp-4]
 00090017    push        eax
 00090018    lea         edx,[ebp-14]
 0009001B    mov         eax,[000B59E8];^Application:TApplication
 00090020    mov         eax,dword ptr [eax]
 00090022    call        TApplication.GetExeName
 00090027    mov         eax,dword ptr [ebp-14]
 0009002A    lea         edx,[ebp-10]
 0009002D    call        ExtractFileDir
 00090032    mov         eax,dword ptr [ebp-10]
 00090035    push        eax
 00090036    push        0
 00090038    push        0
 0009003A    push        0
 0009003C    push        0
 0009003E    lea         edx,[ebp-14]
 00090041    mov         eax,[000B59E8];^Application:TApplication
 00090046    mov         eax,dword ptr [eax]
 00090048    call        TApplication.GetExeName
 0009004D    mov         eax,dword ptr [ebp-14]
 00090050    push        eax
 00090051    mov         edx,dword ptr [esi]
 00090053    lea         eax,[ebp-18]
 00090056    mov         ecx,90168;'.lnk'
 0009005B    call        @LStrCat3
 00090060    mov         eax,dword ptr [ebp-18]
 00090063    mov         edx,dword ptr [ebp-8]
 00090066    pop         ecx
 00090067    call        0008FAB0
 0009006C    test        al,al
>0009006E    jne         0009007E
 00090070    mov         eax,901D0;'Error creating shell link file.'+#13+#10+Please create link manually.'
 00090075    call        0008D0A8
 0009007A    mov         byte ptr [ebp-9],0
 0009007E    test        bl,bl
>00090080    jne         0008FF5C
 00090086    xor         eax,eax
 00090088    pop         edx
 00090089    pop         ecx
 0009008A    pop         ecx
 0009008B    mov         dword ptr fs:[eax],edx
 0009008E    push        900B5
 00090093    lea         eax,[ebp-18]
 00090096    mov         edx,3
 0009009B    call        @LStrArrayClr
 000900A0    lea         eax,[ebp-8]
 000900A3    mov         edx,2
 000900A8    call        @LStrArrayClr
 000900AD    ret
>000900AE    jmp         @HandleFinally
>000900B3    jmp         00090093
 000900B5    mov         al,byte ptr [ebp-9]
 000900B8    pop         edi
 000900B9    pop         esi
 000900BA    pop         ebx
 000900BB    mov         esp,ebp
 000900BD    pop         ebp
 000900BE    ret         4
end;*}

//00090210
{*function sub_00090210(?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00090210    push        ebp
 00090211    mov         ebp,esp
 00090213    add         esp,0FFFFFFE4
 00090216    push        ebx
 00090217    push        esi
 00090218    push        edi
 00090219    mov         esi,ecx
 0009021B    mov         ebx,edx
 0009021D    mov         dword ptr [ebp-4],eax
 00090220    mov         eax,dword ptr [ebp-4]
 00090223    call        @LStrAddRef
 00090228    xor         eax,eax
 0009022A    push        ebp
 0009022B    push        90334
 00090230    push        dword ptr fs:[eax]
 00090233    mov         dword ptr fs:[eax],esp
 00090236    lea         eax,[ebp-14]
 00090239    push        eax
 0009023A    mov         eax,dword ptr [ebp-4]
 0009023D    call        @LStrToPChar
 00090242    mov         edi,eax
 00090244    push        edi
 00090245    call        version.GetFileVersionInfoSizeA
 0009024A    mov         dword ptr [ebp-18],eax
 0009024D    mov         byte ptr [ebp-5],1
 00090251    cmp         dword ptr [ebp-18],0
>00090255    je          0009031A
 0009025B    mov         eax,dword ptr [ebp-18]
 0009025E    call        @GetMem
 00090263    mov         dword ptr [ebp-1C],eax
 00090266    xor         eax,eax
 00090268    push        ebp
 00090269    push        90313
 0009026E    push        dword ptr fs:[eax]
 00090271    mov         dword ptr fs:[eax],esp
 00090274    mov         eax,dword ptr [ebp-1C]
 00090277    push        eax
 00090278    mov         eax,dword ptr [ebp-18]
 0009027B    push        eax
 0009027C    mov         eax,dword ptr [ebp-14]
 0009027F    push        eax
 00090280    push        edi
 00090281    call        version.GetFileVersionInfoA
 00090286    test        eax,eax
>00090288    je          000902F6
 0009028A    lea         eax,[ebp-10]
 0009028D    push        eax
 0009028E    lea         eax,[ebp-0C]
 00090291    push        eax
 00090292    push        90348;'\'
 00090297    mov         eax,dword ptr [ebp-1C]
 0009029A    push        eax
 0009029B    call        version.VerQueryValueA
 000902A0    test        eax,eax
>000902A2    je          000902F0
 000902A4    test        ebx,ebx
>000902A6    je          000902B6
 000902A8    mov         eax,dword ptr [ebp-0C]
 000902AB    mov         eax,dword ptr [eax+8]
 000902AE    call        00017194
 000902B3    mov         word ptr [ebx],ax
 000902B6    test        esi,esi
>000902B8    je          000902C4
 000902BA    mov         eax,dword ptr [ebp-0C]
 000902BD    mov         ax,word ptr [eax+8]
 000902C1    mov         word ptr [esi],ax
 000902C4    cmp         dword ptr [ebp+0C],0
>000902C8    je          000902DB
 000902CA    mov         eax,dword ptr [ebp-0C]
 000902CD    mov         eax,dword ptr [eax+0C]
 000902D0    call        00017194
 000902D5    mov         edx,dword ptr [ebp+0C]
 000902D8    mov         word ptr [edx],ax
 000902DB    cmp         dword ptr [ebp+8],0
>000902DF    je          000902FA
 000902E1    mov         eax,dword ptr [ebp-0C]
 000902E4    mov         ax,word ptr [eax+0C]
 000902E8    mov         edx,dword ptr [ebp+8]
 000902EB    mov         word ptr [edx],ax
>000902EE    jmp         000902FA
 000902F0    mov         byte ptr [ebp-5],0
>000902F4    jmp         000902FA
 000902F6    mov         byte ptr [ebp-5],0
 000902FA    xor         eax,eax
 000902FC    pop         edx
 000902FD    pop         ecx
 000902FE    pop         ecx
 000902FF    mov         dword ptr fs:[eax],edx
 00090302    push        9031E
 00090307    mov         edx,dword ptr [ebp-18]
 0009030A    mov         eax,dword ptr [ebp-1C]
 0009030D    call        @FreeMem
 00090312    ret
>00090313    jmp         @HandleFinally
>00090318    jmp         00090307
 0009031A    mov         byte ptr [ebp-5],0
 0009031E    xor         eax,eax
 00090320    pop         edx
 00090321    pop         ecx
 00090322    pop         ecx
 00090323    mov         dword ptr fs:[eax],edx
 00090326    push        9033B
 0009032B    lea         eax,[ebp-4]
 0009032E    call        @LStrClr
 00090333    ret
>00090334    jmp         @HandleFinally
>00090339    jmp         0009032B
 0009033B    mov         al,byte ptr [ebp-5]
 0009033E    pop         edi
 0009033F    pop         esi
 00090340    pop         ebx
 00090341    mov         esp,ebp
 00090343    pop         ebp
 00090344    ret         8
end;*}

//0009034C
{*procedure sub_0009034C(?:?; ?:?);
begin
 0009034C    push        ebp
 0009034D    mov         ebp,esp
 0009034F    add         esp,0FFFFFFF0
 00090352    push        ebx
 00090353    push        esi
 00090354    xor         ecx,ecx
 00090356    mov         dword ptr [ebp-0C],ecx
 00090359    mov         dword ptr [ebp-10],ecx
 0009035C    mov         ebx,edx
 0009035E    mov         esi,eax
 00090360    xor         eax,eax
 00090362    push        ebp
 00090363    push        90414
 00090368    push        dword ptr fs:[eax]
 0009036B    mov         dword ptr fs:[eax],esp
 0009036E    lea         eax,[ebp-6]
 00090371    push        eax
 00090372    lea         eax,[ebp-8]
 00090375    push        eax
 00090376    lea         ecx,[ebp-4]
 00090379    lea         edx,[ebp-2]
 0009037C    mov         eax,esi
 0009037E    call        00090210
 00090383    test        al,al
>00090385    je          000903F2
 00090387    lea         edx,[ebp-0C]
 0009038A    movzx       eax,word ptr [ebp-2]
 0009038E    call        IntToStr
 00090393    push        dword ptr [ebp-0C]
 00090396    push        9042C;'.'
 0009039B    lea         edx,[ebp-10]
 0009039E    movzx       eax,word ptr [ebp-4]
 000903A2    call        IntToStr
 000903A7    push        dword ptr [ebp-10]
 000903AA    mov         eax,ebx
 000903AC    mov         edx,3
 000903B1    call        @LStrCatN
 000903B6    cmp         word ptr [ebp-6],0
>000903BB    jbe         000903D3
 000903BD    lea         edx,[ebp-0C]
 000903C0    movzx       eax,word ptr [ebp-6]
 000903C4    call        IntToStr
 000903C9    mov         edx,dword ptr [ebp-0C]
 000903CC    mov         eax,ebx
 000903CE    call        @LStrCat
 000903D3    cmp         word ptr [ebp-8],0
>000903D8    jbe         000903F9
 000903DA    lea         edx,[ebp-0C]
 000903DD    movzx       eax,word ptr [ebp-8]
 000903E1    call        IntToStr
 000903E6    mov         edx,dword ptr [ebp-0C]
 000903E9    mov         eax,ebx
 000903EB    call        @LStrCat
>000903F0    jmp         000903F9
 000903F2    mov         eax,ebx
 000903F4    call        @LStrClr
 000903F9    xor         eax,eax
 000903FB    pop         edx
 000903FC    pop         ecx
 000903FD    pop         ecx
 000903FE    mov         dword ptr fs:[eax],edx
 00090401    push        9041B
 00090406    lea         eax,[ebp-10]
 00090409    mov         edx,2
 0009040E    call        @LStrArrayClr
 00090413    ret
>00090414    jmp         @HandleFinally
>00090419    jmp         00090406
 0009041B    pop         esi
 0009041C    pop         ebx
 0009041D    mov         esp,ebp
 0009041F    pop         ebp
 00090420    ret
end;*}

//00090430
{*function sub_00090430(?:?):?;
begin
 00090430    push        ebx
 00090431    push        esi
 00090432    add         esp,0FFFFFFF8
 00090435    mov         ebx,eax
 00090437    mov         edx,esp
 00090439    mov         eax,ebx
 0009043B    mov         ecx,dword ptr [eax]
 0009043D    call        dword ptr [ecx+40]
 00090440    mov         esi,dword ptr [esp+4]
 00090444    sub         esi,dword ptr [ebx+34]
 00090447    push        21
 00090449    call        user32.GetSystemMetrics
 0009044E    sub         esi,eax
 00090450    push        4
 00090452    call        user32.GetSystemMetrics
 00090457    xchg        eax,esi
 00090458    sub         eax,esi
 0009045A    pop         ecx
 0009045B    pop         edx
 0009045C    pop         esi
 0009045D    pop         ebx
 0009045E    ret
end;*}

Initialization
//000904A0
{*
 000904A0    sub         dword ptr ds:[0B6B30],1
>000904A7    jae         000904B0
 000904A9    mov         byte ptr ds:[0B6B34],0;gvar_000B6B34
 000904B0    ret
*}
Finalization
//00090460
{*
 00090460    push        ebp
 00090461    mov         ebp,esp
 00090463    xor         eax,eax
 00090465    push        ebp
 00090466    push        90495
 0009046B    push        dword ptr fs:[eax]
 0009046E    mov         dword ptr fs:[eax],esp
 00090471    inc         dword ptr ds:[0B6B30]
>00090477    jne         00090487
 00090479    cmp         byte ptr ds:[0B6B34],0;gvar_000B6B34
>00090480    je          00090487
 00090482    call        ole32.CoUninitialize
 00090487    xor         eax,eax
 00090489    pop         edx
 0009048A    pop         ecx
 0009048B    pop         ecx
 0009048C    mov         dword ptr fs:[eax],edx
 0009048F    push        9049C
 00090494    ret
>00090495    jmp         @HandleFinally
>0009049A    jmp         00090494
 0009049C    pop         ebp
 0009049D    ret
*}
end.