# List all network shares on the computer
Write-Output "Listing all network shares on the computer..."

# Use Get-WmiObject to retrieve network shares
Get-WmiObject -Class Win32_Share | ForEach-Object {
    Write-Output "Name: $($_.Name)"
    Write-Output "Path: $($_.Path)"
    Write-Output "Description: $($_.Description)"
    Write-Output "Type: $($_.ShareType)"
    Write-Output "----------------------------------------"
}
