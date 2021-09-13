library service;

uses
  pc1 in 'pc1.pas',
  CRCunit in 'CRCunit.pas',
  IDEA in 'IDEA.pas';

exports
  EncryptStream index 1,
  DecryptStream index 2,
  crypt         index 3,
  Decrypt       index 4,
  GetFileCRC    index 5;
{$R *.res}

begin
end.
