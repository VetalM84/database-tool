unit Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, sCustomComboBox, sEditorsManager, ExtCtrls, db,
  dbtables, LbSpeedButton, Buttons, sMemo, FileCtrl, bde, sEdit, sSpinEdit;

type
  TFilterForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    sEditorsManager1: TsEditorsManager;
    ComboBox1: TsComboBox;
    LbSpeedButton1: TLbSpeedButton;
    TabSheet3: TTabSheet;
    Memo1: TsMemo;
    LbSpeedButton3: TLbSpeedButton;
    LbSpeedButton7: TLbSpeedButton;
    LbSpeedButton8: TLbSpeedButton;
    LbSpeedButton9: TLbSpeedButton;
    LbSpeedButton10: TLbSpeedButton;
    LbSpeedButton11: TLbSpeedButton;
    LbSpeedButton12: TLbSpeedButton;
    Bevel2: TBevel;
    Label5: TLabel;
    Bevel3: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure LbSpeedButton7Click(Sender: TObject);
    procedure LbSpeedButton10Click(Sender: TObject);
    procedure LbSpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FilterForm: TFilterForm;
  F: TFieldDef;
  shName: string;   // имя таблицы без расширения

implementation

uses Main;

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

procedure TFilterForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  try
    with mainform.Query do
    for i := 0 to FieldDefs.Count - 1 do
    begin
      F := FieldDefs.Items[i];
      combobox1.Items.Add(f.Name);
    end;
  except
    messagebox(handle, 'Неизвестное имя файла таблицы', 'Ошибка', 16);
    close;
  end;
end;

procedure TFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  filterform:= nil;
end;

procedure TFilterForm.LbSpeedButton3Click(Sender: TObject);
begin
  close;
end;

procedure TFilterForm.LbSpeedButton1Click(Sender: TObject);
begin
  with mainform.Query do
  begin
    close;
    databasename:= defalias;
    Close;
    SQL.Clear;
    SQL.Add('select * from "' + tblname + '"');
    Open;
  end;
end;

procedure TFilterForm.LbSpeedButton7Click(Sender: TObject);
begin
// Исключение дубликатов
  try
    shname:= copy(tblname, 1, length(tblname) - length(extractfileext(tblname)));
    with mainform.Query do
    begin
      sql.Clear;
      sql.Add('SELECT DISTINCT ' + shname + '."' + combobox1.Text + '" FROM "'+ TblName + '" ' + shname);
      open;
    end;
  except
    messagebox(handle, 'Не удалось выполнить операцию.' +#13+ 'Возможно имя поля неверно',
      'Ошибка', 16);
    combobox1.SetFocus;
    mainform.Query.Open;
  end;
end;

procedure TFilterForm.LbSpeedButton10Click(Sender: TObject);
begin
  memo1.Clear;
end;

procedure TFilterForm.LbSpeedButton9Click(Sender: TObject);
begin
  with mainform.Query do
  begin
    close;
    sql.Clear;
    sql.Add(memo1.Text);
    open;
  end;
end;

end.
