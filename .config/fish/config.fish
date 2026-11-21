source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx EDITOR helix
set -gx VISUAL helix
set -gx ENTRY_COUNTRY BR

if status is-interactive; and not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) >/dev/null
end
zoxide init fish | source
alias cd z
