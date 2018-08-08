# Custom-Cmdlet-get-ProcessInfo-
This PowerShell code is used to display all "running" or "stopped" processes in your local machine (Windows OS). A custom cmdlet named 
"get-processInfo" is created with custom defined properties. Import this .ps1 into the PowerShell console and use the custom defined
cmdlet. The processes are displayed in the console and also exported as an html file in the current directory.

Example:
[1] get-processInfo -def_state "stopped"

[2] get-processInfo -def_state "running"
