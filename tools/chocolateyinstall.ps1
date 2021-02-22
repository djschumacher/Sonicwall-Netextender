$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\Certhelp.ps1"
Write-Host "Importing necessary certificates..."
$certificates = Get-ChildItem "$toolsPath\*.cer"
$certificates | ForEach-Object {
  Import-Certificate -FilePath $_ -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"
}

$packageName= 'sonicwallnetextender'
$fileLocation = Join-Path $toolsPath 'NXSetupU.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file         = $fileLocation

  silentArgs    = "/S /V /qn"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
