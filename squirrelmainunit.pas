//------------------------------------------------------------------------------
//--------- Copyright (c) 2021..2023, Mraukot. All rights reserved. ------------
//------------------------------------------------------------------------------
unit SquirrelMainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Calendar, FileCtrl, EditBtn, ExtCtrls, DCPsha512, DCPrijndael, DCPtwofish,
  DCPserpent, ExtendedNotebook, SpinEx, DateTimePicker, StrUtils,
  BitmapOperations, DCPblockciphers, Character, base64;

type

  { TSquirrelMainForm }

  TSquirrelMainForm = class(TForm)
    BluePlane: TCheckBox;
    EncryptButton: TButton;
    DecryptButton: TButton;
    ChooseRijndael:TRadioButton;
    ChooseTwoFish:TRadioButton;
    ChooseSerpent:TRadioButton;
    SquirrelAboutLabel: TLabel;
    SquirrelImage: TImage;
    ImageSaveAs: TButton;
    CovertImageSaveAs: TButton;
    Label11: TLabel;
    Label12: TLabel;
    AboutMemo: TMemo;
    PasswdHexEdit: TEdit;
    PasswdEdit: TEdit;
    DCP_rijndael:TDCP_rijndael;
    DCP_twofish:TDCP_twofish;
    DCP_serpent:TDCP_serpent;
    SteganoExtractButton: TButton;
    SteganoInsert: TButton;
    ClearToZero:TButton;
    RandomClearButton:TButton;
    AboutSheet: TTabSheet;
    TextOptions: TGroupBox;
    ClearGroupBox:TGroupBox;
    SteganoAlgorithmSelection: TRadioGroup;
    SaveImageDialog: TSaveDialog;
    GreenPlane: TCheckBox;
    Label10: TLabel;
    Label13: TLabel;
    RedPlane: TCheckBox;
    ColourCheckBox: TCheckBox;
    CovertImage: TImage;
    OpenImage: TImage;
    OpenImageScrollbox: TScrollBox;
    OpenFileNameEdit: TFileNameEdit;
    LoadStateButton: TButton;
    OpenStateDialog: TOpenDialog;
    CovertImageScrollbox: TScrollBox;
    SteganographyPageControl: TPageControl;
    SaveStateDialog: TSaveDialog;
    SaveStateButton: TButton;
    ImportState: TButton;
    ExportStateButton: TButton;
    DefaultStateButton: TButton;
    CopyPasswordToClipboard: TButton;
    Calendar: TCalendar;
    Birthday: TCheckBox;
    Anniversary: TCheckBox;
    Brother: TCheckBox;
    Aunt: TCheckBox;
    Breeze: TCheckBox;
    Bucket: TCheckBox;
    Apples: TCheckBox;
    Blackberry: TCheckBox;
    Accident: TCheckBox;
    Bus: TCheckBox;
    Car: TCheckBox;
    Charity: TCheckBox;
    Checksum1: TEdit;
    Checksum2: TEdit;
    Checksum3: TEdit;
    Checksum4: TEdit;
    Checksum5: TEdit;
    Checksum6: TEdit;
    Hero: TCheckBox;
    Gossip: TCheckBox;
    Corruption: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CodesMemo: TMemo;
    Scandal: TCheckBox;
    Hurricane: TCheckBox;
    Collision: TCheckBox;
    Demonstration: TCheckBox;
    Protests: TCheckBox;
    Riots: TCheckBox;
    Explosion: TCheckBox;
    Fire: TCheckBox;
    Lorry: TCheckBox;
    HowMany: TSpinEditEx;
    SettingsSheet: TTabSheet;
    OpenImageSheet: TTabSheet;
    SteganoSheet: TTabSheet;
    CovertImageSheet: TTabSheet;
    Tornado: TCheckBox;
    Tsunami: TCheckBox;
    UseEncryptedTextCheckBox: TCheckBox;
    UsePasswordCheckBox: TCheckBox;
    Volcano: TCheckBox;
    Earthquake: TCheckBox;
    Tools: TCheckBox;
    Greenhouse: TCheckBox;
    Polytunnel: TCheckBox;
    Compost: TCheckBox;
    Soil: TCheckBox;
    Shed: TCheckBox;
    Flowers: TCheckBox;
    Potatoes: TCheckBox;
    Tomatoes: TCheckBox;
    Strawberry: TCheckBox;
    Raspberry: TCheckBox;
    Planters: TCheckBox;
    RaisedBeds: TCheckBox;
    Slugs: TCheckBox;
    PruningScissors: TCheckBox;
    Seedlings: TCheckBox;
    Seeds: TCheckBox;
    SmallGame: TCheckBox;
    Deer: TCheckBox;
    Hunting: TCheckBox;
    WatchingBirds: TCheckBox;
    Fishing: TCheckBox;
    Creek: TCheckBox;
    Lake: TCheckBox;
    River: TCheckBox;
    Stream: TCheckBox;
    Mud: TCheckBox;
    Puddles: TCheckBox;
    FallenTree: TCheckBox;
    OtherPeople: TCheckBox;
    Dog: TCheckBox;
    Fox: TCheckBox;
    Rat: TCheckBox;
    Rabbit: TCheckBox;
    SeenSquirrel: TCheckBox;
    Tranquility: TCheckBox;
    Rainbow: TCheckBox;
    Storm: TCheckBox;
    StormyClouds: TCheckBox;
    HeavyClouds: TCheckBox;
    Hail: TCheckBox;
    Snow: TCheckBox;
    Fahrenheit: TCheckBox;
    Hot: TCheckBox;
    Label2: TLabel;
    TempScale: TLabel;
    Temperature: TSpinEditEx;
    Warm: TCheckBox;
    Freezing: TCheckBox;
    Cold: TCheckBox;
    Downpour: TCheckBox;
    Rain: TCheckBox;
    GustsOfWind: TCheckBox;
    Clouds: TCheckBox;
    Windy: TCheckBox;
    Sunshine: TCheckBox;
    Hungry: TCheckBox;
    Friend: TCheckBox;
    Cousin: TCheckBox;
    Uncle: TCheckBox;
    Sister: TCheckBox;
    Father: TCheckBox;
    Mother: TCheckBox;
    TimeOff: TCheckBox;
    Holiday: TCheckBox;
    Yesterday: TCheckBox;
    Tomorrow: TCheckBox;
    UseCalendar: TCheckBox;
    Dizziness: TCheckBox;
    RunningNose: TCheckBox;
    Cough: TCheckBox;
    JustCold: TCheckBox;
    SoreThroat: TCheckBox;
    Sick: TCheckBox;
    Headache: TCheckBox;
    CouldntSleep: TCheckBox;
    Yoga: TCheckBox;
    SwimmingPool: TCheckBox;
    Gym: TCheckBox;
    RideAbike: TCheckBox;
    Jogging: TCheckBox;
    Tired: TCheckBox;
    FeelFine: TCheckBox;
    CommonPhrase: TEdit;
    Terrific: TCheckBox;
    Label1: TLabel;
    PasswordNotebook: TExtendedNotebook;
    MainNotebook: TExtendedNotebook;
    OpenText: TMemo;
    EncryptedText: TMemo;
    StatusBar: TStatusBar;
    PasswordSheet: TTabSheet;
    OpenTextSheet: TTabSheet;
    EncryptionSheet: TTabSheet;
    SteganographySheet: TTabSheet;
    CalendarSheet: TTabSheet;
    GardenSheet: TTabSheet;
    NewsSheet: TTabSheet;
    ParkSheet: TTabSheet;
    Sleepy: TCheckBox;
    WeatherSheet: TTabSheet;
    WellBeingSheet: TTabSheet;
    procedure CalendarChange(Sender: TObject);
    procedure CommonPhraseChange(Sender: TObject);
    procedure CopyPasswordToClipboardClick(Sender: TObject);
    procedure ClearToZeroClick(Sender: TObject);
    procedure CovertImageSaveAsClick(Sender: TObject);
    procedure DecryptButtonClick(Sender: TObject);
    procedure EncryptButtonClick(Sender: TObject);
    procedure ExportStateButtonClick(Sender: TObject);
    procedure FahrenheitChange(Sender: TObject);
    procedure DefaultStateButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HowManyChange(Sender: TObject);
    procedure ImageSaveAsClick(Sender: TObject);
    procedure ImportStateClick(Sender: TObject);
    procedure LoadStateButtonClick(Sender: TObject);
    procedure MainNotebookChange(Sender: TObject);
    procedure MainNotebookChanging(Sender: TObject; var AllowChange: Boolean);
    procedure OpenFileNameEditAcceptFileName(Sender: TObject; var Value: String );
    procedure OpenFileNameEditChange(Sender: TObject);
    procedure PasswdCheckboxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PasswordNotebookChange(Sender: TObject);
    procedure PasswordPageChecksumCalculate(tabPage:TTabSheet;tabIndex:integer);
    function CalculatePassword:AnsiString;
    function CelsiusToFahrenheit(tc:double):double;
    function FahrenheitToCelsius(tf:double):double;
    function GetPasswordCode(cb:TCheckBox):AnsiString;
    procedure RandomClearButtonClick(Sender: TObject);
    procedure RedPlaneChange(Sender: TObject);
    procedure SaveStateButtonClick(Sender: TObject);
    procedure SquirrelImageClick(Sender: TObject);
    procedure SteganoAlgorithmSelectionClick(Sender: TObject);
    procedure SteganoExtractButtonClick(Sender: TObject);
    procedure SteganographyPageControlChange(Sender: TObject);
    procedure SteganoInsertClick(Sender: TObject);
    procedure TemperatureChange(Sender: TObject);

  private
    PasswordChecksums:array[0..10] of TEdit;

    ProgramSettings:TStringList;
    CovertBitmap:TBitmap;

    PasswordHash:array[0..63] of byte;

  public
    procedure calcSHA512(s:AnsiString; var hash:array of byte);
    function calculateQuickPassword(s:AnsiString;count:Integer):AnsiString;

    function divideStringInsertNL(input:AnsiString;lineLength:Integer):AnsiString;

    procedure validateProgramSettings;
    procedure getDefaultProgramSettings;
    procedure loadProgramSettingsIntoGui;
    procedure SteganoExtractAction(silent:boolean);
    function SteganoExtract(method:Integer; var contentType:Integer):AnsiString;
    function getValidString(s:AnsiString):AnsiString;
    procedure DecryptLicence;
  end;

