$uac = Get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA

if ($uac.EnableLUA -eq 1) {
    $true
} else {
    $false
}