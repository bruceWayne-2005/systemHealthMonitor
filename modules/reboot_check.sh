check_reboot() {
    if [ -f /var/run/reboot-required ]; then
        whiptail --title "⚠️ Reboot Required" --msgbox "A system reboot is required." 10 60
        log "Reboot required"
    else
        whiptail --title "✅ No Reboot Needed" --msgbox "No reboot is needed at this time." 10 50
        log "No reboot needed"
    fi
}
