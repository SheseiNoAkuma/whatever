#aggiungere un path custom ai moduli di powershell
#$CurrentValue = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
#[Environment]::SetEnvironmentVariable("PSModulePath", $CurrentValue + ";D:\github\whatever\bin\modules", "Machine")
#$env:PSModulePath

#to import the module
#Import-Module GlobalConfig -Force

Function Remove-DockerContainer {
    # Parameter help description
    Param(
        #container name
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage='the name of the container to remove')][string]$name
        )
    $containersIds = (docker ps --all --quiet -f "name=$name"); 
    if ($containersIds.Count -gt 0)
    {
        Write-Host ("remove container: $name")
        docker rm -f $containersIds
    } else {
        Write-Host ("container <$name> does not exists")
    }
}

Function Enter-DockerContainer {
    # Parameter help description
    Param(
        #container name
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage='the name of the container to attach')][string]$name
        )

    docker exec -it $name sh
}

Function Reset-Docker {
    docker system prune
}

Export-ModuleMember -Function Remove-DockerContainer
Export-ModuleMember -Function Enter-DockerContainer
Export-ModuleMember -Function Reset-Docker
