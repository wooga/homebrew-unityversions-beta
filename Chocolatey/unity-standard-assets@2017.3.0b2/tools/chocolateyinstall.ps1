$ErrorActionPreference = 'Stop';

$packageName    = 'unity-standard-assets@2017.3.0b2'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/ec6e8c8c3015/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup-2017.3.0b2.exe'
$checksum64     = 'd2452e7a7c341f4942e42da96eed5f8707fe5e2d0ed724b5dd36a9f3bac283b7'

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
