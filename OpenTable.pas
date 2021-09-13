unit OpenTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, StdCtrls, Mask, sCustomComboEdit, sTooledit,
  ComCtrls, sEditorsManager, sCustomComboBox, FileCtrl, dbtables, bde,
  sEdit, sSpinEdit, sMemo, db;

type
  TOpenTableForm = class(TForm)
    LbSpeedButton1: TLbSpeedButton;
    Label1: TLabel;
    ComboBox1: TsComboBox;
    FileListBox1: TFileListBox;
    LbSpeedButton2: TLbSpeedButton;
    LbSpeedButton3: TLbSpeedButton;
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OpenTableForm: TOpenTableForm;
  otv: word;
  t, ren: integer;
  F: TFieldDef;
  sl: tstringlist;
  shName,   // имя таблицы без расширения
  tname: string; // имя таблицы под курсором в filelistbox1


implementation

uses Main, ChooseField;

{$R *.dfm}

function GetPhNameByAlias(sAlias: string): string;
var
  Database: TDatabase;
  pszDir: PChar;
begin
  Database := TDatabase.Create(nil); {allocate memory}
  pszDir := StrAlloc(255);
  try
    Database.AliasName := sAlias;
    Database.DatabaseName := 'TEMPDatabase'; {requires a name -- is ignored}
    Database.Connected := True; {connect without opening any table}
    DbiGetDirectory(Database.Handle, True, pszDir); {get the dir.}
    Database.Connected := False; {disconnect}
    Result := StrPas(pszDir); {convert to a string}
  finally
    Database.Free; {free memory}
  end;
end;

procedure TOpenTableForm.LbSpeedButton1Click(Sender: TObject);
label op;
begin
// открываем таблицу
  if mainform.Query.Active then
  begin
    otv:=MessageBox(handle,PChar('Закрыть текущую таблицу с потерей всех не сохраненных данных?'),
    PChar('Подтверждение'), 36);
    if otv=IDNO then ;
    if otv=IDYES then
op:   try
        with mainform.Query do
        begin
          close;
          databasename:= combobox1.Text;
          Close;
          SQL.Clear;
          SQL.Add('select * from "' + extractfilename(filelistbox1.FileName) + '"');
          Open;
          TblName:= extractfilename(filelistbox1.FileName);
          defalias:= combobox1.Text;
          opentableform.Close;
        end;
      except
        messagebox(handle, 'Неизвестное имя файла или псевдоним', 'Ошибка', 16);
        combobox1.SetFocus;
      end;
  end
  else
    goto op;
end;

procedure TOpenTableForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sl.Free;
  sl:= nil;
  release;
  opentableform:= nil;
end;

procedure TOpenTableForm.FormCreate(Sender: TObject);
begin
  combobox1.Clear;
  Session.GetAliasNames(comboBox1.Items);
  filelistbox1.clear;
end;

procedure TOpenTableForm.ComboBox1Change(Sender: TObject);
begin
  filelistbox1.Directory:= GetPhNameByAlias(combobox1.Text);
  filelistbox1.Update;
end;

procedure TOpenTableForm.LbSpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TOpenTableForm.FileListBox1DblClick(Sender: TObject);
label op;
begin
// открываем таблицу
  if mainform.Query.Active then
  begin
    otv:=MessageBox(handle,PChar('Закрыть текущую таблицу с потерей всех не сохраненных данных?'),
    PChar('Подтверждение'), 36);
    if otv=IDNO then ;
    if otv=IDYES then
    begin
op:   mainform.Query.Close;
      try
        with mainform.Query do
        begin
          databasename:= combobox1.Text;
          Close;
          SQL.Clear;
          SQL.Add('select * from "' + extractfilename(filelistbox1.FileName) + '"');
          Open;
          TblName:= extractfilename(filelistbox1.FileName);
          defalias:= combobox1.Text;
          opentableform.Close;
        end;
      except
        messagebox(handle, 'Неизвестное имя файла или псевдоним', 'Ошибка', 16);
        combobox1.SetFocus;
      end;
    end;
  end
  else
    goto op;
end;

procedure TOpenTableForm.LbSpeedButton3Click(Sender: TObject);
begin
  if fieldform = nil then
  begin
    fieldform:= tfieldform.Create(self);
    fieldform.Show;
  end
  else
    show;
end;

end.
