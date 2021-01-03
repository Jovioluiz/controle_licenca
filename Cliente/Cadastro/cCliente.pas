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
    Edit2: TEdit;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    lblCpfCnpj: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastroCliente: TfCadastroCliente;

implementation

{$R *.dfm}

end.
