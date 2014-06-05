unit uConnection;

interface

uses
  SysUtils, Classes, IdBaseComponent, IdComponent, IdIPWatch, ScktComp;

type
  TConnection = class(TDataModule)
    IdIPWatch: TIdIPWatch;
    ServerSocket: TServerSocket;
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Connection: TConnection;
  Text:string;
  i: Integer;

implementation

{$R *.dfm}

procedure TConnection.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  WriteLn('Neu Client');
end;

procedure TConnection.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
Text := ServerSocket.Socket.ReceiveText;
WriteLn(Timetostr(now)+': '+Text);
 For I := 0 to ServerSocket.Socket.ActiveConnections - 1 do
 begin
 with ServerSocket.Socket.Connections [I] do
 if (Connected) then SendText(Text);
end;
end;


end.
