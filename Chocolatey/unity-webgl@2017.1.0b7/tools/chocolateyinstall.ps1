$ErrorActionPreference = 'Stop';

$packageName    = 'unity-webgl.2017.1.0b7'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/8a1ad67dc191/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-2017.1.0b7.exe'
$checksum64     = '08c8adee12c5b88b5ca15240734840525be488c8a56507ab6d3c9064e49f2428'

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
