unit TableControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, dbtables, StdCtrls, sCustomComboBox, FileCtrl,
  sEdit, ExtCtrls, bde, ComCtrls, db, psvDialogs;

type
  TControlForm = class(TForm)
    Panel1: TPanel;
    Edit1: TsEdit;
    FileListBox1: TFileListBox;
    Label1: TLabel;
    LbSpeedButton1: TLbSpeedButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    ComboBox1: TsComboBox;
    LbSpeedButton2: TLbSpeedButton;
    Folder1: TpsvBrowseFolderDialog;
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlForm: TControlForm;
  ren, act: integer;
  tbl: ttable;

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

// пакование таблицы
procedure Bde_PackTable(DataSet: TDataSet);
var
  hDb: hDBIDb;
  Tbl: TTable;
  Props: CURProps;
  CrDesc: CRTblDesc;
  Save: Boolean;
begin
  if (DataSet is TTable) then
  begin
    Tbl := TTable(DataSet);
    Save := Tbl.Active;
    Tbl.Active := True;
    try
      Check(DbiGetCursorProps(Tbl.Handle, Props));
      if (Props.szTableType = szPARADOX) then
      begin
        FillChar(CrDesc, SizeOf(CRTblDesc), 0);
        StrCopy(CrDesc.szTblName, Props.szName);
        StrCopy(CrDesc.szTblType, Props.szTableType);
        CrDesc.bPack := True;
        Check(DbiGetObjFromObj(hDBIObj(Tbl.Handle), objDATABASE, hDBIObj(hDb)));
        Tbl.DisableControls;
        Tbl.Active := False;
        Check(DbiDoRestructure(hDb, 1, @CrDesc, nil, nil, nil, False));
      end
      else if (Props.szTableType = szDBASE) then
      begin
        Tbl.Active := True;
        Check(DbiPackTable(Tbl.DBHandle, Tbl.Handle, nil, szDBASE, True));
      end;
    finally
      Tbl.Active := Save;
      Tbl.EnableControls;
    end;
  end;
end;

// удалить таблицу
procedure DeleteTable(Dir, TblName: String);
var
  DBHandle: HDBIDB;
  ResultCode: DBIResult;
  tbl: Array[0..255] of Char;
  SrcTbl: TTable;
