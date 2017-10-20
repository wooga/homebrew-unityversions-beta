﻿$ErrorActionPreference = 'Stop';

$packageName        = 'unity.2017.3.0b4'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/4c1b6e48c9c9/Windows64EditorInstaller/UnitySetup64-2017.3.0b4.exe'
$checksum64         = '4f882c080a52f523ac45de0e60ec6bcec069877ac6afc220bae1fd125390434d'

$args = '/S'

$pp = Get-PackageParameters
if ($pp.InstallationPath) {
    $args += " /D=$($pp.InstallationPath)"
    Write-Host "Param: Installing to $($pp.InstallationPath)"
}

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'Unity'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = $args
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
