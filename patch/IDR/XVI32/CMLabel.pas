//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMLabel;

interface

uses
  SysUtils, Classes, CMLabel;

type
  TAboutProperty = class(TPropertyEditor)
  public
    procedure Edit; virtual;//vC//000A0248
    //function GetAttributes:?; virtual;//v10//000A02B0
    //procedure GetValue(?:?); virtual;//v20//000A02BC
  end;
  TCMLbl = class(TLabel)
  public
    About:TAboutProperty;//f124
    URL:String;//f128
    FontColorVisited:TColor;//f12C
    OnMouseEnter:TNotifyEvent;//f130
    f132:word;//f132
    f134:dword;//f134
    OnMouseLeave:TNotifyEvent;//f138
    f13A:word;//f13A
    f13C:dword;//f13C
    f140:String;//f140
    constructor Create(AOwner:TComponent); virtual;//v2C//000A0438
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//000A0358
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//000A0300
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//000A033C
    procedure sub_000A031C; dynamic;//000A031C
    procedure sub_000A02E0; dynamic;//000A02E0
    procedure Click; dynamic;//000A067C
  end;
    //procedure sub_000A008C(?:AnsiString; ?:?);//000A008C
    procedure Edit;//000A0248
    //function GetAttributes:?;//000A02B0
    //procedure GetValue(?:?);//000A02BC
    procedure sub_000A02E0;//000A02E0
    procedure CMMouseEnter(var Message:TMessage);//000A0300
    procedure sub_000A031C;//000A031C
    procedure CMMouseLeave(var Message:TMessage);//000A033C
    procedure CMTextChanged(var Message:TMessage);//000A0358
    constructor Create(AOwner:TComponent);//000A0438
    //function sub_000A04F8(?:TCMLbl; ?:String):?;//000A04F8
    procedure Click;//000A067C

implementation

