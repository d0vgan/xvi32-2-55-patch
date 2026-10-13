object FormOSE: TFormOSE
  Left = 136
  Top = 167
  BorderStyle = bsDialog
  Caption = 'FormOSE'
  ClientHeight = 75
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBoxReadOnly: TCheckBox
    Left = 8
    Top = 8
    Width = 161
    Height = 17
    Caption = 'Open in &Read Only Mode'
    TabOrder = 0
  end
  object EditDateiName: TEdit
    Left = 88
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'EditDateiName'
  end
  object ImageListLarge: TImageList
    AllocBy = 25
    Height = 32
    Width = 32
    Left = 105
    Top = 520
  end
  object ImageListSmall: TImageList
    AllocBy = 25
    Left = 180
    Top = 515
  end
  object SaveDialog1: TSaveDialog
    Left = 44
    Top = 36
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 36
  end
end