var
  SquirrelMainForm: TSquirrelMainForm;

const
  SettingsDir         = '.squirrel';
  PasswdCodesFileName = '.squirrel/settings.txt';

  PasswdChars      = '$!&@ACEFGHIJKLMNPQRSTUVWZYX0123456789abcdefghijkmnoprstuwxyz0123456789!$&@';

{$ifdef WINDOWS}
    NewLine             = #13#10;
{$else}
    NewLine             = #13;
{$endif}

License:array[0..2543] of Byte=(
$4E,$50,$F6,$4E,$93,$1C,$BF,$5D,$B9,$8E,$C0,$D7,$43,$D6,$66,$17,
$68,$1E,$12,$5F,$CF,$73,$B2,$55,$8E,$18,$32,$80,$0D,$0E,$E4,$26,
$B9,$82,$5D,$A3,$48,$D2,$47,$38,$38,$6B,$DB,$8E,$D1,$8A,$22,$D2,
$06,$28,$73,$CF,$9C,$0B,$77,$8E,$93,$7E,$EC,$D3,$62,$ED,$2A,$92,
$A3,$27,$A7,$69,$90,$A6,$59,$96,$55,$06,$A0,$04,$56,$2E,$81,$15,
$05,$70,$69,$A0,$F0,$EF,$6E,$6C,$96,$8E,$73,$1E,$EE,$89,$81,$F5,
$2B,$38,$1B,$46,$D3,$E5,$46,$FB,$B1,$C6,$06,$FF,$4A,$03,$FB,$35,
$52,$7A,$C6,$FB,$3A,$66,$E7,$B4,$19,$C0,$8E,$96,$F3,$C9,$77,$A7,
$ED,$02,$FC,$67,$0E,$3E,$DD,$8B,$A9,$89,$BC,$C2,$42,$62,$F8,$E1,
$84,$17,$0B,$81,$69,$89,$79,$84,$83,$3B,$D7,$EF,$7A,$04,$BE,$09,
$0B,$07,$DA,$4B,$9D,$94,$60,$1F,$BA,$F4,$20,$D9,$AA,$BB,$59,$BD,
$E0,$71,$54,$17,$56,$1F,$33,$F7,$FF,$11,$C4,$C6,$D5,$8C,$B5,$53,
$68,$11,$03,$15,$85,$19,$92,$E1,$CF,$EA,$D3,$FE,$D3,$EB,$BA,$66,
$4E,$15,$2A,$78,$25,$1F,$5F,$D3,$85,$F6,$3E,$F3,$0E,$63,$E5,$51,
$0F,$9B,$B2,$61,$34,$87,$38,$C7,$9B,$D4,$94,$28,$52,$C4,$0B,$08,
$82,$AD,$3D,$AB,$CC,$4D,$E7,$8A,$32,$A5,$51,$67,$AC,$20,$B2,$A1,
$59,$89,$7E,$9D,$3A,$77,$42,$27,$A9,$84,$D3,$58,$75,$5C,$86,$73,
$20,$21,$1F,$CC,$A4,$7A,$C4,$CE,$8E,$50,$D8,$9B,$80,$77,$2E,$D1,
$BE,$78,$80,$3D,$3A,$60,$21,$45,$8E,$F1,$5B,$C2,$1E,$F8,$9D,$BD,
$E7,$83,$BA,$39,$68,$56,$28,$96,$90,$AD,$F0,$7E,$1F,$E8,$29,$69,
$52,$1E,$9C,$91,$07,$F0,$8D,$1F,$55,$E0,$57,$6F,$16,$51,$EF,$D5,
$E2,$B4,$81,$68,$9E,$EC,$9C,$DC,$05,$09,$96,$97,$D4,$75,$E3,$E8,
$12,$9A,$A3,$6D,$A3,$33,$70,$90,$A3,$BE,$80,$F7,$69,$70,$9B,$A1,
$DE,$C0,$10,$CD,$C3,$46,$62,$44,$24,$79,$4D,$B4,$5F,$CD,$B3,$DA,
$91,$D2,$A7,$08,$88,$1F,$35,$2B,$93,$76,$25,$B0,$4E,$5D,$67,$FF,
$5B,$2A,$EF,$CD,$32,$ED,$FB,$06,$5F,$8D,$F4,$14,$42,$EC,$38,$85,
$15,$45,$6D,$E7,$4F,$6E,$34,$C8,$40,$D2,$EA,$E2,$B7,$97,$B2,$C6,
$D8,$13,$46,$B7,$27,$EA,$F2,$01,$3B,$62,$6A,$B3,$75,$36,$77,$F3,
$80,$41,$39,$53,$A9,$90,$E4,$F1,$F3,$F1,$AA,$2C,$C3,$92,$2C,$26,
$C2,$5F,$10,$AA,$51,$DA,$B9,$05,$AA,$B2,$BC,$B1,$88,$4B,$42,$D2,
$5D,$74,$81,$C3,$09,$EA,$B9,$0A,$76,$FD,$94,$EF,$68,$D3,$B3,$36,
$24,$93,$C6,$40,$90,$0B,$31,$18,$24,$E0,$F9,$18,$DB,$4A,$CB,$61,
$A9,$F4,$66,$48,$5B,$51,$FD,$BD,$8C,$6F,$B8,$31,$D3,$D8,$48,$AB,
$75,$E5,$A1,$71,$5A,$CA,$06,$9A,$F8,$FA,$3B,$37,$88,$13,$9C,$7D,
$42,$66,$05,$7F,$BA,$BB,$01,$70,$EC,$98,$23,$4C,$6C,$D7,$2E,$09,
$89,$2C,$8B,$E3,$5D,$71,$53,$1A,$D7,$CB,$77,$96,$62,$30,$C8,$9C,
$C9,$31,$48,$68,$B3,$94,$0D,$35,$3C,$56,$46,$2A,$9C,$AA,$6E,$27,
$34,$58,$9E,$FE,$0F,$30,$0B,$55,$CF,$4B,$58,$AC,$1D,$30,$16,$03,
$E6,$62,$EC,$17,$32,$C3,$5C,$99,$39,$5C,$32,$93,$75,$68,$C5,$4F,
$4E,$34,$FD,$5E,$60,$27,$30,$A8,$5B,$13,$B2,$9D,$8E,$F5,$42,$F1,
$74,$AA,$B1,$45,$08,$DD,$98,$A9,$9C,$D6,$F1,$81,$95,$00,$F0,$4A,
$8C,$E0,$EF,$35,$71,$1B,$EC,$31,$6F,$4C,$BE,$0D,$51,$62,$B1,$88,
$AD,$93,$BD,$4C,$93,$AD,$5E,$70,$E6,$4A,$2D,$8B,$6C,$22,$9C,$45,
$4E,$B9,$A2,$BA,$60,$2E,$F0,$D3,$3C,$3E,$F9,$D1,$07,$A9,$E4,$C5,
$94,$BD,$99,$1B,$29,$91,$CF,$B0,$72,$47,$64,$7B,$B0,$0B,$8D,$CE,
$0F,$7B,$95,$9D,$09,$30,$BC,$46,$C9,$48,$03,$BE,$05,$E8,$C3,$34,
$F7,$5E,$98,$01,$71,$91,$0F,$93,$E7,$A3,$0F,$32,$78,$C2,$09,$25,
$6B,$2E,$FC,$EF,$C8,$92,$17,$1A,$06,$45,$02,$F7,$2D,$7B,$7F,$4B,
$9F,$C4,$8B,$7E,$27,$7E,$95,$A8,$DA,$CD,$AA,$D3,$3F,$2C,$84,$79,
$8A,$B4,$95,$2E,$53,$EA,$36,$0C,$E6,$D6,$25,$E4,$81,$4C,$09,$73,
$29,$57,$32,$15,$CD,$D9,$60,$A4,$3E,$70,$3D,$40,$D4,$0C,$88,$9C,
$3D,$D0,$BE,$7B,$FD,$43,$FE,$DD,$C7,$85,$86,$8C,$60,$71,$8D,$A6,
$B9,$5E,$98,$EC,$76,$56,$65,$44,$54,$64,$A6,$7B,$60,$A9,$66,$91,
$0D,$CA,$50,$7E,$B9,$C7,$F8,$5D,$84,$1F,$26,$9F,$57,$C4,$B2,$54,
$C6,$E7,$0B,$58,$5F,$A4,$4E,$54,$E9,$A6,$21,$EE,$6A,$D2,$09,$63,
$72,$40,$1F,$58,$67,$FA,$71,$1B,$C3,$13,$64,$6F,$A1,$50,$62,$F5,
$9A,$2F,$D4,$B2,$DA,$B3,$93,$8E,$67,$3F,$14,$1D,$C0,$B7,$6E,$6B,
$C2,$B2,$A0,$79,$34,$A2,$3B,$D5,$1E,$A3,$D8,$CA,$47,$96,$4B,$AF,
$2D,$58,$C3,$59,$AB,$E3,$7C,$18,$BF,$55,$D1,$D5,$DF,$97,$93,$B3,
$2D,$3B,$DA,$C0,$33,$EE,$60,$A4,$F7,$12,$0A,$FC,$48,$08,$F4,$54,
$39,$98,$0B,$41,$23,$3E,$8E,$86,$95,$08,$B9,$AA,$BF,$C9,$F2,$2F,
$63,$8A,$94,$21,$23,$D7,$AF,$D0,$00,$03,$54,$89,$49,$7A,$CE,$33,
$65,$BE,$39,$1D,$23,$03,$B0,$06,$83,$2D,$3E,$FD,$6C,$7C,$2D,$9F,
$FA,$DD,$E5,$03,$31,$6E,$F9,$36,$C2,$6D,$CC,$2F,$78,$0F,$16,$16,
$76,$2F,$5B,$8F,$F0,$84,$DD,$BD,$5C,$84,$5C,$F1,$53,$6A,$0C,$31,
$51,$24,$B3,$34,$D7,$B5,$58,$FB,$57,$C5,$3C,$C1,$C7,$EF,$A0,$4B,
$01,$9C,$F3,$7F,$1C,$ED,$F3,$3A,$F1,$D0,$D5,$F8,$4A,$AA,$06,$E9,
$01,$FF,$3B,$0F,$08,$62,$12,$68,$63,$13,$CA,$A7,$2A,$4F,$69,$E7,
$A4,$19,$54,$E7,$00,$3F,$83,$96,$A8,$B6,$FD,$FF,$59,$E4,$C3,$B6,
$58,$78,$1F,$2B,$5E,$82,$76,$88,$F4,$05,$E4,$AF,$4E,$9B,$B2,$3D,
$92,$91,$44,$90,$9E,$30,$F8,$A0,$62,$4C,$C8,$7F,$60,$9A,$0E,$A7,
$EC,$97,$4C,$95,$E8,$D8,$14,$A0,$E4,$BD,$6F,$C8,$B3,$9A,$2D,$FD,
$82,$01,$7D,$62,$BE,$CD,$53,$8C,$51,$30,$6F,$20,$51,$2B,$B9,$58,
$64,$23,$FA,$8D,$81,$9F,$4D,$85,$90,$BA,$1A,$3A,$FB,$FB,$64,$69,
$42,$AE,$8C,$F6,$F6,$EC,$A6,$93,$4B,$76,$86,$C5,$20,$7E,$2A,$BB,
$8D,$07,$9A,$A9,$2D,$63,$82,$D5,$6A,$47,$D6,$76,$3E,$C9,$73,$6C,
$0D,$29,$EB,$BF,$6A,$AA,$1E,$11,$AA,$78,$6D,$31,$17,$F1,$BB,$10,
$64,$41,$AA,$76,$52,$F0,$36,$FD,$0E,$E1,$B0,$2E,$C0,$78,$7B,$75,
$74,$E8,$FA,$F9,$95,$32,$03,$96,$EF,$E1,$5B,$62,$60,$36,$32,$52,
$F8,$6B,$45,$D2,$4B,$39,$B8,$C5,$EB,$64,$BA,$47,$40,$43,$FA,$28,
$89,$B3,$6E,$D4,$E5,$3B,$C5,$2D,$0C,$B9,$8C,$56,$B2,$37,$0B,$D2,
$8C,$DC,$01,$C9,$01,$C4,$76,$DB,$D6,$FB,$45,$0F,$D9,$A5,$1F,$51,
$6B,$F7,$BA,$D7,$4D,$0D,$21,$BF,$BA,$00,$8E,$15,$12,$9C,$5B,$09,
$CA,$01,$C9,$9B,$88,$B1,$D7,$8B,$9B,$34,$23,$7A,$31,$0F,$F6,$43,
$70,$0D,$40,$1C,$2C,$11,$E7,$EA,$00,$E0,$74,$01,$CD,$12,$4C,$13,
$44,$DC,$A8,$0C,$84,$59,$E9,$A2,$D6,$64,$21,$CF,$98,$E4,$A8,$AF,
$47,$9A,$FD,$0A,$93,$05,$FE,$61,$AF,$DC,$8D,$C3,$10,$B7,$CB,$29,
$F0,$97,$C4,$CB,$E1,$AA,$D2,$03,$7B,$03,$BE,$8A,$3E,$E2,$6B,$B7,
$1D,$D0,$D3,$93,$59,$7D,$8B,$F9,$B5,$4B,$50,$5B,$CC,$32,$4E,$46,
$EA,$B8,$C6,$2A,$18,$1C,$02,$8B,$4D,$80,$DF,$F7,$C6,$3B,$FD,$7E,
$8E,$02,$B2,$B9,$8D,$CF,$21,$36,$A7,$08,$B8,$5B,$55,$CA,$8B,$72,
$65,$FD,$13,$E7,$61,$6A,$05,$68,$06,$B7,$09,$F6,$4E,$1F,$B3,$AB,
$E2,$C1,$DB,$F0,$40,$12,$31,$FD,$47,$E0,$94,$5D,$01,$07,$89,$46,
$6F,$A4,$ED,$ED,$EA,$78,$BB,$20,$36,$0A,$0F,$56,$64,$D8,$82,$C1,
$80,$30,$F7,$60,$5D,$AA,$11,$56,$99,$8C,$8A,$A7,$68,$57,$9A,$23,
$99,$AF,$3E,$DE,$52,$57,$A6,$80,$4D,$EC,$7B,$8E,$06,$77,$88,$7F,
$92,$66,$D7,$93,$C5,$CE,$EF,$64,$36,$1D,$BE,$68,$3E,$67,$89,$CF,
$3E,$A5,$F6,$3E,$65,$EC,$DB,$61,$CE,$83,$62,$A6,$8A,$72,$E7,$B6,
$9F,$6A,$3D,$DC,$91,$DE,$DB,$08,$E7,$EC,$B9,$07,$DB,$06,$68,$81,
$8F,$DC,$A7,$79,$96,$60,$97,$EC,$2D,$BE,$EE,$39,$B8,$DE,$8A,$0F,
$48,$66,$F1,$C5,$E2,$17,$5A,$13,$94,$13,$1C,$66,$86,$DB,$29,$55,
$E2,$B8,$71,$80,$A7,$8C,$AF,$A6,$25,$1A,$A8,$71,$87,$9B,$05,$A9,
$12,$D8,$3C,$AD,$87,$50,$B9,$C2,$9E,$3E,$2E,$0E,$16,$B3,$A3,$8B,
$42,$8B,$7C,$8B,$12,$18,$A6,$9F,$0F,$45,$88,$A4,$D8,$18,$BC,$4B,
$63,$E8,$AB,$9A,$D1,$0D,$9C,$83,$7E,$99,$B4,$24,$D9,$C5,$99,$DB,
$3A,$59,$4C,$28,$C6,$A5,$A8,$D9,$B4,$C3,$3D,$6B,$E4,$97,$76,$21,
$6D,$F0,$63,$86,$58,$A6,$E9,$88,$97,$57,$9B,$BC,$7B,$53,$33,$50,
$9D,$E3,$EF,$00,$3B,$83,$0C,$E0,$6E,$06,$37,$73,$79,$53,$26,$9B,
$E9,$72,$72,$DD,$96,$EE,$C1,$10,$00,$1B,$52,$34,$16,$A0,$78,$DF,
$00,$13,$AE,$23,$1E,$8A,$2A,$63,$46,$58,$6B,$9F,$98,$E6,$9E,$3C,
$06,$1D,$40,$79,$2A,$61,$50,$94,$70,$27,$ED,$D7,$15,$A0,$F3,$37,
$A6,$D9,$29,$80,$87,$24,$F0,$8D,$98,$4C,$AD,$07,$12,$09,$ED,$7B,
$FA,$38,$80,$82,$12,$17,$C4,$1F,$E7,$EA,$39,$04,$B9,$69,$2A,$6A,
$C5,$A4,$AA,$72,$81,$27,$45,$60,$9D,$4C,$09,$DC,$37,$0D,$29,$26,
$F9,$AB,$F3,$AA,$5D,$69,$84,$D4,$2C,$5A,$E7,$94,$E9,$1C,$98,$95,
$27,$47,$73,$27,$ED,$C5,$BA,$2A,$CF,$57,$10,$44,$6D,$6F,$01,$75,
$8E,$13,$09,$F8,$80,$21,$93,$DC,$D7,$8E,$D8,$7F,$7B,$5D,$9C,$C2,
$F3,$6E,$0A,$32,$FB,$3E,$B6,$FE,$48,$84,$31,$F5,$CC,$36,$F2,$56,
$4E,$B6,$4C,$F7,$C4,$3A,$5E,$7B,$AA,$0C,$DC,$98,$B1,$F7,$4C,$B4,
$C7,$D9,$FF,$C0,$9B,$68,$A7,$1D,$83,$2A,$AF,$B1,$D3,$CC,$03,$78,
$B1,$AD,$3C,$B6,$A1,$94,$52,$CE,$2F,$24,$65,$A2,$CE,$C5,$AA,$83,
$B5,$A0,$A1,$26,$9A,$DA,$CB,$42,$B4,$18,$DB,$D2,$BC,$61,$A6,$22,
$CE,$09,$86,$AF,$A5,$93,$AF,$E0,$75,$DE,$DF,$22,$E9,$D8,$FA,$76,
$A8,$DC,$9F,$18,$B3,$F4,$67,$76,$D6,$4B,$D2,$41,$B7,$7E,$A5,$99,
$6D,$81,$86,$50,$A2,$A0,$DF,$3F,$E7,$EA,$AE,$E5,$AE,$AE,$9C,$BA,
$B1,$7D,$10,$CC,$0A,$E0,$65,$C3,$49,$2B,$A1,$A1,$22,$55,$AB,$04,
$08,$61,$0F,$06,$2C,$BA,$09,$FB,$24,$EE,$22,$0B,$F2,$82,$FB,$E5,
$0C,$31,$83,$6D,$BE,$CA,$3C,$2E,$DE,$4A,$F3,$BD,$43,$4D,$42,$51,
$5C,$1D,$CD,$E4,$48,$89,$23,$FD,$90,$1C,$3C,$34,$58,$A7,$F7,$34,
$A0,$7A,$DB,$AE,$FC,$D7,$14,$0F,$63,$D6,$22,$99,$CA,$D9,$74,$46,
$D4,$69,$09,$10,$8D,$3B,$40,$41,$39,$00,$A9,$58,$AB,$B6,$3A,$61,
$66,$C4,$30,$C8,$76,$DA,$B4,$E0,$4B,$6A,$F4,$19,$24,$4A,$78,$B0,
$66,$5E,$76,$FE,$3E,$C0,$01,$3F,$82,$13,$FC,$B5,$55,$60,$76,$A8,
$6E,$88,$87,$D8,$8C,$71,$5B,$85,$E2,$CF,$22,$A3,$28,$51,$C8,$EB,
$90,$E9,$60,$E9,$1D,$A0,$80,$4B,$59,$A8,$BE,$16,$30,$D4,$F4,$66,
$EC,$AE,$3D,$2C,$E7,$A7,$00,$A5,$85,$31,$E3,$97,$C8,$8B,$56,$B7,
$91,$D4,$E2,$B4,$A7,$9E,$27,$21,$4B,$AF,$33,$C8,$DC,$66,$72,$FD,
$03,$F2,$AF,$FE,$50,$D1,$97,$0B,$94,$28,$49,$E4,$8A,$21,$C2,$91,
$EC,$BD,$A9,$F4,$77,$49,$74,$AD,$DC,$0C,$50,$4E,$46,$96,$44,$44,
$0C,$1E,$3F,$35,$08,$30,$2C,$E5,$05,$B4,$FB,$40,$47,$B9,$8B,$26,
$EC,$57,$98,$6E,$F3,$D2,$A0,$B7,$B2,$4A,$56,$7E,$17,$C7,$0E,$49,
$B5,$5F,$32,$35,$15,$F2,$96,$F5,$AC,$03,$CF,$B4,$D9,$53,$6E,$AB,
$CF,$CA,$45,$6A,$65,$AC,$D1,$AA,$1F,$AE,$37,$14,$89,$20,$FB,$52,
$1A,$14,$B1,$86,$8F,$A2,$33,$FE,$2D,$5C,$B8,$CF,$A5,$33,$8E,$EB,
$18,$1F,$F0,$D8,$0C,$CB,$1D,$EB,$FC,$34,$46,$2F,$F4,$D0,$A9,$76,
$28,$A8,$4B,$8E,$96,$69,$20,$C7,$1E,$A8,$04,$71,$23,$37,$F4,$05,
$AD,$E8,$81,$61,$E2,$12,$CE,$3D,$78,$F0,$69,$0A,$44,$17,$7D,$AA,
$DD,$A4,$D5,$55,$7E,$34,$14,$CC,$CD,$2E,$40,$C5,$F8,$81,$A8,$95,
$06,$0E,$6F,$DD,$0D,$4D,$72,$1F,$6D,$52,$C1,$28,$17,$31,$F0,$07,
$DD,$36,$C2,$28,$EC,$59,$C4,$1F,$58,$8F,$0E,$F0,$7A,$4E,$39,$5A,
$C1,$4A,$1C,$72,$BF,$F2,$59,$04,$BF,$D9,$58,$3C,$FC,$7A,$74,$FD,
$F2,$5C,$CE,$80,$36,$95,$36,$93,$28,$EE,$71,$30,$CF,$A0,$10,$A3,
$75,$CD,$E6,$95,$89,$AB,$AE,$0C,$A8,$42,$FB,$A7,$B4,$5E,$BC,$38,
$F8,$74,$86,$E4,$E2,$C8,$BE,$76,$90,$B3,$EC,$85,$8F,$A9,$16,$A9,
$BB,$7D,$46,$97,$7C,$CB,$3C,$2A,$50,$82,$55,$6C,$0F,$06,$63,$F6,
$6D,$8E,$16,$CF,$E9,$DA,$AF,$97,$43,$81,$95,$62,$5A,$DB,$F9,$D9,
$D7,$92,$77,$A3,$C7,$D6,$82,$A0,$97,$88,$FA,$03,$64,$7D,$CE,$4D,
$0A,$28,$E9,$8C,$5D,$5D,$5C,$C4,$0B,$44,$2C,$F5,$65,$80,$54,$28,
$59,$80,$CA,$E1,$8C,$99,$10,$D4,$D7,$6A,$F6,$D5,$B8,$17,$81,$C9
);


