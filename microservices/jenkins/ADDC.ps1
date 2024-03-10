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
    Credential = get_creds $env:USER $env:PASSWD
    DomainName = $env:DOMAIN
    InstallDns = $true
}
Install-ADDSDomainController @HashArguments

}
catch {
  Write-Error -Message $_
  exit 1;
}


Stop-Transcript
