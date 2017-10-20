$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios@2017.3.0b5'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/af76f56822bf/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2017.3.0b5.exe'
$checksum64     = 'dbd12f7944de392fb249f520cd7806c0cbfc7878b7f4bc815b0802edab960cb1'

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
