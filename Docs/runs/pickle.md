# Pickle runs, Biotech Bodies

One line per run: date, ticket, feature, result, evidence. Source of truth: the dispatcher result file of each ticket.

- 2026-11-07 fa56, 11-neutral-body: exit 1, 3 passed, Female row dropped (NPT step refuses it); evidence Evidence/neutral-gene
- 2026-11-07 32c6, 13-rimmsqol-shortcut: exit 0, 3 passed (S5 S6 S7); evidence Evidence/rimmsqol
- 2026-11-07 0f7b, 12-settings S3: exit 0, passed; evidence Evidence/settings-s3b
- 2026-11-07 6fee, 8eb9, ad66: replay of the body and face features on the current build, exit 0, 8 + 3 + 4 passed; evidence Evidence/replay-*, face-reel
- 2026-11-07 6f81, 21e3: 12-settings S1 in French, exit 0, 1 passed each (21e3 after the corpse rows fix 3dd5a60)
- 2026-11-07 ea73, 12-settings S1 in French: exit 0, 1 passed, build 6ffbbf7 (defName on duplicate labels, rows read Humain (Human) and Humain (CreepJoiner)); evidence Evidence/settings-french3
- 2026-11-16 2abd, 14-gallery shot 2 alone (2-two-bodies): exit 0, 1 passed; capture read, candidate cropped to Art/Gallery-clean; raw run deleted
- 2026-11-18 6642, replay of 03 05 11 (vanillabody) on f57edd6 after the gene renames: exit 0, 11 passed; triaged to Evidence/replay-body
- 2026-11-18 f007, replay of 04 (bodyoptions): exit 0, 3 passed; Evidence/replay-bodyopt
- 2026-11-18 adc4, replay of 09: exit 0, 1 passed
- 2026-11-18 3785, replay of 12 (settings, S1 owed): exit 0, 4 passed; Evidence/replay-settings
- 2026-11-18 84e9, 16-incompat-bmmam-pool: RED 13 passed, 6 failed = documented BMMaM incompatibility (BiB body path no longer drawn, Log.Error NullReferenceException in DynamicDrawManager.PreDrawVisibleThings, BMMaM side, same shape as a3cf 2026-11-13); incompatibleWith stays (owner 2026-11-13); evidence folder deleted
- 2026-11-22 6150, replay of faceunagi on f0b3d49 (hetzner lane, Pickle older than azure): exit 0, 4 passed; Evidence/replay-unagi
- 2026-11-22 1a82, replay of nicefa on f0b3d49 (azure): exit 0, 1 passed; Evidence/replay-nicefa
- 2026-11-22 a29f, replay of reel on f0b3d49 (azure): exit 0, 1 passed; Evidence/replay-reel
- 2026-11-22 4e62, replay of avec-rimmsqol (13, S5 S6 S7) on f0b3d49 (azure): exit 0, 3 passed; Evidence/replay-rimmsqol
- 2026-11-22 228f, replay of custombody (15) on f0b3d49 (azure): exit 0, 3 passed; Evidence/replay-custombody
- 2026-11-22 75a2, replay of settings (12, French) on f0b3d49 (azure): exit 0, 4 passed; Evidence/replay-settings-fr
- 2026-11-22 c3e9, gallery shot 6 (gallery-visualmods): exit 0, 1 passed; Inbox/gallery-v35 (score-gallery and 268 px check owed)
