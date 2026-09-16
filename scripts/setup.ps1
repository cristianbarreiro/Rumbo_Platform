$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
Push-Location $repoRoot
try {
    & git submodule sync --recursive
    if ($LASTEXITCODE -ne 0) { throw 'No se pudieron sincronizar las URLs de los submodulos.' }
    & git submodule update --init --recursive
    if ($LASTEXITCODE -ne 0) { throw 'No se pudieron descargar los submodulos. Verificar instalacion de Git y acceso a GitHub.' }
    & git submodule status --recursive
    if ($LASTEXITCODE -ne 0) { throw 'No se pudo verificar el estado de los submodulos.' }
} finally {
    Pop-Location
}
