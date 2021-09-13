unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, db, dbtables, StdCtrls, xpman,
  Mask, XPStyleActnCtrls, ActnMan, ActnColorMaps, ActnCtrls, ActnMenus,
  ActnList, ToolWin, inifiles, bde, StdActns, LbSpeedButton, frame, ComCtrls,
  DirInspector, VolFndEd, sCustomComboBox, sCustomComboEdit,  Menus,
  VolDBGrid, ExtActns, Buttons;

type
  TMainForm = class(TForm)                DataSource1: TDataSource;
    ActionManager1: TActionManager;  ActionMainMenuBar1: TActionMainMenuBar;
    XPColorMap1: TXPColorMap;        Action1: TAction;
    Action2: TAction;                Action3: TAction;
    Action4: TAction;                Action5: TAction;
    DBNavigator1: TDBNavigator;
    EditCut1: TEditCut;              EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;          EditUndo1: TEditUndo;
    EditSelectAll1: TEditSelectAll;  EditDelete1: TEditDelete;
    Action7: TAction;                Action8: TAction;
    saveTimer: TTimer;               Action6: TAction;
    Action9: TAction;                Action10: TAction;
    Query: TQuery;                   Action11: TAction;
    DataSource2: TDataSource;        Frame71: TFrame7;
    Action12: TAction;               StatusBar1: TStatusBar;
    Action13: TAction;               DirInsp1: TDirInspector;  Action14: TAction;
    Action15: TAction;               Button1: TButton;
    Label1: TLabel;                  LbSpeedButton1: TLbSpeedButton;
    Action16: TAction;               Button2: TButton;
    FEdit1: TVolgaFindEdit;          LbSpeedButton2: TLbSpeedButton;
    FEdit2: TVolgaFindEdit;          LbSpeedButton3: TLbSpeedButton;
    DBGrid1: TVolgaDBGrid;
    Query1: TQuery;
    ListControlMoveSelection1: TListControlMoveSelection;
    ListControlMoveSelection2: TListControlMoveSelection;
    SpeedButton1: TSpeedButton;

    procedure FormCreate(Sender: TObject);      procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);  procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);  procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);  procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);  procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Action9Execute(Sender: TObject);  procedure Action10Execute(Sender: TObject);
    procedure saveTimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);      procedure FormDestroy(Sender: TObject);
    procedure Action12Execute(Sender: TObject); procedure Action13Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject); procedure DirInsp1ChangeAttributes(Sender: TObject);
    procedure DirInsp1ChangeDirName(Sender: TObject); procedure DirInsp1ChangeFileName(Sender: TObject);
    procedure DirInsp1ChangeLastWrite(Sender: TObject); procedure DirInsp1ChangeSize(Sender: TObject);
    procedure Action15Execute(Sender: TObject); procedure Button1Click(Sender: TObject);
    procedure Action16Execute(Sender: TObject); procedure LbSpeedButton1Click(Sender: TObject);
    procedure Action11Execute(Sender: TObject); procedure Button2Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject); procedure LbSpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  hot,                     // горячая клавиша
  state: integer;          // параметр для logonform
  ini: tinifile;           // ini-файл
  otv: word;               // для messagebox
  pasw,                    // пароль открытия параметров
  TblName,                 // имя открытой таблицы (только файла)
  DefAlias: string;        // алиас по умолчанию
  par: integer;            // параметр для FilterEdit
//  SV : SysVersion;
  const
    MOD_ALT = 1;
    MOD_CONTROL = 2;
    MOD_SHIFT = 4;
    MOD_WIN = 8;
    VK_L = 76;

implementation

uses Wizard, Settings, TaskUnit, DirMonitor, Alias, Logon,
  UserList, InsertData, OpenTable, Filter, TableControl, AddIndex, FEdit,
  ChooseField, Charts;

{$R *.dfm}


procedure tMainForm.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = hot then
  begin
    state:= 1;
    mainform.Hide;
    if logonform = nil then
    begin
      with logonform do
      begin
        logonform:= tlogonform.Create(application);
        BorderIcons:= BorderIcons - [biSystemmenu];
        Show;
        caption:= 'Программа заблокирована';
        lbspeedbutton2.Enabled:= false;
      end;
    end
    else
    logonform.Show;
  end;
end;


