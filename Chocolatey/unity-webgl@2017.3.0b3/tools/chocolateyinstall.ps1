$ErrorActionPreference = 'Stop';

$packageName    = 'unity-webgl.2017.3.0b3'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/28dc7ce05bb9/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-2017.3.0b3.exe'
$checksum64     = '8bb9e821f6a9e5cb28ff625abc872fc8deb6793acebbe5261be3e24d1a40e469'

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
