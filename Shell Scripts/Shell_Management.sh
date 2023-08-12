#!/bin/bash

# Shell Management Script

while true; do
    clear
    echo "Shell Management Script"
    echo "1. Switch to Bash"
    echo "2. Switch to Zsh"
    echo "3. Update Shell Configuration"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            chsh -s /bin/bash "$USER"
            echo "Shell changed to Bash."
            ;;
        2)
            chsh -s /bin/zsh "$USER"
            echo "Shell changed to Zsh."
            ;;
        3)
            read -p "Enter shell configuration file path (e.g., ~/.bashrc or ~/.zshrc): " config_file
            $EDITOR "$config_file"
            echo "Configuration file $config_file updated."
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    read -p "Press Enter to continue..."
done
