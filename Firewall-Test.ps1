param (
        [parameter(
        Mandatory = $false)]
        [string]$result
    )
    $result = (get-netfirewallProfile -PolicyStore ActiveStore | Select-Object -Property Name, Enabled)

    if ($result.Enabled -eq $True){write-host 'this is true'}