//000A008C
{*procedure sub_000A008C(?:AnsiString; ?:?);
begin
 000A008C    push        ebp
 000A008D    mov         ebp,esp
 000A008F    add         esp,0FFFFFFE8
 000A0092    push        ebx
 000A0093    xor         ecx,ecx
 000A0095    mov         dword ptr [ebp-18],ecx
 000A0098    mov         dword ptr [ebp-14],ecx
 000A009B    mov         dword ptr [ebp-8],edx
 000A009E    mov         dword ptr [ebp-4],eax
 000A00A1    mov         eax,dword ptr [ebp-4]
 000A00A4    call        @LStrAddRef
 000A00A9    xor         eax,eax
 000A00AB    push        ebp
 000A00AC    push        0A0212
 000A00B1    push        dword ptr fs:[eax]
 000A00B4    mov         dword ptr fs:[eax],esp
 000A00B7    mov         eax,104
 000A00BC    call        StrAlloc
 000A00C1    mov         dword ptr [ebp-0C],eax
 000A00C4    lea         eax,[ebp-14]
 000A00C7    call        @LStrClr
 000A00CC    xor         eax,eax
 000A00CE    push        ebp
 000A00CF    push        0A01DD
 000A00D4    push        dword ptr fs:[eax]
 000A00D7    mov         dword ptr fs:[eax],esp
 000A00DA    mov         dword ptr [ebp-10],104
 000A00E1    mov         edx,dword ptr [ebp-4]
 000A00E4    mov         eax,dword ptr [ebp-0C]
 000A00E7    call        StrPCopy
 000A00EC    lea         eax,[ebp-10]
 000A00EF    push        eax
 000A00F0    mov         eax,dword ptr [ebp-0C]
 000A00F3    push        eax
 000A00F4    mov         eax,dword ptr [ebp-0C]
 000A00F7    push        eax
 000A00F8    push        80000000
 000A00FD    call        advapi32.RegQueryValueA
 000A0102    mov         eax,dword ptr [ebp-0C]
 000A0105    call        StrLen
 000A010A    test        eax,eax
>000A010C    jbe         000A01C7
 000A0112    mov         edx,0A0220;'\shell\Open\command'
 000A0117    mov         eax,dword ptr [ebp-0C]
 000A011A    call        StrCat
 000A011F    mov         dword ptr [ebp-10],104
 000A0126    lea         eax,[ebp-10]
 000A0129    push        eax
 000A012A    mov         eax,dword ptr [ebp-0C]
 000A012D    push        eax
 000A012E    mov         eax,dword ptr [ebp-0C]
 000A0131    push        eax
 000A0132    push        80000000
 000A0137    call        advapi32.RegQueryValueA
 000A013C    test        eax,eax
>000A013E    jne         000A01C7
 000A0144    lea         edx,[ebp-18]
 000A0147    mov         eax,dword ptr [ebp-0C]
 000A014A    call        StrPas
 000A014F    mov         eax,dword ptr [ebp-18]
 000A0152    lea         edx,[ebp-14]
 000A0155    call        UpperCase
 000A015A    mov         edx,dword ptr [ebp-14]
 000A015D    mov         eax,0A023C;'.EXE'
 000A0162    call        @LStrPos
 000A0167    mov         ebx,eax
 000A0169    test        ebx,ebx
>000A016B    jne         000A0177
 000A016D    lea         eax,[ebp-14]
 000A0170    call        @LStrClr
>000A0175    jmp         000A01C7
 000A0177    lea         eax,[ebp-14]
 000A017A    push        eax
 000A017B    lea         ecx,[ebx+3]
 000A017E    mov         edx,1
 000A0183    mov         eax,dword ptr [ebp-14]
 000A0186    call        @LStrCopy
 000A018B    mov         eax,dword ptr [ebp-0C]
 000A018E    push        eax
 000A018F    push        0A0244
 000A0194    mov         eax,dword ptr [ebp-14]
 000A0197    call        @LStrToPChar
 000A019C    push        eax
 000A019D    call        shell32.FindExecutableA
 000A01A2    cmp         eax,20
>000A01A5    jbe         000A01BF
 000A01A7    lea         edx,[ebp-18]
 000A01AA    mov         eax,dword ptr [ebp-0C]
 000A01AD    call        StrPas
 000A01B2    mov         eax,dword ptr [ebp-18]
 000A01B5    lea         edx,[ebp-14]
 000A01B8    call        UpperCase
>000A01BD    jmp         000A01C7
 000A01BF    lea         eax,[ebp-14]
 000A01C2    call        @LStrClr
 000A01C7    xor         eax,eax
 000A01C9    pop         edx
 000A01CA    pop         ecx
 000A01CB    pop         ecx
 000A01CC    mov         dword ptr fs:[eax],edx
 000A01CF    push        0A01E4
 000A01D4    mov         eax,dword ptr [ebp-0C]
 000A01D7    call        StrDispose
 000A01DC    ret
>000A01DD    jmp         @HandleFinally
>000A01E2    jmp         000A01D4
 000A01E4    mov         eax,dword ptr [ebp-8]
 000A01E7    mov         edx,dword ptr [ebp-14]
 000A01EA    call        @LStrLAsg
 000A01EF    xor         eax,eax
 000A01F1    pop         edx
 000A01F2    pop         ecx
 000A01F3    pop         ecx
 000A01F4    mov         dword ptr fs:[eax],edx
 000A01F7    push        0A0219
 000A01FC    lea         eax,[ebp-18]
 000A01FF    mov         edx,2
 000A0204    call        @LStrArrayClr
 000A0209    lea         eax,[ebp-4]
 000A020C    call        @LStrClr
 000A0211    ret
>000A0212    jmp         @HandleFinally
>000A0217    jmp         000A01FC
 000A0219    pop         ebx
 000A021A    mov         esp,ebp
 000A021C    pop         ebp
 000A021D    ret
end;*}

