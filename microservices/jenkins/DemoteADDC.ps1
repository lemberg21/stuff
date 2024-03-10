#################################################################
######
######  Demote AD DC
######
#################################################################

Import-Module ADDCDeployment
Uninstall-ADDSDomainController '
-DemoteOperationMaterRole: $true
-RemoveDnsDelegation: $true
-Force: $true
