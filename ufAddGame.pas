unit ufAddGame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, ufMain, IniFiles;

type
  TfAddGame = class(TForm)
    leName: TLabeledEdit;
    Label1: TLabel;
    cbStatus: TComboBox;
    Label2: TLabel;
    cbRate: TComboBox;
    Label3: TLabel;
    mComments2: TMemo;
    bAddGame: TBitBtn;
    bCancelAdd: TBitBtn;
    procedure bAddGameClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAddGame: TfAddGame;

implementation

{$R *.dfm}

uses ufChange;

procedure TfAddGame.bAddGameClick(Sender: TObject);
begin
  fMain.lbMAin.Items.Add(leName.Text);

  fMain.ini.WriteString(leName.Text, 'Name', leName.Text);
  fMain.ini.WriteString(leName.Text, 'Status', cbStatus.Text);
  fMain.ini.WriteString(leName.Text, 'Rate', cbRate.Text);

  fMain.ini.WriteString(leName.Text, 'Comments', mComments2.Text);

  fMain.lCount.Caption := IntToStr(fMain.lbMAin.Items.Count);
end;

procedure TfAddGame.FormActivate(Sender: TObject);
begin
  fAddGame.Color := fMain.Color;

  leName.Clear;
  leName.SetFocus;

  cbStatus.ItemIndex := 0;
  cbRate.ItemIndex := 0;

  mComments2.Clear;
end;

end.
