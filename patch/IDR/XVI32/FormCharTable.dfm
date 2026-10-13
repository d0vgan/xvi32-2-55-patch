object FormCharTable: TFormCharTable
  Left = 412
  Top = 180
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize, biHelp]
  Caption = 'FormCharTable'
  ClientHeight = 297
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelButtons: TPanel
    Left = 244
    Top = 0
    Width = 110
    Height = 297
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonClear: TButton
      Left = 10
      Top = 10
      Width = 91
      Height = 25
      Caption = 'Clear &table'
      TabOrder = 0
      OnClick = ButtonClearClick
    end
    object ButtonSave: TButton
      Left = 10
      Top = 35
      Width = 91
      Height = 25
      Caption = '&Save table'
      TabOrder = 1
      OnClick = ButtonSaveClick
    end
    object ButtonLoad: TButton
      Left = 10
      Top = 60
      Width = 91
      Height = 25
      Caption = '&Load table'
      TabOrder = 2
      OnClick = ButtonLoadClick
    end
    object RadioGroupScope: TRadioGroup
      Left = 10
      Top = 100
      Width = 91
      Height = 66
      HelpContext = 59
      Caption = 'Scope from'
      ItemIndex = 1
      Items.Strings = (
        'Cursor'
        'Begin')
      TabOrder = 3
    end
    object ButtonConvert: TButton
      Left = 10
      Top = 180
      Width = 91
      Height = 25
      Caption = '&Convert'
      ModalResult = 1
      TabOrder = 4
      OnClick = ButtonConvertClick
    end
    object ButtonCancel: TButton
      Left = 10
      Top = 220
      Width = 91
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 5
    end
    object ButtonHelp: TButton
      Left = 10
      Top = 260
      Width = 91
      Height = 25
      Caption = '&Help'
      TabOrder = 6
      OnClick = ButtonHelpClick
    end
  end
  object PanelGrid: TPanel
    Left = 0
    Top = 0
    Width = 244
    Height = 297
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object StringGridCharTable: TStringGrid
      Tag = 1
      Left = 0
      Top = 0
      Width = 244
      Height = 297
      HelpContext = 61
      Align = alClient
      ColCount = 4
      DefaultColWidth = 39
      DefaultRowHeight = 20
      FixedCols = 3
      RowCount = 257
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goAlwaysShowEditor]
      ParentFont = False
      TabOrder = 0
      OnClick = StringGridCharTableClick
      OnDragOver = StringGridCharTableDragOver
      OnDrawCell = StringGridCharTableDrawCell
      OnEndDrag = StringGridCharTableEndDrag
      OnExit = StringGridCharTableExit
      OnKeyPress = StringGridCharTableKeyPress
      OnKeyUp = StringGridCharTableKeyUp
      OnMouseDown = StringGridCharTableMouseDown
      OnMouseMove = StringGridCharTableMouseMove
      OnSelectCell = StringGridCharTableSelectCell
      RowHeights = (
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20
        20)
    end
  end
  object Timer1: TTimer
    Interval = 50
    Left = 628
    Top = 305
  end
end
