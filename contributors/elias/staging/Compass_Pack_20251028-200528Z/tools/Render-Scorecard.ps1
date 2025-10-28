param([Parameter(Mandatory=$true)][string]$CsvPath)
$ErrorActionPreference='Stop'
$rows = Import-Csv $CsvPath | Where-Object { $_.contender -and $_.dimension }
$group = $rows | Group-Object contender
$totals = foreach($g in $group){
  $sum = 0
  foreach($r in $g.Group){
    $m = [double]$r.multiplier
    $s = [double]$r.score_0to5
    if($s -lt 0){ $s = 0 } elseif($s -gt 5){ $s = 5 }
    $sum += ($m * $s)
  }
  [pscustomobject]@{ Contender=$g.Name; Total=[math]::Round($sum,2) }
}
$totals | Sort-Object Total -Descending | Format-Table -AutoSize
