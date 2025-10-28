# Training Example — Idea → AdviceBomb → CoCache Inbox

You will:
1) Think of one idea to improve the world.
2) Package it as an **AdviceBomb** (zip with README, meta, manifest).
3) Create a **CoSync** note summarizing what you did.
4) (Option A) Stop here (CoContrib-only).
5) (Option B) Deliver the AdviceBomb to the CoCache advice inbox via a PR (when ready).

### Steps
```ps1
# Create your contributor folder first (example):
& "$PWD/tools/Add-Contributor.ps1" -Name "Elias Example" -Handle elias

# Start the training example (scaffolds a workspace + AdviceBomb):
& "$PWD/training/scripts/Start-TrainingExample.ps1" -Handle elias -Title "Greener School Buses"
```

This will print the zip path and sha256. If you also have `CoCache` cloned locally,
you can open a PR there to place the zip into its advice inbox and append `INBOX_LOG.md` per its rules.

> Tip: In your own AI chat, narrate what each step means (AdviceBomb, CoSync, Inbox),
> and ask your AI to critique and iterate (CoEvo-1/2/3).

> **Keyboard tips:** If a step hangs, press **Ctrl+C** to cancel.
> See [Keyboard Survival](../docs/KEYBOARD_SURVIVAL.md) for more.
