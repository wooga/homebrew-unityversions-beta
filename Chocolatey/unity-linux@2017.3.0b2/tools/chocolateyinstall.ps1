$ErrorActionPreference = 'Stop';

$packageName    = 'unity-linux.2017.3.0b2'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/ec6e8c8c3015/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b2.exe'
$checksum64     = '1816b2412a46b82def5e8c6ee95c9d11082370a014b92201cdfdf83c0ab42a1b'

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
