$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios@2017.3.0b2'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/ec6e8c8c3015/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2017.3.0b2.exe'
$checksum64     = '1b74ba9d327c39b0a4a78ba9a146dc58a8460f0493ff76d1a8e61d66e35cb659'

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
