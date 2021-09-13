unit ChartStyle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbSpeedButton, series, teEngine;

type
  TChartStyleForm = class(TForm)
    LbSpeedButton1: TLbSpeedButton;
    LbSpeedButton2: TLbSpeedButton;
    LbSpeedButton3: TLbSpeedButton;
    LbSpeedButton4: TLbSpeedButton;
    LbSpeedButton5: TLbSpeedButton;
    LbSpeedButton6: TLbSpeedButton;
    LbSpeedButton7: TLbSpeedButton;
    LbSpeedButton8: TLbSpeedButton;
    LbSpeedButton9: TLbSpeedButton;
    procedure LbSpeedButton8Click(Sender: TObject);
    procedure LbSpeedButton1Click(Sender: TObject);
    procedure LbSpeedButton9Click(Sender: TObject);
    procedure LbSpeedButton2Click(Sender: TObject);
    procedure LbSpeedButton3Click(Sender: TObject);
    procedure LbSpeedButton7Click(Sender: TObject);
    procedure LbSpeedButton4Click(Sender: TObject);
    procedure LbSpeedButton5Click(Sender: TObject);
    procedure LbSpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartStyleForm: TChartStyleForm;
  s: byte;

implementation

uses Charts, Main;

{$R *.dfm}

procedure TChartStyleForm.LbSpeedButton8Click(Sender: TObject);
begin
{  release;
  chartstyleform:= nil;}
  close;
end;

procedure TChartStyleForm.LbSpeedButton9Click(Sender: TObject);
begin
  if chartform.DBChart1.SeriesCount > 0 then
      chartform.DBChart1.Series[0].Free;
  try
    case s of
      1:
      begin
        MS:= TLineSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
      2:
      begin
        MS:= TBarSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
      3:
      begin
        MS:= THorizBarSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
      4:
      begin
        MS:= TAreaSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
      5:
      begin
        MS:= TPointSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
      6:
      begin
        MS:= TPieSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
      7:
      begin
        MS:= TFastLineSeries.Create(chartform);
        MS.ParentChart:= chartform.dbChart1;
      end;
    end;
{    with ms do
    begin
      if chartform.RadioButton1.Checked then
        DataSource:= mainform.Query
      else
        DataSource:= mainform.Query1;}

{      yValues.ValueSource:= chartform.ComboBox1.Text;
  //    marks.Style:= smsLabel;
      XLabelsSource:= chartform.ComboBox2.Text;
      ColorEachPoint:= true;
    end;                    }
    messagebox(handle, 'График успешно создан', 'Информация', 64);
    close;
  except
    messagebox(handle, 'Неверные имя таблицы или полей', 'Ошибка', 16);
  end;
end;

procedure TChartStyleForm.LbSpeedButton1Click(Sender: TObject);
begin
  s:= 1;
end;

procedure TChartStyleForm.LbSpeedButton2Click(Sender: TObject);
begin
  s:= 2;
end;

procedure TChartStyleForm.LbSpeedButton3Click(Sender: TObject);
begin
  s:= 3;
end;

procedure TChartStyleForm.LbSpeedButton7Click(Sender: TObject);
begin
  s:= 4;
end;

procedure TChartStyleForm.LbSpeedButton4Click(Sender: TObject);
begin
  s:= 5;
end;

procedure TChartStyleForm.LbSpeedButton5Click(Sender: TObject);
begin
  s:= 6;
end;

procedure TChartStyleForm.LbSpeedButton6Click(Sender: TObject);
begin
  s:= 7;
end;

procedure TChartStyleForm.FormCreate(Sender: TObject);
begin
  s:= 2;
end;

end.

