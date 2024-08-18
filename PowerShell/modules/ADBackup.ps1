##########################################################
############# Windows AD database backup ################
#Variables
$date = Get-Date -UFormat "%Y%m%d"
$logs = C:\ADBackup\log\ADBackup-$date.txt


#########################################################
Start-Transcript -Path $logs

function get_creds (){
    param(
       [parameter(Madatory=$true,Position=0 )] [String]$user,
       [parameter(Madatory=$true,Position=1 )] [String]$passwd
      )
  
      $pass = ConvertTo-SecureString $passwd -AsPlainText -Force
      $creds = New-Object System.Management.Automation.PSCredential($user,$pass)
      return $creds
  }
  
  
  
  try {
    [Net.ServicePointManager]::SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
    $RemoteConnection = Enter-PSSession -ComputerName  $env:FQDN -Credential (get_creds $env:USER $env:PASSWD)

  }catch{
    $RemoteConnection = $null
    Write-Error -Message "Can not connect to host "+$env:FQDN
  }

   Copy-Item -Path C:\Windows\NTDS\ntds.dit, C:\Windows\SYSVOL -Destination e:\backup\AD\$env:FQDN-$date -ToSession $RemoteConnection
   
   
    

