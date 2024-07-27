function Get-List-Sort-Write {
    Get-ChildItem | Sort-Object LastWriteTime
}

function CD-Alias {
	Param($PATH_ARG)
	Push-Location -Path $PATH_ARG
}
