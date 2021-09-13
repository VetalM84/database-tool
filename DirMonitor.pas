unit DirMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, DirInspector, StdCtrls, ExtCtrls, lbbuttons, Mask,
  sCustomComboEdit, sTooledit, inifiles;

type
  TMonForm = class(TForm)
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    LbSpeedButton3: TLbSpeedButton;
    DirEdit1: TsDirectoryEdit;
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MonForm: TMonForm;

implementation

uses main;

{$R *.dfm}

procedure TMonForm.LbSpeedButton3Click(Sender: TObject);
begin
  close;
end;

procedure TMonForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  monform:= nil;
end;

procedure TMonForm.FormCreate(Sender: TObject);
begin
  // синхронизация эл-тов
  with ini do
  begin
    diredit1.Text:= readstring('DirMonitor', 'Dir', '');
    lbspeedbutton1.Down:= readbool('DirMonitor', 'Active', false);
  end;
  // устанавливаем стиль кнопок
  if ini.ReadString('Common', 'Style', 'XPNonFlat') = 'XPNonFlat' then
  begin
    with lbspeedbutton1 do
    begin
      colorstyle:= lcsflatxp;
      style:= lbspeedbutton.bsXP;
      parentcolor:= true;
    end;
    with lbspeedbutton2 do
    begin
      colorstyle:= lcsflatxp;
      style:= lbspeedbutton.bsXP;
      parentcolor:= true;
    end;
    with lbspeedbutton3 do
    begin
      colorstyle:= lcsxpnonflat;
      style:= lbspeedbutton.bsXP;
    end;
  end;
  if ini.ReadString('Common', 'Style', 'XPNonFlat') = 'XPNonFlat1' then
  begin
    with lbspeedbutton1 do
    begin
      colorstyle:= lcsflatxp1;
      style:= lbspeedbutton.bsXP;
      parentcolor:= true;
    end;
    with lbspeedbutton2 do
    begin
      colorstyle:= lcsflatxp1;
      style:= lbspeedbutton.bsXP;
      parentcolor:= true;
    end;
    with lbspeedbutton3 do
    begin
      colorstyle:= lcsXPnonflat1;
      style:= lbspeedbutton.bsXP;
    end;
  end;
end;

procedure TMonForm.LbSpeedButton1Click(Sender: TObject);
begin
// включаем DirInspectora
  if (diredit1.Text <> '') then
  begin
    with ini do
    begin
      Writebool('DirMonitor', 'Active', true);
      WriteString('DirMonitor', 'Dir', diredit1.Text);
    end;
    with mainform.DirInsp1 do
    begin
      dirtowatch:= diredit1.Text;
      active:= true;
    end;
    if mainform.dirinsp1.Active then mainform.StatusBar1.Panels[0].Text:= 'Наблюдение активно';
  end
  else
  begin
    messagebox(handle, 'Укажите имя каталога', 'Ошибка', 16);
    lbspeedbutton2.Down:= true;
  end;
end;

procedure TMonForm.LbSpeedButton2Click(Sender: TObject);
begin
  mainform.dirinsp1.Active:= false;
  if not mainform.dirinsp1.Active then
    mainform.StatusBar1.Panels[0].Text:= 'Наблюдение не активно';
  mainform.StatusBar1.Panels[1].Text:= '';
end;

end.
