unit AliasEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, Mask, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, sCustomListBox, bde, dbtables, lbbuttons;

type
  TEditAliasForm = class(TForm)
    ListBox1: TsListBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TsEdit;
    DirEdit1: TsDirectoryEdit;
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditAliasForm: TEditAliasForm;
  now: byte;
  otv: word;
  AParams: TStringList;
  Dir: string;

implementation

uses main, Alias;

function GetPhNameByAlias(sAlias: string): string;
var
  Database: TDatabase;
  pszDir: PChar;
begin
  Database := TDatabase.Create(nil); //allocate memory
  pszDir := StrAlloc(255);
  try
    Database.AliasName := sAlias;
    Database.DatabaseName := 'TEMPDatabase'; //requires a name -- is ignored
    Database.Connected := True; //connect without opening any table
    DbiGetDirectory(Database.Handle, True, pszDir); //get the dir.
    Database.Connected := False; //disconnect
    Result := StrPas(pszDir); //convert to a string
  finally
    Database.Free; //free memory
  end;
end;

{$R *.dfm}

procedure TEditAliasForm.FormCreate(Sender: TObject);
begin
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
  end;
// заполяем listbox1 всеми существующими алиасами
  listbox1.Clear;
  Session.GetAliasNames(listBox1.Items);
end;

procedure TEditAliasForm.ListBox1Click(Sender: TObject);
begin
// label1 будет отображать физический путь алиаса (путь к папке)
  now:= listbox1.ItemIndex;
  label2.Caption:= GetPhNameByAlias(listbox1.Items.Strings[now]);
  edit1.Text:= listbox1.Items.Strings[now];
end;

procedure TEditAliasForm.LbSpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TEditAliasForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aliasform.ListBox1.Clear;
  Session.GetAliasNames(aliasform.ListBox1.Items);
  release;
  editAliasForm:= nil;
end;

procedure TEditAliasForm.LbSpeedButton1Click(Sender: TObject);
begin
  AParams := TStringList.Create;
  try
    // get the current PATH parameter
    Session.GetAliasParams(edit1.Text, AParams);
    Dir := diredit1.Text;
    // Update the alias parameters
    AParams.Clear;
    AParams.Add('PATH=' + Dir);
    Session.ModifyAlias(edit1.Text, AParams);
    Session.SaveConfigFile;
  finally
    AParams.Free;
  end;
  otv:=MessageBox(handle, 'Псевдоним успешно изменен', 'Информация', 64);
  if otv=IDOK then close;
end;

end.
