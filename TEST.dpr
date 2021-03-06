program TEST;

uses
  Vcl.Forms,
  ufMAin in 'ufMAin.pas' {fMain},
  ufAddGame in 'ufAddGame.pas' {fAddGame},
  ufChange in 'ufChange.pas' {fChange},
  ufSettings in 'ufSettings.pas' {fSettings},
  ufRofl in 'ufRofl.pas' {fRofl},
  ufStats in 'ufStats.pas' {Stats},
  ufContacts in 'ufContacts.pas' {fContacts};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfRofl, fRofl);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfAddGame, fAddGame);
  Application.CreateForm(TfChange, fChange);
  Application.CreateForm(TfSettings, fSettings);
  Application.CreateForm(TStats, Stats);
  Application.CreateForm(TfContacts, fContacts);
  Application.Run;
end.
