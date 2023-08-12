#!/bin/bash

# Directory Management Script

while true; do
    clear
    echo "Directory Management Script"
    echo "1. Create Directory"
    echo "2. List Contents of Directory"
    echo "3. Rename Directory"
    echo "4. Delete Directory"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter directory name to create: " dir_name
            mkdir "$dir_name"
            echo "Directory $dir_name created."
            ;;
        2)
            read -p "Enter directory path to list contents: " dir_path
            ls -l "$dir_path"
            ;;
        3)
            read -p "Enter current directory name: " old_name
            read -p "Enter new directory name: " new_name
            mv "$old_name" "$new_name"
            echo "Directory $old_name renamed to $new_name."
            ;;
        4)
            read -p "Enter directory name to delete: " dir_name
            read -p "Are you sure you want to delete $dir_name? (y/n): " confirm
            if [ "$confirm" == "y" ]; then
                rm -r "$dir_name"
                echo "Directory $dir_name deleted."
            else
                echo "Directory not deleted."
            fi
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
