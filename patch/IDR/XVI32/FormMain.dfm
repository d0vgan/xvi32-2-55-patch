object FormMain: TFormMain
  Left = 108
  Top = 134
  AutoScroll = False
  Caption = 'XVI32'
  ClientHeight = 392
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 373
    Width = 684
    Height = 19
    HelpContext = 999
    Panels = <
      item
        Width = 115
      end
      item
        Width = 78
      end
      item
        Width = 55
      end
      item
        Width = 500
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 25
    HelpContext = 8
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object CMBtnOpen: TCMBtn
      Left = 30
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Open'
      Enabled = True
      PopupMark = True
      onClick = Open1Click
    end
    object CMBtnSave: TCMBtn
      Tag = 1
      Left = 55
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Save'
      Enabled = True
      PopupMark = True
      onClick = Save1Click
    end
    object CMBtnNew: TCMBtn
      Left = 5
      Top = 0
      Width = 25
      Height = 25
      Hint = 'New file'
      Enabled = True
      PopupMark = True
      onClick = New1Click
    end
    object CMBtnFind: TCMBtn
      Tag = 1
      Left = 180
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Find'
      Enabled = True
      PopupMark = True
      onClick = Find1Click
    end
    object CMBtnReplace: TCMBtn
      Tag = 1
      Left = 205
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Replace'
      Enabled = True
      PopupMark = True
      onClick = Replace1Click
    end
    object CMBtnInfo: TCMBtn
      Left = 255
      Top = 0
      Width = 25
      Height = 25
      Hint = 'About'
      Enabled = True
      PopupMark = True
      onClick = Info1Click
    end
    object CMBtnWhats: TCMBtn
      Left = 280
      Top = 0
      Width = 25
      Height = 25
      Hint = 'What'#39's this?'
      Enabled = True
      PopupMark = True
      onClick = CMBtnWhatsClick
    end
    object CMBtnCut: TCMBtn
      Tag = 1
      Left = 105
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Cut to clipboard'
      Enabled = True
      PopupMark = True
      onClick = Cut1Click
    end
    object CMBtnCopy: TCMBtn
      Tag = 1
      Left = 130
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Copy to clipboard'
      Enabled = True
      PopupMark = True
      onClick = Cut1Click
    end
    object CMBtnPaste: TCMBtn
      Tag = 1
      Left = 155
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Paste from clipboard'
      Enabled = True
      PopupMark = True
      onClick = Paste1Click
    end
    object CMBtnDel: TCMBtn
      Tag = 1
      Left = 80
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Delete block'
      Enabled = True
      PopupMark = True
      onClick = Blockdelete1Click
    end
    object CMBtnOptions: TCMBtn
      Left = 230
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Options'
      Enabled = True
      PopupMark = True
      onClick = Options1Click
    end
  end
  object CMStrGridText: TCMStrGrid
    Left = 35
    Top = 26
    Width = 272
    Height = 332
    HelpContext = 39
    ColCount = 19
    DefaultColWidth = 15
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 20
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Terminal'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goTabs]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 2
    OnDrawCell = CMStrGridTextHexDrawCell
    OnKeyDown = CMStrGridTextKeyDown
    OnKeyPress = CMStrGridTextKeyPress
    OnKeyUp = CMStrGridTextKeyUp
    OnSelectCell = CMStrGridTextHexSelectCell
    SlaveGrid = CMStrGridHex
  end
  object CMStrGridHex: TCMStrGrid
    Left = 313
    Top = 26
    Width = 363
    Height = 332
    HelpContext = 40
    Color = clInactiveBorder
    ColCount = 19
    DefaultColWidth = 20
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 20
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Terminal'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goTabs]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 3
    OnDrawCell = CMStrGridTextHexDrawCell
    OnKeyDown = CMStrGridTextKeyDown
    OnKeyPress = CMStrGridTextKeyPress
    OnKeyUp = CMStrGridTextKeyUp
    OnSelectCell = CMStrGridTextHexSelectCell
  end
  object CMStrGridAddr: TCMStrGrid
    Left = 0
    Top = 27
    Width = 31
    Height = 331
    HelpContext = 70
    Color = clBtnFace
    ColCount = 1
    DefaultColWidth = 15
    DefaultRowHeight = 15
    Enabled = False
    FixedCols = 0
    RowCount = 20
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Terminal'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goTabs]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 4
  end
  object MainMenu1: TMainMenu
    Left = 385
    object File1: TMenuItem
      Caption = '&File'
      HelpContext = 11
      OnClick = File1Click
      object New1: TMenuItem
        Caption = '&New'
        ShortCut = 16462
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = '&Open...'
        ShortCut = 16463
        OnClick = Open1Click
      end
      object Reload1: TMenuItem
        Tag = 1
        Caption = 'Re&load'
        Hint = 'Open current file again'
        ShortCut = 16460
        OnClick = Reload1Click
      end
      object Reopen1: TMenuItem
        Caption = '&Reopen'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Tag = 1
        Caption = '&Save'
        ShortCut = 16467
        OnClick = Save1Click
      end
      object SaveAs1: TMenuItem
        Tag = 1
        Caption = 'Save &As...'
        ShortCut = 123
        OnClick = SaveAs1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Tag = 1
        Caption = '&Close'
        ShortCut = 16499
        OnClick = Close1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Insertfile1: TMenuItem
        Tag = 1
        Caption = '&Insert...'
        Hint = 'Insert file contents before current address'
        OnClick = Insertfile1Click
      end
      object Writeblock1: TMenuItem
        Tag = 1
        Caption = '&Write block...'
        Hint = 'Write block to file'
        OnClick = Writeblock1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Print1: TMenuItem
        Tag = 1
        Caption = '&Print...'
        HelpContext = 64
        ShortCut = 16464
        OnClick = Print1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      HelpContext = 12
      OnClick = Edit1Click
      object Insert1: TMenuItem
        Tag = 1
        Caption = '&Insert string...'
        HelpContext = 50
        Hint = 'Insert string before current address'
        OnClick = Insert1Click
      end
      object Overwritestring1: TMenuItem
        Tag = 1
        Caption = 'Over&write string...'
        Hint = 'Overwrite string, beginning at current address'
        OnClick = Overwritestring1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object Blockmark1: TMenuItem
        Tag = 1
        Caption = 'Block &mark'
        HelpContext = 56
        Hint = 'Mark begin or end of block'
        ShortCut = 16450
        OnClick = Blockmark1Click
      end
      object Blocknchars1: TMenuItem
        Tag = 1
        Caption = 'Block <&n> chars...'
        HelpContext = 56
        Hint = 'Mark block consisting of <n> chars'
        OnClick = Blocknchars1Click
      end
      object Blockunmark1: TMenuItem
        Tag = 1
        Caption = 'Block &unmark'
        ShortCut = 16469
        OnClick = Blockunmark1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object Blockdelete1: TMenuItem
        Tag = 1
        Caption = 'Block &delete'
        ShortCut = 16452
        OnClick = Blockdelete1Click
      end
      object Blockcopy1: TMenuItem
        Tag = 1
        Caption = 'Block &copy'
        Hint = 'Copy block before current adress'
        ShortCut = 16459
        OnClick = Blockcopy1Click
      end
      object Blockcopyovwr1: TMenuItem
        Tag = 1
        Caption = 'Block copy/&overwrite'
        Hint = 'Copy block at current adress (overwriting)'
        ShortCut = 16471
        OnClick = Blockcopy1Click
      end
      object Blockmove1: TMenuItem
        Tag = 1
        Caption = 'Block mo&ve'
        Hint = 'Move block before current adress'
        ShortCut = 16461
        OnClick = Blockcopy1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Clipboard1: TMenuItem
        Tag = 1
        Caption = 'Clip&board'
        object Cut1: TMenuItem
          Tag = 1
          Caption = 'Cut'
          ShortCut = 16472
          OnClick = Cut1Click
        end
        object Copy1: TMenuItem
          Tag = 1
          Caption = 'Copy'
          ShortCut = 16451
          OnClick = Cut1Click
        end
        object Paste1: TMenuItem
          Tag = 1
          Caption = 'Paste'
          ShortCut = 16470
          OnClick = Paste1Click
        end
        object Copyhex1: TMenuItem
          Tag = 1
          Caption = 'Copy as hex string'
          ShortCut = 16456
          OnClick = Copyhex1Click
        end
        object Pastefromhexstring1: TMenuItem
          Tag = 1
          Caption = 'Paste from hex string'
          OnClick = Pastefromhexstring1Click
        end
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object Deletefromcursor1: TMenuItem
        Tag = 1
        Caption = 'Delete &from cursor'
        Hint = 'Delete from current adress (incl.) until end'
        OnClick = Deletefromcursor1Click
      end
      object Deletetocursor1: TMenuItem
        Tag = 1
        Caption = 'Delete &to cursor'
        Hint = 'Delete from begin until current adress (incl.)'
        OnClick = Deletetocursor1Click
      end
    end
    object Search1: TMenuItem
      Caption = '&Search'
      HelpContext = 13
      object Find1: TMenuItem
        Tag = 1
        Caption = '&Find...'
        HelpContext = 51
        ShortCut = 16454
        OnClick = Find1Click
      end
      object Findagaindown1: TMenuItem
        Tag = 1
        Caption = 'Find again &down'
        HelpContext = 51
        ShortCut = 114
        OnClick = Findagaindown1Click
      end
      object Findagainup1: TMenuItem
        Tag = 1
        Caption = 'Find again &up'
        HelpContext = 51
        ShortCut = 8306
        OnClick = Findagainup1Click
      end
      object Count1: TMenuItem
        Tag = 1
        Caption = '&Count...'
        HelpContext = 52
        OnClick = Count1Click
      end
      object N10: TMenuItem
        Tag = 1
        Caption = '-'
      end
      object Replace1: TMenuItem
        Tag = 1
        Caption = '&Replace...'
        HelpContext = 53
        ShortCut = 16466
        OnClick = Replace1Click
      end
      object Replaceagaindown1: TMenuItem
        Tag = 1
        Caption = 'Replace &again down'
        HelpContext = 53
        ShortCut = 115
        OnClick = Replaceagaindown1Click
      end
      object Replaceundo1: TMenuItem
        Tag = 1
        Caption = 'Replace &undo'
        HelpContext = 53
        Hint = 'Undo last replacement'
        OnClick = Replaceundo1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object Charconversion1: TMenuItem
        Tag = 1
        Caption = 'C&haracter conversion...'
        HelpContext = 60
        Hint = 'Convert characters using char table'
        OnClick = Charconversion1Click
      end
    end
    object Address1: TMenuItem
      Caption = '&Address'
      HelpContext = 14
      OnClick = Address1Click
      object Goto1: TMenuItem
        Tag = 1
        Caption = '&Goto...'
        Hint = 'Goto absolute/relative address'
        ShortCut = 16455
        OnClick = Goto1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Jumpwidth1: TMenuItem
        Tag = 1
        Caption = 'Jump &width...'
        Hint = 'Enter number of bytes to jump up and down'
        OnClick = Jumpwidth1Click
      end
      object Jumpdown1: TMenuItem
        Tag = 1
        Caption = 'Jump &down'
        ShortCut = 116
        OnClick = Jumpdown1Click
      end
      object Jumpup1: TMenuItem
        Tag = 1
        Caption = 'Jump &up'
        ShortCut = 8308
        OnClick = Jumpup1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Rememberaddress1: TMenuItem
        Tag = 1
        Caption = '&Remember address'
        Hint = 'Remember current adress'
        ShortCut = 49234
        OnClick = Rememberaddress1Click
      end
      object Gotoremembered1: TMenuItem
        Tag = 1
        Caption = 'Goto re&membered'
        Hint = 'Goto remembered adress'
        ShortCut = 49223
        OnClick = Gotoremembered1Click
      end
      object Displaydifference1: TMenuItem
        Tag = 1
        Caption = 'Display di&fference...'
        Hint = 'Display difference between current and remembered adress'
        OnClick = Displaydifference1Click
      end
    end
    object Bookmarks1: TMenuItem
      Tag = 1
      Caption = '&Bookmarks'
      OnClick = Bookmarks1Click
      object Add1: TMenuItem
        Caption = '&Add...'
        Hint = 'Add new bookmark for current address'
        OnClick = Add1Click
      end
      object Remove1: TMenuItem
        Caption = '&Remove...'
        Hint = 'Remove a defined bookmark'
        OnClick = Remove1Click
      end
      object Removeall1: TMenuItem
        Caption = 'R&emove all'
        Hint = 'Remove all currently defined bookmarks'
        OnClick = Removeall1Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Savetofile1: TMenuItem
        Caption = '&Save to file...'
        Hint = 'Save all currently defined bookmarks to file'
        OnClick = Savetofile1Click
      end
      object Loadfromfile1: TMenuItem
        Caption = '&Load from file...'
        Hint = 'Load bookmarks from file'
        OnClick = Loadfromfile1Click
      end
      object Bookmarkdivi: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Bookmark1: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark2: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark3: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark4: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark5: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark6: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark7: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark8: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
      object Bookmark9: TMenuItem
        Visible = False
        OnClick = BookmarkClick
      end
    end
    object Tools1: TMenuItem
      Caption = '&Tools'
      HelpContext = 15
      OnClick = Tools1Click
      object ModusText1: TMenuItem
        Caption = '&Text mode'
        Checked = True
        Hint = 'Switch between text/hex mode <TAB>'
        OnClick = ModusText1Click
      end
      object ModusOverwrite1: TMenuItem
        Caption = 'O&verwrite'
        Checked = True
        Hint = 'Switch between insert/overwrite mode <Ins>'
        OnClick = ModusOverwrite1Click
      end
      object DataInspector1: TMenuItem
        Caption = 'Data &inspector'
        Hint = 
          'Show tool window with current address, decoding numbers, file si' +
          'ze'
        OnClick = DataInspector1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Decode1: TMenuItem
        Tag = 1
        Caption = '&Decode number...'
        Hint = 'Decode 1/2/4 bytes as integer or float'
        OnClick = Decode1Click
      end
      object Encode1: TMenuItem
        Tag = 1
        Caption = '&Encode number...'
        Hint = 'Encode integer or float to 1/2/4 bytes'
        OnClick = Encode1Click
      end
      object Bitmanipulation1: TMenuItem
        Tag = 1
        Caption = '&Bit manipulation...'
        Hint = 'View/set bits in current byte'
        OnClick = Bitmanipulation1Click
      end
      object CalculateCRC321: TMenuItem
        Tag = 1
        Caption = '&CRC...'
        Hint = 'Calculate CRC16/CRC32 of file/block'
        OnClick = CalculateCRC321Click
      end
      object Patch1: TMenuItem
        Tag = 1
        Caption = '&Patch BP 7.0 EXE'
        Hint = 'Patch BP 7.0 program for execution > 200 Mhz'
        OnClick = Patch1Click
      end
      object Shredderdata1: TMenuItem
        Caption = '&Shredder data...'
        Hint = 'Overwrite all bytes with binary zeroes'
        OnClick = Shredderdata1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Options1: TMenuItem
        Caption = '&Options...'
        Hint = 'General options and appearance'
        ShortCut = 49231
        OnClick = Options1Click
      end
    end
    object Script1: TMenuItem
      Caption = '&XVIscript'
      HelpContext = 80
      OnClick = Script1Click
      object Editor1: TMenuItem
        Caption = '&Editor...'
        Hint = 'Edit, load, save script, do syntax check, or execute'
        OnClick = Editor1Click
      end
      object Executeactive1: TMenuItem
        Caption = 'E&xecute active'
        Hint = 'Execute active script, i.e. script in editor'
        ShortCut = 16504
        OnClick = Executeactive1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      HelpContext = 16
      object Contents1: TMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object Donate1: TMenuItem
        Caption = '&Donate...'
        OnClick = Donate1Click
      end
      object Info1: TMenuItem
        Caption = '&About...'
        Hint = 'About author/memory state'
        OnClick = Info1Click
      end
    end
  end
end
