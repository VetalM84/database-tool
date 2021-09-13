object TaskForm: TTaskForm
  Left = 273
  Top = 34
  Width = 214
  Height = 475
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1054#1082#1085#1086' '#1079#1072#1076#1072#1095
  Color = 14849652
  Constraints.MaxWidth = 214
  Constraints.MinWidth = 214
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
  inline Frame71: TFrame7
    Left = 0
    Top = 20
    Width = 206
    Height = 421
    AutoScroll = False
    TabOrder = 0
    inherited ScrollBox1: TScrollBox
      Width = 206
      Height = 421
      Constraints.MaxWidth = 206
      Constraints.MinWidth = 206
      inherited Panel1: TPanel
        Left = 10
        inherited Image1: TImage
          Center = False
        end
        inherited LbSpeedButton1: TLbSpeedButton
          Style = bsShape
        end
      end
      inherited Panel2: TPanel
        Left = 10
        inherited LbSpeedButton2: TLbSpeedButton
          Style = bsShape
        end
      end
      inherited Panel3: TPanel
        Left = 10
        inherited LbSpeedButton3: TLbSpeedButton
          Style = bsShape
        end
      end
    end
  end
  object CheckBox1: TCheckBox
    Left = 35
    Top = 0
    Width = 141
    Height = 17
    Caption = #1055#1086#1074#1077#1088#1093' '#1086#1089#1090#1072#1083#1100#1085#1099#1093' '#1086#1082#1086#1085
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBox1Click
  end
end
