# Human-AI Discovery Workflow for Econometrica-Level Theory Projects

Version: 2026-05-01

This file is a pre-manuscript discovery protocol. Use it before `ECONOMETRICA_AI_HUMAN_WORKFLOW.md` when the project is still at the topic, idea, model, or early theorem stage.

The goal is to help the human and AI search broadly without fooling themselves. The agent should generate many candidates, impose tractability and novelty constraints, attempt simple derivations, run hostile kill tests, and stop at human decision gates.

This workflow supports three starting modes:

- `Field mode`: the human knows the broad field but not the exact question.
- `Idea mode`: the human has a rough idea or mechanism.
- `Open mode`: the human wants AI to explore candidate topics from scratch.

For high-stakes screening, model selection, and investment decisions, also read `ECONOMETRICA_PANEL_PROTOCOL.md`. Use independent panels rather than a single-agent judgment when deciding whether to invest in an idea or model.

## Core Principle

AI can expand the search frontier, but it cannot certify that a topic is unstudied, important, or Econometrica-level. Treat all generated topics as hypotheses. A candidate survives only if it passes novelty, tractability, economic importance, and execution tests.

Main-theorem-first rule: do not move into a full manuscript until the project has a candidate main theorem that can be stated in one sharp sentence:

```text
This paper proves X, and existing theory cannot obtain X because Y.
```

The default discovery output is a 5-8 page model note, not a polished paper. The note should contain only the question, closest substitutes, one model, one main theorem candidate, proof status, and killer intuition. Manuscript development begins only after the theorem survives absorption and model-competition gates.

## Required Artifacts

Maintain these files during discovery:

- `discovery_state.md`: current mode, constraints, active candidates, last human decision.
- `topic_longlist.md`: broad list of candidate topics and mechanisms.
- `topic_shortlist.md`: surviving candidates after screening.
- `model_candidates.md`: structured model sketches for each surviving candidate.
- `primitive_hunter_report.md`: deepest primitive, reduced-form object audit, and non-neighborhood model directions.
- `model_tournament.md`: side-by-side comparison of model variants and why weaker variants were killed or demoted.
- `theorem_candidates.md`: candidate main theorems, theorem sentences, proof status, and failure modes.
- `absorption_tests.md`: tests for whether the idea is absorbed by existing theoretical families.
- `derivation_notes.md`: first-pass derivations, algebra, proof attempts, and failure points.
- `literature_probe.md`: closest literatures, nearest substitutes, novelty risks, and citation TODOs.
- `idea_kill_tests.md`: hostile referee/editor tests for each candidate.
- `pre_paper_model_note.md`: 5-8 page note created only after a candidate passes the main-theorem gate.
- `human_decisions.md`: human choices, taste judgments, pivots, and reasons.

If a candidate becomes a real paper project, create or update:

- `idea_dossier.md`
- `contribution_lock.md`
- `project_state.md`

Then continue with `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`.

## Human-AI Division of Labor

AI should own:

- broad candidate generation
- combinatorial mechanism exploration
- structured model sketching
- first-pass derivation attempts
- closest-literature search plans
- hostile novelty objections
- tractability diagnosis
- artifact maintenance

The human should own:

- taste and importance
- whether a question is worth caring about
- whether assumptions are economically acceptable
- whether a mechanism feels deep or merely clever
- whether to pivot, abandon, or invest
- final novelty interpretation after real literature checks

## Stage D0 - Intake and Mode Selection

Autonomy: Gate

Purpose:

Determine what kind of discovery problem this is.

The human should provide as much as available:

- broad field
- known literatures
- rough mechanism
- target journal
- mathematical comfort zone
- preferred model style
- forbidden directions
- empirical, theoretical, or mixed orientation
- whether the project should be single-author tractable
- time budget

AI tasks:

- Create `discovery_state.md`.
- Identify the mode: `Field`, `Idea`, or `Open`.
- Ask only essential clarifying questions.
- If enough information exists, proceed with stated assumptions.

Human gate:

Approve the mode and constraints.

## Stage D1 - Search Space Expansion

Autonomy: Auto

Purpose:

Generate a wide but structured set of possible research directions.

AI tasks:

- Create `topic_longlist.md`.
- Generate 30-80 candidate topic-mechanism combinations, depending on scope.
- Use multiple axes:
  - field
  - friction
  - agents
  - information structure
  - strategic variable
  - market design or institutional environment
  - welfare object
  - identification object if relevant
  - closest literature family
  - possible surprising result

Candidate template:

```text
Candidate ID:
Working title:
Field:
Core economic question:
Agents:
Friction:
Mechanism:
Strategic choice:
Information/timing:
Potential main result:
Why it might matter:
Closest literature families:
Tractability guess:
Novelty risk:
Execution risk:
One-sentence pitch:
```

Rules:

- Do not repeat minor variants as separate candidates.
- Prefer mechanisms that could change a specialist's belief.
- Include some high-risk/high-upside candidates.
- Include some clean and tractable candidates.
- Flag candidates that sound clever but not important.

## Stage D2 - Coarse Screening

Autonomy: Auto, then Gate

Purpose:

Reduce the longlist to a serious shortlist.

AI tasks:

- Score every candidate 1-5 on:
  - economic importance
  - novelty potential
  - non-substitutability
  - tractability
  - likelihood of a sharp theorem
  - literature risk
  - assumption plausibility
  - fit for Econometrica
- Penalize candidates that rely on vague "AI/platform/algorithm" language without a real mechanism.
- Penalize candidates where the result seems obvious before modeling.
- Penalize candidates where all novelty comes from adding one extra feature to a known model.
- Create `topic_shortlist.md` with 5-10 surviving candidates.

Human gate:

The human selects 1-3 candidates for model sketching.

Panel option:

- If the user asks whether a topic is worth pursuing, run an Idea Panel from `ECONOMETRICA_PANEL_PROTOCOL.md` after D2.
- Use Blind Mode when judging the idea itself.
- Use Literature Mode when the main uncertainty is whether the idea is already known.

## Stage D3 - Literature Probe

Autonomy: Checkpoint

Purpose:

Avoid rediscovering known papers.

AI tasks:

- Create `literature_probe.md`.
- For each shortlisted candidate:
  - identify provisional closest literature families from the idea and model primitives
  - list likely nearest substitute papers
  - generate search queries for Google Scholar, Semantic Scholar, RePEc, NBER, CEPR, SSRN, arXiv, and author pages
  - when web/search tools are available, run the searches and record the papers actually found
  - update the closest literature families using the search results rather than relying only on memory
  - describe what would kill the novelty claim
  - describe what would preserve the contribution
- Separate verified facts from AI inferences.
- Mark all unverified references as TODO.

Human gate:

The human should inspect the top substitute papers or ask the AI to help locate them. Do not trust novelty until this gate is passed. If web/search tools are unavailable, label the literature probe and all downstream absorption tests `provisional`.

## Stage D4 - Primitive Hunting and Model Candidate Generation

Autonomy: Auto

Purpose:

Find the deepest primitive, then generate a model tournament before any paper draft exists.

AI tasks:

- Create or update `primitive_hunter_report.md`.
- Create `model_candidates.md`.
- Create or update `model_tournament.md`.
- Before generating local variants, identify:
  - the deepest primitive
  - the object currently treated as reduced-form
  - the primitive that must be endogenized for the theorem to be non-substitutable
  - whether to change theorem, change model, or keep the question but change primitive
- For each selected candidate, generate 4-6 model variants:
  - minimalist baseline
  - richer but still tractable version
  - alternative timing
  - alternative information structure
  - alternative equilibrium concept if relevant
  - three non-neighborhood model directions when the current model seems trapped in local repair

Model template:

```text
Model ID:
Candidate topic:
Core question:
Agents:
Primitives:
Timing:
Information:
Actions:
Payoffs/objectives:
Equilibrium concept:
Key assumptions:
Main endogenous objects:
Predicted main proposition:
Comparative statics:
Welfare or policy object:
Why tractable:
Likely proof technique:
What could go wrong:
Closest existing model:
```

