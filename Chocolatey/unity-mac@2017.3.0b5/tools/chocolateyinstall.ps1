$ErrorActionPreference = 'Stop';

$packageName    = 'unity-mac.2017.3.0b5'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/af76f56822bf/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-2017.3.0b5.exe'
$checksum64     = 'd239c9630f04305c2356db1ad5056004a57ae47180ca466d07d2c15a8ca83d36'

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
