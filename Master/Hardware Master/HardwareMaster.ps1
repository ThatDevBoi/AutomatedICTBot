Clear-Host
function Welcome {
    Write-Host "Hey, welcome to the Hardware Master!"
    Write-Host "Before we start I just need to collect some data from your machine..."
    Write-Host "Please do not press anything while this process starts"

    Start-Sleep -Seconds 4

    # Get the hostname of the computer
    $hostname = hostname

    # Specify the local path where the MSInfo text file will be saved
    $outputFile = "C:\Users\daveb\Desktop\STBot\Master\Hardware Master\MSInfo\" + $hostname + "_msinfo.txt"

    try {
        # Start the msinfo32 process to generate MSInfo file and export to text
        Start-Process -FilePath "msinfo32.exe" -ArgumentList "/report `"$outputFile`"" -Wait -NoNewWindow

        # Display message after generating MSInfo file
        Write-Host "MSInfo file created. Thanks for waiting!"
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}

# Call the Welcome function
Welcome

