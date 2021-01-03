program licenca;

uses
  Vcl.Forms,
  uLogin in 'Login\uLogin.pas' {frmLogin},
  uCliente in 'Cliente\src\uCliente.pas',
  cCliente in 'Cliente\Cadastro\cCliente.pas' {fCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfCadastroCliente, fCadastroCliente);
  Application.Run;
end.
