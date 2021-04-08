unit ufSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSettings: TfSettings;

implementation

{$R *.dfm}

procedure TfSettings.Button1Click(Sender: TObject);
begin
  Label2.Caption := '����� ����� �������� ��������� ����� � ���������: ���������, ���� ������ �� ����� � ��������.';

  Label1.Caption := Button1.Caption;
  CBsound.Show;
end;

procedure TfSettings.Button2Click(Sender: TObject);
begin
  Label1.Caption := Button2.Caption;
  CBsound.Hide;
end;

procedure TfSettings.Button3Click(Sender: TObject);
begin
  Label1.Caption := Button3.Caption;
  CBsound.Hide;
end;

end.
