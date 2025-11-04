# This script safely finds and reads the special Google Play Games shortcuts
# to reveal their full, hidden launch URL.

# This path automatically finds the correct folder for the current user.
$path = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Google Play Games\"

# Check if the directory exists
if (-not (Test-Path $path)) {
    Write-Host "Error: Could not find the Google Play Games shortcut folder at:" -ForegroundColor Red
    Write-Host $path -ForegroundColor Yellow
    Write-Host "Please make sure Google Play Games is installed." -ForegroundColor White
} else {
    # Loop through each shortcut file and search for the URL pattern inside it
    Get-ChildItem -Path $path -Filter *.lnk | ForEach-Object {
        Write-Host "-------------------------------------------"
        Write-Host "Found Shortcut: $($_.Name)" -ForegroundColor White

        # These shortcuts store the URL as a Unicode (UTF-16) string.
        # This command searches the raw file content using the correct encoding.
        $match = Select-String -Path $_.FullName -Pattern "googleplaygames://[^\x00]+" -Encoding Unicode

        if ($match) {
            $foundUrl = ($match | Select-Object -First 1).Matches.Value
            Write-Host "Full Target URL: $foundUrl" -ForegroundColor Green
        } else {
            Write-Host "Could not find a valid URL in this shortcut." -ForegroundColor Red
        }
        Write-Host ""
    }
}

# This line keeps the window open until you press Enter.
Read-Host -Prompt "Press Enter to exit"