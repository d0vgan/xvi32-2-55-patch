//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Clipbrd;

interface

uses
  SysUtils, Classes;

type
  TClipboard = class(TPersistent)
  public
    FOpenRefCount:Integer;//f4
    FClipboardWindow:HWND;//f8
    FAllocated:Boolean;//fC
    FEmptied:Boolean;//fD
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0003DB40
    procedure Assign(Source:TPersistent); virtual;//v8//0003DCB0
    procedure Clear;//0003D6B8
    procedure Adding;//0003D6FC
    procedure Close;//0003D718
    procedure Open;//0003D744
    procedure WndProc(var Message:TMessage);//0003D7DC
    procedure SetBuffer(Format:Word; var Buffer:void ; Size:Integer);//0003D7FC
    function GetAsText:AnsiString;//0003D8E0
    procedure SetAsText(const Value:AnsiString);//0003D960
    procedure AssignToPicture(Dest:TPicture);//0003D988
    procedure AssignToBitmap(Dest:TBitmap);//0003DA74
    procedure AssignToMetafile(Dest:TMetafile);//0003DADC
    procedure AssignPicture(Source:TPicture);//0003DBA8
    procedure AssignGraphic(Source:TGraphic);//0003DC2C
  end;
    procedure AssignTo(Dest:TPersistent);//0003DB40
    procedure Assign(Source:TPersistent);//0003DCB0
    function Clipboard:TClipboard;//0003DCFC

implementation

//0003D6B8
procedure TClipboard.Clear;
begin
{*
 0003D6B8    push        ebp
 0003D6B9    mov         ebp,esp
 0003D6BB    push        ecx
 0003D6BC    mov         dword ptr [ebp-4],eax
 0003D6BF    mov         eax,dword ptr [ebp-4]
 0003D6C2    call        TClipboard.Open
 0003D6C7    xor         eax,eax
 0003D6C9    push        ebp
 0003D6CA    push        3D6F0
 0003D6CF    push        dword ptr fs:[eax]
 0003D6D2    mov         dword ptr fs:[eax],esp
 0003D6D5    call        user32.EmptyClipboard
 0003D6DA    xor         eax,eax
 0003D6DC    pop         edx
 0003D6DD    pop         ecx
 0003D6DE    pop         ecx
 0003D6DF    mov         dword ptr fs:[eax],edx
 0003D6E2    push        3D6F7
 0003D6E7    mov         eax,dword ptr [ebp-4]
 0003D6EA    call        TClipboard.Close
 0003D6EF    ret
>0003D6F0    jmp         @HandleFinally
>0003D6F5    jmp         0003D6E7
 0003D6F7    pop         ecx
 0003D6F8    pop         ebp
 0003D6F9    ret
*}
end;

//0003D6FC
procedure TClipboard.Adding;
begin
{*
 0003D6FC    push        ebx
 0003D6FD    mov         ebx,eax
 0003D6FF    cmp         dword ptr [ebx+4],0
>0003D703    je          0003D716
 0003D705    cmp         byte ptr [ebx+0D],0
>0003D709    jne         0003D716
 0003D70B    mov         eax,ebx
 0003D70D    call        TClipboard.Clear
 0003D712    mov         byte ptr [ebx+0D],1
 0003D716    pop         ebx
 0003D717    ret
*}
end;

//0003D718
procedure TClipboard.Close;
begin
{*
 0003D718    push        ebx
 0003D719    mov         ebx,eax
 0003D71B    cmp         dword ptr [ebx+4],0
>0003D71F    je          0003D742
 0003D721    dec         dword ptr [ebx+4]
 0003D724    cmp         dword ptr [ebx+4],0
>0003D728    jne         0003D742
 0003D72A    call        user32.CloseClipboard
 0003D72F    cmp         byte ptr [ebx+0C],0
>0003D733    je          0003D73D
 0003D735    mov         eax,dword ptr [ebx+8]
 0003D738    call        DeallocateHWnd
 0003D73D    xor         eax,eax
 0003D73F    mov         dword ptr [ebx+8],eax
 0003D742    pop         ebx
 0003D743    ret
*}
end;

