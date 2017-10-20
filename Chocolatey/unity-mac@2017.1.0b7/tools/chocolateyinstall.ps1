$ErrorActionPreference = 'Stop';

$packageName    = 'unity-mac@2017.1.0b7'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'http://beta.unity3d.com/download/8a1ad67dc191/TargetSupportInstaller/UnitySetup-Mac-Support-for-Editor-2017.1.0b7.exe'
$checksum64     = 'd899f0af0947149cf54ccd1eeb33f06ba6b96ab59ad416ccdbbc870aa0ff0717'

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
