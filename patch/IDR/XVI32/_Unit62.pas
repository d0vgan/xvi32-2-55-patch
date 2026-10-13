//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit62;

interface

uses
  SysUtils, Classes;

    //function sub_0008E328(?:Integer; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//0008E328

implementation

//0008E328
{*function sub_0008E328(?:Integer; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 0008E328    push        ebp
 0008E329    mov         ebp,esp
 0008E32B    add         esp,0FFFFFFEC
 0008E32E    push        ebx
 0008E32F    push        esi
 0008E330    push        edi
 0008E331    mov         ebx,ecx
 0008E333    mov         dword ptr [ebp-4],edx
 0008E336    mov         edi,eax
 0008E338    mov         esi,dword ptr [ebp+14]
 0008E33B    mov         eax,dword ptr [ebp+0C]
 0008E33E    call        @LStrAddRef
 0008E343    mov         eax,dword ptr [ebp+8]
 0008E346    call        @LStrAddRef
 0008E34B    xor         eax,eax
 0008E34D    push        ebp
 0008E34E    push        8E475
 0008E353    push        dword ptr fs:[eax]
 0008E356    mov         dword ptr fs:[eax],esp
 0008E359    mov         eax,dword ptr [ebp+0C]
 0008E35C    push        eax
 0008E35D    mov         eax,dword ptr [ebp+8]
 0008E360    push        eax
 0008E361    push        1
 0008E363    push        1
 0008E365    mov         ecx,dword ptr [ebp+10]
 0008E368    mov         dl,1
 0008E36A    mov         eax,[0008C62C];TProgressBox
 0008E36F    call        TProgressBox.Create;TProgressBox.Create
 0008E374    mov         dword ptr [ebp-10],eax
 0008E377    xor         edx,edx
 0008E379    push        ebp
 0008E37A    push        8E453
 0008E37F    push        dword ptr fs:[edx]
 0008E382    mov         dword ptr fs:[edx],esp
 0008E385    mov         eax,dword ptr [ebp-10]
 0008E388    call        TCustomForm.Show
 0008E38D    mov         dword ptr [ebx],0FFFFFFFF
 0008E393    mov         word ptr [esi],0
 0008E398    mov         eax,dword ptr [ebp-4]
 0008E39B    dec         eax
 0008E39C    test        eax,eax
>0008E39E    jb          0008E42D
 0008E3A4    inc         eax
 0008E3A5    mov         dword ptr [ebp-14],eax
 0008E3A8    mov         dword ptr [ebp-0C],0
 0008E3AF    mov         al,byte ptr [edi]
 0008E3B1    xor         edx,edx
 0008E3B3    mov         dl,al
 0008E3B5    mov         ecx,dword ptr [ebx]
 0008E3B7    and         ecx,0FF
 0008E3BD    xor         edx,ecx
 0008E3BF    mov         edx,dword ptr [edx*4+0B4FA0]
 0008E3C6    mov         ecx,dword ptr [ebx]
 0008E3C8    shr         ecx,8
 0008E3CB    xor         edx,ecx
 0008E3CD    mov         dword ptr [ebx],edx
 0008E3CF    and         eax,0FF
 0008E3D4    mov         dx,word ptr [esi]
 0008E3D7    and         dx,0FF
 0008E3DC    xor         ax,dx
 0008E3DF    movzx       eax,ax
 0008E3E2    mov         ax,word ptr [eax*2+0B53A0]
 0008E3EA    mov         dx,word ptr [esi]
 0008E3ED    shr         dx,8
 0008E3F1    xor         ax,dx
 0008E3F4    mov         word ptr [esi],ax
 0008E3F7    inc         edi
 0008E3F8    mov         eax,dword ptr [ebp-0C]
 0008E3FB    mov         ecx,64
 0008E400    xor         edx,edx
 0008E402    div         eax,ecx
 0008E404    test        edx,edx
>0008E406    jne         0008E425
 0008E408    push        5
 0008E40A    mov         ecx,dword ptr [ebp-4]
 0008E40D    dec         ecx
 0008E40E    mov         edx,dword ptr [ebp-0C]
 0008E411    mov         eax,dword ptr [ebp-10]
 0008E414    call        0008E1A4
 0008E419    mov         eax,dword ptr [ebp-10]
 0008E41C    cmp         byte ptr [eax+2DC],0;TProgressBox.?f2DC:byte
>0008E423    jne         0008E42D
 0008E425    inc         dword ptr [ebp-0C]
 0008E428    dec         dword ptr [ebp-14]
>0008E42B    jne         0008E3AF
 0008E42D    not         dword ptr [ebx]
 0008E42F    mov         eax,dword ptr [ebp-10]
 0008E432    mov         al,byte ptr [eax+2DC];TProgressBox.?f2DC:byte
 0008E438    xor         al,1
 0008E43A    mov         byte ptr [ebp-5],al
 0008E43D    xor         eax,eax
 0008E43F    pop         edx
 0008E440    pop         ecx
 0008E441    pop         ecx
 0008E442    mov         dword ptr fs:[eax],edx
 0008E445    push        8E45A
 0008E44A    mov         eax,dword ptr [ebp-10]
 0008E44D    call        TObject.Free
 0008E452    ret
>0008E453    jmp         @HandleFinally
>0008E458    jmp         0008E44A
 0008E45A    xor         eax,eax
 0008E45C    pop         edx
 0008E45D    pop         ecx
 0008E45E    pop         ecx
 0008E45F    mov         dword ptr fs:[eax],edx
 0008E462    push        8E47C
 0008E467    lea         eax,[ebp+8]
 0008E46A    mov         edx,2
 0008E46F    call        @LStrArrayClr
 0008E474    ret
>0008E475    jmp         @HandleFinally
>0008E47A    jmp         0008E467
 0008E47C    mov         al,byte ptr [ebp-5]
 0008E47F    pop         edi
 0008E480    pop         esi
 0008E481    pop         ebx
 0008E482    mov         esp,ebp
 0008E484    pop         ebp
 0008E485    ret         10
end;*}

end.