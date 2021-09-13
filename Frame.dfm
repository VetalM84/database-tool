object Frame7: TFrame7
  Left = 0
  Top = 0
  Width = 181
  Height = 414
  AutoScroll = False
  TabOrder = 0
  DesignSize = (
    181
    414)
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 181
    Height = 414
    HorzScrollBar.Smooth = True
    VertScrollBar.Smooth = True
    Anchors = [akLeft, akTop, akBottom]
    BorderStyle = bsNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 5
      Top = 10
      Width = 170
      Height = 120
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 168
        Height = 118
        Align = alClient
        AutoSize = True
        Center = True
      end
      object LbSpeedButton1: TLbSpeedButton
        Left = 147
        Top = 3
        Width = 20
        Height = 20
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnClick = LbSpeedButton1Click
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 145
      Width = 170
      Height = 120
      TabOrder = 1
      object Image2: TImage
        Left = 1
        Top = 1
        Width = 168
        Height = 118
        Align = alClient
      end
      object LbSpeedButton2: TLbSpeedButton
        Left = 147
        Top = 3
        Width = 20
        Height = 20
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnClick = LbSpeedButton2Click
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 280
      Width = 170
      Height = 120
      TabOrder = 2
      object Image3: TImage
        Left = 1
        Top = 1
        Width = 168
        Height = 118
        Align = alClient
      end
      object LbSpeedButton3: TLbSpeedButton
        Left = 147
        Top = 3
        Width = 20
        Height = 20
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        OnClick = LbSpeedButton3Click
      end
    end
  end
end
