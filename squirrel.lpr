//------------------------------------------------------------------------------
//--------- Copyright (c) 2021..2023, Mraukot. All rights reserved. ------------
//------------------------------------------------------------------------------
program squirrel;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, datetimectrls, SquirrelMainUnit, BitmapOperations
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
    Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TSquirrelMainForm, SquirrelMainForm);
  Application.Run;
end.

