function Bat-X {
    $pathspath = "$($env:userprofile)\CommonPaths\CommonBatPaths.txt"
    if (![System.IO.File]::Exists($pathspath)) {
        'USERPROFILE\CommonPaths\CommonBatPaths.txt not found'
        return
    }
    $paths = $(Get-Content $pathspath)
    $choice = $args[0] ?? 1
    if ($choice -gt $paths.Length -or $choice -lt 1) {
        'invalid choice'
        return
    }
    bat $paths[($choice - 1)]
}
