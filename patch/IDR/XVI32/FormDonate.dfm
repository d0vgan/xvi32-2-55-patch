object FormDonate: TFormDonate
  Left = 207
  Top = 171
  Width = 543
  Height = 237
  Caption = 'Thank you for making a donation for XVI32!'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 470
    Height = 39
    Caption = 
      'XVI32 is freeware. Nevertheless, many thanks for making a donati' +
      'on to appreciate my work, and/or support the development. The su' +
      'ggested amount to donate is US$ 25 or 20 EUR. However, any amoun' +
      't, higher or lower, is appreciated.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 465
    Height = 26
    Caption = 
      'To make a donation, just click to the link below or press the ap' +
      'propriate button to copy the URL to clipboard.'
    WordWrap = True
  end
  object CMLbl1: TCMLbl
    Left = 16
    Top = 118
    Width = 476
    Height = 15
    Cursor = 11
    Caption = 
      'http://www.chmaas.handshake.de/delphi/freeware/xvi32/xvi32donate' +
      '.htm'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = [fsUnderline]
    ParentFont = False
    URL = 
      'http://www.chmaas.handshake.de/delphi/freeware/xvi32/xvi32donate' +
      '.htm'
  end
  object ButtonCopy: TButton
    Left = 16
    Top = 160
    Width = 145
    Height = 25
    Caption = '&Copy URL to clipboard'
    TabOrder = 0
    OnClick = ButtonCopyClick
  end
  object ButtonClose: TButton
    Left = 175
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
  end
end
