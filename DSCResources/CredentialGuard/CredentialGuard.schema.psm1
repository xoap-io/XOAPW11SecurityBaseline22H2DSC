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
Resource Name  : CredentialGuard.schema.psm1
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

Configuration CredentialGuard
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DSCResource -ModuleName 'GPRegistryPolicyDsc' -ModuleVersion '1.2.0'
    Import-DSCResource -ModuleName 'AuditPolicyDSC' -ModuleVersion '1.4.0.0'
    Import-DSCResource -ModuleName 'SecurityPolicyDSC' -ModuleVersion '2.10.0.0'

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\EnableVirtualizationBasedSecurity'
    {
         ValueName = 'EnableVirtualizationBasedSecurity'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\RequirePlatformSecurityFeatures'
    {
         ValueName = 'RequirePlatformSecurityFeatures'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\HypervisorEnforcedCodeIntegrity'
    {
         ValueName = 'HypervisorEnforcedCodeIntegrity'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\HVCIMATRequired'
    {
         ValueName = 'HVCIMATRequired'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\LsaCfgFlags'
    {
         ValueName = 'LsaCfgFlags'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\ConfigureSystemGuardLaunch'
    {
         ValueName = 'ConfigureSystemGuardLaunch'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RegistryPolicyFile 'Registry(POL): HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\ConfigureKernelShadowStacksLaunch'
    {
         ValueName = 'ConfigureKernelShadowStacksLaunch'
         ValueData = 1
         ValueType = 'Dword'
         TargetType = 'ComputerConfiguration'
         Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
    }

    RefreshRegistryPolicy 'ActivateClientSideExtension'
    {
        IsSingleInstance = 'Yes'
    }
}
