param ([string] $name = 0)
Import-Module WebAdministration
$apppoolState = Get-WebAppPoolState -name "$name"
Write-Output ($apppoolState.value)