implementation

{$R *.lfm}

{ TSquirrelMainForm }

procedure TSquirrelMainForm.PasswordNotebookChange(Sender: TObject);
begin
    CommonPhrase.SetFocus;
    if PasswordNotebook.ActivePage=SettingsSheet then begin
        validateProgramSettings;
        CodesMemo.Lines.Text:=ProgramSettings.Text;
    end;
end;

procedure TSquirrelMainForm.FormCreate(Sender: TObject);
var
  i,count:integer;
  comp:TComponent;
begin
    CovertBitmap:=nil;
    ProgramSettings:=TStringList.Create;

{$IFDEF SQUIRREL_LITE}
    Calendar.DateTime:=Now;
    getDefaultProgramSettings;
    SquirrelAboutLabel.Caption:='Squirrel Lite steganography program';
    CodesMemo.ReadOnly:=true;
{$ELSE}
    CodesMemo.ReadOnly:=false;
    if FileExists(PasswdCodesFileName) then begin
        ProgramSettings.LoadFromFile(PasswdCodesFileName);
        validateProgramSettings;
        if not UseCalendar.Checked then
            Calendar.DateTime:=Now;
    end else begin
        Calendar.DateTime:=Now;
        getDefaultProgramSettings;
    end;
{$ENDIF}

    count:=self.ComponentCount-1;
    for i:=0 to count do
    begin
        comp:=self.Components[i];
        if (comp is TEdit) and (comp.Tag>=1000) and (comp.Tag<1010) then begin
            PasswordChecksums[comp.Tag-1000]:=TEdit(comp);
        end;
    end;

    loadProgramSettingsIntoGui;

    DecryptLicence;