//000A0248
procedure TAboutProperty.Edit;
begin
{*
 000A0248    push        40
 000A024A    mov         ecx,0A0264;'About TCMLbl v1.0'
 000A024F    mov         edx,0A0278;'TCMLbl (c) 1997 Christian Maas'+#13+#10+chmaas@hit.sb.sub.de'
 000A0254    mov         eax,[000B59E8];^Application:TApplication
 000A0259    mov         eax,dword ptr [eax]
 000A025B    call        TApplication.MessageBox
 000A0260    ret
*}
end;

//000A02B0
{*function TAboutProperty.GetAttributes:?;
begin
 000A02B0    mov         al,[000A02B8];0x44 gvar_000A02B8
 000A02B5    ret
end;*}

//000A02BC
{*procedure TAboutProperty.GetValue(?:?);
begin
 000A02BC    push        ebx
 000A02BD    mov         ebx,edx
 000A02BF    mov         eax,ebx
 000A02C1    mov         edx,0A02D8;'(About)'
 000A02C6    call        @LStrLAsg
 000A02CB    pop         ebx
 000A02CC    ret
end;*}

//000A02E0
procedure TCMLbl.sub_000A02E0;
begin
{*
 000A02E0    push        ebx
 000A02E1    cmp         word ptr [eax+132],0;TCMLbl.?f132:word
>000A02E9    je          000A02FB
 000A02EB    mov         ebx,eax
 000A02ED    mov         edx,eax
 000A02EF    mov         eax,dword ptr [ebx+134];TCMLbl.?f134:dword
 000A02F5    call        dword ptr [ebx+130];TCMLbl.OnMouseEnter
 000A02FB    pop         ebx
 000A02FC    ret
*}
end;

//000A0300
procedure TCMLbl.CMMouseEnter(var Message:TMessage);
begin
{*
 000A0300    push        ebx
 000A0301    mov         ebx,eax
 000A0303    mov         eax,ebx
 000A0305    call        TControl.CMMouseEnter
 000A030A    mov         edx,ebx
 000A030C    mov         eax,ebx
 000A030E    mov         bx,0FFCC
 000A0312    call        @CallDynaInst;TCMLbl.sub_000A02E0
 000A0317    pop         ebx
 000A0318    ret
*}
end;

//000A031C
procedure TCMLbl.sub_000A031C;
begin
{*
 000A031C    push        ebx
 000A031D    cmp         word ptr [eax+13A],0;TCMLbl.?f13A:word
>000A0325    je          000A0337
 000A0327    mov         ebx,eax
 000A0329    mov         edx,eax
 000A032B    mov         eax,dword ptr [ebx+13C];TCMLbl.?f13C:dword
 000A0331    call        dword ptr [ebx+138];TCMLbl.OnMouseLeave
 000A0337    pop         ebx
 000A0338    ret
*}
end;

//000A033C
procedure TCMLbl.CMMouseLeave(var Message:TMessage);
begin
{*
 000A033C    push        ebx
 000A033D    mov         ebx,eax
 000A033F    mov         eax,ebx
 000A0341    call        TControl.CMMouseLeave
 000A0346    mov         edx,ebx
 000A0348    mov         eax,ebx
 000A034A    mov         bx,0FFCB
 000A034E    call        @CallDynaInst;TCMLbl.sub_000A031C
 000A0353    pop         ebx
 000A0354    ret
*}
end;

