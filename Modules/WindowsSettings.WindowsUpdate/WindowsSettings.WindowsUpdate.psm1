<#
.SYNOPSIS
Enables "Get the latest updates as soon as they are available" toggle under Settings > Windows Update.

.DESCRIPTION
This function sets the registry key to enable the "Get the latest updates as soon as they are available" option in Windows Update settings.

.EXAMPLE
Set-ContinuousInnovationOptIn

.NOTES
Requires administrative privileges.
https://www.elevenforum.com/t/enable-or-disable-get-latest-updates-as-soon-as-available-in-windows-11.13821/
#>
function Set-ContinuousInnovationOptIn {
    [CmdletBinding(SupportsShouldProcess)]
    param ()

    $registryPath = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings'
    $propertyName = 'IsContinuousInnovationOptedIn'
    $propertyValue = 1

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
}

Export-ModuleMember -Function Set-ContinuousInnovationOptIn