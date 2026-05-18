# Target-Calibrated Research Orchestrator

Version: 2026-05-08

This is the single entry point for the economic theory research system, originally calibrated against Econometrica-level standards and now target-calibrated through `target_journal_profile.md`. When the user gives a broad instruction, do not require them to remember workflow file names or stage numbers. Read this file, infer the task type, inspect available state files, choose the next appropriate module, and proceed until a human gate is reached.

Target journal changes calibration, not quality. A different target changes reader path, referee mix, exposition style, and fit standard; it must not lower rigor, theorem discipline, novelty scrutiny, absorption testing, or proof verification.

## Language, Simplicity, and First-Run Policy

This is an English research system with multilingual command understanding.

- In chat, respond in the user's language when convenient.
- Keep research-facing outputs English by default: workflow artifacts, field profiles, target journal profiles, human decision logs, style calibration files, referee reports, theorem/proof/literature notes, revision logs, and manuscripts.
- Chinese is allowed only in chat interaction and a small routing trigger list.
- Do not write Chinese into research artifacts or manuscripts unless the user explicitly asks for a separate Chinese explanatory note outside the manuscript workflow.
- Ordinary Q&A remains ordinary Q&A: explanatory, translation, GitHub, software, or conceptual questions should not be over-routed into the research workflow.
- The workflow activates when the user asks the system to act on a research project, paper, idea, theorem, model, literature, review, revision, or project state.
- Research execution is serious by default. Casual wording must not downgrade a research idea.
- Explicit quick requests may receive a compact screen, but the quality floor remains. Explicit full requests require the complete relevant workflow.
- Specificity is not stage advancement. User-supplied agents, timing, information, payoffs, equilibrium language, or assumptions are provisional modeling constraints until the relevant artifact and human gate confirm them.
- New research projects start from discovery or model-base discovery unless the user explicitly asks to solve a given model mechanically. If the user provides a complete model for paper development, run a model-base audit before deriving it as the paper's model.

First-run check is a soft gate, not a hard gate.

- Suggest first-run setup only for execution-type requests when the computer-level `toolchain_status.md` is missing, stale, or unknown.
- Do not interrupt conceptual questions, early idea discussion, or ordinary Q&A with toolchain setup.
- If a global `toolchain_status.md` already exists, do not repeat the full computer-level check for a second paper unless the user asks or the status is stale.
- A new paper project may still need lightweight project initialization through `project_state.md` and `active_context.md`.
- The setup check must not silently install large tools, modify PATH, or change system environment variables.

Stage-aware effort calibration uses internal rules rather than user-visible modes:

- Default continuation uses the current project stage, existing artifacts, user request, and risk level.
- A quick screen is used only when the user explicitly asks for quick, rough, no-file, or short screening. It should still check theorem sentence, closest-literature risk, absorption risk, and go/park/kill logic, and must not claim final novelty.
- A full audit is mandatory when the user asks for full review, full literature audit, theorem verification, full model tournament, high-stakes submission, or equivalent language.
- No effort level may lower rigor, theorem discipline, novelty scrutiny, absorption testing, proof verification, or human-gate persistence.

## Path Integrity and Compiled Output Hygiene

Windows paths are easily corrupted by Markdown rendering when backslashes are written as raw prose. The assistant must treat path display as an output-safety issue.

- Never display local filesystem paths, compiled PDF paths, or command paths as raw prose. Use backticks or fenced code blocks.
- Prefer display-safe forward slashes, such as `C:/Dropbox/Shufe/Research/Project/.../paper.pdf`, or exact Windows paths inside code spans.
- Before telling the user that a PDF was created, opened, or is ready, run `Test-Path -LiteralPath` or `Resolve-Path -LiteralPath` on the exact file path when tool access is available.
- If presenting a PDF as a file card or Markdown file link, use only the basename as the visible title. The card title should look like `model_setup_basic_results.pdf`, never like `C:\Dropbox\Shufe\Research\Project\...\model_setup_basic_results.pdf`.
- Report the full resolved path separately as `Full path:` in code formatting. Do not squeeze the full path into the file card title.
- Report generated outputs in this format:

```text
File card:
[model_setup_basic_results.pdf](<C:/absolute/path/to/model_setup_basic_results.pdf>)

Full path:
`C:/absolute/path/to/file.pdf`

Open command:
`Start-Process -FilePath "C:\absolute\path\to\file.pdf"`
```

- Build paths with `Join-Path`, `Resolve-Path -LiteralPath`, `pathlib`, or equivalent path APIs. Do not manually concatenate path fragments in final user-facing output.
- If the path contains spaces, brackets, or non-ASCII characters, quote it in commands and keep it in code formatting. Use Markdown links only with resolved paths and angle-bracket link targets when needed.

The system is made of the following workflow modules:

