##########################################################
############# Windows AD DC Configuretion ################
#Variables
$logs = C:\customization


#########################################################
Start-Transcript


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
