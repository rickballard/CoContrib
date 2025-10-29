param([Parameter(Mandatory)][string]$Title, [string]$Body = "Tiny starter task", [string[]]$Labels = @("first-build","good first issue"))
$ErrorActionPreference="Stop"
$repo = (git -C (Split-Path -Parent $PSScriptRoot) remote get-url origin); if(-not $repo){ throw "No origin remote." }
$slug = ($repo -replace "^.+github\.com[:/]", "") -replace "\.git$",""
$args = @("issue","create","--repo",$slug,"--title",$Title,"--body",$Body)
foreach($l in $Labels){ $args += @("--label",$l) }
& gh @args
