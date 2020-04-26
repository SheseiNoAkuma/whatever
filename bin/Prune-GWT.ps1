$DebugPreference = "Continue"

Write-Debug  "Cleaning GWT temporary files in ${env:Temp}"

Remove-Item ${env:Temp}"\ImageResourceGenerator*" -Recurse -Force -Confirm:$false -ErrorAction Ignore
Remove-Item ${env:Temp}"\uiBinder*" -Recurse -Force -Confirm:$false -ErrorAction Ignore
Remove-Item ${env:Temp}"\gwt*" -Recurse -Force -Confirm:$false -ErrorAction Ignore
Remove-Item ${env:Temp}"\*x" -Recurse -Force -Confirm:$false -ErrorAction Ignore

Write-Debug  "Done"