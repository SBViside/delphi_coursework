unit ufRofl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  TfRofl = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    le1: TLabeledEdit;
    le2: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRofl: TfRofl;

implementation

{$R *.dfm}

uses ufMAin;

procedure TfRofl.BitBtn1Click(Sender: TObject);
begin
  if le2.Text = '1234' then
    begin
      fMain.Show;
      fRofl.Hide;
    end
  else
  begin
    Label1.Show;
    le2.Clear;
  end;
end;

procedure TfRofl.FormActivate(Sender: TObject);
begin
  le1.SetFocus;
end;

end.