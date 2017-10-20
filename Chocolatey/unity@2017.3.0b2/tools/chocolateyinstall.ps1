$ErrorActionPreference = 'Stop';

$packageName        = 'unity.2017.3.0b2'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/ec6e8c8c3015/Windows64EditorInstaller/UnitySetup64-2017.3.0b2.exe'
$checksum64         = '0d63a2312e905141e49087ea7fd9ef1729ada2ba5023a46d59ba31323732820e'

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
