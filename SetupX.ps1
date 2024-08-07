function Setup-X([ref]$choice, [ref]$paths, $pathspathext) {
    $pathspath = "$($env:userprofile)\$($pathspathext)"
    if (![System.IO.File]::Exists($pathspath)) {
        Write-Host "USERPROFILE\$($pathspathext) not found."
        return $false
    }

    $paths.Value = Get-Content $pathspath

    if ($null -eq $choice.Value) {
        $choice.Value = 1
    }
    Write-Host "choice.Value: $($choice.Value)"

    Write-Host "paths.Value.Length: $($paths.Value.Length)"

    if ($choice.Value -gt $paths.Value.Length -or $choice.Value -lt 1) {
        Write-Host "Invalid choice."
        return $false
    }
    return $true
}
