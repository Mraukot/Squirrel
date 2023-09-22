//------------------------------------------------------------------------------
//--------- Copyright (c) 2021..2023, Mraukot. All rights reserved. ------------
//------------------------------------------------------------------------------
unit BitmapOperations;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Graphics;


const
    //platform dependent mask values
    shiftR=16; // red shift
    shiftG=8;  // green shift
    shiftB=0;  // blue shift

type
    TXorShiftState = record
        a, b, c, d:Dword;
    end;

    TXorWowState = record
        a, b, c, d, e:Dword;
        counter:Dword;
    end;

    TStegano = class(TObject)
    private
        bmp:TBitmap;
        xMax,yMax,xSize,ySize,count:Integer;
        rndB:TXorShiftState;
        rows:array of PDword;
    public
        procedure Initialize(b:TBitmap);
        function  getNextPixelAddress:PDword; virtual; abstract;
        function  getCapacity:Integer; virtual; abstract;

        procedure write3Bit(b:Byte);
        procedure writeByte(b:Byte);
        procedure write3Byte(v:Integer);
        procedure writeInteger(v:Integer);

        function  read3Bit:Byte;
        function  readByte:Byte;
        function  read3Byte:Integer;
        function  readInteger:Integer;

        function  getCount:Integer;

        function  insertMessage(buffer:PByte;length,msgType:Integer):Integer;
        function  extractMessage(var msgType:Integer):AnsiString;
    end;

    TNaiveStegano = class(TStegano)
    private
        currX,currY:Integer;
    public
        procedure Initialize(b:TBitmap);
        function  getNextPixelAddress:PDword; override;
        function  getCapacity:Integer; override;
    end;

    TRandomXStegano = class(TStegano)
    private
        rndX,rndY:TXorShiftState;
    public
        procedure Initialize(b:TBitmap; passwdHash:array of byte);
        function  getNextPixelAddress:PDword; override;
        function  getCapacity:Integer; override;
        procedure clearMark;
    end;

function XorShift128(var state:TXorShiftState):Dword;
function XorWow(var state:TXorWowState):Dword;

procedure ExposeCovertImage(useR,useG,useB,displayColour:boolean; var bmp:TBitmap);
procedure Clear7bitToZero(var bmp:TBitmap);
procedure RandomClear7bit(var bmp:TBitmap);

function Extract3bit(color:Dword):Byte;
function Insert3bit(color:Dword; value:Byte):Dword;

function calculateChecksum(buffer:PByte;length:Integer):Integer;


implementation

function calculateChecksum(buffer:PByte;length:Integer):Integer;
const
    prime:array[0..25] of Dword=(
        1,   2,  3,  5,  7, 11, 13, 17, 19, 23,
        29, 31, 37, 41, 43, 47, 53, 59, 61, 67,
        71, 73, 79, 83, 89, 97);
var
    i,v,bv,count:Dword;
    b:PByte;
begin
    count:=length-1;
    v:=0;
    for i:=0 to count do begin
        b:=buffer+i;
        bv:=b^;
        v:= v + (bv*prime[(i mod 25)]);
    end;
    result:=v;
end;

function XorShift128(var state:TXorShiftState):Dword;
var
    t,s:Dword;
begin
    t:=state.d;
    s:=state.a;
    state.d:=state.c;
    state.c:=state.b;
    state.b:=s;
    t:=t xor (t shl 11);
    t:=t xor (t shr 8);
    state.a:= t xor s xor (s shr 19);
    result:=state.a;
end;

function XorWow(var state:TXorWowState):Dword;
var
    t,s:Dword;
begin
    t:= state.e;
    s:= state.a;

    state.e:=state.d;
    state.d:=state.c;
    state.c:=state.b;
    state.b:=s;

    t:= t xor (t shr 2);
    t:= t xor (t shl 1);
    t:= s xor (s shl 4);
    state.a:=t;
    state.counter+=362437;
    result:=t+state.counter;
end;

function GetMask(useColour:Boolean; shift:Dword):Dword;
begin
    if useColour then result:= (1 shl shift)
                 else result:=0;
