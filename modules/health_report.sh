view_system_health() {
    INFO=$(echo -e "🖥️ CPU Load: $(top -bn1 | grep 'load average' | awk '{print $10 $11 $12}')\n\n"         "💾 Memory: $(free -h | awk '/Mem:/ {print $3 " used / " $2}')\n\n"         "🗃️ Disk: $(df -h / | awk 'NR==2 {print $3 " used / " $2}')\n\n"         "⏱️ Uptime: $(uptime -p)")
    log "System Health Viewed"
    whiptail --title "📊 System Health" --msgbox "$INFO" 20 70
}

generate_report() {
    TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
    REPORT_FILE="./logs/report_$TIMESTAMP.txt"
    {
        echo "📄 System Health Report - $TIMESTAMP"
        echo "---------------------------------------"
        top -bn1 | grep "load average"
        free -h
        df -h
        who
        uptime
    } > "$REPORT_FILE"
    log "Report Generated at $REPORT_FILE"
    whiptail --title "📝 Report Generated" --msgbox "Report saved to $REPORT_FILE" 10 60
}
