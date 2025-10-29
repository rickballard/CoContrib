param([string]$Root='.',[string]$Out='docs/bpoe/xref-graph.mmd')
$files = Get-ChildItem -Path $Root -Recurse -File -Include *.md,*.ps1 -ErrorAction SilentlyContinue
$edges = New-Object System.Collections.Generic.List[string]
foreach($f in $files){
  $txt = Get-Content $f.FullName -Raw -EA SilentlyContinue
  if(-not $txt){ continue }
  $matches = [regex]::Matches($txt,'<!--\s*XREF\s*(\{.*?\})\s*XREF\s*-->', 'Singleline')
  foreach($m in $matches){
    $j = $m.Groups[1].Value | ConvertFrom-Json -EA SilentlyContinue
    if(-not $j){ continue }
    foreach($dep in @($j.depends_on)){ if($dep){ $edges.Add("`"$($f.FullName.Replace('\','/'))`" --> `"$dep`"") } }
  }
}
$mmd = "graph TD`n" + ([string]::Join("`n", ($edges | Select-Object -Unique)))
New-Item -ItemType Directory -Force (Split-Path $Out) | Out-Null
[IO.File]::WriteAllText((Join-Path $PWD $Out), $mmd, [Text.UTF8Encoding]::new($false))