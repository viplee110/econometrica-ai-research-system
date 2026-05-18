# Project Instructions

This folder contains an economic theory paper or research workflow targeting frontier-level development, originally calibrated against Econometrica-level standards.

The system is target-calibrated rather than Econometrica-only. Econometrica-level means a high standard for theoretical clarity, novelty, rigor, and contribution discipline; it is not the only possible submission target. A confirmed `target_journal_profile.md` may calibrate the reader path, referee mix, exposition style, and fit standard for RAND, JET, Theoretical Economics, GEB, ReStud, AER, or another venue without lowering the quality floor.

## Language and Artifact Policy

- This is an English research system with multilingual command understanding.
- In chat, respond in the user's language when convenient.
- Keep research-facing outputs English by default: workflow artifacts, field profiles, target journal profiles, human decision logs, style calibration files, referee reports, theorem/proof/literature notes, revision logs, and manuscripts.
- Chinese is allowed only in chat interaction and a small routing trigger list. Do not write Chinese into research artifacts or manuscripts unless the user explicitly asks for a separate Chinese explanatory note outside the manuscript workflow.
- Ordinary Q&A remains ordinary Q&A: explanatory, translation, GitHub, software, or conceptual questions should not be over-routed into the research workflow.
- Research execution is serious by default. Casual wording must not downgrade a research idea; explicit quick requests may receive a compact screen, but the quality floor remains.

## Path and PDF Output Hygiene

