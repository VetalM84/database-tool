unit UserList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, ComCtrls, ExtCtrls;

  ///////////////////////////////////////
// собственный тип файлов
type
  TUser = record
    name  : string[30];  // имя юзера
    access: string[15];  // права доступа
    password: string[15];// пароль
end;
////////////////////////////////////

type
  TUserForm = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    LbSpeedButton3: TLbSpeedButton;
    LbSpeedButton4: TLbSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LbSpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure LbSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;
  i, recn: integer;
  F : file of TUser;
  Readusers: array[1..50] of TUser;
  newUser: tuser;
  ListItem: TListItem;


implementation

uses UserNew;

{$R *.dfm}

procedure AddNewUser(const Name, Access, password: string);
begin
// создать новую запись
  AssignFile(F,ExtractFilePath(Application.ExeName)+'user.dat');
  Reset(F);
  Seek(F, filesize(f)); // переход в конец файла
  Newuser.name := Name;
  newuser.access:= access;
  newuser.password:= password;
  write(F, newUser);
  CloseFile(F);
end;

procedure ChangeUser(const RecN : integer; const Name, Access, password: string);
begin
// изменить выделенную запись
  AssignFile(F,ExtractFilePath(Application.ExeName)+'user.dat');
  Reset(F);
  Seek(F, RecN);
  read(F, newuser);
  newuser.name := Name;
  newuser.access:= access;
  newuser.password:= password;
  {чтение перемещается на следующую запись, для этого необходимо
  вернуться на первоначальную запись, а затем записать}
  Seek(F, RecN);
  write(F, newUser);
  CloseFile(F);
end;


procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  userform:= nil;
end;

procedure TUserForm.LbSpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TUserForm.FormCreate(Sender: TObject);
// получить список всех юзеров
begin
  ListView1.Clear;
  AssignFile(F,'user.dat');
  Reset(F);
  try
    i:= 0;
    while not Eof(F) do
    begin
      read(F, ReadUsers[i]);
      with ListView1 do
      begin
        ListItem := Items.Add;
        ListItem.Caption := readusers[I].name;
        ListItem.SubItems.Add(readusers[I].access);
//        listitem.SubItems.Add(readusers[i].password);
      end;
      i:=i+1;
    end;
  finally
    CloseFile(F);
  end;
end;

procedure TUserForm.ListView1Click(Sender: TObject);
begin
  recn:= listview1.ItemIndex;
end;

procedure TUserForm.LbSpeedButton1Click(Sender: TObject);
begin
  if newuserform = nil then
  begin
    newuserform:= tnewuserform.create(self);
    newuserform.showmodal;
  end;
end;

end.
