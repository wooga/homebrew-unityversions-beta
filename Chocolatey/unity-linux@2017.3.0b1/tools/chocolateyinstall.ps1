$ErrorActionPreference = 'Stop';

$packageName    = 'unity-linux.2017.3.0b1'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/bc2668834c45/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b1.exe'
$checksum64     = 'aa528179e4635892b6d208f09fe488cfba5d10720800190efdc8e761569708f9'

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