end;

procedure TSquirrelMainForm.FormDestroy(Sender: TObject);
begin
    FreeAndNil(ProgramSettings);
end;


procedure TSquirrelMainForm.DecryptLicence;
var
    input:array[0..15] of Byte;
    output:array[0..15] of Byte;
    i,x,count:Integer;
    passwd:AnsiString;
    outputString,blockstr,verified:AnsiString;
    cipher:TDCP_blockcipher128;
    PasswdHash:array[0..63] of byte;
begin
    passwd:='default';
    calcSHA512(passwd, PasswdHash);

    outputString:='';
    i:=0;
    count:=Sizeof(License);
    cipher:=DCP_rijndael;

    cipher.Init(PasswdHash,Sizeof(PasswdHash),nil);
    while i<count do begin
        for x:=0 to 15 do begin
            input[x]:=License[i+x];
        end;
        cipher.DecryptECB(input,output);
        SetString(blockstr,PChar(@output),SizeOf(output));
        outputString+=blockstr;
        i+=16;
    end;

    verified:=getValidString(outputString);
    AboutMemo.Lines.Text:=verified;
end;



procedure TSquirrelMainForm.HowManyChange(Sender: TObject);
begin
    PasswdEdit.Text:= CalculatePassword;
end;

function TSquirrelMainForm.getValidString(s:AnsiString):AnsiString;
var
    i,count,val:Integer;
    c:Char;