procedure TMainForm.FormCreate(Sender: TObject);
label ali;
begin
  ini:= tinifile.Create(extractfilepath(paramstr(0))+'Settings.ini');
  state:= 0;
   // Register Hotkey Ctrl+Alt+L
  if ini.readBool('Common', 'AllowLock', true) = true then
  begin
    hot:= GlobalAddAtom('LockApp');
    RegisterHotKey(Handle, hot, MOD_CONTROL + mod_alt, VK_L);
  end;

  with button1 do
  begin
    Parent:= statusbar1;
    height:= 18;
    width:= 143;
    top:= 1;
    left:= 135;
  end;

  with ini do
  begin
    if readbool('Alias', 'UseTempAlias', true) = true then
    begin
      if DirectoryExists(readString('Alias','TempAliasDir', readstring('Alias', 'TempAliasDir',
        extractfilepath(paramstr(0))+'Data')))
      then
ali:    with Session do
        begin
          ConfigMode := cmSession;
          try
            // создадим временный псевдоним для базы данных
            AddStandardAlias('Рабочий', readstring('Alias', 'TempAliasDir',
              extractfilepath(paramstr(0))+'Data'),'PARADOX');
          finally
            ConfigMode := cmAll;
          end;
        end
      else
      begin
        createdir(readstring('Alias', 'TempAliasDir', extractfilepath(paramstr(0))+'Data'));
        goto ali;
      end;
    end;
    savetimer.Enabled:= readbool('Save', 'autosave', true);
    savetimer.Interval:= readinteger('Save', 'savetimer', 600000{10 минут});

    if readbool('TaskPanel', 'SaveSize', false) = true then
    begin
      with frame71 do
      begin
        Panel1.Top:= readInteger('TaskPanel', 'Panel1Top', frame71.Panel1.Top);
        Panel1.Height:= readInteger('TaskPanel', 'Panel1', frame71.Panel1.Height);
        Panel2.Top:= readInteger('TaskPanel', 'Panel2Top', frame71.Panel2.Top);
        Panel2.Height:= readInteger('TaskPanel', 'Panel2', frame71.Panel2.Height);
        Panel3.Top:= readInteger('TaskPanel', 'Panel3Top', frame71.Panel3.Top);
        Panel3.Height:= readInteger('TaskPanel', 'Panel3', frame71.Panel3.Height);
      end;
    end;
//session.PrivateDir:= 'c:\1';
    if ReadBool('TaskPanel', 'Show', true) = true then
    begin
      frame71.Visible:= true;
      with frame71 do
      begin
        Image1.Picture.LoadFromFile('task.jpg');
        Image2.Picture.LoadFromFile('task.jpg');
        Image3.Picture.LoadFromFile('task.jpg');
      end;
    end
    else
    begin
      frame71.Visible:= false;
      with dbgrid1 do
      begin
        Left:= 5;
        width:= mainform.ClientWidth - 10;
      end;
//      dbnavigator1.Left:= 505;
    end;
  end;
end;

procedure TMainForm.Action1Execute(Sender: TObject);
begin
  if opentableform = nil then
  begin
    opentableform:= topentableform.create(self);
    opentableform.ShowModal;
  end;
end;

procedure TMainForm.Action2Execute(Sender: TObject);
begin
  query.Close;
end;

procedure TMainForm.Action3Execute(Sender: TObject);
begin
  query.Close;
  close;
end;

procedure TMainForm.Action4Execute(Sender: TObject);
begin
  if wizform = nil then
  begin
    wizform:= twizform.Create(self);
    wizform.Show;
  end
  else
    wizform.Show;
end;

procedure TMainForm.Action5Execute(Sender: TObject);
begin
  try
    query.Open;
  except
    messagebox(handle, 'Не удалось открыть таблицу' +#13+
      'Проверьте правильность имени и псевдонима' , 'Ошибка', 16);
  end;
end;

procedure TMainForm.Action6Execute(Sender: TObject);
begin
// открытие окна параметров
  if ini.ReadBool('Pasw', 'setting', false) = true then
  begin
    clok:= inputquery('Параметры приложения', 'Введите пароль', pasw);
    if clok then
      if pasw = ini.ReadString('Pasw', 'openset', '') then
      begin
        ZeroMemory(Addr(pasw), SizeOf(pasw));
        setform:= tsetform.Create(self);
        setform.ShowModal;
      end
      else
      begin
        zeromemory(addr(pasw), sizeof(pasw));
        MessageBox(handle, 'Введен неправильный пароль', 'Ошибка', 16);
      end;
  end
  else
  begin
    setform:= tsetform.Create(self);
    setform.ShowModal;
  end;
