# Local Verification Toolchain

This workflow expects verification tools to live outside paper project folders.
The default shared tool root on Windows is:

```text
C:\Tools\CodexVerification
```

You can override this location by setting `CODEX_VERIFICATION_HOME` or by
passing `-ToolRoot` to `verify_toolchain.ps1`.

## Shared Tool Layout

- Python 3.12.10: `C:\Tools\CodexVerification\Python312\python.exe`
- Python packages:
  - `sympy` for symbolic algebra
  - `numpy` and `scipy` for numerical computation and counterexample search
  - `matplotlib` for plots
  - `pandas` for tables/logs
  - `z3-solver` for SMT-style checks
- Lean 4 via elan:
  - `lean`: `C:\Tools\CodexVerification\elan\bin\lean.exe`
  - `lake`: `C:\Tools\CodexVerification\elan\bin\lake.exe`
- Optional shared Lake packages:
  - `C:\Tools\CodexVerification\lean_packages\lean-vX.Y.Z\`

For Lean projects with Mathlib, keep the project files in the paper folder:

```text
lakefile.toml
lake-manifest.json
lean-toolchain
YourLeanLibrary/
```

Keep large package caches in the shared tool root when possible, especially when
working inside cloud-synced folders such as Dropbox.

## Mathematica

Mathematica 13.0 is installed locally, and `wolframscript` exists at:

```text
C:\Program Files\Wolfram Research\Mathematica\13.0\wolframscript.exe
```

Codex can run `wolframscript` successfully when the command is allowed to run outside the default sandbox. In the default sandbox, WolframScript may fail because it cannot read the user configuration directory:

```text
C:\Users\viplee110\AppData\Roaming\Wolfram\WolframScript
```

When using Mathematica from Codex, approve the `wolframscript` command if prompted. Mathematica is useful for:

- `FullSimplify`
- `Reduce`
- `Resolve`
- symbolic derivatives
- inequality checks under assumptions
- exact parameter-region analysis

## Quick Self-Test

Run:

```powershell
.\verify_toolchain.ps1
```

Use a non-default tool root:

```powershell
$env:CODEX_VERIFICATION_HOME = "D:\Tools\CodexVerification"
.\verify_toolchain.ps1
```

or:

```powershell
.\verify_toolchain.ps1 -ToolRoot "D:\Tools\CodexVerification"
```

Direct Mathematica test:

```powershell
& "C:\Program Files\Wolfram Research\Mathematica\13.0\wolframscript.exe" -code "Print[2+2]"
& "C:\Program Files\Wolfram Research\Mathematica\13.0\wolframscript.exe" -code "Print[FullSimplify[D[x^3,x]]]"
```

## Python Command

Use:

```powershell
& "C:\Tools\CodexVerification\Python312\python.exe"
```

Example:

```powershell
& "C:\Tools\CodexVerification\Python312\python.exe" -c "import sympy as sp; x=sp.symbols('x'); print(sp.diff(x**3, x))"
```

## Lean Command

Use:

```powershell
$env:ELAN_HOME = "C:\Tools\CodexVerification\elan"
& "C:\Tools\CodexVerification\elan\bin\lean.exe" --version
& "C:\Tools\CodexVerification\elan\bin\lake.exe" --version
```

Mathlib should be installed only when needed, because it is a large dependency.
Prefer shared package storage under `C:\Tools\CodexVerification\lean_packages`.
