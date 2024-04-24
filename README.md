# File Processor Script

This bash script provides an interactive menu for selecting files from a specified directory and executing a command on the selected file. The results of the command are then saved in another specified directory.

## Usage

1. Ensure you have the necessary permissions to execute the script (`chmod +x file_processor.sh`).
2. Customize the script by specifying the source directory where your files are located and the destination directory where you want to save the results.
3. Run the script (`./file_processor.sh`) and follow the on-screen instructions.

## Features

- Interactive menu for file selection.
- Executes a specified command on the selected file.
- Saves the results of the command in a separate file.

## Dependencies

- This script relies on standard bash commands and does not require any additional dependencies.

## Example

Suppose you have a directory `/path/to/files` containing text files. You want to extract IP addresses from each file using the `httpx` command and save the results in `/path/to/results`.

1. Customize the script by setting `source_directory="/path/to/files"` and `destination_directory="/path/to/results"`.
2. Run the script (`./file_processor.sh`).
3. Select the file you want to process from the menu.
4. The script will execute the command `cat "$selected_file" | httpx -ip -silent | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'` on the selected file and save the results in `"$destination_directory/$selected_file.txt"`.

## License

This script is licensed under the [MIT License](https://opensource.org/license/mit).
