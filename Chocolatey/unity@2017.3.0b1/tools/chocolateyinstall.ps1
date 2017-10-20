$ErrorActionPreference = 'Stop';

$packageName        = 'unity@2017.3.0b1'
$toolsDir           = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64              = 'http://beta.unity3d.com/download/bc2668834c45/Windows64EditorInstaller/UnitySetup64-2017.3.0b1.exe'
$checksum64         = '9af85183926d512349eab8844a94695a5f70a50961213a2d7e3da0abc16b8c92'

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
