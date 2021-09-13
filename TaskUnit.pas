unit TaskUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Frame;

type
  TTaskForm = class(TForm)
    Frame71: TFrame7;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TaskForm: TTaskForm;

implementation

uses main;

{$R *.dfm}

procedure TTaskForm.FormCreate(Sender: TObject);
begin
  with frame71 do
  begin
    Image1.Picture.LoadFromFile('task.jpg');
    Image2.Picture.LoadFromFile('task.jpg');
    Image3.Picture.LoadFromFile('task.jpg');
  end;
  checkbox1.Checked:= ini.ReadBool('TaskPanel', 'OnTop', true);
  if ini.ReadBool('TaskPanel', 'OnTop', true) = true then formstyle:= fsstayontop
  else formstyle:= fsnormal;
end;

procedure TTaskForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  taskform:= nil;
end;

procedure TTaskForm.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    ini.Writebool('TaskPanel', 'OnTop', true);
    formstyle:= fsstayontop;
  end
  else
  begin
    ini.Writebool('TaskPanel', 'OnTop', false);
    formstyle:= fsnormal;
  end;
end;

end.
