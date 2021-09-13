unit ChooseField;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, sEdit, sSpinEdit, sCustomComboBox, FileCtrl,
  LbSpeedButton, ComCtrls, db, dbtables, bde, sEditorsManager,
  sCustomListBox, Buttons, ActnList;

type
  TFieldForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbSpeedButton2: TLbSpeedButton;
    Label5: TLabel;
    LbSpeedButton3: TLbSpeedButton;
    LbSpeedButton4: TLbSpeedButton;
    ComboBox1: TsComboBox;
    SpinEdit1: TsSpinEdit;
    TabSheet2: TTabSheet;
    Memo1: TsMemo;
    ListBox1: TsListBox;
    sEditorsManager1: TsEditorsManager;
    ListBox2: TsListBox;
    FileListBox1: TFileListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure LbSpeedButton4Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FieldForm: TFieldForm;
  t, ren: integer;
  F: TFieldDef;
  sl: tstringlist;
  shName,   // имя таблицы без расширения
  tname: string; // имя таблицы под курсором в filelistbox1

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

procedure LbMoveItemUp(AListBox: TsListBox);
var
  CurrIndex: Integer;
begin
  with AListBox do
    if ItemIndex > 0 then
    begin
      CurrIndex := ItemIndex;
      Items.Move(ItemIndex, (CurrIndex - 1));
      ItemIndex := CurrIndex - 1;
    end;
end;

procedure LbMoveItemDown(AListBox: TsListBox);
var
  CurrIndex, LastIndex: Integer;
begin
  with AListBox do
  begin
    CurrIndex := ItemIndex;
    LastIndex := Items.Count;
    if ItemIndex <> -1 then
    begin
      if CurrIndex + 1 < LastIndex then
      begin
        Items.Move(ItemIndex, (CurrIndex + 1));
        ItemIndex := CurrIndex + 1;
      end;
    end;
  end;
end;

procedure TFieldForm.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((GetKeyState(VK_DELETE) AND 128) = 128) then
    listbox1.DeleteSelected;
end;

procedure TFieldForm.SpinEdit1Change(Sender: TObject);
begin
  t:= spinedit1.Value;
end;

procedure TFieldForm.ComboBox1Change(Sender: TObject);
begin
  filelistbox1.Directory:= GetPhNameByAlias(combobox1.Text);
  filelistbox1.Update;
end;

procedure TFieldForm.FileListBox1Click(Sender: TObject);
var
  i: integer;
begin
  listbox1.Clear;
  listbox2.Clear;
  ren:= fileListbox1.ItemIndex;
  tname:= fileListbox1.Items.Strings[ren];
  with ttable.Create(nil) do
  begin
    mainform.Query.Close;
    databasename:= combobox1.Text;
    tablename:= tname;
    open;
    for i := 0 to FieldDefs.Count - 1 do
    begin
      F := FieldDefs.Items[i];
      listbox1.Items.Add(f.Name);
    end;
  free;
  end;
end;

procedure TFieldForm.LbSpeedButton4Click(Sender: TObject);
begin
  memo1.Clear;
  combobox1.Enabled:= true;
  spinedit1.Enabled:= true;
end;

procedure TFieldForm.LbSpeedButton3Click(Sender: TObject);
begin
  with mainform.Query do
  begin
    close;
    SQL.Clear;
    sql.Add(memo1.Text);
    open;
  end;
end;

procedure TFieldForm.LbSpeedButton2Click(Sender: TObject);
label addline, dontadd;
var
  i: integer;
begin
// выбор нескольких полей из различных таблиц
  if (memo1.Lines[0]) = 'SELECT ' then goto dontadd
  else goto addline;
addline:
    memo1.Lines.Add('SELECT ');
dontadd:
    spinedit1.Enabled:= false;
    if sl = nil then
    begin
      sl:= tstringlist.Create;
      sl.Add('FROM ');
    end;

    shname:= copy(tname, 1, length(tname) - length(extractfileext(tname)));
    with memo1.Lines do
    begin
      for i:= 0 to listbox2.Items.Count - 1 do
      begin
        if t > 1 then
          add(ShName + '."' + listbox2.Items.Strings[i] + '", ')
        else
          if i <> listbox2.Items.Count - 1 then
            add(ShName + '."' + listbox2.Items.Strings[i] + '", ')
          else
            add(ShName + '."' + listbox2.Items.Strings[i] + '" ');
      end;

      with sl do
        if t <= 1 then
        begin
          add('":' + combobox1.Text + ':' + tname + '" ' + shname);
          memo1.Lines.add(sl.Text);
          sl.Clear;
          spinedit1.Enabled:= true;
          t:= spinedit1.Value;
        end
        else
          add('":' + combobox1.Text + ':' + tname + '" ' + shname + ', ');
    end;
    dec(t);
    label6.Caption:= 'Осталось таблиц ' + inttostr(t);
end;

procedure TFieldForm.FormCreate(Sender: TObject);
begin
  combobox1.Clear;
  Session.GetAliasNames(comboBox1.Items);
  filelistbox1.clear;
end;

procedure TFieldForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sl.Free;
  release;
  fieldform:= nil;
end;

procedure TFieldForm.SpeedButton3Click(Sender: TObject);
begin
  LbMoveItemUp(listbox2);
end;

procedure TFieldForm.SpeedButton4Click(Sender: TObject);
begin
  LbMoveItemdown(listbox2);
end;

procedure TFieldForm.ListBox2Click(Sender: TObject);
begin
  if listbox2.ItemIndex >= 0 then
  begin
    speedbutton3.Enabled:= true;
    speedbutton4.Enabled:= true;
  end;
end;

procedure TFieldForm.RadioButton1Click(Sender: TObject);
begin
  filelistbox1.Mask:= '*.db';
end;

procedure TFieldForm.RadioButton2Click(Sender: TObject);
begin
  filelistbox1.Mask:= '*.dbf';
end;

end.
