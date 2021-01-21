unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Mask;

type
  TfrmLogin = class(TForm)
    pnlSuperior: TPanel;
    pnlInferior: TPanel;
    lbl1: TLabel;
    edtUsuario: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    imgLogo: TImage;
    lblInfo: TLabel;
    edtSenha: TMaskEdit;
    procedure edtSenhaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtUsuarioExit(Sender: TObject);
  private
    { Private declarations }
    procedure ValidaCampos;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  FireDAC.Comp.Client, uUtil, dConexao, uCadastrarSenha;

{$R *.dfm}

procedure TfrmLogin.edtSenhaExit(Sender: TObject);
const
  SQL_LOGIN = 'select '+
              '  cd_usuario, '+
              '  nm_usuario, '+
              '  senha '+
              'from '+
              '  usuario '+
              'where '+
              '  nm_usuario = :nm_usuario';
var
  qry: TFDQuery;
  verificaSenha: TValidaDados;
begin
  verificaSenha := TValidaDados.Create();
  qry := TFDQuery.Create(Self);
  qry.Connection := dmConexao.conexao;

  try
    qry.SQL.Add(SQL_LOGIN);
    qry.ParamByName('nm_usuario').AsString := edtUsuario.Text;
    qry.Open(SQL_LOGIN);

    if (Trim(edtUsuario.Text) = EmptyStr) or (Trim(edtSenha.Text) = EmptyStr) then
    begin
      lblInfo.Font.Color := clRed;
      lblInfo.Caption := 'Usuário ou Senha Inválidos! Verifique!';
      edtUsuario.Clear;
      edtSenha.Clear;
      edtUsuario.SetFocus;
      Exit;
    end;

    if (Trim(edtUsuario.Text) = qry.FieldByName('nm_usuario').AsString)
        and (Trim(qry.FieldByName('senha').AsString) = verificaSenha.DescriptografaSenha(edtSenha.Text)) then
      ModalResult := mrOk
    else
    begin
      lblInfo.Font.Color := clRed;
      lblInfo.Caption := 'Usuário ou Senha Inválidos! Verifique!';
      edtUsuario.Clear;
      edtSenha.Clear;
      edtUsuario.SetFocus;
      Exit;
    end;

  finally
    qry.Free;
    verificaSenha.Free;
  end;
end;

procedure TfrmLogin.edtUsuarioExit(Sender: TObject);
const
  SQL_LOGIN = 'select '+
              '  senha '+
              'from '+
              '  usuario '+
              'where '+
              '  nm_usuario = :nm_usuario';
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(Self);
  qry.Connection := dmConexao.conexao;
  frmCadastraSenha := TfrmCadastraSenha.Create(Self);

  try
    if edtUsuario.Text <> '' then
    begin
      qry.SQL.Add(SQL_LOGIN);
      qry.ParamByName('nm_usuario').AsString := edtUsuario.Text;
      qry.Open(SQL_LOGIN);

      if qry.FieldByName('senha').Text = '' then
      begin
        ShowMessage('Usuário sem senha cadastrada');
        try
          frmCadastraSenha.ShowModal;
        finally
          FreeAndNil(frmCadastraSenha);
        end;
      end;
    end;
  finally
    qry.Free;
    FreeAndNil(frmCadastraSenha);
  end;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then //ESC
    Close;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0)
  end;
end;

procedure TfrmLogin.ValidaCampos;
begin
  if (edtSenha.Text = '') or (edtUsuario.Text = '') then
  begin
    ShowMessage('Os campos não podem ser vazios');
    Exit;
  end;
end;

end.