Tournament rule:

- Treat every model variant as competing to produce the main theorem.
- Do not repair a weak variant by adding features until at least one alternative model space has been tried.
- If two variants produce the same theorem, keep the simpler one and demote the other.
- If a variant only creates a theorem package of local sufficient conditions, label it `Local repair trap`.
- If the result follows from a named existing framework, label it `Absorbed benchmark` rather than a main model.

Absorption pre-test:

For each model variant, infer the closest classical theory families from the
topic, primitive friction, agents, information structure, market design, timing,
and predicted theorem. Ask whether the predicted result is essentially a
renaming or modest extension of one of those nearest theory families.

This inference must be checked against the live literature search in
`literature_probe.md` when web/search tools are available. If no search was run,
record the theory-family classification as provisional and do not use it as a
final kill or invest decision.

If yes, the model can still be useful, but it cannot be the main theorem unless the note explains the non-absorbed element.

Tractability constraints:

- Prefer two or three agent types before many-type models.
- Prefer one central friction before multiple interacting frictions.
- Prefer closed-form or monotone comparative statics where possible.
- Avoid unnecessary dynamic state variables.
- Avoid assumptions that exist only to force the desired result.
- Make every assumption economically interpretable.

Panel option:

- If the current primitive is unclear or appears reduced-form, run a Primitive Hunter / Theorem Generator Panel from `ECONOMETRICA_PANEL_PROTOCOL.md` before the Model Panel.
- If multiple model variants survive, run a Model Panel from `ECONOMETRICA_PANEL_PROTOCOL.md`.
- Require the math-rigor panelist to check fixed point, IFT, contraction, boundary behavior, equilibrium selection, and assumption packaging risks before a model is selected for the D7 pre-paper package.

## Stage D5 - First-Pass Derivation

Autonomy: Auto, but must be rigorous

Purpose:

Test whether any model has a real main theorem.

AI tasks:

- Create or update `derivation_notes.md`.
- Create or update `theorem_candidates.md`.
- For each model variant, attempt a first-pass derivation.
- Write:
  - agent problem
  - objective functions
  - constraints
  - equilibrium conditions
  - candidate solution
  - main comparative static
  - proof sketch
  - candidate main theorem sentence
  - exact algebra where possible
  - conditions required
  - counterexample attempt
  - failure points

Required derivation discipline:

- Every proposition must state its assumptions.
- Every comparative static must identify the derivative, monotone order, or argument used.
- Every proof sketch must state where each assumption enters.
- If a result follows almost immediately from an assumption, flag it as low contribution.
- If the result needs an unstated regularity condition, add it explicitly to `derivation_notes.md` and mark it as a risk.
- If algebra becomes messy, try a simpler model before adding assumptions.
- Try to construct at least one counterexample to the predicted proposition.
- If the proposition fails, record the failure rather than repairing silently.
- If the result is true but unsurprising under a known framework, demote it to a benchmark.
- If the model requires a reduced-form primitive to carry the whole contribution, record what primitive must be endogenized before manuscript development.

Output categories:

- `Main-theorem candidate`: clean result, plausible assumptions, nontrivial insight, and not absorbed by a known framework.
- `Promising but needs endogenization`: result is interesting, but a key primitive is still reduced-form.
- `Technically possible but weak`: solvable but low economic bite.
- `Absorbed benchmark`: result is useful but naturally reproduced by existing theory.
- `Too tailored`: result depends on artificial assumptions.
- `Too messy`: solution exists but not paper-tractable.
- `Fails`: proposition false or no clear result.

## Stage D6 - Absorption, Main Theorem, and Kill Test

Autonomy: Gate

Purpose:

Decide whether the candidate deserves manuscript investment or must return to model search.

AI tasks:

- Create `idea_kill_tests.md`.
- Create or update `absorption_tests.md`.
- Create or update `model_tournament.md`.
- If the decision is high-stakes, run an Idea Panel or Model Panel from `ECONOMETRICA_PANEL_PROTOCOL.md` rather than a single-agent kill test.
- If the candidate's deepest primitive or theorem direction is still unclear, run a Primitive Hunter / Theorem Generator Panel before recommending `Invest`, `Refine`, or `Pivot`.
- For each promising model, simulate:
  - absorption referee who tries to reduce the result to known theory
  - hostile closest-literature referee
  - theory referee
  - economic relevance referee
  - editor deciding whether to desk reject
- Ask:
  - Is the insight new or just a relabeling?
  - Is the mechanism economically important?
  - Does the model reveal something not visible without formal analysis?
  - Are assumptions credible?
  - Is the result surprising after reading the closest literature?
  - Would a top-field seminar audience care?
  - What is the cleanest theorem sentence: "This paper proves X, and existing theory cannot obtain X because Y"?
  - Which primitive must be endogenized for the theorem to be more than reduced-form relabeling?
  - What is the strongest reason to kill this idea today?

Absorption test:

- Before judging absorption, confirm the nearest theory families and substitute papers through the latest `literature_probe.md`.
- If the theorem is equivalent to a nearest classical theory family after renaming variables, it fails as a main theorem.
- If web/search tools were unavailable and the closest literature was not checked, label the absorption result `provisional` rather than final.
- If only a narrow part is absorbed, demote that part to a benchmark and search for the non-absorbed theorem.
- If the model's key object is assumed rather than generated, require an endogenization plan before `Invest`.

Main theorem gate:

The candidate cannot receive `Invest` unless all are true:

- The theorem sentence is sharp enough to be put in the introduction unchanged.
- The theorem changes a specialist's belief after conditioning on closest substitutes.
- The result is not merely a package of local sufficient conditions.
- The model primitive that carries the contribution is economically interpretable or explicitly endogenized.
- At least one alternative model variant has been killed for a documented reason.

Hostile kill conditions:

Triggering any one condition should lead to `Kill`, `Park`, or `Demote to benchmark` unless the human explicitly overrides with a documented reason.

- `Conclusion-first triviality`: after removing the mathematical shell, the result is just a trivial statement that a specialist would already believe.
- `Name-swap absorption`: replacing topical nouns such as data, algorithms, platforms, AI, benchmarks, certification, or diagnostics with generic terms such as information, technology, intermediary, signal, or machine makes the result equivalent to an old model.
- `Assumption manipulation`: removing a minor-looking regularity condition, distributional restriction, or boundary assumption changes the sign or existence of the core result.
- `Defensive dilution`: the contribution sentence becomes longer, more conditional, or more legalistic after revision.
- `Complexity shield`: heterogeneity, dynamics, extra states, or special distributions mainly protect the theorem rather than reveal the mechanism.

Decision labels:

- `Invest`: proceed to D7 pre-paper package; begin full manuscript development only after human approval of the model note and theorem sentence.
- `Refine`: keep the idea but modify the model.
- `Pivot`: change the mechanism/question.
- `Demote to benchmark`: keep as background, but do not build the paper around it.
- `Park`: save for later but do not invest now.
- `Kill`: abandon for current purposes.

Human gate:

The human must choose a decision label. AI may recommend, but not decide.

## Stage D7 - Pre-Paper Package

Autonomy: Auto

Purpose:

Convert a surviving theorem into a paper-ready model note.

AI tasks:

- Create `idea_dossier.md`.
- Create `contribution_lock.md`.
- Create `project_state.md`.
- Create `pre_paper_model_note.md`.
- Write a 5-8 page model note:
  - question
  - mechanism
  - model
  - main theorem candidate
  - theorem sentence
  - proof status
  - absorption-test result
  - killed model variants
  - closest literature
  - contribution claim
  - biggest risks
  - next work plan

Proceed condition:

- The human approves the model note and theorem sentence.
- Then continue with `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`, starting at Stage 1 or Stage 2 depending on maturity.