end;

procedure TMainForm.Action7Execute(Sender: TObject);
begin
  if insform = nil then
  begin
    insform:= tinsform.Create(self);
    insform.Show;
    action7.Enabled:= false;
  end
  else
    insform.Show;
end;

procedure TMainForm.Action8Execute(Sender: TObject);
begin
// очистить таблицу от всех записей
  otv:= Messagebox(handle, 'Это действие удалит все записи безвозвратно!'+#13+
    'Продолжить?', 'Подтверждение', 49);
  if otv = IDOK then
  begin
    query.Close;
    {Opens the table in exclusive mode}
    with TTable.Create(nil) do
    begin
      try
        DatabaseName := defAlias;  // ДОРАБОТАТЬ
        TableName := tblname;      // ДОРАБОТАТЬ
        Active := False;
        Exclusive := True;
        Active := True;
        try
          EmptyTable;
        finally
          free;
          query.Open;
        end;
      except
        Messagebox(mainform.Handle, 'Не удалось очистить таблицу', 'Ошибка', 16);
        query.Open;
      end;
    end;
  end;
  if otv=IDCANCEL then ;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
// если таблица изменена сохраняем или нет при выходе
// query.Modified = true если НЕ вызван метод POST
  if (query.State in dsEditModes) or (query.Modified) then
  begin
    otv:= MessageBox(handle, PChar('Данные в таблице были изменены.'+#10#13+
      '       Сохранить изменения?'),
    PChar('Подтверждение'), 35);
    if otv=IDYES then
       with query do
       begin
         if State in [dsEdit,dsInsert] then Post;
         ApplyUpdates;
         CommitUpdates;
       end;
    if otv=IDNO then
      with query do
      begin
        if State in [dsEdit,dsInsert] then Cancel;
        CancelUpdates;
      end;
    if otv=IDCANCEL then
      canclose:= false;

  end;
end;

procedure TMainForm.Action9Execute(Sender: TObject);
begin
// сохраняем изменения
    with query do
    begin
      if State in [dsEdit,dsInsert] then Post;
      ApplyUpdates;
      CommitUpdates;
    end;

end;

procedure TMainForm.Action10Execute(Sender: TObject);
begin
// отменяем изменения
  with query do
  begin
    if State in [dsEdit,dsInsert] then Cancel;
    CancelUpdates;
  end;
end;

procedure TMainForm.saveTimerTimer(Sender: TObject);
begin
// автосохранение по таймеру
  with query do
  begin
    if State in [dsEdit,dsInsert] then Post;
    ApplyUpdates;
    CommitUpdates;
  end;
// резервное копирование   НЕМА :)
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  refresh;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  with ini do
  begin
    writebool('DirMonitor', 'Active', false);
    // сохраняем расположение панелей
    if readbool('TaskPanel', 'SaveSize', false) = true then
    begin
      WriteInteger('TaskPanel', 'Panel1Top', frame71.Panel1.Top);
      WriteInteger('TaskPanel', 'Panel1', frame71.Panel1.Height);
      WriteInteger('TaskPanel', 'Panel2Top', frame71.Panel2.Top);
      WriteInteger('TaskPanel', 'Panel2', frame71.Panel2.Height);
      WriteInteger('TaskPanel', 'Panel3Top', frame71.Panel3.Top);
      WriteInteger('TaskPanel', 'Panel3', frame71.Panel3.Height);
    end;
    if readBool('Common', 'AllowLock', true) = true then
    begin
// отмена регистрации горячих клaвишь
      UnRegisterHotKey(Handle, hot);
      GlobalDeleteAtom(hot);
    end;
    free;
  end;
end;

procedure TMainForm.Action12Execute(Sender: TObject);
begin
  if taskform = nil then
  begin
    taskform:= ttaskform.Create(self);
    taskform.Show;
  end
  else
    taskform.Show;
end;

procedure TMainForm.Action13Execute(Sender: TObject);
begin
  if monform = nil then
  begin
    monform:= tmonform.Create(self);
    monform.Show;
  end
  else monform.Show;
end;

