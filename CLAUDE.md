# CLD11 – ATM controller (CLD sample exam), AI workflow showcase

| What | Where |
|---|---|
| Exam spec | `ATM (100928D-01)/100928D-01.pdf` |
| LabVIEW 2026 project | `ATM (100928D-01)/Template/Automatic Teller Machine/ATM Solution.lvproj` |
| Unit tests (Caraya) | `…/Automatic Teller Machine/Tests/` |
| Scripts | `tools/` |
| CI workflows | `.github/workflows/` |

## Rules
- Work as GitHub user **JanGoebelsBot**: one branch + one PR per change, never push to `main`.
- LabVIEW code is built and edited through the `labview-*` agents.

## Opening a pull request
1. **Tests:** `.\tools\Run-Tests.ps1` must pass → `test-report/index.html`.
2. **Local diff:** `.\tools\Diff-VIs.ps1 -Base origin/<base branch>`
   → `diff-report/index.html` (LabVIEW's graphical diff) and `diff-report/differences.txt`.
3. **Summarise** `differences.txt` for a human reviewer – the raw diff is far too granular.
   PR description:
   - **What & why** – 1–3 sentences
   - **How** – one bullet per changed VI, in plain words
   - **Review hints** – what to check, risks, what was not verified
   - **Tests** – passed / total
   - **Full diff** – "LabVIEW diff report: see the CI comment below" (for anyone who doesn't trust the summary)
4. `gh pr create` with that description.

## CI (self-hosted runner on this PC, label `labview`)
- **Every PR** (`pull-request.yml`): tests → diff → exe build; comments links to all three reports.
- **Tag `v*`** (`release.yml`): tests → exe build → GitHub release with `ATM-<tag>.zip`.
