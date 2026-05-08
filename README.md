# Econometrica AI Research System

A local Codex workflow system for economics papers targeting Econometrica-level research quality.

This repository provides a reusable human-AI research workflow for:

- topic discovery
- tractable model generation
- model tournaments before manuscript writing
- Primitive Hunter / Theorem Generator panels for non-neighborhood model search
- absorption tests against existing theory
- main-theorem gates
- Scientific Judge / Nugget Test for taste and anti-complexity
- Advocate / Best-Case Reader to counter reject-prior drift
- agentic tree search for major revision paths
- first-pass derivation
- mathematical verification
- contribution kill tests
- manuscript development
- simulated Econometrica review
- dynamic referee assignment by field, closest literature, method, contribution type, and main risk
- parallel isolated referee agents when available, with serial isolated simulation as fallback
- calibration anchors and optional control-paper calibration for review panels
- referee-guided revision
- automatic version-control checkpoints

## Files

- `AGENTS.md`: project-level instructions automatically read by Codex.
- `ECONOMETRICA_ORCHESTRATOR.md`: single entry point that routes natural-language requests to the right workflow.
- `ECONOMETRICA_PANEL_PROTOCOL.md`: dynamic panel configuration, independent specialist panels, AE synthesis, Co-Editor decisions, and consensus/disagreement summaries.
- `ECONOMETRICA_DISCOVERY_WORKFLOW.md`: topic search, model generation, derivation, early kill tests.
- `ECONOMETRICA_VERIFICATION_WORKFLOW.md`: symbolic checks, numerical counterexample search, proof audit, Lean/Python/Mathematica usage.
- `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`: manuscript development, contribution lock, simulated review, revision loop, final readiness.
- `ECONOMETRICA_VERSION_CONTROL.md`: git checkpointing, diffs, branches, commits, rollback safety.
- `TOOLCHAIN_README.md`: local verification toolchain instructions.
- `verify_toolchain.ps1`: quick local toolchain self-test.
- `verification_templates/`: starter templates for counterexample search and Lean lemmas.

## Recommended Use

Copy these files into the root directory of a paper project:

```text
AGENTS.md
ECONOMETRICA_ORCHESTRATOR.md
ECONOMETRICA_PANEL_PROTOCOL.md
ECONOMETRICA_DISCOVERY_WORKFLOW.md
ECONOMETRICA_VERIFICATION_WORKFLOW.md
ECONOMETRICA_AI_HUMAN_WORKFLOW.md
ECONOMETRICA_VERSION_CONTROL.md
TOOLCHAIN_README.md
verify_toolchain.ps1
verification_templates/
```

Then open the paper folder in Codex Desktop. `AGENTS.md` should be read automatically, and `ECONOMETRICA_ORCHESTRATOR.md` acts as the router.

## Toolchain Location

Keep Python, Lean/elan, Mathlib, and large Lake package caches outside paper
folders. On Windows the recommended shared tool root is:

```text
C:\Tools\CodexVerification
```

You can choose another location by setting `CODEX_VERIFICATION_HOME` or by
passing `-ToolRoot` to `verify_toolchain.ps1`.

Minimum setup check after copying the workflow files into a paper folder:

```powershell
.\verify_toolchain.ps1
```

If the script cannot find Python, Lean, or Mathematica, the workflow still works
as prompts and checklists, but mathematical verification is weaker until the
tool root is configured. See `TOOLCHAIN_README.md` for detailed setup options.

## 中文用法

在 Codex Desktop 里打开论文根目录后，你不需要记住每个 workflow 或 stage。直接使用自然语言即可；为了路由更稳定，建议以 `按系统处理：` 开头。

```text
按系统处理：我想讨论一个新的课题，领域大概是平台搜索和广告。
```

```text
按系统处理：这个 idea 是否有 Econometrica 潜力？
```

```text
按系统处理：帮我生成 tractable model，并尝试推导主结论。
```

```text
按系统处理：严格验证 Proposition 1，必要时用 Python、Mathematica 和 Lean。
```

```text
按系统处理：运行一轮 Econometrica 模拟审稿。
```

```text
按系统处理：根据最新审稿意见修改论文。
```

```text
按系统继续。
```

## English Usage

After opening the paper root folder in Codex Desktop, you do not need to remember workflow names or stage numbers. Use natural language. For best routing stability, start with `Use the system:`.

```text
Use the system: I want to explore a new research topic in platform search and advertising.
```

```text
Use the system: evaluate whether this idea has Econometrica-level potential.
```

```text
Use the system: generate tractable model variants and attempt first-pass derivations.
```

```text
Use the system: run a model tournament and absorption test before we write a manuscript.
```

```text
Use the system: run Primitive Hunter. Identify the deepest primitive, what is reduced-form, and three non-neighborhood model directions.
```

```text
Use the system: run the Scientific Judge and Nugget Test on this project.
```

```text
Use the system: revise with agentic tree search instead of a single defensive patch.
```

```text
Use the system: rigorously verify Proposition 1, using Python, Mathematica, and Lean if useful.
```

```text
Use the system: run one simulated Econometrica review round.
```

