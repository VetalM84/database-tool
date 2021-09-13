object FullChartForm: TFullChartForm
  Left = 188
  Top = 143
  Width = 544
  Height = 375
  Caption = 'FullChartForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 0
    Width = 185
    Height = 41
    Caption = ' '#1048#1089#1090#1086#1095#1085#1080#1082' '#1076#1072#1085#1085#1099#1093' '
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 10
      Top = 15
      Width = 81
      Height = 17
      Caption = #1058#1072#1073#1083#1080#1094#1072' 1'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 95
      Top = 15
      Width = 83
      Height = 17
      Caption = #1058#1072#1073#1083#1080#1094#1072' 2'
      TabOrder = 1
    end
  end
  object ComboBox1: TsComboBox
    Left = 200
    Top = 15
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsComboBox'
    sStyle.Painting.ColorBorderTop = clBtnHighlight
    sStyle.Painting.ColorBorderBottom = 12937777
    sStyle.Painting.Color = clWhite
    sStyle.Caption.Layout = sclTopLeft
    sStyle.Caption.MaxWidth = 0
    sStyle.Caption.Font.Charset = DEFAULT_CHARSET
    sStyle.Caption.Font.Color = clWindowText
    sStyle.Caption.Font.Height = -11
    sStyle.Caption.Font.Name = 'MS Sans Serif'
    sStyle.Caption.Font.Style = []
    sStyle.Caption.Text = #1055#1086#1083#1077' '#1089#1086' '#1079#1085#1072#1095#1077#1085#1080#1103#1084#1080
    sStyle.Caption.Active = True
    GlyphMode.Grayed = False
  end
  object ComboBox2: TsComboBox
    Left = 333
    Top = 15
    Width = 120
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsComboBox'
    sStyle.Painting.ColorBorderTop = clBtnHighlight
    sStyle.Painting.ColorBorderBottom = 12937777
    sStyle.Painting.Color = clWhite
    sStyle.Caption.Layout = sclTopLeft
    sStyle.Caption.MaxWidth = 0
    sStyle.Caption.Font.Charset = DEFAULT_CHARSET
    sStyle.Caption.Font.Color = clWindowText
    sStyle.Caption.Font.Height = -11
    sStyle.Caption.Font.Name = 'MS Sans Serif'
    sStyle.Caption.Font.Style = []
    sStyle.Caption.Text = #1055#1086#1083#1077' '#1089' '#1085#1072#1076#1087#1080#1089#1103#1084#1080
    sStyle.Caption.Active = True
    GlyphMode.Grayed = False
  end
end
