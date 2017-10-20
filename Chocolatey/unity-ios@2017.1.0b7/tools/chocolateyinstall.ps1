$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios@2017.1.0b7'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/8a1ad67dc191/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2017.1.0b7.exe'
$checksum64     = '2f5a4bf61c165fd1c1bba21d9cd6a8001c302f3c458bc357765c8e24cb9272f6'

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
