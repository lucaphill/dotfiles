function bal
    sudo cpupower frequency-set -g schedutil >/dev/null
    and echo "CPU: schedutil"
end
