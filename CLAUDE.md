# CLD11 – ATM controller (CLD sample exam), AI workflow showcase

| What | Where |
|---|---|
| Exam spec | `ATM (100928D-01)/100928D-01.pdf` |
| LabVIEW 2026 project | `ATM (100928D-01)/Template/Automatic Teller Machine/ATM Solution.lvproj` |
| Scripts | `tools/` |

## Rules
- Work as GitHub user **JanGoebelsBot**: one branch + one PR per change, never push to `main`.
- LabVIEW code is built and edited through the `labview-*` agents.

## Opening a pull request
1. **Local diff:** `.\tools\Diff-VIs.ps1 -Base origin/<base branch>`
   → `diff-report/index.html` (LabVIEW's graphical diff) and `diff-report/differences.txt`.
2. **Summarise** `differences.txt` for a human reviewer – the raw diff is far too granular.
   PR description:
   - **What & why** – 1–3 sentences
   - **How** – one bullet per changed VI, in plain words
   - **Review hints** – what to check, risks, what was not verified
   - **Full diff** – "LabVIEW diff report: see the CI comment below" (for anyone who doesn't trust the summary)
3. `gh pr create` with that description.
