param([Parameter(Mandatory)][ValidatePattern("^[a-z0-9\-]+$")][string]$Handle, [string]$Name = $Handle)
$ErrorActionPreference="Stop"
$Repo = Split-Path -Parent $PSScriptRoot
$Dir = Join-Path $Repo ("contributors\" + $Handle)
if(!(Test-Path $Dir)){ New-Item -ItemType Directory -Force -Path $Dir | Out-Null }
$Profile = Join-Path $Dir "profile.json"
if(!(Test-Path $Profile)){ @{name=$Name;handle=$Handle;createdUtc=(Get-Date).ToUniversalTime().ToString("o")} | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 $Profile }
$Path = Join-Path $Dir "ONBOARDING_CHECKLIST.md"
$L=@(
  "# " + $Name + " — Onboarding Checklist (@" + $Handle + ")",
  "",
  "> **Goal:** feel inspired, find your way around CoSuite, then ship one tiny *build*.",
  "> If anything is rough, your first PR is to improve this repo/checklist for the next person.",
  "",
  "## 1) Inspire (start here, 10–20 min)",
  "- [ ] Read the ethos: **no corruption · no coercion · no crowns**.",
  "- [ ] Skim the repo **README**.",
  "- [ ] One-sentence idea you care about:",
  "  - _My sentence:_ _______________________________________",
  "",
  "## 2) Navigate (map the terrain, 15–30 min)",
  "- [ ] Read **onboarding/Contributor-Guide.md**.",
  "- [ ] Peek at **contributors/**.",
  "- [ ] Skim **tools/** helpers:",
  "  - `Add-Contributor.ps1` — makes your folder",
  "  - `New-AdviceBomb.ps1` — zip-first packaging (optional)",
  "  - `New-CoSyncNote.ps1` — date-stamped trail note",
  "- [ ] (Optional) **training/README.md**",
  "- [ ] Handy: **docs/KEYBOARD_SURVIVAL.md**",
  "",
  "## 3) Optional familiarization",
  "- [ ] If curious about the zip-first pattern, browse `training/README.md`.",
  "",
  "## 4) First BUILD (preferred)",
  "- [ ] Pick a tiny change.",
  "- [ ] Create a branch: `contributors/" + $Handle + "-first-build`",
  "- [ ] Make the change and add a CoSync note:",
  "  - `tools/New-CoSyncNote.ps1 -Intent ""@" + $Handle + " first-build: <what>"" -OutDir ""contributors/" + $Handle + """`",
  "- [ ] Commit & open PR.",
  "",
  "## 5) After merge",
  "- [ ] Pull `main` (or confirm in GitHub UI).",
  "- [ ] Improve this page (clarify a step, add a tip)."
)
Set-Content -Encoding UTF8 $Path $L
Write-Host ("Checklist written: " + $Path)
