object FormFind: TFormFind
  Left = 319
  Top = 219
  ActiveControl = EditFindT
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Find/Count'
  ClientHeight = 232
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
    Caption = 'Find'
    TabOrder = 0
    object CMHistoryBtnFindT: TCMHistoryBtn
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
      IniSection = 'CMHistoryFindT'
      Edit = EditFindT
    end
    object CMHistoryBtnFindH: TCMHistoryBtn
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
      IniSection = 'CMHistoryFindH'
      Edit = CMByteEditFindH
    end
    object RadioButtonText: TRadioButton
      Left = 10
      Top = 13
      Width = 111
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
      Caption = 'Text -> Hex'
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
    object EditFindT: TEdit
      Left = 10
      Top = 33
      Width = 310
      Height = 21
      TabOrder = 2
    end
    object CMByteEditFindH: TCMByteEdit
      Left = 10
      Top = 88
      Width = 310
      Height = 21
      HelpContext = 33
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      OnKeyDown = CMByteEditFindHKeyDown
    end
    object CheckBoxFindUTF16: TCheckBox
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
    Width = 166
    Height = 57
    Caption = 'Options'
    TabOrder = 1
    object LabelJoker: TLabel
      Left = 145
      Top = 33
      Width = 3
      Height = 13
      Caption = '.'
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
  object GroupBox3: TGroupBox
    Left = 190
    Top = 135
    Width = 81
    Height = 57
    HelpContext = 27
    Caption = 'Direction'
    TabOrder = 2
    object rbtDown: TRadioButton
      Left = 10
      Top = 15
      Width = 60
      Height = 17
      Caption = '&Down'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbtDownClick
    end
    object rbtUp: TRadioButton
      Left = 10
      Top = 35
      Width = 60
      Height = 17
      Caption = '&Up'
      TabOrder = 1
      OnClick = rbtDownClick
    end
  end
  object ButtonOK: TButton
    Left = 10
    Top = 200
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 100
    Top = 200
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object ButtonHelp: TButton
    Left = 190
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 6
    OnClick = ButtonHelpClick
  end
  object GroupBox4: TGroupBox
    Left = 285
    Top = 135
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
