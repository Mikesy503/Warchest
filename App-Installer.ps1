# Installs applications by name. If the name doesn't narrow it down enough or there are multiple sources to download from 
# it will open a web browser showing the different sources so you can pick and choose. 

# You will need to open PowerShell as Administrator and type in: Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass

read-host -Prompt 'Name of programs you wish to install.
(Example: Chrome, Discord, Skype)' | Out-File -FilePath $env:TEMP\programlist.csv
$Programs = (Get-Content -Path $env:temp\programlist.csv -raw ).Split(',').ForEach{$_.trim()}
foreach ($program in $programs) {
    if ((winget install --moniker $program) -match 'Multiple packages found matching input criteria. Please refine the input.')
    { Start-Process https://winget.run/search?query=$program }
    else { winget install --moniker $program}
}