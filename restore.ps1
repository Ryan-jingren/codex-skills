param([string]$Destination)
$ErrorActionPreference = 'Stop'
$bundle = Join-Path $PSScriptRoot 'codex-skills-backup.zip'
if (-not (Test-Path -LiteralPath $bundle)) { throw 'Keep the ZIP and restore.ps1 in the same folder.' }
$stage = Join-Path ([IO.Path]::GetTempPath()) ('codex-skills-restore-' + [guid]::NewGuid().ToString('N'))
Expand-Archive -LiteralPath $bundle -DestinationPath $stage
$payload = Join-Path $stage 'my-codex-skills'
$manifest = Get-Content -LiteralPath (Join-Path $payload 'manifest.json') -Raw -Encoding UTF8 | ConvertFrom-Json
$payloadBase = [IO.Path]::GetFullPath($payload) + [IO.Path]::DirectorySeparatorChar
foreach ($entry in $manifest.files) {
    $candidate = [IO.Path]::GetFullPath((Join-Path $payload $entry.path))
    if (-not $candidate.StartsWith($payloadBase, [StringComparison]::OrdinalIgnoreCase)) { throw 'Invalid manifest path.' }
    if ((Get-FileHash -LiteralPath $candidate -Algorithm SHA256).Hash.ToLower() -ne $entry.sha256) { throw "Checksum failed: $($entry.path)" }
}
if ($Destination) { & (Join-Path $payload 'install.ps1') -Destination $Destination }
else { & (Join-Path $payload 'install.ps1') }
Write-Host "Verified $($manifest.files.Count) skill files. Extracted copy: $payload"
