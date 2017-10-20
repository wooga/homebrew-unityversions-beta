$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android@2017.3.0b1'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/bc2668834c45/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2017.3.0b1.exe'
$checksum64     = 'b8b762759d845837533bae03a21e67b91d863c44c6160fbd18d7e253223bbdf6'

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
