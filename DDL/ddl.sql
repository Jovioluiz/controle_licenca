create database controle_licenca;

CREATE SEQUENCE public.cliente_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1
NO CYCLE;

CREATE SEQUENCE public.seq_id_geral
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 1
CACHE 1
NO CYCLE;

CREATE OR REPLACE FUNCTION public.func_id_geral()
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
            DECLARE
              RESULTADO BIGINT;
            BEGIN
                /*Gera o id_geral */
                SELECT NEXTVAL(PG_CLASS.OID)
                INTO RESULTADO
                FROM PG_CLASS
                WHERE RELNAME = 'seq_id_geral';
            RETURN RESULTADO + 100000000000;
            END
            $function$
;

CREATE OR REPLACE FUNCTION public.func_grava_dt_atz()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$ 
BEGIN 
    NEW.DT_ATZ = clock_timestamp(); 
    RETURN NEW; 
END;
$function$
;

CREATE TABLE cliente (
    cd_cliente int4 NOT NULL,
    cpf_cnpj varchar(14) NOT NULL,
    rg_ie varchar(15) NULL,
    nome varchar(50) NOT NULL,
    nome_fantasia varchar(50) NULL,
    tipo_cliente varchar(1) NULL,
    dt_nasc_fundacao date NULL,
    email varchar(50) NULL,
    telefone1 varchar(15) NULL,
    telefone2 varchar(15) NULL,
    celular varchar(15) NULL,
    dt_atz timestamptz NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.cliente for each row execute procedure func_grava_dt_atz();

CREATE TABLE endereco (
    cd_cliente int4 NOT NULL,
    logradouro varchar(50) NOT NULL,
    num int4 NULL,
    bairro varchar(50) NULL,
    complemento varchar(50) null
    cidade varchar(50) NULL,
    uf varchar(2)NULL,
    dt_atz timestamp NULL,
    CONSTRAINT pk_endereco PRIMARY KEY (cd_cliente),
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (cd_cliente) REFERENCES cliente(cd_cliente) ON DELETE CASCADE
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.endereco for each row execute procedure func_grava_dt_atz();

CREATE TABLE usuario (
    cd_usuario int4 not null,
    nm_usuario varchar(50) NOT NULL,
    senha varchar(50) NOT NULL,
    dt_atz timestamp NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.usuario for each row execute procedure func_grava_dt_atz();

CREATE TABLE empreendimento (
    cd_empreendimento int4 NOT NULL,
    nome_empreendimento varchar(100) NOT NULL,
    sigla_empreendimento varchar(10) NULL,
    descricao text NULL,
    rua varchar(50) NOT NULL,
    num int4 NULL,
    cidade varchar(50) NOT NULL,
    uf varchar(2) NOT NULL,
    dt_atz timestamp NULL,
    CONSTRAINT pk_empreendimento PRIMARY KEY (cd_empreendimento)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.empreendimento for each row execute procedure func_grava_dt_atz();

CREATE TABLE endereco_empreendimento (
    cd_empreendimento int4 NOT NULL,
    logradouro varchar(50) NOT NULL,
    num int4 NULL,
    complemento varchar(50) null,
    cidade varchar(50) NOT NULL,
    uf varchar(2) NOT NULL,
    dt_atz timestamp NULL,
    CONSTRAINT fk_empreendimento foreign KEY (cd_empreendimento) references empreendimento (cd_empreendimento)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.endereco_empreendimento for each row execute procedure func_grava_dt_atz();

CREATE TABLE licenca (
    cd_licenca int4 NOT NULL,
    cd_empreendimento int4 NOT NULL,
    cd_cliente int4 NOT NULL,
    nome_licenca varchar(50) NOT NULL,
    sigla varchar(10) NULL,
    dt_emissao date NOT NULL,
    dt_validade date NOT NULL,
    obs text NULL,
    dt_atz timestamp NULL,
    CONSTRAINT pk_licenca PRIMARY KEY (cd_licenca, cd_empreendimento, cd_cliente),
    CONSTRAINT fk_licenca_empreendimento foreign KEY (cd_empreendimento) references empreendimento (cd_empreendimento),
    CONSTRAINT fk_licenca_cliente foreign KEY (cd_cliente) references cliente (cd_cliente)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.licenca for each row execute procedure func_grava_dt_atz();

CREATE table custo_licenca (
    cd_licenca int4 NOT NULL,
    valor numeric(15,4) NULL,
    dt_atz timestamp NULL,
    CONSTRAINT pk_custo_licenca PRIMARY KEY (cd_licenca)
);


create trigger tr_dt_atz before
insert
    or
update
    on
    public.custo_licenca for each row execute procedure func_grava_dt_atz();

CREATE TABLE acoes_sistema (
    cd_acao int4 NOT NULL,
    nm_acao varchar(50) NULL,
    nm_formulario varchar(50) NULL,
    dt_atz timestamp NULL,
    CONSTRAINT pk_acoes_sistema PRIMARY KEY (cd_acao)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.acoes_sistema for each row execute procedure func_grava_dt_atz();

CREATE TABLE usuario_acao (
    cd_usuario int4 NOT NULL,
    cd_acao int4 NOT NULL,
    fl_permite_acesso bool default true,
    fl_permite_edicao bool default true,
    dt_atz timestamp NULL,
    CONSTRAINT uk_usuario_acao UNIQUE (cd_usuario, cd_acao),
    CONSTRAINT fk_usuario_acao_acoes_sistema FOREIGN KEY (cd_acao) REFERENCES acoes_sistema(cd_acao),
    CONSTRAINT fk_usuario_acao FOREIGN KEY (cd_usuario) REFERENCES usuario(cd_usuario)
);

create trigger tr_dt_atz before
insert
    or
update
    on
    public.usuario_acao for each row execute procedure func_grava_dt_atz();