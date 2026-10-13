object FormDecode: TFormDecode
  Left = 317
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Decode number'
  ClientHeight = 229
  ClientWidth = 488
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDec: TLabel
    Left = 10
    Top = 10
    Width = 138
    Height = 13
    Caption = 'Decoded from cursor position'
  end
  object LabelByteOrder: TLabel
    Left = 10
    Top = 30
    Width = 73
    Height = 13
    Caption = 'LabelByteOrder'
  end
  object ButtonOK: TButton
    Left = 10
    Top = 196
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
    Top = 50
    Width = 467
    Height = 135
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
end
