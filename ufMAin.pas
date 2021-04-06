unit ufMAin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls, IniFiles, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtDlgs;

type
  TfMain = class(TForm)
    lbMAin: TListBox;
    mm: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    bAdd: TBitBtn;
    bDel: TBitBtn;
    lTime: TLabel;
    Timer: TTimer;
    bChange: TBitBtn;
    pMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sd1: TSaveDialog;
    mComments: TMemo;
    Label4: TLabel;
    lName: TLabel;
    lStatus: TLabel;
    lRate: TLabel;
    N6: TMenuItem;
    cd1: TColorDialog;
    bSearch: TBitBtn;
    eNameSearch: TEdit;
    mImage: TImage;
    BitBtn1: TBitBtn;
    opd1: TOpenPictureDialog;
    bSort: TBitBtn;
    N3: TMenuItem;
    lCount: TLabel;
    Label5: TLabel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    procedure TimerTimer(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure lbMAinClick(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bSearchClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    ini: TIniFile;
  end;

var
  fMain: TfMain;
  count_games: integer;

implementation

{$R *.dfm}

uses ufAddGame, ufChange;

procedure TfMain.bAddClick(Sender: TObject);
begin
  fAddGame.ShowModal;
end;

procedure TfMain.bChangeClick(Sender: TObject);
begin
  if lbMain.ItemIndex < 0 then
    MessageBox(handle, PChar('�������� ������ ��� ���������!'), PChar('������'), MB_ICONWARNING)
  else
    fChange.ShowModal;
end;

procedure TfMain.bDelClick(Sender: TObject);
var st: string[30];
    i, k: integer;
begin
  Image1.Hide;
  if lbMain.ItemIndex >= 0 then
    begin
      st := lbMain.Items[lbMain.ItemIndex];
      ini.EraseSection(st);

      for i := 0 to lbMain.Count - 1 do
        if lbMain.Items[i] = st then
          k := i;

      ini.DeleteKey('Main', IntToStr(k));

      lbMain.DeleteSelected;

      lName.Caption := '���� �� �������';
      lStatus.Caption := '���� �� �������';
      lRate.Caption := '���� �� �������';
      mImage.Picture.LoadFromFile(ini.ReadString(st,'PictureDir', ExtractFileDir(Application.ExeName) + '\unnamed.png'));
      mComments.Clear;

      ini.WriteInteger('Main', 'CountGames', lbMain.Count);
      fMain.lCount.Caption := IntToStr(fMain.lbMAin.Items.Count);
    end
    else MessageBox(handle, PChar('�������� ������ ��� ��������!'), PChar('������'), MB_ICONWARNING);

end;

procedure TfMain.BitBtn1Click(Sender: TObject);
var way: string[50];
begin
  if lbMain.ItemIndex < 0 then
    MessageBox(handle, PChar('������� �� ������'), PChar('������'), MB_ICONWARNING)
  else if opd1.Execute then
    begin
      mImage.Picture.LoadFromFile(opd1.FileName);
      CopyFile(PChar(opd1.FileName), PChar(ExtractFileDir(Application.ExeName) + lName.Caption + '.png'), false);
      ini.WriteString(lName.Caption, 'PictureDir', ExtractFileDir(Application.ExeName) + lName.Caption + '.png');
    end;
end;


procedure TfMain.bSearchClick(Sender: TObject);
var i, c: integer;
begin
  c := 0;
  for i := 0 to lbMain.Items.Count - 1 do
    if pos(AnsiLowerCase(lbMain.Items[i]), AnsiLowerCase(eNameSearch.Text)) > 0 then
      begin
        lbMain.ItemIndex := i;
        lName.Caption := ini.ReadString(lbMain.Items[lbMain.ItemIndex], 'Name', '��� ������');
        lStatus.Caption := ini.ReadString(lbMain.Items[lbMain.ItemIndex], 'Status', '��� ������');
        lRate.Caption := ini.ReadString(lbMain.Items[lbMain.ItemIndex], 'Rate', '��� ������');
        mComments.Text := ini.ReadString(lbMain.Items[lbMain.ItemIndex], 'Comments', '��� ������');
        mImage.Picture.LoadFromFile(ini.ReadString(lbMain.Items[lbMain.ItemIndex], 'PictureDir', ExtractFileDir(Application.ExeName) + '\unnamed.png'));
        c := 1;
        Image1.Show;
      case StrToInt(lRate.Caption) of
      0: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\0stars.png');
      1: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\1stars.png');
      2: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\2stars.png');
      3: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\3stars.png');
      4: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\4stars.png');
      5: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\5stars.png');
      6: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\6stars.png');
      7: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\7stars.png');
      8: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\8stars.png');
      9: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\9stars.png');
      10: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\10stars.png')
      end;
        break
      end;
  if c = 0 then MessageBox(handle, PChar('������� �� ������'), PChar('������'), MB_ICONWARNING);
  eNameSearch.Clear;
end;

procedure TfMain.bSortClick(Sender: TObject);
var i, h: integer; st1, st2: string[30];
begin
  st1 := ''; st2 := '';
  for h := 1 to lbMain.Items.Count - 1 do
    begin
  for i := 0 to lbMain.Items.Count - 2 do
    begin
      st1 := lbMain.Items[i];
      st2 := lbMain.Items[i + 1];
      if st1[1] > st2[1] then
        begin
          lbMain.Items[i] := st2;
          lbMain.Items[i + 1] := st1;
        end;
    end;
    end;
end;

procedure TfMain.FormCreate(Sender: TObject);
var i, k: integer; st: string[30];
begin
  ini := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\config.ini');
  fMain.Color := Ini.ReadInteger('Main', 'Color', fMain.Color);

  k := ini.ReadInteger('Main', 'CountGames', 0);
  if k > 0 then
    for i := 0 to k - 1 do
      begin
        st := ini.ReadString('Main', IntToStr(i), 'ERROR');
        lbMain.Items.Add(st);
      end;

  lCount.Caption := IntToStr(lbMAin.Items.Count);
end;

procedure TfMain.FormDestroy(Sender: TObject);
var i, k: integer;
begin
  Ini.WriteInteger('Main', 'Color', fMain.Color);

  k := lbMain.Count;
  if k > 0 then
    begin
      ini.WriteInteger('Main', 'CountGames', k);
      for i := 0 to k - 1 do
        Ini.WriteString('Main', IntToStr(i), lbMain.Items[i]);
    end;

  Ini.Free;
end;

procedure TfMain.lbMAinClick(Sender: TObject);
var st: string[30];
begin
  if lbMain.ItemIndex < 0 then
    MessageBox(handle, PChar('�������� ������!'), PChar('������'), MB_ICONWARNING)
  else
  begin

    st := lbMain.Items[lbMain.ItemIndex];

    lName.Caption := ini.ReadString(st, 'Name', '��� ������');
    lStatus.Caption := ini.ReadString(st, 'Status', '��� ������');
    lRate.Caption := ini.ReadString(st, 'Rate', '��� ������');
    mImage.Picture.LoadFromFile(ini.ReadString(st,'PictureDir', ExtractFileDir(Application.ExeName) + '\unnamed.png'));

    Image1.Show;
    case StrToInt(lRate.Caption) of
      0: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\0stars.png');
      1: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\1stars.png');
      2: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\2stars.png');
      3: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\3stars.png');
      4: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\4stars.png');
      5: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\5stars.png');
      6: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\6stars.png');
      7: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\7stars.png');
      8: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\8stars.png');
      9: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\9stars.png');
      10: Image1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName) + '\10stars.png')
    end;

    mComments.Text := ini.ReadString(st, 'Comments', '��� ������');
  end;
end;

procedure TfMain.N2Click(Sender: TObject);
begin
  if sd1.Execute then
    begin
      if pos('.txt', sd1.FileName) > 0 then
        lbMain.Items.SaveToFile(sd1.FileName)
      else
        lbMain.Items.SaveToFile(sd1.FileName + '.txt');
    end;
end;

procedure TfMain.N3Click(Sender: TObject);
begin
  fMain.Close;
end;

procedure TfMain.N6Click(Sender: TObject);
begin
  if cd1.Execute then
    fMain.Color := cd1.Color;
end;

procedure TfMain.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  lTime.Caption := TimeToStr(Time);
  Timer.Enabled := True;
end;

end.
