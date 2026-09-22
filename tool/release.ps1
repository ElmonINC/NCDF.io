param(
  [Parameter(Mandatory = $true)]
  [string]$Version,
  [int]$BuildNumber = 1
)

$ErrorActionPreference = 'Stop'

if ($Version -notmatch '^\d+\.\d+\.\d+$') {
  throw 'Version must use semantic versioning, for example 1.2.0.'
}

flutter pub get
flutter analyze
flutter test
flutter build windows --release --build-name=$Version --build-number=$BuildNumber
flutter build apk --release --build-name=$Version --build-number=$BuildNumber

$releaseRoot = Join-Path (Get-Location) 'dist'
$versionRoot = Join-Path $releaseRoot $Version
if (Test-Path $versionRoot) { Remove-Item $versionRoot -Recurse -Force }
New-Item -ItemType Directory -Path $versionRoot | Out-Null

$windowsSource = Join-Path (Get-Location) 'build\windows\x64\runner\Release'
$windowsArchive = Join-Path $versionRoot "ncdf-connect-windows-$Version.zip"
Compress-Archive -Path "$windowsSource\*" -DestinationPath $windowsArchive -Force
Copy-Item (Join-Path (Get-Location) 'build\app\outputs\flutter-apk\app-release.apk') (Join-Path $versionRoot "ncdf-connect-android-$Version.apk")

Write-Host "Release artifacts created in $versionRoot"