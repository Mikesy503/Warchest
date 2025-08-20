# Script that will send a discord message when A new episode comes out for whichever anime you specify
# Can be set as a job to be run whenever you want.


$webrequest = (Invoke-RestMethod -uri https://subsplease.org/rss/?t | Select-Object -Property title)

if ((Get-PackageProvider).name -contains 'nuget') {
    $null
}
else {
    Install-PackageProvider -Name nuget -Force
}

if ((Get-InstalledModule).Name -match 'psdiscord') {
    $null
}
else {
    Install-Module psdiscord -Force
}

if (!( Test-Path -Path $env:temp\webhook.txt)) { 
    Read-Host -Prompt 'Please enter Discord webhook URL. This is where you will receive notifications' | Out-File $env:temp\webhook.txt
}
else {
    $null
}

$discordurl = (get-content -Path $env:TEMP\webhook.txt )

if (!( Test-Path -Path $env:temp\nameofshow.txt)) { 
    read-host -Prompt 'Name of show?' | Out-File -FilePath $env:temp\nameofshow.txt 
}
else {
    $null
}

$nameofshow = (Get-Content -Path $env:temp\nameofshow.txt )


if ($webrequest -match $nameofshow) {
    Send-DiscordMessage -WebHookUrl $discordurl -text 'Im here!' -AvatarName "$nameofshow"
}
else {
    Send-DiscordMessage -WebHookUrl $discordurl -text 'Im not here...' -AvatarName "$nameofshow"
}
