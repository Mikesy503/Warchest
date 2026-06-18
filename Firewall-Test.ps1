$firewall = (get-netfirewallProfile -PolicyStore ActiveStore | Select-Object -Property Enabled)

if ($firewall -notcontains $false) {
    $true
} else {
    $false
}