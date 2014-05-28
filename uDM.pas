unit uDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, MyAccess, MemDS;

type
  TDM = class(TDataModule)
    MysqlConnection: TMyConnection;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