procedure TMainForm.Action14Execute(Sender: TObject);
begin
  if aliasform = nil then
  begin
    aliasform:= taliasform.Create(self);
    aliasform.Show;
  end
  else aliasform.Show;
end;

procedure TMainForm.DirInsp1ChangeAttributes(Sender: TObject);
begin
  button1.Caption:= 'Изменения аттрибутов';
  //Сигнализировать об изменении атрибутов файлов или подкаталогов.
end;

procedure TMainForm.DirInsp1ChangeDirName(Sender: TObject);
begin
  button1.Caption:= 'Изменения подкаталогов';
  //Сигнализировать о создании, удалении, переименовании подкаталогов.
end;

procedure TMainForm.DirInsp1ChangeFileName(Sender: TObject);
begin
  button1.Caption:= 'Изменения файлов';
  //Сигнализировать о создании, удалении и переименовании файла.
end;

procedure TMainForm.DirInsp1Changesize(Sender: TObject);
begin
  button1.Caption:= 'Изменения размера файлов';
  //Сигнализировать об изменении размеров файлов. Операционная система определяет,
  //что размер файла изменился, только если он закрыт
end;

procedure TMainForm.DirInsp1Changelastwrite(Sender: TObject);
begin
  button1.Caption:= 'Изменения даты файлов';
  //Сигнализировать о смене даты последнего изменения файла. Операционная система
  //определяет, что дата изменения файла сменилась, только если он закрыт
end;

procedure TMainForm.Action15Execute(Sender: TObject);
begin
  if userform = nil then
  begin
    userform:= tuserform.create(self);
    userform.Showmodal;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  button1.Caption:= '';
end;

procedure TMainForm.Action16Execute(Sender: TObject);
begin
// очиста строки от всех записей
  query.Edit;
  query.ClearFields;
  query.Post;
end;

procedure TMainForm.LbSpeedButton1Click(Sender: TObject);
begin
  if filterform = nil then
  begin
  try
    query.Open;
    filterform:= tfilterform.create(self);
    filterform.show;
  except
      messagebox(handle, 'Таблица должна быть открыта', 'Ошибка', 16);
  end;
  end
  else
    filterform.show;
end;

procedure TMainForm.Action11Execute(Sender: TObject);
begin
  if controlForm = nil then
  begin
    controlForm:= TcontrolForm.create(self);
    controlForm.showmodal;
  end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  if fieldform = nil then
  begin
    fieldform:= tfieldform.Create(self);
    fieldform.Show;
  end
  else
    fieldform.show;
{  if idxForm = nil then
  begin
    idxForm:= TidxForm.create(self);
    idxForm.showmodal;
  end;}
end;

procedure TMainForm.LbSpeedButton2Click(Sender: TObject);
begin
  par:= 1;
  if feditform = nil then
  begin
    feditform:= tfeditform.Create(self);
    with feditform do
    begin
      t:= mainform.Top + fedit1.Top + fedit1.Height + 35;
      l:= mainform.Left + fedit1.Left + fedit1.Width + 8;
      top:= t;
      left:= l;
      show;
    end;
  end
  else
    feditform.show;
end;

procedure TMainForm.LbSpeedButton3Click(Sender: TObject);
begin
  par:= 2;
  if feditform = nil then
  begin
    feditform:= tfeditform.Create(self);
    with feditform do
    begin
      t:= mainform.Top + fedit2.Top + fedit2.Height + 35;
      l:= mainform.Left + fedit2.Left + fedit2.Width + 8;
      top:= t;
      left:= l;
      show;
    end;
  end
  else
    feditform.Show;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  if chartform = nil then
  begin 
    chartform:= tchartform.Create(self);
    chartform.Show;
  end
  else
    chartform.show;
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin
  if ms <> nil then showmessage('not nil');

end;

end.


// Overview of using cached updates (help)
// автообновление
// при первом запуске проверить установленность BD
// очистка переменных в памяти ZeroMemory(Addr(yourVar), SizeOf(yourVar));
// пароли                        .
// пароли к таблицам
// taborder
// резервное копирование
// пользовательская панель кнопок
// вшить в exe-файл, ini файл с настройками по умолчанию
// блокирование программы (как в винде Win+L)   .
// hint                                    
// пользователи и их права доступа
// восстанавливать ширину колонок для каждой таблицы
// графики
// ZIP
// QuickReport
