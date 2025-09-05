<<<<<<< HEAD
# Anime-DiscordNotifier Uninstaller
# If you accidently type something incorrect in the app run the uninstaller and then try again
# To run, right click file and run from powershell.
# If it closes immediately you need to allow powershell to run .ps1 files.
# Take note of what your ExecutionPolicy is before you change it so you can change it back.
# To check what your ExecutionPolicy is, open powershell as Administrator and type the following command.
# Get-ExecutionPolicy
# To allow powershell to run .ps1 files open powershell as Administrator and run the following command.
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted
# You can change it back to whatever it was before with the same command just replace 'Unrestricted' with what it was before.

Unregister-ScheduledTask -taskname Anime-DiscordNotifier
remove-item $env:temp\daysofweek.txt
remove-item $env:temp\timeofday.txt
Remove-item $env:temp\nameofshow.txt 
=======
# Anime-DiscordNotifier Uninstaller
# If you accidently type something incorrect in the app run the uninstaller and then try again
# To run, right click file and run from powershell.
# If it closes immediately you need to allow powershell to run .ps1 files.
# Take note of what your ExecutionPolicy is before you change it so you can change it back.
# To check what your ExecutionPolicy is, open powershell as Administrator and type the following command.
# Get-ExecutionPolicy
# To allow powershell to run .ps1 files open powershell as Administrator and run the following command.
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted
# You can change it back to whatever it was before with the same command just replace 'Unrestricted' with what it was before.

Unregister-ScheduledTask -taskname Anime-DiscordNotifier
remove-item $env:temp\daysofweek.txt
remove-item $env:temp\timeofday.txt
Remove-item $env:temp\nameofshow.txt 
>>>>>>> 3610302e14809b8afb00fb78b42faff1d8002c72
remove-item $env:temp\webhook.txt