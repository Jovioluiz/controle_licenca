unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    menuAcoes: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  cCliente;

{$R *.dfm}

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  fCadastroCliente := TfCadastroCliente.Create(Self);

  fCadastroCliente.Show;
end;

end.
