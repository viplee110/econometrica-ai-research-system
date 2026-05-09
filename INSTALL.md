# Installation Into a Paper Folder

## Option A - Copy Files

Copy these files and folders into the root of your paper project:

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

Open the paper folder in Codex Desktop. Use:

```text
按系统处理：[your task]
```

## Option B - Git Clone and Copy

Clone the workflow repository somewhere stable, then copy the workflow files into each paper project.

```powershell
git clone https://github.com/viplee110/econ-theorist-ai.git
```

Then copy the files listed in Option A.

## Option C - Git Submodule

Inside a paper project:

```powershell
git submodule add https://github.com/viplee110/econ-theorist-ai.git ai_workflow
```

Then copy or symlink `AGENTS.md` into the paper root. Codex reads `AGENTS.md` most reliably when it is at the project root.

## Toolchain

Run this after copying if you have configured the local toolchain:

```powershell
.\verify_toolchain.ps1
```

By default the script looks for shared verification tools under:

```text
C:\Tools\CodexVerification
```

To use another location:

```powershell
$env:CODEX_VERIFICATION_HOME = "D:\Tools\CodexVerification"
.\verify_toolchain.ps1
```

or:

```powershell
.\verify_toolchain.ps1 -ToolRoot "D:\Tools\CodexVerification"
```

If Python, Lean, or Mathematica are unavailable, the workflows still work as prompts and checklists, but mathematical verification will be weaker.
