. "C:\Users\tgudl\Documents\PowerShell\Scripts\SetupX.ps1"
function Bat-X {
    $paths = $null
    $choice = $args[0]
    if (!(Setup-X ([ref]$choice) ([ref]$paths) `
        "CommonPaths\CommonBatPaths.txt")) {
        return
    }
    bat $paths[($choice - 1)]
}
