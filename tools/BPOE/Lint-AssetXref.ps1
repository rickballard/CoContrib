param(
  [Parameter(Mandatory=$true)][string]$Root
)
$ErrorActionPreference='Stop'
function Get-Rel([string]$Abs,[string]$Root){
  $a=(Resolve-Path $Abs).Path; $r=(Resolve-Path $Root).Path
  if($a.StartsWith($r,[StringComparison]::OrdinalIgnoreCase)){ return $a.Substring($r.Length).TrimStart('\','/') } $a
}
$files = Get-ChildItem -Path $Root -Recurse -File -Include *.md,*.ps1 |
         Where-Object { $_.FullName -notmatch '[\\/]{1}tools[\\/]BPOE[\\/]' } |
         Sort-Object FullName

# Accepts: <!-- XREF ... XREF -->  (payload captured loosely)
$rx = [regex]'(?is)<!--\s*XREF[^\r\n]*\r?\n?(?<payload>.*?)[\r\n]*XREF\s*-->'
$err = 0
foreach($f in $files){
  $t = Get-Content $f.FullName -Raw
  $m = $rx.Matches($t)
  foreach($mm in $m){
    $payload = $mm.Groups['payload'].Value

    # Strip code fences inside payload (defensive)
    $payload = $payload -replace '(?is)^\s*```.*?\r?\n',''
    $payload = $payload -replace '(?is)\r?\n```.*$',''

    # Try parse as JSON; if it fails, annotate
    try{
      $null = $payload | ConvertFrom-Json -ErrorAction Stop
    }catch{
      $pre = $t.Substring(0,$mm.Index)
      $line = ($pre -split "\r\n|\n").Count + 1
      $snippet = ($payload -replace '\s+',' ')
      if($snippet.Length -gt 160){ $snippet = $snippet.Substring(0,160) + ' …' }
      $err++
      Write-Host ("::error file={0},line={1}::bad XREF JSON -> {2}" -f $f.FullName,$line,$_.Exception.Message)
      Write-Host ("  snippet: {0}" -f $snippet)
    }
  }
}
if($err -gt 0){ exit 1 } else { Write-Host "XREF lint: ✅ clean"; exit 0 }