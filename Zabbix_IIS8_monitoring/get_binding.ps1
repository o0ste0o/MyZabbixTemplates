Import-Module WebAdministration
$sites = Get-WebBinding |findstr ":" | foreach { $_.Split("*:")| where {$_ -match "^\d{1,3}"  } }


$hash = @{}

# главный цикл перебора значений исходного массива
foreach ($i in $sites) {

# если hash table содержит ключ равный текущему значению исходного массива
if ($hash.ContainsKey($i)) {
# добавляем к значению (Value), соответствующему этому ключу единицу
[int]$hash.$i += 1
#если такого элемента нет
} else {

# добавляем его в hash table со значением 1
$hash.Add($i,"1")
}
}



$idx = 1
write-host "{"
write-host " `"data`":[`n"
foreach ($currentsite  in $($hash.keys))
{
    if ($idx -lt $($hash.keys).count)
    {
     
        $line= "{ `"{#PORT}`" : `"" + $currentsite + "`" },"
        write-host $line
    }
    elseif ($idx -ge $($hash.keys).count)
    {
    $line= "{ `"{#PORT}`" : `"" + $currentsite + "`" }"
    write-host $line
    }
    $idx++;
}
write-host
write-host " ]"
write-host "}"