function Picnic.ps1 {
param (
    [Parameter(
        Mandatory = $True)]
    [string[]]$word,
    [Parameter(
        Mandatory = $False)]
        [switch]$Sorted
)
if ($sorted -eq $true) {
   $word = $word | Sort-Object 
}

if ($word.Count -eq 1) {
    write-host "You are bringing $word."
}
elseif ($word.count -eq 2) {
    write-host "You are bringing $($word[0] + " and " + $word[1])."
}
elseif ($word.count -gt 2) {
    write-host "You are bringing $(($word[0..($word.count-2)] -join ', ') + ' and ' + $word[-1])."
}
}