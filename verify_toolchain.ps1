param(
  [string]$ToolRoot = $env:CODEX_VERIFICATION_HOME,
  [string]$ConfigPath = "",
  [switch]$WriteStatus
)

$ErrorActionPreference = "Continue"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$UserConfigDir = Join-Path $HOME ".econ-theorist-ai"
if (-not $ConfigPath) {
  $ConfigPath = Join-Path $UserConfigDir "config.json"
}

$Config = $null
if (Test-Path -LiteralPath $ConfigPath) {
  try {
    $Config = Get-Content -Raw -Encoding UTF8 -LiteralPath $ConfigPath | ConvertFrom-Json
  } catch {
    Write-Host "[warning] Could not read config file: $ConfigPath"
  }
}

if (-not $ToolRoot -and $Config -and $Config.toolRoot) {
  $ToolRoot = [string]$Config.toolRoot
}
if (-not $ToolRoot) {
  $ToolRoot = "C:\Tools\CodexVerification"
}

$Status = [ordered]@{}
$Impacts = New-Object System.Collections.Generic.List[string]

function First-ExistingPath($Candidates) {
  foreach ($Candidate in $Candidates) {
    if ($Candidate -and (Test-Path -LiteralPath $Candidate)) {
      return $Candidate
    }
  }
  return $null
}

function First-CommandPath($Names) {
  foreach ($Name in $Names) {
    $Command = Get-Command $Name -ErrorAction SilentlyContinue
    if ($Command) {
      return $Command.Source
    }
  }
  return $null
}

function Add-Impact($Message) {
  $Impacts.Add($Message) | Out-Null
}

function Run-VersionCheck($Path, $Arguments) {
  if (-not $Path) {
    return $false
  }
  try {
    $Output = & $Path @Arguments 2>&1
    return ($LASTEXITCODE -eq 0)
  } catch {
    return $false
  }
}

$RequiredWorkflowFiles = @(
  "AGENTS.md",
  "ECONOMETRICA_ORCHESTRATOR.md",
  "ECONOMETRICA_AI_HUMAN_WORKFLOW.md",
  "ECONOMETRICA_DISCOVERY_WORKFLOW.md",
  "ECONOMETRICA_PANEL_PROTOCOL.md"
)

$MissingWorkflowFiles = @()
foreach ($File in $RequiredWorkflowFiles) {
  if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot $File))) {
    $MissingWorkflowFiles += $File
  }
}

if ($MissingWorkflowFiles.Count -eq 0) {
  $Status["Core workflow"] = "OK"
} else {
  $Status["Core workflow"] = "Missing files: $($MissingWorkflowFiles -join ', ')"
  Add-Impact "Core workflow files are missing. Copy the complete workflow file set into the paper project."
}

$Git = First-ExistingPath @(
  "C:\Program Files\Git\cmd\git.exe",
  "C:\Program Files\Git\bin\git.exe"
)
if (-not $Git) {
  $Git = First-CommandPath @("git")
}
if ($Git -and (Run-VersionCheck $Git @("--version"))) {
  $Status["Git"] = "OK ($Git)"
} else {
  $Status["Git"] = "Missing"
  Add-Impact "Git checkpoints and version-control workflows will be weaker."
}

$Latex = First-CommandPath @("latexmk", "pdflatex", "xelatex", "tectonic")
if ($Latex) {
  $Status["LaTeX"] = "OK ($Latex)"
} else {
  $Status["LaTeX"] = "Missing"
  Add-Impact "Local manuscript compilation may be unavailable."
}

$PythonCandidates = @()
if ($Config -and $Config.pythonPath) { $PythonCandidates += [string]$Config.pythonPath }
$PythonCandidates += (Join-Path $ToolRoot "Python312\python.exe")
$Python = First-ExistingPath $PythonCandidates
if (-not $Python) {
  $Python = First-CommandPath @("python", "py")
}

$PackageNames = @("sympy", "numpy", "scipy", "pandas", "z3")
$PackageStatus = [ordered]@{}
if ($Python) {
  $PythonCode = @"
import importlib.util
pkgs = ["sympy", "numpy", "scipy", "pandas", "z3"]
missing = []
for pkg in pkgs:
    ok = importlib.util.find_spec(pkg) is not None
    print(f"{pkg}:{'OK' if ok else 'Missing'}")
    if not ok:
        missing.append(pkg)
raise SystemExit(1 if missing else 0)
"@
  try {
    $PythonOutput = & $Python -c $PythonCode 2>&1
    foreach ($Line in $PythonOutput) {
      if ($Line -match "^([^:]+):(OK|Missing)$") {
        $PackageStatus[$Matches[1]] = $Matches[2]
      }
    }
    $MissingPackages = @($PackageNames | Where-Object { -not $PackageStatus.Contains($_) -or $PackageStatus[$_] -ne "OK" })
    if ($MissingPackages.Count -eq 0 -and $LASTEXITCODE -eq 0) {
      $Status["Python verification"] = "OK ($Python)"
    } else {
      $Status["Python verification"] = "Partial ($Python; missing: $($MissingPackages -join ', '))"
      Add-Impact "Python is available, but missing packages weaken symbolic algebra, numerical checks, or SMT/counterexample checks."
    }
  } catch {
    $Status["Python verification"] = "Partial ($Python; package check failed)"
    Add-Impact "Python exists, but the scientific package check did not run successfully."
  }
} else {
  $Status["Python verification"] = "Missing"
  Add-Impact "Python verification is unavailable. The research workflow still works, but proof checks and counterexample searches are weaker."
}

