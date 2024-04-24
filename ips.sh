#!/bin/bash

# Directory where the files are located
source_directory="/path/to/your/source/directory"

# Directory where the results will be saved
destination_directory="/path/to/your/destination/directory"

# Function to display the menu and execute the command
display_menu() {
    clear
    echo "Select the file:"
    
    # Lists all files in the source directory and sorts them alphabetically
    files=($(ls "$source_directory" | sort))
    
    # Displays the numbered menu of files
    for ((i=0; i<${#files[@]}; i++)); do
        echo "$((i+1)): ${files[i]}"
    done
    
    # Prompts the user to select a file
    read -p "Enter the file number or 'q' to quit: " option
    
    # Checks if the input is valid and executes the command
    if [[ "$option" =~ ^[0-9]+$ && "$option" -ge 1 && "$option" -le ${#files[@]} ]]; then
        selected_file="${files[option-1]}"
        cat "$source_directory/$selected_file" | httpx -ip -silent | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' >> "$destination_directory/$selected_file.txt"
        echo "Command executed successfully!"
        read -n 1 -s -r -p "Press any key to continue..."
        display_menu
    elif [[ "$option" == "q" ]]; then
        echo "Exiting..."
        exit 0
    else
        echo "Invalid option. Please try again."
        read -n 1 -s -r -p "Press any key to continue..."
        display_menu
    fi
}

# Executes the function to display the menu
display_menu
