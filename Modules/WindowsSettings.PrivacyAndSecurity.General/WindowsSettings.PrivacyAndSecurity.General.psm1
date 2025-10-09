<#
.SYNOPSIS
Disables personalized ads by turning off the advertising ID.

.DESCRIPTION
This function modifies the registry to disable personalized ads by turning off the advertising ID for the user.

.EXAMPLE
Disable-LetAppsShowMePersonalizedAdsByUsingMyAdvertisingID

.NOTES
Requires administrative privileges. Changes will take effect after a restart or user logoff.
https://www.elevenforum.com/t/enable-or-disable-advertising-id-for-personalized-ads-in-apps-in-windows-11.3730/
#>
function Disable-LetAppsShowMePersonalizedAdsByUsingMyAdvertisingID {
    $registryPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo'
    $propertyName = 'Enabled'
    $propertyValue = 0

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
}

Export-ModuleMember -Function Disable-LetAppsShowMePersonalizedAdsByUsingMyAdvertisingID

<#
.SYNOPSIS
Disables location-based content by preventing websites from accessing the user's language list.

.DESCRIPTION
This function modifies the registry to disable location-based content by preventing websites from accessing the user's language list.

.EXAMPLE
Disable location-based content:
Disable-LetWebsitesShowMeLocallyRelevantContentByUsingByAccessingMyLanguageList

.NOTES
Requires administrative privileges. Changes will take effect after a restart or user logoff.
https://www.elevenforum.com/t/enable-or-disable-website-access-to-language-list-in-windows-11.3733/
#>
function Disable-LetWebsitesShowMeLocallyRelevantContentByUsingByAccessingMyLanguageList {
    $registryPath = 'HKCU:\Control Panel\International\User Profile'
    $propertyName = 'HttpAcceptLanguageOptOut'
    $propertyValue = 1

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
}

Export-ModuleMember -Function Disable-LetWebsitesShowMeLocallyRelevantContentByUsingByAccessingMyLanguageList

<#
.SYNOPSIS
Disables Windows from improving Start and search results by tracking app launches.

.DESCRIPTION
This function modifies the registry to prevent Windows from tracking app launches for the purpose of improving Start and search results.

.EXAMPLE
Disable-LetWindowsImproveStartAndSearchResultsByTrackingAppLaunches

.NOTES
Requires administrative privileges. Changes will take effect after a restart or user logoff.
https://www.elevenforum.com/t/enable-or-disable-app-launch-tracking-in-windows-11.3727/
#>
function Disable-LetWindowsImproveStartAndSearchResultsByTrackingAppLaunches {
    $registryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
    $propertyName = 'Start_TrackProgs'
    $propertyValue = 0

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
}

Export-ModuleMember -Function Disable-LetWindowsImproveStartAndSearchResultsByTrackingAppLaunches

<#
.SYNOPSIS
Disables suggested content in the Settings app.

.DESCRIPTION
This function modifies the registry to prevent Windows from showing suggested content in the Settings app.

.EXAMPLE
Disable-ShowMeSuggestedContentInTheSettingsApp

.NOTES
Requires administrative privileges. Changes will take effect after a restart or user logoff.
https://www.elevenforum.com/t/enable-or-disable-suggested-content-in-settings-in-windows-11.3791/
#>
function Disable-ShowMeSuggestedContentInTheSettingsApp {
    $registryPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
    $properties = @{
        'SubscribedContent-338393Enabled' = 0
        'SubscribedContent-353694Enabled' = 0
        'SubscribedContent-353696Enabled' = 0
    }

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    foreach ($name in $properties.Keys) {
        Set-ItemProperty -Path $registryPath -Name $name -Value $properties[$name] -Type DWord
    }
}

Export-ModuleMember -Function Disable-ShowMeSuggestedContentInTheSettingsApp

<#
.SYNOPSIS
Disables notifications in the Settings app.

.DESCRIPTION
This function modifies the registry to prevent Windows from showing notifications in the Settings app.

.EXAMPLE
Disable-ShowMeNotificationsInTheSettingsApp

.NOTES
Requires administrative privileges. Changes will take effect after a restart or user logoff.
https://www.elevenforum.com/t/enable-or-disable-show-notifications-in-settings-app-in-windows-11.25835/
#>
function Disable-ShowMeNotificationsInTheSettingsApp {
    $registryPaths = @(
        'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager',
        'HKCU:\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications'
    )

    $properties = @{
        'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'              = @{
            'SubscribedContent-310093Enabled' = 0
        }
        'HKCU:\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications' = @{
            'EnableAccountNotifications' = 0
        }
    }

    foreach ($registryPath in $registryPaths) {
        if (-not (Test-Path $registryPath)) {
            New-Item -Path $registryPath -Force | Out-Null
        }
        foreach ($name in $properties[$registryPath].Keys) {
            Set-ItemProperty -Path $registryPath -Name $name -Value $properties[$registryPath][$name] -Type DWord
        }
    }
}

Export-ModuleMember -Function Disable-ShowMeNotificationsInTheSettingsApp