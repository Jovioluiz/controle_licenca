unit uUtil;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.UITypes, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Param;

type TValidaDados = class
  private

  public
    function validaAcessoAcao(cdUsuario : Integer; cdAcao : Integer) : Boolean; //valida se o usu�rio pode acessar a a��o
    function validaEdicaoAcao(cdUsuario : Integer; cdAcao : Integer) : Boolean; //valida se o usu�rio pode editar um cadastro
    function criptografaSenha(Senha: String): String;
    function DescriptografaSenha(Senha: string): String;

end;

type TEditDocumento = class helper for TEdit
  public
    function isEmpty: Boolean;

end;

type TDataSetHelper = class helper for TDataSet
  public

    procedure Loop(Procedimento: TProc); overload;
end;

var
  s: string[255];
  c: array[0..255] of Byte absolute s;

implementation

{ TValidaDados }

uses dConexao;

function TValidaDados.criptografaSenha(Senha: String): String;
var
  i : Integer;
begin
  s := Senha;
  for i := 1 to ord(s[0]) do
    c[i] := 23 xor c[i];

  Result := s;
end;

function TValidaDados.DescriptografaSenha(Senha: string): String;
var
  i : Integer;
begin
  s := Senha;
  for i := 1 to Length(s) do
    s[i] := Ansichar(23 Xor ord(c[i]));
  Result := s;
end;

function TValidaDados.validaAcessoAcao(cdUsuario, cdAcao: Integer): Boolean;
const
  sql = 'select '+
         '  fl_permite_acesso '+
         'from '+
         '  usuario_acao '+
         ' where '+
         '  cd_acao = :cd_acao and '+
         '  cd_usuario = :cd_usuario';
begin
//  Result := False;
//
//  dm.query.Close;
//  dm.query.SQL.Clear;
//  dm.query.SQL.Add(sql);
//  dm.query.ParamByName('cd_acao').AsInteger := cdAcao;
//  dm.query.ParamByName('cd_usuario').AsInteger := cdUsuario;
//
//  dm.query.Open();
//
//  if not dm.query.IsEmpty then
//    Result := True
//  else
//  begin
//    ShowMessage('Usu�rio n�o possui permiss�o de acesso! Verifique!');
//    Abort;
//  end;
end;

function TValidaDados.validaEdicaoAcao(cdUsuario, cdAcao: Integer): Boolean;
const
  sql = 'select '+
         '  fl_permite_edicao '+
         'from '+
         '  usuario_acao '+
         ' where '+
         '  cd_acao = :cd_acao and '+
         '  cd_usuario = :cd_usuario';
begin
  Result := False;

//  dm.query.Close;
//  dm.query.SQL.Clear;
//  dm.query.SQL.Add(sql);
//  dm.query.ParamByName('cd_acao').AsInteger := cdAcao;
//  dm.query.ParamByName('cd_usuario').AsInteger := cdUsuario;
//
//  dm.query.Open();
//
//  if dm.query.FieldByName('fl_permite_edicao').AsBoolean = True then
//    Result := True;
end;

{ TEditDocumento }

function TEditDocumento.isEmpty: Boolean;
begin
  Result := Trim(Self.Text) = EmptyStr;
end;

{ TDataSetHelper }

procedure TDataSetHelper.Loop(Procedimento: TProc);
begin
  if Self.IsEmpty then
    Exit;

  Self.DisableControls;

  try
    Self.First;
    while not Self.Eof do
    begin
      Procedimento;
      Self.Next;
    end;
    Self.First;
  finally
    Self.EnableControls;
  end;
end;

end.
