# Independent Panel Protocol for Econometrica-Level Research

Version: 2026-05-02

This protocol generalizes a stronger simulated review methodology into a reusable decision procedure for the entire research lifecycle. Use it whenever the system must make a high-stakes judgment about an idea, model, derivation, manuscript, referee report, or revision plan.

The core pattern is:

```text
independent specialist judgments
-> explicit disagreement
-> Associate Editor synthesis
-> Co-Editor decision
-> parent-agent summary of consensus, disagreement, omissions, and next actions
```

The purpose is not to make the AI "vote." The purpose is to reduce self-confirmation, preserve real disagreement, and force decisions to be tied to specific claims, assumptions, equations, theorems, manuscript locations, or literature comparisons.

## Dynamic Panel Configuration

Before assigning any referee roles, create or update a panel configuration file:

- `panel_reports/panel_config.md` for idea, model, verification, and revision panels.
- `referee_reports/round_N/panel_config.md` for simulated manuscript reviews.

The panel configuration must infer the narrowest defensible research field and the closest literature themes from the target material. Do not hard-code IO, search theory, network theory, contract theory, asset pricing, econometrics, behavioral economics, or any other field unless the manuscript, model, or closest-literature comparison actually warrants it.

The parent agent must finish and save `panel_config.md` before writing any individual referee prompt. Each referee prompt must be generated from that saved configuration. Prior rounds, historical review methodology files, or examples may be used only as evidence about earlier work, not as role templates, unless the current `panel_config.md` independently justifies the same assignments.

The configuration must include:

- detected primary field and subfield
- evidence used for the field and subfield classification
- confidence in the classification and main classification uncertainty
- closest literature themes and nearest substitute papers if known
- main contribution type: theory, econometrics, empirical, experimental, computational, institutional, or mixed
- central method or model class
- main technical risk: proof, identification, equilibrium existence, computation, data, measurement, institutional interpretation, or novelty
- selected referee roles and why each role is necessary
- allowed materials, prohibited materials, and web/search policy
- execution mode: parallel independent agents if available; serial isolated simulation otherwise

For Review Panels, the default role logic is:

- Referee 1: primary-field specialist selected from the detected narrow field.
- Referee 2: closest-literature or adjacent-field specialist selected from the nearest substitute literature.
- Referee 3: method, mechanism, application, or institutional specialist selected from the manuscript's actual contribution.
- Referee 4: rigor specialist selected from the main risk type, such as mathematical proof, econometric identification, computation, empirical design, experimental design, or institutional interpretation.
- Referee 5: Scientific Judge / Idea Critic who runs the Nugget Test and Occam Test.
- Referee 6: Advocate / Best-Case Reader who argues for acceptance if acceptance were required, and states the strongest defensible "why should we care?" case in the paper's own terms.

If the target spans multiple fields, the panel must explain the tradeoff and choose the referee mix that is most likely to reveal fatal objections, not the mix that is easiest for the AI to simulate.

For Idea, Model, Verification, and Revision Panels, the role descriptions below are functional slots rather than fixed field assignments. The `panel_config.md` must specialize each slot to the detected field, literature, method, and risk before execution. For example, "closest-literature specialist" is not enough; the configuration should state which closest literature family the specialist represents and why.

Minimum `panel_config.md` schema:

```text
Target:
Panel type and information mode:
Detected primary field and subfield:
Evidence for classification:
Classification confidence and uncertainty:
Closest literature themes / nearest substitutes:
Contribution type:
Central method or model class:
Main technical risk:
Calibration anchors (required for Review Panels):
Control-paper calibration plan (optional but recommended):
Allowed materials:
Prohibited materials:
Web/search policy:
Execution mode:
Referee assignments:
AE and Co-Editor instructions:
Risks of this assignment:
```

## Calibration Anchors and Control-Paper Checks (Review Panels)

Simulated "Econometrica-level" review has a strong reject prior. Without calibration, a panel can become stricter than the journal it aims to simulate.

### Calibration anchors (required)

For every Review Panel, `referee_reports/round_N/panel_config.md` must include:

- 2-3 **calibration anchors**: short descriptions of published Econometrica papers that are genuinely close to the manuscript's neighborhood (field + method + contribution type).
- A sentence instructing referees to calibrate their "Fit for Econometrica" judgment **against the anchors**, not an idealized standard.

