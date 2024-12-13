function home { cd $HOME }
function dev { cd $HOME\dev }
function c { cd C:\ }

function g { git @args }
function gs { git status }             # git status
function ga { git add @args }          # git add <args>
function gcmt { git commit -m @args }  # git commit -m "<msg>"
function gpsh { git push @args }       # git push <args>
function gpll { git pull @args }       # git pull <args>

function Prompt {
    $time = Get-Date -Format "HH:mm:ss"
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $path = (Get-Location).Path

    # ANSI Colors
    $green = "`e[32m"
    $yellow = "`e[33m"
    $blue = "`e[34m"
    $red = "`e[31m"
    $reset = "`e[0m"

    $gitStatus = ""
    if (Test-Path .git) {
        $gitBranch = git rev-parse --abbrev-ref HEAD 2>$null
        if ($gitBranch) {
            $gitStatus = "$red[$gitBranch]$reset"
        }
    }

    # Final prompt
    "$green$time $yellow$user $blue$path $gitStatus$reset> "
}
