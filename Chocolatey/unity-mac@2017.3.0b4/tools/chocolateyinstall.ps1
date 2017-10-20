$ErrorActionPreference = 'Stop';

$packageName    = 'unity-mac@2017.3.0b4'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/4c1b6e48c9c9/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-2017.3.0b4.exe'
$checksum64     = 'fc97ab4d1a4b0af62dab28bc1798cc7770670e63ddfb75b12cedb1d193ea3b61'

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
