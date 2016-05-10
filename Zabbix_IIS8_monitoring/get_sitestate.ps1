param ([string] $name = 0)
Import-Module WebAdministration
$siteState = Get-WebsiteState -name "$name"
Write-Output ($siteState.value)