//000A0358
procedure TCMLbl.CMTextChanged(var Message:TMessage);
begin
{*
 000A0358    push        ebp
 000A0359    mov         ebp,esp
 000A035B    xor         ecx,ecx
 000A035D    push        ecx
 000A035E    push        ecx
 000A035F    push        ecx
 000A0360    push        ecx
 000A0361    push        ebx
 000A0362    mov         ebx,eax
 000A0364    xor         eax,eax
 000A0366    push        ebp
 000A0367    push        0A042C
 000A036C    push        dword ptr fs:[eax]
 000A036F    mov         dword ptr fs:[eax],esp
 000A0372    mov         eax,ebx
 000A0374    call        TCustomLabel.CMTextChanged
 000A0379    lea         edx,[ebp-4]
 000A037C    mov         eax,ebx
 000A037E    call        TControl.GetText
 000A0383    mov         eax,dword ptr [ebp-4]
 000A0386    mov         edx,dword ptr [ebx+140];TCMLbl.?f140:String
 000A038C    call        @LStrCmp
>000A0391    je          000A03EA
 000A0393    lea         edx,[ebp-8]
 000A0396    mov         eax,dword ptr [ebx+128];TCMLbl.URL:String
 000A039C    call        Trim
 000A03A1    cmp         dword ptr [ebp-8],0
>000A03A5    je          000A03D2
 000A03A7    lea         edx,[ebp-0C]
 000A03AA    mov         eax,dword ptr [ebx+128];TCMLbl.URL:String
 000A03B0    call        Trim
 000A03B5    mov         eax,dword ptr [ebp-0C]
 000A03B8    push        eax
 000A03B9    lea         edx,[ebp-10]
 000A03BC    mov         eax,dword ptr [ebx+140];TCMLbl.?f140:String
 000A03C2    call        Trim
 000A03C7    mov         edx,dword ptr [ebp-10]
 000A03CA    pop         eax
 000A03CB    call        @LStrCmp
>000A03D0    jne         000A03EA
 000A03D2    lea         edx,[ebp-4]
 000A03D5    mov         eax,ebx
 000A03D7    call        TControl.GetText
 000A03DC    mov         edx,dword ptr [ebp-4]
 000A03DF    lea         eax,[ebx+128];TCMLbl.URL:String
 000A03E5    call        @LStrAsg
 000A03EA    lea         edx,[ebp-4]
 000A03ED    mov         eax,ebx
 000A03EF    call        TControl.GetText
 000A03F4    mov         edx,dword ptr [ebp-4]
 000A03F7    lea         eax,[ebx+140];TCMLbl.?f140:String
 000A03FD    call        @LStrAsg
 000A0402    mov         eax,ebx
 000A0404    mov         edx,dword ptr [eax]
 000A0406    call        dword ptr [edx+78];TControl.Invalidate
 000A0409    xor         eax,eax
 000A040B    pop         edx
 000A040C    pop         ecx
 000A040D    pop         ecx
 000A040E    mov         dword ptr fs:[eax],edx
 000A0411    push        0A0433
 000A0416    lea         eax,[ebp-10]
 000A0419    mov         edx,3
 000A041E    call        @LStrArrayClr
 000A0423    lea         eax,[ebp-4]
 000A0426    call        @LStrClr
 000A042B    ret
>000A042C    jmp         @HandleFinally
>000A0431    jmp         000A0416
 000A0433    pop         ebx
 000A0434    mov         esp,ebp
 000A0436    pop         ebp
 000A0437    ret
*}
end;

