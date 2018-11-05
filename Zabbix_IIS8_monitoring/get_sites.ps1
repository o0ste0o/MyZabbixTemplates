Import-Module WebAdministration
$sites = Get-ChildItem -Path IIS:\Sites -Name

$lldlist = @()
foreach ($site in $sites) {
  $dict = @{}
  $dict.Add('{#SITE}',$site)
  $lldlist += $dict
}

$llddata = @{"data" = $lldlist}
$llddata | ConvertTo-Json -Depth 2
