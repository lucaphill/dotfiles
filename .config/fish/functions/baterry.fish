function baterry
    set arquivo ~/dotfiles/.config/niri/config.kdl
    set linha 'include "./cfg/power_mode.kdl"'

    if grep -qxF -- $linha $arquivo
        grep -vxF -- $linha $arquivo > $arquivo.tmp
        mv $arquivo.tmp $arquivo
    else
        echo $linha >> $arquivo
    end
end
