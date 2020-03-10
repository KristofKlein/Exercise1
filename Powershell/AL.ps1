Write-Host '###### Update Nav Containerhelper! ######' -ForegroundColor Blue
& (Join-Path -Path $PSScriptRoot -ChildPath 'Install-NavContainerHelper.ps1')

Write-Host '###### Create Container ######' -ForegroundColor Blue
New-NavContainer -accept_eula `
                 -containerName 'ALGO' `
                 -imageName 'mcr.microsoft.com/businesscentral/onprem:15.2.39040.0-w1-ltsc2019' `
                 -updateHosts `
                 -locale 'da-DK' `
                 -isolation 'hyperv'

Write-Host 'Thats all Folks' -ForegroundColor Blue

