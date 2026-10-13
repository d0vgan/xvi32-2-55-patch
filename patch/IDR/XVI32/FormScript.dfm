object FormScript: TFormScript
  Left = 207
  Top = 168
  AutoScroll = False
  Caption = 'XVIscript interpreter'
  ClientHeight = 277
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 242
    Width = 427
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object ButtonExecute: TButton
      Left = 115
      Top = 6
      Width = 85
      Height = 25
      HelpContext = 75
      Caption = 'Execute'
      TabOrder = 1
      OnClick = ButtonExecuteClick
    end
    object ButtonClose: TButton
      Left = 227
      Top = 6
      Width = 85
      Height = 25
      HelpContext = 71
      Cancel = True
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 2
    end
    object ButtonHelp: TButton
      Left = 331
      Top = 6
      Width = 85
      Height = 25
      HelpContext = 71
      Caption = '&Help'
      TabOrder = 3
      OnClick = ButtonHelpClick
    end
    object ButtonSyntax: TButton
      Left = 7
      Top = 6
      Width = 85
      Height = 25
      HelpContext = 75
      Caption = 'Syntax Check'
      TabOrder = 0
      OnClick = ButtonSyntaxClick
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object CMBtnOpen: TCMBtn
      Left = 7
      Top = 0
      Width = 25
      Height = 25
      Enabled = True
      PopupMark = True
      onClick = Open1Click
    end
    object CMBtnSave: TCMBtn
      Left = 32
      Top = 0
      Width = 25
      Height = 25
      Enabled = True
      PopupMark = True
      onClick = Save1Click
    end
  end
  object MemoScript: TMemo
    Left = 0
    Top = 25
    Width = 427
    Height = 217
    HelpContext = 71
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    HideSelection = False
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object MainMenu1: TMainMenu
    Left = 204
    object Script1: TMenuItem
      Caption = '&Script'
      HelpContext = 71
      object Open1: TMenuItem
        Caption = '&Open...'
        ShortCut = 16463
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = '&Save'
        Enabled = False
        ShortCut = 16467
        OnClick = Save1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Save &as'
        OnClick = Saveas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Insertcommand1: TMenuItem
      Caption = '&Insert command'
      HelpContext = 77
      object Address1: TMenuItem
        Caption = '&Address'
        object ADR2: TMenuItem
          Caption = '&ADR <dec. or $hex address>'
          OnClick = InsertCommandClick
        end
        object ADR3: TMenuItem
          Caption = 'ADR&+ <dec. or $hex count>'
          OnClick = InsertCommandClick
        end
        object ADR1: TMenuItem
          Caption = 'ADR&- <dec. or $hex count>'
          OnClick = InsertCommandClick
        end
        object ADREOFgotoendoffile1: TMenuItem
          Caption = 'ADR&EOF (go to end of file)'
          OnClick = InsertCommandClick
        end
      end
      object Bitwiseoperations1: TMenuItem
        Caption = '&Bitwise operations'
        object BITANDhexbyte1: TMenuItem
          Caption = 'BIT&AND <hex byte> [byte count]'
          OnClick = InsertCommandClick
        end
        object BITNOT1: TMenuItem
          Caption = 'BIT&NOT [byte count]'
          OnClick = InsertCommandClick
        end
        object BITORhexbyte1: TMenuItem
          Caption = 'BIT&OR <hex byte> [byte count]'
          OnClick = InsertCommandClick
        end
        object BITSHLbitcount1: TMenuItem
          Caption = 'BITSH&L <bit count> [byte count]'
          OnClick = InsertCommandClick
        end
        object BITSHRbitcount1: TMenuItem
          Caption = 'BITSH&R <bit count> [byte count]'
          OnClick = InsertCommandClick
        end
        object BITXORhexbyte1: TMenuItem
          Caption = 'BIT&XOR <hex byte> [byte count]'
          OnClick = InsertCommandClick
        end
      end
      object CHARCONxctfilename1: TMenuItem
        Caption = '&CHARCON <XCT file name>'
        OnClick = InsertCommandClick
      end
      object DELADRdecorhexcount1: TMenuItem
        Caption = '&DEL <dec. or $hex count>'
        OnClick = InsertCommandClick
      end
      object QUIT1: TMenuItem
        Caption = '&EXIT (terminate script execution)'
        OnClick = InsertCommandClick
      end
      object Find1: TMenuItem
        Caption = '&Find'
        object FINDhexstring1: TMenuItem
          Caption = '&FIND <hex string>'
          OnClick = InsertCommandClick
        end
        object FINDASCstring1: TMenuItem
          Caption = 'FIND&ASC <string>'
          OnClick = InsertCommandClick
        end
      end
      object INSERThexstring1: TMenuItem
        Caption = '&INSERT <hex string>'
        OnClick = InsertCommandClick
      end
      object Joker1: TMenuItem
        Caption = '&Joker'
        object JOKERONhexchar1: TMenuItem
          Caption = '&JOKERON <hex char> (for FIND, REPLACE; e.g. 2E)'
          OnClick = InsertCommandClick
        end
        object JOKEROFF1: TMenuItem
          Caption = 'JOKER&OFF (turn joker char off for FIND, REPLACE)'
          OnClick = InsertCommandClick
        end
      end
      object MSGmessage1: TMenuItem
        Caption = '&MSG <message> (display message)'
        OnClick = InsertCommandClick
      end
      object OVERWRITEhexstring1: TMenuItem
        Caption = '&OVERWRITE <hex string>'
        OnClick = InsertCommandClick
      end
      object REM2: TMenuItem
        Caption = 'R&EM <remark>'
        OnClick = InsertCommandClick
      end
      object Replace1: TMenuItem
        Caption = '&Replace'
        object REPLhexstringBYhexstring1: TMenuItem
          Caption = '&REPLACE <hex string> BY <hex string>'
          OnClick = InsertCommandClick
        end
        object REPLACEASCstringBYstring1: TMenuItem
          Caption = 'REPLACE&ASC <string> BY <string>'
          OnClick = InsertCommandClick
        end
        object REPLACEALLhexstringBYhexstring1: TMenuItem
          Caption = 'REPLACEA&LL <hex string> BY <hex string>'
          OnClick = InsertCommandClick
        end
        object REPLACEALLASCstringBYstring1: TMenuItem
          Caption = 'REPLACEALLAS&C <string> BY <string>'
          OnClick = InsertCommandClick
        end
      end
      object VERIFYhexstring1: TMenuItem
        Caption = '&VERIFY <hex string> [OR <hex string>...] (joker: ??)'
        OnClick = InsertCommandClick
      end
    end
  end
end