begin
    count:=Length(s);
    for i:=1 to count do begin
        c:=s[i];
        val:=Ord(c);
        if (val<32) then begin
            if (val=0) then
                break
            else if (val<>9) and (val<>10) and (val<>13) then begin
                result:='';
                Exit;
            end;
        end;
    end;
    result:=Copy(s,1,i-1);
end;


function TSquirrelMainForm.calculateQuickPassword(s:AnsiString;count:Integer):AnsiString;
var
  x,PasswdCharsCount:Integer;
  password:AnsiString;
  hash:array[0..63] of byte;
begin
    calcSHA512(s,hash);
    PasswdCharsCount:= Length(PasswdChars);

    password:='';
    for x:=0 to count do begin
        password+=PasswdChars[ hash[x] mod PasswdCharsCount ];
    end;
    result:=password;
end;

procedure TSquirrelMainForm.ImageSaveAsClick(Sender: TObject);
var
    fileName,fileNamePNG,ext,msg:AnsiString;
begin
    SaveImageDialog.FileName:= OpenFilenameEdit.Text;
    if SaveImageDialog.Execute then begin
        fileName:=SaveImageDialog.FileName;
        ext:=ToLower(ExtractFileExt(fileName));
        if (ext<>'.png') and (ext<>'.bmp') then begin
            fileNamePNG:=ChangeFileExt(fileName,'.png');
            msg:='Filename: '+NewLine+
                 fileName+NewLine+
                 'will be saved in PNG format as:'+NewLine+
                 fileNamePNG+NewLine+
                 'because '+ext+' format is not supported.';
            Application.MessageBox(PChar(msg),'Squirrel');
            fileName:=fileNamePNG;
        end;
        OpenImage.Picture.SaveToFile(fileName);
    end;
end;

procedure TSquirrelMainForm.ImportStateClick(Sender: TObject);
begin
{$IFDEF SQUIRREL_LITE}
    Application.MessageBox('This option is only available in full version of Squirrel.','Squirrel');
{$ELSE}
    if FileExists(PasswdCodesFileName) then begin
        ProgramSettings.LoadFromFile(PasswdCodesFileName);
    end;
    validateProgramSettings;
    CodesMemo.Lines.Text:=ProgramSettings.Text;
{$ENDIF}
end;

procedure TSquirrelMainForm.LoadStateButtonClick(Sender: TObject);
begin
{$IFDEF SQUIRREL_LITE}
    Application.MessageBox('This option is only available in full version of Squirrel.','Squirrel');
{$ELSE}
    if OpenStateDialog.Execute and FileExists(OpenStateDialog.Filename) then begin
        ProgramSettings.LoadFromFile(OpenStateDialog.Filename);
        validateProgramSettings;
        loadProgramSettingsIntoGui;
    end;
{$ENDIF}
end;

procedure TSquirrelMainForm.MainNotebookChange(Sender: TObject);
begin
    if MainNotebook.ActivePage=SteganographySheet then begin
        //OpenFileNameEdit.SetFocus;
    end else
    if MainNotebook.ActivePage=EncryptionSheet then begin
        EncryptButton.SetFocus;
    end else
    if MainNotebook.ActivePage=OpenTextSheet then begin
        OpenText.SetFocus;
    end else
    if MainNotebook.ActivePage=PasswordSheet then begin
        CommonPhrase.SetFocus;
    end;
end;

procedure TSquirrelMainForm.MainNotebookChanging(Sender: TObject;
  var AllowChange: Boolean);
begin

end;

procedure TSquirrelMainForm.OpenFileNameEditAcceptFileName(Sender: TObject; var Value: String);
var
    FileName:AnsiString;
