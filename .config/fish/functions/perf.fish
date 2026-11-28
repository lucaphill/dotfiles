function perf
    sudo cpupower frequency-set -g performance >/dev/null
    and echo "CPU: performance"
end
