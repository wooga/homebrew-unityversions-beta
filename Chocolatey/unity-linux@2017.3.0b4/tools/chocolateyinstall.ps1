$ErrorActionPreference = 'Stop';

$packageName    = 'unity-linux.2017.3.0b4'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/4c1b6e48c9c9/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b4.exe'
$checksum64     = '0b9abdff256d3f84b3ec6176c8c826e5df15a2c0350c1b2d8c3ff90e2bd47bd8'

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