//0003D744
procedure TClipboard.Open;
begin
{*
 0003D744    push        ebp
 0003D745    mov         ebp,esp
 0003D747    push        0
 0003D749    push        ebx
 0003D74A    mov         ebx,eax
 0003D74C    xor         eax,eax
 0003D74E    push        ebp
 0003D74F    push        3D7CE
 0003D754    push        dword ptr fs:[eax]
 0003D757    mov         dword ptr fs:[eax],esp
 0003D75A    cmp         dword ptr [ebx+4],0
>0003D75E    jne         0003D7B5
 0003D760    mov         eax,[000B59E8];^Application:TApplication
 0003D765    mov         eax,dword ptr [eax]
 0003D767    mov         eax,dword ptr [eax+24]
 0003D76A    mov         dword ptr [ebx+8],eax
 0003D76D    test        eax,eax
>0003D76F    jne         0003D783
 0003D771    push        ebx
 0003D772    push        3D7DC;TClipboard.WndProc
 0003D777    call        AllocateHWnd
 0003D77C    mov         dword ptr [ebx+8],eax
 0003D77F    mov         byte ptr [ebx+0C],1
 0003D783    mov         eax,dword ptr [ebx+8]
 0003D786    push        eax
 0003D787    call        user32.OpenClipboard
 0003D78C    test        eax,eax
>0003D78E    jne         0003D7B1
 0003D790    lea         edx,[ebp-4]
 0003D793    mov         eax,[000B56C4];^SCannotOpenClipboard:TResStringRec
 0003D798    call        LoadResString
 0003D79D    mov         ecx,dword ptr [ebp-4]
 0003D7A0    mov         dl,1
 0003D7A2    mov         eax,[000176E8];Exception
 0003D7A7    call        Exception.Create
 0003D7AC    call        @RaiseExcept
 0003D7B1    mov         byte ptr [ebx+0D],0
 0003D7B5    inc         dword ptr [ebx+4]
 0003D7B8    xor         eax,eax
 0003D7BA    pop         edx
 0003D7BB    pop         ecx
 0003D7BC    pop         ecx
 0003D7BD    mov         dword ptr fs:[eax],edx
 0003D7C0    push        3D7D5
 0003D7C5    lea         eax,[ebp-4]
 0003D7C8    call        @LStrClr
 0003D7CD    ret
>0003D7CE    jmp         @HandleFinally
>0003D7D3    jmp         0003D7C5
 0003D7D5    pop         ebx
 0003D7D6    pop         ecx
 0003D7D7    pop         ebp
 0003D7D8    ret
*}
end;

//0003D7DC
procedure TClipboard.WndProc(var Message:TMessage);
begin
{*
 0003D7DC    push        ebx
 0003D7DD    push        esi
 0003D7DE    mov         ebx,edx
 0003D7E0    mov         esi,eax
 0003D7E2    mov         eax,dword ptr [ebx+8]
 0003D7E5    push        eax
 0003D7E6    mov         eax,dword ptr [ebx+4]
 0003D7E9    push        eax
 0003D7EA    mov         eax,dword ptr [ebx]
 0003D7EC    push        eax
 0003D7ED    mov         eax,dword ptr [esi+8]
 0003D7F0    push        eax
 0003D7F1    call        user32.DefWindowProcA
 0003D7F6    mov         dword ptr [ebx+0C],eax
 0003D7F9    pop         esi
 0003D7FA    pop         ebx
 0003D7FB    ret
*}
end;

