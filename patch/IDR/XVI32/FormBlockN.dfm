object FormBlockN: TFormBlockN
  Left = 441
  Top = 289
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Block with <n> chars'
  ClientHeight = 169
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 246
    Height = 111
    Caption = 'Enter <n>'
    TabOrder = 0
    object CMHistoryBtnBlockN: TCMHistoryBtn
      Left = 131
      Top = 75
      Width = 18
      Height = 21
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryBlockN'
      Edit = CMNumEdit1
      OnSelect = CMHistoryBtnBlockNSelect
    end
    object RadioButtonDec: TRadioButton
      Left = 10
      Top = 20
      Width = 113
      Height = 17
      HelpContext = 23
      Caption = '&decimal'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButtonDecClick
    end
    object RadioButtonHex: TRadioButton
      Left = 10
      Top = 45
      Width = 113
      Height = 17
      HelpContext = 24
      Caption = '&hexadecimal'
      TabOrder = 1
      OnClick = RadioButtonDecClick
    end
    object CMNumEdit1: TCMNumEdit
      Left = 10
      Top = 75
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '0'
      DigitsInt = 10
      Max = 2147483647
    end
  end
  object ButtonOK: TButton
    Left = 10
    Top = 135
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 96
    Top = 135
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object ButtonHelp: TButton
    Left = 181
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 3
    OnClick = ButtonHelpClick
  end
end
