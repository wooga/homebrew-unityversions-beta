$ErrorActionPreference = 'Stop';

$packageName    = 'unity-webgl.2017.3.0b5'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/af76f56822bf/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-2017.3.0b5.exe'
$checksum64     = 'f3718d8eef2325cf3b6c3a037e62f6b3d267e8753c29a737afcd46b4cabf9217'

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
