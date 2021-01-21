object fCadastroCliente: TfCadastroCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro Cliente'
  ClientHeight = 376
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 376
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 21
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
    object Label4: TLabel
      Left = 322
      Top = 150
      Width = 16
      Height = 16
      Caption = 'RG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 80
      Top = 231
      Width = 26
      Height = 16
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 75
      Top = 172
      Width = 31
      Height = 16
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 56
      Top = 204
      Width = 50
      Height = 16
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 224
      Top = 204
      Width = 50
      Height = 16
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 298
      Top = 177
      Width = 40
      Height = 16
      Caption = 'Celular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCdCliente: TEdit
      Left = 112
      Top = 20
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object edtNomeCliente: TEdit
      Left = 112
      Top = 91
      Width = 417
      Height = 21
      TabOrder = 3
    end
    object edtNomeFantasia: TEdit
      Left = 112
      Top = 118
      Width = 417
      Height = 21
      TabOrder = 4
    end
    object edtCpfCnpj: TEdit
      Left = 112
      Top = 145
      Width = 185
      Height = 21
      TabOrder = 5
    end
    object rbTipoPessoa: TRadioGroup
      Left = 344
      Top = 16
      Width = 185
      Height = 57
      Caption = 'Tipo Pessoa'
      Items.Strings = (
        'F'#237'sica'
        'Juridica')
      TabOrder = 2
    end
    object edtRgIe: TEdit
      Left = 344
      Top = 145
      Width = 185
      Height = 21
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 261
      Width = 570
      Height = 114
      Align = alBottom
      Caption = 'Endere'#231'o'
      TabOrder = 12
      object Label5: TLabel
        Left = 11
        Top = 22
        Width = 65
        Height = 16
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 42
        Top = 44
        Width = 34
        Height = 16
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 390
        Top = 17
        Width = 45
        Height = 16
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 37
        Top = 71
        Width = 39
        Height = 16
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 420
        Top = 73
        Width = 15
        Height = 16
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtLogradouro: TEdit
        Left = 82
        Top = 17
        Width = 302
        Height = 21
        TabOrder = 0
      end
      object edtBairro: TEdit
        Left = 82
        Top = 44
        Width = 302
        Height = 21
        TabOrder = 1
      end
      object edtNumero: TEdit
        Left = 441
        Top = 17
        Width = 87
        Height = 21
        TabOrder = 2
      end
      object edtCidade: TEdit
        Left = 82
        Top = 71
        Width = 302
        Height = 21
        TabOrder = 3
      end
      object cbEstados: TComboBox
        Left = 441
        Top = 72
        Width = 70
        Height = 21
        TabOrder = 4
      end
    end
    object edtData: TEdit
      Left = 112
      Top = 226
      Width = 105
      Height = 21
      TabOrder = 11
    end
    object edtEmail: TEdit
      Left = 112
      Top = 172
      Width = 185
      Height = 21
      TabOrder = 7
    end
    object edtFone1: TEdit
      Left = 112
      Top = 199
      Width = 105
      Height = 21
      TabOrder = 9
    end
    object edtFone2: TEdit
      Left = 280
      Top = 199
      Width = 105
      Height = 21
      TabOrder = 10
    end
    object edtCelular: TEdit
      Left = 344
      Top = 172
      Width = 105
      Height = 21
      TabOrder = 8
    end
    object cbAtivo: TCheckBox
      Left = 224
      Top = 22
      Width = 57
      Height = 17
      Caption = 'Ativo'
      TabOrder = 1
    end
  end
end
