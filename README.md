
# Server Resource Monitoring PS Script

The following PowerShell script is designed to monitor the performance of a server by providing information on its memory usage, C drive occupancy, and CPU usage. The script uses WMI (Windows Management Instrumentation) to gather the necessary information and returns the results to the console.




## Prerequisites
This script requires PowerShell version 3.0 or higher, and the server you wish to monitor must have the necessary permissions to run WMI queries remotely. Additionally, the $server variable in the script needs to be updated to reflect the IP address of the server you wish to monitor.

## Usage

To use this script, copy the code into a PowerShell script file with a .ps1 extension. Update the $server variable to reflect the IP address of the server you wish to monitor, and save the script. Then, open PowerShell and navigate to the directory where the script is saved. Run the script by entering its file path and name, and press enter. The script will output the server performance information to the console.

Note: The script will not automatically refresh the performance information. To get updated information, the script needs to be run again.

The program will output the following information for the specified server:

- Memory usage (used, free, total, and percentage usage)
- C drive usage (used, free, total, and percentage usage)
- Instant CPU usage

## Example Output

```powershell
Memory usage on serverip : Used: 6.051 GB, Free: 9.949 GB, Total: 16 GB, Usage: 37.819%
C drive occupancy on serverip : Used: 299.024 GB, Free: 200.976 GB, Total: 500 GB, Usage: 59.805%
Instant CPU usage on serverip : 16.446%

```
## Troubleshooting

If you encounter issues when running this script, try the following:

- Verify that the server name or IP address is correct and that the server is powered on and connected to the network.
- Ensure that you have the necessary permissions to access the server, memory usage information, drive usage information, and CPU usage information.
- Check that the WMI service is running on the server.
- Confirm that the user running the script has the necessary permissions to access the information being requested.

If you are still experiencing issues, consider reaching out to your system administrator or IT support for further assistance.
## Conclusion

The PowerShell script provided can be used to monitor server performance and retrieve information on memory usage, C drive occupancy, and CPU usage. By using WMI, the script is able to retrieve accurate information and output it to the console. With this information, server administrators can identify any potential issues with server performance and take appropriate actions to optimize its performance.

## License

[MIT](https://github.com/seymenbahtiyar/Server_Resource_Monitoring_PS_Script/blob/main/LICENSE)
