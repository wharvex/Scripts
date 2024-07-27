function nip {
    Param ([Parameter(Position = 0, Mandatory = $false)] [String]$nw_flag)

    # $summer_semester_start = Get-Date -Year 2024 -Month 5 -Day 20

    $file_name_base = Get-Date -Format "MM-dd-yy"

    $file_name_suffix = 'a'

    $file_name_ext = 'txt'

    $file_name = "$($file_name_base)_$($file_name_suffix).$($file_name_ext)"

    $fnl = $file_name.Length

    $base_matches = [System.Collections.ArrayList]@()

    $sb = {
        param($fn, $nwf)
        if ($nwf -eq 's') {
            vim $fn
        }
        else {
            Start-Process powershell.exe -ArgumentList "-NoExit -Command vim $($fn); exit"
        }
    }

    $contains_collision = $false

    $notes_dir_contents = Get-ChildItem

    foreach ($ci in $notes_dir_contents) {
        if ($ci.Name -eq $file_name) {
            $contains_collision = $true
            break
        }
    }

    # $days_since_semester_start = ((Get-Date) - $summer_semester_start).Days
    # $weeks_since_semester_start = [math]::floor($days_since_semester_start / 7)
    # $file_name = "wk$($weeks_since_semester_start)_$($file_name)"

    if (-not $contains_collision) {
        & $sb $file_name $nw_flag
    }
    else {
        foreach ($ci in $notes_dir_contents) {
            $n = $ci.Name
            if (($n.Length -eq $fnl) `
                    -and ($n.Substring(0, 8) -eq $file_name_base) `
                    -and ($n.Substring(11) -eq $file_name_ext)) {
                $arrayID = $base_matches.Add($([byte][char]$n[-5]))
            }
        }
        $max_fns = $base_matches[$base_matches.Count - 1]
        if ($max_fns -gt 121) {
            "too many notes today"
            return
        }
        $file_name_suffix = [char]($max_fns + 1)
        $file_name = "$($file_name_base)_$($file_name_suffix).$($file_name_ext)"
        & $sb $file_name $nw_flag
    }
}


