# Script that will send a discord message when A new episode comes out for whichever anime you specify at anytime you specify.
# To run, right click file and run from powershell.
# If it closes immediately you need to allow powershell to run .ps1 files.
# Take note of what your ExecutionPolicy is before you change it so you can change it back.
# To check what your ExecutionPolicy is, open powershell as Administrator and type the following command.
# Get-ExecutionPolicy
# To allow powershell to run .ps1 files open powershell as Administrator and run the following command.
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted
# You can change it back to whatever it was before with the same command just replace 'Unrestricted' with what it was before.

# Cheers!

$action = New-ScheduledTaskAction -Execute powershell.exe -Argument {
    $webrequest = (Invoke-RestMethod -uri https://subsplease.org/rss/?t | Select-Object -Property title)
    $discordurl = (get-content -Path $env:TEMP\webhook.txt )
    $nameofshow = (Get-Content -Path $env:temp\nameofshow.txt )

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

    if ($webrequest -match $nameofshow) {
        Send-DiscordMessage -WebHookUrl $discordurl -text 'Im here!' -AvatarName "$nameofshow"
    }
    else {
        Send-DiscordMessage -WebHookUrl $discordurl -text 'Im not here...' -AvatarName "$nameofshow"
    }
}


if (!( Test-Path -Path $env:temp\webhook.txt)) { 
    Read-Host -Prompt 'Please enter Discord webhook URL. This is where you will receive notifications' | Out-File $env:temp\webhook.txt
}
else {
    $null
}

if (!( Test-Path -Path $env:temp\nameofshow.txt)) { 
    read-host -Prompt 'Name of show?
Example: One Piece' | Out-File -FilePath $env:temp\nameofshow.txt 
}
else {
    $null
}

if (!( Test-Path -Path $env:temp\daysofweek.txt)) { 
    (read-host -Prompt "What days of the week do you want to be notified?
Example: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday" | Out-File $env:temp\daysofweek.txt) 
}
else {
    $null
}

$days = (get-content -Path $env:temp\daysofweek.txt)

if (!( Test-Path -Path $env:temp\timeofday.txt)) { 
    (read-host -Prompt "What time do you want to be notified?
Example: 10:00 pm" | Out-File $env:temp\timeofday.txt) 
}
else {
    $null
}

$time = (get-content -Path $env:temp\timeofday.txt)

$trigger = New-ScheduledTaskTrigger -DaysOfWeek $days -At $time -Weekly
$task = New-ScheduledTask -Action $action -Trigger $trigger
Register-ScheduledTask -InputObject $task -TaskName Anime-DiscordNotifier -ErrorAction SilentlyContinue
start-scheduledTask -TaskName Anime-DiscordNotifier