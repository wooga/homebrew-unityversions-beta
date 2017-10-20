$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios@2017.3.0b3'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/28dc7ce05bb9/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2017.3.0b3.exe'
$checksum64     = '0c3f3ef8ccc6199f707bfec4c4b1a0b3c304cf202350efa5243b7462ecf1c64b'

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
