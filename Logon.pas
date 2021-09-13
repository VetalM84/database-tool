unit Logon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, StdCtrls, sEdit, ExtCtrls, sCustomComboBox;

  type
  TLogonForm = class(TForm)
    Panel1: TPanel;
    Edit1: TsEdit;
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    ComboBox1: TsComboBox;
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogonForm: TLogonForm;


implementation

uses main, UserList;

{$R *.dfm}


procedure TLogonForm.LbSpeedButton2Click(Sender: TObject);
begin
  if state = 0 then halt
  else close;
end;

procedure TLogonForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  logonform:= nil;
end;

procedure TLogonForm.LbSpeedButton1Click(Sender: TObject);
begin
// 1 - заблокировать
  if state = 1 then
  begin
    if edit1.Text = readusers[combobox1.ItemIndex].password then
      close
    else
    begin
      messagebox(handle, 'Неправильный пароль', 'Ошибка', 16);
      edit1.Clear;
    end;
  end;
//  if state = 1 then ;

end;

procedure TLogonForm.FormCreate(Sender: TObject);
begin
{ state:
    0 - старт приложения;
}// заполняем combobox1 списком пользователей
  if state = 0 then
  begin
    combobox1.Clear;
    AssignFile(F,'user.dat');
    Reset(F);
    try
      i:= 0;
      while not Eof(F) do
      begin
        read(F, ReadUsers[i]);
        combobox1.Items.Add(readusers[i].name);
        i:=i+1;
      end;
    finally
      CloseFile(F);
    end;
  combobox1.ItemIndex:= 0;
  end;
end;

end.