end;

function Extract3bit(color:Dword):Byte;
var
    bitR,bitG,bitB:Byte;
begin
    bitR:= (color and (1 shl shiftR)) shr shiftR;
    bitG:= (color and (1 shl shiftG)) shr shiftG;
    bitB:= (color and (1 shl shiftB)) shr shiftB;
    result:= bitR or (bitG shl 1) or (bitB shl 2);
end;

function Insert3bit(color:Dword; value:Byte):Dword;
var
    netColor,bitR,bitG,bitB:Dword;
begin
    netColor:= color and $FFFEFEFE;
    bitR:= value and 1;
    bitG:=(value and 2) shr 1;
    bitB:=(value and 4) shr 2;
    result:= netColor or (bitR shl shiftR) or (bitG shl shiftG) or (bitB shl shiftB);
end;

procedure ExposeCovertImage(useR,useG,useB,displayColour:boolean; var bmp:TBitmap);
var
    x,y,xMax,yMax:Integer;
    pf:TPixelFormat;
    col,colR,colG,colB,colIdx:Dword;
    maskR,maskG,maskB:Dword;
    currRow:PDword;
    currPix:PDword;
    ArrayCol:array[0..7] of Dword;
begin
    xMax:=bmp.Width-1;
    yMax:=bmp.Height-1;
    pf:=bmp.PixelFormat;

    maskR:= GetMask(useR,shiftR);
    maskG:= GetMask(useG,shiftG);
    maskB:= GetMask(useB,shiftB);

    //prepare array of colours:
    if displayColour then begin
        for colR:=0 to 1 do
            for colG:=0 to 1 do
                for colB:=0 to 1 do begin
                    col:=0;
                    if colR<>0 then col+= ($FF shl shiftR);
                    if colG<>0 then col+= ($FF shl shiftG);
                    if colB<>0 then col+= ($FF shl shiftB);
                    ArrayCol[colB+colR*2+colG*4]:=col;
                end;
    end else begin
        for colR:=0 to 1 do
            for colG:=0 to 1 do
                for colB:=0 to 1 do begin
                    col:=(colB+colR*2+colG*4)*32;
                    ArrayCol[colB+colR*2+colG*4]:=
                        (col shl shiftR) or (col shl shiftG) or (col shl shiftB);
                end;
    end;

    //start updating the bitmap
    bmp.BeginUpdate();

    if (pf=pf24bit) or (pf=pf32bit) then begin
        for y:=0 to yMax do begin
            currRow:=bmp.ScanLine[y];
            for x:=0 to xMax do begin
                currPix:=PDword(currRow+x);

                col:= currPix^;
                colR:= (col and maskR) shr shiftR;
                colG:= (col and maskG) shr shiftG;
                colB:= (col and maskB) shr shiftB;
                colIdx:= colB + (colR shl 1) + (colG shl 2);

                col:= ArrayCol[colIdx];
                currPix^:=col;
            end;
        end;
    end;

    bmp.EndUpdate();

end;

procedure Clear7bitToZero(var bmp:TBitmap);
var
    x,y,xMax,yMax:Integer;
    pf:TPixelFormat;
    col:Dword;
    currRow:PDword;
    currPix:PDword;
begin
    xMax:=bmp.Width-1;
    yMax:=bmp.Height-1;
    pf:=bmp.PixelFormat;
    bmp.BeginUpdate();
    if ((pf=pf24bit) or (pf=pf32bit)) and (bmp.Width>0) and (bmp.Height>0) then begin
        for y:=0 to yMax do begin
            currRow:=bmp.ScanLine[y];
            for x:=0 to xMax do begin
                currPix:=PDword(currRow+x);
                col:= currPix^;
                col:= col and $00FEFEFE;
                currPix^:=col;;
            end;
        end;
    end;
    bmp.EndUpdate();
end;

procedure RandomClear7bit(var bmp:TBitmap);
var
    i,x,y,xSize,ySize,count:Integer;
    pf:TPixelFormat;
    currPix:PDword;
    arr:array[0..15] of Byte;
    rndX,rndY:TXorShiftState;
    rows:array of PDword;
