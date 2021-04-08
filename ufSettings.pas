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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBsoundClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  Label2.Caption := '����� ����� �������� ��������� ����� � ���������: ���������, ���� ������ �� ����� � ��������.';

  Label1.Caption := Button1.Caption;
  CBsound.Show;
end;

procedure TfSettings.Button2Click(Sender: TObject);
begin
  Label2.Caption := '�����, �� ������ �������, ����� �������� ���� ����������.';

  Label1.Caption := Button2.Caption;
  CBsound.Hide;
end;

procedure TfSettings.Button3Click(Sender: TObject);
begin
  Label2.Caption := '����� ��������� ��������� ���������.';

  Label1.Caption := Button3.Caption;
  CBsound.Hide;
end;

procedure TfSettings.CBsoundClick(Sender: TObject);
begin
  fMain.MediaPlayer1.Play;
  fMain.MediaPlayer1.Pause;
end;

procedure TfSettings.FormActivate(Sender: TObject);
begin
  fChange.Color := fMain.Color;
  CBsound.Checked := fMain.ini.ReadBool('Main', 'Sound', True);
  
end;

procedure TfSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fMain.Ini.WriteBool('Main', 'Sound', CBsound.Checked);
end;

end.
