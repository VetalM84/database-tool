object FEditForm: TFEditForm
  Left = 235
  Top = 258
  BorderStyle = bsNone
  Caption = 'FEditForm'
  ClientHeight = 21
  ClientWidth = 179
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object LbSpeedButton1: TLbSpeedButton
    Left = 165
    Top = 0
    Width = 14
    Height = 21
    Caption = '>'
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
    OnClick = LbSpeedButton1Click
  end
  object ComboBox1: TsComboBox
    Left = 0
    Top = 0
    Width = 166
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsComboBox'
    sStyle.Painting.ColorBorderTop = clBtnHighlight
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
    OnChange = ComboBox1Change
  end
  object CheckBox1: TCheckBox
    Left = 185
    Top = 2
    Width = 71
    Height = 17
    Caption = #1053#1072#1074#1080#1075#1072#1090#1086#1088
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBox1Click
  end
end
