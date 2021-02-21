$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'sonicwallnetextender'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'NXSetupU.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file         = $fileLocation

  silentArgs    = "/S /V /qn"
  validExitCodes= @(0)
}

Start-ChocolateyProcessAsAdmin Install-ChocolateyInstallPackage @packageArgs