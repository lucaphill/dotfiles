function memof --description 'Soma a memoria (PSS) dos processos que casam com o nome'
    if test (count $argv) -eq 0
        echo "Uso: memof <nome>"
        return 1
    end

    set -l pids (pgrep -if -- $argv[1])
    if test -z "$pids"
        echo "Nenhum processo encontrado"
        return 1
    end

    set -l total 0
    for pid in $pids
        set -l f /proc/$pid/smaps_rollup
        test -r $f; or continue
        set -l kb (awk '/^Pss:/ {print $2}' $f)
        test -n "$kb"; or continue
        set total (math $total + $kb)
    end

    printf "%.2f MB\n" (math $total / 1024)
end
