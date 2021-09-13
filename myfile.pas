unit myfile;

interface
uses Classes, dialogs, sysutils;

type

  // Define the record that will hold the person's information.
  TTblCopy = packed record
    FName: string[40];
    FType: integer;
    FSize: integer;
    FReq: boolean;

  end;

  // Create a descendant TFileStream which knows about the TTBLCopy

  TRecordStream = class(TFileStream)
  private
    function GetNumRecs: Longint;
    function GetCurRec: Longint;
    procedure SetCurRec(RecNo: Longint);
  protected
    function GetRecSize: Longint; virtual;
  public
    function SeekRec(RecNo: Longint; Origin: Word): Longint;
    function WriteRec(const Rec): Longint;
    function AppendRec(const Rec): Longint;
    function ReadRec(var Rec): Longint;
    procedure First;
    procedure Last;
    procedure NextRec;
    procedure PreviousRec;
    // NumRecs shows the number of records in the stream
    property NumRecs: Longint read GetNumRecs;
    // CurRec reflects the current record in the stream
    property CurRec: Longint read GetCurRec write SetCurRec;
  end;

implementation

function TRecordStream.GetRecSize: Longint;
begin
  { This function returns the size of the record that this stream
    knows about (TTBLCopy) }
  Result := SizeOf(TTBLCopy);
end;

function TRecordStream.GetNumRecs: Longint;
begin
  // This function returns the number of records in the stream
  Result := Size div GetRecSize;
end;

function TRecordStream.GetCurRec: Longint;
begin
  { This function returns the position of the current record. We must
    add one to this value because the file pointer is always at the
    beginning of the record which is not reflected in the equation:
    Position div GetRecSize }
  Result := (Position div GetRecSize) + 1;
end;

procedure TRecordStream.SetCurRec(RecNo: Longint);
begin
  { This procedure sets the position to the record in the stream
    specified by RecNo. }
  if RecNo > 0 then
    Position := (RecNo - 1) * GetRecSize
  else
    raise Exception.Create('Cannot go beyond beginning of file.');
end;

function TRecordStream.SeekRec(RecNo: Longint; Origin: Word): Longint;
begin
  { This function positions the file pointer to a location
    specified by RecNo }

  { NOTE: This method does not contain error handling to determine if this
    operation will exceed beyond the beginning/ending of the streamed
    file }
  Result := Seek(RecNo * GetRecSize, Origin);
end;

function TRecordStream.WriteRec(const Rec): Longint;
begin
  // This function writes the record Rec to the stream
  Result := Write(Rec, GetRecSize);
end;

function TRecordStream.AppendRec(const Rec): Longint;
begin
  // This function writes the record Rec to the stream
  Seek(0, 2);
  Result := Write(Rec, GetRecSize);
end;

function TRecordStream.ReadRec(var Rec): Longint;
begin
  { This function reads the record Rec from the stream and
    positions the pointer back to the beginning of the record }
  Result := Read(Rec, GetRecSize);
  Seek(-GetRecSize, 1);
end;

procedure TRecordStream.First;
begin
  { This function positions the file pointer to the beginning
     of the stream }
  Seek(0, 0);
end;

procedure TRecordStream.Last;
begin
  // This procedure positions the file pointer to the end of the stream
  Seek(0, 2);
  Seek(-GetRecSize, 1);
end;

procedure TRecordStream.NextRec;
begin
  { This procedure positions the file pointer at the next record
    location }

  { Go to the next record as long as it doesn't extend beyond the
    end of the file. }
  if ((Position + GetRecSize) div GetRecSize) = GetNumRecs then
    raise Exception.Create('Cannot read beyond end of file')
  else
    Seek(GetRecSize, 1);
end;

procedure TRecordStream.PreviousRec;
begin
  { This procedure positions the file pointer to the previous record
    in the stream }

    { Call this function as long as we don't extend beyond the
      beginning of the file }
  if (Position - GetRecSize >= 0) then
    Seek(-GetRecSize, 1)
  else
    raise Exception.Create('Cannot read beyond beginning of the  file.');
end;

end.
