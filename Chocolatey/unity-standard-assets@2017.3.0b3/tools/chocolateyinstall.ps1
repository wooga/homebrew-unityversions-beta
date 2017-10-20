$ErrorActionPreference = 'Stop';

$packageName    = 'unity-standard-assets@2017.3.0b3'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/28dc7ce05bb9/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup-2017.3.0b3.exe'
$checksum64     = '5244741440374967615d65c5f50f26b29bb02d04b02444ba23f3a949ecedc08a'

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