//0003D7FC
procedure TClipboard.SetBuffer(Format:Word; var Buffer:void ; Size:Integer);
begin
{*
 0003D7FC    push        ebp
 0003D7FD    mov         ebp,esp
 0003D7FF    add         esp,0FFFFFFF8
 0003D802    push        ebx
 0003D803    push        esi
 0003D804    push        edi
 0003D805    mov         edi,ecx
 0003D807    mov         esi,edx
 0003D809    mov         dword ptr [ebp-4],eax
 0003D80C    mov         ebx,dword ptr [ebp+8]
 0003D80F    mov         eax,dword ptr [ebp-4]
 0003D812    call        TClipboard.Open
 0003D817    xor         edx,edx
 0003D819    push        ebp
 0003D81A    push        3D8CE
 0003D81F    push        dword ptr fs:[edx]
 0003D822    mov         dword ptr fs:[edx],esp
 0003D825    push        ebx
 0003D826    push        2002
 0003D82B    call        kernel32.GlobalAlloc
 0003D830    mov         dword ptr [ebp-8],eax
 0003D833    xor         edx,edx
 0003D835    push        ebp
 0003D836    push        3D8A0
 0003D83B    push        dword ptr fs:[edx]
 0003D83E    mov         dword ptr fs:[edx],esp
 0003D841    mov         eax,dword ptr [ebp-8]
 0003D844    push        eax
 0003D845    call        kernel32.GlobalLock
 0003D84A    xor         edx,edx
 0003D84C    push        ebp
 0003D84D    push        3D88F
 0003D852    push        dword ptr fs:[edx]
 0003D855    mov         dword ptr fs:[edx],esp
 0003D858    mov         edx,eax
 0003D85A    mov         eax,edi
 0003D85C    mov         ecx,ebx
 0003D85E    call        Move
 0003D863    mov         eax,dword ptr [ebp-4]
 0003D866    call        TClipboard.Adding
 0003D86B    mov         eax,dword ptr [ebp-8]
 0003D86E    push        eax
 0003D86F    movzx       eax,si
 0003D872    push        eax
 0003D873    call        user32.SetClipboardData
 0003D878    xor         eax,eax
 0003D87A    pop         edx
 0003D87B    pop         ecx
 0003D87C    pop         ecx
 0003D87D    mov         dword ptr fs:[eax],edx
 0003D880    push        3D896
 0003D885    mov         eax,dword ptr [ebp-8]
 0003D888    push        eax
 0003D889    call        kernel32.GlobalUnlock
 0003D88E    ret
>0003D88F    jmp         @HandleFinally
>0003D894    jmp         0003D885
 0003D896    xor         eax,eax
 0003D898    pop         edx
 0003D899    pop         ecx
 0003D89A    pop         ecx
 0003D89B    mov         dword ptr fs:[eax],edx
>0003D89E    jmp         0003D8B8
>0003D8A0    jmp         @HandleAnyException
 0003D8A5    mov         eax,dword ptr [ebp-8]
 0003D8A8    push        eax
 0003D8A9    call        kernel32.GlobalFree
 0003D8AE    call        @RaiseAgain
 0003D8B3    call        @DoneExcept
 0003D8B8    xor         eax,eax
 0003D8BA    pop         edx
 0003D8BB    pop         ecx
 0003D8BC    pop         ecx
 0003D8BD    mov         dword ptr fs:[eax],edx
 0003D8C0    push        3D8D5
 0003D8C5    mov         eax,dword ptr [ebp-4]
 0003D8C8    call        TClipboard.Close
 0003D8CD    ret
>0003D8CE    jmp         @HandleFinally
>0003D8D3    jmp         0003D8C5
 0003D8D5    pop         edi
 0003D8D6    pop         esi
 0003D8D7    pop         ebx
 0003D8D8    pop         ecx
 0003D8D9    pop         ecx
 0003D8DA    pop         ebp
 0003D8DB    ret         4
*}
end;

