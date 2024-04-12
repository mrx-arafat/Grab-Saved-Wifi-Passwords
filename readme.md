---
# Wi-Fi Password Retriever

This PowerShell script, `wifi.ps1`, retrieves the saved passwords for Wi-Fi networks stored on a Windows machine. It extracts the SSID (network name) and the corresponding password, displaying the results in a table format and saving them to a text file.

## Features

- Fetches all saved Wi-Fi profiles on the machine.
- Displays each network's SSID along with its password if available.
- Outputs the information in an easy-to-read table format.
- Saves the results to `wifi_pass.txt` in the script's running directory.

## Prerequisites

- Windows 7 or later
- PowerShell 5.0 or later

## Running the Script

1. **Download the Script:**

   - Download `wifi.ps1` from this repository.

2. **Set Execution Policy (if needed):**

   - Open PowerShell as an Administrator.
   - Run the following command to allow the execution of scripts:

     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```

3. **Execute the Script:**

   - Navigate to the directory containing the script.
   - Execute the script with:

     ```powershell
     powershell -ExecutionPolicy Bypass -File "path\to\wifi.ps1"
     ```

   Replace `path\to\wifi.ps1` with the actual path to the script.

## Output

The script will display the SSID and password for each Wi-Fi profile in a table format in the PowerShell console and also save this table to `wifi_pass.txt` in the current directory.
---
