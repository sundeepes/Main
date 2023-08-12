#!/bin/bash

# User management script

while true; do
    clear
    echo "User Management Script"
    echo "1. Create User"
    echo "2. Modify User"
    echo "3. Delete User"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter username: " username
            read -p "Enter user's full name: " full_name
            read -p "Enter initial password: " password

            sudo useradd -m -c "$full_name" -s /bin/bash "$username"
            echo "$username:$password" | sudo chpasswd

            echo "User $username created."
            ;;
        2)
            read -p "Enter username to modify: " username
            read -p "Enter new full name: " new_full_name

            sudo usermod -c "$new_full_name" "$username"

            echo "User $username modified."
            ;;
        3)
            read -p "Enter username to delete: " username

            sudo userdel -r "$username"

            echo "User $username deleted."
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
