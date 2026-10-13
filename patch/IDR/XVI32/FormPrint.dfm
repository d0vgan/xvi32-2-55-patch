object FormPrint: TFormPrint
  Left = 295
  Top = 152
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'FormPrint'
  ClientHeight = 343
  ClientWidth = 367
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 164
    Width = 33
    Height = 13
    Caption = '&Printer:'
    FocusControl = ComboBoxPrinters
  end
  object Label7: TLabel
    Left = 10
    Top = 193
    Width = 45
    Height = 13
    Caption = '&Font size:'
    FocusControl = ComboBoxFontSize
  end
  object Label8: TLabel
    Left = 210
    Top = 193
    Width = 67
    Height = 13
    Caption = 'B&ytes per row:'
    FocusControl = ComboBoxBytesPerRow
  end
  object Panel1: TPanel
    Left = 0
    Top = 308
    Width = 367
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object ButtonPreviewPrint: TButton
      Left = 10
      Top = 5
      Width = 85
      Height = 25
      Caption = 'Preview/Print'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonPreviewPrintClick
    end
    object ButtonCancel: TButton
      Left = 103
      Top = 5
      Width = 85
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonHelp: TButton
      Left = 195
      Top = 5
      Width = 85
      Height = 25
      Caption = '&Help'
      TabOrder = 2
      OnClick = ButtonHelpClick
    end
  end
  object GroupBoxPrint: TGroupBox
    Left = 10
    Top = 5
    Width = 346
    Height = 51
    Caption = 'Printing range'
    TabOrder = 0
    object RadioButtonCurPage: TRadioButton
      Left = 10
      Top = 20
      Width = 101
      Height = 17
      Caption = '&Current page'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButtonCurSelection: TRadioButton
      Left = 121
      Top = 20
      Width = 113
      Height = 17
      Caption = 'Current &selection'
      TabOrder = 1
    end
    object RadioButtonAllPages: TRadioButton
      Left = 251
      Top = 20
      Width = 80
      Height = 17
      Caption = '&All pages'
      TabOrder = 2
    end
  end
  object ComboBoxPrinters: TComboBox
    Left = 70
    Top = 155
    Width = 286
    Height = 21
    HelpContext = 69
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBoxPrintersChange
  end
  object GroupBoxMargins: TGroupBox
    Left = 10
    Top = 60
    Width = 346
    Height = 87
    HelpContext = 66
    Caption = 'Margins'
    TabOrder = 1
    object Label3: TLabel
      Left = 137
      Top = 20
      Width = 21
      Height = 13
      Caption = '&Left:'
      FocusControl = CMNumEditMarginLeft
    end
    object Label2: TLabel
      Left = 238
      Top = 20
      Width = 28
      Height = 13
      Caption = '&Right:'
      FocusControl = CMNumEditMarginRight
    end
    object Label4: TLabel
      Left = 137
      Top = 56
      Width = 22
      Height = 13
      Caption = '&Top:'
      FocusControl = CMNumEditMarginTop
    end
    object Label5: TLabel
      Left = 236
      Top = 56
      Width = 36
      Height = 13
      Caption = '&Bottom:'
      FocusControl = CMNumEditMarginBottom
    end
    object Label6: TLabel
      Left = 10
      Top = 20
      Width = 22
      Height = 13
      Caption = '&Unit:'
      FocusControl = ComboBoxUnit
    end
    object CMNumEditMarginLeft: TCMNumEdit
      Left = 172
      Top = 15
      Width = 51
      Height = 21
      TabOrder = 1
      Text = '15,00'
      OnExit = CMNumEditMarginLeftExit
      DigitsFrac = 2
      DigitsInt = 2
      Value = 15
      Min = 0.2
      Max = 50
    end
    object CMNumEditMarginRight: TCMNumEdit
      Left = 283
      Top = 15
      Width = 51
      Height = 21
      TabOrder = 2
      Text = '15,00'
      OnExit = CMNumEditMarginLeftExit
      DigitsFrac = 2
      DigitsInt = 2
      Value = 15
      Min = 0.2
      Max = 50
    end
    object CMNumEditMarginTop: TCMNumEdit
      Left = 172
      Top = 51
      Width = 51
      Height = 21
      TabOrder = 3
      Text = '15,00'
      OnExit = CMNumEditMarginLeftExit
      DigitsFrac = 2
      DigitsInt = 2
      Value = 15
      Min = 0.2
      Max = 50
    end
    object CMNumEditMarginBottom: TCMNumEdit
      Left = 283
      Top = 51
      Width = 51
      Height = 21
      TabOrder = 4
      Text = '15,00'
      OnExit = CMNumEditMarginLeftExit
      DigitsFrac = 2
      DigitsInt = 2
      Value = 15
      Min = 0.2
      Max = 50
    end
    object ComboBoxUnit: TComboBox
      Left = 52
      Top = 13
      Width = 66
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Items.Strings = (
        'mm'
        'Inch')
      TabOrder = 0
      OnChange = ComboBoxUnitChange
    end
  end
  object ComboBoxFontSize: TComboBox
    Left = 70
    Top = 185
    Width = 66
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    Items.Strings = (
      '8'
      '10'
      '12')
    TabOrder = 3
  end
  object CheckBoxOrientationLandscape: TCheckBox
    Left = 10
    Top = 215
    Width = 251
    Height = 17
    Caption = 'Landscape &orientation (instead of portrait)'
    TabOrder = 5
  end
  object CheckBoxOffsetDecimal: TCheckBox
    Left = 10
    Top = 240
    Width = 251
    Height = 17
    Caption = 'Print offsets in &decimal (instead of hexadecimal)'
    TabOrder = 6
  end
  object ComboBoxBytesPerRow: TComboBox
    Left = 290
    Top = 185
    Width = 66
    Height = 21
    ItemHeight = 13
    Items.Strings = (
      '10'
      '16'
      '24'
      '25'
      '32'
      '40'
      '48')
    MaxLength = 2
    TabOrder = 4
    OnKeyPress = ComboBoxBytesPerRowKeyPress
  end
  object CheckBoxTextBelow: TCheckBox
    Left = 10
    Top = 265
    Width = 251
    Height = 17
    HelpContext = 67
    Caption = 'Print text belo&w hex (i.e. in 2nd line)'
    TabOrder = 8
  end
  object CheckBoxOutputToFile: TCheckBox
    Left = 10
    Top = 290
    Width = 256
    Height = 17
    HelpContext = 68
    Caption = 'R&edirect output to file'
    TabOrder = 9
  end
end
