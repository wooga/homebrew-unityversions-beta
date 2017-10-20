$ErrorActionPreference = 'Stop';

$packageName        = 'unity@2017.3.0b5'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/af76f56822bf/Windows64EditorInstaller/UnitySetup64-2017.3.0b5.exe'
$checksum64         = 'db540db322892dce75b26a62a91803cb660f83650bc6e84acde5c3213dce46e8'

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
