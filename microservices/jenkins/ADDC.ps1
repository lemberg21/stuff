##########################################################
############# Windows AD DC Configuretion ################
#Variables
$Date = 
$logs = C:\customization\


#########################################################
Start-Transcript

$pass = ConvertTo

try {

$HashArguments = @{
    Credential = (Get-Credential "CORP\Administrator")
    DomainName = "corp.contoso.com"
    InstallDns = $true
}
Install-ADDSDomainController @HashArguments

}
catch {
  Write-Error -Message $_
  exit 1;
}
