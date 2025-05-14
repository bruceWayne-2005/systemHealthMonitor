#!/bin/bash

# Load modules
source ./modules/auth.sh
source ./modules/health_report.sh
source ./modules/update_system.sh
source ./modules/logger.sh
source ./modules/reboot_check.sh

LOG_FILE="./logs/monitor.log"

# Authentication
authenticate_user || exit 1

# Menu Loop
while true; do
    CHOICE=$(whiptail --title "🔧 Linux System Health Monitor" --menu "Select an option:" 20 60 10 \
    "1" "📊 View System Health" \
    "2" "📝 Generate Detailed Report" \
    "3" "⬆️  Check for Updates" \
    "4" "🔁 Check Reboot Requirement" \
    "5" "❌ Exit" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1) view_system_health ;;
        2) generate_report ;;
        3) update_system ;;
        4) check_reboot ;;
        5) break ;;
        *) whiptail --msgbox "❗ Invalid choice." 10 40 ;;
    esac
done
