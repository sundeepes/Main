#!/bin/bash

# General Administration Script

while true; do
    clear
    echo "General Administration Script"
    echo "1. System Information"
    echo "2. User Management"
    echo "3. Package Management"
    echo "4. Disk Usage"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Hostname: $(hostname)"
            echo "Kernel Version: $(uname -r)"
            echo "Memory Usage: $(free -h | awk '/Mem/ {print $3"/"$2}')"
            echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3"/"$2}')"
            echo "Uptime: $(uptime)"
            ;;
        2)
            ./user_management_script.sh # Replace with the user management script's name and path
            ;;
        3)
            sudo apt update
            sudo apt upgrade -y
            echo "Package update and upgrade completed."
            ;;
        4)
            df -h
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    read -p "Press Enter to continue..."
done
