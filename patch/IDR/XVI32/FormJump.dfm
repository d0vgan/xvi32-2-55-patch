object FormJump: TFormJump
  Left = 330
  Top = 213
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Enter jump width'
  ClientHeight = 169
  ClientWidth = 260
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
    Width = 236
    Height = 111
    Caption = 'Jump width'
    TabOrder = 0
    object CMHistoryBtnJump: TCMHistoryBtn
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
      IniSection = 'CMHistoryJump'
      Edit = CMNumEdit1
      OnSelect = CMHistoryBtnJumpSelect
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
    Left = 105
    Top = 135
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
