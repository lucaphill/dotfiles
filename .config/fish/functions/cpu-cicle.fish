function cpu-cycle
    set current (cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    switch $current
        case schedutil
            sudo cpupower frequency-set -g performance &>/dev/null
            notify-send -a "CPU" -i speedtest "Modo Performance" "Governor: performance"
        case performance
            sudo cpupower frequency-set -g powersave &>/dev/null
            notify-send -a "CPU" -i battery-level-20-symbolic "Modo Economia" "Governor: powersave"
        case '*'
            sudo cpupower frequency-set -g schedutil &>/dev/null
            notify-send -a "CPU" -i battery-good-symbolic "Modo Equilibrado" "Governor: schedutil"
    end
end
