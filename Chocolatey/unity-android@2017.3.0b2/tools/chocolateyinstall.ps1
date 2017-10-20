$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android.2017.3.0b2'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/ec6e8c8c3015/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2017.3.0b2.exe'
$checksum64     = 'f96d3080c09fa99f7ff2110267f5e400a7ff488b390fa4ec7162b440d715c9e3'

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
