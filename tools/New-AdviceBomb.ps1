param([Parameter(Mandatory)][string]$Title,[string]$OutDir = "$env:TEMP")
$ErrorActionPreference="Stop"
$T = Join-Path $OutDir ("AdviceBomb_{0}_{1}" -f ($Title -replace "\s+","-"), (Get-Date -Format "yyyyMMdd-HHmmss"))
New-Item -ItemType Directory -Force -Path $T | Out-Null
$readme = @("# AdviceBomb: " + $Title, "- Purpose: <why>", "- Contents: this README + manifest + _copayload.meta.json", "- Next: Deliver to CoCache advice inbox (PR).")
Set-Content -Encoding UTF8 (Join-Path $T "README.md") ($readme -join "`r`n")
@{ name=$Title; createdUtc=(Get-Date).ToUniversalTime().ToString("o"); files=@("README.md","_copayload.meta.json") } |
  ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 (Join-Path $T "_wrap.manifest.json")
@{ idea="<your one-sentence idea>"; author="<your-handle>"; version="coevo-1" } |
  ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 (Join-Path $T "_copayload.meta.json")
$Zip = "$T.zip"; if(Test-Path $Zip){ Remove-Item $Zip -Force }
Compress-Archive -Path (Join-Path $T "*") -DestinationPath $Zip
$sha = (Get-FileHash -Algorithm SHA256 $Zip).Hash
Set-Content -Encoding ASCII "$Zip.sha256" $sha
Write-Host "AdviceBomb ready: $Zip" ; Write-Host "sha256: $sha"
