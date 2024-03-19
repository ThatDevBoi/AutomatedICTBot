# Start welcome message
Clear-Host
Write-Host "Welcome To STBOT"

# Display for set seconds
Start-Sleep -Seconds 4

# Run new Host command
Write-Host "What seems to be your issue today?"

# Add choices for each issue 

function showFirstMenu {
    Write-Host "1) Network Issues"
    Write-Host "2) Software Issues"
    Write-Host "3) Hardware Issues"
    Write-Host "4) Network Drives"
    Write-Host "5) Exit"
}
<#
function showNetworkChoiceMenu {
    Write-Host "1) I Cannot Get WIFI"
    Write-Host "2) Direct Access Is Not Connecting"
    Write-Host "3) Direct Access Is Missing"
    Write-Host "4) I cannot connect to my hotspot"
    Write-Host "5) Exit"
    
    $networkChoice = Read-Host "Please Enter the Number that Relates to your network issue"
    return $networkChoice
}
#>
function get-UserChoice {
    showFirstMenu
    $choice = Read-Host "Please Enter the Number that Relates to your issue"

    switch ($choice) {
        '1' {
            Confirm-Option "Network Issues"
            powershell.exe -NoExit -ExecutionPolicy Bypass -File "C:\Users\daveb\Desktop\STBot\Master\Network Master\Network Master.ps1"
        }
        '2' {
            Confirm-Option "Software Issues"
        }
        '3' {
            Confirm-Option "Hardware Issues"
            powershell.exe -NoExit -ExecutionPolicy Bypass -File "C:\Users\daveb\Desktop\STBot\Master\Hardware Master\HardwareMaster.ps1"
        }
        '4' {
            Confirm-Option "Network Drives"
        }
        '5' {
            Write-Host "Exiting..."
            exit
        }
        default {
            Write-Host "Invalid Choice. Please enter a valid number."
        }
    }
}
# Confirmation Function
function Confirm-Option($selectedOption) {
    $confirmation = Read-Host "You Selected $selectedOption. Is this Correct? (Y/N)"
    if ($confirmation -eq 'Y' -or $confirmation -eq 'y') {
        # Set the selected option in a global variable
        $global:selectedOption = $selectedOption
        Write-Host "Thank you for confirming!"

        # Ask more questions and lead to different outcomes
        #Ask-MoreQuestions
    } else {
        # User did not confirm, show the menu again
        get-UserChoice
    }
}

function Start-New-Master() {

}


#function Ask-MoreQuestions {
    # Ask additional questions based on the user's initial selection
    #Clear-Host
    #Write-Host "Great! Let's get more information:"

    #switch ($global:selectedOption) #{
        #'Network Issues' #{
            # Ask network-related questions
            #$networkChoice = showNetworkChoiceMenu
            #Confirm-Option "Network Issues - $networkChoice"
        #}
        #'Software Issues' {
            # Ask software-related questions
            #$answer2 = Read-Host "Have you recently installed any new software? (Y/N)"
            #if ($answer2 -eq 'Y' -or $answer2 -eq 'y') {
                #Write-Host "Newly installed software can sometimes cause issues. Let's investigate further."
                # Continue with additional questions or actions
            #} #else #{
                #Write-Host "Let's explore other possible causes of the software issue."
                # Continue with additional questions or actions
            #}
        #}
        #'Hardware Issues' #{
            # Ask hardware-related questions
            #$answer3 = Read-Host "Did you make any recent hardware changes? (Y/N)"
            #if ($answer3 -eq 'Y' -or $answer3 -eq 'y') {
                #Write-Host "Changes in hardware configurations can impact system stability. Let's check further."
                # Continue with additional questions or actions
            #} else {
               # Write-Host "Let's explore other possible causes of the hardware issue."
                # Continue with additional questions or actions
            #}
        #}
        #'Network Drives' {
            # Ask network drives-related questions
            #$answer4 = Read-Host "Are you experiencing issues with specific network drives? (Y/N)"
            #if ($answer4 -eq 'Y' -or $answer4 -eq 'y') {
                #Write-Host "Identifying specific network drives can help narrow down the issue. Let's investigate."
                # Continue with additional questions or actions
            #} else {
                #Write-Host "Let's explore other possible causes of the network drives issue."
                # Continue with additional questions or actions
            #}
        #}
        #default {
            #Write-Host "Invalid Option. Returning to the main menu."
            #get-UserChoice
        #}
    #}
#}


while ($true) {
    get-UserChoice
}