begin
    FileName:=Value;
    OpenImage.Picture.LoadFromFile(FileName);

    FreeAndNil(CovertBitmap);
    CovertBitmap:=TBitmap.Create;

    CovertBitmap.Assign(OpenImage.Picture.Bitmap);
    ExposeCovertImage(RedPlane.Checked,GreenPlane.Checked,BluePlane.Checked,
                        ColourCheckBox.Checked, CovertBitmap);
    CovertImage.Picture.Assign(CovertBitmap);

    SteganoExtractAction(true);
end;

procedure TSquirrelMainForm.OpenFileNameEditChange(Sender: TObject);
begin

end;

function TSquirrelMainForm.GetPasswordCode(cb:TCheckBox):AnsiString;
begin
    result:=ProgramSettings.Values[cb.Name];
    if result='' then result:=calculateQuickPassword(cb.Name,12);
end;

procedure TSquirrelMainForm.RandomClearButtonClick(Sender: TObject);
var
    bmp:TBitmap;
begin
    if (OpenImage.Picture.Bitmap.Width=0) or (OpenImage.Picture.Bitmap.Height=0) then begin
        Application.MessageBox('There is no image to clear'+NewLine+
                               'Please load an image first.','Squirrel');
        Exit;
    end;
    bmp:=TBitmap.Create;
    bmp.Assign(OpenImage.Picture.Bitmap);
    RandomClear7bit(bmp);
    OpenImage.Picture.Assign(bmp);
    FreeAndNil(bmp);
end;

procedure TSquirrelMainForm.RedPlaneChange(Sender: TObject);
begin
    if (CovertBitmap<>nil) then begin
        CovertBitmap.Assign(OpenImage.Picture.Bitmap);
        ExposeCovertImage(RedPlane.Checked,GreenPlane.Checked,BluePlane.Checked,
                        ColourCheckBox.Checked, CovertBitmap);
        CovertImage.Picture.Assign(CovertBitmap);
    end;
end;

procedure TSquirrelMainForm.SaveStateButtonClick(Sender: TObject);
begin
{$IFDEF SQUIRREL_LITE}
    Application.MessageBox('This option is only available in full version of Squirrel.','Squirrel');
{$ELSE}
    ProgramSettings.Text:=CodesMemo.Lines.Text;
    validateProgramSettings;
    if SaveStateDialog.Execute then begin
        ProgramSettings.SaveToFile(SaveStateDialog.FileName);
    end;
    loadProgramSettingsIntoGui;
{$ENDIF}
end;

procedure TSquirrelMainForm.SquirrelImageClick(Sender: TObject);
{ var
    input:array[0..15] of Byte;
    output:array[0..15] of Byte;
    i,x,count:Integer;
    inputString,passwd:AnsiString;
    outputString,blockstr:AnsiString;
    pascalString:AnsiString;
    cipher:TDCP_blockcipher128;
    PasswdHash:array[0..63] of byte;}
begin
{    passwd:='default';
    calcSHA512(passwd, PasswdHash);

    inputString:=AboutMemo.Lines.Text;
    count:=Length(inputString);
    if count=0 then begin
        Application.MessageBox('Input plaintext is empty.','Squirrel');
        Exit;
    end;
    outputString:='';
    i:=0;

    cipher:=DCP_rijndael;
    cipher.Init(PasswdHash,Sizeof(PasswdHash),nil);

    while i<count do begin
        for x:=0 to 15 do begin
            if i+x<count then
                input[x]:=Ord(inputString[i+x+1])
            else if i+x=count then
                input[x]:=0
            else
                input[x]:=Random(256);
        end;
        cipher.EncryptECB(input,output);
        SetString(blockstr,PChar(@output),SizeOf(output));
        outputString+=blockstr;
        i+=16;
    end;

    count:=Length(outputString);
    pascalString:='[0..'+IntToStr(count-1)+']';
    i:=0;
    while i<count do begin
        if ((i mod 16)=0) then pascalString+=NewLine;
        pascalString+='$'+IntToHex(Ord(outputString[i+1]),2)+',';
        Inc(i);
    end;
    OpenText.Lines.Text:=pascalString;  }
end;

procedure TSquirrelMainForm.SteganoAlgorithmSelectionClick(Sender: TObject);
begin
    if SteganoAlgorithmSelection.ItemIndex=0 then begin
        UsePasswordCheckBox.Checked:=false;
        UsePasswordCheckBox.Enabled:=false;
    end else begin
        UsePasswordCheckBox.Enabled:=true;
    end;
end;

function TSquirrelMainForm.SteganoExtract(method:Integer; var contentType:Integer):AnsiString;
var
    output,msg,passwd:AnsiString;
    bmp:TBitmap;
    capacity,bytesRead,msgType:Integer;
    percent:double;
    rs:TRandomXStegano;
    ns:TNaiveStegano;
    st:TStegano;
    PasswdHash:array[0..63] of byte;
begin
    output:='';

    bmp:=TBitmap.Create;
    bmp.Assign(OpenImage.Picture.Bitmap);

    if method=1 then begin
        if UsePasswordCheckBox.Checked then begin
            CalculatePassword;
            Move(PasswordHash,PasswdHash,SizeOf(PasswdHash));
        end else begin
            passwd:='default';
            calcSHA512(passwd, PasswdHash);
        end;
        rs:=TRandomXStegano.Create;
        rs.Initialize(bmp,PasswdHash);
        rs.clearMark;
        st:=rs;
        ns:=nil;
    end else begin
        ns:=TNaiveStegano.Create;
        ns.Initialize(bmp);
        st:=ns;
        rs:=nil;
    end;

    capacity:=st.getCapacity;
    output:=st.ExtractMessage(msgType);
    if (rs<>nil) then rs.clearMark;

    bytesRead:=Length(output);

    FreeAndNil(bmp);
    if (rs<>nil) then FreeAndNil(rs);
    if (ns<>nil) then FreeAndNil(ns);

    if (bytesRead>0) then begin
        percent:= 100.0*bytesRead/capacity;
        msg:='Secret message has been found.'+NewLine;
        if (msgType=0) then msg+='Plaintext';
        if (msgType=1) then msg+='Encrypted';

        msg+=' message is '+IntToStr(bytesRead)+' bytes long.'+NewLine+
             'Message occupies '+FloatToStrF(percent,ffGeneral,1,3)+'% of an image.';
        Application.MessageBox(PChar(msg),'Squirrel');
    end;

    contentType:=msgType;
    result:=output;
end;

procedure TSquirrelMainForm.SteganoExtractButtonClick(Sender: TObject);
begin
    SteganoExtractAction(false);
end;

procedure TSquirrelMainForm.SteganoExtractAction(silent:boolean);
var
    output:AnsiString;
    msgType:Integer;
begin
    if (OpenImage.Picture.Bitmap.Width=0) or (OpenImage.Picture.Bitmap.Height=0) then begin
        if not silent then begin
            Application.MessageBox('Please load an image first.','Squirrel');
        end;
        Exit;
    end;

    output:=SteganoExtract(0, msgType);      // try naive method first
    if Length(output)=0 then begin
        output:=SteganoExtract(1, msgType);  // try RandomX method
    end;

    if Length(output)=0 then begin
        if not silent then begin
            Application.MessageBox('Image does not contain any message or a password is required.','Squirrel');
        end;
        Exit;
    end;

    if (msgType=1) then begin
        EncryptedText.Lines.Text:=divideStringInsertNL(EncodeStringBase64(output),80);
        MainNotebook.ActivePage:=EncryptionSheet;
    end else
    if (msgType=0) then begin
        OpenText.Lines.Text:=output;
        MainNotebook.ActivePage:=OpenTextSheet;
    end;
end;

procedure TSquirrelMainForm.SteganographyPageControlChange(Sender: TObject);
begin
    if SteganographyPageControl.ActivePage=CovertImageSheet then begin
        RedPlaneChange(Sender);
    end;
end;

procedure TSquirrelMainForm.SteganoInsertClick(Sender: TObject);
var
    input,passwd,msg:AnsiString;
    bmp:TBitmap;
    capacity,bytesTaken,msgType:Integer;
    percent:double;
    rs:TRandomXStegano;
    ns:TNaiveStegano;
    st:TStegano;
    PasswdHash:array[0..63] of byte;
