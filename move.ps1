

$strLFpath = "\\TRUENAS\partage atelier\atelier\montage\Fond BGM Full HD.bmp"
$StrRLPath = "C:\BGM\Nouveau dossier"  
Copy-Item -Path $strLFpath -Destination $StrRLPath -Force  
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value 'C:\BGM\Fond BGM Full HD.bmp'
rundll32.exe user32.dll, UpdatePerUserSystemParameters