//0003D8E0
function TClipboard.GetAsText:AnsiString;
begin
{*
 0003D8E0    push        ebp
 0003D8E1    mov         ebp,esp
 0003D8E3    add         esp,0FFFFFFF8
 0003D8E6    push        ebx
 0003D8E7    mov         ebx,edx
 0003D8E9    mov         dword ptr [ebp-4],eax
 0003D8EC    mov         eax,dword ptr [ebp-4]
 0003D8EF    call        TClipboard.Open
 0003D8F4    push        1
 0003D8F6    call        user32.GetClipboardData
 0003D8FB    mov         dword ptr [ebp-8],eax
 0003D8FE    xor         eax,eax
 0003D900    push        ebp
 0003D901    push        3D952
 0003D906    push        dword ptr fs:[eax]
 0003D909    mov         dword ptr fs:[eax],esp
 0003D90C    cmp         dword ptr [ebp-8],0
>0003D910    je          0003D926
 0003D912    mov         eax,dword ptr [ebp-8]
 0003D915    push        eax
 0003D916    call        kernel32.GlobalLock
 0003D91B    mov         edx,eax
 0003D91D    mov         eax,ebx
 0003D91F    call        @LStrFromPChar
>0003D924    jmp         0003D92D
 0003D926    mov         eax,ebx
 0003D928    call        @LStrClr
 0003D92D    xor         eax,eax
 0003D92F    pop         edx
 0003D930    pop         ecx
 0003D931    pop         ecx
 0003D932    mov         dword ptr fs:[eax],edx
 0003D935    push        3D959
 0003D93A    cmp         dword ptr [ebp-8],0
>0003D93E    je          0003D949
 0003D940    mov         eax,dword ptr [ebp-8]
 0003D943    push        eax
 0003D944    call        kernel32.GlobalUnlock
 0003D949    mov         eax,dword ptr [ebp-4]
 0003D94C    call        TClipboard.Close
 0003D951    ret
>0003D952    jmp         @HandleFinally
>0003D957    jmp         0003D93A
 0003D959    pop         ebx
 0003D95A    pop         ecx
 0003D95B    pop         ecx
 0003D95C    pop         ebp
 0003D95D    ret
*}
end;

//0003D960
procedure TClipboard.SetAsText(const Value:AnsiString);
begin
{*
 0003D960    push        ebx
 0003D961    push        esi
 0003D962    mov         esi,edx
 0003D964    mov         ebx,eax
 0003D966    mov         eax,esi
 0003D968    call        @LStrLen
 0003D96D    inc         eax
 0003D96E    push        eax
 0003D96F    mov         eax,esi
 0003D971    call        @LStrToPChar
 0003D976    mov         ecx,eax
 0003D978    mov         dx,1
 0003D97C    mov         eax,ebx
 0003D97E    call        TClipboard.SetBuffer
 0003D983    pop         esi
 0003D984    pop         ebx
 0003D985    ret
*}
end;

