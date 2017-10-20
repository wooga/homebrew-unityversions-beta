$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android@2017.3.0b4'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/4c1b6e48c9c9/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2017.3.0b4.exe'
$checksum64     = '614eca0c1627b22a1f328255001f4ab1ffb6e186205d67e7b490ba8ef3b00ded'

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
