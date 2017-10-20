$ErrorActionPreference = 'Stop';

$packageName    = 'unity-mac.2017.3.0b2'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/ec6e8c8c3015/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-2017.3.0b2.exe'
$checksum64     = 'eabfb0a851608c655b5971dc03c517a26f2b1065d8ad480e0b75591cfd9c8ea4'

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