//0003D988
procedure TClipboard.AssignToPicture(Dest:TPicture);
begin
{*
 0003D988    push        ebp
 0003D989    mov         ebp,esp
 0003D98B    add         esp,0FFFFFFF8
 0003D98E    push        ebx
 0003D98F    push        esi
 0003D990    push        edi
 0003D991    xor         ecx,ecx
 0003D993    mov         dword ptr [ebp-8],ecx
 0003D996    mov         edi,edx
 0003D998    mov         dword ptr [ebp-4],eax
 0003D99B    xor         eax,eax
 0003D99D    push        ebp
 0003D99E    push        3DA66
 0003D9A3    push        dword ptr fs:[eax]
 0003D9A6    mov         dword ptr fs:[eax],esp
 0003D9A9    mov         eax,dword ptr [ebp-4]
 0003D9AC    call        TClipboard.Open
 0003D9B1    xor         edx,edx
 0003D9B3    push        ebp
 0003D9B4    push        3DA49
 0003D9B9    push        dword ptr fs:[edx]
 0003D9BC    mov         dword ptr fs:[edx],esp
 0003D9BF    push        0
 0003D9C1    call        user32.EnumClipboardFormats
 0003D9C6    mov         ebx,eax
 0003D9C8    test        bx,bx
>0003D9CB    je          0003DA12
 0003D9CD    mov         edx,ebx
 0003D9CF    mov         eax,[00028CCC];TPicture
 0003D9D4    call        TPicture.SupportsClipboardFormat
 0003D9D9    test        al,al
>0003D9DB    je          0003DA02
 0003D9DD    movzx       eax,bx
 0003D9E0    push        eax
 0003D9E1    call        user32.GetClipboardData
 0003D9E6    mov         esi,eax
 0003D9E8    push        9
 0003D9EA    call        user32.GetClipboardData
 0003D9EF    push        eax
 0003D9F0    mov         ecx,esi
 0003D9F2    mov         edx,ebx
 0003D9F4    mov         eax,edi
 0003D9F6    call        TPicture.LoadFromClipboardFormat
 0003D9FB    call        @TryFinallyExit
>0003DA00    jmp         0003DA50
 0003DA02    movzx       eax,bx
 0003DA05    push        eax
 0003DA06    call        user32.EnumClipboardFormats
 0003DA0B    mov         ebx,eax
 0003DA0D    test        bx,bx
>0003DA10    jne         0003D9CD
 0003DA12    lea         edx,[ebp-8]
 0003DA15    mov         eax,[000B5750];^SInvalidClipFmt:TResStringRec
 0003DA1A    call        LoadResString
 0003DA1F    mov         ecx,dword ptr [ebp-8]
 0003DA22    mov         dl,1
 0003DA24    mov         eax,[000176E8];Exception
 0003DA29    call        Exception.Create
 0003DA2E    call        @RaiseExcept
 0003DA33    xor         eax,eax
 0003DA35    pop         edx
 0003DA36    pop         ecx
 0003DA37    pop         ecx
 0003DA38    mov         dword ptr fs:[eax],edx
 0003DA3B    push        3DA50
 0003DA40    mov         eax,dword ptr [ebp-4]
 0003DA43    call        TClipboard.Close
 0003DA48    ret
>0003DA49    jmp         @HandleFinally
>0003DA4E    jmp         0003DA40
 0003DA50    xor         eax,eax
 0003DA52    pop         edx
 0003DA53    pop         ecx
 0003DA54    pop         ecx
 0003DA55    mov         dword ptr fs:[eax],edx
 0003DA58    push        3DA6D
 0003DA5D    lea         eax,[ebp-8]
 0003DA60    call        @LStrClr
 0003DA65    ret
>0003DA66    jmp         @HandleFinally
>0003DA6B    jmp         0003DA5D
 0003DA6D    pop         edi
 0003DA6E    pop         esi
 0003DA6F    pop         ebx
 0003DA70    pop         ecx
 0003DA71    pop         ecx
 0003DA72    pop         ebp
 0003DA73    ret
*}
end;

//0003DA74
procedure TClipboard.AssignToBitmap(Dest:TBitmap);
begin
{*
 0003DA74    push        ebp
 0003DA75    mov         ebp,esp
 0003DA77    push        ecx
 0003DA78    push        ebx
 0003DA79    push        esi
 0003DA7A    push        edi
 0003DA7B    mov         edi,edx
 0003DA7D    mov         dword ptr [ebp-4],eax
 0003DA80    mov         eax,dword ptr [ebp-4]
 0003DA83    call        TClipboard.Open
 0003DA88    xor         eax,eax
 0003DA8A    push        ebp
 0003DA8B    push        3DACC
 0003DA90    push        dword ptr fs:[eax]
 0003DA93    mov         dword ptr fs:[eax],esp
 0003DA96    push        2
 0003DA98    call        user32.GetClipboardData
 0003DA9D    mov         ebx,eax
 0003DA9F    push        9
 0003DAA1    call        user32.GetClipboardData
 0003DAA6    mov         esi,eax
 0003DAA8    push        esi
 0003DAA9    mov         ecx,ebx
 0003DAAB    mov         dx,2
 0003DAAF    mov         eax,edi
 0003DAB1    mov         ebx,dword ptr [eax]
 0003DAB3    call        dword ptr [ebx+58]
 0003DAB6    xor         eax,eax
 0003DAB8    pop         edx
 0003DAB9    pop         ecx
 0003DABA    pop         ecx
 0003DABB    mov         dword ptr fs:[eax],edx
 0003DABE    push        3DAD3
 0003DAC3    mov         eax,dword ptr [ebp-4]
 0003DAC6    call        TClipboard.Close
 0003DACB    ret
>0003DACC    jmp         @HandleFinally
>0003DAD1    jmp         0003DAC3
 0003DAD3    pop         edi
 0003DAD4    pop         esi
 0003DAD5    pop         ebx
 0003DAD6    pop         ecx
 0003DAD7    pop         ebp
 0003DAD8    ret
*}
end;

