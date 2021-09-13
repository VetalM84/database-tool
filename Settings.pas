unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LbSpeedButton, lbbuttons, ExtCtrls, shellapi, registry,
  ComCtrls, nkLinkLabel, sControlsManager, sSpinEdit, sEditorsManager, Mask,
  sCustomComboEdit, sTooledit, sCustomComboBox, sEdit, dbtables, bde, FileCtrl;

const
   InputQueryMessage = WM_USER + 200;

type
  TSetForm = class(TForm)
    LbSpeedButton4: TLbSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    LbSpeedButton1: TLbSpeedButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    CheckBox5: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Bevel5: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    nkLinkLabel1: TnkLinkLabel;
    nkLinkLabel2: TnkLinkLabel;
    nkLinkLabel3: TnkLinkLabel;
    Label7: TLabel;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Bevel2: TBevel;
    LbSpeedButton2: TLbSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LbSpeedButton3: TLbSpeedButton;
    SpinEdit1: TsSpinEdit;
    ComboBox1: TsComboBox;
    ComboBox2: TsComboBox;
    ComboBox3: TsComboBox;
    ComboBox4: TsComboBox;
    DirEdit1: TsDirectoryEdit;
    GroupBox3: TGroupBox;
    CheckBox12: TCheckBox;
    GroupBox4: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    ComboBox5: TsComboBox;
    sEditorsManager1: TsEditorsManager;
    CheckBox13: TCheckBox;
    DirEdit2: TsDirectoryEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure nkLinkLabel1Click(Sender: TObject);
    procedure nkLinkLabel2Click(Sender: TObject);
    procedure nkLinkLabel3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure LbSpeedButton4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure DirEdit2ButtonClick(Sender: TObject);
    procedure DirEdit1Change(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
  private
    { Private declarations }
    procedure InputQueryChar(var Msg: TMessage); message InputQueryMessage;
  public
    { Public declarations }
  end;


var
  SetForm: TSetForm;
  intl: hwnd;                // handle прилож. "язык и рег. настройки"
  reg: tregistry;            // переменная реестра
  clok, clok1: boolean;      // для inputquery
  oldpas, newpas: string;    // старый и новый пароли для inputquery
  fn: integer;               // selected item index для filelistbox

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

procedure Tsetform.InputQueryChar(var Msg: TMessage);
var
  hInputForm, hEdit: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

procedure TSetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  reg.Free;
  release;
  setform:= nil;
end;

procedure TSetForm.CheckBox2Click(Sender: TObject);
begin
// резервное копирование
  if checkbox2.Checked then
    ini.WriteBool('Save', 'exitcopy', true)
  else
    ini.WriteBool('Save', 'exitcopy', false);
end;

procedure TSetForm.CheckBox1Click(Sender: TObject);
begin
// автосохранение
  if checkbox1.Checked then
  begin
    with ini do
    begin
      writebool('Save', 'autosave', true);
      WriteInteger('Save', 'savetimer', spinedit1.Value * 60000);
    end;            // 2 147 483 647 - integer
  end
  else
    ini.WriteBool('Save', 'autosave', false);
end;

procedure TSetForm.LbSpeedButton2Click(Sender: TObject);
begin
// устанавливаем региональные настройки (валюты)
  with reg do
  begin
    RootKey:= HKEY_CURRENT_USER;
    openkey('control panel\international', false);
    writestring('sCurrency', combobox1.Text);
    writestring('sDecimal', combobox2.Text);
    writestring('iDigits', combobox3.Text);
    writestring('sThousand', combobox4.Text);
    closekey;
  end;
end;

procedure TSetForm.LbSpeedButton3Click(Sender: TObject);
begin
// запускаем прилож. "язык и региональные стандарты"
  shellexecute(handle, nil, 'intl.cpl', nil, nil, sw_shownormal);
end;

procedure TSetForm.LbSpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TSetForm.FormCreate(Sender: TObject);
begin
// читаем из реестра свойства валюты
  reg:= tregistry.Create;
  with reg do
  begin
    RootKey:= HKEY_CURRENT_USER;
    openkey('control panel\international', false);
    combobox1.Text:= readstring('sCurrency');
    combobox2.Text:= readstring('sDecimal');
    combobox3.Text:= readstring('iDigits');
    combobox4.Text:= readstring('sThousand');
    closekey;
  end;
 // синхронизация эл-тов
  with ini do
  begin
    checkbox1.Checked:= ReadBool('save', 'autosave', false);
    checkbox2.Checked:= readBool('Save', 'exitcopy', false);
    checkbox3.Checked:= readBool('Save', 'autocopy', false);
    checkbox4.Checked:= readBool('Pasw', 'start', false);
    checkbox5.Checked:= ReadBool('TaskPanel', 'Show', true);
    checkbox9.Checked:= readbool('Pasw', 'setting', false);
    checkbox10.Checked:= ReadBool('TaskPanel', 'OnTop', true);
    checkbox11.Checked:= readBool('TaskPanel', 'SaveSize', false);
    checkbox13.Checked:= readBool('Common', 'AllowLock', true);
    spinedit1.Value:= readinteger('Save', 'savetimer', 600000) div 60000;
    diredit1.Text:= readstring('Save', 'dirname', '');
    diredit2.Text:= readString('Alias', 'TempAliasDir', extractfilepath(paramstr(0))+'Data');
    radiobutton3.Checked:= readbool('Alias', 'UseTempAlias', true);
    radiobutton4.Checked:= readbool('Alias', 'UseConstAlias', false);
  // получаем список всех алиасов
    Session.GetAliasNames(comboBox5.Items);
    combobox5.Text:= readString('Alias', 'DefAlias', '');
    if ReadString('common', 'Style', 'XPNonFlat') = 'XPNonFlat' then
      radiobutton1.Checked:= true;
    if ReadString('common', 'Style', 'XPNonFlat') = 'XPNonFlat1' then
      radiobutton2.Checked:= true;
  end;
  // устанавливаем стиль кнопок
  if ini.ReadString('Common', 'Style', 'XPNonFlat') = 'XPNonFlat' then
  begin
    with lbspeedbutton1 do
    begin
      colorstyle:= lcsxpnonflat;
      style:= lbspeedbutton.bsXP;
    end;
    with lbspeedbutton2 do
    begin
      colorstyle:= lcsxpnonflat;
      style:= lbspeedbutton.bsXP;
    end;
    with lbspeedbutton3 do
    begin
      colorstyle:= lcsxpnonflat;
      style:= lbspeedbutton.bsXP;
    end;
    with lbspeedbutton4 do
    begin
      colorstyle:= lcsxpnonflat;
      style:= lbspeedbutton.bsXP;
    end;
  end;

  if ini.ReadString('Common', 'Style', 'XPNonFlat') = 'XPNonFlat1' then
  begin
    with lbspeedbutton1 do
    begin
      colorstyle:= lcsXPnonflat1;
      style:= lbspeedbutton.bsXP;
    end;
    with lbspeedbutton2 do
    begin
      colorstyle:= lcsXPnonflat1;
      style:= lbspeedbutton.bsXP;
    end;
    with lbspeedbutton3 do
    begin
      colorstyle:= lcsXPnonflat1;
      style:= lbspeedbutton.bsXP;
    end;
    with lbspeedbutton4 do
    begin
      colorstyle:= lcsXPnonflat1;
      style:= lbspeedbutton.bsXP;
    end;
  end;
end;

procedure TSetForm.CheckBox4Click(Sender: TObject);
begin
// запрос пароля при запуске программы
  if checkbox4.Checked then
  begin
    with ini do
    begin
      writebool('Pasw', 'start', true);
    end;
  end
  else
    ini.WriteBool('Pasw', 'start', false);
end;

procedure TSetForm.CheckBox9Click(Sender: TObject);
begin
// запрос пароля при открытии окна настроек
  if checkbox9.Checked then
  begin
    with ini do
    begin
      writebool('Pasw', 'setting', true);
    end;
  end
  else
   ini.WriteBool('Pasw', 'setting', false);
end;

procedure TSetForm.CheckBox3Click(Sender: TObject);
begin
// делать резервную копию таблицы при автосохранении
  if checkbox3.Checked then
  begin
    with ini do
    begin
      writebool('Save', 'autocopy', true);
    end;
  end
  else
    ini.WriteBool('Save', 'autocopy', false);
end;

procedure TSetForm.nkLinkLabel1Click(Sender: TObject);
begin
// ДОБАВИТЬ ШИФРОВАНИЕ И ПРОВЕРКУ ПАРОЛЯ ИЗ РЕЕСТРА и проверку пароля из резервного ini файла
// при закрытии этого окна копировать зашифрованный ini файл в папку system32
// пароль при запуске программы
  PostMessage(Handle, InputQueryMessage, 0, 0);
  clok:= inputquery('Изменение пароля', 'Введите старый пароль', oldpas);
  if clok then
    if oldpas = ini.ReadString('Pasw', 'run', '') then
    begin
      ZeroMemory(Addr(oldpas), SizeOf(oldpas)); // удаление переменной oldpas из памяти
      clok1:= inputquery('Изменение пароля', 'Введите новый пароль', newpas);
      if clok1 then
      begin
        ini.WriteString('Pasw', 'run', newpas);
        ZeroMemory(Addr(newpas), SizeOf(newpas)); // удаление переменной oldpas из памяти
      end;
    end
    else
    begin
      ZeroMemory(Addr(oldpas), SizeOf(oldpas)); // удаление переменной oldpas из памяти
      MessageBox(handle, 'Введен неправильный пароль', 'Ошибка', 16);
    end;
end;

procedure TSetForm.nkLinkLabel2Click(Sender: TObject);
begin
// пароль при открытии окна параметров
  PostMessage(Handle, InputQueryMessage, 0, 0);
  clok:= inputquery('Изменение пароля', 'Введите старый пароль', oldpas);
  if clok then
    if oldpas = ini.ReadString('Pasw', 'openset', '') then
    begin
      ZeroMemory(Addr(oldpas), SizeOf(oldpas)); // удаление переменной oldpas из памяти
      clok1:= inputquery('Изменение пароля', 'Введите новый пароль', newpas);
      if clok1 then
      begin
        ini.WriteString('Pasw', 'openset', newpas);
        ZeroMemory(Addr(newpas), SizeOf(newpas)); // удаление переменной oldpas из памяти
      end;
    end
    else
    begin
      ZeroMemory(Addr(oldpas), SizeOf(oldpas)); // удаление переменной oldpas из памяти
      MessageBox(handle, 'Введен неправильный пароль', 'Ошибка', 16);
    end;
end;

procedure TSetForm.nkLinkLabel3Click(Sender: TObject);
begin
// ДОБАВИТЬ ШИФРОВАНИЕ И ПРОВЕРКУ ПАРОЛЯ ИЗ РЕЕСТРА
// пароль при сохранении, изменении...
  PostMessage(Handle, InputQueryMessage, 0, 0);
  clok:= inputquery('Изменение пароля', 'Введите старый пароль', oldpas);
  if clok then
    if oldpas = ini.ReadString('Pasw', 'edit', '') then
    begin
      ZeroMemory(Addr(oldpas), SizeOf(oldpas)); // удаление переменной oldpas из памяти
      clok1:= inputquery('Изменение пароля', 'Введите новый пароль', newpas);
      if clok1 then
      begin
        ini.WriteString('Pasw', 'edit', newpas);
        ZeroMemory(Addr(newpas), SizeOf(newpas));
      end;
    end
    else
    begin
      ZeroMemory(Addr(oldpas), SizeOf(oldpas)); // удаление переменной oldpas из памяти
      MessageBox(handle, 'Введен неправильный пароль', 'Ошибка', 16);
    end;
end;

procedure TSetForm.RadioButton1Click(Sender: TObject);
begin
  ini.WriteString('Common', 'Style', 'XPNonFlat');
  with lbspeedbutton1 do
  begin
    colorstyle:= lcsXPNonFlat;
    style:= lbspeedbutton.bsXP;
  end;
end;

procedure TSetForm.RadioButton2Click(Sender: TObject);
begin
  ini.WriteString('Common', 'Style', 'XPNonFlat1');
  with lbspeedbutton1 do
  begin
    colorstyle:= lcsXPNonFlat1;
    style:= lbspeedbutton.bsXP;
  end;
end;

procedure TSetForm.CheckBox10Click(Sender: TObject);
begin
// taskform поверх остальных окон или нет
  if checkbox10.Checked then ini.Writebool('TaskPanel', 'OnTop', true)
  else ini.Writebool('TaskPanel', 'OnTop', false);
end;

procedure TSetForm.CheckBox5Click(Sender: TObject);
begin
// показывать ли панель задач на главной форме
  if checkbox5.Checked then
  begin
    ini.Writebool('TaskPanel', 'Show', true);
    with mainform do
    begin
      with frame71 do
      begin
        visible:= true;
        Image1.Picture.LoadFromFile('task.jpg');
        Image2.Picture.LoadFromFile('task.jpg');
        Image3.Picture.LoadFromFile('task.jpg');
      end;
      with dbgrid1 do
      begin
        Left:= 210;
        width:= mainform.ClientWidth - mainform.Frame71.Width - 8;
      end;
//      dbnavigator1.Left:= 210;
    end;
  end
  else
  begin
    ini.Writebool('TaskPanel', 'Show', false);
    with mainform do
    begin
      frame71.Visible:= false;
      with dbgrid1 do
      begin
        Left:= 5;
        width:= mainform.ClientWidth - 10;
      end;
//      dbnavigator1.Left:= 5;
    end;
  end;
end;

procedure TSetForm.CheckBox11Click(Sender: TObject);
begin
// сохранять ли расположение панелей при выходе
  with ini do
  begin
    if checkbox11.Checked then
      WriteBool('TaskPanel', 'SaveSize', true)
    else
      WriteBool('TaskPanel', 'SaveSize', false);
  end;
end;

procedure TSetForm.RadioButton3Click(Sender: TObject);
begin
  diredit2.Enabled:= true;
  with ini do
  begin
    writebool('Alias', 'UseConstAlias', false); // использ. временный алиас
    WriteBool('Alias', 'UseTempAlias', true); // использовать постоянный алиас
    WriteString('Alias', 'DefAlias', 'Рабочий');
  end;
end;

procedure TSetForm.RadioButton4Click(Sender: TObject);
begin
  diredit2.Enabled:= false;
  combobox5.Enabled:= true;
  with ini do
  begin
    writebool('Alias', 'UseTempAlias', false);
    writebool('Alias', 'UseConstAlias', true);
  end;
end;

procedure TSetForm.DirEdit2ButtonClick(Sender: TObject);
begin
  ini.WriteString('Alias', 'TempAliasDir', diredit2.Text);
end;

procedure TSetForm.DirEdit1Change(Sender: TObject);
begin
// папка для резервного копирования
  ini.WriteString('Save', 'dirname', diredit1.Text);
end;

procedure TSetForm.CheckBox13Click(Sender: TObject);
begin
// позволить ли блокирование программы по Ctrl+Alt+B
  with ini do
  begin
    if checkbox13.Checked then
      WriteBool('Common', 'AllowLock', true)
    else
      WriteBool('Common', 'AllowLock', false);
  end;
end;

procedure TSetForm.ComboBox5Change(Sender: TObject);
begin
// алиас по умолчанию
  ini.WriteString('Alias', 'DefAlias', combobox5.Text);
end;

end.

// hints
