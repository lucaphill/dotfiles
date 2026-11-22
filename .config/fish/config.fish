source /usr/share/cachyos-fish-config/cachyos-config.fish
set -g shell_start (date +%s)
function clear_on_small --on-signal WINCH
    if test (math (date +%s) - $shell_start) -le 3
        if test (tput lines) -le 25
            clear
            commandline -f repaint
        end
    end
end

function clear_first_prompt --on-event fish_prompt
    functions -e clear_first_prompt
    if test (tput lines) -le 25
        clear
    end
end

set -gx EDITOR helix
set -gx VISUAL helix
set -gx ENTRY_COUNTRY BR

if status is-interactive; and not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) >/dev/null
end
zoxide init fish | source
alias cd z
