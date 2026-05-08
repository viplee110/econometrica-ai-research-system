# Human-AI Workflow for Econometrica-Level Paper Development

Version: 2026-05-01

This file is a working protocol for developing and revising an economics paper with Codex or another AI research assistant. Put this file in the paper's root directory and ask the agent to read it before making research or manuscript changes.

The goal is not to assume that repeated AI revision will converge to Econometrica acceptance. The goal is to create a disciplined human-AI process that quickly distinguishes four cases:

1. The core idea is strong and the paper needs writing, proof, positioning, and referee-readiness work.
2. The idea is promising but must be pivoted before heavy writing.
3. The manuscript is locally improvable but unlikely to reach the target journal without a new insight.
4. The project should be redirected to a different journal or split into a different paper.

For high-stakes idea, model, theorem, review, or revision decisions, also read `ECONOMETRICA_PANEL_PROTOCOL.md`. Use independent specialist reports, AE synthesis, Co-Editor decision, and parent-agent summaries to avoid single-agent self-confirmation.

## Operating Principles

- Human judgment is the final authority on contribution, economic importance, identification, taste, and submission decisions.
- AI is strongest as a tireless analyst, critic, editor, proof checker, map maker, and simulated referee.
- AI should not be treated as an oracle for novelty or acceptance probability.
- Never confuse "simulated readiness" with real acceptance.
- Do not let repeated revision erase the paper's sharp central idea.
- Stop polishing when the main objection is contribution, identification, or economic relevance.
- Treat simulated review as local search, not invention. If review reveals no central theorem, old-theory absorption, or weak contribution, return to discovery instead of repairing locally.
- Do not use a full manuscript as a rescue device for an idea that has not passed the main-theorem gate.
- The preferred path is theorem note first, manuscript second.
- Use artifacts, gates, and logs. Do not rely on chat memory alone.

## Core Artifacts

The agent should maintain these files whenever possible:

- `project_state.md`: current stage, last human decision, active thesis, active target, current blocker.
- `idea_dossier.md`: one-sentence idea, mechanism, closest papers, novelty claims, feasibility risks.
- `contribution_lock.md`: the locked core question, non-substitutable insight, and reader belief update.
- `pre_paper_model_note.md`: 5-8 page note containing the model, main theorem candidate, proof status, and absorption-test result.
- `theorem_candidates.md`: candidate theorem sentences and proof status inherited from discovery.
- `absorption_tests.md`: checks for whether the idea is absorbed by known theoretical families.
- `manuscript_map.md`: section map, theorem/proposition list, assumptions, figures, tables, appendix map.
- `literature_positioning.md`: nearest substitutes, contribution relative to each, citation risks, missing references.
- `proof_and_model_audit.md`: assumptions, theorem logic, proof gaps, notation risks, model fragility.
- `referee_reports/round_N/`: simulated referee, AE, Co-Editor, summary, and panel-configuration reports by round.
- `revision_tree.md`: Stage 8 branch plans for Defensive Patch, Mechanism Simplification, and Pivot/Reframe.
- `revision_log.md`: every nontrivial edit with file, location, reason, and expected benefit.
- `risk_register.md`: unresolved risks, author-only TODOs, pivot warnings, and rejection reasons.
- `final_report.md`: final summary after any long work session.

## Human Intervention Modes

Use different autonomy levels at different stages.

- `Auto`: AI may inspect, edit, compile, log, and continue without stopping.
- `Checkpoint`: AI may do analysis and propose edits, but must stop for human approval before changing the paper's core direction.
- `Gate`: AI must stop and ask the human to choose proceed, pivot, narrow, split, or abandon.
- `Human-only`: AI may provide analysis, but the human must make the decision.

Default rule:

- Stages 0, 3, 6, and mechanical parts of 8 can be `Auto`.
- Stages 1, 2, 5, 7, 9, and 10 require `Gate` or `Human-only`.

## Manuscript-Mode Firewall

Before substantial manuscript revision, check whether the project has passed the discovery gates in `ECONOMETRICA_DISCOVERY_WORKFLOW.md`:

- a 5-8 page `pre_paper_model_note.md` or equivalent theorem note
- a sharp theorem sentence: "This paper proves X, and existing theory cannot obtain X because Y"
- `absorption_tests.md` showing why the result is not just nonlinear pricing, screening, persuasion, disclosure, experimentation, inventory, moral hazard, search, matching, or platform steering under new names
- `model_tournament.md` or equivalent evidence that multiple model spaces were considered before the current model was selected
- a human-approved `contribution_lock.md`

