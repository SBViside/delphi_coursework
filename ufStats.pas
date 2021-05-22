unit ufStats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, IniFiles;

type
  TStats = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lsCount: TLabel;
    lsAvgRate: TLabel;
    lsCountRate: TLabel;
    lsName: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stats: TStats;

implementation

{$R *.dfm}

uses ufMAin;

procedure TStats.FormShow(Sender: TObject);
var i: integer; avg: extended;
begin
  lsName.Caption := fMain.StatusBar1.Panels[0].Text;
  lsCount.Caption := IntToStr(fMain.lbMAin.Items.Count);

  if (fMain.lbMAin.Items.Count > 0) then
    begin

      avg := 0;
      for i := 0 to fMain.lbMAin.Items.Count - 1 do
        avg := avg + fMain.Ini.ReadInteger(fMain.lbMAin.Items[i], 'Rate', 10);
      avg := avg / fMain.lbMAin.Items.Count;

      lsAvgRate.Caption := FloatToStr(avg);
    end;
end;

end.
