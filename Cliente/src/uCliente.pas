unit uCliente;

interface

type TPFisica = class
  private
    FRg: string;
    FEmail: string;
    FCPF: string;
    FDtNascimento: TDateTime;
    FNome: string;
    procedure SetCPF(const Value: string);
    procedure SetDtNascimento(const Value: TDateTime);
    procedure SetEmail(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetRg(const Value: string);

  public
    property CPF: string read FCPF write SetCPF;
    property Nome: string read FNome write SetNome;
    property Rg: string read FRg write SetRg;
    property DtNascimento: TDateTime read FDtNascimento write SetDtNascimento;
    property Email: string read FEmail write SetEmail;
end;

type TPJuridica = class
  private
    FDtFundacao: TDateTime;
    FCnpj: string;
    FEmail: string;
    FIE: string;
    FNome: string;
    FNomeFantasia: string;
    procedure SetCnpj(const Value: string);
    procedure SetDtFundacao(const Value: TDateTime);
    procedure SetEmail(const Value: string);
    procedure SetIE(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeFantasia(const Value: string);

  public

    property Cnpj: string read FCnpj write SetCnpj;
    property Nome: string read FNome write SetNome;
    property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;
    property IE: string  read FIE write SetIE;
    property DtFundacao: TDateTime  read FDtFundacao write SetDtFundacao;
    property Email: string read FEmail write SetEmail;

end;

type
  TPessoa<T:constructor> = class
  private
    FTipo: T;
    procedure SetTipo(const Value: T);

  public
    constructor Create;

    property Tipo: T read FTipo write SetTipo;
end;

implementation

{ TPessoa<T> }

constructor TPessoa<T>.Create;
begin
  FTipo := T.Create;
end;

procedure TPessoa<T>.SetTipo(const Value: T);
begin
  FTipo := Value;
end;

{ TPFisica }

procedure TPFisica.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TPFisica.SetDtNascimento(const Value: TDateTime);
begin
  FDtNascimento := Value;
end;

procedure TPFisica.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPFisica.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPFisica.SetRg(const Value: string);
begin
  FRg := Value;
end;

{ TPJuridica }

procedure TPJuridica.SetCnpj(const Value: string);
begin
  FCnpj := Value;
end;

procedure TPJuridica.SetDtFundacao(const Value: TDateTime);
begin
  FDtFundacao := Value;
end;

procedure TPJuridica.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPJuridica.SetIE(const Value: string);
begin
  FIE := Value;
end;

procedure TPJuridica.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPJuridica.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

end.
