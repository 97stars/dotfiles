$a = (Get-Host).PrivateData
$a.ErrorBackgroundColor = "white"
$a.WarningBackgroundColor = "white"

function prompt {
    $status_string = “”
    # check to see if this is a directory containing a symbolic reference,
    # fails (gracefully) on non-git repos.
    $symbolicref = git symbolic-ref HEAD
    if($symbolicref -ne $NULL) {
       
        # if a symbolic reference exists, snag the last bit as our
        # branch name. eg “[master]“
        $status_string += “GIT [" + `
            $symbolicref.substring($symbolicref.LastIndexOf("/") +1) + "] “
    }
    else {
        # Not in a Git environment, must be PowerShell!
        $status_string = “PS “
    }
   
    # write out the status_string with the approprate color.
    # prompt is done!
    if ($status_string.StartsWith(“GIT”)) {
        Write-Host ($status_string) `
            -nonewline -foregroundcolor darkblue
        Write-Host("" + $(get-location) + ">") -nonewline
    }
    else {
        Write-Host ($status_string + $(get-location) + “>”) `
            -nonewline
    }
    return ” “
 }