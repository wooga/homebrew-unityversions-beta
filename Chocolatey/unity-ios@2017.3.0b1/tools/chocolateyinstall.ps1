$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios.2017.3.0b1'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/bc2668834c45/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2017.3.0b1.exe'
$checksum64     = 'b54305ca2969596941ff10ca9a1a22f7328acccc43ec19bffc4aeda2e7fc053c'

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
