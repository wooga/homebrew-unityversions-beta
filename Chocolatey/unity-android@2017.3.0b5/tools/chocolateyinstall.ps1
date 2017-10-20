$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android.2017.3.0b5'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/af76f56822bf/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2017.3.0b5.exe'
$checksum64     = '0850837ae2f6a231f57c2c1de1c6373101e93f28c74d508638480126fc7ea15e'

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
