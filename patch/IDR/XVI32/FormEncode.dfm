object FormEncode: TFormEncode
  Left = 300
  Top = 170
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Encode number'
  ClientHeight = 271
  ClientWidth = 423
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 196
    Height = 211
    Caption = 'Encode'
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 20
      Width = 40
      Height = 13
      Caption = '&Number:'
    end
    object CMHistoryBtnEnc: TCMHistoryBtn
      Left = 166
      Top = 13
      Width = 18
      Height = 21
      Caption = '6'
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Marlett'
      Font.Style = []
      ParentFont = False
      IniSection = 'CMHistoryEnc'
      Edit = EditNumber
    end
    object RadioGroupAs: TRadioGroup
      Left = 10
      Top = 41
      Width = 176
      Height = 159
      HelpContext = 30
      Caption = 'as'
      ItemIndex = 0
      Items.Strings = (
        '&shortint (1 byte)'
        '&byte (1 byte)'
        '&word (2 bytes)'
        '&integer (2 bytes)'
        '&longint (4 bytes)'
        '&32 bit IEEE single'
        '&64 bit IEEE double')
      TabOrder = 1
    end
    object EditNumber: TEdit
      Left = 60
      Top = 13
      Width = 106
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 220
    Top = 10
    Width = 191
    Height = 211
    HelpContext = 31
    Caption = 'Output'
    TabOrder = 1
    object LabelByteOrder: TLabel
      Left = 10
      Top = 20
      Width = 73
      Height = 13
      Caption = 'LabelByteOrder'
    end
    object CMRadioBtnInsert: TCMRadioBtn
      Left = 10
      Top = 45
      Width = 166
      Height = 17
      Caption = 'Ins&ert before current adress'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object CMRadioBtnOver: TCMRadioBtn
      Left = 10
      Top = 75
      Width = 161
      Height = 17
      Caption = '&Overwrite at current adress'
      TabOrder = 1
    end
    object CMRadioBtnHere: TCMRadioBtn
      Left = 10
      Top = 105
      Width = 113
      Height = 17
      Caption = '&Here'
      TabOrder = 2
      Control = EditHere
    end
    object EditHere: TEdit
      Left = 25
      Top = 130
      Width = 140
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object ButtonOK: TButton
    Left = 10
    Top = 234
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 115
    Top = 234
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ButtonHelp: TButton
    Left = 220
    Top = 234
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 4
    OnClick = ButtonHelpClick
  end
end
