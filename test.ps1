
<#  recuperer le numéro de série de la machine #> 

$serial_number = wmic bios get SerialNumber

$b  = $serial_number[2].substring($serial_number[2].length - 10, 6)

<#  recuperer le numéro de série de la machine #> 
$b
