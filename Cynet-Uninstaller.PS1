# Uninstall Cynet using PowerShell

try {
    if (Test-Path "C:\Windows\Temp\CynetMSI.msi") {
        msiexec.exe /x "C:\Windows\Temp\CynetMSI.msi" /qn PASS=Test1234!@
        Remove-Item "C:\Windows\Temp\CynetMSI.msi" -Force
        Write-Host "Cynet uninstalled successfully."
    } else {
        Write-Host "MSI file not found. Adding MSI file to the temp folder."
        # Copy-Item "PATH TO MSI" "C:\Windows\Temp\CynetMSI.msi"
        msiexec.exe /x "C:\Windows\Temp\CynetMSI.msi" /qn PASS=Test1234!@
        Remove-Item "C:\Windows\Temp\CynetMSI.msi" -Force
        Write-Host "Cynet uninstalled successfully."
    }
} catch {
    Write-Host "An error occurred during the uninstallation process: $_"
}


