$ErrorActionPreference = 'Stop';

$packageName        = 'unity.2017.1.0b7'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/8a1ad67dc191/Windows64EditorInstaller/UnitySetup64-2017.1.0b7.exe'
$checksum64         = '3204dec633aa1e0f5d6a0536d19e99b8d36dfca3ba0d1e6bb303f38251a54618'

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
