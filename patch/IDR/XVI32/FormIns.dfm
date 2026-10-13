object FormIns: TFormIns
  Left = 315
  Top = 214
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Insert'
  ClientHeight = 237
  ClientWidth = 374
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 10
    Top = 5
    Width = 351
    Height = 120
    Caption = 'Insert'
    TabOrder = 0
    object CMHistoryBtnInsT: TCMHistoryBtn
      Left = 320
      Top = 33
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryInsT'
      Edit = EditInsT
    end
    object CMHistoryBtnInsH: TCMHistoryBtn
      Left = 320
      Top = 88
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryInsH'
      Edit = CMByteEditInsH
    end
    object RadioButtonText: TRadioButton
      Left = 10
      Top = 13
      Width = 113
      Height = 17
      HelpContext = 20
      Caption = '&Text string'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButtonTextClick
    end
    object BitBtnConvert: TBitBtn
      Left = 245
      Top = 59
      Width = 95
      Height = 25
      HelpContext = 22
      Caption = 'Te&xt -> Hex'
      TabOrder = 3
      OnClick = BitBtnConvertClick
    end
    object RadioButtonHex: TRadioButton
      Left = 10
      Top = 63
      Width = 113
      Height = 17
      HelpContext = 21
      Caption = '&Hex string'
      TabOrder = 4
      OnClick = RadioButtonTextClick
    end
    object EditInsT: TEdit
      Left = 10
      Top = 33
      Width = 310
      Height = 21
      TabOrder = 2
    end
    object CMByteEditInsH: TCMByteEdit
      Left = 10
      Top = 88
      Width = 310
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      OnKeyDown = CMByteEditInsHKeyDown
    end
    object CheckBoxUTF16: TCheckBox
      Left = 136
      Top = 13
      Width = 193
      Height = 17
      HelpContext = 87
      Caption = 'as Unicode Latin (UTF-16)'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 135
    Width = 236
    Height = 91
    Caption = 'Insert <n> times'
    TabOrder = 1
    object CMHistoryBtnInsN: TCMHistoryBtn
      Left = 131
      Top = 60
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryInsN'
      Edit = CMNumEdit1
      OnSelect = CMHistoryBtnInsNSelect
    end
    object RadioButtonDecN: TRadioButton
      Left = 10
      Top = 15
      Width = 113
      Height = 17
      HelpContext = 23
      Caption = '&decimal'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButtonDecNClick
    end
    object RadioButtonHexN: TRadioButton
      Left = 10
      Top = 35
      Width = 113
      Height = 17
      HelpContext = 24
      Caption = '&hexadecimal'
      TabOrder = 1
      OnClick = RadioButtonDecNClick
    end
    object CMNumEdit1: TCMNumEdit
      Left = 10
      Top = 60
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '1'
      Value = 1
      Max = 99999999.9
    end
  end
  object ButtonOK: TButton
    Left = 275
    Top = 140
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 275
    Top = 170
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ButtonHelp: TButton
    Left = 275
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
    OnClick = ButtonHelpClick
  end
end
