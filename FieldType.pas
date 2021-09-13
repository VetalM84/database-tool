unit FieldType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, db, dbtables, CheckLst, sEdit,
  LbSpeedButton;

type
  TTypeForm = class(TForm)
    RadioGroup1: TRadioGroup;
    ActionList1: TActionList;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action6: TAction;
    Action7: TAction;
    Action1: TAction;
    CheckBox1: TCheckBox;
    Action5: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Edit1: TsEdit;
    Edit2: TsEdit;
    Button1: TLbSpeedButton;
    Button2: TLbSpeedButton;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeForm: TTypeForm;
  req, fsize: boolean;
  ftype: tfieldtype;
  s: integer;

implementation

uses main, Wizard;

{$R *.dfm}

procedure TTypeForm.Button1Click(Sender: TObject);
  label 1;
begin
  wizform.ChBox.Items.Strings[i]:= edit2.Text;
  if fsize = false then goto 1
  else
  begin
    s:= strtoint(edit1.Text);
    edit1.Clear;
  end;
  1: close;
end;

procedure TTypeForm.FormShow(Sender: TObject);
begin
  radiogroup1.ItemIndex:= -1;
  checkbox1.Checked:= false;
  req:= false;
  edit2.Text:= wizform.ChBox.Items.Strings[i];
end;

procedure TTypeForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'9':;
    #8:;
  else
    key := #0;
  end;
end;

procedure TTypeForm.Button2Click(Sender: TObject);
begin
  otv:=MessageBox(handle,PChar('Вы действительно хотите завершить'+#13+
  '      процесс создания таблицы?  '),PChar('Завершение работы мастера'), 292);
  if otv=IDYES then halt;
  if otv=IDNO then ;
end;

procedure TTypeForm.FormCreate(Sender: TObject);
begin
  radiogroup1.Buttons[0].Action:= action1;
  radiogroup1.Buttons[1].Action:= action2;
  radiogroup1.Buttons[2].Action:= action3;
  radiogroup1.Buttons[3].Action:= action4;
  radiogroup1.Buttons[4].Action:= action5;
  radiogroup1.Buttons[5].Action:= action6;
  radiogroup1.Buttons[6].Action:= action7;
  radiogroup1.Buttons[7].Action:= action8;
  radiogroup1.Buttons[8].Action:= action9;
  radiogroup1.Buttons[9].Action:= action10;
  radiogroup1.Buttons[10].Action:= action11;
  radiogroup1.Buttons[11].Action:= action12;
end;

procedure TTypeForm.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then req:= true
  else req:= false;
end;

procedure TTypeForm.Action1Execute(Sender: TObject);
begin
  ftype:= ftstring;
  fsize:= true;
  with edit1 do
  begin
    Enabled:= true;
    text:= '10';
  end;
end;

procedure TTypeForm.Action2Execute(Sender: TObject);
begin
  ftype:= ftinteger;
  fsize:= false;
  edit1.Enabled:= false;
  // От –2 147 483 648 до 2 147 483 647
end;

procedure TTypeForm.Action3Execute(Sender: TObject);
begin
  ftype:= ftfloat;
  fsize:= false;
  edit1.Enabled:= false;
  // диапазон значений от -9,99*103^07 до 9,99*10^307
end;

procedure TTypeForm.Action4Execute(Sender: TObject);
begin
  ftype:= ftcurrency;
  fsize:= false;
  edit1.Enabled:= false;
  // - 922337203685477,5808грн.	922337203685477,5807грн.
end;

procedure TTypeForm.Action5Execute(Sender: TObject);
begin
  ftype:= ftdate;
  fsize:= false;
  edit1.Enabled:= false;
end;

procedure TTypeForm.Action6Execute(Sender: TObject);
begin
  ftype:= fttime;
  fsize:= false;
  edit1.Enabled:= false;
end;

procedure TTypeForm.Action7Execute(Sender: TObject);
begin
  ftype:= ftdatetime;
  fsize:= false;
  edit1.Enabled:= false;
end;


procedure TTypeForm.Action10Execute(Sender: TObject);
begin
  ftype:= ftblob;
  fsize:= false;
  edit1.Enabled:= false;
end;

procedure TTypeForm.Action8Execute(Sender: TObject);
begin
  ftype:= ftmemo;
  fsize:= false;
  edit1.Enabled:= false;
end;

procedure TTypeForm.Action11Execute(Sender: TObject);
begin
  ftype:= ftgraphic;
  fsize:= false;
  edit1.Enabled:= false;
end;


procedure TTypeForm.Action12Execute(Sender: TObject);
begin
  ftype:= ftautoinc;
  fsize:= false;
  edit1.Enabled:= false;
end;

procedure TTypeForm.Action9Execute(Sender: TObject);
begin
  ftype:= ftfmtmemo;
  fsize:= false;
  edit1.Enabled:= false;
end;
{Table1.Fields[0].Required := False;
или оба в runtime
Table1.FieldByName('Fieldname').Required := False;}

end.

