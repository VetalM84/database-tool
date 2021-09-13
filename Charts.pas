unit Charts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, ComCtrls, Series,
  Menus, LbSpeedButton, StdCtrls, sCustomComboBox, Buttons, db, dbtables;

type
  TChartForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    LbSpeedButton1: TLbSpeedButton;
    DBChart1: TDBChart;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartForm: TChartForm;
  F: TFieldDef;
  MS: TChartSeries;

implementation

uses Main, ChartStyle, Unit1;

{$R *.dfm}

procedure TChartForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DBChart1.SeriesCount > 0 then
    DBChart1.Series[0].Free;
  if ms <> nil then
    ms.Free;
  release;
  chartform:= nil;
end;

procedure TChartForm.FormPaint(Sender: TObject);
begin
  lbspeedbutton1.Refresh;
end;

procedure TChartForm.LbSpeedButton1Click(Sender: TObject);
begin
{  if chartstyleform = nil then
  begin }
    chartstyleform:= tchartstyleform.Create(chartform);
    chartstyleform.ShowModal;
//  end;
end;

procedure TChartForm.FormCreate(Sender: TObject);
{var
  i: integer;}
begin
{  combobox1.Clear;
  with mainform.Query do
    for i := 0 to FieldDefs.Count - 1 do
    begin
      F := FieldDefs.Items[i];
      if (f.DataType = ftinteger) or (f.DataType = ftword) or (f.DataType = ftfloat)
        or (f.DataType = ftsmallint) or (f.DataType = ftcurrency) then
        combobox1.Items.Add(f.Name)
      else
        combobox2.Items.Add(f.Name);
    end;}
end;

procedure TChartForm.Button1Click(Sender: TObject);
begin
  FullChartForm:= TFullChartForm.Create(chartform);
  chartform.DBChart1.Parent:= FullChartForm;
  FullChartForm.Show;
end;

end.
