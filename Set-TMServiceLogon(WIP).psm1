function Set-TMServicelogon {
    [cmdletbinding()]
    param (
        [Parameter(
            ValueFromPipelineByPropertyName = $True,
            Mandatory = $True,
            ValueFromPipeline = $True)]
        [string[]]$ComputerName,
        [Parameter(Mandatory = $True,
            ValueFromPipelineByPropertyName = $True)]
        [string]$ServiceName,
        [Parameter(Mandatory = $True)]
        [string]$NewPassword,
        [pscredential]$Credentials,
        [string]$AuthenticationType
    )
    foreach ($computer in $computername) {
        if ($computer -eq 'localhost') {
            write-verbose "Establishing Cim session with $computer"
            $session = New-CimSession -ComputerName localhost
            write-verbose "Getting instance $servicename from $computer"
            $cim = Get-Ciminstance -computername localhost -ClassName win32_service | Where-Object -Property name -eq "$servicename"
            Write-verbose "Invoking method change. Adding arguments to $servicename"
            Invoke-CimMethod -InputObject $cim -CimSession $session -MethodName Change -Arguments @{ 
                Startpassword = "$newpassword"
            } 
            |
            Select-Object -Property @{name = 'ComputerName'; expression = { $computer } },
            @{name = 'Result'; expression = { switch ($_.ReturnValue) {
                        0 { 'Successful' }
                        22 { 'Wrong User' } 
                    } }
            }
            write-verbose "Operation complete!"
        }
        else {
            $session = New-CimSession -Authentication $AuthenticationType -Credential $Credentials -ComputerName $Computer
            $cim = Get-Ciminstance -CimSession $session -ClassName win32_service | Where-Object -Property name -eq "$servicename"
            Invoke-CimMethod -InputObject $cim -CimSession $session -MethodName Change -Arguments @{ 
                Startpassword = "$newpassword"
            } |
            Select-Object -Property @{name = 'ComputerName'; Expression = { $computer } },
            @{name = 'Result'; expression = { switch ($_.ReturnValue) {
                        0 { 'Successful' }
                        22 { 'Wrong User' } 
                    }
                }
            }
        }
    }
    Get-CimSession | Remove-CimSession
}