$ElanCandidates = @()
if ($Config -and $Config.elanHome) { $ElanCandidates += [string]$Config.elanHome }
$ElanCandidates += (Join-Path $ToolRoot "elan")
$ElanHome = First-ExistingPath $ElanCandidates

$LeanCandidates = @()
$LakeCandidates = @()
if ($Config -and $Config.leanPath) { $LeanCandidates += [string]$Config.leanPath }
if ($Config -and $Config.lakePath) { $LakeCandidates += [string]$Config.lakePath }
if ($ElanHome) {
  $LeanCandidates += (Join-Path $ElanHome "bin\lean.exe")
  $LakeCandidates += (Join-Path $ElanHome "bin\lake.exe")
}
$Lean = First-ExistingPath $LeanCandidates
$Lake = First-ExistingPath $LakeCandidates
if (-not $Lean) { $Lean = First-CommandPath @("lean") }
if (-not $Lake) { $Lake = First-CommandPath @("lake") }

if ($Lean -and $Lake) {
  if ($ElanHome) { $env:ELAN_HOME = $ElanHome }
  $LeanOk = Run-VersionCheck $Lean @("--version")
  $LakeOk = Run-VersionCheck $Lake @("--version")
  if ($LeanOk -and $LakeOk) {
    $Status["Lean formal verification"] = "OK (lean: $Lean; lake: $Lake)"
  } else {
    $Status["Lean formal verification"] = "Optional / Untested"
    Add-Impact "Lean or Lake was found but did not run cleanly. Formal verification is optional and can be configured later."
  }
} else {
  $Status["Lean formal verification"] = "Optional / Missing"
  Add-Impact "Lean formal verification is optional. Missing Lean does not block ordinary theory workflow."
}

$WolframCandidates = @()
if ($Config -and $Config.wolframScriptPath) { $WolframCandidates += [string]$Config.wolframScriptPath }
foreach ($Version in @("14.2", "14.1", "14.0", "13.3", "13.2", "13.1", "13.0")) {
  $WolframCandidates += "C:\Program Files\Wolfram Research\Mathematica\$Version\wolframscript.exe"
}
$WolframScript = First-ExistingPath $WolframCandidates
if (-not $WolframScript) {
  $WolframScript = First-CommandPath @("wolframscript")
}

if ($WolframScript) {
  try {
    $WolframOutput = & $WolframScript -code "Print[2+2]" 2>&1
    if ($LASTEXITCODE -eq 0 -and (($WolframOutput -join "`n") -match "4")) {
      $Status["Mathematica symbolic verification"] = "OK ($WolframScript)"
    } else {
      $Status["Mathematica symbolic verification"] = "Optional / Untested ($WolframScript)"
      Add-Impact "WolframScript was found, but the kernel or license was not confirmed. Mathematica checks are optional."
    }
  } catch {
    $Status["Mathematica symbolic verification"] = "Optional / Untested ($WolframScript)"
    Add-Impact "WolframScript was found, but Mathematica did not run cleanly. Symbolic verification can use Python instead."
  }
} else {
  $Status["Mathematica symbolic verification"] = "Optional / Missing"
  Add-Impact "Mathematica is optional. Missing Mathematica only affects advanced symbolic simplification."
}

Write-Host "== Econ Theorist AI Setup Check =="
Write-Host "Tool root: $ToolRoot"
Write-Host "Config path: $ConfigPath"
Write-Host ""
foreach ($Key in $Status.Keys) {
  Write-Host "${Key}: $($Status[$Key])"
}

Write-Host ""
if ($Impacts.Count -eq 0) {
  Write-Host "Recommended next step: initialize this paper project."
  Write-Host "Impact on workflow: all checked verification tools are available."
} else {
  Write-Host "Recommended next step: you can still start the research workflow. Configure missing tools only when you need the affected verification capability."
  Write-Host "Impact on workflow:"
  foreach ($Impact in $Impacts) {
    Write-Host "- $Impact"
  }
}

if ($WriteStatus) {
  if (-not (Test-Path -LiteralPath $UserConfigDir)) {
    New-Item -ItemType Directory -Path $UserConfigDir -Force | Out-Null
  }
  $StatusPath = Join-Path $UserConfigDir "toolchain_status.md"
  $Lines = New-Object System.Collections.Generic.List[string]
  $Lines.Add("# Toolchain Status") | Out-Null
  $Lines.Add("") | Out-Null
  $Lines.Add("Status date: $(Get-Date -Format o)") | Out-Null
  $Lines.Add("Tool root: $ToolRoot") | Out-Null
  $Lines.Add("Config path: $ConfigPath") | Out-Null
  $Lines.Add("") | Out-Null
  foreach ($Key in $Status.Keys) {
    $Lines.Add("${Key}: $($Status[$Key])") | Out-Null
  }
  $Lines.Add("") | Out-Null
  $Lines.Add("Recommended next step: " + ($(if ($Impacts.Count -eq 0) { "initialize this paper project." } else { "start the research workflow; configure missing tools only when needed." }))) | Out-Null
  $Lines.Add("") | Out-Null
  $Lines.Add("Impact on workflow:") | Out-Null
  if ($Impacts.Count -eq 0) {
    $Lines.Add("- All checked verification tools are available.") | Out-Null
  } else {
    foreach ($Impact in $Impacts) {
      $Lines.Add("- $Impact") | Out-Null
    }
  }
  Set-Content -LiteralPath $StatusPath -Value $Lines -Encoding UTF8
  Write-Host ""
  Write-Host "Wrote status: $StatusPath"
}

if ($MissingWorkflowFiles.Count -gt 0) {
  exit 1
}

exit 0
