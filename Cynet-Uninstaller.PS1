# Uninstall Cynet using msiexec

if (Test-Path "C:\Windows\Temp\CynetMSI.msi") {
    msiexec.exe /x "C:\Windows\Temp\CynetMSI.msi" /qn PASS=Test1234!@ 
} else {
    Write-Host "MSI file not found."
}

if (Test-Path "C:\Windows\Temp\CynetMSI.msi") {
    msiexec.exe /x "C:\Windows\Temp\CynetMSI.msi" /qn PASS=Test1234!@
    Remove-Item "C:\Windows\Temp\CynetMSI.msi" -Force
} else {
    Write-Host "MSI file not found."
}