- Never write a local filesystem path as raw prose. Wrap every local path, compiled PDF path, and command path in backticks or a fenced code block so Markdown cannot consume backslashes.
- Prefer display-safe paths such as `C:/Dropbox/Shufe/Research/Project/.../paper.pdf`, or exact Windows paths inside code spans such as `C:\Dropbox\Shufe\Research\Project\...\paper.pdf`. Do not write `C:\...` outside code.
- When reporting a generated or compiled PDF, first verify the real file with `Test-Path -LiteralPath` or `Resolve-Path -LiteralPath`, then report a separate `PDF path:` line in code formatting.
- When creating a PDF file card or Markdown file link, the visible title must be the filename only, such as `model_setup_basic_results.pdf`. Never use the absolute path as the visible card title or link label.
- Put the full absolute path on a separate `Full path:` line in code formatting. If using a Markdown link, use filename-only label plus resolved path target, for example `[model_setup_basic_results.pdf](<C:/Dropbox/Shufe/Research/Project/My Paper/model_setup_basic_results.pdf>)`.
- Construct paths with `Join-Path`, `Resolve-Path -LiteralPath`, `pathlib`, or equivalent path APIs. Do not concatenate directory strings in a way that can drop `\` or `/` separators.
- If a path contains spaces, brackets, or non-ASCII characters, quote it in shell commands and keep the path in code formatting. Use a Markdown link only after the path has been resolved, and put the link target in angle brackets when needed.

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
- Run `.\verify_toolchain.ps1 -WriteStatus` to test the local toolchain and write a reusable computer-level `toolchain_status.md`.

## Scientific Taste & Anti-Complexity Directive

- Scientific taste is a filter, not the sole objective.
- Target journal changes calibration, not quality.
- Different targets change reader path, referee mix, exposition style, and fit standard; they must not lower rigor, theorem discipline, novelty scrutiny, absorption testing, or proof verification.
- RAND, JET, Theoretical Economics, GEB, ReStud, AER, and field-journal targets should be treated as different calibration profiles, not as permission to accept weak theorems, fake novelty, defensive complexity, or unverified claims.
- During discovery, preserve non-mainstream but internally coherent exploration long enough to test deep primitive potential, theorem bite, and absorption risk.
- Treat nonconvex discovery as branch generation inside the existing tree search, not as a separate mode or quality guarantee. Possible frontier spikes must still pass primitive depth, theorem bite, tractability, literature evidence, and absorption gates.
- During polishing and revision, taste, simplicity, and contribution sharpness become strong constraints against defensive clutter.
- Highest priority: protect the paper's nugget, the shortest truthful statement of the paper's cognitive update.
- Always watch for additive bias: using extra variables, agent types, dynamic states, distributions, assumptions, or appendices to hide a weak mechanism.
- Top economics papers should convert deep primitives into a sharp, simple insight. Complexity is allowed only when it is doing necessary economic work.
- When responding to a referee objection or proof gap, first ask whether the problem can be solved by deeper primitives, simplification, or reframing before adding assumptions or sections.
- The Scientific Judge may strongly oppose defensive dilution, fake novelty, and complexity shields, but must not kill a direction only because it is non-mainstream. It must first check deep primitive potential, theorem bite, and absorption risk.
- If a revision makes the contribution sentence longer, more conditional, or more defensive, stop and report a local-optimum trap. Recommend agentic tree search with simplification and pivot branches before editing.

## Token Quality Priority

- Token economy must never override research quality.
- For main theorem discovery, proof verification, closest-literature checks, simulated review, and high-stakes revision, use enough context, tools, and tokens to execute the workflow rather than compressing it into a shallow answer.
- Token discipline should reduce repeated boilerplate and redundant summaries, not reduce mathematical checking, literature search, model comparison, or adversarial review depth.

## Core Rules

- Preserve mathematical correctness, citation integrity, and author intent.
- Do not invent citations, proofs, data results, robustness checks, theorem statements, numerical results, or claims.
- If a citation, proof, result, robustness check, or interpretation requires author verification, write it as a precise TODO in `risk_register.md` instead of fabricating it.
- Record closest-paper, anchor-paper, absorption-threat, and style-anchor claims in `literature_evidence_ledger.md` when the project reaches literature-sensitive or high-stakes stages. If such evidence is missing, downstream field, target, absorption, panel, and style judgments must be marked provisional.
- Specificity is not stage advancement. Stage is determined by artifacts and human gates, not by how formal the user's language sounds.
- New research projects start from discovery or model-base discovery unless the user explicitly asks to solve a given model mechanically. User-supplied agents, timing, information, payoffs, or equilibrium language are provisional modeling constraints until a model-base gate confirms them.
- Before full manuscript development, require a candidate main theorem sentence, an absorption test against known theoretical families, a model tournament, and a confirmed or explicitly provisional model base unless the user explicitly requests mechanical editing only.
- Exhaust broadly at the model-skeleton level and derive narrowly at the formal level. A model is not ready because it is formal; it is ready when its smallest version explains the economic force.
- Before fixed point, contraction, IFT, or existence-theorem language, explain the economic object that requires consistency and why simpler examples cannot carry the mechanism.
- If repeated reviews identify no central theorem, old-theory absorption, or weak contribution, stop polishing and return to discovery/model search.
- Use `active_context.md` only as a compact dashboard for continuation; it is not a source of truth and must be checked against the underlying artifacts.
- The dashboard should identify the current stage, current blocker, model base status, provisional modeling constraints, next model-base test, confirmed source-of-truth artifacts, open human gates, a 2-4 step horizon, the next action to execute, why that action has high information value, active safety barriers, and the best step if the user has only two hours.
- Use `generality_ledger.md` to track losses of generality from special-case assumptions, distributions, graph structures, extra agents, extra states, or longer theorem sentences.
- Use `style_calibration.md` only as a confirmed or provisional paper-specific style contract for elegance without rhetoric; it must not change theorem statements, assumptions, novelty claims, or target-journal positioning.
- For serious style calibration, run deep style reading when full-text anchors are legally available or user-provided. Use `style_anchor_notes/`, `style_anchor_matrix.md`, and `style_pass_plan.md` to extract exposition architecture, not sentences or prose templates.
- Use `target_journal_profile.md` as the confirmed or provisional target-calibration artifact. It should guide journal fit, reader path, referee mix, style anchors, and review calibration, but it must not replace field evidence, theorem verification, or absorption tests.
- Treat optional cross-project researcher memory as a prior, never as paper source of truth. User-level files such as `researcher_profile.md`, `method_library.md`, `negative_knowledge.md`, `proof_technique_memory.md`, `project_postmortems/`, and `field_maps/` may live under `C:\Users\<user>\.econ-theorist-ai\`, but current project artifacts, literature evidence, proof verification, and human gates override them.
- Guard against information bubbles from researcher memory: include outside-view objections, adjacent-field search, and at least one internally coherent anti-profile direction when discovery breadth matters.
- Prefer direct edits to LaTeX source files when the source can be improved safely.
- Keep `revision_log.md` updated throughout the task.
- Compile the paper after meaningful edits when possible.
- Treat simulated referee acceptance as a diagnostic benchmark only, never as a real publication guarantee.

## Human Gates

- Stop for human approval before changing the central question, main theorem, model primitives, assumption set, claimed novelty, empirical interpretation, or target-journal positioning.
- Stop for human confirmation when creating the project-level `field_profile.md` for the first time or when new evidence materially changes the primary field, adjacent fields, closest-literature themes, or field-sensitive referee roles.
- Stop for human confirmation when creating `target_journal_profile.md` for the first time or when evidence materially changes the primary target, stretch target, fallback target, target audience, or target-journal positioning.
- Simple user commands must not weaken human gates. At major gates, use an explicit structure: gate name, why the system is stopping, evidence summary, decision needed, recommended option, alternatives, consequences, files to update, and next stage after decision.
- Do not ask vague major-gate questions such as "continue?" or "what do you think?" The gate prompt should teach the user what decision is needed and what happens next.
- Every human gate decision must be written to the relevant persistent artifact before the system treats it as durable state. Create `human_decisions.md` if it is missing, use it for append-only decision history, and update the active state file such as `project_state.md`, `discovery_state.md`, `field_profile.md`, `target_journal_profile.md`, `contribution_lock.md`, `revision_tree.md`, or `risk_register.md` as appropriate.
- Human decisions are append-only by default. If the user reverses or overrides an earlier decision, record the reversal with the previous decision, new decision, reason, affected artifacts, and required rechecks. The later decision governs current work, but the earlier decision must not be erased.
- Do not continue polishing if the main objection is contribution, identification, or economic relevance. Return to idea testing or contribution locking.
- Use `ECONOMETRICA_AI_HUMAN_WORKFLOW.md` to decide which stage should be run next.
- Use `ECONOMETRICA_ORCHESTRATOR.md` as the default router for broad or ambiguous research instructions.
- Use `ECONOMETRICA_PANEL_PROTOCOL.md` for high-stakes decision panels in idea discovery, model selection, mathematical verification, simulated review, and revision triage.
- For high-stakes panels, create a dynamic `panel_config.md` first, inherit the confirmed `field_profile.md` and `target_journal_profile.md` when they are current, assign referees from the paper's narrowest field, closest literature themes, target audience, main method, contribution type, and main risk, and do not use fixed field or journal templates unless warranted by the paper.
- Do not treat prior paper-specific methodology records as reusable referee templates.
- Prefer parallel isolated referee agents when the active runtime supports real agent delegation; otherwise use serial isolated referee prompts that hide earlier reports from later referees.
- Use `ECONOMETRICA_DISCOVERY_WORKFLOW.md` before a full manuscript exists or when the task is to discover topics, generate tractable models, test derivations, or run early-stage kill tests.
- Use `ECONOMETRICA_VERIFICATION_WORKFLOW.md` whenever a mathematical claim needs derivation, symbolic checking, numerical testing, counterexample search, proof audit, or formal verification.
- Use `ECONOMETRICA_VERSION_CONTROL.md` before and after meaningful edits, long-running review sessions, and rollback requests.
- Run version control automatically in the background for meaningful edits: status check, safe AI branch when the git tree is clean, checkpoint logging, and post-edit diff summary. Ask only for commits, tags, worktrees, rollback, destructive actions, or dirty pre-existing human changes.
