$ErrorActionPreference = 'Stop';

$packageName        = 'unity.2017.3.0b3'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/28dc7ce05bb9/Windows64EditorInstaller/UnitySetup64-2017.3.0b3.exe'
$checksum64         = '05ec2d5512c51b52f816ce63ea99cb9ebea7f6cc808b85dced5077174b1e1b00'

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