//0003DADC
procedure TClipboard.AssignToMetafile(Dest:TMetafile);
begin
{*
 0003DADC    push        ebp
 0003DADD    mov         ebp,esp
 0003DADF    push        ecx
 0003DAE0    push        ebx
 0003DAE1    push        esi
 0003DAE2    mov         esi,edx
 0003DAE4    mov         dword ptr [ebp-4],eax
 0003DAE7    mov         eax,dword ptr [ebp-4]
 0003DAEA    call        TClipboard.Open
 0003DAEF    xor         edx,edx
 0003DAF1    push        ebp
 0003DAF2    push        3DB31
 0003DAF7    push        dword ptr fs:[edx]
 0003DAFA    mov         dword ptr fs:[edx],esp
 0003DAFD    push        3
 0003DAFF    call        user32.GetClipboardData
 0003DB04    mov         ebx,eax
 0003DB06    push        9
 0003DB08    call        user32.GetClipboardData
 0003DB0D    push        eax
 0003DB0E    mov         ecx,ebx
 0003DB10    mov         dx,3
 0003DB14    mov         eax,esi
 0003DB16    mov         ebx,dword ptr [eax]
 0003DB18    call        dword ptr [ebx+58]
 0003DB1B    xor         eax,eax
 0003DB1D    pop         edx
 0003DB1E    pop         ecx
 0003DB1F    pop         ecx
 0003DB20    mov         dword ptr fs:[eax],edx
 0003DB23    push        3DB38
 0003DB28    mov         eax,dword ptr [ebp-4]
 0003DB2B    call        TClipboard.Close
 0003DB30    ret
>0003DB31    jmp         @HandleFinally
>0003DB36    jmp         0003DB28
 0003DB38    pop         esi
 0003DB39    pop         ebx
 0003DB3A    pop         ecx
 0003DB3B    pop         ebp
 0003DB3C    ret
*}
end;

//0003DB40
procedure TClipboard.AssignTo(Dest:TPersistent);
begin
{*
 0003DB40    push        ebx
 0003DB41    push        esi
 0003DB42    mov         ebx,edx
 0003DB44    mov         esi,eax
 0003DB46    mov         eax,ebx
 0003DB48    mov         edx,dword ptr ds:[28CCC];TPicture
 0003DB4E    call        @IsClass
 0003DB53    test        al,al
>0003DB55    je          0003DB63
 0003DB57    mov         edx,ebx
 0003DB59    mov         eax,esi
 0003DB5B    call        TClipboard.AssignToPicture
 0003DB60    pop         esi
 0003DB61    pop         ebx
 0003DB62    ret
 0003DB63    mov         eax,ebx
 0003DB65    mov         edx,dword ptr ds:[28F70];TBitmap
 0003DB6B    call        @IsClass
 0003DB70    test        al,al
>0003DB72    je          0003DB7F
 0003DB74    mov         edx,ebx
 0003DB76    mov         eax,esi
 0003DB78    call        TClipboard.AssignToBitmap
>0003DB7D    jmp         0003DBA4
 0003DB7F    mov         eax,ebx
 0003DB81    mov         edx,dword ptr ds:[28E34];TMetafile
 0003DB87    call        @IsClass
 0003DB8C    test        al,al
>0003DB8E    je          0003DB9B
 0003DB90    mov         edx,ebx
 0003DB92    mov         eax,esi
 0003DB94    call        TClipboard.AssignToMetafile
>0003DB99    jmp         0003DBA4
 0003DB9B    mov         edx,ebx
 0003DB9D    mov         eax,esi
 0003DB9F    call        TPersistent.AssignTo
 0003DBA4    pop         esi
 0003DBA5    pop         ebx
 0003DBA6    ret
*}
end;

