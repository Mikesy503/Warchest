# Install preferred programs. Still ongoing.
# install-module Microsoft.WinGet.Client 
# new-item -Path C:\ -Name Programlist.csv -ItemType File -Value 'steam, discord, chrome' 
# need to differentiate between 32 bit and 64 bit OS 
# need to make sure it installs the first one from the winget source not the msstore source
<#

winget install discord.discord 
winget install valve.steam 
winget install RARLab.WinRAR 
winget install google.chrome 
winget install microsoft.visualstudiocode
winget install github.githubdesktop
winget install git.git
winget install microsoft.powershell
winget install insecure.nmap
winget install adobe.acrobat.reader.64-bit
winget install videolan.vlc
steam, acrobatreader, discord, winrar, chrome, vscode, powershell, nmap, vlc
https://winget.run/search?query=zoom
#>
Set-ExecutionPolicy -Scope CurrentUser -force -ExecutionPolicy RemoteSigned

$Createlist = read-host -Prompt 'Name of programs you wish to install.
(Example: Chrome, Discord, Skype)' | Out-File -FilePath $env:TEMP\programlist.csv

$Programs = Get-Content -Delimiter ', ' -Path $env:temp\programlist.csv

foreach ($program in $programs) {
    if ((winget install --moniker $program.TrimEnd() --no-upgrade) -match 'Multiple packages found matching input criteria. Please refine the input.')
    {Start-Process https://winget.run/search?query=$program}
    else {winget install --moniker $program.TrimEnd() --no-upgrade}
}

remove-item -Path $env:temp\programlist.csv


