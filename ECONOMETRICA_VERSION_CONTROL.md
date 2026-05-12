# Version Control Workflow for AI-Assisted Paper Development

Version: 2026-05-01

Use this file whenever Codex edits, restructures, verifies, reviews, or rewrites an economics paper. The purpose is to make every AI-assisted change inspectable, reversible, and attributable.

This workflow complements:

- `ECONOMETRICA_ORCHESTRATOR.md`
- `ECONOMETRICA_DISCOVERY_WORKFLOW.md`
- `ECONOMETRICA_VERIFICATION_WORKFLOW.md`
- `ECONOMETRICA_AI_HUMAN_WORKFLOW.md`

## Core Principle

Long AI editing sessions must be reversible. Before meaningful edits, create a checkpoint. After meaningful edits, record what changed, why it changed, and how to return to the previous state.

Never overwrite human work casually. Never use destructive git commands unless the human explicitly asks and approves.

## Default Automation Policy

By default, version control should run automatically in the background so the human can focus on the paper.

Automatically do these without asking when inside a git repository:

- check `git status --short`
- record branch, commit hash, and dirty files in `version_log.md`
- create `version_log.md` entries before and after meaningful work
- create lightweight pre-edit checkpoints in `version_log.md`
- summarize `git diff --stat` after meaningful edits
- propose commit messages after coherent work units

Automatically create a new branch only when:

- the working tree is clean, and
- the task is a long manuscript revision, simulated review plus revision, or multi-hour autonomous work, and
- the current branch is not already an `ai/` work branch.

Do not ask before creating a branch under those conditions. Record the branch name in `version_log.md`.

Still ask before:

- committing changes
- creating tags
- using worktrees
- modifying or overwriting pre-existing uncommitted human changes
- rollback or restore operations
- destructive commands such as `git reset --hard`, `git clean`, file deletion, or force operations

If the folder is not a git repo, recommend git initialization and ask once. Do not repeatedly ask during the same session.

## Stage G0 - Git Availability and Status

Autonomy: Auto

Purpose:

Determine whether the project is under git version control.

AI tasks:

- Run `git status --short` if git exists.
- Run `git branch --show-current` if inside a git repo.
- Run `git diff --stat` to understand pending changes.
- Record status in `version_log.md`.

If the folder is not a git repo:

- Recommend initializing git before long AI editing.
- Do not run `git init` unless the user approves or explicitly asks.
- If the user wants lightweight protection only, create a timestamped backup copy of edited files before modification.

## Stage G1 - Pre-Edit Checkpoint

Autonomy: Auto if git repo is clean or user has approved current dirty state; otherwise Checkpoint

Purpose:

Create a recoverable state before AI changes files.

AI tasks:

- If git repo is clean, record the current commit hash with `git rev-parse HEAD`.
- If git repo has existing changes, list changed files and ask whether they are human changes to preserve.
- Do not revert or overwrite existing human changes.
- Create or update `version_log.md` with:
  - timestamp
  - current branch
  - current commit hash
  - dirty files
  - intended workflow stage

Recommended branch naming:

```text
ai/discovery-YYYYMMDD-HHMM
ai/verification-YYYYMMDD-HHMM
ai/review-round-N-YYYYMMDD-HHMM
ai/revision-round-N-YYYYMMDD-HHMM
codex/tree-A-defensive-YYYYMMDD-HHMM
codex/tree-B-simplify-YYYYMMDD-HHMM
codex/tree-C-pivot-YYYYMMDD-HHMM
```

Human gate:

If there are pre-existing uncommitted changes, stop before making large edits unless the user explicitly says to proceed.

## Stage G2 - Branch or Worktree Strategy

Autonomy: Checkpoint

Purpose:

Choose whether to work on the current branch, a new branch, or a separate worktree.

Recommended default:

- For small analysis-only tasks: current branch is fine.
- For manuscript edits: create a new branch automatically if the working tree is clean and current branch is not already an `ai/` branch.
- For long multi-hour revision sessions: recommend a new worktree, but ask before creating it.

Rules:

- Do not create branches automatically if the working tree is dirty or the state is unclear.
- Do not use `git reset --hard`, `git checkout --`, or destructive cleanup unless the user explicitly asks.
- Prefer non-interactive git commands.

## Stage G3 - Post-Edit Diff Review

Autonomy: Auto

Purpose:

Make AI edits inspectable.

AI tasks:

- Run `git diff --stat`.
- Run targeted `git diff -- <file>` for edited manuscript and workflow files when helpful.
- Summarize the diff in `revision_log.md` or `version_log.md`.
- Note files created, modified, and left intentionally unchanged.

Required log fields:

