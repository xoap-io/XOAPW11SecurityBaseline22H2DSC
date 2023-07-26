configuration 'Test_0.0.1'
{
    Import-DSCResource -ModuleName 'XOAPW11SecurityBaseline22H2DSC' -Name 'Bitlocker' -ModuleVersion '0.0.1'
    Import-DSCResource -ModuleName 'XOAPW11SecurityBaseline22H2DSC' -Name 'Computer' -ModuleVersion '0.0.1'
    Import-DSCResource -ModuleName 'XOAPW11SecurityBaseline22H2DSC' -Name 'CredentialGuard' -ModuleVersion '0.0.1'
    Import-DSCResource -ModuleName 'XOAPW11SecurityBaseline22H2DSC' -Name 'DefenderAntivirus' -ModuleVersion '0.0.1'
    Import-DSCResource -ModuleName 'XOAPW11SecurityBaseline22H2DSC' -Name 'DomainSecurity' -ModuleVersion '0.0.1'
    Import-DSCResource -ModuleName 'XOAPW11SecurityBaseline22H2DSC' -Name 'IE11Computer' -ModuleVersion '0.0.1'

    Node 'Test_0.0.1'
    {
        }
        Bitlocker 'Bitlocker'
        {
        }
        Computer 'Computer'
        {
        }
        CredentialGuard 'CredentialGuard'
        {
        }
        DefenderAntivirus 'DefenderAntivirus'
        {
        }
        DomainSecurity 'DomainSecurity'
        {
        }
        IE11Computer 'IE11Computer'
        {
    }
}