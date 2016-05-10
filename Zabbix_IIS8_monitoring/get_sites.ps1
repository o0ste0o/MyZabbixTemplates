Import-Module WebAdministration
$sites = Get-ChildItem -Path IIS:\Sites -Name
$idx = 1
write-host "{"
write-host " `"data`":[`n"
foreach ($currentsite in $sites)
{
    if ($idx -lt $sites.count)
    {
     
        $line= "{ `"{#SITE}`" : `"" + $currentsite + "`" },"
        write-host $line
    }
    elseif ($idx -ge $site.count)
    {
    $line= "{ `"{#SITE}`" : `"" + $currentsite + "`" }"
    write-host $line
    }
    $idx++;
}
write-host
write-host " ]"
write-host "}"
