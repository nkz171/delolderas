$Path = "D:\_TEST_" #set directory
$Daysback = "-2" #set days
$CurrentDate = Get-Date
$DatetoDelete = $CurrentDate.AddDays($Daysback)
#start-transcript "$Path $(get-date -format MMddyyHHmmss).txt"
get-childitem $Path -recurse | where {$_.lastwritetime -lt $DatetoDelete -and -not $_.psiscontainer} |% {remove-item $_.fullname -force -verbose}
