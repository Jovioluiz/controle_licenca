unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  TfrmLogin = class(TForm)
    pnlSuperior: TPanel;
    pnlInferior: TPanel;
    lbl1: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    imgLogo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

end.