begin
{$IFDEF SQUIRREL_LITE}
    if SteganoAlgorithmSelection.ItemIndex=1 then begin
        Application.MessageBox('RandomX steganography insertion is only available in full version of Squirrel.','Squirrel');
        Exit;
    end;
{$ENDIF}

    if UseEncryptedTextCheckBox.Checked then begin
        msgType:=1; // Encrypted
        input:= DecodeStringBase64(EncryptedText.Lines.Text);
    end
    else begin
        msgType:=0; // Plain text
        input:= OpenText.Lines.Text;
    end;

    if UsePasswordCheckBox.Checked then begin
        CalculatePassword;
        Move(PasswordHash,PasswdHash,SizeOf(PasswdHash));
    end else begin
        passwd:='default';
        calcSHA512(passwd, PasswdHash);
    end;

    if (OpenImage.Picture.Bitmap.Width=0) or (OpenImage.Picture.Bitmap.Height=0) then begin
        Application.MessageBox('Please load an image first.','Squirrel');
        Exit;
    end;

    bmp:=TBitmap.Create;
    bmp.Assign(OpenImage.Picture.Bitmap);

    if SteganoAlgorithmSelection.ItemIndex=1 then begin
{$IFDEF SQUIRREL_LITE}
        Exit;
{$ELSE}
        rs:=TRandomXStegano.Create;
        rs.Initialize(bmp,PasswdHash);
        rs.clearMark;
        st:=rs;
        ns:=nil;
{$ENDIF}
    end else begin
        ns:=TNaiveStegano.Create;
        ns.Initialize(bmp);
        st:=ns;
        rs:=nil;
    end;

    if (Length(input)=0) then begin
        Application.MessageBox('Message is empty. There is nothing to insert into an image.','Squirrel');
        Exit;
    end;

    capacity:=st.getCapacity;

    if (capacity=0) then begin
        Application.MessageBox('Please load an image first.','Squirrel');
        Exit;
    end;

    if ((Length(input)+7)>=capacity) then begin
        Application.MessageBox('Message is too big to fit into an image.','Squirrel');
        Exit;
    end;

    bytesTaken:=st.insertMessage(PByte(input),Length(input),msgType);
    if (rs<>nil) then rs.clearMark;

    //Final message
    percent:= 100.0*bytesTaken/capacity;
    OpenImage.Picture.Assign(bmp);
    msg:='Message has been succesfully inserted.'+NewLine+
         'Message occupies '+FloatToStrF(percent,ffGeneral,1,3)+'% of an image.';
    Application.MessageBox(PChar(msg),'Squirrel');

    if (rs<>nil) then FreeAndNil(rs);
    if (ns<>nil) then FreeAndNil(ns);
    FreeAndNil(bmp);
end;

procedure TSquirrelMainForm.TemperatureChange(Sender: TObject);
begin
    PasswdEdit.Text:= CalculatePassword;
end;

procedure TSquirrelMainForm.PasswordPageChecksumCalculate(tabPage:TTabSheet;tabIndex:integer);
var
  i,count:integer;
  comp:TComponent;
  checksum:integer;
begin
    checksum:=0;
    count:=self.ComponentCount-1;
    for i:=0 to count do
    begin
        comp:=self.Components[i];
        if (comp is TCheckbox) and (TCheckbox(comp).Parent=tabPage) and TCheckbox(comp).Checked then
            checkSum+= (1 shl (TCheckBox(comp).TabOrder));
    end;
    if (PasswordChecksums[tabIndex]<>nil) then
        PasswordChecksums[tabIndex].Text:=IntToStr(checkSum);
end;

procedure TSquirrelMainForm.PasswdCheckboxChange(Sender: TObject);
begin
    PasswordPageChecksumCalculate(PasswordNotebook.ActivePage,PasswordNotebook.TabIndex);
    PasswdEdit.Text:= CalculatePassword;
end;

procedure TSquirrelMainForm.FahrenheitChange(Sender: TObject);
var
  t:double;
begin
    t:=Temperature.Value;
    if Fahrenheit.Checked then
    begin
        TempScale.Caption:='°F';
        Temperature.MinValue:=-94;
        Temperature.MaxValue:=158;
        Temperature.Value:=Round(CelsiusToFahrenheit(t));
    end else
    begin
        TempScale.Caption:='°C';
        Temperature.MinValue:=-70;
        Temperature.MaxValue:= 70;
        Temperature.Value:=Round(FahrenheitToCelsius(t));
    end;
    PasswdCheckboxChange(Sender);
    PasswdEdit.Text:= CalculatePassword;
end;

procedure TSquirrelMainForm.DefaultStateButtonClick(Sender: TObject);
var
    i,count:integer;
    comp:TComponent;
    s:AnsiString;
begin
    getDefaultProgramSettings;
    CodesMemo.Lines.Text:=ProgramSettings.Text;
    loadProgramSettingsIntoGui;
end;

procedure TSquirrelMainForm.CopyPasswordToClipboardClick(Sender: TObject);
begin
    PasswdEdit.Text:= CalculatePassword;
    PasswdEdit.SelectAll;
    PasswdEdit.CopyToClipboard;
end;

procedure TSquirrelMainForm.CalendarChange(Sender: TObject);
begin
    PasswdEdit.Text:= CalculatePassword;
end;

procedure TSquirrelMainForm.CommonPhraseChange(Sender: TObject);
begin
    PasswdEdit.Text:= CalculatePassword;
end;

procedure TSquirrelMainForm.ClearToZeroClick(Sender: TObject);
var
    bmp:TBitmap;
begin
    if (OpenImage.Picture.Bitmap.Width=0) or (OpenImage.Picture.Bitmap.Height=0) then begin
        Application.MessageBox('There is no image to clear'+NewLine+
                               'Please load an image first.','Squirrel');
        Exit;
    end;
    bmp:=TBitmap.Create;
    bmp.Assign(OpenImage.Picture.Bitmap);
    Clear7bitToZero(bmp);
    OpenImage.Picture.Assign(bmp);
    FreeAndNil(bmp);
end;

procedure TSquirrelMainForm.CovertImageSaveAsClick(Sender: TObject);
begin
    SaveImageDialog.FileName:= OpenFilenameEdit.Text+'.7.png';
    if SaveImageDialog.Execute then begin
        CovertImage.Picture.SaveToFile(SaveImageDialog.FileName);
    end;
end;

procedure TSquirrelMainForm.DecryptButtonClick(Sender: TObject);
var
    input:array[0..15] of Byte;
    output:array[0..15] of Byte;
    i,x,count:Integer;
    inputString:AnsiString;
    outputString,blockstr,msg,verified:AnsiString;
    cipher:TDCP_blockcipher128;
begin
    CalculatePassword;
    inputString:=DecodeStringBase64(EncryptedText.Lines.Text);
    count:=Length(inputString);
    if count=0 then begin
        Application.MessageBox('encrypted message is empty.','Squirrel');
        Exit;
    end;
    outputString:='';
    i:=0;

    if      ChooseRijndael.Checked then cipher:=DCP_rijndael
    else if ChooseTwoFish.Checked  then cipher:=DCP_twofish
                                   else cipher:=DCP_serpent;

    cipher.Init(PasswordHash,Sizeof(PasswordHash),nil);
    while i<count do begin
        for x:=0 to 15 do begin
            if x+i<count then
                input[x]:=Ord(inputString[i+x+1])
            else begin
                Application.MessageBox('Wrong size of encrypted message.','Squirrel');
                Exit;
            end;
        end;
        cipher.DecryptECB(input,output);
        SetString(blockstr,PChar(@output),SizeOf(output));
        outputString+=blockstr;
        i+=16;
    end;

    verified:=getValidString(outputString);
    if Length(verified)>0 then begin
        OpenText.Lines.Text:=verified;
        msg:='Decrypted message contains '+IntToStr(Length(verified))+' characters.';
        Application.MessageBox(PChar(msg),'Squirrel');
        MainNotebook.ActivePage:=OpenTextSheet;
    end else begin
        Application.MessageBox('Decrypted message does not seem to be valid.','Squirrel');
    end;
end;

