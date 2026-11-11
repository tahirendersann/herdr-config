# Repodaki Herdr ayarlarini bu bilgisayarin Herdr klasorune kopyalar.
# Kullanim:  .\install.ps1            (var olan dosyalarin yedegini alip uzerine yazar)
#            .\install.ps1 -Switch    (kopyaladiktan sonra my-main layout'una gecer)
param([switch]$Switch)

$ErrorActionPreference = "Stop"
$repo = $PSScriptRoot
$herdr = Join-Path $env:USERPROFILE ".config\herdr-app"

if (-not (Test-Path $herdr)) {
    Write-Error "Herdr ayar klasoru bulunamadi: $herdr. Once Herdr'i kurup bir kez acin."
}

$files = @(
    "layouts\my-main.json",
    "mods\my-spaces\main.js",
    "mods\my-spaces\mod.json"
)

$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
foreach ($f in $files) {
    $src = Join-Path $repo $f
    $dst = Join-Path $herdr $f
    New-Item -ItemType Directory -Force (Split-Path $dst) | Out-Null
    if (Test-Path $dst) {
        $same = (Get-FileHash $src).Hash -eq (Get-FileHash $dst).Hash
        if ($same) { Write-Host "ayni      $f"; continue }
        Copy-Item $dst "$dst.bak-$stamp"
        Write-Host "yedeklendi $f -> $(Split-Path -Leaf $dst).bak-$stamp"
    }
    Copy-Item $src $dst -Force
    Write-Host "kopyalandi $f"
}

if ($Switch) {
    herdr-app do layout.switch --% {\"name\":\"my-main\"}
}
Write-Host "Tamam. Herdr'da ctrl-shift-l ile 'my-main' layout'una gecebilirsiniz."
