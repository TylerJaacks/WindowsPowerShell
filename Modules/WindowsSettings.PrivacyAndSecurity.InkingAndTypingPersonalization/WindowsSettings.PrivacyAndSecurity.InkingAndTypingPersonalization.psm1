<#
.SYNOPSIS
    Disables Custom Inking & Typing Personalization in Windows.
.DESCRIPTION
    This function modifies the Windows registry to disable the Custom Inking & Typing Personalization feature and related privacy settings.
.PARAMETER None
    This function does not take any parameters. It directly modifies the registry for the current user.
.EXAMPLE        
    Disable-CustomInkingTypingPersonalization
    This command will disable the Custom Inking & Typing Personalization feature by setting the appropriate registry keys.
.NOTES
    Requires administrative privileges. Changes may take effect after a restart or user logoff.
    https://www.elevenforum.com/t/enable-or-disable-custom-inking-and-typing-dictionary-in-windows-11.5564/
#>
function Disable-CustomInkingTypingPersonalization {
    $path1 = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization'
    if (-not (Test-Path $path1)) { New-Item -Path $path1 -Force | Out-Null }
    Set-ItemProperty -Path $path1 -Name 'Value' -Value 0 -Type DWord

    $path2 = 'HKCU:\Software\Microsoft\Personalization\Settings'
    if (-not (Test-Path $path2)) { New-Item -Path $path2 -Force | Out-Null }
    Set-ItemProperty -Path $path2 -Name 'AcceptedPrivacyPolicy' -Value 0 -Type DWord

    $path3 = 'HKCU:\Software\Microsoft\InputPersonalization'
    if (-not (Test-Path $path3)) { New-Item -Path $path3 -Force | Out-Null }
    Set-ItemProperty -Path $path3 -Name 'RestrictImplicitInkCollection' -Value 1 -Type DWord
    Set-ItemProperty -Path $path3 -Name 'RestrictImplicitTextCollection' -Value 1 -Type DWord

    $path4 = 'HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore'
    if (-not (Test-Path $path4)) { New-Item -Path $path4 -Force | Out-Null }
    Set-ItemProperty -Path $path4 -Name 'HarvestContacts' -Value 0 -Type DWord
}

Export-ModuleMember -Function Disable-CustomInkingTypingPersonalization