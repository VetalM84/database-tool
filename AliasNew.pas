unit AliasNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sEdit, StdCtrls, Mask, sCustomComboEdit, sTooledit, dbtables,
  LbSpeedButton, lbbuttons, ExtCtrls;

type
  TNewAliasForm = class(TForm)
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    Panel1: TPanel;
    DirEdit1: TsDirectoryEdit;
    Edit1: TsEdit;
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewAliasForm: TNewAliasForm;
  AParams: TStringList;
  Dir: string;
  otv:word;

implementation

uses main, Alias;

{$R *.dfm}

procedure TNewAliasForm.LbSpeedButton1Click(Sender: TObject);
begin
  try
    Dir := diredit1.Text; //Путь к базе
    AParams := TStringList.Create;
    if not Session.IsAlias(edit1.Text) then //Проверка существования псевдонима
    begin
      Session.AddStandardAlias(edit1.Text, Dir, 'PARADOX');
      Session.SaveConfigFile;
      otv:=MessageBox(handle, 'Псевдоним успешно создан', 'Информация', 64);
      if otv=IDOK then
      begin
        // получаем список всех алиасов
        aliasform.ListBox1.Clear;
        Session.GetAliasNames(aliasform.ListBox1.Items);
        close;
      end;
    end
    else
    // если алиас существует, то модифицируем его
    otv:= MessageBox(handle, pchar('Псевдоним ' + edit1.text + ' уже существует. Изменить его?'), 'Вопрос', 36);
    if otv=IDYES then
    begin
      try
        begin
          AParams.Clear;
          AParams.Add('PATH=' + Dir);
          Session.ModifyAlias(edit1.Text, AParams);
          Session.SaveConfigFile;
        end;
      finally
        AParams.Free;
      end;
    end;
    if otv=IDNO then ;
  except
    MessageBox(handle, 'Неизвестные псевдоним или путь к рабочему каталогу', 'Ошибка', 16);
  end;
end;

procedure TNewAliasForm.LbSpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TNewAliasForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  release;
  NewAliasForm:= nil;
end;

procedure TNewAliasForm.FormCreate(Sender: TObject);
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
end;

end.
