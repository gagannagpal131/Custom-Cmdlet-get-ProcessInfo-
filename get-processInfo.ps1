<#
This PowerShell code is used to display all "running" or "stopped" processes in your local machine (Windows OS). A custom cmdlet named 
"get-processInfo" is created with custom defined properties. Import this .ps1 into the PowerShell console and use the custom defined
cmdlet. The processes are displayed in the console and also exported as an html file in the current directory.

Example:
[1] get-processInfo -def_state "stopped"

[2] get-processInfo -def_state "running"
#>


cls
function get-processInfo{

#The custom parameter $def_state is set to "running" by default and can be set by the user while invoking the cmdlet.
param(
[parameter (mandatory = $false)]
$def_state = "running"
)

# $var stores the "running" or "stopped" processes.
$var = Get-WmiObject -Class win32_service|Where-Object {$_.state -eq $def_state}

# An empty array declaration used to create a array of objects.
$obj_arr = @()

for($i = 0 ; $i -lt $var.length ; $i++){
    
    $props = @{
        "ComputerName" = $var[$i].pscomputername
        "ProcessName" = $var[$i].displayname
        "StartMode" = $var[$i].startmode
        "ProcessStatus" = $var[$i].state
    

          }
<# In each iteration of the for loop a new object $obj is created, followed by which it is 
appended to the $obj_arr.Thus $obj_arr becomes an array of objects at the end of the for loop.#>

    $obj = New-Object -TypeName psobject -Property $props
    $obj_arr += $obj


   }

   $obj_arr
   $obj_arr|ConvertTo-Html|Out-File myfile.html


}
