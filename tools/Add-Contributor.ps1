param([Parameter(Mandatory)][string]$Name,[Parameter(Mandatory)][ValidatePattern("^[a-z0-9\-]+$")][string]$Handle)
$ErrorActionPreference="Stop"
$Repo = Split-Path -Parent $PSScriptRoot
$ContribRoot = Join-Path $Repo "contributors"
$Me = Join-Path $ContribRoot $Handle
if (Test-Path $Me) { throw "Contributor handle already exists: $Handle" }
New-Item -ItemType Directory -Force -Path $Me | Out-Null
$md = @("# " + $Name + " — @" + $Handle, "", "Welcome! This is your personal contributor space.", "", "- Start by editing this README with one small goal.", "- When ready, commit and open a PR.")
Set-Content -Encoding UTF8 (Join-Path $Me "README.md") ($md -join "`r`n")
$profile = [ordered]@{name=$Name;handle=$Handle;createdUtc=(Get-Date).ToUniversalTime().ToString("o")}
$profile | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 (Join-Path $Me "profile.json")
git -C $Repo add ("contributors/" + $Handle + "/README.md"),("contributors/" + $Handle + "/profile.json")
Write-Host ("Added contributor folder: contributors/" + $Handle)
