authenticate_user() {
    PASSWORD=$(whiptail --passwordbox "🔒 Enter admin password:" 10 60 3>&1 1>&2 2>&3)
    if [[ "$PASSWORD" == "admin123" ]]; then
        echo "Authenticated" >> "$LOG_FILE"
        return 0
    else
        whiptail --msgbox "❌ Authentication failed!" 10 40
        return 1
    fi
}
