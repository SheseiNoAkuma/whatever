$DebugPreference = "Continue"

$basepath = '.'


Remove-Item ${basepath}'\target' -Recurse -Force -Confirm:$false -ErrorAction Ignore
New-item ${basepath}'\target' -itemtype directory


For ($i=0; $i -le 10000; $i++) {
    $original_file = '.\template.txt'
    $destination_file =  '.\target\template' + ${i} + '.txt'
    (Get-Content $original_file) | Foreach-Object {
        $_ -replace('{logicalname00}', "LN00$i")-replace('{logicalname01}', "LN01$i") `
            -replace('{logicalname02}', "LN02$i")-replace('{logicalname03}', "LN03$i") `
            -replace('{logicalname04}', "LN04$i")-replace('{logicalname05}', "LN05$i") `
            -replace('{logicalname06}', "LN06$i")-replace('{logicalname07}', "LN07$i") `
            -replace('{logicalname08}', "LN08$i")-replace('{logicalname09}', "LN09$i") `
            -replace('{logicalname10}', "LN10$i")
        } | Set-Content $destination_file
}

