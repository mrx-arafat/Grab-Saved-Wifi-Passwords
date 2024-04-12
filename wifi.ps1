# Collect wireless profiles
$Profiles = (netsh wlan show profiles | Select-String "\:(.+)$").Matches | ForEach-Object {
    if ($_.Groups[1]) {
        $_.Groups[1].Value.Trim()
    }
}

# Filter out null or empty entries
$Profiles = $Profiles | Where-Object { $_ }

# Collect SSID and Password information
$results = foreach ($SSID in $Profiles) {
    $profileInfo = netsh wlan show profile name="$SSID" key=clear
    $keyContentLine = $profileInfo | Select-String "Key Content\W+\:(.+)$"

    # Check if Key Content line was found and create a custom object
    if ($keyContentLine) {
        $password = $keyContentLine.Matches.Groups[1].Value.Trim()

        if ($password) {
            [PSCustomObject]@{
                Wireless_Network_Name = $SSID
                Password = $password
            }
        } else {
            [PSCustomObject]@{
                Wireless_Network_Name = $SSID
                Password = "No password set or network is open"
            }
        }
    }
}

# Check if any results were gathered
if ($results) {
    # Output results to a table, auto-sizing the columns
    $results | Format-Table -AutoSize

    # Write results to a file
    $results | Format-Table -AutoSize | Out-File -FilePath .\wifi_pass.txt -Encoding ASCII -Width 50
} else {
    Write-Output "No wireless profiles with password found or accessible."
}
