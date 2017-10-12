{ mkDerivation, base, binary, byteorder, bytestring, containers
, network, parsec, stdenv, stm, Xauth
}:
mkDerivation {
  pname = "xhb";
  version = "0.6.2015.8.1";
  sha256 = "1rq6g96v1fs66kdmnkvlkcxrv614ha77czclm3sfw274f7q2r2kb";
  libraryHaskellDepends = [
    base binary byteorder bytestring containers network parsec stm
    Xauth
  ];

  patchPhase = ''
    substituteInPlace Graphics/XHB/Shared.hs --replace 'import Data.Binary.Put' 'import Data.Binary.Put hiding (putInt32host, putInt16host, putInt8)'
    substituteInPlace Graphics/XHB/Shared.hs --replace 'import Data.Binary.Get' 'import Data.Binary.Get hiding (getInt32host, getInt16host, getInt8)'
  '';
  
  homepage = "https://github.com/aslatter/xhb";
  description = "X Haskell Bindings";
  license = stdenv.lib.licenses.bsd3;
}
