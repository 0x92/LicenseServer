object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MysqlConnection: TMyConnection
    Left = 32
    Top = 48
  end
  object MyQuery1: TMyQuery
    Connection = MysqlConnection
    Left = 112
    Top = 72
  end
  object MyDataSource1: TMyDataSource
    Left = 128
    Top = 16
  end
end
