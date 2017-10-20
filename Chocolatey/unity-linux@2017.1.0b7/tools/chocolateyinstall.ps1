$ErrorActionPreference = 'Stop';

$packageName    = 'unity-linux@2017.1.0b7'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/8a1ad67dc191/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-2017.1.0b7.exe'
$checksum64     = '82239084e67209f4de971648f3ecc9189772acf92168cc4063d38bc3b2ea2c0b'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
