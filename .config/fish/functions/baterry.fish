function baterry
    set arquivo ~/dotfiles/.config/niri/config.kdl
    set linha 'include "./cfg/power_mode.kdl"'

    set arquivo_term ~/dotfiles/.config/foot/foot.ini
    set linha_term 'alpha=0.8'

    if grep -qxF -- $linha $arquivo
        grep -vxF -- $linha $arquivo > $arquivo.tmp
        mv $arquivo.tmp $arquivo
    else
        echo $linha >> $arquivo
    end

    if grep -qxF -- $linha_term $arquivo_term
        grep -vxF -- $linha_term $arquivo_term > $arquivo_term.tmp
        mv $arquivo_term.tmp $arquivo_term
    else
        echo $linha_term >> $arquivo_term
    end

end
