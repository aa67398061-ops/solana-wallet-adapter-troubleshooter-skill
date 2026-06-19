$ErrorActionPreference = "Stop"

$TargetDir = if ($args.Length -gt 0) {
  $args[0]
} else {
  Join-Path $HOME ".claude\skills\solana-wallet-adapter-troubleshooter"
}

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Copy-Item -Recurse -Force -Path (Join-Path $PSScriptRoot "skill\*") -Destination $TargetDir

Write-Host "Installed solana-wallet-adapter-troubleshooter to $TargetDir"
Write-Host "Restart your agent session or reload skills if needed."
