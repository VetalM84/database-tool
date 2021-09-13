object InsForm: TInsForm
  Left = 256
  Top = 213
  BorderStyle = bsToolWindow
  Caption = 'InsForm'
  ClientHeight = 110
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 90
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 60
    Top = 5
    Width = 31
    Height = 26
    Caption = #1044#1072#1090#1072
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 5
    Top = 5
    Width = 31
    Height = 26
    Caption = 'Imag'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 115
    Top = 5
    Width = 31
    Height = 26
    Caption = '3'
    TabOrder = 2
    OnClick = Button3Click
  end
end
