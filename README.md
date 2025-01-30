# Windows Startup Programs Manager - Batch Script

This is a simple Batch Script that allows you to manage startup programs in Windows. It lists all the programs that run at startup and provides an option to disable them.

## Features
- **List Startup Programs**: Displays all programs that are set to run at startup from both `HKCU` (Current User) and `HKLM` (Local Machine) registry locations.
- **Disable Startup Programs**: Allows you to disable any program from running at startup by removing it from the registry.
- **User-Friendly Menu**: Provides an interactive menu for easy navigation.

## How to Use
1. **Download the Script**:
   - Copy the script code into a text file and save it with a `.bat` extension, e.g., `StartupManager.bat`.

2. **Run the Script**:
   - Right-click the `.bat` file and select **Run as Administrator** to ensure the script has the necessary permissions to modify the registry.

3. **Follow the Menu**:
   - The script will display a menu with the following options:
     - **1. List Startup Programs**: Shows all programs configured to run at startup.
     - **2. Disable a Startup Program**: Allows you to disable a specific program by entering its corresponding number.
     - **3. Exit**: Exits the script.

4. **Disable a Program**:
   - When you select the option to disable a program, the script will prompt you to confirm the action. Type `yes` to proceed.

## Example
```
============================================
Windows Startup Programs Manager
============================================

1. List Startup Programs
2. Disable a Startup Program
3. Exit

Please select an option (1-3): 1

============================================
List of Startup Programs
============================================

1. C:\Program Files\SomeProgram\SomeProgram.exe
2. C:\Program Files\AnotherProgram\AnotherProgram.exe

Total startup programs: 2

Press any key to continue...
```

## Notes
- **Administrator Privileges**: The script requires administrator privileges to modify the registry.
- **Registry Changes**: Disabling a program removes its entry from the registry. Be cautious when making changes, as this can affect system functionality.
- **Backup**: It is recommended to back up your registry before making any changes.
