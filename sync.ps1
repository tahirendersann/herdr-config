# Bu bilgisayarda Herdr klasorunde yapilan degisiklikleri repoya geri alir.
# Sonra:  git diff  ->  git commit -am "..."  ->  git push
$ErrorActionPreference = "Stop"
$repo = $PSScriptRoot
$herdr = Join-Path $env:USERPROFILE ".config\herdr-app"

$files = @(
    "layouts\my-main.json",
    "layouts\my-main.svg",
    "keys.json",
    "mods\my-spaces\main.js",
    "mods\my-spaces\more-vertical.svg",
    "mods\my-spaces\mod.json"
)

foreach ($f in $files) {
    $src = Join-Path $herdr $f
    if (-not (Test-Path $src)) { Write-Warning "bulunamadi: $f"; continue }
    Copy-Item $src (Join-Path $repo $f) -Force
    Write-Host "alindi $f"
}
git -C $repo status --short
