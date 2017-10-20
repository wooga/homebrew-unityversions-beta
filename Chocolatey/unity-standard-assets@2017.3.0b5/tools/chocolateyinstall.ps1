$ErrorActionPreference = 'Stop';

$packageName    = 'unity-standard-assets@2017.3.0b5'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/af76f56822bf/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup-2017.3.0b5.exe'
$checksum64     = '24c50a11aced81208c7e44397d2d9822c2d7708d9fba90326564c2ae7a19dbbf'

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
