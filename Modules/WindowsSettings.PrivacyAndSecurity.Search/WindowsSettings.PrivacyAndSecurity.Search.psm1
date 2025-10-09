function Disable-StoreMySearchHistoryOnThisDeviceToImproveSearchResults {
    <#
    .SYNOPSIS
        Disables the option to store search history on the device to improve search results in Windows.
    .DESCRIPTION
        This function modifies the Windows registry to disable the feature that stores search history on the device, which is used to enhance search results.
    .PARAMETER None
        This function does not take any parameters. It directly modifies the registry for the current user.
    .EXAMPLE        
        Disable-StoreMySearchHistoryOnThisDeviceToImproveSearchResults
        This command will disable the option to store search history on the device by setting the appropriate registry key.
    .NOTES
        Requires administrative privileges. Changes will take effect after a restart or user logoff.
        https://www.elevenforum.com/t/enable-or-disable-recent-search-history-in-windows-11.5395/
    #>
    $registryPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings'
    $propertyName = 'IsDeviceSearchHistoryEnabled'
    $propertyValue = 0

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
}

Export-ModuleMember -Function Disable-StoreMySearchHistoryOnThisDeviceToImproveSearchResults

<#
.SYNOPSIS
    Enables the "Find My Files" enhanced search feature in Windows.
.DESCRIPTION
    This function modifies the Windows registry to enable the "Find My Files" feature, which enhances file search capabilities.
.PARAMETER None
    This function does not take any parameters. It directly modifies the registry for the local machine.
.EXAMPLE
    Enable-FindMyFilesEnhancedSearch
    This command will enable the "Find My Files" feature by setting the appropriate registry key.
.NOTES
    Requires administrative privileges. Changes will take effect after a restart or user logoff.
    https://www.tenforums.com/tutorials/120447-turn-off-enhanced-mode-search-indexer-windows-10-a.html
#>
function Enable-FindMyFilesEnhancedSearch {

    $registryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Search'
    $propertyName = 'EnableFindMyFiles'
    $propertyValue = 1

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
}

Export-ModuleMember -Function Enable-FindMyFilesEnhancedSearch