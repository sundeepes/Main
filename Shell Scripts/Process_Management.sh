#!/bin/bash

# Process Management Script

while true; do
    clear
    echo "Process Management Script"
    echo "1. List Running Processes"
    echo "2. Kill Process by Name"
    echo "3. Kill Process by PID"
    echo "4. Check CPU and Memory Usage"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            ps aux
            ;;
        2)
            read -p "Enter process name to kill: " process_name
            pids=$(pgrep "$process_name")
            if [ -n "$pids" ]; then
                echo "Processes with name $process_name found:"
                echo "$pids"
                read -p "Do you want to kill these processes? (y/n): " confirm
                if [ "$confirm" == "y" ]; then
                    sudo kill $pids
                    echo "Processes killed."
                else
                    echo "Processes not killed."
                fi
            else
                echo "No processes with name $process_name found."
            fi
            ;;
        3)
            read -p "Enter PID to kill: " pid
            if [ -n "$pid" ]; then
                sudo kill "$pid"
                echo "Process with PID $pid killed."
            else
                echo "Invalid PID."
            fi
            ;;
        4)
            top
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