//0003DBA8
procedure TClipboard.AssignPicture(Source:TPicture);
begin
{*
 0003DBA8    push        ebp
 0003DBA9    mov         ebp,esp
 0003DBAB    add         esp,0FFFFFFF0
 0003DBAE    push        ebx
 0003DBAF    mov         ebx,edx
 0003DBB1    mov         dword ptr [ebp-4],eax
 0003DBB4    mov         eax,dword ptr [ebp-4]
 0003DBB7    call        TClipboard.Open
 0003DBBC    xor         eax,eax
 0003DBBE    push        ebp
 0003DBBF    push        3DC1D
 0003DBC4    push        dword ptr fs:[eax]
 0003DBC7    mov         dword ptr fs:[eax],esp
 0003DBCA    mov         eax,dword ptr [ebp-4]
 0003DBCD    call        TClipboard.Adding
 0003DBD2    xor         eax,eax
 0003DBD4    mov         dword ptr [ebp-10],eax
 0003DBD7    lea         eax,[ebp-10]
 0003DBDA    push        eax
 0003DBDB    lea         ecx,[ebp-8]
 0003DBDE    lea         edx,[ebp-0A]
 0003DBE1    mov         eax,ebx
 0003DBE3    call        TPicture.SaveToClipboardFormat
 0003DBE8    mov         eax,dword ptr [ebp-8]
 0003DBEB    push        eax
 0003DBEC    movzx       eax,word ptr [ebp-0A]
 0003DBF0    push        eax
 0003DBF1    call        user32.SetClipboardData
 0003DBF6    cmp         dword ptr [ebp-10],0
>0003DBFA    je          0003DC07
 0003DBFC    mov         eax,dword ptr [ebp-10]
 0003DBFF    push        eax
 0003DC00    push        9
 0003DC02    call        user32.SetClipboardData
 0003DC07    xor         eax,eax
 0003DC09    pop         edx
 0003DC0A    pop         ecx
 0003DC0B    pop         ecx
 0003DC0C    mov         dword ptr fs:[eax],edx
 0003DC0F    push        3DC24
 0003DC14    mov         eax,dword ptr [ebp-4]
 0003DC17    call        TClipboard.Close
 0003DC1C    ret
>0003DC1D    jmp         @HandleFinally
>0003DC22    jmp         0003DC14
 0003DC24    pop         ebx
 0003DC25    mov         esp,ebp
 0003DC27    pop         ebp
 0003DC28    ret
*}
end;

//0003DC2C
procedure TClipboard.AssignGraphic(Source:TGraphic);
begin
{*
 0003DC2C    push        ebp
 0003DC2D    mov         ebp,esp
 0003DC2F    add         esp,0FFFFFFF0
 0003DC32    push        ebx
 0003DC33    mov         ebx,edx
 0003DC35    mov         dword ptr [ebp-4],eax
 0003DC38    mov         eax,dword ptr [ebp-4]
 0003DC3B    call        TClipboard.Open
 0003DC40    xor         eax,eax
 0003DC42    push        ebp
 0003DC43    push        3DCA1
 0003DC48    push        dword ptr fs:[eax]
 0003DC4B    mov         dword ptr fs:[eax],esp
 0003DC4E    mov         eax,dword ptr [ebp-4]
 0003DC51    call        TClipboard.Adding
 0003DC56    xor         eax,eax
 0003DC58    mov         dword ptr [ebp-10],eax
 0003DC5B    lea         eax,[ebp-10]
 0003DC5E    push        eax
 0003DC5F    lea         ecx,[ebp-8]
 0003DC62    lea         edx,[ebp-0A]
 0003DC65    mov         eax,ebx
 0003DC67    mov         ebx,dword ptr [eax]
 0003DC69    call        dword ptr [ebx+5C]
 0003DC6C    mov         eax,dword ptr [ebp-8]
 0003DC6F    push        eax
 0003DC70    movzx       eax,word ptr [ebp-0A]
 0003DC74    push        eax
 0003DC75    call        user32.SetClipboardData
 0003DC7A    cmp         dword ptr [ebp-10],0
>0003DC7E    je          0003DC8B
 0003DC80    mov         eax,dword ptr [ebp-10]
 0003DC83    push        eax
 0003DC84    push        9
 0003DC86    call        user32.SetClipboardData
 0003DC8B    xor         eax,eax
 0003DC8D    pop         edx
 0003DC8E    pop         ecx
 0003DC8F    pop         ecx
 0003DC90    mov         dword ptr fs:[eax],edx
 0003DC93    push        3DCA8
 0003DC98    mov         eax,dword ptr [ebp-4]
 0003DC9B    call        TClipboard.Close
 0003DCA0    ret
>0003DCA1    jmp         @HandleFinally
>0003DCA6    jmp         0003DC98
 0003DCA8    pop         ebx
 0003DCA9    mov         esp,ebp
 0003DCAB    pop         ebp
 0003DCAC    ret
*}
end;

