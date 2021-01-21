unit uclCliente;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Comp.DataSet, dConexao, Data.DB;

type
  TPessoa = class
  private
    FTelefone2: string;
    FTelefone1: string;
    FCelular: string;
    FEmail: string;
    FCdCliente: Integer;
    FDtFundacao: TDateTime;
    FCpf_Cnpj: string;
    FRG_IE: string;
    FNome: string;
    FNomeFantasia: string;
    FAtivo: Boolean;
    FTipo_Cliente: Integer;
    procedure SetCdCliente(const Value: Integer);
    procedure SetCelular(const Value: string);
    procedure SetCpf_Cnpj(const Value: string);
    procedure SetDtFundacao(const Value: TDateTime);
    procedure SetEmail(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeFantasia(const Value: string);
    procedure SetRG_IE(const Value: string);
    procedure SetTelefone1(const Value: string);
    procedure SetTelefone2(const Value: string);
    procedure SetAtivo(const Value: Boolean);
    procedure SetTipo_Cliente(const Value: Integer);



  public
    constructor Create;
    procedure Salvar;
    procedure Atualizar;
    function Pesquisar(CodCliente: Integer): Boolean;

    property CdCliente: Integer read FCdCliente write SetCdCliente;
    property Telefone1: string read FTelefone1 write SetTelefone1;
    property Telefone2: string read FTelefone2 write SetTelefone2;
    property Celular: string read FCelular write SetCelular;
    property Email: string read FEmail write SetEmail;
    property Cpf_Cnpj: string read FCpf_Cnpj write SetCpf_Cnpj;
    property Nome: string read FNome write SetNome;
    property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;
    property RG_IE: string read FRG_IE write SetRG_IE;
    property DtFundacao: TDateTime read FDtFundacao write SetDtFundacao;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Tipo_Cliente: Integer read FTipo_Cliente write SetTipo_Cliente;
end;

type TClienteEndereco = class
  private
    FLogradouro: string;
    FBairro: string;
    FUF: string;
    FNumero: string;
    FCidade: string;
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetUF(const Value: string);

  public

  property Logradouro: string read FLogradouro write SetLogradouro;
  property Numero: string read FNumero write SetNumero;
  property Bairro: string read FBairro write SetBairro;
  property Cidade: string read FCidade write SetCidade;
  property UF: string read FUF write SetUF;

end;

implementation

uses
  System.SysUtils;

{ TPessoa }

procedure TPessoa.Atualizar;
begin

end;

constructor TPessoa.Create;
begin

end;

function TPessoa.Pesquisar(CodCliente: Integer): Boolean;
const
  SQL_CLIENTE = 'select       '+
                    'cd_cliente '+
                'from         '+
                    'cliente  '+
                'where        '+
                    'cd_cliente = :cd_cliente';
var
  qry: TFDquery;
begin
  qry := TFDQuery.Create(nil);
  qry.Connection := dmConexao.conexao;

  try
    qry.SQL.Add(SQL_CLIENTE);
    qry.ParamByName('cd_cliente').AsInteger := CodCliente;
    qry.Open();

    Result := not qry.IsEmpty;

  finally
    qry.Free;
  end;
end;

procedure TPessoa.Salvar;
const
  SQL =
  'insert into cliente (cd_cliente, cpf_cnpj, rg_ie, nome, nome_fantasia, ' +
  ' tipo_cliente, dt_nasc_fundacao, email, telefone1, telefone2, celular, ativo) ' +
  'values (:cd_cliente, :cpf_cnpj, :rg_ie, :nome, :nome_fantasia, :tipo_cliente, ' +
  ':dt_nasc_fundacao, :email, :telefone1, :telefone2, :celular, :ativo)';
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  qry.Connection := dmConexao.conexao;

  try
    try
      qry.SQL.Add(SQL);

      qry.ParamByName('cd_cliente').AsInteger := FCdCliente;
      qry.ParamByName('cpf_cnpj').AsString := FCpf_Cnpj;
      qry.ParamByName('rg_ie').AsString := FRG_IE;
      qry.ParamByName('nome').AsString := FNome;
      qry.ParamByName('nome_fantasia').AsString := FNomeFantasia;
      case Tipo_Cliente of
        0: qry.ParamByName('tipo_cliente').AsString := 'F';
        1: qry.ParamByName('tipo_cliente').AsString := 'J';  
      end;
      qry.ParamByName('dt_nasc_fundacao').AsDate := FDtFundacao;
      qry.ParamByName('email').AsString := FEmail;
      qry.ParamByName('telefone1').AsString := FTelefone1;
      qry.ParamByName('telefone2').AsString := FTelefone2;
      qry.ParamByName('celular').AsString := FCelular;
      qry.ParamByName('ativo').AsBoolean := FAtivo;

      qry.ExecSQL;
      qry.Connection.Commit;

    except
    on E:exception do
      begin
        qry.Connection.Rollback;
        raise Exception.Create('Erro ao gravar os dados do cliente' + E.Message);
      end;
    end;
  finally
    qry.Connection.Rollback;
    qry.Free;
  end;
end;


procedure TPessoa.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TPessoa.SetCdCliente(const Value: Integer);
begin
  FCdCliente := Value;
end;

procedure TPessoa.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TPessoa.SetCpf_Cnpj(const Value: string);
begin
  FCpf_Cnpj := Value;
end;

procedure TPessoa.SetDtFundacao(const Value: TDateTime);
begin
  FDtFundacao := Value;
end;

procedure TPessoa.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPessoa.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TPessoa.SetRG_IE(const Value: string);
begin
  FRG_IE := Value;
end;

procedure TPessoa.SetTelefone1(const Value: string);
begin
  FTelefone1 := Value;
end;

procedure TPessoa.SetTelefone2(const Value: string);
begin
  FTelefone2 := Value;
end;

procedure TPessoa.SetTipo_Cliente(const Value: Integer);
begin
  FTipo_Cliente := Value;
end;

{ TClienteEndereco }

procedure TClienteEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TClienteEndereco.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TClienteEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TClienteEndereco.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TClienteEndereco.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
