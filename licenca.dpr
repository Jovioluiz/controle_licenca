program licenca;

uses
  Vcl.Forms,
  uLogin in 'Login\uLogin.pas' {frmLogin},
  uCliente in 'Cliente\src\uCliente.pas',
  cCliente in 'Cliente\Cadastro\cCliente.pas' {fCadastroCliente},
  uclCliente in 'Cliente\src\uclCliente.pas',
  dConexao in 'Conexao\dConexao.pas' {dmConexao: TDataModule},
  uUtil in 'Uteis\uUtil.pas',
  System.UITypes,
  System.SysUtils,
  uMenuPrincipal in 'Principal\uMenuPrincipal.pas' {frmPrincipal},
  uCadastrarSenha in 'Cadastros\Senha\uCadastrarSenha.pas' {frmCadastraSenha};

{$R *.res}

begin
  Application.CreateForm(TdmConexao, dmConexao);
  frmLogin := TfrmLogin.Create(nil);

  if frmLogin.ShowModal = mrOK then
  begin
    FreeAndNil(frmLogin);
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
  end;
end.
