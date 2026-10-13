object FormGoto: TFormGoto
  Left = 356
  Top = 208
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Go to address'
  ClientHeight = 170
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 171
    Height = 111
    Caption = 'Go to'
    TabOrder = 0
    object CMHistoryBtnGoTo: TCMHistoryBtn
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
      IniSection = 'CMHistoryGoTo'
      Edit = CMNumEdit1
      OnSelect = CMHistoryBtnGoToSelect
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
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 103
    Top = 135
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object RadioGroupGoMode: TRadioGroup
    Left = 195
    Top = 10
    Width = 116
    Height = 111
    HelpContext = 29
    Caption = 'Go mode'
    ItemIndex = 0
    Items.Strings = (
      '&absolute'
      'relative d&own'
      'relative &up')
    TabOrder = 1
  end
  object ButtonHelp: TButton
    Left = 195
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
    OnClick = ButtonHelpClick
  end
end