For simulated review, the workflow first writes `referee_reports/round_N/panel_config.md`, then assigns referees dynamically from the manuscript's narrowest field, closest literature, method, contribution type, and main risk.

```text
Use the system: revise the paper according to the latest referee report.
```

```text
Use the system: continue from the current state.
```

## IDE and Agent Recommendations

### Codex Desktop

Codex Desktop is the most natural environment for this system. Copy the workflow files into the paper root folder, then open that folder as a local Codex project. Codex should automatically read `AGENTS.md`, which points it to `ECONOMETRICA_ORCHESTRATOR.md`.

Recommended command:

```text
Use the system: continue from the current state.
```

Chinese equivalent:

```text
按系统继续。
```

### Cursor

Cursor can use the same workflow files, but it may not automatically treat `AGENTS.md` as project instructions. For a new Cursor agent/chat session, explicitly tell it to read the entry files first.

Recommended command:

```text
Read AGENTS.md and ECONOMETRICA_ORCHESTRATOR.md. Follow the workflow system and route the task automatically. My task is: [describe the task].
```

For high-stakes review or modeling work, also ask Cursor to read the relevant module:

```text
Read AGENTS.md, ECONOMETRICA_ORCHESTRATOR.md, and ECONOMETRICA_PANEL_PROTOCOL.md. Use the independent panel protocol where appropriate. First create panel_config.md for any high-stakes panel, then assign specialist roles dynamically. My task is: [describe the task].
```

### Claude Code, Windsurf, VS Code Agents, and Other Local IDE Agents

Any local IDE agent that can read project files can use this repository. Place the workflow files in the project root and start each major session by naming the entry files.

Recommended command:

```text
Read AGENTS.md and ECONOMETRICA_ORCHESTRATOR.md first. Then decide which workflow module to use. My task is: [describe the task].
```

If the task involves proof, equilibrium, symbolic algebra, numerical counterexample search, or formal verification, add:

```text
Also read ECONOMETRICA_VERIFICATION_WORKFLOW.md and use the available local tools only when their output can be recorded.
```

### Web Chat Models

Plain web chat models usually cannot automatically read local project files. Use one of these approaches:

1. Upload the workflow files and the relevant paper files.
2. Provide the GitHub repository URL and ask the model to read the workflow files.
3. Paste the relevant section of `ECONOMETRICA_ORCHESTRATOR.md` or the module you want to use.

Recommended command:

```text
Use the workflow from https://github.com/viplee110/econometrica-ai-research-system. Start from AGENTS.md and ECONOMETRICA_ORCHESTRATOR.md, then route this task: [describe the task].
```

This is less reliable than local use, because the model may not have persistent access to your paper folder, git history, local tools, or generated state files.

### Most Robust Cross-Tool Prompt

Use this when you are unsure whether the IDE automatically reads project instructions:

```text
Read AGENTS.md and ECONOMETRICA_ORCHESTRATOR.md. Follow this workflow system. If the task involves high-stakes idea, model, theorem, review, or revision decisions, also read ECONOMETRICA_PANEL_PROTOCOL.md. Create panel_config.md before assigning referees, use parallel isolated agents if available, otherwise use serial isolated prompts, route the task automatically, and stop at human gates. My task is: [describe the task].
```

## Design Philosophy

The system does not assume that repeated AI revision converges to Econometrica acceptance. It is designed to expose non-convergence early:

- weak contribution
- non-novel idea
- overly tailored assumptions
- unverified theorem
- hidden proof gap
- poor literature positioning
- manuscript polish without real economic bite
- local repair traps where each review round adds sections but no stronger main theorem
- old-theory absorption where literature search shows that a result is just a known theory family under new names

AI should expand the search space, generate and test models, simulate adversarial feedback, maintain logs, and automate mechanical checks. The human should own taste, contribution, assumptions, novelty, target journal, and final go/no-go decisions.

The preferred path is:

```text
topic/idea -> primitive hunting -> model tournament -> absorption test -> main theorem gate -> 5-8 page model note -> manuscript
```

If two independent review rounds say "no central theorem," "too close to existing theory," or "absorbed by known models," the workflow should stop polishing and return to model discovery.

For major revision, the system should compare three paths before editing:

```text
Branch A Defensive Patch -> Branch B Mechanism Simplification -> Branch C Pivot/Reframe -> human branch choice
```

## Local Toolchain

The workflow can use:

- Python with `sympy`, `numpy`, `scipy`, `pandas`, `matplotlib`, `z3-solver`
- Mathematica via `wolframscript`
- Lean 4 / Lake
- Git
- LaTeX

Tool installation is intentionally not committed to this repo. Do not commit downloaded installers, package caches, or paper-specific outputs.

## GitHub Installation Pattern

For a future paper project, you can either:

1. Copy this repository's workflow files into the paper root.
2. Add this repository as a git submodule and copy/symlink the workflow files.
3. Turn this repository into a Codex skill or plugin later if you want a more formal reusable interface.

The simplest and most robust method is copying the files into each paper root so Codex sees `AGENTS.md` directly.
