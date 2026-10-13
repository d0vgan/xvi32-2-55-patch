object FormBit: TFormBit
  Left = 308
  Top = 276
  HelpContext = 10
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Bit manipulation'
  ClientHeight = 161
  ClientWidth = 390
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonSet: TButton
    Left = 20
    Top = 125
    Width = 75
    Height = 25
    HelpContext = 10
    Caption = 'Set'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = ButtonSetClick
  end
  object ButtonCancel: TButton
    Left = 200
    Top = 125
    Width = 75
    Height = 25
    HelpContext = 10
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ButtonHelp: TButton
    Left = 290
    Top = 125
    Width = 75
    Height = 25
    HelpContext = 10
    Caption = 'Help'
    TabOrder = 4
    OnClick = ButtonHelpClick
  end
  object GroupBoxBits: TGroupBox
    Left = 10
    Top = 10
    Width = 370
    Height = 106
    HelpContext = 10
    Caption = 'Status of bits'
    TabOrder = 0
    object LabelValue: TLabel
      Left = 10
      Top = 45
      Width = 53
      Height = 13
      Caption = 'LabelValue'
    end
    object ButtonCheckAll: TButton
      Left = 10
      Top = 70
      Width = 75
      Height = 25
      Caption = '&Check all'
      TabOrder = 0
      OnClick = ButtonAllClick
    end
    object ButtonUncheckAll: TButton
      Left = 100
      Top = 70
      Width = 75
      Height = 25
      Caption = '&Uncheck all'
      TabOrder = 1
      OnClick = ButtonAllClick
    end
    object ButtonToggleAll: TButton
      Left = 190
      Top = 70
      Width = 75
      Height = 25
      Caption = '&Toggle all'
      TabOrder = 2
      OnClick = ButtonAllClick
    end
  end
  object ButtonReread: TButton
    Left = 110
    Top = 125
    Width = 75
    Height = 25
    HelpContext = 10
    Cancel = True
    Caption = '&Reread'
    TabOrder = 2
    OnClick = ButtonRereadClick
  end
end
