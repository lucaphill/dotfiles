function rebootuefi --description 'Reinicia direto na BIOS/UEFI'
    systemctl reboot --firmware-setup
end
