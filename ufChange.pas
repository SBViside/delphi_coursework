unit ufChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ufMain, Vcl.Buttons, IniFiles;

type
  TfChange = class(TForm)
    lNameFix: TLabel;
    Label3: TLabel;
    cbStatusChanged: TComboBox;
    cbRateChanged: TComboBox;
    Label4: TLabel;
    mCommentsChanged: TMemo;
    Label5: TLabel;
    bAddGame: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure bAddGameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChange: TfChange;
  st: string[30];

implementation

{$R *.dfm}

procedure TfChange.bAddGameClick(Sender: TObject);
begin
  fMain.ini.WriteString(st, 'Status', cbStatusChanged.Text);
  fMain.ini.WriteString(st, 'Rate', cbRateChanged.Text);
  fMain.ini.WriteString(st, 'Comments', mCommentsChanged.Text);

  fMain.lName.Caption := cbStatusChanged.Text;
  fMain.lStatus.Caption := cbStatusChanged.Text;
  fMain.lRate.Caption := cbRateChanged.Text;
  fMain.mComments.Text := mCommentsChanged.Text;
end;

procedure TfChange.FormActivate(Sender: TObject);
begin
  cbStatusChanged.Text := fMain.lName.Caption;
  cbRateChanged.Text := fMain.lStatus.Caption;
  mCommentsChanged.Text := fMain.lRate.Caption;
end;

end.
