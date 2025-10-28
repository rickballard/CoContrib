# CoSuite Contributor Onboarding Manual (Repo Edition)

**Purpose:** Make it safe and easy to become productive.
**Outcome:** You open a tiny PR, create `contributors/<handle>`, and leave a CoSync trail.

## Steps
1. Ensure you're on `main` then pull:
   ```ps1
   git switch main; git pull --ff-only
   ```
2. Create your folder:
   ```ps1
   & "$PWD/tools/Add-Contributor.ps1" -Name "Elias Example" -Handle elias
   ```
3. Commit, push, open PR. In the PR body, answer:
   - What you set up
   - Your first tiny goal
   - Any blockers

## Next
- Do the **Training Example** in `training/README.md` (Idea → AdviceBomb → CoCache inbox).
- Explore `tools/New-AdviceBomb.ps1` and `training/scripts/Start-TrainingExample.ps1`.

### Handy reference
- [Keyboard Survival](../docs/KEYBOARD_SURVIVAL.md) — PS7 & GitHub web tips.
