#!/bin/bash

# File Management Script

while true; do
    clear
    echo "File Management Script"
    echo "1. Create File"
    echo "2. Copy File"
    echo "3. Move/Rename File"
    echo "4. Delete File"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter file name to create: " file_name
            touch "$file_name"
            echo "File $file_name created."
            ;;
        2)
            read -p "Enter source file name: " source_file
            read -p "Enter destination directory: " dest_dir
            cp "$source_file" "$dest_dir"
            echo "File $source_file copied to $dest_dir."
            ;;
        3)
            read -p "Enter source file name: " source_file
            read -p "Enter destination directory or new file name: " destination
            mv "$source_file" "$destination"
            echo "File $source_file moved/renamed to $destination."
            ;;
        4)
            read -p "Enter file name to delete: " file_name
            read -p "Are you sure you want to delete $file_name? (y/n): " confirm
            if [ "$confirm" == "y" ]; then
                rm "$file_name"
                echo "File $file_name deleted."
            else
                echo "File not deleted."
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
