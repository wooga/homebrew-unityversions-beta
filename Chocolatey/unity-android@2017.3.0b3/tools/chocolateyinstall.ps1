$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android.2017.3.0b3'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/28dc7ce05bb9/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2017.3.0b3.exe'
$checksum64     = 'd05ce873372266fbf1f6c68cbe0ff14afdcb8ba1e1529728a601cef7ef92deba'

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