//000A0438
constructor TCMLbl.Create(AOwner:TComponent);
begin
{*
 000A0438    push        ebp
 000A0439    mov         ebp,esp
 000A043B    add         esp,0FFFFFFF8
 000A043E    push        ebx
 000A043F    push        esi
 000A0440    xor         ebx,ebx
 000A0442    mov         dword ptr [ebp-8],ebx
 000A0445    test        dl,dl
>000A0447    je          000A0451
 000A0449    add         esp,0FFFFFFF0
 000A044C    call        @ClassCreate
 000A0451    mov         byte ptr [ebp-1],dl
 000A0454    mov         ebx,eax
 000A0456    xor         eax,eax
 000A0458    push        ebp
 000A0459    push        0A04CC
 000A045E    push        dword ptr fs:[eax]
 000A0461    mov         dword ptr fs:[eax],esp
 000A0464    xor         edx,edx
 000A0466    mov         eax,ebx
 000A0468    call        TCustomLabel.Create
 000A046D    mov         dx,0B
 000A0471    mov         eax,ebx
 000A0473    call        TControl.SetCursor
 000A0478    mov         esi,dword ptr [ebx+58];TCMLbl.FFont:TFont
 000A047B    mov         edx,0FF0000
 000A0480    mov         eax,esi
 000A0482    call        TFont.SetColor
 000A0487    mov         dl,byte ptr ds:[0A04F4];0x4 gvar_000A04F4
 000A048D    mov         eax,esi
 000A048F    call        TFont.SetStyle
 000A0494    mov         dword ptr [ebx+12C],800080;TCMLbl.FontColorVisited:TColor
 000A049E    lea         edx,[ebp-8]
 000A04A1    mov         eax,ebx
 000A04A3    call        TControl.GetText
 000A04A8    mov         edx,dword ptr [ebp-8]
 000A04AB    lea         eax,[ebx+140];TCMLbl.?f140:String
 000A04B1    call        @LStrAsg
 000A04B6    xor         eax,eax
 000A04B8    pop         edx
 000A04B9    pop         ecx
 000A04BA    pop         ecx
 000A04BB    mov         dword ptr fs:[eax],edx
 000A04BE    push        0A04D3
 000A04C3    lea         eax,[ebp-8]
 000A04C6    call        @LStrClr
 000A04CB    ret
>000A04CC    jmp         @HandleFinally
>000A04D1    jmp         000A04C3
 000A04D3    mov         eax,ebx
 000A04D5    cmp         byte ptr [ebp-1],0
>000A04D9    je          000A04EA
 000A04DB    call        @AfterConstruction
 000A04E0    pop         dword ptr fs:[0]
 000A04E7    add         esp,0C
 000A04EA    mov         eax,ebx
 000A04EC    pop         esi
 000A04ED    pop         ebx
 000A04EE    pop         ecx
 000A04EF    pop         ecx
 000A04F0    pop         ebp
 000A04F1    ret
*}
end;

