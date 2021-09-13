unit FEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sCustomComboBox, db, LbSpeedButton, volfnded;

type
  TFEditForm = class(TForm)
    ComboBox1: TsComboBox;
    LbSpeedButton1: TLbSpeedButton;
    CheckBox1: TCheckBox;
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure LbSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditForm: TFEditForm;
  t, l: integer; // положение формы
  F: TFieldDef;

implementation

uses Main;

{$R *.dfm}

procedure TFEditForm.FormDeactivate(Sender: TObject);
begin
  close;
end;

procedure TFEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  feditform:= nil;
end;

procedure TFEditForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  combobox1.Clear;
  with mainform.Query do
  for i := 0 to FieldDefs.Count - 1 do
  begin
    F := FieldDefs.Items[i];
    combobox1.Items.Add(f.Name);
  end;
  case par of
    1:
    begin
      combobox1.Text:= mainform.FEdit1.DataField;
      with checkbox1 do
      begin
        if mainform.FEdit1.FindStyle = vfsNavigate then
          Checked:= true
        else
          checkbox1.Checked:= false;
      end;
    end;
    2:
    begin
      combobox1.Text:= mainform.FEdit2.DataField;
      with checkbox1 do
      begin
        if mainform.FEdit2.FindStyle = vfsNavigate then
          Checked:= true
        else
          checkbox1.Checked:= false;
      end;
    end;
  end;  
end;

procedure TFEditForm.ComboBox1Change(Sender: TObject);
begin
  case par of
    1: mainform.FEdit1.DataField:= combobox1.Text;
    2: mainform.FEdit2.DataField:= combobox1.Text;
  end;
end;

procedure TFEditForm.CheckBox1Click(Sender: TObject);
begin
  with checkbox1 do
  begin
    case par of
      1:
      begin
        if not checked then
        begin
          caption:= 'Фильтр';
          mainform.FEdit1.FindStyle:= vfsFilter;
        end
        else
        begin
          caption:= 'Навигатор';
          mainform.FEdit1.FindStyle:= vfsNavigate;
        end;
      end;
      2:
      begin
        if not checked then
        begin
          caption:= 'Фильтр';
          mainform.FEdit2.FindStyle:= vfsFilter;
        end
        else
        begin
          caption:= 'Навигатор';
          mainform.FEdit2.FindStyle:= vfsNavigate;
        end;
      end;
    end;
  end;
end;

procedure TFEditForm.LbSpeedButton1Click(Sender: TObject);
begin
  if clientwidth <= 180 then
    clientwidth:= 260
  else clientwidth:= 179;  
end;

end.
