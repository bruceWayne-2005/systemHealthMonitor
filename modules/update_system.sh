update_system() {
    log "System update started"
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt upgrade -y
    elif [ -f /etc/redhat-release ]; then
        sudo yum update -y
    fi
    log "System update completed"
    whiptail --title "✅ Update Complete" --msgbox "System updated successfully." 10 50
}