Rules:

- Do not fabricate citations. If anchors cannot be named with high confidence, list them as TODOs and state what the anchors should be (topic/method).
- Anchors are for calibration, not for claiming novelty. Novelty remains a separate audit.

### Control-paper calibration (recommended)

Periodically run the same Review Panel protocol on a **published Econometrica paper** (author/title removed if possible) and record the decision distribution.

- If the panel rejects a known-accepted paper, treat the panel as miscalibrated and discount "reject" language in subsequent simulations.
- Save results in a local `panel_calibration_log.md` in the paper project (not in this workflow repo).

## Execution Mode

Prefer real parallel independence when the runtime supports agent delegation. On models or IDEs with native agents, such as future GPT-5.5-class or Claude/Opus-class agentic runtimes when available, the referee reports should be run as parallel, isolated workers by default:

- Each referee receives the same allowed materials and its assigned role from `panel_config.md`.
- Referees must not read other referee outputs.
- The Associate Editor starts from an independent judgment before reading referee reports.
- The Co-Editor starts from an independent judgment before reading the AE and referee reports.

When the runtime does not provide true agents, simulate independence serially:

- Run each referee in a separate prompt block.
- Do not show earlier referee outputs to later referees.
- Save each report before starting the next one.
- Only the AE and Co-Editor may read the full report set at their synthesis stages.

Never claim true parallel independence unless the environment actually ran separate agents or isolated workers.

## When To Use

Use this protocol for:

- idea kill tests
- broad topic screening
- primitive hunting and theorem generation
- tractable model selection
- first-pass theorem or equilibrium assessment
- mathematical proof audits
- simulated Econometrica reviews
- referee-guided revision triage
- final readiness decisions

Do not use a full panel for small copyediting, formatting, bibliography cleanup, or mechanical LaTeX fixes.

## Information Modes

Choose one mode before running a panel.

### Blind Mode

Use for independent evaluation:

- idea kill tests
- manuscript review
- final readiness checks
- external-style referee simulations

Rules:

- Panelists read only the allowed manuscript/idea/model materials.
- Panelists must not read prior referee reports, revision logs, risk registers, old drafts, previous AI discussions, or workflow notes unless explicitly permitted.
- Panelists do not read each other's outputs.
- External web search is off unless the panel is explicitly a literature audit.

### Context Mode

Use for constructive work:

- revision planning
- proof repair
- model redesign
- response to referee reports

Rules:

- Panelists may read relevant state files and previous reports.
- The synthesis must distinguish old objections from newly discovered issues.
- The system must avoid overfitting to prior AI reports.

### Literature Mode

Use for novelty and positioning:

- closest-literature search
- novelty audit
- contribution positioning
- absorption-family identification

Rules:

- Web search or external paper lookup should be used when available.
- Closest literature themes and absorption families must be updated from the papers actually found, not fixed from a prewritten field list.
- If web/search tools are unavailable, mark the literature classification and any absorption conclusion as provisional.
- Every literature claim must be labeled as verified, unverified, or inferred.
- Missing citations should be marked as TODO rather than invented.

## Panel Types

### Idea Panel

Use before committing to a paper.

Roles:

- Referee 1: economic importance and field relevance.
- Referee 2: closest-literature, novelty risk, and absorption by existing theory.
- Referee 3: tractability and model feasibility.
- Referee 4: hostile editor focused on fatal objections.
- Associate Editor: synthesizes the four reports and recommends Proceed, Pivot, Narrow, Split, Park, Kill, or Retarget.
- Co-Editor: independently decides whether to accept the AE recommendation or override it.

Outputs:

- `panel_reports/panel_config.md`
- `panel_reports/idea_referee_1.md`
- `panel_reports/idea_referee_2.md`
- `panel_reports/idea_referee_3.md`
- `panel_reports/idea_referee_4.md`
- `panel_reports/idea_ae_report.md`
- `panel_reports/idea_co_editor_decision.md`

### Model Panel

Use after candidate models exist.

Roles:

- Referee 1: minimalist tractability and baseline clarity, specialized to the model class in `panel_config.md`.
- Referee 2: economic mechanism and comparative statics, specialized to the detected field.
- Referee 3: novelty and absorption risk relative to the closest canonical or substitute models.
- Referee 4: rigor specialist selected from the candidate model's main risk, such as existence, uniqueness, fixed point, IFT, contraction, boundary behavior, computation, or assumption packaging.
- Associate Editor: selects Invest, Refine, Pivot, Demote to Benchmark, Park, or Kill for each model.
- Co-Editor: decides which model, if any, should enter the pre-paper model-note stage.

Outputs:

- `panel_reports/panel_config.md`
- `panel_reports/model_referee_1.md`
- `panel_reports/model_referee_2.md`
- `panel_reports/model_referee_3.md`
- `panel_reports/model_referee_4_rigor.md`
- `panel_reports/model_ae_report.md`
- `panel_reports/model_co_editor_decision.md`

### Primitive Hunter / Theorem Generator Panel

Use before model selection when the current project risks local repair, weak theorem search, or reduced-form primitives. This panel does not review or revise a manuscript. It searches for deeper primitives and non-neighborhood theorem directions.

Core questions:

- What is the deepest economic primitive in the current idea or paper?
- Is the valuable object being treated as reduced-form rather than generated by the model?
- If the main theorem is weak, should the project change theorem, change model, or keep the question but change primitive?
- Can the panel generate three non-neighborhood models rather than small variants of the current model?

Roles:

- Hunter 1: primitive archaeologist who strips away labels and identifies the irreducible economic object.
- Hunter 2: endogenization designer who asks which reduced-form object must be generated inside the model.
- Hunter 3: non-neighborhood model generator who proposes three models outside the current local basin.
- Hunter 4: theorem generator who states candidate theorem sentences for each primitive/model direction.
- Scientific Judge: runs the Nugget, Occam, and absorption tests on the generated directions.
- Associate Editor: recommends Keep Question / Change Primitive / Change Theorem / Change Model / Park / Kill.
- Co-Editor: decides which primitive-theorem direction, if any, should enter D4 model tournament.

Outputs:

- `panel_reports/panel_config.md`
- `panel_reports/primitive_hunter_report.md`
- updated `model_candidates.md`
- updated `theorem_candidates.md`
- updated `absorption_tests.md`

### Verification Panel

Use for theorem, proposition, equilibrium, identification, or comparative-static checks.

Roles:

- Referee 1: re-derivation from primitives.
- Referee 2: symbolic and numerical counterexample search.
- Referee 3: proof structure and hidden assumptions.
- Referee 4: formalization triage, Lean suitability, and rigor focus selected from the claim's main risk in `panel_config.md`.
- Associate Editor: classifies each claim as Verified, Partially Verified, Needs Assumption, Counterexample Found, or Fatal Gap.
- Co-Editor: approves theorem restatement, proof repair path, or claim withdrawal.

Outputs:

- `panel_reports/panel_config.md`
- `panel_reports/verification_referee_1.md`
- `panel_reports/verification_referee_2.md`
- `panel_reports/verification_referee_3.md`
- `panel_reports/verification_referee_4_formal.md`
- `panel_reports/verification_ae_report.md`
- `panel_reports/verification_co_editor_decision.md`

### Review Panel

Use for simulated Econometrica review.

Before assigning roles, create `referee_reports/round_N/panel_config.md` using the Dynamic Panel Configuration rules above.

Roles:

- Referee 1: primary-field specialist selected from the manuscript's narrowest defensible field.
- Referee 2: closest-literature or adjacent-field specialist selected from the nearest substitute literature.
- Referee 3: method, mechanism, application, or institutional specialist selected from the paper's actual contribution.
- Referee 4: rigor specialist selected from the main risk type: mathematical proof, econometric identification, computational reproducibility, empirical design, experimental design, or institutional interpretation.
- Referee 5: Scientific Judge / Idea Critic. This referee does not audit algebra. It judges taste, strategy, simplicity, and whether the paper's nugget survives the revision process.
- Associate Editor: independent read first, then synthesis of referee reports.
- Co-Editor: independent read first, then decision letter and internal notes.

Outputs:

- `referee_reports/round_N/referee_1.md`
- `referee_reports/round_N/referee_2.md`
- `referee_reports/round_N/referee_3.md`
- `referee_reports/round_N/referee_4_rigor.md`
- `referee_reports/round_N/referee_5_scientific_judge.md`
- `referee_reports/round_N/referee_6_advocate.md`
- `referee_reports/round_N/dilution_check.md`
- `referee_reports/round_N/associate_editor_report.md`
- `referee_reports/round_N/co_editor_decision.md`
- `referee_reports/round_N/00_summary.md`

### Revision Panel

Use after reports exist but before major edits.

Roles:

- Referee 1: which objections are fatal.
- Referee 2: which objections are fixable without changing the contribution.
- Referee 3: which edits would dilute the core idea.
- Referee 4: which fixes require new assumptions, proofs, computations, citations, or a return to model discovery.
- Associate Editor: creates a ranked revision plan.
- Co-Editor: approves Revise, Pivot, Retarget, External Feedback, or Stop.

Outputs:

- `panel_reports/panel_config.md`
- `panel_reports/revision_triage.md`
- updated `risk_register.md`
- updated `revision_log.md`

## Generic Panel Phases

### P0 - Scope and Allowed Materials

Before running a panel, define:

- target object: idea, model, theorem, manuscript, review report, or revision plan
- dynamic referee configuration and execution mode
- allowed files
- prohibited files
- web/search policy
- output directory
- decision labels

If the panel is blind, explicitly list prohibited materials.

### P1 - Independent Specialist Reports

Each referee must:

- produce an independent report
- state recommendation and confidence
- cite exact locations when judging a manuscript or proof
- identify fatal concerns before minor concerns
- avoid reading other reports

Recommendation must be chosen from an explicit set. Do not use vague language such as "maybe promising" without a label.

### P2 - Associate Editor Synthesis

The AE must:

1. first produce an independent judgment before reading referee reports
2. then read all referee reports
3. identify consensus
4. identify real disagreement
5. identify collective omissions
6. make a signed recommendation

The AE must not mechanically average or majority-vote the reports.

### P3 - Co-Editor Decision

The Co-Editor must:

1. first produce an independent judgment when the target material is available
2. then read AE and referee reports
3. decide whether to agree with or override the AE
4. write a decision and internal notes

The Co-Editor must explain the reason for agreement or override.

### P4 - Parent-Agent Summary

The parent agent must create a summary with:

- recommendation distribution
- consensus objections
- disagreement structure
- collective omissions
- decision path
- next actions
- issues requiring human judgment

## Econometrica Bar

All high-stakes panels should evaluate three dimensions:

1. Conceptual novelty: the paper offers a research object, mechanism, or framing not naturally reproduced by existing theory.
2. Deep result: at least one nontrivial theorem, identification result, equilibrium insight, or proof strategy carries real bite.
3. Economic interpretation: the result changes how economists understand, measure, predict, or regulate something important.

For each dimension, panelists should score 1-5 and explain the score.

## Absorption and Main-Theorem Test

Idea and Model Panels must explicitly ask whether the candidate theorem is absorbed by existing frameworks. The required theorem sentence is:

```text
This paper proves X, and existing theory cannot obtain X because Y.
```

Absorption families to test must be derived from the closest-literature search and the papers actually found. Do not use a fixed field list as a substitute for identifying the nearest theory families for the user's topic.

If the panel can reproduce the result by renaming variables inside a known framework, it should recommend `Demote to benchmark`, `Pivot`, `Park`, or `Kill`, not `Invest`. If the issue is that a key primitive is reduced-form, the panel should identify what must be endogenized before manuscript development.

## Nugget and Occam Test

Every Review Panel and high-stakes Revision Panel must include a scientific-taste judgment. The judge should answer:

- What is the paper's nugget in one sentence without mathematical notation?
- Did the latest revision make the nugget shorter, sharper, and more surprising, or longer and more defensive?
- Is each additional variable, agent type, state, distributional assumption, or regularity condition necessary for the mechanism?
- Could the same insight be obtained from a simpler primitive or cleaner model?
- Does the paper contain a theorem package without one central theorem?

If the contribution sentence requires many clauses such as "under the specific condition that..." or "provided that..." to sound true, label the issue `Defensive Dilution`. If complexity is essential, the judge must say exactly what economic work it performs. If complexity mainly protects a fragile result, the judge should recommend `Pivot`, `Demote to Benchmark`, or `Reject and Resubmit` rather than local repair.

