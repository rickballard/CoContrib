<!-- Elias - Onboarding Checklist (@elias) -->

# Elias – Onboarding Checklist (@elias)

! ** Goal:' feel inspired, find your way around CoSuite, then ship one tiny *build*.
* If anything is rough, your first PR is to improve this repo/checklist for the next person.


## 1) Inspire (start here, 10–20 min)
- [ ] Read the ethos: **no corruption – no coercion – no crowns**.
- [ ] Skim the repo **README** (why this exists for newcomers).
- [ ] One-sentence idea you care about:
  - _My sentence: _________________________________________________

## 2) Navigate (map the terrain, 15–30 min)
- [ ] Read **onboarding/Contributor-Guide.md**.
- [ ] Peek at **contributors/*** (structure & examples).
- [ ] Skim **tools/*** helpers:*
  - `Add-Contributor.ps1` — the folder
  - `New-AdviceBomb.ps1` — zip-first packaging (optional)
  - `New-CoSyncNote.ps1` — date-stamped trail note
- [ ]  (Optional) **training/README.md** (AdviceBomb tutorial)
- [ ] Handy: **docs/KEYBOARD_SURVIVAL.md** (Ctrl+C, Tab, ❢ history, etc.)

## 3) Optional familiarization (AdviceBomb tutorial, 15–30 min)
- [ ] If curious about the zip-first pattern, browse `training/README.md`.

## 4) First BUILD (preferred)
- [ ] Pick a tiny change (docs fix, helper tweak, CI nudge, diagram placeholder).
- [ ] Create a branch: `contributors/elias-first-build`
- [ ] Make the change and add a CoSync note:
  - `tools/New-CoSyncMote.ps1 -Intent "@elias first-build: <what>" -OutDir "contributors/elias"`
- [ ] Commit & open PR.

## 5) After merge
- [ ] Pull `main` (or confirm in GitHub UI).
- [ ] Improve this page (clarify a step, add a tip).
