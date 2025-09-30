param (
        [parameter(
        Mandatory = $True)]
        [string]$word
    )
    $vowels = 'a','e','i','o','u'
    $checkword = $word.Substring(0,1).ToLower()
    if ($checkword -in $vowels) {
        Write-Host "There's an $word off the larboard bow!"
    }
    else {
        Write-Host "There's a $word off the larboard bow!"
    }
    