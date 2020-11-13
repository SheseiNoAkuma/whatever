<#
    .SYNOPSIS
        Encrypt your new maven possword and updated you default settings.xml
    .DESCRIPTION
        Given your new password this script encrypts this password then updates your default maven setting placed in $env:USERPROFILE/.m2 and 
        update all references to your old password with the new value.

#>
Param(
    [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName,HelpMessage='the password to encrypt')][securestring]$password
) 

$encrypted = [string](mvn --encrypt-password ([System.Net.NetworkCredential]::new("", $password).Password))
Write-Host "encripted password value = $encrypted"

$settings="$env:USERPROFILE\.m2\settings.xml";

Write-Host "Updateing settings file at $settings" -ForegroundColor Yellow

$xml = [xml](Get-Content $settings)

Write-Host "old password was " $xml.settings.servers.server.password[0] -ForegroundColor Magenta 
foreach ($element in $xml.settings.servers.server) {
    $element.password = $encrypted
}
Write-Host "new password is " $xml.settings.servers.server.password[0] -ForegroundColor Green

$xml.Save($settings)
Write-Host "your $settings file is updated" -ForegroundColor Green