begin
  SrcTbl := TTable.Create(Application);
  try
    SrcTbl.DatabaseName := Dir;
    SrcTbl.TableName := TblName;
    SrcTbl.Open;
    DBHandle := SrcTbl.DBHandle;
    SrcTbl.Close;
    ResultCode := DbiDeleteTable(DBHandle, StrPCopy(Tbl,Dir + '\' + TblName), nil);
  finally
    SrcTbl.Free;
  end;
end;

// копировать таблицу
procedure CopyTable(FromDir, SrcTblName, ToDir, DestTblName:
  string);
var
  DBHandle: HDBIDB;
  ResultCode: DBIResult;
  Src, Dest{, Err}: array[0..255] of Char;
  SrcTbl, DestTbl: TTable;
begin
  SrcTbl := TTable.Create(Application);
  DestTbl := TTable.Create(Application);
  try
    SrcTbl.DatabaseName := FromDir;
    SrcTbl.TableName := SrcTblName;
    SrcTbl.Open;
    DBHandle := SrcTbl.DBHandle;
    SrcTbl.Close;
    ResultCode := DbiCopyTable(DBHandle, false, StrPCopy(Src, FromDir + '\' + SrcTblName),
    nil, StrPCopy(Dest, ToDir + '\' + DestTblName));
{    if (ResultCode <> DBIERR_NONE) then
    begin
      DbiGetErrorString(ResultCode, Err);
      raise EDatabaseError.Create('При копировании ' +
        FromDir + '\' + SrcTblName + ' в ' +
        ToDir + '\' + DestTblName + ' ,'
        + 'BDE сгенерировал ошибку '''
        + StrPas(Err) + '''');
    end;}
  finally
    SrcTbl.Free;
    DestTbl.Free;
  end;
end;

procedure TControlForm.LbSpeedButton1Click(Sender: TObject);
begin
  case act of
    -1:   messagebox(handle, 'Выберите действие', 'Внимание', 48); // проверка действия

    0: // копировать
      try
        folder1.Execute;
        if folder1.FolderName = '' then messagebox(handle, 'Копирование прервано пользователем', 'Информация', 64)
        else
          begin
            copytable(GetPhNameByAlias(combobox1.Text), filelistbox1.Items.Strings[ren],
              folder1.FolderName, filelistbox1.Items.Strings[ren]);
            messagebox(ControlForm.Handle, 'Таблица успешно скопирована', 'Информация', 64);
          end;
      except
        messagebox(handle, 'Не удалось скопировать таблицу' +#13+
          'Проверьте правильность имени и псевдонима' , 'Ошибка', 16);
      end;

    1: // удалить
    begin
      try
        deletetable(GetPhNameByAlias(combobox1.Text), filelistbox1.Items.Strings[ren]);
        messagebox(ControlForm.Handle, 'Таблица успешно удалена', 'Информация', 64);
      except
        messagebox(handle, 'Не удалось удалить таблицу' +#13+
          'Проверьте правильность имени и псевдонима' , 'Ошибка', 16);
      end;
    end;

    2: // упаковать
    begin
      try
        tbl:= ttable.Create(application);
        with tbl do
          try
            DatabaseName:= combobox1.Text;
            TableName:= filelistbox1.Items.Strings[ren];
            Bde_PackTable(tbl);
          finally
            tbl.Free;
            messagebox(ControlForm.Handle, 'Таблица упакована успешно', 'Информация', 64);
          end;
      except
        messagebox(handle, 'Не удалось упаковать таблицу' +#13+
          'Проверьте правильность имени и псевдонима' , 'Ошибка', 16);
      end;
    end;

    3: // переименовать
    begin
      try
        with TTable.Create(nil) do
          try
            DatabaseName := combobox1.Text;
            TableName := filelistbox1.Items.Strings[ren];
            Active := False;
            renametable(edit1.Text);
          finally
            free;
            messagebox(ControlForm.Handle, 'Таблица переименована успешно', 'Информация', 64);
          end;
      except
        messagebox(handle, 'Не удалось переименовать таблицу' +#13+
          'Проверьте правильность имени и псевдонима' , 'Ошибка', 16);
      end;
    end;
  end;
  filelistbox1.Update;
end;

procedure TControlForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  act:= -1;
  release;
  ControlForm:= nil;
end;

procedure TControlForm.LbSpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TControlForm.FileListBox1Click(Sender: TObject);
begin
  ren:= filelistbox1.ItemIndex;
  edit1.Text:= filelistbox1.Items.Strings[ren];
end;

procedure TControlForm.FormCreate(Sender: TObject);
begin
  act:= -1;
  combobox1.Clear;
  Session.GetAliasNames(comboBox1.Items);
  filelistbox1.Clear;
end;

procedure TControlForm.ComboBox1Change(Sender: TObject);
begin
  filelistbox1.Directory:= GetPhNameByAlias(combobox1.Text);
end;

procedure TControlForm.RadioButton1Click(Sender: TObject);
begin
  act:= 0; // копировать
  with edit1 do
  begin
    sStyle.Caption.Text:= 'Имя файла';
    ReadOnly:= true;
  end;
end;

procedure TControlForm.RadioButton2Click(Sender: TObject);
begin
  act:= 1; // удалить
  with edit1 do
  begin
    sStyle.Caption.Text:= 'Имя файла';
    ReadOnly:= true;
  end;
end;

procedure TControlForm.RadioButton3Click(Sender: TObject);
begin
  act:= 2; // упаковать
  with edit1 do
  begin
    sStyle.Caption.Text:= 'Имя файла';
    ReadOnly:= true;
  end;
end;

procedure TControlForm.RadioButton4Click(Sender: TObject);
begin
  act:= 3; // переименовать
  with edit1 do
  begin
    sStyle.Caption.Text:= 'Новое имя файла';
    ReadOnly:= false;
  end;
end;

end.
