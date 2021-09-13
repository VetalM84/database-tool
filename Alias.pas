unit Alias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LbSpeedButton, dbtables, bde, sCustomListBox, Mask,
  sCustomComboEdit, sTooledit, sEdit, lbbuttons;

type
  TAliasForm = class(TForm)
    GroupBox1: TGroupBox;
    LbSpeedButton1: TLbSpeedButton;
    Label1: TLabel;
    ListBox1: TsListBox;
    GroupBox2: TGroupBox;
    DirEdit1: TsDirectoryEdit;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    LbSpeedButton2: TLbSpeedButton;
    LbSpeedButton3: TLbSpeedButton;
    Edit1: TsEdit;
    LbSpeedButton4: TLbSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure DirEdit1Change(Sender: TObject);
    procedure LbSpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AliasForm: TAliasForm;
  now: byte;
  otv: word;

implementation

uses main, AliasEdit, AliasNew;

// Узнать физическое расположение локальной БД по Alias
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

{$R *.dfm}

procedure TAliasForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  aliasform:= nil;
end;

procedure TAliasForm.ListBox1Click(Sender: TObject);
begin
// label1 будет отображать физический путь алиаса (путь к папке)
  now:= listbox1.ItemIndex;
  label1.Caption:= GetPhNameByAlias(listbox1.Items.Strings[now]);
end;

procedure TAliasForm.FormCreate(Sender: TObject);
begin
// получаем список всех алиасов
  listbox1.Clear;
  Session.GetAliasNames(listBox1.Items);

  with ini do
  begin
    radiobutton1.Checked:= readbool('Alias', 'UseTempAlias', true);
    radiobutton2.Checked:= readbool('Alias', 'UseConstAlias', false);
    diredit1.Text:= readString('Alias', 'TempAliasDir', extractfilepath(paramstr(0))+'\Data');
  end;

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
      colorstyle:= lcsXPnonflat;
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

procedure TAliasForm.RadioButton1Click(Sender: TObject);
begin
  radiobutton2.Checked:= false;
  with ini do
  begin
    writebool('Alias', 'UseConstAlias', false); // использ. временный алиас
    WriteBool('Alias', 'UseTempAlias', true); // использовать постоянный алиас
  end;
end;

procedure TAliasForm.RadioButton2Click(Sender: TObject);
begin
  radiobutton1.Checked:= false;
  with ini do
  begin
    writebool('Alias', 'UseTempAlias', false);
    writebool('Alias', 'UseConstAlias', true);
  end;
end;

procedure TAliasForm.LbSpeedButton1Click(Sender: TObject);
begin
  if NewAliasForm = nil then
  begin
    NewAliasForm:= TNewAliasForm.Create(aliasform);
    NewAliasForm.ShowModal;
  end
  else show;
end;

procedure TAliasForm.LbSpeedButton2Click(Sender: TObject);
begin
  if editAliasForm = nil then
  begin
    editAliasForm:= TeditAliasForm.Create(aliasform);
    editAliasForm.ShowModal;
  end
  else show;
end;

procedure TAliasForm.LbSpeedButton3Click(Sender: TObject);
begin
// удаление псевдонима
  otv:=MessageBox(handle, pchar('Удалить псевдоним ' + listbox1.Items.Strings[now] + '?'),'Удаление псевдонима', 36);
  if otv=IDYES then
  begin
    with session do
    begin
      DeleteAlias(listbox1.Items.Strings[now]);
      SaveConfigFile;
    end;
  listbox1.Clear;
  Session.GetAliasNames(listBox1.Items);
  if otv=IDNO then ;
  end;
end;

procedure TAliasForm.DirEdit1Change(Sender: TObject);
begin
  ini.WriteString('Alias', 'TempAliasDir', diredit1.Text);
end;

procedure TAliasForm.LbSpeedButton4Click(Sender: TObject);
begin
  listbox1.Clear;
  Session.GetAliasNames(listBox1.Items);
end;

end.


