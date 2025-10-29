param([string]$Root='.')
# Accept <!-- XREF {json} XREF -->; fail on bad JSON
$ErrorActionPreference='Stop'
$fail=$false
$files = Get-ChildItem -Path $Root -Recurse -File -Include *.md,*.ps1 -ErrorAction SilentlyContinue
foreach($f in $files){
$files = $files | Where-Object { $_.FullName -notmatch '[\\/]{1}tools[\\/]BPOE[\\/]' }
  $txt = Get-Content $f.FullName -Raw -EA SilentlyContinue
  if(-not $txt){ continue }
  $matches = [regex]::Matches($txt,'<!--\s*XREF\s*(\{.*?\})\s*XREF\s*-->', 'Singleline')
  foreach($m in $matches){
    try{ $null = ($m.Groups[1].Value | ConvertFrom-Json) }catch{
      Write-Host "::error file=$($f.FullName)::bad XREF JSON"; $fail=$true
    }
  }
}
if($fail){ exit 1 }