If these artifacts are missing, Stage 0 may still map an existing manuscript, but Stages 3, 6, and 8 should not try to rescue it through local repairs. Route back to Discovery D4-D6 unless the user explicitly asks for mechanical editing only.

## Stage 0 - Project Intake and State Reconstruction

Autonomy: Auto

Purpose:

Build a shared state before judging or editing.

AI tasks:

- Identify the main manuscript, appendices, bibliography, figures, tables, code, data, and build command.
- Create or update `project_state.md`.
- Create or update `manuscript_map.md`.
- Compile the paper if possible.
- Record build blockers.
- Summarize the current paper in one page.

Human gate:

- Confirm that the AI identified the correct main manuscript and target.

Output:

- `project_state.md`
- `manuscript_map.md`
- Initial build status in `revision_log.md`

Proceed condition:

- The agent knows what files matter and can build or inspect the manuscript.

## Stage 1 - Idea Kill Test

Autonomy: Gate

Purpose:

Test whether the idea is worth writing to the target journal before heavy manuscript polishing.

AI tasks:

- Write `idea_dossier.md`.
- If the go/no-go decision is high-stakes, run an Idea Panel from `ECONOMETRICA_PANEL_PROTOCOL.md`.
- State the one-sentence contribution.
- State the candidate main theorem sentence: "This paper proves X, and existing theory cannot obtain X because Y."
- Identify the closest existing papers and the strongest substitute argument.
- Run or update `absorption_tests.md` if the idea might be a relabeling of a known framework.
- State what belief a specialist should change after reading the paper.
- Identify why Econometrica might desk reject the paper.
- Identify what would have to be true for the paper to deserve Econometrica.

Required questions:

- What is the central economic question?
- What is the non-substitutable insight?
- What is surprising after conditioning on the existing literature?
- Does the model reveal a mechanism, or only repackage a known mechanism?
- Can the theorem be absorbed by the closest theory families found in the literature search?
- Are the assumptions doing essential economic work or merely engineering the result?
- If the main theorem is true, what important belief changes?
- If the paper disappeared, what would the literature still fail to understand?

Scoring:

Use 1 to 5 for each dimension:

- Novelty
- Economic importance
- Non-substitutability
- Feasibility
- Theoretical bite
- Identification or modeling credibility
- Robustness to closest substitute papers

Human gate:

The human must choose one:

- `Proceed`: idea is strong enough for full development.
- `Pivot`: change the core question, mechanism, setting, or theorem target.
- `Narrow`: reduce ambition and aim for a more precise contribution.
- `Split`: separate multiple ideas into different papers.
- `Abandon or retarget`: do not aim this version at Econometrica.

Proceed condition:

- No score below 3.
- Novelty, importance, and non-substitutability are at least 4.
- The main theorem sentence is sharp and not absorbed by the nearest substitute theory.
- The human can defend the one-sentence contribution without relying on wording tricks.

## Stage 2 - Contribution Lock

Autonomy: Gate

Purpose:

Prevent later rounds from diluting the core idea.

AI tasks:

- Create `contribution_lock.md`.
- Draft four locked statements:
  - `Central question`
  - `Main theorem sentence`
  - `Non-substitutable insight`
  - `Reader belief update`
- Draft a short "do not dilute" list.
- Draft a "claims we must not overstate" list.

Human gate:

The human must approve or rewrite the four locked statements.

Rule:

No later revision may weaken these statements without explicit human approval.

Proceed condition:

- The introduction, theorem targets, and conclusion can all be organized around the locked theorem and contribution.

## Stage 3 - Model, Assumption, and Proof Architecture Audit

Autonomy: Mostly Auto, with Gate if a foundational issue appears

Purpose:

Determine whether the model and proofs can carry the contribution.

AI tasks:

- Create `proof_and_model_audit.md`.
- List primitives, agents, timing, information, constraints, equilibrium concept, objects of interest, assumptions, and results.
- Check whether assumptions are economically interpretable.
- Check theorem statements against proof structure.
- Check notation consistency between main text and appendix.
- Identify missing lemmas or hidden regularity conditions.
- Identify where the proof relies on unstated monotonicity, continuity, compactness, genericity, equilibrium selection, or identification assumptions.

Human gate:

Stop if any issue threatens the main result, main mechanism, or contribution lock.

Proceed condition:

