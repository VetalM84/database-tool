unit Wizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, CheckLst, db, dbtables, sEdit,
  LbSpeedButton, jpeg, sCustomComboBox, bde;

type
  TWizForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    ChBox: TCheckListBox;
    Label5: TLabel;
    Label6: TLabel;
    Bar1: TProgressBar;
    Label7: TLabel;
    Open: TOpenDialog;
    Save: TSaveDialog;
    Edit1: TsEdit;
    Button3: TLbSpeedButton;
    Button2: TLbSpeedButton;
    Edit2: TsEdit;
    Button4: TLbSpeedButton;
    Button5: TLbSpeedButton;
    Button1: TLbSpeedButton;
    Button6: TLbSpeedButton;
    Button8: TLbSpeedButton;
    Button7: TLbSpeedButton;
    ComboBox1: TsComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabSheet2Show(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChBoxClick(Sender: TObject);
    procedure Button5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ChBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Edit2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ChBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WizForm: TWizForm;
  tname, openf, savef, state: string;
  n,i,c,p,chbeg,chend,ren, now: integer;
  otv:word;
  a : array[0..255] of char; // строки из файла ресурсов hint.res

implementation

uses main, FieldType;


{$R *.dfm}  {$R hint.res}

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

procedure TWizForm.Button2Click(Sender: TObject);
begin
  if combobox1.Text = '' then
  begin
    messagebox(handle, 'Выберите псевдоним из выпадающего списка', 'Внимание', 48);
    combobox1.SetFocus;
  end
  else
  begin
    tname:= edit1.Text;
    pagecontrol1.ActivePage:= tabsheet2;
  end;
end;

procedure TWizForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  otv:=MessageBox(handle,PChar('Вы действительно хотите завершить'+#13+
                              '      процесс создания таблицы?  '),
  PChar('Завершение работы мастера'), 292);
  if otv=IDYES then
  begin
    wizform.Release;
    wizform:= nil;
  end;
  if otv=IDNO then
    canclose:= false;
end;

procedure TWizForm.TabSheet2Show(Sender: TObject);
begin
  button2.Hide;
  state:= 'digit';
  edit2.SetFocus;
end;

procedure TWizForm.Button4Click(Sender: TObject);
begin
// создаем checkbox'ы
  try
    now:= strtoint(edit2.Text);
    try
      chbox.Clear;
      c:= 1;
      p:= (strtoint(edit2.Text)) + 2;
      with bar1 do
      begin
        Visible:= true;
        max:= p;
      end;
      label7.Caption:= 'Идет создание временных полей...';
      repeat
        application.ProcessMessages;
        chbox.Items.Add('Поле ' + inttostr(c));
        c:= c + 1;
        bar1.Position:= c;
      until
        c = p;
      chbox.ItemEnabled[chbox.count-1]:= false;
// устанавливаем метки
      chend:= (strtoint(edit2.Text)-1);
      chbeg:= -1;
      with bar1 do
      begin
        Position:= 0;
        max:= chend;
      end;
      repeat
        application.ProcessMessages;
        chbox.State[chbeg+1]:= cbchecked;
        chbeg:= chbeg+1;
        bar1.Position:= chbeg;
      until
        chbeg = chend;
    except
      messagebox(handle, 'Неизвестная ошибка', 'Ошибка', 16);
    end;
  except
    messagebox(handle, 'Поле для ввода должно содержать цифры', 'Ошибка', 16);
    edit2.Clear;
  end;
  with edit2 do
  begin
    clear;
    SetFocus;
  end;
  LoadString(hInstance, 3, @a, sizeof(a));
  label3.Caption:= strpas(a);// При снятии флажка, число созданных полей будет равно порядковому номеру предыдущего значка.
  label7.Caption:= 'Создание временных полей завершено.';
  state:= 'string';
  button5.Enabled:= true;
  button6.Enabled:= true;
end;

procedure TWizForm.FormCreate(Sender: TObject);
begin
  chbox.MultiSelect:= true;
  i:= -1;
  n:=  0;
  combobox1.Clear;
  Session.GetAliasNames(comboBox1.Items);
end;

procedure TWizForm.Button5Click(Sender: TObject);
begin
// переименовываем checkbox'ы
  if edit2.Text <> '' then
    try
      ren:= chbox.ItemIndex;
      chbox.Items.Strings[ren]:= edit2.text;
      edit2.Clear;
      edit2.SetFocus;
    except
      messagebox(handle, 'Неизвестная ошибка', 'Ошибка', 16);
    end
  else
  begin
    messagebox(handle, 'Имя поля не может быть пустым', 'Ошибка', 16);
    edit2.SetFocus;
  end;
  LoadString(hInstance, 6, @a, sizeof(a));
  label3.Caption:= strpas(a);//Когда закончите переименование наведите курсор мышки на кнопку УДАЛИТЬ
{try
if chbox.Checked[n] = true then begin
i:= i + 1;
chbox.Items.Strings[i]:= edit2.text;
n:= n + 1;
with edit2 do begin
Clear;
SetFocus;
end;
end;
except
showmessage('Неизвестная ошибка.');
end;}
end;

procedure TWizForm.Button6Click(Sender: TObject);
  label 1, 2;
begin
  if chbox.Items.Count = 0 then
    messagebox(handle, 'Временные поля должны быть созданы', 'Ошибка', 16)
  else
  begin
    i:= -1;
    n:= 0;
    with bar1 do
    begin
      position:= 0;
      max:= p;
    end;
    label7.Caption:= 'Идет создание таблицы...';
  // создаем таблицу
    try
      with TTable.Create(nil) do
      begin
        try
          Active := False;
          DatabaseName := combobox1.Text;
          TableName := tname;
          TableType := ttparadox;
          FieldDefs.Clear;
          label7.Caption:= 'Идет создание полей...';
  1:      with FieldDefs.AddFieldDef do
          begin
            i:= i + 1;
            typeform:= ttypeform.Create(wizform);
            typeform.ShowModal;
            name:= typeform.Edit2.Text;
            DataType := ftype;
            if fsize = false then goto 2;
            Size := s;
  2:        Required := req;
            n:= n + 1;
            bar1.Position:= i;
          end;
          if chbox.Checked[n] = true then goto 1;
          with IndexDefs do
          begin
            with AddIndexDef do
            begin
              Name := '';
              Fields := chbox.Items.Strings[0];
              Options := [ixPrimary, ixUnique];
            end;
          end;
            CreateTable;
        finally
          free;
        end;
      end;
      Caption:= 'Завершение работы мастера';
      i:= -1;
      n:= 0;
      label5.Caption:= 'Таблица ' + tname + ' успешно создана.';
      pagecontrol1.ActivePage:= tabsheet3;
    except
      i:= -1;
      n:= 0;
      Caption:= 'Завершение работы мастера';
      label10.Visible:= true;
      label5.Caption:= 'Таблица ' + tname + ' не была создана.';
      pagecontrol1.ActivePage:= tabsheet3;
    end;
  end;
end;

procedure TWizForm.Button3Click(Sender: TObject);
begin
  if pagecontrol1.ActivePage = tabsheet3 then
  begin
    release;
    wizform:= nil;
  end
  else close;
end;

procedure TWizForm.TabSheet3Show(Sender: TObject);
begin
// выход из программы
  button3.caption:= 'Готово';
  label7.Hide;
  bar1.Visible:= false;
end;

procedure TWizForm.Button1Click(Sender: TObject);
begin
// удаляем checkbox'ы
  chbox.DeleteSelected;
  p:= p - 1;
end;

procedure TWizForm.ChBoxClick(Sender: TObject);
begin
  ren:= chbox.ItemIndex;
  edit2.Text:= chbox.Items.Strings[ren];
  edit2.SelectAll;
  if chbox.ItemIndex = chbox.Items.Count - 1 then
    button1.Enabled:= false
  else
    button1.Enabled:= true;
end;

procedure TWizForm.Edit2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
// загрузка строк подсказок из файла ресурсов hint.res
  LoadString(hInstance, 1, @a, sizeof(a));
  edit2.Hint:= strpas(a);//Теперь, введите требуемое количество столбцов таблицы. Например 7. После чего нажмите кнопку СОЗДАТЬ СТОЛБЦЫ.
  label3.Caption:= button4.Hint;
end;

procedure TWizForm.Button5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LoadString(hInstance, 2, @a, sizeof(a));
  button5.Hint:= strpas(a);//Для переименования столбца, выделите нужный элемент из списка, введите название в поле ввода и нажмите кнопку ПЕРЕИМЕНОВАТЬ.
  label3.Caption:= button5.Hint;
end;

procedure TWizForm.Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LoadString(hInstance, 1, @a, sizeof(a));
  button4.hint:= strpas(a);//Теперь, введите требуемое количество столбцов таблицы. Например 7. После чего нажмите кнопку СОЗДАТЬ СТОЛБЦЫ.
  label3.Caption:= button4.Hint;
end;

procedure TWizForm.ChBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LoadString(hInstance, 3, @a, sizeof(a));
  chbox.hint:= strpas(a);//При снятии флажка, число созданных полей будет равно порядковому номеру предыдущего значка.
  label3.Caption:= chbox.Hint;
end;

procedure TWizForm.Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LoadString(hInstance, 4, @a, sizeof(a));
  button1.Hint:= strpas(a);//Для удаления столбца, выделите нужный элемент из списка и нажмите кнопку УДАЛИТЬ СТОЛБЕЦ. Когда закончите, нажмите кнопку СОЗДАТЬ ТАБЛИЦУ.
  label3.Caption:= button1.Hint;
end;

procedure TWizForm.Button6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  LoadString(hInstance, 5, @a, sizeof(a));
  button6.hint:= strpas(a);//Нажмите на кнопку СОЗДАТЬ ТАБЛИЦУ для создания файла таблицы.
  label3.Caption:= button6.Hint;
end;

procedure TWizForm.Button8Click(Sender: TObject);
begin
// сохраняем шаблон
  save.Execute;
  if save.FileName = '' then
  else
    ChBox.Items.SaveToFile(save.FileName+'.tdb');
end;

procedure TWizForm.Button7Click(Sender: TObject);
begin
// загружаем шаблон
  open.Execute;
  if open.FileName = '' then
  else
  begin
    chbox.Clear;
    chbox.Items.LoadFromFile(open.FileName);
    p:= chbox.Items.Count;
    chbox.ItemEnabled[chbox.Count-1]:= false;
  end;
// ставим МЕТКИ
  try
    chend:= chbox.Count - 1;
    chbeg:= -1;
    repeat
      application.ProcessMessages;
      chbox.State[chbeg + 1]:= cbchecked;
      chbeg:= chbeg + 1;
    until
      chbeg = chend - 1;
  except
    messagebox(handle, 'Неизвестная ошибка', 'Ошибка', 16);
  end;
end;

procedure TWizForm.TabSheet1Show(Sender: TObject);
begin
  edit1.SetFocus;
end;


procedure TWizForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if state = 'digit' then
  begin
    case key of
      '0'..'9': ;
      #8: ;
    else
      key := #0;
    end;
  end
  else ;
end;

procedure TWizForm.Edit1Change(Sender: TObject);
begin
  button2.Enabled:= true;
end;

procedure TWizForm.ComboBox1Change(Sender: TObject);
begin
  now:= combobox1.ItemIndex;
  label9.Caption:= 'Путь: ' + GetPhNameByAlias(combobox1.Items.Strings[now]);
end;

procedure TWizForm.ChBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((GetKeyState(VK_DELETE) AND 128) = 128) then
  begin
  // удаляем checkbox'ы
    chbox.DeleteSelected;
    p:= p - 1;
  end;  
end;

end.

