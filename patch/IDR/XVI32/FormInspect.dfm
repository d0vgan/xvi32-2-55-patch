object FormInspect: TFormInspect
  Left = 336
  Top = 179
  Width = 255
  Height = 170
  BorderStyle = bsSizeToolWin
  Caption = 'Data Inspector'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 97
    Top = 0
    Width = 150
    Height = 136
    Align = alClient
    BorderStyle = bsNone
    Color = clBtnFace
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    WordWrap = False
    OnDblClick = Memo1DblClick
    OnMouseDown = Memo1MouseDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 97
    Height = 136
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 0
      Width = 3
      Height = 13
    end
  end
  object PopupMenu1: TPopupMenu
    AutoPopup = False
    Left = 164
    Top = 52
    object Configure1: TMenuItem
      Caption = '&Configure...'
      OnClick = Configure1Click
    end
    object Edit1: TMenuItem
      Caption = '&Edit...'
      OnClick = Edit1Click
    end
  end
end
