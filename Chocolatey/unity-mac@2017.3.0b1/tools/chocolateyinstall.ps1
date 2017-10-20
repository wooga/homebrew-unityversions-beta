$ErrorActionPreference = 'Stop';

$packageName    = 'unity-mac.2017.3.0b1'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/bc2668834c45/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-2017.3.0b1.exe'
$checksum64     = '59aed792d0f9615b818501e3a89460be53c450d009547c97df7a3750173a41ff'

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
