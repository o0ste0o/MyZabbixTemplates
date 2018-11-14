$rawdata = Get-IISAppPool | select-object -property @{N='{#APPPOOL}';E={$_.Name}}
$jsondata = @{"data" = $rawdata}
$jsondata | ConvertTo-Json -Compress
