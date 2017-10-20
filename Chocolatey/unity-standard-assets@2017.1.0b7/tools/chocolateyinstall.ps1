$ErrorActionPreference = 'Stop';

$packageName    = 'unity-standard-assets@2017.1.0b7'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/8a1ad67dc191/WindowsStandardAssetsInstaller/UnityStandardAssetsSetup-2017.1.0b7.exe'
$checksum64     = '1603b22b8dba433b86c0e8891e97f16f3dc7fc5ab008a723f78ca75217d6ac11'

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
