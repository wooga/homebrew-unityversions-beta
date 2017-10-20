$ErrorActionPreference = 'Stop';

$packageName    = 'unity-mac@2017.3.0b3'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/28dc7ce05bb9/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-2017.3.0b3.exe'
$checksum64     = '1e209701906fe2f0a274b16c728b90df3ba48da7fb1db74c99a76ecca1aa84dd'

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
