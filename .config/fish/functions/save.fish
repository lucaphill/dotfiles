function save
    sudo cpupower frequency-set -g powersave >/dev/null
    and echo "CPU: powersave"
end