- The core result is either sound or has a clearly identified repair path.

## Stage 4 - Execution and Feasibility Audit

Autonomy: Auto

Purpose:

Close the ideation-execution gap.

AI tasks:

- Identify every claim that requires a proof, computation, calibration, robustness check, data result, or external citation.
- Mark each claim as verified, partially verified, unverified, or author-only.
- Run available code or compile tables if safe and possible.
- Check whether figures and tables support the claims made in the text.
- Add unverifiable claims to `risk_register.md`.

Human gate:

- Required only if the paper depends on an unverified result.

Proceed condition:

- The paper does not rely on invented, assumed, or unverified evidence.

## Stage 5 - Literature Positioning and Novelty Audit

Autonomy: Gate

Purpose:

Stress test novelty against the real literature.

AI tasks:

- Create or update `literature_positioning.md`.
- Identify nearest substitute papers.
- For each substitute, write:
  - what it already does
  - what this paper adds
  - what it makes less novel
  - what citation or framing change is needed
- Flag missing citations rather than inventing them.
- Separate "known to be true from documents" from "AI inference."

Human gate:

The human must verify the key nearest substitute papers and decide whether the novelty claim survives.

Proceed condition:

- The project has a defensible contribution after accounting for the closest substitutes.

## Stage 6 - Controlled Manuscript Development

Autonomy: Auto, unless contribution changes

Purpose:

Write and revise without losing the core idea.

AI tasks:

- Revise section by section.
- For each major section, perform a paragraph-level pass.
- Improve clarity, notation, transitions, proof roadmaps, motivation, and conclusion.
- Preserve author voice.
- Avoid broad rewriting when precise edits suffice.
- Compile after meaningful edits.
- Log every nontrivial edit in `revision_log.md`.

Section-level checklist:

- Does the section serve the locked contribution?
- Is the economic mechanism clear before technical detail?
- Are claims supported?
- Is notation introduced before use?
- Is the reader told why the result matters?
- Are assumptions interpreted?
- Are limitations honest but not self-sabotaging?

Proceed condition:

- The manuscript expresses the locked contribution clearly and does not contain obvious correctness or exposition blockers.

## Stage 7 - Simulated Econometrica Review Board

Autonomy: Gate

Purpose:

Generate structured, adversarial, and diverse feedback without overtrusting the simulation.

Before assigning referee roles:

- Create `referee_reports/round_N/panel_config.md`.
- Infer the manuscript's narrowest defensible field, closest literature themes, main method, contribution type, and main technical risk.
- Select referees dynamically from those features rather than using a fixed field template.
- Do not default to IO, search, networks, theory, econometrics, or any named field unless the current manuscript actually belongs there.
- Treat older paper-specific methodology files as historical records rather than referee-role templates.
- Write the final role list into `panel_config.md` before creating any individual referee prompt.

AI roles:

- Referee 1: primary-field specialist selected from the manuscript's narrowest defensible field.
- Referee 2: closest-literature or adjacent-field specialist selected from the nearest substitute literature.
- Referee 3: method, mechanism, application, or institutional specialist selected from the paper's actual contribution.
- Referee 4: rigor specialist selected from the main risk type: mathematical proof, econometric identification, computational reproducibility, empirical design, experimental design, or institutional interpretation.
- Referee 5: Scientific Judge / Idea Critic who runs the Nugget Test, Occam Test, and Defensive Dilution check.
- Referee 6: Advocate / Best-Case Reader who argues for acceptance if acceptance were required, and states the strongest defensible "why should we care?" case in the paper's own terms.
- Associate Editor: independent read first, then synthesis of referee reports.
- Co-Editor: independent read first, then final decision letter and internal notes.

Required outputs:

- `referee_reports/round_N/panel_config.md`
- `referee_reports/round_N/dilution_check.md`
- `referee_reports/round_N/referee_1.md`
- `referee_reports/round_N/referee_2.md`
- `referee_reports/round_N/referee_3.md`
- `referee_reports/round_N/referee_4_rigor.md`
- `referee_reports/round_N/referee_5_scientific_judge.md`
- `referee_reports/round_N/referee_6_advocate.md`
- `referee_reports/round_N/associate_editor_report.md`
- `referee_reports/round_N/co_editor_decision.md`
- `referee_reports/round_N/00_summary.md`
- Updated `risk_register.md`
- A ranked list of objections by fatality, not by ease of fixing.

Information isolation:

- Default to Blind Mode from `ECONOMETRICA_PANEL_PROTOCOL.md`.
- If the runtime supports real agent delegation, run referee reports as parallel isolated workers by default.
- If the runtime does not support real agents, simulate independence serially by running each referee in a separate prompt block without exposing earlier referee reports.
- Each referee prompt must quote or summarize only that referee's role from `panel_config.md`, not the full role list plus prior reports.
- Referees should read only the current manuscript and explicitly allowed appendices.
- Referees should not read old reports, revision logs, risk registers, workflow files, or each other's reports.
- The parent agent must generate `dilution_check.md` using only the current manuscript and `contribution_lock.md`. Referees do not read it.
- AE may read referee reports only after producing an independent judgment.
- Co-Editor may read AE/referee reports only after producing an independent judgment.

Location and confidence requirements:

- Every major concern must cite a line, section, theorem, proposition, lemma, equation, assumption, figure, table, or closest-literature comparison.
- Every referee, AE, and Co-Editor report must include Recommendation and Confidence.

Scoring:

Use 1 to 5:

- Contribution
- Correctness
- Identification and assumptions
- Proof clarity
- Empirical or computational credibility
- Literature positioning
- Exposition
- Robustness to likely objections
- Fit for Econometrica

Interpretation:

- Scores are diagnostic only.
- A score cannot certify acceptance.
- If two independent review rounds say "no central theorem," "too close to existing theory," or "absorbed by known models," stop polishing and return to Discovery D4-D6.

Human gate:

The human must choose:

- `Revise`: objections are fixable inside the current paper.
- `Pivot`: contribution or model needs redesign.
- `External feedback`: ask a human expert before further AI revision.
- `Retarget`: the paper may be good but not for Econometrica.

## Stage 8 - Revision Loop

Autonomy: Mixed

Purpose:

Convert referee objections into a controlled search over revision strategies, not a linear sequence of additive patches.

Triage order:

1. Fatal correctness or proof gaps.
2. Contribution and novelty objections.
3. Identification, assumptions, and mechanism objections.
4. Literature positioning.
5. Exposition and structure.
6. Style, grammar, and formatting.

AI tasks:

- Create `revision_tree.md` before editing.
- If the leading objection is missing central theorem, old-theory absorption, weak contribution, or defensive dilution, do not revise locally. Route back to Discovery D4-D6.
- For major theoretical or mechanism objections, generate three parallel revision branches as plans before touching the manuscript:
  - Branch A, `Defensive Patch`: minimal repair that preserves the current model, adding the fewest assumptions or clarifications possible.
  - Branch B, `Mechanism Simplification`: remove complexity and seek a cleaner primitive, theorem, or benchmark that explains the mechanism with fewer moving parts.
  - Branch C, `Pivot and Reframe`: abandon or demote the attacked theorem and rebuild around the strongest surviving mechanism.
- For each branch, write no more than 500 words covering the revised nugget, mathematical cost, assumptions added or removed, likely referee reaction, and kill risk.
- Run the Scientific Judge on the three branch plans before manuscript edits.
- Prune any branch whose contribution sentence becomes longer, more conditional, or less economically intuitive.
- Use Git branches or worktrees for actual manuscript edits only after the human chooses a branch.
- Tie each eventual edit to a specific objection and chosen branch.
- Avoid adding defensive clutter.
- Remove or demote claims that cannot be supported.
- Compile and fix build issues after edits.
- Update `revision_log.md`, `risk_register.md`, and `revision_tree.md`.

Human gate:

Stop before any edit that changes:

- central question
- main theorem
- model primitives
- assumption set
- claimed novelty
- empirical interpretation
- target journal positioning

For major objections, the human must choose `Branch A`, `Branch B`, `Branch C`, `Return to Discovery`, or `Stop` before direct manuscript edits.

Proceed condition:

- Each major objection has been fixed, reframed, or explicitly recorded as remaining risk.

## Stage 9 - External Human Reality Check

Autonomy: Human-only, AI assists

Purpose:

Break the correlated-error loop among AI author, AI reviewer, and AI editor.

AI tasks:

- Prepare a 2-page memo for a human reader.
- Prepare a seminar-style 5-minute explanation.
- Prepare a list of questions for a senior economist or coauthor.
- Summarize external feedback after the human provides it.

Human tasks:

- Ask at least one real field expert, coauthor, advisor, or seminar participant for feedback.
- Pay attention to first-reaction objections.
- Decide whether the external feedback confirms or contradicts the AI review loop.

