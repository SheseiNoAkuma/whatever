#aggiungere un path custom ai moduli di powershell
#$CurrentValue = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
#[Environment]::SetEnvironmentVariable("PSModulePath", $CurrentValue + ";D:\github\whatever\bin\modules", "Machine")
#$env:PSModulePath

$basePath='D:\github\whatever'
$psd2Path='D:\git\psd2'

Function Get-Wiremock {
    $system = New-Object -TypeName PSObject
    Add-Member -InputObject $system -MemberType NoteProperty -Name source -Value "${psd2Path}/psd2-tpp-simulator/src/main/resources/wiremock/mappings"
    Add-Member -InputObject $system -MemberType NoteProperty -Name path -Value "${basePath}/wiremock"
    Add-Member -InputObject $system -MemberType NoteProperty -Name target -Value "${basePath}/wiremock/mappings"
    return $system
}

Function Get-OraclePsd2 {
    $system = New-Object -TypeName PSObject
    Add-Member -InputObject $system -MemberType NoteProperty -Name pom -Value "${psd2path}\psd2-tpp-config\pom.xml"
    Add-Member -InputObject $system -MemberType NoteProperty -Name source -Value "${psd2path}\psd2-tpp-config\target\*.zip"
    Add-Member -InputObject $system -MemberType NoteProperty -Name path -Value "${basePath}/oraclePsd2"
    Add-Member -InputObject $system -MemberType NoteProperty -Name target -Value "${basePath}/oraclePsd2/target"
    Add-Member -InputObject $system -MemberType NoteProperty -Name container -Value "psd2"
    return $system
}


Export-ModuleMember -Function Get-Wiremock
Export-ModuleMember -Function Get-OraclePsd2