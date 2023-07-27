<#
.SYNOPSIS
tbd

.DESCRIPTION
tbd

.COMPONENT
Information about PowerShell Modules to be required.
Powershell Module: PSDesiredStateConfiguration
Powershell Module: AuditPolicyDSC
Powershell Module: SecurityPolicyDSC
Powershell Module: GPRegistryPolicyDsc

.EXAMPLE
Get-DscResource -Module XOAPW11SecurityBaseline22H2DSC

.NOTES
For more information about advanced functions, call Get-Help with any
of the topics in the links listed below.
Module Name    : XOAPW11SecurityBaseline22H2DSC
Resource Name  : DomainSecurity.schema.psm1
Author         : info@XOAP.io

.LINK
https://www.microsoft.com/en-us/download/details.aspx?id=55319

.LINK
https://www.powershellgallery.com/packages/BaselineManagement/2.9.0

.LINK
https://gallery.technet.microsoft.com/scriptcenter/PowerShellAccessControl-d3be7b83

.LINK
https://www.powershellgallery.com/packages/WindowsDefender/1.0.0.4
#>

Configuration Windows_11_v22H2_Security_Baseline_Domain_Security
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DSCResource -ModuleName 'GPRegistryPolicyDsc' -ModuleVersion '1.2.0'
    Import-DSCResource -ModuleName 'AuditPolicyDSC' -ModuleVersion '1.4.0.0'
    Import-DSCResource -ModuleName 'SecurityPolicyDSC' -ModuleVersion '2.10.0.0'

	Node Windows_11_v22H2_Security_Baseline_Domain_Security
	{
         AccountPolicy 'SecuritySetting(INF): ResetLockoutCount'
         {
              Reset_account_lockout_counter_after = 10
              Name = 'Reset_account_lockout_counter_after'
         }

         AccountPolicy 'SecuritySetting(INF): LockoutBadCount'
         {
              Name = 'Account_lockout_threshold'
              Account_lockout_threshold = 10
         }

         AccountPolicy 'SecuritySetting(INF): PasswordComplexity'
         {
              Name = 'Password_must_meet_complexity_requirements'
              Password_must_meet_complexity_requirements = 'Enabled'
         }

         AccountPolicy 'SecuritySetting(INF): LockoutDuration'
         {
              Name = 'Account_lockout_duration'
              Account_lockout_duration = 10
         }

         AccountPolicy 'SecuritySetting(INF): PasswordHistorySize'
         {
              Name = 'Enforce_password_history'
              Enforce_password_history = 24
         }

         AccountPolicy 'SecuritySetting(INF): ClearTextPassword'
         {
              Name = 'Store_passwords_using_reversible_encryption'
              Store_passwords_using_reversible_encryption = 'Disabled'
         }

         AccountPolicy 'SecuritySetting(INF): MinimumPasswordLength'
         {
              Name = 'Minimum_Password_Length'
              Minimum_Password_Length = 14
         }

         RefreshRegistryPolicy 'ActivateClientSideExtension'
         {
             IsSingleInstance = 'Yes'
         }
     }
}


