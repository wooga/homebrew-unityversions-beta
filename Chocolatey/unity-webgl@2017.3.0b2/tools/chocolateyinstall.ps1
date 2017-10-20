$ErrorActionPreference = 'Stop';

$packageName    = 'unity-webgl.2017.3.0b2'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/ec6e8c8c3015/TargetSupportInstaller/UnitySetup-WebGL-Support-for-Editor-2017.3.0b2.exe'
$checksum64     = '691a8657bec69fe6965a099aa77bd71ef7e602b93a9da201b95f7c011ffbb76f'

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
