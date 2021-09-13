object NewUserForm: TNewUserForm
  Left = 277
  Top = 192
  BorderStyle = bsToolWindow
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 224
  ClientWidth = 230
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
  object LbSpeedButton1: TLbSpeedButton
    Left = 75
    Top = 195
    Width = 70
    Height = 23
    Caption = #1054#1050
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
  object LbSpeedButton2: TLbSpeedButton
    Left = 155
    Top = 195
    Width = 70
    Height = 23
    Caption = #1054#1090#1084#1077#1085#1072
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
    OnClick = LbSpeedButton2Click
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 220
    Height = 185
    TabOrder = 0
    object Edit1: TsEdit
      Left = 10
      Top = 20
      Width = 201
      Height = 21
      TabOrder = 0
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsEdit'
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
      sStyle.Caption.Text = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      sStyle.Caption.Active = True
    end
    object Edit2: TsEdit
      Left = 10
      Top = 64
      Width = 201
      Height = 21
      TabOrder = 2
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsEdit'
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
      sStyle.Caption.Text = #1055#1072#1088#1086#1083#1100
      sStyle.Caption.Active = True
    end
    object Edit3: TsEdit
      Left = 10
      Top = 109
      Width = 201
      Height = 21
      TabOrder = 4
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsEdit'
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
      sStyle.Caption.Text = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
      sStyle.Caption.Active = True
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 137
      Width = 201
      Height = 17
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
      TabOrder = 6
    end
    object CheckBox2: TCheckBox
      Left = 10
      Top = 160
      Width = 201
      Height = 17
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084#1080
      TabOrder = 7
    end
  end
end
