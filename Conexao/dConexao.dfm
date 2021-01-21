object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 226
  Width = 303
  object conexao: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'User_Name=postgres')
    Left = 32
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 40
  end
  object driver: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\jovio\Desktop\codigos_fontes\Licenca\trunk\Win32\Debug\' +
      'libpq.dll'
    Left = 112
    Top = 40
  end
end
