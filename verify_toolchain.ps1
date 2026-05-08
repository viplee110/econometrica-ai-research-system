param(
  [string]$ToolRoot = $env:CODEX_VERIFICATION_HOME
)

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $ToolRoot) {
  $ToolRoot = "C:\Tools\CodexVerification"
}

$Failures = New-Object System.Collections.Generic.List[string]

function First-ExistingPath($Candidates) {
  foreach ($Candidate in $Candidates) {
    if ($Candidate -and (Test-Path -LiteralPath $Candidate)) {
      return $Candidate
    }
  }
  return $null
}

function Note-Failure($Message) {
  $Failures.Add($Message) | Out-Null
  Write-Host "[missing] $Message"
}

$Python = First-ExistingPath @(
  (Join-Path $ToolRoot "Python312\python.exe")
)
if (-not $Python) {
  $PythonCommand = Get-Command python -ErrorAction SilentlyContinue
  if ($PythonCommand) {
    $Python = $PythonCommand.Source
  }
}

$ElanHome = First-ExistingPath @(
  (Join-Path $ToolRoot "elan")
)
$Lean = if ($ElanHome) { Join-Path $ElanHome "bin\lean.exe" } else { $null }
$Lake = if ($ElanHome) { Join-Path $ElanHome "bin\lake.exe" } else { $null }
$WolframScript = "C:\Program Files\Wolfram Research\Mathematica\13.0\wolframscript.exe"

Write-Host "== Tool root =="
Write-Host $ToolRoot

Write-Host "`n== Python scientific stack =="
if ($Python) {
  Write-Host "Using Python: $Python"
  & $Python -c "import sympy as sp, numpy as np, scipy, pandas as pd, z3; x=sp.symbols('x'); print('python_ok'); print('d/dx x^3 =', sp.diff(x**3,x)); print('numpy_sum =', np.array([1,2,3]).sum()); print('scipy =', scipy.__version__); print('pandas =', pd.__version__); print('z3_symbol =', z3.Int('n'))"
  if ($LASTEXITCODE -ne 0) {
    Note-Failure "Python exists, but one or more scientific packages are unavailable."
  }
} else {
  Note-Failure "Python executable not found."
}

Write-Host "`n== Lean toolchain =="
if ($ElanHome -and (Test-Path -LiteralPath $Lean) -and (Test-Path -LiteralPath $Lake)) {
  Write-Host "Using ELAN_HOME: $ElanHome"
  $env:ELAN_HOME = $ElanHome
  & $Lean --version
  if ($LASTEXITCODE -ne 0) {
    Note-Failure "Lean executable was found, but did not run successfully."
  }
  & $Lake --version
  if ($LASTEXITCODE -ne 0) {
    Note-Failure "Lake executable was found, but did not run successfully."
  }
} else {
  Note-Failure "Lean/Lake executables not found."
}

Write-Host "`n== Wolfram / Mathematica =="
if (Test-Path -LiteralPath $WolframScript) {
  & $WolframScript -code 'Print[$Version]'
  if ($LASTEXITCODE -ne 0) {
    Note-Failure "WolframScript was found, but the kernel did not run successfully. Check Mathematica licensing or sandbox access."
  }
} else {
  Note-Failure "WolframScript not found at expected path."
}

if ($Failures.Count -gt 0) {
  Write-Host "`n== Summary =="
  foreach ($Failure in $Failures) {
    Write-Host "- $Failure"
  }
  exit 1
}

Write-Host "`nAll configured verification tools passed."

