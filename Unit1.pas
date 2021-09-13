unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sCustomComboBox;

type
  TFullChartForm = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TsComboBox;
    ComboBox2: TsComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullChartForm: TFullChartForm;

implementation

uses Charts;

{$R *.dfm}

procedure TFullChartForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  chartform.dbchart1.Parent:= chartform.TabSheet1;
  release;
  FullChartForm:= nil;
end;

end.