//0003DCB0
procedure TClipboard.Assign(Source:TPersistent);
begin
{*
 0003DCB0    push        ebx
 0003DCB1    push        esi
 0003DCB2    mov         ebx,edx
 0003DCB4    mov         esi,eax
 0003DCB6    mov         eax,ebx
 0003DCB8    mov         edx,dword ptr ds:[28CCC];TPicture
 0003DCBE    call        @IsClass
 0003DCC3    test        al,al
>0003DCC5    je          0003DCD3
 0003DCC7    mov         edx,ebx
 0003DCC9    mov         eax,esi
 0003DCCB    call        TClipboard.AssignPicture
 0003DCD0    pop         esi
 0003DCD1    pop         ebx
 0003DCD2    ret
 0003DCD3    mov         eax,ebx
 0003DCD5    mov         edx,dword ptr ds:[28BE8];TGraphic
 0003DCDB    call        @IsClass
 0003DCE0    test        al,al
>0003DCE2    je          0003DCEF
 0003DCE4    mov         edx,ebx
 0003DCE6    mov         eax,esi
 0003DCE8    call        TClipboard.AssignGraphic
>0003DCED    jmp         0003DCF8
 0003DCEF    mov         edx,ebx
 0003DCF1    mov         eax,esi
 0003DCF3    call        TPersistent.Assign
 0003DCF8    pop         esi
 0003DCF9    pop         ebx
 0003DCFA    ret
*}
end;

//0003DCFC
function Clipboard:TClipboard;
begin
{*
 0003DCFC    cmp         dword ptr ds:[0B6724],0
>0003DD03    jne         0003DD16
 0003DD05    mov         dl,1
 0003DD07    mov         eax,[0003D630];TClipboard
 0003DD0C    call        TObject.Create
 0003DD11    mov         [000B6724],eax
 0003DD16    mov         eax,[000B6724]
 0003DD1B    ret
*}
end;

Initialization
//0003DD58
{*
 0003DD58    sub         dword ptr ds:[0B6720],1
>0003DD5F    jae         0003DD88
 0003DD61    push        3DD8C
 0003DD66    call        user32.RegisterClipboardFormatA
 0003DD6B    mov         [000B671C],ax
 0003DD71    push        3DD9C
 0003DD76    call        user32.RegisterClipboardFormatA
 0003DD7B    mov         [000B671E],ax
 0003DD81    xor         eax,eax
 0003DD83    mov         [000B6724],eax
 0003DD88    ret
*}
Finalization
//0003DD1C
{*
 0003DD1C    push        ebp
 0003DD1D    mov         ebp,esp
 0003DD1F    xor         eax,eax
 0003DD21    push        ebp
 0003DD22    push        3DD4D
 0003DD27    push        dword ptr fs:[eax]
 0003DD2A    mov         dword ptr fs:[eax],esp
 0003DD2D    inc         dword ptr ds:[0B6720]
>0003DD33    jne         0003DD3F
 0003DD35    mov         eax,[000B6724]
 0003DD3A    call        TObject.Free
 0003DD3F    xor         eax,eax
 0003DD41    pop         edx
 0003DD42    pop         ecx
 0003DD43    pop         ecx
 0003DD44    mov         dword ptr fs:[eax],edx
 0003DD47    push        3DD54
 0003DD4C    ret
>0003DD4D    jmp         @HandleFinally
>0003DD52    jmp         0003DD4C
 0003DD54    pop         ebp
 0003DD55    ret
*}
end.