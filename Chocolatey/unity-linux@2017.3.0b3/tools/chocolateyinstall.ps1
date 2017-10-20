$ErrorActionPreference = 'Stop';

$packageName    = 'unity-linux.2017.3.0b3'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/28dc7ce05bb9/TargetSupportInstaller/UnitySetup-Linux-Support-for-Editor-2017.3.0b3.exe'
$checksum64     = '169e6bba394b361dd25fb29511455bfb32622a22bff7e09e1536e13c7c5a7736'

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
