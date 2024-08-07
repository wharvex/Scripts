function Open-X-In-Vim {
    $pathspath = "$($env:userprofile)\CommonPaths\CommonVimPaths.txt"
    if (![System.IO.File]::Exists($pathspath)) {
        'USERPROFILE\CommonPaths\CommonVimPaths.txt not found'
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
    vim $paths[$choice - 1]
}
