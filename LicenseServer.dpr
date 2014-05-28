{ ##############################################################################################
  ## Projectname:  LicenseServer
  ## Author:       0x92
  ## Release:      /
  ## Last change:  28.05.2014
  ## Contact:      0x92dev@gmail.com
  ## Note:         I see stupid people everywhere
  ## -------------------------------------------------------------------------------------------
  ## Parameter:
  ##
  ##
  ##
  ##
  ## -------------------------------------------------------------------------------------------
  ##
  ##
  ##
  ##############################################################################################}
program LicenseServer;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  IOUtils,
  Classes,
  Variants,
  IniFiles,
  msxmldom,
  XMLDoc,
  ActiveX,
  Generics.Collections,
  uDM in 'uDM.pas' {DM: TDataModule};

var
  bDebugMode:        Boolean = False;                                            // On / Off
  sPath:             String;
  sFilename:         String;
  Ini:               TIniFile;

procedure WriteHeader;
begin
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write('  ------------------------------------------------');
  WriteLn;
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write(' |    License Server <May 2014> by 0x92           |');
  WriteLn;
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write(' |    Created at a rainy day for me.              |');
  WriteLn;
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write(' |    YOCO - You only code once!                  |');
  WriteLn;
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write('  ------------------------------------------------');
end;

procedure WriteInfo(Text: String);
begin
  WriteLn;
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 10);
  Write('[INFO]:');
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write(' '+Text);
end;

procedure WriteError(Text: String);
begin
  WriteLn;
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 12);
  Write('[ERROR]:');
  SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
  Write(' '+Text);
  WriteLn;
end;

function loadConfig:boolean;
begin
  try
    DM.MysqlConnection.Server   := Ini.ReadString ('Connection', 'host', '');
    DM.MysqlConnection.Port     := Ini.ReadInteger('Connection', 'port', 0);
    DM.MysqlConnection.Username := Ini.ReadString ('Connection', 'user', '');
    DM.MysqlConnection.Password := Ini.ReadString ('Connection', 'pass', '');
    DM.MysqlConnection.Database := Ini.ReadString ('Connection', 'database', '');
    Result := True;
  except
    Result := False;
  end;
end;

{
  Black = 0;
  Blue = 1;
  Green = 2;
  Cyan = 3;
  Red = 4;
  Magenta = 5;
  Brown = 6;
  LightGray = 7;
  DarkGray = 8;
  LightBlue = 9;
  LightGreen = 10;
  LightCyan = 11;
  LightRed = 12;
  LightMagenta = 13;
  Yellow = 14;
  White = 15;

Initalizing WinSock
Connecting to MySQL
Loading the config
}


begin
    WriteHeader;
    CoInitialize(nil);                                                            // Behebt den Xe3 Bug http://qc.embarcadero.com/wc/qcmain.aspx?d=108838                                                          //Debugmethoden an/aus
    DM := TDM.Create(nil);                                                        // Datenmodul erstellen
    sFilename := ExtractFilePath(ParamStr(0)) + 'mysql.ini';
    WriteInfo('Scanning for Config ...');
    if FileExists(sFilename) then
    begin
      Ini := TIniFile.Create(sFilename);
      WriteInfo('Configpath: ' + sFilename);
    end
    else
    begin
      WriteError('Config not found.');
      ReadLn;
      Exit;
    end;

    if loadConfig then
    begin
      WriteInfo('Config was loaded successfully.');
    end
    else
    begin
      WriteError('Config could not be load.');
      Readln;
      Exit;
    end;

    WriteInfo('hier');
    ReadLn;
end.
