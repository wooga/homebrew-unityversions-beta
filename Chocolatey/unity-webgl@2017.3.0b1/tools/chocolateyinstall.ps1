$ErrorActionPreference = 'Stop';

$packageName    = 'unity-webgl.2017.3.0b1'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/bc2668834c45/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-2017.3.0b1.exe'
$checksum64     = '6329c2a1e9ce7f6280cc5435ce01122ce2bcd25cd12cc8cd40e54dd04c6364d8'

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
