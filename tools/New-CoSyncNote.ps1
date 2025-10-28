param([Parameter(Mandatory)][string]$Intent,[string]$OutDir = ".")
$ErrorActionPreference="Stop"
$Utc = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")
$Dir = Join-Path $OutDir ("docs\intent\advice\notes\" + $Utc.Substring(0,8))
New-Item -ItemType Directory -Force -Path $Dir | Out-Null
$File = Join-Path $Dir ("CoSync_" + $Utc + ".md")
$body = @("# CoSync — " + $Utc, "- What changed: " + $Intent, "- Where: <paths/PRs>", "- Why: <intent>", "- Evidence: <links/checksums>", "- Next steps: <small actionable>")
Set-Content -Encoding UTF8 $File ($body -join "`r`n")
Write-Host ("CoSync note: " + $File)
