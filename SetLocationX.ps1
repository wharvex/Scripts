function Set-Location-X {
    [CmdletBinding(SupportsShouldProcess)]
    $pathspath = "$($env:userprofile)\CommonPaths\CommonDirPaths.txt"
    if (![System.IO.File]::Exists($pathspath)) {
        'USERPROFILE\CommonPaths\CommonDirPaths.txt not found'
        return
    }
    $paths = $(Get-Content $pathspath)
    if ($null -eq $args[0]) {
        $choice = 1
    }
    else {
        $choice = $args[0]
    }
    if ($choice -gt $paths.Length -or $choice -lt 1) {
        'invalid choice'
        return
    }
    Push-Location -Path $paths[($choice - 1)]
}
