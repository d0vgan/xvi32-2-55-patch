object FormPreview: TFormPreview
  Left = 270
  Top = 133
  Width = 537
  Height = 471
  Caption = 'FormPreview'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object CMBtnFirst: TCMBtn
      Left = 30
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Go to first page'
      Enabled = True
      PopupMark = True
      onClick = CMBtnFirstClick
    end
    object CMBtnPrevious: TCMBtn
      Left = 55
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Go to previous page'
      Enabled = True
      PopupMark = True
      onClick = CMBtnPreviousClick
    end
    object CMBtnNext: TCMBtn
      Left = 80
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Go to next page'
      Enabled = True
      PopupMark = True
      onClick = CMBtnNextClick
    end
    object CMBtnLast: TCMBtn
      Left = 105
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Go to last page'
      Enabled = True
      PopupMark = True
      onClick = CMBtnLastClick
    end
    object CMBtnZoom: TCMBtn
      Left = 130
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Quick zoom page width/page height'
      Enabled = True
      PopupMark = True
      onClick = CMBtnZoomClick
    end
    object CMBtnPrint1: TCMBtn
      Left = 155
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Print only this page'
      Enabled = True
      PopupMark = True
      onClick = CMBtnPrint1Click
    end
    object CMBtnPrintAll: TCMBtn
      Left = 180
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Print all pages'
      Enabled = True
      PopupMark = True
      onClick = CMBtnPrintAllClick
    end
    object CMBtnExit: TCMBtn
      Left = 5
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Exit without printing'
      Enabled = True
      PopupMark = True
      onClick = CMBtnExitClick
    end
    object CMBtnHelp: TCMBtn
      Left = 205
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Help'
      Enabled = True
      PopupMark = True
      onClick = CMBtnHelpClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 25
    Width = 529
    Height = 400
    Align = alClient
    TabOrder = 1
    object PaintBox1: TPaintBox
      Left = 10
      Top = 10
      Width = 186
      Height = 186
      Cursor = crCross
      OnMouseUp = PaintBox1MouseUp
      OnPaint = PaintBox1Paint
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 425
    Width = 529
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end>
    SimplePanel = False
  end
end
