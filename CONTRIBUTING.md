# Contributing to AIX-Lab-Simulation

Thanks for looking. AIX-Lab-Simulation is a single-file Bash simulation of the IBM AIX command line, built for learning and training. Contributions of new simulated commands, more realistic output, docs, and bug reports are all welcome.

## Run it locally

Any Bash shell on Linux or macOS — no AIX hardware, no dependencies. The AI assistant is optional and only needs an API key if you want it.

```bash
git clone https://github.com/vilaswasnik/AIX-Lab-Simulation.git
cd AIX-Lab-Simulation
source ./aix_simulation.sh

oslevel -r      # should print a simulated AIX level
lspv            # simulated physical volumes
df -g           # note: -g, not -h — this is AIX
```

For the AI assistant (`aixa`, `ask`), set `OPENAI_API_KEY` in your environment first — see `AI_ASSISTANT_SETUP.md`. **Never hardcode a key in the scripts or commit one.**

## How the simulation works (read before adding a command)

- Everything is defined in `aix_simulation.sh`: one Bash function per AIX command (`lspv()`, `lsvg()`, `df()`, …). Sourcing the file installs them into the user's shell.
- Simulated output must look like real AIX output — column formats, naming (`hdisk0`, `rootvg`, `hd5`…), and units (AIX reports in GB with `-g`). When in doubt, match the format in `aix_cheatsheet.txt`.
- Linux commands are intentionally blocked or corrected in-simulation (see `LINUX_BLOCKING_FEATURE.md`). Don't "fix" that — it's the teaching mechanism.
- The AI layer (`aixa`, `ask`, `_process_nl_query`, `_explain_command`) translates natural language to a command and explains it; it never executes anything the user didn't ask for.

## Adding a simulated command

1. Add a function named exactly after the AIX command in `aix_simulation.sh`, following the style of the neighbouring commands.
2. Support the common flags with realistic output; unsupported flags should fail the way AIX fails, not silently succeed.
3. Add the command to `aix_cheatsheet.txt` and to `aixhelp` output if it belongs there.
4. Source the file in a clean shell and run your command plus a few existing ones to be sure nothing else broke.

## Filing an issue

Use GitHub Issues. A useful report includes: the command you ran, the output the simulation gave, and what real AIX would print (if you know). "Output doesn't match AIX 7.x" reports with a real sample are gold.

## PR process

1. Fork, branch from `main`, keep the change focused.
2. Keep everything in Bash — no new runtimes or dependencies.
3. Describe in the PR how you verified the output (ideally against real AIX documentation or a real system).
4. One approval from the maintainer merges.

## Good first issues

Concrete, evidence-based starting points (each cites where the gap is):

1. **Fix the README's duplicated step number.** The Quick Start has two sections numbered "3" ("Use AIX Commands Interactively" and "Exit the Simulation"). Renumber so the flow reads 1-2-3-4 in order.
2. **Document the demo scripts.** `demo_history.sh` and `demo_prompt.sh` sit in the root but the README never mentions them — add a short "extras" note explaining what each demos.
3. **Add a simulated command that's missing.** Compare `aix_cheatsheet.txt` against the functions in `aix_simulation.sh`; any command documented but not implemented is a well-scoped contribution.
4. **Grow `test_aixa.sh` into a smoke suite.** Today it only exercises the AI assistant. Add non-AI checks: source the file, run the core commands (`oslevel`, `lspv`, `lsvg -l rootvg`, `df -g`), assert the output shape.