- `ECONOMETRICA_PANEL_PROTOCOL.md`: independent specialist panels, AE synthesis, Co-Editor decisions, consensus/disagreement/omission summaries.
- `ECONOMETRICA_DISCOVERY_WORKFLOW.md`: topic discovery, model generation, first-pass derivation, early kill tests.
- `ECONOMETRICA_VERIFICATION_WORKFLOW.md`: symbolic checks, numerical counterexample search, proof audit, Lean/Mathematica/Python verification.
- `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`: manuscript development, contribution lock, simulated review, referee-guided revision, submission readiness.
- `ECONOMETRICA_VERSION_CONTROL.md`: git status, checkpoints, branches/worktrees, diffs, commits, tags, rollback, and protection of human edits.
- `TOOLCHAIN_README.md`: local Python, Lean, Mathematica, and verification tool usage.

`AGENTS.md` contains standing project rules and should already point here.

## Default Behavior

When the user asks for research help, follow this sequence:

1. Inspect the local folder and current state files.
2. Infer whether the task is discovery, verification, manuscript revision, simulated review, or toolchain work.
3. For meaningful edits or long-running sessions, read `ECONOMETRICA_VERSION_CONTROL.md` and run automatic version-control setup in the background.
4. For high-stakes judgments, read `ECONOMETRICA_PANEL_PROTOCOL.md` and choose the appropriate panel type and information mode.
5. State the selected module, stage, and panel mode in one short sentence.
6. Execute the stage directly if it is safe.
7. Stop at human gates.
8. Write human gate decisions to persistent artifacts before treating them as durable state.
9. Update the relevant state/log files before stopping.
10. For meaningful edits, summarize the git diff or version-control state before finishing.

Do not ask the user to choose a stage unless the routing is genuinely ambiguous or the next step changes the core contribution, theorem, model, assumptions, novelty claim, or target journal.

## Human Gate Format

Simple commands must not weaken human gates. At major gates, stop and present a decision-complete prompt using this structure:

```text
Gate name:
Why the system is stopping:
Evidence summary:
Decision needed:
Recommended option:
Alternatives:
Consequences:
Files to update:
Next stage after decision:
```

Do not ask vague major-gate questions such as "continue?" or "what do you think?" The user should not need to know the workflow, but the gate prompt must teach them what decision is needed and what happens next. After the user chooses, write `human_decisions.md` and update the controlled artifact before proceeding.

## Universal User Commands

The user should be able to use short commands like these:

```text
I want to discuss a new topic. Start the system.
```

```text
I have a rough idea. Help me evaluate it.
```

```text
Continue from the current state.
```

```text
按系统继续。
```

```text
Check the math carefully.
```

```text
Run a target-calibrated simulated review.
```

```text
Use the system: first-run setup check.
```

```text
Use the system: initialize this paper project.
```

```text
Use the system: quickly screen this idea.
```

```text
Use the system: run a full literature audit.
```

```text
Use the system: what should I do today?
```

```text
Use the system: where is this project stuck?
```

```text
Revise according to the latest referee report.
```

```text
Prepare a final readiness report.
```

The assistant should translate these commands into the correct workflow and stage.

## State Files to Inspect First

Before routing, inspect whichever of these files exist:

- `active_context.md` first, if present, as a compact dashboard only
- `project_state.md`
- `discovery_state.md`
- `human_decisions.md`
- `idea_dossier.md`
- `contribution_lock.md`
- `manuscript_map.md`
- `model_candidates.md`
- `primitive_hunter_report.md`
- `model_tournament.md`
- `model_base_design.md`
- `heuristic_derivation.md`
- `theorem_candidates.md`
- `absorption_tests.md`
- `field_profile.md`
- `target_journal_profile.md`
- `literature_evidence_ledger.md`
- `derivation_notes.md`
- `pre_paper_model_note.md`
- `math_claims.md`
- `verification_log.md`
- `counterexamples.md`
- `risk_register.md`
- `revision_log.md`
- `revision_tree.md`
- `style_anchor_matrix.md`
- `style_calibration.md`
- `style_pass_plan.md`
- `generality_ledger.md`
- latest `referee_reports/round_N/00_summary.md`
- `final_report.md`
- `version_log.md`
- latest `panel_reports/*.md`

If no state file exists, begin with intake:

- no manuscript or no clear paper files: Discovery D0.
- manuscript exists: Manuscript Stage 0.

`active_context.md` is never a source of truth. Use it to find the current state quickly, then verify any important claim against the underlying artifacts such as `project_state.md`, `field_profile.md`, `target_journal_profile.md`, `literature_evidence_ledger.md`, `contribution_lock.md`, `risk_register.md`, `revision_tree.md`, and the latest panel reports.

## Low-Token State Discipline

