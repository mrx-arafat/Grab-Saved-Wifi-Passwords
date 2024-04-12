# Gather Wi-Fi profiles
$Profiles = (netsh wlan show profiles | Select-String "\:(.+)$").Matches.Groups[1].Value.Trim()

# Retrieve SSID and password for each profile
$Results = foreach ($SSID in $Profiles) {
    $profileDetails = netsh wlan show profile name="$SSID" key=clear
    $Password = if ($profileDetails -match "Key Content\W+\:(.+)$") {
        $matches[1].Trim()
    } else {
        "No password set"
    }
    [PSCustomObject]@{
        Wireless_Network_Name = $SSID
        Password = $Password
    }
}

# Format the results as a table and output to a text file
$Results | Format-Table -AutoSize | Out-File -FilePath .\wifi_pass.txt -Encoding ASCII -Width 50
