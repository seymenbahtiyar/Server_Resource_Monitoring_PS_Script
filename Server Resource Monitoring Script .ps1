# Server IP address
$server = "serverip"

############################################################################################################################################################

try {
    # Get total memory and free memory for the server
    $CompObject = Get-WmiObject -Class CIM_OperatingSystem -ComputerName $server
    $totalMemory = [math]::Round($CompObject.TotalVisibleMemorySize / 1024 / 1024 , 3)
    $freeMemory = [math]::Round($CompObject.FreePhysicalMemory / 1024 / 1024 , 3)
    $usedMemory = [math]::Round(($totalMemory - $freeMemory), 3)
    $memoryUsage = [math]::Round((($usedMemory / $totalMemory) * 100), 3)

    # Output the memory usage information
    Write-Output "Memory usage on $server : Used: $usedMemory GB, Free: $freeMemory GB, Total: $totalMemory GB, Usage: $memoryUsage%"

} catch {
    # Throw an error if there was an issue with getting memory usage information
    throw "Error: Unable to retrieve memory usage information from $server. Exception message: $($_.Exception.Message)"
}

############################################################################################################################################################

try {
    # Get drive size and free space for the C drive on the server
    Get-WmiObject CIM_LogicalDisk -ComputerName $server -Filter "DeviceID='C:'" | Select-Object Size,FreeSpace | ForEach-Object {
        $totalDrive = $_.Size / 1GB
        $freeDrive = $_.FreeSpace / 1GB
        $usedDrive = $totalDrive - $freeDrive
        $totalDrive = [math]::Round($totalDrive , 3)
        $freeDrive = [math]::Round($freeDrive , 3)
        $usedDrive = [math]::Round($usedDrive , 3)
        $driveUsage = [math]::Round((($usedDrive / $totalDrive) * 100), 3)

        # Output the C drive usage information
        Write-Output "C drive occupancy on $server : Used: $usedDrive GB, Free: $freeDrive GB, Total: $totalDrive GB, Usage: $driveUsage%"
    }
} catch {
    # Throw an error if there was an issue with getting C drive usage information
    throw "Error: Unable to retrieve C drive usage information from $server. Exception message: $($_.Exception.Message)"
}

############################################################################################################################################################

try {
    # Get instant CPU usage for the server
    $cpuUsage = Get-WmiObject CIM_Processor -ComputerName $server | Measure-Object -Property LoadPercentage -Average

    # Output the instant CPU usage information
    Write-Output "Instant CPU usage on $server : $($cpuUsage.Average)%"
} catch {
    # Throw an error if there was an issue with getting instant CPU usage information
    throw "Error: Unable to retrieve instant CPU usage information from $server. Exception message: $($_.Exception.Message)"
}

############################################################################################################################################################

