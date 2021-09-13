unit AddIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LbSpeedButton, sEdit, dbtables, db, ComCtrls, CheckLst,
  sCustomListBox, ExtCtrls, bde;

type
  TIdxForm = class(TForm)
    Panel1: TPanel;
    LbSpeedButton1: TLbSpeedButton;
    Edit1: TsEdit;
    Edit2: TsEdit;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ListBox1: TsListBox;
    LbSpeedButton3: TLbSpeedButton;
    LbSpeedButton4: TLbSpeedButton;
    Panel2: TPanel;
    ListView1: TListView;
    LbSpeedButton5: TLbSpeedButton;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    LbSpeedButton6: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure LbSpeedButton4Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure LbSpeedButton5Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LbSpeedButton6Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IdxForm: TIdxForm;
  tbl: ttable;
  ListItem: TListItem;
  F: TFieldDef;
  ren: integer;
  Props: CURProps;
  opt: tindexoptions;

implementation

uses main;

{$R *.dfm}

procedure TIdxForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  zeromemory(addr(opt), sizeof(opt));
  with tbl do
  begin
    Close;
    Free;
  end;
  release;
  idxform:= nil;
end;

procedure TIdxForm.LbSpeedButton1Click(Sender: TObject);
begin
  // добавить индекс
  try
    with tbl do
    begin
      mainform.Query.Close;
      close;
      Exclusive := True;
      open;
      AddIndex(edit1.Text, edit2.Text, opt);
      messagebox(idxform.Handle, 'Индекс успешно добавлен', 'Информация', 64);
      listview1.Update;
      zeromemory(addr(opt), sizeof(opt));
    end;
  except
    messagebox(idxform.Handle, 'Не удалось добавить индекс' +#13+
      'Возможно таблица имеет атрибут "Только чтение"', 'Ошибка', 16);
    zeromemory(addr(opt), sizeof(opt));
    listview1.Update;
  end;
end;

procedure TIdxForm.FormCreate(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  tbl:= ttable.Create(application);
  with tbl do
  begin
    DatabaseName:= defalias;
    TableName:= tblname;
    open;
// получаем список вcех полей таблицы
    for i:= 0 to FieldDefs.Count - 1 do
    begin
      F:= FieldDefs.Items[i];
      listBox1.Items.Add(F.Name);
    end;
// gполучаем писок всех индексов
  listview1.Clear;
  for i:= 0 to Tbl.IndexDefs.Count - 1 do
  begin
    with Tbl.IndexDefs.Items[i] do
    with ListView1 do
      with listitem do
      begin
        ListItem := Items.Add;
        Caption := Tbl.IndexDefs.Items[i].Name;
        SubItems.Add(fields);
        if ixPrimary in tbl.IndexDefs.Items[i].Options then
          S := 'ixPrimary, ';
        if ixUnique in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixUnique, ';
        if ixDescending in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixDescending, ';
        if ixCaseInsensitive in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixCaseInsensitive, ';
        if ixExpression in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixExpression, ';
        if S > ' ' then
          system.Delete(S, Length(S) - 1, 2);
        SubItems.add(s);
      end;
  end;
  end;
  caption:= caption + tblname;
  Check(DbiGetCursorProps(Tbl.Handle, Props));
  if (Props.szTableType = szPARADOX) then
    checkbox5.Enabled:= false
  else if (Props.szTableType = szDBASE) then;
end;

procedure TIdxForm.ListView1Click(Sender: TObject);
begin
  ren:= listview1.ItemIndex;
end;

procedure TIdxForm.LbSpeedButton4Click(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to listbox1.Items.Count - 1 do
    edit2.Text:= edit2.Text + listbox1.Items.Strings[i] + ';';
end;

procedure TIdxForm.LbSpeedButton3Click(Sender: TObject);
begin
  listbox1.DeleteSelected;
end;

procedure TIdxForm.LbSpeedButton5Click(Sender: TObject);
begin
  // удалить индекс
  try
    with tbl do
    begin
      mainform.Query.Close;
      close;
      Exclusive := True;
      open;
      DeleteIndex(listview1.Items.Item[ren].Caption);
      messagebox(idxform.Handle, 'Индекс успешно удален', 'Информация', 64);
      listview1.Update;
    end;
  except
    messagebox(idxform.Handle, 'Не удалось удалить индекс' +#13+
      'Возможно таблица имеет атрибут "Только чтение"', 'Ошибка', 16);
    listview1.Update;
  end;
end;

procedure TIdxForm.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((GetKeyState(VK_DELETE) AND 128) = 128) then
    listbox1.DeleteSelected;
end;

procedure TIdxForm.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((GetKeyState(VK_DELETE) AND 128) = 128) then
  // удалить индекс
  try
    with tbl do
    begin
      mainform.Query.Close;
      close;
      Exclusive := True;
      open;
      DeleteIndex(listview1.Items.Item[ren].Caption);
      messagebox(idxform.Handle, 'Индекс успешно удален', 'Информация', 64);
      listview1.Update;
    end;
  except
    messagebox(idxform.Handle, 'Не удалось удалить индекс' +#13+
      'Возможно таблица имеет атрибут "Только чтение"', 'Ошибка', 16);
    listview1.Update;
  end;
end;

procedure TIdxForm.LbSpeedButton6Click(Sender: TObject);
begin
  close;
end;

procedure TIdxForm.LbSpeedButton2Click(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  listview1.Clear;
  for i:= 0 to Tbl.IndexDefs.Count - 1 do
  begin
    with Tbl.IndexDefs.Items[i] do
    with ListView1 do
      with listitem do
      begin
        ListItem := Items.Add;
        Caption := Tbl.IndexDefs.Items[i].Name;
        SubItems.Add(fields);
        if ixPrimary in tbl.IndexDefs.Items[i].Options then
          S := 'ixPrimary, ';
        if ixUnique in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixUnique, ';
        if ixDescending in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixDescending, ';
        if ixCaseInsensitive in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixCaseInsensitive, ';
        if ixExpression in tbl.IndexDefs.Items[i].Options then
          S := S + 'ixExpression, ';
        if S > ' ' then
          system.Delete(S, Length(S) - 1, 2);
        SubItems.add(s);
      end;
  end;
end;

procedure TIdxForm.CheckBox2Click(Sender: TObject);
begin
  if checkbox2.Checked then
    opt:= opt - [ixNonMaintained] + [ixUnique]
  else opt:= opt - [ixUnique];
  if checkbox2.Checked then
    checkbox6.Enabled:= false
  else checkbox6.Enabled:= true;
end;

procedure TIdxForm.CheckBox6Click(Sender: TObject);
begin
  if checkbox6.Checked then
    opt:= opt - [ixUnique] + [ixNonMaintained]
  else opt:= opt - [ixNonMaintained];
  if checkbox6.Checked then
    checkbox2.Enabled:= false
  else checkbox2.Enabled:= true;
end;

procedure TIdxForm.CheckBox4Click(Sender: TObject);
begin
  if checkbox4.Checked then
    opt:= opt + [ixCaseInsensitive]
  else opt:= opt - [ixCaseInsensitive];
end;

procedure TIdxForm.CheckBox3Click(Sender: TObject);
begin
  if checkbox3.Checked then
    opt:= opt + [ixDescending]
  else opt:= opt - [ixDescending];
end;

end.
