unit InsertData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TInsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsForm: TInsForm;

implementation

uses main;

{$R *.dfm}

procedure TInsForm.Button1Click(Sender: TObject);
begin
  with mainform.query do
  begin
    Edit;
    FindField(mainform.DBGrid1.SelectedField.DisplayLabel).AsDateTime:= date;
    UpdateRecord;
  end;
end;

procedure TInsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mainform.Action7.Enabled:= true;
  insform:= nil;
  Release;
end;

procedure TInsForm.Button2Click(Sender: TObject);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    mainform.Query.Edit;
    B.LoadFromFile('100.bmp');
    //   mainform.DBImage1.Picture.Assign(B);
    mainform.Query.Post;
  finally
    B.Free;
  end;
  Label1.caption:= syserrormessage(getlasterror);
end;

procedure TInsForm.Button3Click(Sender: TObject);
begin
  with mainform.query do
  begin
    Edit;
    FindField(mainform.DBGrid1.SelectedField.DisplayLabel).AsString:= 'Hello';
  end;
end;

end.