```text
Timestamp:
Workflow stage:
Files changed:
Main changes:
Reason:
Risks:
Suggested human checks:
```

## Stage G4 - Commit Checkpoint

Autonomy: Checkpoint

Purpose:

Create a named checkpoint after a coherent unit of work.

AI tasks:

- Recommend a commit message.
- Ask the human before committing unless the human has explicitly asked for automatic commits.
- If approved, create a commit with a clear message.

Optional automatic commit mode:

- If the user explicitly says "auto-commit is allowed for this session", Codex may commit after coherent work units.
- Even in auto-commit mode, do not commit pre-existing human changes unless they are part of the approved work scope.
- Always write the commit hash to `version_log.md`.

Commit message patterns:

```text
ai: add discovery workflow checkpoint
ai: revise introduction after simulated review round 1
ai: verify proposition 1 and log counterexample search
ai: update risk register after Econometrica review simulation
```

## Stage G5 - Tags for Major Rounds

Autonomy: Checkpoint

Purpose:

Make review and revision rounds easy to compare.

Recommended tags:

```text
before-ai-round-1
after-ai-round-1
before-referee-round-2
after-revision-round-2
submission-readiness-check
```

Rules:

- Ask before creating tags.
- Use annotated tags for major milestones if the project uses tags.

## Stage G6 - Rollback Strategy

Autonomy: Human-only for destructive actions

Purpose:

Recover from unwanted AI changes.

Safe rollback options:

- Show the diff and manually reverse selected hunks.
- Use `git restore --source=<commit> -- <file>` only after user approval.
- Use `git revert <commit>` for committed changes when appropriate.
- Create a new branch from an earlier commit.

Forbidden without explicit user approval:

- `git reset --hard`
- `git checkout -- <file>`
- deleting files
- cleaning untracked files
- force pushing

When the user asks to roll back, revert, or restore prior work:

1. Clarify whether they want to revert a file, a round, or all AI changes.
2. Show candidate commits/tags/checkpoints.
3. Recommend the least destructive option.
4. Ask for approval before executing.

## Stage G7 - Human Change Protection

Autonomy: Always active

Purpose:

Protect human edits from accidental overwrite.

Rules:

- Treat pre-existing uncommitted changes as human work unless clearly generated by the current session.
- If a file changed outside the current AI task, do not overwrite it.
- If a file has both human changes and AI-needed edits, read it carefully and make minimal changes.
- If a conflict is real, stop and ask how to proceed.

## Stage G8 - Agentic Tree Search Branch Strategy

Autonomy: Checkpoint

Purpose:

Support Stage 8 revision tree search without contaminating the main manuscript path.

Rules:

- First create `revision_tree.md` with Branch A Defensive Patch, Branch B Mechanism Simplification, and Branch C Pivot and Reframe.
- Do not edit the manuscript on all three branches before the human chooses a path unless the user explicitly asks for parallel prototypes.
- For lightweight comparison, keep branches as written plans in `revision_tree.md`.
- For substantial manuscript prototypes, create separate git branches or worktrees with disjoint write scopes.
- Branch A may add minimal clarifications, but must record every new assumption.
- Branch B should preferentially delete or simplify objects before adding new ones.
- Branch C may change framing or theorem target, but requires a human gate before manuscript edits.
- After the human chooses a branch, summarize why the other branches were pruned.
- Never merge a tree-search branch into `main` until the chosen branch passes the nugget, absorption, and proof-risk checks.

## Prompt Templates

### Start a Safe Editing Session

```text
Read ECONOMETRICA_VERSION_CONTROL.md. Run automatic version-control setup before editing. Check git status, create an AI branch if safe, record a checkpoint in version_log.md, and stop only if there are pre-existing uncommitted changes that need my decision.
```

### Enable Automatic Version Control

```text
Read ECONOMETRICA_VERSION_CONTROL.md. For this session, run automatic version control in the background: check status before edits, create an AI branch if safe, log checkpoints before and after meaningful edits, summarize diffs, and propose commits. Ask only for commits, tags, worktrees, rollback, destructive actions, or dirty human changes.
```

### Commit a Completed Round

```text
Read ECONOMETRICA_VERSION_CONTROL.md. Run Stage G3 and G4. Summarize the current diff, propose a commit message, and ask for my approval before committing.
```

### Compare Two Rounds

```text
Read ECONOMETRICA_VERSION_CONTROL.md. Compare the manuscript state between [checkpoint A] and [checkpoint B]. Summarize substantive changes, contribution changes, theorem changes, and risks.
```

### Roll Back Safely

```text
Read ECONOMETRICA_VERSION_CONTROL.md. I want to roll back [file/round/commit]. Show the safest rollback options and ask before executing any destructive command.
```