Use `active_context.md` as an 80-120 line compact dashboard for continuation when a project becomes long. It should contain current stage, current blocker, model base status, provisional modeling constraints, next model-base test, confirmed source-of-truth artifacts, open human gates, active theorem, contribution lock status, field profile status, target journal profile status, literature evidence status, open risks, a 2-4 step horizon, the next action to execute, why that action has high information value, active safety barriers, and the best step if the user has only two hours.

Token discipline reduces redundant re-reading, repeated summaries, and boilerplate. It must not reduce research depth. For main theorem discovery, proof verification, closest-literature checks, simulated review, model tournaments, and high-stakes revision, use enough context, tools, and token budget to execute the complete workflow.

When the user explicitly asks for a full review, literature audit, theorem verification, model tournament, or full simulated review, do not substitute a lightweight summary. Run the complete relevant workflow stage and produce the required artifacts.

## Literature Evidence and Safety Barriers

Use `literature_evidence_ledger.md` as the evidence ledger for closest-paper, anchor-paper, absorption-threat, and style-anchor claims.

- Any closest-paper, anchor-paper, absorption-threat, or style-anchor claim must have a ledger entry before it is treated as high-confidence.
- If the ledger is missing or incomplete, mark downstream `field_profile.md`, `target_journal_profile.md`, `absorption_tests.md`, `panel_config.md`, and `style_calibration.md` judgments as provisional where they rely on that evidence.
- Default behavior is search/open/verify/record evidence, not bulk-download PDFs.
- Download papers only when they are open access, user-provided, or explicitly authorized by the user. If downloaded, use `literature_cache/` and record the source and permission status.
- Extract model, proof, and exposition moves from papers; do not copy copyrighted prose.

Safety barriers:

- No strong novelty claim without literature evidence.
- No full manuscript before theorem sentence and absorption test.
- No established theorem if proof status is sketch only.
- No local polishing if complexity debt is rising.
- No kill of a possible frontier spike before spike-specific tests.
- No target-journal downgrade as a substitute for theorem quality.
- No confirmed model primitives, assumptions, or equilibrium concepts before the Minimal Model Base Gate, unless the task is explicitly mechanical model solving.
- No fixed point, contraction, IFT, or existence-theorem machinery before the economic object requiring consistency has been explained.

Fault alarms:

- contribution sentence lengthening
- assumption count rising
- proof confidence stagnant
- absorption risk unresolved
- same panel criticism recurring
- model note not compressing to 5-8 pages
- `risk_register.md` growing without resolution
- model base feels mechanically formal, assumption-heavy, or lacks a small example
- formal proof machinery appears before economic necessity is established

When a fault alarm fires, stop local polishing and route to Discovery D4.5, D4-D6, Stage 8 tree search, or a human decision gate.

## Closed-Loop Next-Action Control

Use this lightweight research-control loop. Do not implement fake numerical PID, Kalman, MPC, or bandit scores.

```text
observe -> estimate -> diagnose -> constrain -> plan -> act -> update
```

For each serious candidate, the active notes should include a belief-state block when useful:

```text
Belief state:
Candidate geometry:
Evidence status: verified / inferred / speculative
Main uncertainty:
Most informative next test:
Kill condition:
Spike protection status:
```

The next action should be chosen by information value as well as progress value: what action most changes the decision-relevant uncertainty at reasonable cost?

## Cross-Project Researcher Memory

Project artifacts are the source of truth. Optional cross-project memory is a prior only, never a controlling artifact.

Default user-level location:

```text
C:\Users\<user>\.econ-theorist-ai\
```

Optional files:

```text
researcher_profile.md
method_library.md
negative_knowledge.md
proof_technique_memory.md
project_postmortems/
field_maps/
```

Rules:

- Do not copy cross-project memory into a paper project unless explicitly requested.
- Literature evidence, proof verification, and current human gates override `researcher_profile.md`.
- Use researcher memory to lower search cost, not to narrow the project into the user's usual taste.

Anti-bubble checks:

- Outside-view check: ask how a referee who does not share the user's taste would reject the project.
- Anti-profile direction: when discovery breadth matters, preserve one internally coherent direction that violates the user's usual taste.
- Adjacent-field search: field confirmation must inspect adjacent literature, not only familiar fields.
- Postmortem: record which user priors helped and which misled the project when a project ends.

## Routing Table

Use this table to choose the module.

### New Topic or Unknown Direction

Triggers:

