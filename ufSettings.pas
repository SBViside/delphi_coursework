unit ufSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, IniFiles;

type
  TfSettings = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CBsound: TCheckBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    bColor: TButton;
    pColor: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBsoundClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bColorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSettings: TfSettings;

implementation

{$R *.dfm}

uses ufChange, ufMAin;

procedure TfSettings.Button1Click(Sender: TObject);
begin
  bColor.Hide;
  pColor.Hide;

  Label2.Caption := '����� ����� �������� ��������� ����� � ���������: ���������, ���� ������ �� ����� � ��������.';

  Label1.Caption := Button1.Caption;
  CBsound.Show;
end;

procedure TfSettings.Button2Click(Sender: TObject);
begin
  CBsound.Hide;
  bColor.Show;
  pColor.Show;

  Label2.Caption := '�����, �� ������ �������, ����� �������� ���� ����������.';

  Label1.Caption := Button2.Caption;
end;

procedure TfSettings.Button3Click(Sender: TObject);
begin
  CBsound.Hide;
  bColor.Hide;
  pColor.Hide;

  Label2.Caption := '����� ��������� ��������� ���������.';

  Label1.Caption := Button3.Caption;
end;

procedure TfSettings.bColorClick(Sender: TObject);
begin
  if fMain.cd1.Execute then
  begin
    fMain.Color := fMain.cd1.Color;
    pColor.Color := fMain.cd1.Color;
  end;
end;

procedure TfSettings.CBsoundClick(Sender: TObject);
begin
  if CBsound.Checked then fMain.MediaPlayer1.Play else fMain.MediaPlayer1.Pause;
end;

procedure TfSettings.FormActivate(Sender: TObject);
begin
  CBsound.Checked := fMain.ini.ReadBool('Main', 'Sound', True);
  pColor.Color := fMain.Color;
end;

procedure TfSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fMain.Ini.WriteBool('Main', 'Sound', CBsound.Checked);
end;

end.
