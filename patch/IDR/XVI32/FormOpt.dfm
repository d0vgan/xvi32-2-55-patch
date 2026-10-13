object FormOpt: TFormOpt
  Left = 261
  Top = 183
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 230
  ClientWidth = 380
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 195
    Width = 380
    Height = 35
    Align = alBottom
    TabOrder = 0
    object ButtonOK: TButton
      Left = 10
      Top = 5
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = ButtonOKClick
    end
    object ButtonCancel: TButton
      Left = 103
      Top = 5
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonHelp: TButton
      Left = 195
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Help'
      TabOrder = 2
      OnClick = ButtonHelpClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 380
    Height = 195
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      HelpContext = 42
      Caption = 'General'
      object Label5: TLabel
        Left = 205
        Top = 65
        Width = 104
        Height = 13
        Caption = 'Re&open history count:'
      end
      object RadioGroupBase: TRadioGroup
        Left = 10
        Top = 5
        Width = 355
        Height = 45
        Caption = 'Offset (address) of first byte'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&0'
          '&1')
        TabOrder = 0
      end
      object CheckBoxOldFileTime: TCheckBox
        Left = 10
        Top = 64
        Width = 166
        Height = 17
        Caption = '&Save file with old date/time'
        TabOrder = 1
      end
      object SpinEditMRU: TSpinEdit
        Left = 324
        Top = 58
        Width = 41
        Height = 22
        MaxValue = 9
        MinValue = 1
        TabOrder = 2
        Value = 9
      end
      object CheckBoxNewEOF: TCheckBox
        Left = 10
        Top = 87
        Width = 186
        Height = 17
        Caption = 'Create new file with &EOF char'
        TabOrder = 3
      end
      object CheckBoxUseWinFileReq: TCheckBox
        Left = 10
        Top = 110
        Width = 283
        Height = 17
        Caption = '&Use Windows standard open/save dialogs'
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      HelpContext = 43
      Caption = 'Appearance'
      object Label1: TLabel
        Left = 270
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Font &size:'
        FocusControl = SpinEditFSize
      end
      object Label2: TLabel
        Left = 227
        Top = 72
        Width = 94
        Height = 13
        Caption = 'Number of &columns:'
        FocusControl = SpinEditCols
      end
      object Label3: TLabel
        Left = 238
        Top = 42
        Width = 77
        Height = 13
        Caption = 'Number of &rows:'
        FocusControl = SpinEditRows
      end
      object Label4: TLabel
        Left = 10
        Top = 14
        Width = 24
        Height = 13
        Caption = '&Font:'
      end
      object Label7: TLabel
        Left = 10
        Top = 42
        Width = 108
        Height = 13
        Caption = 'Color of chars in &block:'
      end
      object SpinEditFSize: TSpinEdit
        Left = 325
        Top = 9
        Width = 41
        Height = 22
        MaxValue = 16
        MinValue = 6
        TabOrder = 1
        Value = 8
      end
      object SpinEditCols: TSpinEdit
        Left = 325
        Top = 67
        Width = 41
        Height = 22
        MaxValue = 999
        MinValue = 10
        TabOrder = 4
        Value = 10
      end
      object SpinEditRows: TSpinEdit
        Left = 325
        Top = 37
        Width = 41
        Height = 22
        MaxValue = 999
        MinValue = 10
        TabOrder = 3
        Value = 10
      end
      object ButtonDefault: TButton
        Left = 292
        Top = 136
        Width = 75
        Height = 25
        Caption = '&Defaults'
        TabOrder = 8
        OnClick = ButtonDefaultClick
      end
      object ComboBoxFont: TComboBox
        Left = 80
        Top = 9
        Width = 145
        Height = 21
        ItemHeight = 0
        Sorted = True
        TabOrder = 0
      end
      object CheckBoxHideTool: TCheckBox
        Left = 10
        Top = 64
        Width = 103
        Height = 17
        Caption = '&Hide toolbar'
        TabOrder = 5
      end
      object ComboBoxColor: TComboBox
        Left = 125
        Top = 37
        Width = 100
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        Items.Strings = (
          'clInfoText'
          'clInfoBk'
          'clBlack'
          'clMaroon'
          'clGreen'
          'clOlive'
          'clNavy'
          'clPurple'
          'clTeal'
          'clGray'
          'clSilver'
          'clRed'
          'clLime'
          'clYellow'
          'clBlue'
          'clFuchsia'
          'clAqua'
          'clWhite')
        TabOrder = 2
        OnDrawItem = ComboBoxColorDrawItem
      end
      object CheckBoxTextGridLeft: TCheckBox
        Left = 10
        Top = 104
        Width = 143
        Height = 17
        Caption = '&Text Grid on the left'
        TabOrder = 7
      end
      object CheckBoxHideAddr: TCheckBox
        Left = 10
        Top = 84
        Width = 151
        Height = 17
        Caption = 'Hide &Address of Rows'
        TabOrder = 6
      end
      object CheckBoxShowGrid: TCheckBox
        Left = 10
        Top = 124
        Width = 135
        Height = 17
        Caption = 'Show &Grid Lines'
        TabOrder = 9
      end
      object CheckBoxUseBlank: TCheckBox
        Left = 10
        Top = 144
        Width = 255
        Height = 17
        Caption = '&Use Blank to Display Control Characters'
        TabOrder = 10
      end
    end
    object TabSheet3: TTabSheet
      HelpContext = 86
      Caption = 'Data Inspector'
      object CheckBoxDIshort: TCheckBox
        Tag = 7
        Left = 10
        Top = 56
        Width = 85
        Height = 17
        Caption = '&short (±)'
        TabOrder = 0
      end
      object CheckBoxDIsingle: TCheckBox
        Tag = 7
        Left = 105
        Top = 113
        Width = 120
        Height = 17
        Caption = 'IEEE sin&gle (32 bit)'
        TabOrder = 5
      end
      object CheckBoxDIword: TCheckBox
        Tag = 7
        Left = 10
        Top = 113
        Width = 85
        Height = 17
        Caption = '&word (+)'
        TabOrder = 2
      end
      object CheckBoxDIdouble: TCheckBox
        Tag = 7
        Left = 240
        Top = 56
        Width = 120
        Height = 17
        Caption = 'IEEE &double (64 bit)'
        TabOrder = 6
      end
      object CheckBoxDIint: TCheckBox
        Tag = 7
        Left = 105
        Top = 56
        Width = 85
        Height = 17
        Caption = '&integer (±)'
        TabOrder = 3
      end
      object CheckBoxDIbin: TCheckBox
        Tag = 7
        Left = 240
        Top = 85
        Width = 120
        Height = 17
        Caption = '&binary'
        TabOrder = 7
      end
      object CheckBoxDIlong: TCheckBox
        Tag = 7
        Left = 105
        Top = 85
        Width = 82
        Height = 17
        Caption = '&longint (±)'
        TabOrder = 4
      end
      object CheckBoxDIblock: TCheckBox
        Tag = 7
        Left = 240
        Top = 113
        Width = 120
        Height = 17
        Caption = 'block si&ze'
        TabOrder = 8
      end
      object CheckBoxDIbyte: TCheckBox
        Tag = 7
        Left = 10
        Top = 85
        Width = 85
        Height = 17
        Caption = '&byte (+)'
        TabOrder = 1
      end
      object RadioGroupByteOrder: TRadioGroup
        Left = 10
        Top = 5
        Width = 351
        Height = 43
        Caption = 'Byte order for numbers and UTF-16'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&little-endian (Intel)'
          '&big-endian (Motorola)')
        TabOrder = 9
      end
    end
    object TabSheet4: TTabSheet
      HelpContext = 44
      Caption = 'Shortcut Link'
      object GroupBoxSendTo: TGroupBox
        Left = 10
        Top = 10
        Width = 351
        Height = 151
        Caption = 'Link in SendTo Folder (user specific under Windows NT)'
        TabOrder = 0
        object ButtonSendToCrea: TButton
          Left = 20
          Top = 26
          Width = 100
          Height = 25
          Caption = 'Create'
          Enabled = False
          TabOrder = 0
          OnClick = ButtonSendToCreaClick
        end
        object ButtonSendToRemove: TButton
          Left = 20
          Top = 72
          Width = 100
          Height = 25
          Caption = 'Remove'
          Enabled = False
          TabOrder = 1
          OnClick = ButtonSendToRemoveClick
        end
      end
    end
  end
end
