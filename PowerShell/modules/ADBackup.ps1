##########################################################
############# Windows AD DC backup ################
#Variables
$date = Get-Date -UFormat "%Y%m%d"
$logs = C:\ADBackup\log\ADBackup-$date.txt


#########################################################
Start-Transcript -Path $logs
Set-Location $PSScriptRoot