object FormAbout2: TFormAbout2
  Tag = 1
  Left = 291
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FormAbout2'
  ClientHeight = 168
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image2: TImage
    Left = 10
    Top = 10
    Width = 130
    Height = 145
    AutoSize = True
    OnClick = Image2Click
  end
  object LabelCopyR: TLabel
    Left = 150
    Top = 10
    Width = 8
    Height = 16
    Caption = '©'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object CMLblMail: TCMLbl
    Left = 150
    Top = 27
    Width = 152
    Height = 16
    Cursor = 11
    Caption = 'chmaas@handshake.de'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsUnderline]
    ParentFont = False
    Transparent = True
    URL = 'chmaas@handshake.de'
  end
  object LabelInfo: TLabel
    Left = 150
    Top = 75
    Width = 201
    Height = 46
    AutoSize = False
    Transparent = True
    WordWrap = True
  end
  object CMLbl1: TCMLbl
    Left = 150
    Top = 46
    Width = 184
    Height = 16
    Cursor = 11
    Caption = 'www.chmaas.handshake.de'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsUnderline]
    ParentFont = False
    URL = 'www.chmaas.handshake.de'
  end
  object BitBtnOK: TBitBtn
    Left = 265
    Top = 130
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 10
    Top = 10
    Width = 130
    Height = 145
    Lines.Strings = (
      'Bronze statue of a '
      'charioteer, originally '
      'belonging to a larger '
      'group which'
      'represented a chariot '
      'drawn by four horses. '
      'It was dedicated to '
      'Apollo by'
      'Polyzalos, the tyrant of '
      'Gela, in 478 B.C. '
      'when he won the '
      'chariot-race at the'
      'Pythian Games. This '
      'incomparable statue is '
      'a representative '
      'example of the'
      '"severe" Attic style, '
      'certainly the work of a '
      'major artist.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
    OnClick = Memo1Click
  end
  object BitBtnDonate: TBitBtn
    Left = 153
    Top = 130
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Donate...'
    TabOrder = 2
    OnClick = BitBtnDonateClick
  end
end