//000A04F8
{*function sub_000A04F8(?:TCMLbl; ?:String):?;
begin
 000A04F8    push        ebp
 000A04F9    mov         ebp,esp
 000A04FB    push        0
 000A04FD    push        0
 000A04FF    push        0
 000A0501    push        ebx
 000A0502    push        esi
 000A0503    mov         dword ptr [ebp-4],edx
 000A0506    mov         esi,eax
 000A0508    mov         eax,dword ptr [ebp-4]
 000A050B    call        @LStrAddRef
 000A0510    xor         eax,eax
 000A0512    push        ebp
 000A0513    push        0A0621
 000A0518    push        dword ptr fs:[eax]
 000A051B    mov         dword ptr fs:[eax],esp
 000A051E    mov         bl,1
 000A0520    lea         edx,[ebp-0C]
 000A0523    mov         eax,dword ptr [ebp-4]
 000A0526    call        Trim
 000A052B    cmp         dword ptr [ebp-0C],0
>000A052F    je          000A0606
 000A0535    lea         eax,[ebp-0C]
 000A0538    push        eax
 000A0539    mov         ecx,7
 000A053E    mov         edx,1
 000A0543    mov         eax,dword ptr [ebp-4]
 000A0546    call        @LStrCopy
 000A054B    mov         eax,dword ptr [ebp-0C]
 000A054E    mov         edx,0A0638;'MAILTO:'
 000A0553    call        AnsiCompareText
 000A0558    test        eax,eax
>000A055A    jne         000A05D0
 000A055C    lea         edx,[ebp-8]
 000A055F    mov         eax,0A0648;'.htm'
 000A0564    call        000A008C
 000A0569    lea         edx,[ebp-0C]
 000A056C    mov         eax,dword ptr [ebp-8]
 000A056F    call        ExtractFileName
 000A0574    mov         eax,dword ptr [ebp-0C]
 000A0577    mov         edx,0A0658;'NETSCAPE.EXE'
 000A057C    call        AnsiCompareText
 000A0581    test        eax,eax
>000A0583    jne         000A05AF
 000A0585    push        1
 000A0587    push        dword ptr [ebp-8]
 000A058A    push        0A0670;' '
 000A058F    push        dword ptr [ebp-4]
 000A0592    lea         eax,[ebp-0C]
 000A0595    mov         edx,3
 000A059A    call        @LStrCatN
 000A059F    mov         eax,dword ptr [ebp-0C]
 000A05A2    call        @LStrToPChar
 000A05A7    push        eax
 000A05A8    call        kernel32.WinExec
>000A05AD    jmp         000A05EF
 000A05AF    push        1
 000A05B1    push        0
 000A05B3    push        0
 000A05B5    mov         eax,dword ptr [ebp-4]
 000A05B8    call        @LStrToPChar
 000A05BD    push        eax
 000A05BE    push        0A0674
 000A05C3    call        user32.GetDesktopWindow
 000A05C8    push        eax
 000A05C9    call        shell32.ShellExecuteA
>000A05CE    jmp         000A05EF
 000A05D0    push        1
 000A05D2    push        0
 000A05D4    push        0
 000A05D6    mov         eax,dword ptr [ebp-4]
 000A05D9    call        @LStrToPChar
 000A05DE    push        eax
 000A05DF    push        0A0674
 000A05E4    call        user32.GetDesktopWindow
 000A05E9    push        eax
 000A05EA    call        shell32.ShellExecuteA
 000A05EF    cmp         eax,20
>000A05F2    jle         000A0604
 000A05F4    mov         edx,dword ptr [esi+12C]
 000A05FA    mov         eax,dword ptr [esi+58]
 000A05FD    call        TFont.SetColor
>000A0602    jmp         000A0606
 000A0604    xor         ebx,ebx
 000A0606    xor         eax,eax
 000A0608    pop         edx
 000A0609    pop         ecx
 000A060A    pop         ecx
 000A060B    mov         dword ptr fs:[eax],edx
 000A060E    push        0A0628
 000A0613    lea         eax,[ebp-0C]
 000A0616    mov         edx,3
 000A061B    call        @LStrArrayClr
 000A0620    ret
>000A0621    jmp         @HandleFinally
>000A0626    jmp         000A0613
 000A0628    mov         eax,ebx
 000A062A    pop         esi
 000A062B    pop         ebx
 000A062C    mov         esp,ebp
 000A062E    pop         ebp
 000A062F    ret
end;*}

//000A067C
procedure TCMLbl.Click;
begin
{*
 000A067C    push        ebx
 000A067D    cmp         word ptr [eax+106],0;TCMLbl.?f106:word
>000A0685    je          000A0699
 000A0687    mov         ebx,eax
 000A0689    mov         edx,eax
 000A068B    mov         eax,dword ptr [ebx+108];TCMLbl.?f108:TMessageForm
 000A0691    call        dword ptr [ebx+104];TCMLbl.FOnClick
 000A0697    pop         ebx
 000A0698    ret
 000A0699    mov         edx,dword ptr [eax+128];TCMLbl.URL:String
 000A069F    call        000A04F8
 000A06A4    pop         ebx
 000A06A5    ret
*}
end;

Initialization
//000A06D8
{*
 000A06D8    sub         dword ptr ds:[0B7058],1
>000A06DF    jae         000A0706
 000A06E1    push        0A0708;'HAND'
 000A06E6    mov         eax,[000B5950];^HInstance:Longword
 000A06EB    mov         eax,dword ptr [eax]
 000A06ED    push        eax
 000A06EE    call        user32.LoadCursorA
 000A06F3    mov         ecx,eax
 000A06F5    mov         eax,[000B5BDC];^Screen:TScreen
 000A06FA    mov         eax,dword ptr [eax]
 000A06FC    mov         edx,0B
 000A0701    call        TScreen.SetCursors
 000A0706    ret
*}
Finalization
end.