# CoSuite Compass Pack (staging)

This folder was created by unzipping the Compass AdviceBomb for quick review and contributor onboarding.

- **Origin ZIP:** AdviceBomb_CoSuite_Compass_20251028-200011.zip
- **Imported:** 2025-10-28 20:09:57 UTC
- **Contents:**
  - `docs/marketing/CoSuite_Open-Source_Compass.md`
  - `docs/outreach/CoSuite_Compass_Outreach_Guide.md`
  - `docs/marketing/scorecards/SCHEMA.csv`
  - `tools/Render-Scorecard.ps1`
  - `_wrap.manifest.json`, `_copayload.meta.json`, `CHECKS.txt`, `SHA256SUMS`

## Suggested next steps
1. Skim the two docs above and propose edits via PR comments.
2. Run the scorecard renderer locally:
   ```powershell
   pwsh -File tools/Render-Scorecard.ps1 docs/marketing/scorecards/SCHEMA.csv
   ```
3. If this looks good, we’ll promote to a stable contributor path (e.g., contributors/elias/compass/) in a follow-up PR.

---
**Mythos note:** No crowns. Plenty of daylight. Bring your own mind, and your favorite AI.
