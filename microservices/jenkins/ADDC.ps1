##########################################################
############# Windows AD DC Configuretion ################
#Variables
$date = Get-Date -UFormat "%Y%m%d"
$logs = C:\customization\$date-ADDC_install.


#########################################################
Start-Transcript 


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

$HashArguments = @{
    NoGlobalCatalog = $false
    CreateDnsDelegation = $false
    CriticalReplicationOnly = $false
    DatabasePath = "C;\Windows\NTDS"
    InstallDns = $true
    LogPath = "C;\Windows\NTDS"
    SysvolPath = "C;\Windows\SYSVOL"
    Credential = get_creds $env:USER $env:PASSWD
    DomainName = $env:DOMAIN
    Force =$true
}

install-windowsfuture -name AD-Domain_Services -IncludeManagemetTools
Import-Module ADDSDeployment
Install-ADDSDomainController @HashArguments

}
catch {
  Write-Error -Message $_
  exit 1;
}

Stop-Transcript