begin
    xSize:=bmp.Width;
    ySize:=bmp.Height;
    count:=xSize*ySize*20 div 100; // 20% of an image

    pf:=bmp.PixelFormat;

    if ((pf=pf24bit) or (pf=pf32bit)) and (xSize>0) and (ySize>0) then begin
        Randomize;
        for x:=0 to 15 do arr[x]:=Random(256);
        Move(arr,rndX,SizeOf(rndX));
        for x:=0 to 15 do arr[x]:=Random(256);
        Move(arr,rndY,SizeOf(rndY));

        bmp.BeginUpdate();
        SetLength(rows,ySize);
        for y:=0 to ySize-1 do begin
            rows[y]:=bmp.ScanLine[y];
        end;
        for i:=0 to count do begin
            x:=XorShift128(rndX) mod xSize;
            y:=XorShift128(rndY) mod ySize;
            currPix:=PDword(rows[y]+x);
            currPix^ :=Insert3bit( currPix^, Random(8) );
        end;
        bmp.EndUpdate();
    end;
end;

procedure TStegano.Initialize(b:TBitmap);
var
    y:Integer;
begin
    bmp:=b;
    count:=0;
    xSize:=bmp.Width;
    ySize:=bmp.Height;
    xMax:= xSize-1;
    yMax:= ySize-1;
    FillByte(rndB,SizeOf(rndB),0);
    SetLength(rows,yMax+1);
    for y:=0 to yMax do begin
        rows[y]:=PDword(bmp.ScanLine[y]);
    end;
end;

procedure TNaiveStegano.Initialize(b:TBitmap);
begin
    currX:=0;
    currY:=0;
    inherited Initialize(b);
end;

function TNaiveStegano.getNextPixelAddress:PDword;
begin
    result:= PDword(rows[currY]+currX);
    inc(currX);
    if currX>xMax then begin
        currX:=0;
        inc(currY);
    end;
end;
procedure TStegano.write3Bit(b:Byte);
var
    a:PDword;
    b2:Byte;
begin
    b2:=(XorShift128(rndB) xor b) and 7;
    a  :=getNextPixelAddress;
    a^ :=Insert3bit( a^, b2 );
end;

procedure TStegano.writeByte(b:Byte);
var
    a:PDword;
    i:Integer;
    b2:Dword;
begin
    b2:=XorShift128(rndB) xor b; // 9nth bit is random
    for i:=0 to 2 do begin
        a  :=getNextPixelAddress;
        a^ :=Insert3bit( a^, ((b2 shr (i*3)) and $FF) );
    end;
    count+=1;
end;

procedure TStegano.write3Byte(v:Integer);
var
    a:PDword;
    i:Integer;
    v2:Dword;
begin
    v2:=XorShift128(rndB) xor v;
    for i:=0 to 7 do begin
        a  :=getNextPixelAddress;
        a^ :=Insert3bit( a^, ((v2 shr (i*3)) and $FF) );
    end;
    count+=3;
end;

procedure TStegano.writeInteger(v:Integer);
var
    a:PDword;
    i,v2:Dword;
begin
    v2:=XorShift128(rndB) xor v;
    for i:=0 to 9 do begin
        a  :=getNextPixelAddress;
        a^ :=Insert3bit( a^, ((v2 shr (i*3)) and $FF) );
    end;
    a  :=getNextPixelAddress;
    a^ :=Insert3bit( a^, (((v2 shr (30))+ (random(2) shl 2)) and $FF) );
    count+=4;
end;

function  TStegano.read3Bit:Byte;
var
    a:PDword;
begin
    a:= getNextPixelAddress;
    result:= (Extract3bit(a^) xor XorShift128(rndB)) and 3;
end;

function  TStegano.readByte:Byte;
var
    a:PDword;
    i,v:Dword;
begin
    v:=0;
    for i:=0 to 2 do begin
        a:= getNextPixelAddress;
        v+= (Extract3bit(a^) shl (i*3));
    end;
    v:=(v and $FF) xor (XorShift128(rndB) and $FF);
    count+=1;
    result:=v;
