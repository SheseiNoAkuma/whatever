Param(
    #container name
    [Parameter(ValueFromPipelineByPropertyName, HelpMessage='also rebuild resources, $true / $false')][bool]$full=$false
    ) 

$initialpath=Get-Location

$config=Get-Wiremock | Select-Object

Set-Location $config.path

if ($full){
    Write-Host  "copy stubs from $($config.source)" -ForegroundColor Yellow
    Remove-Item $config.target -Recurse -Force -Confirm:$false -ErrorAction Ignore
    Copy-Item $config.source $config.target -Recurse
}

docker build --tag wiremock:custom .

Remove-DockerContainer -name $config.container
docker run -p 9999:9999 -d --name $config.container wiremock:custom

Write-Host  "container $($config.container) is ready to go on port 9999" -ForegroundColor Green

Set-Location $initialpath