Proceed condition:

- A real human expert does not immediately reject the core contribution, or the project has been pivoted accordingly.

## Stage 10 - Submission Readiness Decision

Autonomy: Gate

Purpose:

Decide whether to submit, revise further, pivot, or retarget.

AI tasks:

- Write `final_report.md`.
- Summarize remaining risks.
- Check abstract, introduction, main results, proofs, appendix, bibliography, figures, and tables for consistency.
- Produce a final simulated editor recommendation.
- Produce a pre-submission checklist.

Human decision:

- Submit to Econometrica.
- Do one more targeted revision.
- Send for external feedback.
- Retarget journal.
- Pivot the project.

Submission readiness threshold:

- No known fatal correctness gap.
- No unverified central result.
- Contribution lock remains sharp.
- Closest-literature positioning is defensible.
- Introduction makes the economic question and insight clear.
- Main assumptions are interpretable.
- Proofs and appendix are navigable.
- Remaining risks are known, not hidden.

## Non-Convergence Diagnostics

Stop the current revision loop if any of these patterns appears:

- Two independent reviews identify the same structural objection: no central theorem, old-theory absorption, or weak contribution.
- The same "incremental contribution" objection survives three rounds.
- The paper becomes longer but the one-sentence contribution becomes weaker.
- Assumptions become more tailored after every revision.
- The model needs increasingly artificial features to generate the result.
- The work turns into a theorem package of local sufficient conditions rather than one clean result.
- Referee objections cause the AI to add sections rather than reconsider the model space.
- A key object remains reduced-form even though it carries the whole contribution.
- The editor simulation improves mainly because prose improves, not because the core objection changes.
- AI repeatedly proposes literature claims that the human cannot verify.
- The paper is technically correct but the "why should we care?" answer stays vague.
- The introduction has to use elaborate wording to make the contribution sound important.

When this happens, return to Discovery D4-D6 for model tournament, absorption testing, and main-theorem search. Do not continue cosmetic revision.

## Recommended Codex Prompts

### Start a New Project

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md and follow it as the project protocol. Begin with Stage 0 only. Inspect the local paper folder, identify the main manuscript and build process, create project_state.md and manuscript_map.md, and stop for my confirmation before judging or editing the paper.
```

### Run Idea Kill Test

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. Run Stage 1, the Idea Kill Test. Do not edit the manuscript. Create idea_dossier.md, identify the closest substitute arguments, score the idea, and stop at the human gate with a recommendation: proceed, pivot, narrow, split, abandon, or retarget.
```

### Lock the Contribution

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. Run Stage 2. Draft contribution_lock.md with the central question, non-substitutable insight, reader belief update, do-not-dilute list, and overclaim risks. Stop for my approval before any manuscript revision.
```

### Deep Manuscript Revision

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. We have passed the idea and contribution gates. Run Stages 3, 4, and 6. Audit the model, assumptions, proof architecture, and evidence. Then revise the manuscript section by section. Compile after meaningful edits. Log every nontrivial edit in revision_log.md. Stop if you find a foundational problem that threatens the contribution lock.
```

### Simulated Econometrica Review

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. Run Stage 7. First create referee_reports/round_N/panel_config.md by detecting the paper's narrowest field, closest literature themes, main method, contribution type, main risk, calibration anchors, and control-paper calibration plan if available. Then simulate the Econometrica review board with dynamically assigned Referees 1-4, Referee 5 Scientific Judge, Referee 6 Advocate, Associate Editor, and Co-Editor. Also create dilution_check.md from only the current manuscript and contribution_lock.md. Use parallel isolated agents if available; otherwise use serial isolated referee prompts. Write referee_reports/round_N/ files and update risk_register.md. Rank objections by fatality. Do not edit the manuscript in this pass. Stop for my decision.
```

### Referee-Guided Revision

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. Run Stage 8 using the latest referee report in Agentic Tree Search Mode. If the leading objection is missing central theorem, old-theory absorption, weak contribution, or defensive dilution, do not edit locally; route back to Discovery D4-D6. Otherwise create revision_tree.md with Branch A Defensive Patch, Branch B Mechanism Simplification, and Branch C Pivot and Reframe. Run the Scientific Judge on the branch plans and stop for my branch choice before editing the manuscript.
```

### Final Submission Readiness

