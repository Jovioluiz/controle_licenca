unit cCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfCadastroCliente = class(TForm)
    Panel1: TPanel;
    edtCdCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNomeCliente: TEdit;
    edtNomeFantasia: TEdit;
    edtCpfCnpj: TEdit;
    Label3: TLabel;
    rbTipoPessoa: TRadioGroup;
    lblCpfCnpj: TLabel;
    edtRgIe: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    edtLogradouro: TEdit;
    Label5: TLabel;
    edtBairro: TEdit;
    Label6: TLabel;
    edtNumero: TEdit;
    Label7: TLabel;
    edtCidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    cbEstados: TComboBox;
    Label10: TLabel;
    edtData: TEdit;
    edtEmail: TEdit;
    Label11: TLabel;
    edtFone1: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtFone2: TEdit;
    Label14: TLabel;
    edtCelular: TEdit;
    cbAtivo: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar;
    procedure Excluir;
    procedure LimpaCampos;
  end;

var
  fCadastroCliente: TfCadastroCliente;

implementation

uses
  uclCliente;

{$R *.dfm}

procedure TfCadastroCliente.Excluir;
begin

end;

procedure TfCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fCadastroCliente := nil;
end;

procedure TfCadastroCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then //F3
    LimpaCampos
  else if key = VK_F2 then  //F2
    Salvar
  else if key = VK_F4 then    //F4
    Excluir
  else if key = VK_ESCAPE then //ESC
    if (Application.MessageBox('Deseja Fechar?','Atenção', MB_YESNO) = IDYES) then
      Close;
end;

procedure TfCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0)
  end;
end;

procedure TfCadastroCliente.LimpaCampos;
begin
  edtCdCliente.Clear;
  edtNomeCliente.Clear;
  edtNomeFantasia.Clear;
  edtCpfCnpj.Clear;
  edtRgIe.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtCidade.Clear;
  edtBairro.Clear;
  edtData.Clear;
  edtEmail.Clear;
  edtFone1.Clear;
  edtFone2.Clear;
  edtCelular.Clear;
  cbAtivo.Checked := True;
  edtCdCliente.SetFocus;
end;

procedure TfCadastroCliente.Salvar;
var
  persistencia: TPessoa;
  endereco: TClienteEndereco;
begin
  persistencia := TPessoa.Create;
  endereco := TClienteEndereco.Create;

  try
    persistencia.CdCliente := StrToInt(edtCdCliente.Text);
    persistencia.Nome := edtNomeCliente.Text;
    persistencia.NomeFantasia := edtNomeFantasia.Text;
    persistencia.Cpf_Cnpj := edtCpfCnpj.Text;
    persistencia.RG_IE := edtRgIe.Text;
    persistencia.DtFundacao := StrToDate(edtData.Text);
    persistencia.Telefone1 := edtFone1.Text;
    persistencia.Telefone2 := edtFone2.Text;
    persistencia.Celular := edtCelular.Text;
    persistencia.Email := edtEmail.Text;
    persistencia.Ativo := cbAtivo.Checked;
    persistencia.Tipo_Cliente := rbTipoPessoa.ItemIndex;

    endereco.Logradouro := edtLogradouro.Text;
    endereco.Numero := edtNumero.Text;
    endereco.Bairro := edtBairro.Text;
    endereco.Cidade := edtCidade.Text;
    endereco.UF := cbEstados.Items.Text;

    if not persistencia.Pesquisar(StrToInt(edtCdCliente.Text)) then
    begin
      persistencia.Salvar;
      LimpaCampos;
    end
    else
    begin
      persistencia.Atualizar;
    end;

  finally
    persistencia.Free;
    endereco.Free;
  end;
end;

end.
