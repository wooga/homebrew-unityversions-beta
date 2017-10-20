$ErrorActionPreference = 'Stop';

$packageName    = 'unity-linux@2017.3.0b5'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/af76f56822bf/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b5.exe'
$checksum64     = '14c0fb0c7d4e2804df65c7d549a471c03983495fe3583f9d60c82171950fb81a'

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
