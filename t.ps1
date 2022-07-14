
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())

$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

Start-Process powershell.exe -Verb RunAs -ArgumentList . @(
    $serial_number = wmic bios get SerialNumber,
    $b = $serial_number[2].substring($serial_number[2].length - 10, 4),
    $SKU = ((Get-WmiObject -Namespace root\wmi -Class MS_SystemInformation).SystemSKU).Split(' ', 2),
    $New_Name = 'PT-' + $SKU[1].Replace(' ', '') + '-' + $b
    $FileName = 'logtest'
    $FolderPath = "C:\temp"
    $Path = $FolderPath + "\" + $FileName + ".txt"
    if (!(Test-Path $Path)) {
        New-Item -Path "c:\" -Name "temp" -ItemType "directory"
        New-Item -Path "C:\temp" -Name "logtest.txt" -ItemType File 
    }
    $New_Name >> $Path
    Set-Clipboard -Value  $New_Name
    
    
    $Icon_Affichage = Rundll32.exe shell32.dll, Control_RunDLL desk.cpl, 0, 0
    
    $Nom_pour_changer_pc = sysdm.cpl 0, 3
    
    $propriete = SystemPropertiesComputerName
    
    $Restart_auto = reg add “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl” /v AutoReboot /t REG_DWORD /d 0 /f 
    $vidage_mem = wmic recoveros set DebugInfoType = 3
    
    $restart2
    $propriete
    $Icon_Affichage 
    $Nom_pour_changer_pc
    $Restart_auto
    $vidage_mem 
    $propriete)


