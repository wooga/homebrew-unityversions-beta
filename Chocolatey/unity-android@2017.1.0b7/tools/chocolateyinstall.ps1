$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android.2017.1.0b7'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/8a1ad67dc191/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2017.1.0b7.exe'
$checksum64     = '6b02eab73eb0adc68630c839072e0a4e77edc85683b13677105d3024714dffad'

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
