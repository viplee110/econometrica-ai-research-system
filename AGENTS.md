# Project Instructions

This folder contains an economics paper or research workflow targeting Econometrica-level development.

Default entry point: first read `ECONOMETRICA_ORCHESTRATOR.md` when it exists. Use it to route broad user requests to the correct workflow module and stage, so the user does not need to remember stage numbers or file names.

For pre-manuscript topic discovery, model generation, early derivation, and idea kill tests, first read `ECONOMETRICA_DISCOVERY_WORKFLOW.md` when it exists in this project.

For long-horizon human-AI manuscript development, first read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md` when it exists in this project. Treat it as the stage-gated collaboration protocol for idea testing, contribution locking, manuscript revision, simulated review, and human decision checkpoints.

For mathematical derivations, theorem checks, comparative statics, equilibrium calculations, counterexample searches, numerical examples, symbolic algebra, or formal proof attempts, first read `ECONOMETRICA_VERIFICATION_WORKFLOW.md` when it exists in this project.

For version control, checkpoints, git diffs, branches, worktrees, commits, tags, rollback, and protection of human edits, first read `ECONOMETRICA_VERSION_CONTROL.md` when it exists in this project.

For high-stakes idea, model, theorem, manuscript, review, or revision decisions, first read `ECONOMETRICA_PANEL_PROTOCOL.md` when it exists. Use independent specialist reports, AE synthesis, Co-Editor decision, and parent-agent summary to avoid single-agent self-confirmation.

## Local Verification Toolchain

- Prefer the shared verification tool root outside paper folders. On Windows the default is `C:\Tools\CodexVerification`; users may override it with `CODEX_VERIFICATION_HOME`.
- Use `C:\Tools\CodexVerification\Python312\python.exe` for Python-based symbolic algebra, numerical checks, counterexample searches, plots, and SMT checks unless `CODEX_VERIFICATION_HOME` points elsewhere.
- Use `C:\Tools\CodexVerification\elan\bin\lean.exe` and `C:\Tools\CodexVerification\elan\bin\lake.exe` for Lean 4 verification unless `CODEX_VERIFICATION_HOME` points elsewhere. Set `ELAN_HOME` to the shared `elan` directory before invoking them.
- Keep large verification tools and package caches in the shared tool root, not inside paper folders.
- Mathematica 13.0 is installed at `C:\Program Files\Wolfram Research\Mathematica\13.0`. Use `wolframscript.exe` for symbolic checks. The default sandbox may not be able to read WolframScript's user configuration directory, so Mathematica commands may require approval to run outside the sandbox. Do not claim Mathematica verification unless the command succeeds and its output is recorded.
- Run `.\verify_toolchain.ps1` to test the local toolchain.

## Scientific Taste & Anti-Complexity Directive

- Highest priority: protect the paper's nugget, the shortest truthful statement of the paper's cognitive update.
- Always watch for additive bias: using extra variables, agent types, dynamic states, distributions, assumptions, or appendices to hide a weak mechanism.
- Top economics papers should convert deep primitives into a sharp, simple insight. Complexity is allowed only when it is doing necessary economic work.
- When responding to a referee objection or proof gap, first ask whether the problem can be solved by deeper primitives, simplification, or reframing before adding assumptions or sections.
- If a revision makes the contribution sentence longer, more conditional, or more defensive, stop and report a local-optimum trap. Recommend agentic tree search with simplification and pivot branches before editing.

## Core Rules

- Preserve mathematical correctness, citation integrity, and author intent.
- Do not invent citations, proofs, data results, robustness checks, theorem statements, numerical results, or claims.
- If a citation, proof, result, robustness check, or interpretation requires author verification, write it as a precise TODO in `risk_register.md` instead of fabricating it.
- Before full manuscript development, require a candidate main theorem sentence, an absorption test against known theoretical families, and a model tournament unless the user explicitly requests mechanical editing only.
- If repeated reviews identify no central theorem, old-theory absorption, or weak contribution, stop polishing and return to discovery/model search.
- Prefer direct edits to LaTeX source files when the source can be improved safely.
- Keep `revision_log.md` updated throughout the task.
- Compile the paper after meaningful edits when possible.
- Treat simulated referee acceptance as a diagnostic benchmark only, never as a real publication guarantee.

## Human Gates

- Stop for human approval before changing the central question, main theorem, model primitives, assumption set, claimed novelty, empirical interpretation, or target-journal positioning.
- Do not continue polishing if the main objection is contribution, identification, or economic relevance. Return to idea testing or contribution locking.
- Use `ECONOMETRICA_AI_HUMAN_WORKFLOW.md` to decide which stage should be run next.
- Use `ECONOMETRICA_ORCHESTRATOR.md` as the default router for broad or ambiguous research instructions.
- Use `ECONOMETRICA_PANEL_PROTOCOL.md` for high-stakes decision panels in idea discovery, model selection, mathematical verification, simulated review, and revision triage.
- For high-stakes panels, create a dynamic `panel_config.md` first, assign referees from the paper's narrowest field, closest literature themes, main method, contribution type, and main risk, and do not use fixed field templates unless warranted by the paper.
- Do not treat prior paper-specific methodology records as reusable referee templates.
- Prefer parallel isolated referee agents when the active runtime supports real agent delegation; otherwise use serial isolated referee prompts that hide earlier reports from later referees.
- Use `ECONOMETRICA_DISCOVERY_WORKFLOW.md` before a full manuscript exists or when the task is to discover topics, generate tractable models, test derivations, or run early-stage kill tests.
- Use `ECONOMETRICA_VERIFICATION_WORKFLOW.md` whenever a mathematical claim needs derivation, symbolic checking, numerical testing, counterexample search, proof audit, or formal verification.
- Use `ECONOMETRICA_VERSION_CONTROL.md` before and after meaningful edits, long-running review sessions, and rollback requests.
- Run version control automatically in the background for meaningful edits: status check, safe AI branch when the git tree is clean, checkpoint logging, and post-edit diff summary. Ask only for commits, tags, worktrees, rollback, destructive actions, or dirty pre-existing human changes.
