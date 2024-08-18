##########################################################
#### Installation AWS PowerShell for Winodws OS ##########
#Variables
$date = Get-Date -UFormat "%Y%m%d"
$logs = C:\customization\ADDC_install-$date.txt


#########################################################
Start-Transcript -Path $logs
Set-Location $PSScriptRoot

Install-Module -Name AWSPowerShell -Confirm:$false
Install-AWSToolsModule AWS.Tools.EC2,AWS.Tools.S3,AWS.Tools.IdentityManagement -Scope AllUsers -Force
Get-AWSPowerShellVersion


