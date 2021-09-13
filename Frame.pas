unit Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, LbSpeedButton;

type
  TFrame7 = class(TFrame)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    LbSpeedButton3: TLbSpeedButton;
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses main, TaskUnit;

{$R *.dfm}

procedure TFrame7.LbSpeedButton1Click(Sender: TObject);
begin
  with panel1 do
  begin
    if height = 120 then Height:= 25 else height:= 120;
  end;
  panel2.Top:= panel1.Top + panel1.Height + 15;
  panel3.Top:= panel2.Top + panel2.Height + 15;
{  if ini.ReadBool('TaskPanel', 'Show', false) = true and taskform <> nil
  and taskform.Active then
  begin
    scrollbox1.Height:= panel3.Top + panel3.Height + 15;
    height:= scrollbox1.Height;
    taskform.ClientHeight:= height + 15;
  end; }
end;

procedure TFrame7.LbSpeedButton2Click(Sender: TObject);
begin
  with panel2 do
  begin
    if height = 120 then Height:= 25 else height:= 120;
  end;
  panel3.Top:= panel2.Top + panel2.Height + 15;
end;

procedure TFrame7.LbSpeedButton3Click(Sender: TObject);
begin
  with panel3 do
  begin
    if height = 120 then Height:= 25 else height:= 120;
  end;
end;

end.
