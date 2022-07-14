<#

fait par : William Bouchard
But : Accélérer le montage de portable lenovo 

#> 

<#----------------------------------------------------------------------------------------------------------------------#> 
<#  recuperer le numéro de série de la machine #> 
$serial_number = wmic bios get SerialNumber
$Num_Serie = $serial_number[2].substring($serial_number[2].length - 10, 4)
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<#  recuperer le model du poste et le met dans le presse papier #> 
$SKU = ((Get-WmiObject -Namespace root\wmi -Class MS_SystemInformation).SystemSKU).Split(' ', 2)
$New_Name = 'PT-' + $SKU[1].Replace(' ', '') + '-' + $Num_Serie
Set-Clipboard -Value  $New_Name
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<#  seulement pour avoir un log du nom du pc #> 
$FileName = 'logtest'
$FolderPath = "C:\temp"
$Path = $FolderPath + "\" + $FileName + ".txt"
if (!(Test-Path $Path)) {
    New-Item -Path "c:\" -Name "temp" -ItemType "directory"
    New-Item -Path "C:\temp" -Name "logtest.txt" -ItemType File 
}
$New_Name >> $Path
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<#  cree le repertoire BGM #> 
New-Item -Path "c:\" -Name "BGM" -ItemType "directory"
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<# ouvre les application a mettre sur le bureau #> 
$Icon_Affichage = Rundll32.exe shell32.dll, Control_RunDLL desk.cpl, 0, 0
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<# ouvre le parametre pour changer le nom de la machine (juste a coller le nom)#> 
$Nom_pour_changer_pc = sysdm.cpl 0, 3
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<# change les parametres de démarage #> 
$Restart_auto = reg add “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl” /v AutoReboot /t REG_DWORD /d 0 /f 
$vidage_mem = wmic recoveros set DebugInfoType = 3
<#----------------------------------------------------------------------------------------------------------------------#> 


<#----------------------------------------------------------------------------------------------------------------------#> 
<# execute les commandes écrit plus haut #> 
$restart2
$propriete
$Icon_Affichage 
$Nom_pour_changer_pc
$Restart_auto
$vidage_mem 
<#----------------------------------------------------------------------------------------------------------------------#> 
