##########################################################
############# Windows AD database backup ################
#Variables
$date = Get-Date -UFormat "%Y%m%d"
$logs = C:\ADBackup\log\ADBackup-$date.txt


#########################################################
Start-Transcript -Path $logs  
  
  function ADBackup {
    param (
      [parameter(Madatory=$true,Position=0 )] [String]$user,
      [parameter(Madatory=$true,Position=1 )] [String]$passwd,
      [parameter(Madatory=$true,Position=2 )] [String]$FQDN
    )
    $pass = ConvertTo-SecureString $passwd -AsPlainText -Force
    $creds = New-Object System.Management.Automation.PSCredential($user,$pass)
    
    try {
      [Net.ServicePointManager]::SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
      $RemoteConnection = Enter-PSSession -ComputerName  $FQDN -Credential $creds
  
    }catch{
      $RemoteConnection = $null
      Write-Error -Message "Can not connect to host "+$FQDN
    }
  
     Copy-Item -Path C:\Windows\NTDS\ntds.dit -Destination E:\backup\AD\$FQDN-$date\ -ToSession $RemoteConnection
     Copy-Item -Path C:\Windows\SYSVOL\ -Destination E:\backup\AD\$FQDN-$date\ -ToSession $RemoteConnection
     
     if ((Test-Path -Path 'E:\backup\AD\$FQDN-$date\ntds.dit') -and (Test-Path -Path 'E:\backup\AD\$FQDN-$date\SYSVOL\')  ) {
      Write-Host Backup finished sucessfully 
     }


     Exit-PSSession
     exit 0
  }
  
  Set-Alias adb ADBackup
  Export-ModuleMember -Function ADBackup -Alias adb
    

