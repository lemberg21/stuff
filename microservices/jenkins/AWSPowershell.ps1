#Install-Module AWS.Tools.Installer
#Install-AWSToolsModule S3, SSO, SSOOIDC

Import-Module AWS.Tools.SSO
Import-Module AWS.Tools.SSOOIDC
aws sso login
Get-S3Bucket
