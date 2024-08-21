# Windows Update History Script

This PowerShell script retrieves the update history from a Windows machine, filters for updates containing a KB number, and outputs the results in a well-formatted table. The script is particularly useful for administrators or users who need to audit or review the update history on their Windows systems.

## Features

- **Filter by KB Number**: The script only includes updates that have an associated KB (Knowledge Base) number.
- **Formatted Output**: Outputs the update history in a clean, easy-to-read table format.
- **Supports Installation, Uninstallation, and Other Operations**: The script categorizes updates based on their operation type.

## Prerequisites

- **PowerShell**: This script requires PowerShell to be installed on the system.
- **Administrator Privileges**: The script may need to be run with elevated privileges to access the update history.

## Usage

### Running the Script

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/windows-update-history-script.git