procedure TSquirrelMainForm.EncryptButtonClick(Sender: TObject);
var
    input:array[0..15] of Byte;
    output:array[0..15] of Byte;
    i,x,count:Integer;
    inputString:AnsiString;
    outputString,blockstr:AnsiString;
    cipher:TDCP_blockcipher128;
begin
    CalculatePassword;
    inputString:=OpenText.Lines.Text;
    count:=Length(inputString);
    if count=0 then begin
        Application.MessageBox('Input plaintext is empty.','Squirrel');
        Exit;
    end;
    outputString:='';
    i:=0;

    if      ChooseRijndael.Checked then cipher:=DCP_rijndael
    else if ChooseTwoFish.Checked  then cipher:=DCP_twofish
                                   else cipher:=DCP_serpent;

    cipher.Init(PasswordHash,Sizeof(PasswordHash),nil);

    while i<count do begin
        for x:=0 to 15 do begin
            if i+x<count then
                input[x]:=Ord(inputString[i+x+1])
            else if i+x=count then
                input[x]:=0
            else
                input[x]:=Random(256);
        end;
        cipher.EncryptECB(input,output);
        SetString(blockstr,PChar(@output),SizeOf(output));
        outputString+=blockstr;
        i+=16;
    end;

    EncryptedText.Lines.Text:=divideStringInsertNL(EncodeStringBase64(outputString),80);
end;

procedure TSquirrelMainForm.ExportStateButtonClick(Sender: TObject);
begin
{$IFDEF SQUIRREL_LITE}
    Application.MessageBox('This option is only available in full version of Squirrel.','Squirrel');
{$ELSE}
    if ForceDirectories(SettingsDir) then begin
        if CodesMemo.Lines.Count>1 then begin
            ProgramSettings.Text:=CodesMemo.Lines.Text;
            validateProgramSettings;
            ProgramSettings.SaveToFile(PasswdCodesFileName);
            loadProgramSettingsIntoGui;
        end;
    end;
{$ENDIF}
end;

procedure TSquirrelMainForm.validateProgramSettings;
var
    i,count:Integer;
    cname,pwd:AnsiString;
    comp:TComponent;
    settings:TStringList;
begin
    settings:=TStringList.Create;
    settings.Clear;

    settings.Add('[PasswordState]');
    count:=self.ComponentCount-1;
    for i:=0 to count do begin
        comp:=self.Components[i];
        if (Comp.Tag=9) then begin
            cname:= '_'+comp.Name;
            if (comp is TCheckbox) and TCheckbox(comp).Checked then begin
                settings.Add(cname+'=1');
            end else if (comp is TSpinEditEx) then begin
                settings.Add(cname+'='+TSpinEditEx(comp).Text);
            end;
        end;
    end;

    if (UseCalendar.Checked) then begin
        settings.Add(Calendar.Name+'='+FloatToStr( Calendar.DateTime ));
    end;

    settings.Add(CommonPhrase.Name+'='+CommonPhrase.Text);

    settings.Add('[Misc]');
    settings.Add('ProgramCaption'+'='+self.Caption);


    settings.Add('[PasswordCodes]');
    for i:=0 to count do begin
        comp:=self.Components[i];
        if (Comp.Tag=9) then begin
            if (comp is TCheckbox) then begin
                cname:=comp.Name;
                pwd:=GetPasswordCode(TCheckBox(comp));
                settings.Add(cname+'='+pwd);
            end;
        end;
    end;

    ProgramSettings.Text:=settings.Text;
    FreeAndNil(settings);
end;

procedure TSquirrelMainForm.getDefaultProgramSettings;
var
    i,count:Integer;
    cname:AnsiString;
    comp:TComponent;
begin
    ProgramSettings.Clear;

    ProgramSettings.Add('[PasswordState]');

    count:=self.ComponentCount-1;
    for i:=0 to count do begin
        comp:=self.Components[i];
        if (Comp.Tag=9) then begin
            cname:= '_'+comp.Name;
            if (comp is TSpinEditEx) then begin
                ProgramSettings.Add(cname+'='+TSpinEditEx(comp).Text);
            end;
        end;
    end;

    ProgramSettings.Add(CommonPhrase.Name+'='+'squirrel');

    ProgramSettings.Add('[Misc]');
    ProgramSettings.Add('ProgramCaption'+'='+'Squirrel');

    ProgramSettings.Add('[PasswordCodes]');
    for i:=0 to count do begin
        comp:=self.Components[i];
        if (Comp.Tag=9) then begin
            if (comp is TCheckbox) then begin
                cname:=comp.Name;
                ProgramSettings.Add(cname+'='+calculateQuickPassword(cname,12));
            end;
        end;
    end;

end;

procedure TSquirrelMainForm.loadProgramSettingsIntoGui;
var
    i,count:Integer;
    cname,s:AnsiString;
    comp:TComponent;
begin
    count:=self.ComponentCount-1;
    for i:=0 to count do begin
        comp:=self.Components[i];
        if (Comp.Tag=9) then begin
            if (comp is TCheckbox) then begin
                cname:='_'+comp.Name;
                s:=ProgramSettings.Values[cname];
                if (s='1')
                    then TCheckbox(comp).Checked:=true
                    else TCheckbox(comp).Checked:=false;
            end;
        end;
    end;

    if UseCalendar.Checked then begin
        Calendar.DateTime:=StrToFloat(ProgramSettings.Values[Calendar.Name]);
    end;

    s:=ProgramSettings.Values[Temperature.Name];
    if s<>'' then Temperature.Text:=s;

    s:=ProgramSettings.Values[HowMany.Name];
    if s<>'' then HowMany.Text:=s;

    s:=ProgramSettings.Values['CommonPhrase'];
    if s<>'' then CommonPhrase.Text:=s;

    s:=ProgramSettings.Values['ProgramCaption'];
    if s<>'' then self.Caption:=s;
end;

function TSquirrelMainForm.CalculatePassword:AnsiString;
var
    inputString,strhash:AnsiString;
    i,count:integer;
    PasswdCharsCount:Integer;
    password:AnsiString;
    comp:TComponent;
begin
    FillByte(PasswordHash,SizeOf(PasswordHash),0);

    inputString:=CommonPhrase.Text;
    if UseCalendar.Checked then begin
        inputString+=FormatDateTime( '_yyyy/mm/dd_', Calendar.DateTime );
    end;
    count:=self.ComponentCount-1;
    for i:=0 to count do begin
        comp:=self.Components[i];
        if (Comp.Tag=9) then begin
            if (comp is TCheckbox) and TCheckbox(comp).Checked then
                inputString+=GetPasswordCode(TCheckBox(comp))
            else if (comp is TSpinEditEx) then
                inputString+=TSpinEditEx(comp).Text;
        end;
    end;

    calcSHA512(inputString, PasswordHash);

    strhash:='';
    for i:=0 to 31 do begin
        strhash+=IntToHex(PasswordHash[i],2);
    end;

    PasswdHexEdit.Text:=strhash;

    PasswdCharsCount:= Length(PasswdChars);
    password:='';

    for i:=0 to 31 do begin
        password+=PasswdChars[ PasswordHash[i] mod PasswdCharsCount ];
    end;

    result:=password;
end;

procedure TSquirrelMainForm.calcSHA512(s:AnsiString; var hash:array of byte);
var
    DCP_sha512:TDCP_sha512;
begin
    DCP_sha512:=TDCP_sha512.Create(self);
    DCP_sha512.Init;
    DCP_sha512.Update(PChar(s)^,Length(s));
    DCP_sha512.Final(hash);
    FreeAndNil(DCP_sha512);
end;

function TSquirrelMainForm.divideStringInsertNL(input:AnsiString;lineLength:Integer):AnsiString;
var
    i,count:Integer;
    s:AnsiString;
begin
    s:='';
    i:=1;
    count:=Length(input);
    while i<count do begin
        if i>1 then s+=NewLine;
        s+=Copy(input,i,lineLength);
        i+=lineLength;
    end;
    result:=s;
end;

function TSquirrelMainForm.CelsiusToFahrenheit(tc:double):double;
begin
    result:= (tc*9.0/5.0)+32;
end;

function TSquirrelMainForm.FahrenheitToCelsius(tf:double):double;
begin
    result:= ((tf-32.0)*5.0)/9.0;
end;

end.

