program Project1;

uses
  Forms,
  inifiles,
  Main in 'Main.pas' {MainForm},
  Wizard in 'Wizard.pas' {WizForm},
  InsertData in 'InsertData.pas' {InsForm},
  FieldType in 'FieldType.pas' {TypeForm},
  AddIndex in 'AddIndex.pas' {IdxForm},
  Settings in 'Settings.pas' {SetForm},
  Frame in 'Frame.pas' {Frame7: TFrame},
  TaskUnit in 'TaskUnit.pas' {TaskForm},
  DirMonitor in 'DirMonitor.pas' {MonForm},
  Alias in 'Alias.pas' {AliasForm},
  AliasNew in 'AliasNew.pas' {NewAliasForm},
  AliasEdit in 'AliasEdit.pas' {EditAliasForm},
  Logon in 'Logon.pas' {LogonForm},
  UserList in 'UserList.pas' {UserForm},
  UserNew in 'UserNew.pas' {NewUserForm},
  OpenTable in 'OpenTable.pas' {OpenTableForm},
  Filter in 'Filter.pas' {FilterForm},
  TableControl in 'TableControl.pas' {ControlForm},
  FEdit in 'FEdit.pas' {FEditForm},
  Charts in 'Charts.pas' {ChartForm},
  ChooseField in 'ChooseField.pas' {FieldForm},
  ChartStyle in 'ChartStyle.pas' {ChartStyleForm},
  Unit1 in 'Unit1.pas' {FullChartForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  if ini.ReadBool('Pasw', 'start', false) = true then
  begin
    logonform:= tlogonform.Create(application);
    logonform.showmodal;
  end;
  Application.Run;
end.