- "new topic"
- "find a topic"
- "what should I work on"
- "explore a field"
- "I only know the broad area"
- "AI helps me enumerate research directions"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md` if the user asks for evaluation, screening, or whether the topic is worth pursuing.
- Run D0 and D1.
- If the user gave a broad field, use Field mode.
- If the user gave no field, use Open mode.
- Create or update `discovery_state.md` and `topic_longlist.md`.
- Stop at the first human gate unless the user explicitly asks for screening too.

### Rough Idea

Triggers:

- "I have an idea"
- "rough idea"
- "possible mechanism"
- "can this become a paper"
- "evaluate this idea"
- "quickly screen this idea"
- "quick screen"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Run D0 through D2 in Idea mode. Treat research execution as serious by default even if the wording is casual.
- If the user explicitly asks for a quick or no-file screen, keep the output compact but still include theorem sentence, closest-literature risk, absorption risk, and go/park/kill logic. Do not claim final novelty.
- If the user asks whether the idea is worth pursuing, run an Idea Panel in Blind or Literature Mode after D2.
- Create or update `discovery_state.md`, `topic_longlist.md`, and `topic_shortlist.md`.
- Stop for human choice among candidates.

### Literature Probe And Field Profile

Triggers:

- "literature probe"
- "literature audit"
- "full literature audit"
- "closest literature"
- "nearest substitute"
- "field profile"
- "confirm the field"
- "absorption family"
- "novelty search"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md` if the probe will feed a high-stakes panel.
- Run D3.
- Search for closest substitute papers when web/search tools are available.
- Create or update `literature_probe.md`, `literature_evidence_ledger.md`, and `field_profile.md`.
- If the user asks for a full literature audit, complete the full D3 literature path and do not substitute a lightweight summary.
- Record verified literature claims and AI inferences separately. Any nearest-substitute, anchor, or absorption-threat claim without a ledger entry remains provisional.
- Mark literature and field classifications as provisional if search tools are unavailable.
- Stop for human confirmation if `field_profile.md` is new, provisional, stale, marked `Reopen requested`, or materially changed.

### First-Run Setup and Project Initialization

Triggers:

- "first-run setup"
- "first run setup"
- "setup check"
- "toolchain check"
- "initialize this paper project"
- "first use"
- "computer setup"
- "初始化检测"
- "检查工具链"

Route:

- Read `FIRST_RUN.md` and `TOOLCHAIN_README.md` if they exist.
- Treat first-run setup as a soft gate. Recommend it only when the user is trying to execute the workflow and computer-level toolchain status is missing, stale, or unknown.
- If the user is asking a conceptual question or only discussing an idea, answer normally and do not interrupt with setup.
- If the user chooses setup check, run `.\verify_toolchain.ps1 -WriteStatus` when safe. It should detect Git, LaTeX, Python packages, Lean/Lake, and Mathematica without installing large tools or modifying system environment variables.
- If the user specifies a custom tool location, use `CODEX_VERIFICATION_HOME` or `verify_toolchain.ps1 -ConfigPath` / `-ToolRoot`.
- Interpret missing tools as capability limits, not workflow blockers. Core idea discovery, field profile, target journal profile, simulated review, style calibration, and revision planning remain available.
- If `project_state.md` is missing and the user wants to work on the paper, run Manuscript Stage 0 or Discovery D0 as appropriate after the setup prompt is resolved or skipped.
- Keep generated setup and project artifacts in English even when the chat response is in Chinese.

### Target Journal Profile

Triggers:

- "target journal"
- "journal fit"
- "target profile"
- "target ladder"
- "RAND"
- "JET"
- "Theoretical Economics"
- "GEB"
- "ReStud"
- "AER"
- "retarget"
- "目标期刊"
- "投稿目标"
- "期刊定位"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stage 1.5.
- Inspect available evidence: `idea_dossier.md`, `field_profile.md`, `literature_probe.md`, `literature_evidence_ledger.md`, `primitive_hunter_report.md`, `theorem_candidates.md`, `absorption_tests.md`, `generality_ledger.md`, `risk_register.md`, `manuscript_map.md`, and latest panel reports if available.
- If target-fit or closest-literature claims depend on papers that are not recorded in `literature_evidence_ledger.md`, mark the target profile provisional for those claims.
- If `model_base_design.md`, `theorem_candidates.md`, or closest-literature evidence is missing, treat target-level potential as provisional. Do not claim that a project is RAND-, JET-, TE-, or Econometrica-ready from the idea alone.
- Create or update `target_journal_profile.md` with primary target, stretch target, fallback target, target audience, fit standard, quality floor, theorem rigor expectation, reader path, referee mix implications, style calibration implications, upward-improvement requirements, and retargeting triggers.
- Recommend a target ladder from project evidence rather than asking the user to choose blindly. Explain whether the recommendation reflects fit, reader path, field audience, theorem strength, absorption risk, exposition needs, or a genuine quality limitation.
- Preserve upward ambition: if the primary target is RAND, still check for Econometrica, Theoretical Economics, or JET stretch potential.
- Do not lower rigor, theorem discipline, novelty scrutiny, absorption testing, or proof verification because the target is not Econometrica.
- Stop for human confirmation if `target_journal_profile.md` is missing, provisional, stale, marked `Reopen requested`, materially changed, or contradicted by a new field profile, theorem direction, target audience, or closest-literature result.

### Model Generation

Triggers:

- "generate a model"
- "tractable model"
- "model variants"
- "turn this idea into a model"
- "model tournament"
- "full model tournament"
- "model base"
- "minimal model"
- "toy example"
- "example-to-theory"
- "solve this given model"
- "mechanically solve this model"
- "find the main theorem"
- "theorem-first"
- "absorption test"
- "primitive hunter"
- "deepest primitive"
- "theorem generator"
- "non-neighborhood model"
- "reduced-form object"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md` if multiple model candidates need selection.
- Run D4.
- If the primitive is unclear or the valuable object is reduced-form, run a Primitive Hunter / Theorem Generator Panel before ordinary model generation.
- Treat any user-supplied agents, timing, information, payoffs, equilibrium concepts, or assumptions as provisional modeling constraints until the Minimal Model Base Gate confirms them.
- Create or update `primitive_hunter_report.md`, `generality_ledger.md`, `model_candidates.md`, `model_tournament.md`, `model_base_design.md`, `heuristic_derivation.md`, and `absorption_tests.md`.
- Use confirmed `field_profile.md` if available; if absorption or role assignment depends on a missing, provisional, stale, or `Reopen requested` field profile, update it from closest-literature evidence and stop for confirmation before final judgment.
- Use confirmed `target_journal_profile.md` if available for target-aware model and theorem calibration, but do not let a non-Econometrica target skip model tournament, absorption testing, generality ledger, or main-theorem gate.
- Generate broad cheap model skeletons before selecting one for full development: 20-40 total, or 10-20 per selected direction when needed. Screen them to 6-10 semi-formal baselines, then 3-5 example-to-theory candidates, and only 1-3 formal derivation candidates.
- Run D4.5 Example-to-Theory Model Base Construction before D5 unless the user explicitly asks only to solve a given model mechanically.
- Generate three non-neighborhood model directions when local repair is a risk.
- Include candidate geometry for serious candidates: local extension, recombination, possible frontier spike, absorbed benchmark, clever but shallow, or hidden gem.
- Use mutation operators when search appears trapped in local repair: primitive, endogenization, timing, information, objective, equilibrium-concept, boundary, duality, and field-transfer mutations.
- Treat nonconvex discovery as branch generation inside the existing tree search. It expands candidate coverage and protects against false kills; it does not certify quality.
- If the user explicitly asks for a model tournament or full model tournament, complete the model-tournament path: D4 model generation, D4.5 model-base gate, D5 derivation where needed, and D6 absorption/main-theorem gate before recommending a winner. Do not merely summarize candidate variants.
- Do not enter manuscript mode until a candidate theorem survives the main-theorem gate.
- If selecting among candidates, run a Model Panel.
- If candidate models already exist, ask only if the user wants new variants or derivation.

### First-Pass Derivation

Triggers:

- "derive"
- "solve the model"
- "main proposition"
- "theorem verification"
- "full theorem verification"
- "comparative static"
- "equilibrium conditions"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md` and `ECONOMETRICA_VERIFICATION_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md` for theorem/model claims with high stakes.
- If the user explicitly asks to solve a given model mechanically, run direct derivation and verification but do not claim research quality or target-journal potential.
- Otherwise require `model_base_design.md` and `heuristic_derivation.md`, or route to D4.5 before D5.
- Run Discovery D5 plus Verification V1-V4 as needed.
- Use a Verification Panel for the main proposition, equilibrium existence, identification result, or any theorem that carries the contribution.
- Create or update `derivation_notes.md`, `theorem_candidates.md`, `math_claims.md`, `assumption_ledger.md`, `verification_log.md`, and `counterexamples.md`.
- Require a candidate theorem sentence: "This paper proves X, and existing theory cannot obtain X because Y."
- Use Python first for quick symbolic/numerical checks; use Mathematica if symbolic assumptions or inequalities benefit from it; use Lean only for compact lemmas.

### Local Optimum or Manuscript Trap

Triggers:

- "local optimum"
- "局部极值"
- "局部最优"
- "local maximum"
- "local trap"
- "stuck in local optimum"
- "low quality trap"
- "低质量陷阱"
- "越改越复杂"
- "越修越差"
- "离 Econometrica 越来越远"
- "打补丁"
- "主定理不清楚"
- "被旧理论吸收"
- "假设越来越多"
- "贡献句越来越长"
- "一般性下降"
- "模型越来越特殊"
- "revision trap"
- "patching mode"
- "too many patches"
- "overfitting to referee comments"
- "over-polishing"
- "nugget is getting weaker"
- "theorem package"
- "too close to existing theory"
- "assumption creep"
- "losing generality"
- "special-case trap"
- "moving away from Econometrica"
- "too much polishing"
- "defensive dilution"
- "nugget"
- "scientific judge"
- "no central theorem"
- "main theorem is weak"
- "absorbed by existing theory"
- "old theory can absorb it"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Stop manuscript polishing.
- Run Discovery D4.5 or D4-D6: model-base construction, model tournament, first-pass derivation, absorption test, and main-theorem gate.
- Start with a Primitive Hunter / Theorem Generator Panel if the deepest primitive is unclear or the current theorem is weak.
- Include D4.5 Example-to-Theory Model Base Construction when the model feels mechanically formal, assumption-heavy, too special, or lacks a clear smallest example.
- Create or update `primitive_hunter_report.md`, `generality_ledger.md`, `model_tournament.md`, `model_base_design.md`, `heuristic_derivation.md`, `theorem_candidates.md`, `absorption_tests.md`, `field_profile.md`, `target_journal_profile.md` if target fit is implicated, and `idea_kill_tests.md`.
- Reuse confirmed `field_profile.md` unless the closest-literature evidence, primitive, theorem direction, or target audience has materially changed.
- Reuse confirmed `target_journal_profile.md` unless the field, theorem direction, target audience, contribution strength, or absorption risk has materially changed.
- Generate a Multi-Path Dashboard comparing at least Preserve, Simplify, Pivot, and Kill/Demote paths when evidence supports more than one route.
- Do not directly edit the manuscript until the human selects a path.
- If two independent review rounds share the same structural objection, require Pivot, Demote to benchmark, Park, or Kill unless the human explicitly overrides.
- Do not return to Stage 6 or Stage 8 until a human approves a new theorem sentence.

### Mathematical Verification

Triggers:

- "check the proof"
- "verify the theorem"
- "find counterexamples"
- "use Python"
- "use Mathematica"
- "use Lean"
- "formal verification"

Route:

- Read `ECONOMETRICA_VERIFICATION_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md` for main results or disputed claims.
- Run V0 if tool availability is unknown.
- Run V1 if claims are not extracted.
- For a named theorem/proposition, run V2-V5 for that claim.
- For central claims, run a Verification Panel and then V2-V5.
- Use V6-V7 only if a compact lemma is suitable for formalization.
- Stop before changing theorem assumptions or economic interpretation.

### Manuscript Intake

Triggers:

- "here is my paper"
- "open this paper folder"
- "start revising"
- "analyze this draft"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stage 0.
- Create or update `project_state.md` and `manuscript_map.md`.
- Stop for confirmation before judging or editing if this is the first pass.

### Idea Kill Test for a Paper

Triggers:

- "kill test"
- "is this Econometrica-level"
- "does this deserve Econometrica"
- "judge the contribution"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Run Stage 1.
- Use an Idea Panel when the user asks for a serious frontier-level or target-journal go/no-go judgment.
- Do not edit the manuscript.
- Create or update `idea_dossier.md`.
- If the user asks about journal fit in the same request, run Stage 1.5 after the Stage 1 evidence is assembled. Otherwise, if the human later chooses `Proceed`, make Stage 1.5 the next safe stage.
- Stop at the human gate.

### Contribution Lock

Triggers:

- "lock the contribution"
- "central question"
- "non-substitutable insight"
- "reader belief update"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stage 2.
- Create or update `contribution_lock.md`.
- Stop for approval.

### Deep Manuscript Revision

Triggers:

- "revise the paper"
- "improve the draft"
- "write the introduction"
- "make it Econometrica-ready"
- "section-by-section revision"

Route:

- If `contribution_lock.md` or a sharp main theorem sentence does not exist, return to Discovery D4.5 or D4-D6 first.
- If the leading risk is "no central theorem," "too close to old theory," "absorbed by known models," or "unnatural model base," return to Discovery D4.5 or D4-D6 rather than revising prose.
- If contribution is locked, read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stages 3, 4, and 6 as appropriate.
- Use `ECONOMETRICA_VERIFICATION_WORKFLOW.md` for mathematical claims.
- Compile when possible.
- Update `revision_log.md` and `risk_register.md`.
- Stop if a foundational issue appears.

### Deep Style Anchor Pass and Exposition Elegance

Triggers:

- "style calibration"
- "Deep Style Anchor Pass"
- "elegance without rhetoric"
- "文章太机械"
- "读起来像做数学题"
- "提升可读性"
- "make it less mechanical"
- "improve exposition without lowering rigor"
- "improve readability"
- "humanize the prose"
- "make the paper read less mechanically"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stage 6.5.
- Reuse confirmed `field_profile.md` when current; do not reopen field confirmation for style calibration alone.
- Reuse confirmed `target_journal_profile.md` when current; do not reopen target confirmation for style calibration alone.
- If `style_calibration.md` is missing, provisional, stale, or inconsistent with the current theorem, contribution lock, field profile, target journal profile, or target audience, run a Deep Style Anchor Pass first and stop for human confirmation before a full style pass.
- Prefer user-provided PDFs or a user-provided local literature folder when available.
- Search for 5-8 field-matched, target-matched, same-genre, high-level published papers as style anchors when web/search tools are available. If fewer high-quality full-text anchors are legally available, use 3-5 and mark the coverage limitation.
- Prefer full-text anchors from user-provided PDFs, open-access papers, working papers, author-posted versions, SSRN, NBER, RePEc, journal open pages, or papers the user explicitly authorizes.
- Do not do unauthorized bulk downloads. If downloaded, store only legally available or authorized files in `literature_cache/style_anchors/` and record source and permission status.
- Record style anchors in `literature_evidence_ledger.md`; if anchors are not backed by ledger entries, mark the style calibration provisional.
- Create or update `style_anchor_notes/`, `style_anchor_matrix.md`, `style_calibration.md`, and `style_pass_plan.md`.
- If only abstracts, web pages, or fragments are available, mark that anchor's style evidence as provisional, label it as provisional style evidence, and state that the calibration is based on partial anchors.
- Treat style anchors as calibration evidence, not prose templates: extract exposition architecture and exposition moves, not sentences.
- Do not change the central question, main theorem, model primitives, assumptions, novelty claim, target journal positioning, or unverified literature claims.
- If the manuscript is mechanical because the theorem is weak, the contribution is unclear, assumptions are patchy, defensive dilution is present, or the model base is unnatural, route to Discovery D4.5, D4-D6, or Stage 8 tree search instead of polishing.
- After human confirmation of the style contract in `style_calibration.md`, perform a paragraph-level manuscript style pass using `style_pass_plan.md`; improve reader path, transitions, motivation, theorem setup, assumption interpretation, proof roadmap, paragraph pacing, and flow; then update `revision_log.md` and compile when possible.

### Simulated Review

Triggers:

- "simulate referees"
- "review like Econometrica"
- "target-calibrated review"
- "review for RAND"
- "review for JET"
- "review for Theoretical Economics"
- "review for GEB"
- "run editorial board"
- "give referee reports"
- "full review"
- "full simulated review"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Run Stage 7.
- If the user asks for a full review or full simulated review, complete the full Stage 7 review workflow and required artifacts rather than issuing a lightweight summary.
- Reuse confirmed `field_profile.md` when it exists; if it is missing, provisional, stale, or marked `Reopen requested`, create or update it from the closest-literature evidence and ask for field confirmation before running the referee prompts.
- Reuse confirmed `target_journal_profile.md` when it exists; if it is missing, provisional, stale, or marked `Reopen requested`, create or update it from the manuscript, theorem, closest-literature, target-audience, and user-preference evidence and ask for target confirmation before running target-sensitive referee prompts.
- Then create `referee_reports/round_N/panel_config.md` by detecting the manuscript's narrowest field, confirmed target, target audience, closest literature themes, main method, contribution type, and main technical risk.
- Include target-calibrated calibration anchors in `panel_config.md`; if close anchors for the confirmed target cannot be named confidently, write anchor TODOs rather than inventing citations.
- Anchor papers and absorption-threat papers used by the panel must appear in `literature_evidence_ledger.md`; otherwise mark the corresponding panel conclusion provisional.
- Assign referees dynamically from `panel_config.md`; do not use a fixed field template unless the manuscript warrants it.
- Do not reuse earlier paper-specific methodology files as referee-role templates unless the current `panel_config.md` re-justifies the same assignments.
- Prefer parallel isolated referee agents when the runtime supports agent delegation; otherwise run serial isolated referee prompts.
- Add a Scientific Judge / Idea Critic for Nugget Test, Occam Test, and Defensive Dilution assessment.
- Add an Advocate / Best-Case Reader to state the strongest defensible acceptance case and counter reject-prior drift.
- If `contribution_lock.md` exists, create `referee_reports/round_N/dilution_check.md` using only the current manuscript and `contribution_lock.md`; referees must not read it.
- Use a Review Panel in Blind Mode unless the user explicitly asks for context-aware revision review.
- Do not edit the manuscript in this pass unless explicitly asked.
- Write `referee_reports/round_N/` reports.
- Update `risk_register.md`.
- Stop for human decision.
- If the review's leading objection is missing central theorem, old-theory absorption, weak contribution, unnatural model base, or failure to meet the target profile's quality floor, recommend Discovery D4.5 or D4-D6 instead of Stage 8.

### Referee-Guided Revision

Triggers:

- "revise according to referee"
- "respond to review"
- "fix round_N"
- "use the latest referee report"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Run Stage 8 using the latest referee report.
- Use a Revision Panel when objections conflict or when major edits could dilute the contribution.
- If the latest report repeats a structural objection from a prior round, such as missing central theorem, unnatural model base, or old-theory absorption, route to Discovery D4.5 or D4-D6 instead of local revision.
- Create `revision_tree.md` with Branch A Defensive Patch, Branch B Mechanism Simplification, and Branch C Pivot and Reframe.
- Run the Scientific Judge on the branch plans.
- Stop for human branch choice before direct manuscript edits.
- Edit only after the human selects a branch and only where safe.
- Stop before conceptual changes that require human approval.