```text
Read ECONOMETRICA_AI_HUMAN_WORKFLOW.md. Run Stage 10. Do not make major conceptual edits. Check final consistency, unresolved TODOs, bibliography, figures, theorem statements, assumptions, proofs, and appendix links. Write final_report.md with a simulated editor recommendation and a human pre-submission checklist.
```

## Practical Time Budgets

For a 5-hour Codex Desktop session:

- 30 minutes: intake and discovery-state reconstruction.
- 60 minutes: absorption and closest-literature probe.
- 90 minutes: model tournament across 4-6 variants.
- 90 minutes: first-pass derivations and theorem-candidate search.
- 45 minutes: kill test or Model Panel.
- 30 minutes: pre-paper model note and human gate.

Important:

- Spend roughly 70% of early project time on discovery, model competition, and theorem search before prose.
- Do not spend the full 5 hours on prose if the main theorem gate is weak.
- Do not let the AI continue beyond a human gate by pretending uncertainty has been resolved.

## What the Human Should Do Better Than AI

The human should own:

- The taste judgment of whether the idea matters.
- The decision to pivot or abandon.
- The final interpretation of assumptions.
- The final novelty claim.
- The choice of target journal.
- The decision to trust or reject a proof repair.
- The decision to add, remove, or soften a central claim.
- The decision to send the paper to real humans.

The AI should own:

- Exhaustive checklist execution.
- Drafting alternative framings.
- Finding internal inconsistencies.
- Mapping claims to evidence.
- Generating adversarial objections.
- Maintaining logs and risk registers.
- Mechanical LaTeX and reference checks.
- Producing structured reports for human decisions.

## Research Basis

This protocol is informed by current agentic research-writing and AI-review systems:

- Stanford Agentic Reviewer uses document extraction, related-work retrieval, relevance filtering, and structured review generation, and explicitly warns that AI reviews may contain errors and require human judgment: https://paperreview.ai/tech-overview
- AutoResearchClaw moved from pure autonomy toward human-in-the-loop modes, checkpoints, SmartPause, claim verification, budget guardrails, and pivot/refine decisions: https://github.com/aiming-lab/AutoResearchClaw
- PaperOrchestra decomposes paper writing into outline, plotting, literature review, section writing, and content refinement agents, with strict halt rules and verification helpers: https://github.com/Ar9av/PaperOrchestra
- ResearchClaw emphasizes persistent research state so long-horizon work does not disappear into one-off chat threads: https://github.com/ymx10086/ResearchClaw
- AI Scientist-v2 uses agentic tree search for open-ended research, while its own README cautions that broader exploration can have lower success rates than template-based workflows: https://github.com/SakanaAI/AI-Scientist-v2
- Sakana AI reports that the broader AI Scientist line was published in Nature and that AI Scientist-v2 uses agentic tree search for open-ended exploration: https://sakana.ai/ai-scientist-nature/
- AI Can Learn Scientific Taste proposes reinforcement learning from community feedback as one way to train or scaffold scientific taste; use this as motivation for taste checks, not as proof that AI taste is reliable: https://arxiv.org/abs/2603.14473
- Nicholas Carlini's research essay emphasizes scientific taste, single-idea focus, early problem selection, and killing projects that are not working: https://nicholas.carlini.com/writing/2026/how-to-win-a-best-paper-award.html
- Agent Laboratory frames agents as assistants to a human-produced research idea and says the human is the pilot: https://agentlaboratory.github.io/
- AI co-scientist work emphasizes generate, debate, rank, evolve, and meta-review cycles with scientist-provided objectives and guidance: https://huggingface.co/papers/2502.18864
- MARG shows that specialized multi-agent review can reduce generic comments and improve useful feedback relative to simpler baselines: https://www.catalyzex.com/paper/marg-multi-agent-review-generation-for
- AgentReview shows that simulated peer review can expose review dynamics and bias, which is useful but also a reason not to treat any simulated decision as definitive: https://aclanthology.org/2024.emnlp-main.70/
- ReviewerToo reports that AI reviewers can help with consistency and coverage but remain weaker on methodological novelty and theoretical contribution, where human expertise remains essential: https://huggingface.co/papers/2510.08867
- Large-scale feedback studies find LLM feedback can overlap substantially with human reviewer comments and be helpful, but should augment rather than replace expert review: https://par.nsf.gov/biblio/10617069
- Research on LLM ideation finds AI ideas can look novel at the idea stage but lose more value after execution, which motivates early feasibility and execution gates: https://huggingface.co/papers/2506.20803
