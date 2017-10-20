$ErrorActionPreference = 'Stop';

$packageName    = 'unity-standard-assets@2017.3.0b1'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/bc2668834c45/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup-2017.3.0b1.exe'
$checksum64     = 'ff3ea04813a8825765327ceaec626695a4723a8742aa1b71891432aa4e7bacad'

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
