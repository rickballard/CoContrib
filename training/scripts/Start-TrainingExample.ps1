param([Parameter(Mandatory)][ValidatePattern("^[a-z0-9\-]+$")][string]$Handle,[Parameter(Mandatory)][string]$Title)
$ErrorActionPreference="Stop"
$Repo = Split-Path -Parent $PSScriptRoot | Split-Path -Parent
$ContribRoot = Join-Path $Repo "contributors"
$Me = Join-Path $ContribRoot $Handle
if(!(Test-Path $Me)){ throw "Contributor handle not found: $Handle (run tools\\Add-Contributor.ps1 first)" }
$Work = Join-Path $Me ("training-" + (Get-Date -Format "yyyyMMdd-HHmmss"))
New-Item -ItemType Directory -Force -Path $Work | Out-Null

# Seed idea prompt
Copy-Item (Join-Path $Repo "training\\templates\\IdeaPrompt.md") (Join-Path $Work "IdeaPrompt.md") -Force

# Build AdviceBomb via repo tool
$abTitle = $Title
& (Join-Path $Repo "tools\\New-AdviceBomb.ps1") -Title $abTitle -OutDir $Work | Out-Null

# Record CoSync note (inside contributor space)
& (Join-Path $Repo "tools\\New-CoSyncNote.ps1") -Intent ("Training example: " + $abTitle) -OutDir $Me | Out-Null

$Zip = Get-ChildItem -Path $Work -Filter "AdviceBomb_*_*.zip" | Select-Object -First 1
$Sha = if($Zip){ (Get-FileHash -Algorithm SHA256 $Zip.FullName).Hash } else { "" }
Write-Host ("Workspace: " + $Work)
if($Zip){ Write-Host ("AdviceBomb: " + $Zip.FullName); Write-Host ("sha256: " + $Sha) }

Write-Host ""
Write-Host "Next steps:"
Write-Host "  - Review IdeaPrompt.md and README.md inside the AdviceBomb; iterate (CoEvo-1/2/3)."
Write-Host "  - Optionally, deliver the zip to CoCache advice inbox via a PR (per its README)."
