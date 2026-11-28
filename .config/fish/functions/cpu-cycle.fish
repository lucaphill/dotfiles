function cpu-cycle
    set current (cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    switch $current
        case schedutil
            sudo cpupower frequency-set -g performance &>/dev/null
            notify-send -u normal "CPU: Performance" "Governor: performance"
            echo "CPU: performance"
        case performance
            sudo cpupower frequency-set -g powersave &>/dev/null
            notify-send -u low "CPU: Economia" "Governor: powersave"
            echo "CPU: powersave"
        case '*'
            sudo cpupower frequency-set -g schedutil &>/dev/null
            notify-send -u low "CPU: Equilibrado" "Governor: schedutil"
            echo "CPU: schedutil"
    end
end
