object fCadastroCliente: TfCadastroCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Cadastro Cliente'
  ClientHeight = 546
  ClientWidth = 1010
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 546
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 82
      Height = 16
      Caption = 'C'#243'digo Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 73
      Top = 96
      Width = 33
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 21
      Top = 123
      Width = 85
      Height = 16
      Caption = 'Nome Fantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCpfCnpj: TLabel
      Left = 51
      Top = 150
      Width = 55
      Height = 16
      Caption = 'CPF/CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCdCliente: TEdit
      Left = 112
      Top = 35
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object edtNomeCliente: TEdit
      Left = 112
      Top = 91
      Width = 417
      Height = 21
      TabOrder = 1
    end
    object edtNomeFantasia: TEdit
      Left = 112
      Top = 118
      Width = 417
      Height = 21
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 112
      Top = 145
      Width = 185
      Height = 21
      TabOrder = 3
    end
    object RadioGroup1: TRadioGroup
      Left = 344
      Top = 16
      Width = 185
      Height = 57
      Caption = 'Tipo Pessoa'
      Items.Strings = (
        'F'#237'sica'
        'Juridica')
      TabOrder = 4
    end
  end
end