## Contribution-Lock Dilution Check (Hard Ratchet)

When a paper project uses `contribution_lock.md`, every Review Panel must include a **separate dilution check artifact** produced by the parent agent:

- Output file: `referee_reports/round_N/dilution_check.md`
- Inputs allowed: the current manuscript + `contribution_lock.md` (and nothing else).
- Output: for each locked statement (Central question / Main theorem sentence / Non-substitutable insight / Reader belief update), score 1-5 how strongly the current manuscript delivers it, and explicitly flag any **weakening relative to the lock** as `Defensive Dilution`.

Rules:

- This is not a rewrite step. It is a diagnostic guardrail.
- Referees do **not** read `contribution_lock.md` and do **not** read `dilution_check.md`.
- The Associate Editor and Co-Editor may read `dilution_check.md` during synthesis as a constraint: if the manuscript no longer delivers the locked contribution, the correct action is usually `Reject and Resubmit`, `Pivot`, or `Return to Discovery`, not additive local repair.

## Recommendation Scales

### Idea and Model Decisions

```text
Kill < Park < Retarget < Demote to Benchmark < Pivot < Refine < Invest
```

### Verification Decisions

```text
Fatal Gap < Counterexample Found < Needs Assumption < Partially Verified < Verified
```

### Manuscript Review Decisions

```text
Reject < Reject and Resubmit < Major Revision < Minor Revision < Accept
```

Distinguish `Reject and Resubmit` from `Major Revision` carefully:

- `Reject and Resubmit`: structural redesign is required; the resubmission should be treated as a new paper.
- `Major Revision`: the paper is close enough that the core contribution is conditionally acceptable, with fixable problems.

## Location and Evidence Requirements

Every major concern must cite specific evidence:

- line number if available
- section/subsection
- theorem/proposition/lemma/corollary label
- equation label
- assumption name
- model primitive
- table/figure
- closest-paper comparison

If the concern involves a formula, restate the relevant formula or condition so the AE and Co-Editor can verify it.

## Confidence Labels

Each panelist must self-label:

```text
Confidence: High / Medium / Low
```

They must explain uncertainty sources:

- unavailable literature
- missing proof details
- inability to run code
- ambiguity in notation
- unclear model primitives
- limited domain expertise

## Math Rigor Checklist

The math-rigor referee should actively look for:

- fixed point theorem assumptions
- domain invariance
- compactness
- continuity
- convexity or concavity
- contraction constants
- Jacobian invertibility
- implicit/inverse function theorem conditions
- boundary behavior
- spectral radius and Neumann series conditions
- measurable selection
- integrability
- Fubini/Tonelli usage
- dominated convergence
- equilibrium selection
- assumptions that package the main difficulty
- hidden gaps behind "obvious", "standard", "by continuity", "clearly", or "straightforward"

## Tool Integration

When a panel reaches a mathematical or numerical claim:

- use `ECONOMETRICA_VERIFICATION_WORKFLOW.md`
- use Python for quick symbolic/numerical checks
- use Mathematica for assumption-heavy symbolic simplification when available
- use Lean for compact lemmas where formalization is realistic
- record tool outputs in `verification_log.md`
- do not claim verification unless the tool actually ran

## Human Gates

The system must stop for human judgment before:

- committing to a new project
- choosing the model to develop
- adding economically meaningful assumptions
- changing the main theorem
- changing the contribution lock
- deciding to submit, pivot, retarget, split, or kill
- accepting a simulated editorial decision as action-guiding

## Prompt Template

```text
Read ECONOMETRICA_PANEL_PROTOCOL.md. Run a [Idea/Model/Verification/Review/Revision] Panel in [Blind/Context/Literature] Mode for [target object]. First create panel_config.md by detecting the narrowest field, closest literature themes, main method, contribution type, and main risk. Assign specialist roles dynamically from panel_config.md. Use parallel isolated agents if available; otherwise use serial isolated referee prompts. Define allowed and prohibited materials, produce independent referee reports, then AE synthesis, then Co-Editor decision, then parent-agent summary. Stop at the human gate.
```