## Common Failure Modes

Stop or pivot if:

- The generated topic is just a fashionable noun plus a standard model.
- The model's result is obvious without the model.
- The model becomes complex before producing a clean insight.
- The assumptions are doing all the work.
- The nearest substitute paper already has the same mechanism.
- The AI cannot explain why the question matters to economists.
- The result only says "more friction leads to worse outcomes" without a sharp twist.
- The contribution is a parameter extension, not a conceptual insight.
- The human cannot pitch the idea in one minute with conviction.
- The project starts accumulating fixes before it has a central theorem.
- Two independent panels say the same thing: no central theorem, too close to old theory, or absorbed by a known framework.
- The manuscript becomes more complete while the theorem sentence becomes less sharp.
- The model's important object remains a reduced-form primitive after several repair attempts.

## Prompt Templates

### Start Discovery in Field Mode

```text
Read ECONOMETRICA_DISCOVERY_WORKFLOW.md. Run Stage D0 and D1 in Field mode. My broad field is: [FIELD]. Generate a structured longlist of candidate Econometrica-level theory topics. Do not write a manuscript. Create discovery_state.md and topic_longlist.md, then stop.
```

### Start Discovery in Idea Mode

```text
Read ECONOMETRICA_DISCOVERY_WORKFLOW.md. Run Stage D0 through D2 in Idea mode. My rough idea is: [IDEA]. Expand nearby mechanisms and model variants, then screen them. Create discovery_state.md, topic_longlist.md, and topic_shortlist.md. Stop at the human gate.
```

### Start Discovery in Open Mode

```text
Read ECONOMETRICA_DISCOVERY_WORKFLOW.md. Run Stage D0 and D1 in Open mode. Generate a broad but disciplined set of candidate theory topics that could plausibly lead to Econometrica-level contributions. Favor tractable models, sharp mechanisms, and non-obvious comparative statics. Create discovery_state.md and topic_longlist.md, then stop.
```

### Generate Models for Shortlisted Ideas

```text
Read ECONOMETRICA_DISCOVERY_WORKFLOW.md. Use topic_shortlist.md and run Stage D4. First identify the deepest primitive, the reduced-form object that may need endogenization, and whether we should change theorem, change model, or keep the question but change primitive. Then generate 4-6 tractable model variants for each selected candidate, including three non-neighborhood model directions when local repair is a risk. Create primitive_hunter_report.md, model_candidates.md, and model_tournament.md. Do not write the paper yet.
```

### Attempt First-Pass Derivations

```text
Read ECONOMETRICA_DISCOVERY_WORKFLOW.md. Run Stage D5 for the selected model candidates. Attempt clean first-pass derivations, state assumptions, show algebra where possible, identify failure points, attempt counterexamples, and write candidate theorem sentences in the form: "This paper proves X, and existing theory cannot obtain X because Y." Create derivation_notes.md and theorem_candidates.md. Do not hide failed models.
```

### Run Discovery Kill Test

```text
Read ECONOMETRICA_DISCOVERY_WORKFLOW.md. Run Stage D6. Use model_candidates.md, model_tournament.md, theorem_candidates.md, derivation_notes.md, and literature_probe.md if available. Run absorption tests against nonlinear pricing, screening, persuasion, disclosure, experimentation, inventory, moral hazard, search, matching, and platform steering. Simulate hostile referees and an editor. Create absorption_tests.md and idea_kill_tests.md, then recommend Invest, Refine, Pivot, Demote to benchmark, Park, or Kill for each candidate. Stop for my decision.
```

## How This Connects to the Main Workflow

Use this discovery workflow before writing a full paper. Once a candidate receives `Invest`, create the pre-paper package in Stage D7 and then continue with:

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. Run Stage 1 or Stage 2 using the idea_dossier.md and contribution_lock.md created during discovery.
```

If a later manuscript review says "no central theorem," "too close to existing theory," or "absorbed by known models" in two independent rounds, return here to D4-D6 instead of continuing manuscript polishing.
