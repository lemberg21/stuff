##########################################################
############# Windows AD DC Configuretion ################

$logs = C:\customization
Start-Transcript

$HashArguments = @{
    Credential = (Get-Credential "CORP\Administrator")
    DomainName = "corp.contoso.com"
    InstallDns = $true
}
Install-ADDSDomainController @HashArguments
