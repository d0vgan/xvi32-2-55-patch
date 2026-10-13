object FormReplace: TFormReplace
  Left = 390
  Top = 166
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Replace'
  ClientHeight = 318
  ClientWidth = 376
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxFind: TGroupBox
    Left = 10
    Top = 5
    Width = 271
    Height = 120
    Caption = 'Find'
    TabOrder = 0
    object CMHistoryBtnFindT: TCMHistoryBtn
      Left = 240
      Top = 32
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryFindT'
      Edit = EditFindT
    end
    object CMHistoryBtnFindH: TCMHistoryBtn
      Left = 240
      Top = 92
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryFindH'
      Edit = CMByteEditFindH
    end
    object RadioButtonFindT: TRadioButton
      Left = 10
      Top = 13
      Width = 79
      Height = 17
      HelpContext = 20
      Caption = '&Text string'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = CMRadioBtnFindClick
    end
    object BitBtnConvFind: TBitBtn
      Left = 165
      Top = 59
      Width = 95
      Height = 25
      HelpContext = 22
      Caption = 'Text -> Hex'
      TabOrder = 3
      OnClick = BitBtnConvFindClick
    end
    object RadioButtonFindH: TRadioButton
      Left = 10
      Top = 63
      Width = 113
      Height = 17
      HelpContext = 21
      Caption = '&Hex string'
      TabOrder = 4
      OnClick = CMRadioBtnFindClick
    end
    object EditFindT: TEdit
      Left = 10
      Top = 32
      Width = 230
      Height = 21
      TabOrder = 2
    end
    object CMByteEditFindH: TCMByteEdit
      Left = 10
      Top = 92
      Width = 230
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      OnKeyDown = CMByteEditFindHKeyDown
    end
    object CheckBoxFindUTF16: TCheckBox
      Left = 90
      Top = 13
      Width = 175
      Height = 17
      HelpContext = 87
      Caption = 'as Unicode Latin (UTF-16)'
      TabOrder = 1
    end
  end
  object GroupBoxReplace: TGroupBox
    Left = 10
    Top = 130
    Width = 271
    Height = 120
    Caption = 'Replace with'
    TabOrder = 1
    object CMHistoryBtnReplT: TCMHistoryBtn
      Left = 240
      Top = 32
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryReplT'
      Edit = EditReplT
    end
    object CMHistoryBtnReplH: TCMHistoryBtn
      Left = 240
      Top = 88
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryReplH'
      Edit = CMByteEditReplH
    end
    object RadioButtonReplT: TRadioButton
      Left = 10
      Top = 13
      Width = 79
      Height = 17
      HelpContext = 20
      Caption = 'T&ext string'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = CMRadioBtnReplClick
    end
    object BitBtnConvertRepl: TBitBtn
      Left = 165
      Top = 59
      Width = 95
      Height = 25
      HelpContext = 22
      Caption = 'Text -> Hex'
      TabOrder = 3
      OnClick = BitBtnConvertReplClick
    end
    object RadioButtonReplH: TRadioButton
      Left = 10
      Top = 63
      Width = 113
      Height = 17
      HelpContext = 21
      Caption = 'He&x string'
      TabOrder = 4
      OnClick = CMRadioBtnReplClick
    end
    object EditReplT: TEdit
      Left = 10
      Top = 32
      Width = 230
      Height = 21
      TabOrder = 2
    end
    object CMByteEditReplH: TCMByteEdit
      Left = 10
      Top = 88
      Width = 230
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      OnKeyDown = CMByteEditFindHKeyDown
    end
    object CheckBoxReplUTF16: TCheckBox
      Left = 90
      Top = 13
      Width = 175
      Height = 17
      HelpContext = 87
      Caption = 'as Unicode Latin (UTF-16)'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 250
    Width = 181
    Height = 57
    Caption = 'Options'
    TabOrder = 2
    object LabelJoker: TLabel
      Left = 147
      Top = 33
      Width = 26
      Height = 13
      Caption = 'LabelJoker'
    end
    object CheckBoxCase: TCheckBox
      Left = 10
      Top = 13
      Width = 97
      Height = 17
      HelpContext = 25
      Caption = 'Case &sensitive'
      State = cbChecked
      TabOrder = 0
    end
    object CheckBoxJokerFind: TCheckBox
      Left = 10
      Top = 33
      Width = 101
      Height = 17
      HelpContext = 26
      Caption = '&Joker char hex:'
      TabOrder = 1
    end
    object CMByteEditJoker: TCMByteEdit
      Left = 115
      Top = 28
      Width = 25
      Height = 21
      HelpContext = 26
      TabOrder = 2
      Text = '2E'
      OnExit = CMByteEditJokerExit
      ASCII = '.'
      MaxBytes = 1
    end
  end
  object ButtonOK: TButton
    Left = 290
    Top = 10
    Width = 80
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = ButtonOKClick
  end
  object ButtonReplAll: TButton
    Left = 290
    Top = 52
    Width = 80
    Height = 25
    HelpContext = 28
    Caption = 'Replace &all'
    ModalResult = 1
    TabOrder = 5
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 290
    Top = 93
    Width = 80
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object ButtonHelp: TButton
    Left = 290
    Top = 135
    Width = 80
    Height = 25
    Caption = 'Help'
    TabOrder = 7
    OnClick = ButtonHelpClick
  end
  object GroupBox4: TGroupBox
    Left = 205
    Top = 250
    Width = 76
    Height = 57
    HelpContext = 59
    Caption = 'Scope from'
    TabOrder = 3
    object rbtCursor: TRadioButton
      Left = 10
      Top = 15
      Width = 60
      Height = 17
      Caption = '&Cursor'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbtBeginEnd: TRadioButton
      Left = 10
      Top = 35
      Width = 60
      Height = 17
      Caption = '&Begin'
      TabOrder = 1
    end
  end
end
