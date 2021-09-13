object SetForm: TSetForm
  Left = 240
  Top = 177
  BorderStyle = bsDialog
  Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 308
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LbSpeedButton4: TLbSpeedButton
    Left = 315
    Top = 280
    Width = 100
    Height = 22
    Caption = #1042#1099#1093#1086#1076
    Color = 15717314
    ColorWhenDown = 14399133
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF4D4D4D4D4D4D4D4D4DFFFFFFFFFFFFFFFFFFBBBBBB
      4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D919191DDDDDDBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D707070707070CEA24DF5DAC1FFC44DCE
      A24D707070707070DDDDDDEEEEEEBBBBBB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D
      707070707070CEA24DF5DAC1FFC44DCEA24D707070707070DDDDDDEEEEEEBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D707070707070CEA24DFFC44DFFC44DCE
      A24D707070707070DDDDDDEEEEEEBBBBBB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D
      707070CEA24DFFFFE1F5DAC1F5DAC1FFC44DCEA24D707070DDDDDDBBBBBBBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D707070CEA24DFFFFE1F5DAC1F5DAC1FF
      C44DCEA24D707070DDDDDDFFFFFF4D4D4D4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D
      707070CEA24DFFFFE1F5DAC1F5DAC1FFC44DCEA24D707070DDDDDDEEEEEEBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D707070707070FFC44DFFFFFFFFFFE1FF
      C44D707070707070DDDDDDEEEEEEBBBBBB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D
      7070707070707070704D91B64D91B6707070707070707070DDDDDDEEEEEEBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D70707070707094B8DBB8DBFF94B8DB4D
      91B6707070707070DDDDDDEEEEEEBBBBBB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D
      70707070707094B8DBDBFFFFB8DBFF4D91B6707070707070DDDDDDEEEEEEBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFF4D4D4D70707070707070707094B8DB94B8DB70
      7070707070707070DDDDDDEEEEEEBBBBBB4D4D4DFFFFFFFFFFFFFFFFFFBBBBBB
      4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D919191EEEEEEBBBB
      BB4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9191919191914D4D4DFFFFFFFFFFFF}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    LightColor = 12937777
    NumGlyphs = 1
    ParentColor = False
    ParentFont = False
    ShadowColor = 12937777
    Style = bsXP
    OnClick = LbSpeedButton4Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 426
    Height = 276
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      object GroupBox1: TGroupBox
        Left = 10
        Top = 5
        Width = 191
        Height = 66
        Caption = ' '#1057#1090#1080#1083#1100' '#1082#1085#1086#1087#1086#1082' '
        TabOrder = 0
        object LbSpeedButton1: TLbSpeedButton
          Left = 45
          Top = 37
          Width = 100
          Height = 21
          Caption = #1057#1090#1080#1083#1100' '#1082#1085#1086#1087#1082#1080
          Color = 15717314
          ColorWhenDown = 14399133
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          LightColor = 12937777
          ParentColor = False
          ParentFont = False
          ShadowColor = 12937777
          Style = bsXP
        end
        object RadioButton1: TRadioButton
          Left = 15
          Top = 15
          Width = 61
          Height = 17
          Caption = #1043#1086#1083#1091#1073#1086#1081
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 90
          Top = 15
          Width = 86
          Height = 17
          Caption = #1054#1088#1072#1085#1078#1077#1074#1099#1081
          TabOrder = 1
          OnClick = RadioButton2Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 215
        Top = 5
        Width = 191
        Height = 106
        Caption = ' '#1055#1072#1085#1077#1083#1080' '#1079#1072#1076#1072#1095' '
        TabOrder = 1
        object Label8: TLabel
          Left = 10
          Top = 64
          Width = 95
          Height = 13
          Caption = #1042' '#1086#1090#1076#1077#1083#1100#1085#1086#1084' '#1086#1082#1085#1077':'
        end
        object CheckBox5: TCheckBox
          Left = 10
          Top = 15
          Width = 171
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074' '#1075#1083#1072#1074#1085#1086#1084' '#1086#1082#1085#1077
          TabOrder = 0
          OnClick = CheckBox5Click
        end
        object CheckBox10: TCheckBox
          Left = 25
          Top = 80
          Width = 156
          Height = 17
          Caption = #1055#1086#1074#1077#1088#1093' '#1086#1089#1090#1072#1083#1100#1085#1099#1093' '#1086#1082#1086#1085
          TabOrder = 1
          OnClick = CheckBox10Click
        end
        object CheckBox11: TCheckBox
          Left = 10
          Top = 35
          Width = 171
          Height = 26
          Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1087#1072#1085#1077#1083#1077#1081' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
          TabOrder = 2
          WordWrap = True
          OnClick = CheckBox11Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 10
        Top = 75
        Width = 191
        Height = 161
        Caption = ' '#1054#1073#1097#1080#1077' '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object CheckBox12: TCheckBox
          Left = 10
          Top = 15
          Width = 171
          Height = 26
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1082' '#1101#1083#1077#1084#1077#1085#1090#1072#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
          TabOrder = 0
          WordWrap = True
        end
        object CheckBox13: TCheckBox
          Left = 10
          Top = 43
          Width = 171
          Height = 26
          Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1091' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' '#1087#1086' Ctrl+Alt+L'
          TabOrder = 1
          WordWrap = True
          OnClick = CheckBox13Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 215
        Top = 115
        Width = 191
        Height = 121
        Caption = ' '#1055#1089#1077#1074#1076#1086#1085#1080#1084#1099' '
        TabOrder = 3
        object RadioButton3: TRadioButton
          Left = 10
          Top = 15
          Width = 171
          Height = 21
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1088#1077#1084#1077#1085#1085#1099#1081
          Checked = True
          TabOrder = 0
          TabStop = True
          WordWrap = True
          OnClick = RadioButton3Click
        end
        object RadioButton4: TRadioButton
          Left = 10
          Top = 65
          Width = 171
          Height = 17
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1086#1089#1090#1086#1103#1085#1085#1099#1081
          TabOrder = 1
          OnClick = RadioButton4Click
        end
        object ComboBox5: TsComboBox
          Left = 10
          Top = 85
          Width = 171
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          sStyle.GroupIndex = 0
          sStyle.SkinSection = 'TsComboBox'
          sStyle.Painting.ColorBorderBottom = 12937777
          sStyle.Painting.Color = clWhite
          sStyle.Caption.Layout = sclLeft
          sStyle.Caption.MaxWidth = 0
          sStyle.Caption.Font.Charset = DEFAULT_CHARSET
          sStyle.Caption.Font.Color = clWindowText
          sStyle.Caption.Font.Height = -11
          sStyle.Caption.Font.Name = 'MS Sans Serif'
          sStyle.Caption.Font.Style = []
          sStyle.Caption.Active = False
          GlyphMode.Grayed = False
          OnChange = ComboBox5Change
        end
        object DirEdit2: TsDirectoryEdit
          Left = 10
          Top = 40
          Width = 171
          Height = 21
          GlyphMode.Grayed = False
          sStyle.GroupIndex = 0
          sStyle.SkinSection = 'TsDirectoryEdit'
          sStyle.Painting.ColorBorderBottom = 12937777
          sStyle.Painting.Color = clWhite
          sStyle.Caption.Layout = sclLeft
          sStyle.Caption.MaxWidth = 0
          sStyle.Caption.Font.Charset = DEFAULT_CHARSET
          sStyle.Caption.Font.Color = clWindowText
          sStyle.Caption.Font.Height = -11
          sStyle.Caption.Font.Name = 'MS Sans Serif'
          sStyle.Caption.Font.Style = []
          sStyle.Caption.Active = False
          TabOrder = 3
          OnButtonClick = DirEdit2ButtonClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 10
        Top = 10
        Width = 396
        Height = 111
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 270
        Top = 23
        Width = 30
        Height = 13
        Caption = #1084#1080#1085#1091#1090
      end
      object Label2: TLabel
        Left = 20
        Top = 89
        Width = 38
        Height = 13
        Caption = #1074' '#1087#1072#1087#1082#1091
      end
      object CheckBox1: TCheckBox
        Left = 20
        Top = 20
        Width = 191
        Height = 17
        Caption = #1040#1074#1090#1086#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099' '#1082#1072#1078#1076#1099#1077':'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 20
        Top = 66
        Width = 281
        Height = 17
        Caption = #1044#1077#1083#1072#1090#1100' '#1088#1077#1079#1077#1088#1074#1085#1091#1102' '#1082#1086#1087#1080#1102' '#1090#1072#1073#1083#1080#1094#1099' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 20
        Top = 43
        Width = 311
        Height = 17
        Caption = #1044#1077#1083#1072#1090#1100' '#1088#1077#1079#1077#1088#1074#1085#1091#1102' '#1082#1086#1087#1080#1102' '#1090#1072#1073#1083#1080#1094#1099' '#1087#1088#1080' '#1072#1074#1090#1086#1089#1086#1093#1088#1072#1085#1077#1085#1080#1080
        TabOrder = 2
        OnClick = CheckBox3Click
      end
      object SpinEdit1: TsSpinEdit
        Left = 215
        Top = 19
        Width = 51
        Height = 22
        MaxLength = 4
        TabOrder = 3
        Text = '10'
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsSpinEdit'
        sStyle.Painting.ColorBorderBottom = 12937777
        sStyle.Painting.Color = clWhite
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Active = False
        MaxValue = 9999
        MinValue = 0
        Value = 10
      end
      object DirEdit1: TsDirectoryEdit
        Left = 65
        Top = 86
        Width = 261
        Height = 21
        GlyphMode.Grayed = False
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsDirectoryEdit'
        sStyle.Painting.ColorBorderBottom = 12937777
        sStyle.Painting.Color = clWhite
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Text = 'DirEdit1'
        sStyle.Caption.Active = False
        TabOrder = 4
        OnChange = DirEdit1Change
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1041#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1100
      ImageIndex = 2
      object Bevel5: TBevel
        Left = 10
        Top = 105
        Width = 396
        Height = 76
        Shape = bsFrame
      end
      object Bevel3: TBevel
        Left = 10
        Top = 25
        Width = 396
        Height = 36
        Shape = bsFrame
      end
      object Bevel4: TBevel
        Left = 10
        Top = 65
        Width = 396
        Height = 36
        Shape = bsFrame
      end
      object nkLinkLabel1: TnkLinkLabel
        Left = 235
        Top = 35
        Width = 90
        Height = 13
        Cursor = crHandPoint
        Alignment = taCenter
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        OnClick = nkLinkLabel1Click
        FontNotMove.Charset = DEFAULT_CHARSET
        FontNotMove.Color = clBlue
        FontNotMove.Height = -11
        FontNotMove.Name = 'MS Sans Serif'
        FontNotMove.Style = [fsUnderline]
        FontMove.Charset = DEFAULT_CHARSET
        FontMove.Color = clRed
        FontMove.Height = -11
        FontMove.Name = 'MS Sans Serif'
        FontMove.Style = [fsUnderline]
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clRed
        FontDown.Height = -11
        FontDown.Name = 'MS Sans Serif'
        FontDown.Style = [fsUnderline]
      end
      object nkLinkLabel2: TnkLinkLabel
        Left = 235
        Top = 75
        Width = 90
        Height = 13
        Cursor = crHandPoint
        Alignment = taCenter
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        OnClick = nkLinkLabel2Click
        FontNotMove.Charset = DEFAULT_CHARSET
        FontNotMove.Color = clBlue
        FontNotMove.Height = -11
        FontNotMove.Name = 'MS Sans Serif'
        FontNotMove.Style = [fsUnderline]
        FontMove.Charset = DEFAULT_CHARSET
        FontMove.Color = clRed
        FontMove.Height = -11
        FontMove.Name = 'MS Sans Serif'
        FontMove.Style = [fsUnderline]
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clRed
        FontDown.Height = -11
        FontDown.Name = 'MS Sans Serif'
        FontDown.Style = [fsUnderline]
      end
      object nkLinkLabel3: TnkLinkLabel
        Left = 235
        Top = 135
        Width = 90
        Height = 13
        Cursor = crHandPoint
        Alignment = taCenter
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        OnClick = nkLinkLabel3Click
        FontNotMove.Charset = DEFAULT_CHARSET
        FontNotMove.Color = clBlue
        FontNotMove.Height = -11
        FontNotMove.Name = 'MS Sans Serif'
        FontNotMove.Style = [fsUnderline]
        FontMove.Charset = DEFAULT_CHARSET
        FontMove.Color = clRed
        FontMove.Height = -11
        FontMove.Name = 'MS Sans Serif'
        FontMove.Style = [fsUnderline]
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clRed
        FontDown.Height = -11
        FontDown.Name = 'MS Sans Serif'
        FontDown.Style = [fsUnderline]
      end
      object Label7: TLabel
        Left = 140
        Top = 5
        Width = 110
        Height = 13
        Caption = #1047#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1087#1072#1088#1086#1083#1100':'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object CheckBox4: TCheckBox
        Left = 20
        Top = 35
        Width = 181
        Height = 17
        Caption = #1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
        TabOrder = 0
        OnClick = CheckBox4Click
      end
      object CheckBox6: TCheckBox
        Left = 20
        Top = 115
        Width = 180
        Height = 17
        Caption = #1085#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
        TabOrder = 1
      end
      object CheckBox7: TCheckBox
        Left = 20
        Top = 135
        Width = 180
        Height = 17
        Caption = #1085#1072' '#1089#1086#1093#1088#1072#1085#1077#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
        TabOrder = 2
      end
      object CheckBox8: TCheckBox
        Left = 20
        Top = 155
        Width = 180
        Height = 17
        Caption = #1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
        TabOrder = 3
      end
      object CheckBox9: TCheckBox
        Left = 20
        Top = 75
        Width = 180
        Height = 17
        Caption = #1087#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1086#1082#1085#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
        TabOrder = 4
        OnClick = CheckBox9Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1056#1077#1075#1080#1086#1085#1072#1083#1100#1085#1099#1077' '#1089#1090#1072#1085#1076#1072#1088#1090#1099
      ImageIndex = 3
      object Bevel2: TBevel
        Left = 10
        Top = 10
        Width = 396
        Height = 166
        Shape = bsFrame
      end
      object LbSpeedButton2: TLbSpeedButton
        Left = 70
        Top = 140
        Width = 100
        Height = 23
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        Color = 15717314
        ColorWhenDown = 14399133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          A6020000424DA6020000000000003600000028000000100000000D0000000100
          18000000000070020000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF62FF87594257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF62FF875AF2775AF27759
          4257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF62FF875AF2775AF277594257FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF62FF875AF2775AF2775AF2774F
          D576594257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          62FF875AF2775AF2775AF2774FD5764FD576594257FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C45AF2774FD576594257FFFFFF4FD5764F
          D5764FD576594257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C45AF277
          594257FFFFFFFFFFFFFFFFFFFFFFFF4FD57600C43E594257FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F
          D57600C43E00C43E594257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00C43E00C43E594257FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00C43E05B52C594257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C405B52C5942
          57FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFC4C4C405B52C594257FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF05B52C05B52C594257}
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWhite
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LightColor = 12937777
        NumGlyphs = 1
        ParentColor = False
        ParentFont = False
        ShadowColor = 12937777
        Style = bsXP
        OnClick = LbSpeedButton2Click
      end
      object Label3: TLabel
        Left = 20
        Top = 24
        Width = 170
        Height = 13
        Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077' '#1076#1077#1085#1077#1078#1085#1086#1081' '#1077#1076#1080#1085#1080#1094#1099':'
      end
      object Label4: TLabel
        Left = 20
        Top = 54
        Width = 187
        Height = 13
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1094#1077#1083#1086#1081' '#1080' '#1076#1088#1086#1073#1085#1086#1081' '#1095#1072#1089#1090#1080':'
      end
      object Label5: TLabel
        Left = 20
        Top = 84
        Width = 147
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1088#1086#1073#1085#1099#1093' '#1079#1085#1072#1082#1086#1074':'
      end
      object Label6: TLabel
        Left = 20
        Top = 114
        Width = 151
        Height = 13
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1075#1088#1091#1087#1087' '#1088#1072#1079#1088#1103#1076#1086#1074':'
      end
      object LbSpeedButton3: TLbSpeedButton
        Left = 185
        Top = 140
        Width = 156
        Height = 23
        Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1085#1072#1089#1090#1088#1086#1081#1082#1072
        Color = 15717314
        ColorWhenDown = 14399133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFF8A8A8A6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6EFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B7C6CBA1B3BABDC8D0BF
          CDD5B8CAD4B2C7D3ACC4D2A5C0D29FBDD19DBBD06E6E6EFFFFFFFFFFFFFFFFFF
          FFFFFF7E9A9F9AC6D06E91966E919698A9B1B6C5CFC0D2DFCDE2F0C8DFEEC1DB
          EDA1BDD06E6E6EFFFFFFFFFFFF7E9A9F9AC6D0A5D9E5A0D6E3709EAA678E9964
          90976E919697A8AFBDCFDACEE2F0C8DFEEA5BFD06E6E6EFFFFFF90AEB4B3E2EB
          B1E0E9AADDE8A8DCE57CB4BF6F9EAA6CA3AA649CA15B878AB8C7D0D4E7F2CFE2
          F0AAC1D06E6E6EFFFFFF96B1B7C2E0E8D7DCF0CBD6E8B0DFEA83BBC87BB4BD74
          ACB66BA3AB628D93BCC8D0DAE9F3D4E6F2ADC2D06E6E6EFFFFFF9AB5BAD9F1F7
          EEE2F0DADFEFC7DDE689C4D082BBC779B3BD72AAB367959BC1CBD2E1EEF5DAE9
          F2B1C4D06E6E6EFFFFFFA0B7BCF7FCFDF4FBFEC4E9F3CBEBF395C6D08AC4CF81
          BAC679B1BC6C9AA1C6CED3E7F1F7E1EBF2B6C6D06E6E6EFFFFFFA4BABFE2F7FC
          D6F2F9F1FCFEE8F9FCACC5C9C9ECF39FD0DB80BAC472A0A9CBCFD3EBF2F7E7EE
          F3B6C6D06E6E6EFFFFFFAABABFF1FCFEF7FDFEE9F9FDE7F8FCACC5C9CDE8ECD2
          F0F5C4E8EF91B8BFD4D6D9F2F5F7E4E9EEC7CCD26E6E6EFFFFFF9AB5BAACC5C9
          ACC5C9ACC5C9ACC5C9ADC2C5ACC5C9ACC5C9ACC5C99AB5BAF8F8F9E8E9EBC8CD
          D0A9ACB16E6E6EFFFFFFFFFFFF9AB5BA9AB5BAE2F7FCACC5C9F1FCFED4EEF29A
          B5BA9AB5BADEDEDEACACAC9B9B9B9797977B7B7B6E6E6EFFFFFFFFFFFFFFFFFF
          FFFFFF9AB5BA9AB5BA9AB5BA9AB5BAF9F9F9DEEDEFFDFDFD9B9B9BDDDDDDDEED
          EFB8B8B86E6E6EFFFFFFFFFFFFFFFFFFFFFFFF8A8A8AE8E8E8DEEDEFDEEDEFDE
          EDEFDEEDEFF0F0F0999999DEEDEFB8B8B88A8A8AFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF8A8A8AE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8C8CDD08A8A8AB8B8B88A8A
          8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A8A8A8A8A8A8A8A8A8A8A
          8A8A8A8A8A8A8A8A8A8A8A8A8A8AFFFFFFFFFFFFFFFFFFFFFFFF}
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWhite
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LightColor = 12937777
        NumGlyphs = 1
        ParentColor = False
        ParentFont = False
        ShadowColor = 12937777
        Style = bsXP
        OnClick = LbSpeedButton3Click
      end
      object ComboBox1: TsComboBox
        Left = 255
        Top = 20
        Width = 140
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          #1075#1088#1085'.'
          #1088'.'
          '$'
          #8364)
        TabOrder = 0
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsComboBox'
        sStyle.Painting.ColorBorderBottom = 12937777
        sStyle.Painting.Color = clWhite
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Active = False
        GlyphMode.Grayed = False
      end
      object ComboBox2: TsComboBox
        Left = 255
        Top = 50
        Width = 140
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          ','
          '.')
        TabOrder = 1
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsComboBox'
        sStyle.Painting.ColorBorderBottom = 12937777
        sStyle.Painting.Color = clWhite
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Active = False
        GlyphMode.Grayed = False
      end
      object ComboBox3: TsComboBox
        Left = 255
        Top = 80
        Width = 140
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
        TabOrder = 2
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsComboBox'
        sStyle.Painting.ColorBorderBottom = 12937777
        sStyle.Painting.Color = clWhite
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Active = False
        GlyphMode.Grayed = False
      end
      object ComboBox4: TsComboBox
        Left = 255
        Top = 110
        Width = 140
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          ','
          '.'
          ' ')
        TabOrder = 3
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsComboBox'
        sStyle.Painting.ColorBorderBottom = 12937777
        sStyle.Painting.Color = clWhite
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Active = False
        GlyphMode.Grayed = False
      end
    end
  end
  object sEditorsManager1: TsEditorsManager
    Painting.ColorBorderBottom = 12937777
    Painting.Color = clWhite
    GroupIndex = 0
    Active = True
    Left = 30
    Top = 275
  end
end
