unit uCadastrarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TfrmCadastraSenha = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaExit(Sender: TObject);
  private
    { Private declarations }
    procedure Salvar;
  public
    { Public declarations }
  end;

var
  frmCadastraSenha: TfrmCadastraSenha;

implementation

{$R *.dfm}

uses dConexao, uUtil;

{ TfrmCadastraSenha }

procedure TfrmCadastraSenha.edtSenhaExit(Sender: TObject);
begin
  Salvar;
end;

procedure TfrmCadastraSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then //F2
    Salvar;
end;

procedure TfrmCadastraSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0)
  end;
end;

procedure TfrmCadastraSenha.Salvar;
const
  SQL_TEMP = 'select nextval(''usuario_seq'') as codigo';

  SQL = 'insert '+
          'into '+
        'usuario (cd_usuario, '+
          'nm_usuario, '+
          'senha) '+
        'values '+
          '(:cd_usuario, '+
          ':nm_usuario, '+
          ':senha)';

  SQL_SELECT = 'select      ' +
               '  cd_usuario, ' +
               '  nm_usuario, ' +
               '  senha ' +
               'from        ' +
               '  usuario ' +
               'where nm_usuario = :nm_usuario ';

  SQL_UPDATE = 'update ' +
               '  usuario ' +
               'set senha = :senha ' +
               'where cd_usuario = :cd_usuario';
var
  qry, qrySeq: TFDQuery;
  cdUsuario: Integer;
  usuario: string;
  criptoSenha: TValidaDados;
begin
  qry := TFDQuery.Create(Self);
  qrySeq := TFDQuery.Create(Self);
  qrySeq.Connection := dmConexao.conexao;
  qry.Connection := dmConexao.conexao;
  qry.Connection.StartTransaction;
  criptoSenha := TValidaDados.Create();

  try
    try
      qry.SQL.Add(SQL_SELECT);
      qry.ParamByName('nm_usuario').AsString := edtUsuario.Text;
      qry.Open();
      cdUsuario := qry.FieldByName('cd_usuario').AsInteger;
      usuario := qry.FieldByName('nm_usuario').AsString;

      if (usuario <> '') and (qry.FieldByName('senha').AsString = '') then
      begin
        qry.SQL.Clear;
        qry.SQL.Add(SQL_UPDATE);
        qry.ParamByName('senha').AsString := criptoSenha.criptografaSenha(edtSenha.Text);
        qry.ParamByName('cd_usuario').AsInteger := cdUsuario;
        qry.ExecSQL;
      end
      else
      begin
        qry.SQL.Clear;
        qrySeq.SQL.Add(SQL_TEMP);
        qrySeq.Open();
        qry.SQL.Add(SQL);
        qry.ParamByName('cd_usuario').AsInteger := qrySeq.FieldByName('codigo').AsInteger;
        qry.ParamByName('nm_usuario').AsString := edtUsuario.Text;
        qry.ParamByName('senha').AsString := criptoSenha.criptografaSenha(edtSenha.Text);
        qry.ExecSQL;
      end;
      dmConexao.conexao.Commit
    except
      on E:exception do
      begin
        dmConexao.conexao.Rollback;
        ShowMessage('Erro '+ E.Message);
      end;
    end;
  finally
    qry.Free;
    qrySeq.Free;
    FreeAndNil(criptoSenha);
    frmCadastraSenha.Close;
  end;
end;

end.
