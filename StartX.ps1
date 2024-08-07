function Start-X {
    [CmdletBinding(SupportsShouldProcess)]
    $pathspath = "$($env:userprofile)\CommonPaths\CommonStartPaths.txt"
    if (![System.IO.File]::Exists($pathspath)) {
        'USERPROFILE\CommonPaths\CommonStartPaths.txt not found'
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
    Start-Process $paths[$choice - 1]
}
