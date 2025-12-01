# This will be a script that can automate as much of the "Computer Setups" for clients as possible. 
# https://tigunia.itglue.com/6958983/docs/15510037#version=published&documentMode=view 
<#
1.  Connect to the user's new computer.
2.  Verify local admin credentials, rename the computer, and update ownership in the Entra Admin Center.
3.  Confirm Microsoft Store functionality and install apps.
4.  Sign into Office Apps.
5.  Run Lenovo, Windows, and Office updates.
6.  Remove the AAD user account from the local admin group
7. Validate completion and send confirmation to the requestor.
#>
# App installs can be automated. I dont know if the rest should be automated. Is it worth the effort? Is it reliable?