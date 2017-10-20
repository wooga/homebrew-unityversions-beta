$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios.2017.3.0b4'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/4c1b6e48c9c9/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2017.3.0b4.exe'
$checksum64     = 'f0ce802a149bfca10bc95d9c815c18492a4f993da9f5e4aec8a1eb1d5dd2965f'

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
