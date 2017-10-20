$ErrorActionPreference = 'Stop';

$packageName    = 'unity-standard-assets.2017.3.0b4'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/4c1b6e48c9c9/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup-2017.3.0b4.exe'
$checksum64     = '69a9ff47dc8a6dc7e1e911351d2c87d7bcd7e065c4d5271660743f336108ec37'

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
