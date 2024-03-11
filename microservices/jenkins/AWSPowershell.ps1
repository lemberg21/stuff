#Install-Module AWS.Tools.Installer
#Install-AWSToolsModule S3, SSO, SSOOIDC

Import-Module AWS.Tools.SSO
Import-Module AWS.Tools.SSOOIDC
aws sso login


New-EC2Instance -ImageId ami-c49c0dac `
    -MinCount 1 `
    -MaxCount 1 `
    -KeyName PSKeyPair `
    -SecurityGroups PSSecurityGroup `
    -InstanceType t2.micro
