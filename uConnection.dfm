object Connection: TConnection
  OldCreateOrder = False
  Height = 150
  Width = 215
  object IdIPWatch: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 72
    Top = 48
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientRead = ServerSocketClientRead
    Left = 128
    Top = 80
  end
end
