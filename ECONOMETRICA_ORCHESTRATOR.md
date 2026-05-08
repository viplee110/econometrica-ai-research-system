# Econometrica Research Orchestrator

Version: 2026-05-08

This is the single entry point for the Econometrica research system. When the user gives a broad instruction, do not require them to remember workflow file names or stage numbers. Read this file, infer the task type, inspect available state files, choose the next appropriate module, and proceed until a human gate is reached.

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
Check the math carefully.
```

```text
Run a simulated Econometrica review.
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

- `project_state.md`
- `discovery_state.md`
- `human_decisions.md`
- `idea_dossier.md`
- `contribution_lock.md`
- `manuscript_map.md`
- `model_candidates.md`
- `primitive_hunter_report.md`
- `model_tournament.md`
- `theorem_candidates.md`
- `absorption_tests.md`
- `field_profile.md`
- `derivation_notes.md`
- `pre_paper_model_note.md`
- `math_claims.md`
- `verification_log.md`
- `counterexamples.md`
- `risk_register.md`
- `revision_log.md`
- `revision_tree.md`
- latest `referee_reports/round_N/00_summary.md`
- `final_report.md`
- `version_log.md`
- latest `panel_reports/*.md`

If no state file exists, begin with intake:

- no manuscript or no clear paper files: Discovery D0.
- manuscript exists: Manuscript Stage 0.

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

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Run D0 through D2 in Idea mode.
- If the user asks whether the idea is worth pursuing, run an Idea Panel in Blind or Literature Mode after D2.
- Create or update `discovery_state.md`, `topic_longlist.md`, and `topic_shortlist.md`.
- Stop for human choice among candidates.

### Literature Probe And Field Profile

Triggers:

- "literature probe"
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
- Create or update `literature_probe.md` and `field_profile.md`.
- Mark literature and field classifications as provisional if search tools are unavailable.
- Stop for human confirmation if `field_profile.md` is new, provisional, stale, marked `Reopen requested`, or materially changed.

### Model Generation

Triggers:

- "generate a model"
- "tractable model"
- "model variants"
- "turn this idea into a model"
- "model tournament"
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
- Create or update `primitive_hunter_report.md`, `model_candidates.md`, `model_tournament.md`, and `absorption_tests.md`.
- Use confirmed `field_profile.md` if available; if absorption or role assignment depends on a missing, provisional, stale, or `Reopen requested` field profile, update it from closest-literature evidence and stop for confirmation before final judgment.
- Generate 4-6 model variants before selecting one for full development.
- Generate three non-neighborhood model directions when local repair is a risk.
- Do not enter manuscript mode until a candidate theorem survives the main-theorem gate.
- If selecting among candidates, run a Model Panel.
- If candidate models already exist, ask only if the user wants new variants or derivation.

### First-Pass Derivation

Triggers:

- "derive"
- "solve the model"
- "main proposition"
- "comparative static"
- "equilibrium conditions"

Route:

- Read `ECONOMETRICA_DISCOVERY_WORKFLOW.md` and `ECONOMETRICA_VERIFICATION_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md` for theorem/model claims with high stakes.
- Run Discovery D5 plus Verification V1-V4 as needed.
- Use a Verification Panel for the main proposition, equilibrium existence, identification result, or any theorem that carries the contribution.
- Create or update `derivation_notes.md`, `theorem_candidates.md`, `math_claims.md`, `assumption_ledger.md`, `verification_log.md`, and `counterexamples.md`.
- Require a candidate theorem sentence: "This paper proves X, and existing theory cannot obtain X because Y."
- Use Python first for quick symbolic/numerical checks; use Mathematica if symbolic assumptions or inequalities benefit from it; use Lean only for compact lemmas.

### Local Optimum or Manuscript Trap

Triggers:

- "local optimum"
- "局部极值"
- "low quality trap"
- "低质量陷阱"
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
- Run Discovery D4-D6: model tournament, first-pass derivation, absorption test, and main-theorem gate.
- Start with a Primitive Hunter / Theorem Generator Panel if the deepest primitive is unclear or the current theorem is weak.
- Create or update `primitive_hunter_report.md`, `model_tournament.md`, `theorem_candidates.md`, `absorption_tests.md`, `field_profile.md`, and `idea_kill_tests.md`.
- Reuse confirmed `field_profile.md` unless the closest-literature evidence, primitive, theorem direction, or target audience has materially changed.
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
- Use an Idea Panel when the user asks for a serious Econometrica-level go/no-go judgment.
- Do not edit the manuscript.
- Create or update `idea_dossier.md`.
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

- If `contribution_lock.md` or a sharp main theorem sentence does not exist, return to Discovery D4-D6 first.
- If the leading risk is "no central theorem," "too close to old theory," or "absorbed by known models," return to Discovery D4-D6 rather than revising prose.
- If contribution is locked, read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Run Stages 3, 4, and 6 as appropriate.
- Use `ECONOMETRICA_VERIFICATION_WORKFLOW.md` for mathematical claims.
- Compile when possible.
- Update `revision_log.md` and `risk_register.md`.
- Stop if a foundational issue appears.

### Simulated Review

Triggers:

- "simulate referees"
- "review like Econometrica"
- "run editorial board"
- "give referee reports"

Route:

- Read `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.
- Read `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Run Stage 7.
- Reuse confirmed `field_profile.md` when it exists; if it is missing, provisional, stale, or marked `Reopen requested`, create or update it from the closest-literature evidence and ask for field confirmation before running the referee prompts.
- Then create `referee_reports/round_N/panel_config.md` by detecting the manuscript's narrowest field, closest literature themes, main method, contribution type, and main technical risk.
- Include calibration anchors in `panel_config.md`; if close Econometrica anchors cannot be named confidently, write anchor TODOs rather than inventing citations.
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
- If the review's leading objection is missing central theorem or old-theory absorption, recommend Discovery D4-D6 instead of Stage 8.

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
- If the latest report repeats a structural objection from a prior round, such as missing central theorem or old-theory absorption, route to Discovery D4-D6 instead of local revision.
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
- D4 to D5 when the user explicitly asks to solve or derive.
- V1 to V4 for a named mathematical claim.
- Stage 3 to Stage 6 after contribution lock is approved.
- Stage 7 to Stage 8 only if the user explicitly asks to revise according to the report and the leading objection is not missing central theorem, old-theory absorption, or weak contribution.

The assistant must stop at gates involving:

- first-time or materially changed field profile confirmation
- target journal choice
- central research question
- main theorem
- model primitives
- assumption set
- novelty claim
- economic interpretation
- decision to submit, pivot, retarget, split, or abandon

## Human Decision Persistence

When a human gate is reached, the assistant must not rely on chat memory as the only record. After the user chooses, create `human_decisions.md` if it is missing, append the decision, and update the active state file, such as `project_state.md`, `discovery_state.md`, `field_profile.md`, `contribution_lock.md`, `risk_register.md`, or `revision_tree.md`.

If the user reverses an earlier decision, record the reversal as a new entry rather than deleting the old one. The new decision supersedes the old decision for current routing. The reversal entry should identify the previous decision, new decision, reason, affected artifacts, and any stages, panels, proofs, or literature checks that must be rerun.

## Current-State Continuation

When the user says "continue" or "按系统继续":

1. Inspect the state files.
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