### Final Readiness

Triggers:

- "final check"
- "ready to submit"
- "submission readiness"
- "final report"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stage 10.
- Do not make major conceptual edits.
- Write or update `final_report.md`.

### Research OS Dashboard

Triggers:

- "what should I do today"
- "where is this project stuck"
- "if I only have two hours"
- "highest-value next action"
- "current blocker"
- "今天我该做什么"
- "这个项目卡在哪里"
- "只花两小时"

Route:

- Inspect `active_context.md` first if it exists, treating it only as a dashboard.
- Verify the dashboard against source artifacts such as `project_state.md`, `human_decisions.md`, `field_profile.md`, `target_journal_profile.md`, `literature_evidence_ledger.md`, `contribution_lock.md`, `risk_register.md`, `revision_tree.md`, and panel reports.
- Report current stage, current blocker, pending human gate if any, safety barriers active, a 2-4 step horizon, the next action to execute, and why that action has the highest information value.
- If a human gate is pending, present the explicit human gate format and stop.
- Do not create a new research path solely for the dashboard; use the current source artifacts to choose the next safe action.

### Version Control and Rollback

Triggers:

- "checkpoint"
- "commit"
- "diff"
- "version"
- "rollback"
- "回退"
- "compare rounds"
- "branch"
- "worktree"

Route:

- Read `ECONOMETRICA_VERSION_CONTROL.md`.
- For status/checkpoint, run G0-G1.
- For ordinary editing sessions, use the default automation policy: status check, safe AI branch if clean, checkpoint logging, and post-edit diff summary.
- For post-edit review, run G3.
- For commits/tags, run G4-G5 and ask approval.
- For rollback, run G6 and ask before executing destructive commands.

## Auto-Continue Rules

The assistant may automatically proceed from:

- D0 to D1 when the user asks for new-topic exploration.
- D1 to D2 when the user explicitly asks for screening.
- D4 to D4.5 when the task is research model development.
- D4 or D4.5 to D5 only after the Minimal Model Base Gate, or when the user explicitly asks only to solve a given model mechanically.
- V1 to V4 for a named mathematical claim.
- Stage 1 to Stage 1.5 after the human chooses `Proceed`, or when the user explicitly asks for journal fit or target ladder.
- Stage 3 to Stage 6 after contribution lock is approved.
- Stage 7 to Stage 8 only if the user explicitly asks to revise according to the report and the leading objection is not missing central theorem, old-theory absorption, weak contribution, unnatural model base, or defensive dilution.

The assistant must stop at gates involving:

- first-time or materially changed field profile confirmation
- target journal choice
- first-time or materially changed target journal profile confirmation
- central research question
- main theorem
- Minimal Model Base Gate
- model primitives
- assumption set
- novelty claim
- economic interpretation
- decision to submit, pivot, retarget, split, or abandon

## Human Decision Persistence

When a human gate is reached, the assistant must not rely on chat memory as the only record. After the user chooses, create `human_decisions.md` if it is missing, append the decision, and update the active state file, such as `project_state.md`, `discovery_state.md`, `model_base_design.md`, `field_profile.md`, `target_journal_profile.md`, `style_calibration.md`, `contribution_lock.md`, `risk_register.md`, or `revision_tree.md`.

If the user reverses an earlier decision, record the reversal as a new entry rather than deleting the old one. The new decision supersedes the old decision for current routing. The reversal entry should identify the previous decision, new decision, reason, affected artifacts, and any stages, panels, proofs, or literature checks that must be rerun.

## Current-State Continuation

Route Chinese continuation commands such as `按系统继续` and `按系统处理` here.

When the user says "continue" or "按系统继续":

1. Inspect `active_context.md` first if it exists, treating it as a dashboard only.
2. Identify the most recent completed stage.
3. Identify whether a human gate is awaiting a decision.
4. If a gate is awaiting a decision, summarize the decision needed and stop.
5. If no gate is pending, recommend and run the next safe stage.

Priority order for continuation:

1. Resolve pending human gate.
2. Verify unresolved mathematical claims.
3. Address fatal risks in `risk_register.md`.
4. Continue the current module's next stage.
5. If unclear, run an intake/status reconstruction pass.

## Minimal Prompt the User Can Use

For most work, the user can simply say:

```text
Read ECONOMETRICA_ORCHESTRATOR.md and proceed according to the system. My task is: [brief description].
```

If this file is referenced by `AGENTS.md`, the user can usually shorten this to:

```text
按系统处理：[brief description]
```

## Response Style

At the beginning of a routed task, the assistant should say only:

```text
I will route this to [module] [stage] because [short reason].
```

Then execute. Avoid dumping the whole workflow back to the user unless asked.