end;

function TStegano.read3Byte:Integer;
var
    a:PDword;
    i,v:Integer;
begin
    v:=0;
    for i:=0 to 7 do begin
        a:= getNextPixelAddress;
        v+= (Extract3bit(a^) shl (i*3));
    end;
    count+=3;
    result:=v xor (XorShift128(rndB) and $FFFFFF);
end;

function TStegano.readInteger:Integer;
var
    a:PDword;
    i,v:Integer;
begin
    v:=0;
    for i:=0 to 9 do begin
        a:= getNextPixelAddress;
        v+= (Extract3bit(a^) shl (i*3));
    end;
    a:= getNextPixelAddress;
    v+= ((Extract3bit(a^) and 3) shl (30));
    count+=4;
    result:=v xor XorShift128(rndB);
end;

function TStegano.getCount:Integer;
begin
    result:=count;
end;

procedure TRandomXStegano.Initialize(b:TBitmap; passwdHash:array of byte);
begin
    Move( passwdHash, rndX, SizeOf(rndX) );
    Move( PByte(PByte(passwdHash)+SizeOf(rndX))^, rndY, SizeOf(rndY) );
    inherited Initialize(b);
    Move( PByte(PByte(passwdHash)+SizeOf(rndX)+SizeOf(rndY))^, rndB, SizeOf(rndB) );
end;

function  TRandomXStegano.getNextPixelAddress:PDword;
var
    x,y:Integer;
    p:PDword;
    col:Dword;
begin
    repeat
        x:=XorShift128(rndX) mod xSize;
        y:=XorShift128(rndY) mod ySize;
        p:= PDword(rows[y]+x);
        col:=p^;
        if ((col and $FF000000)=0) then begin
            p^ := col or $01000000; // mark as used
            result:=p;
            break;
        end;
    until false;
end;

procedure TRandomXStegano.clearMark;
var
    x,y:Integer;
    p,line:PDword;
begin
    for y:=0 to yMax do begin
        line:= rows[y];
        for x:=0 to xMax do begin
            p:= PDword(line)+x;
            p^:= p^ and $00FFFFFF;
        end;
    end;
end;

function  TRandomXStegano.getCapacity:Integer;
begin
    result:=(xSize*ySize*3*7) div (9*10); // 9-it takes 9 bits for a byte,because it is easier
    // each byte then starts from new rgb triplet, and no additional state is required.
end;

function  TNaiveStegano.getCapacity:Integer;
begin
    result:= (xSize*ySize*3) div 9;
end;

function TStegano.insertMessage(buffer:PByte;length,msgType:Integer):Integer;
var
    x,i:Integer;
    b:PByte;
begin
    write3Byte(length);
    write3Bit(msgType);
    i:=0;
    x:=length;
    while x>0 do begin
        b:= PByte(PByte(buffer)+i);
        writeByte(b^);
        x-=1;
        i+=1;
    end;
    x:=calculateChecksum(buffer,length) and $FFFFFF;
    write3Byte(x);
    result:=GetCount;
end;

function TStegano.extractMessage(var msgType:Integer):AnsiString;
var
    x,i,length,actualChecksum,calculatedChecksum:Integer;
    b,buffer:PByte;
    output:AnsiString;
begin
    output:='';
    length:=read3Byte;
    msgType:=read3Bit;
    i:=0;
    x:=length;
    if length<=getCapacity then begin
        buffer:=GetMem(length+1);
        while x>0 do begin
            b:= PByte(PByte(buffer)+i);
            b^:= readByte;
            x-=1;
            i+=1;
        end;
        b:= PByte(PByte(buffer)+i);
        b^:=0;

        actualChecksum:=read3Byte;
        if (length<>0) then begin
            calculatedChecksum:=calculateChecksum(buffer,length) and $FFFFFF;
            if actualChecksum=calculatedChecksum then begin
                SetString(output, PChar(buffer), length);
            end;
        end;
        FreeMem(buffer);
    end;
    result:=output;
end;


end.

