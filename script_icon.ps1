$Icon_Affichage =  Rundll32.exe shell32.dll,Control_RunDLL desk.cpl 0,0

$Nom_pour_changer_pc = sysdm.cpl 0, 3

$propriete = SystemPropertiesComputerName

$Restart_auto = reg add “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl” /v AutoReboot /t REG_DWORD /d 0 /f
$vidage_mem = wmic recoveros set DebugInfoType = 3

$propriete
$Icon_Affichage 
$Nom_pour_changer_pc
$Restart_auto
$vidage_mem 