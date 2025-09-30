# encode numbers 1-9

param (
    [string]$string
)

$code = @{
'0' = 5
'1' = 9
'2' = 8
'3' = 7
'4' = 6
'5' = 0
'6' = 4
'7' = 3
'8' = 2
'9' = 1 }

$result = ''

foreach ($number in $string.ToCharArray()){
    if ($number -match '\d') {
    $result += $code[[string]$number]
}
else {
    $result += $number 
}
}

write-host $result
