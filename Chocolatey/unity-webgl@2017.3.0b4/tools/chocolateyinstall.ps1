$ErrorActionPreference = 'Stop';

$packageName    = 'unity-webgl.2017.3.0b4'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/4c1b6e48c9c9/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-2017.3.0b4.exe'
$checksum64     = 'ec9a74d12c3f45fb08ebe20e683b8c10502e51940d93b68aa035cc050ef00821'

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
