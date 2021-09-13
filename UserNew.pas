unit UserNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, LbSpeedButton, ExtCtrls;

type
  TNewUserForm = class(TForm)
    Panel1: TPanel;
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    Edit1: TsEdit;
    Edit2: TsEdit;
    Edit3: TsEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewUserForm: TNewUserForm;

implementation

uses UserList;

{$R *.dfm}

procedure TNewUserForm.LbSpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TNewUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  newuserform:= nil;  
end;

end.
