# ------------------------------------------------------------------------------------------------------------------
#  Name        		:	Freespace-DiskDrive.ps1
#  Author      		:	Harsh Arora
#  Description     	:	This powershell script will report the free space of the disk drive to a ThingSpeak Channel.
# ------------------------------------------------------------------------------------------------------------------

$Logfile = "$env:SystemDrive\Freespace_DiskDrive.log"

function LogWrite([string]$logstring)
{
	$DateTime = Get-Date -Format g
	Add-content $Logfile -value "$DateTime $logstring"
}

# Get Disk Size and Free Space
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='D:'" | Select-Object Size,FreeSpace

# Format Free Space into Gigabytes
$disk.FreeSpace = $disk.FreeSpace / 1Gb
$disk.FreeSpace = [math]::Round($disk.FreeSpace, 2)
$disk.FreeSpace

LogWrite "Free Space into GB: $disk.FreeSpace" 

# ThingSpeak Write API Key (Replace with your key)
$key = "xxxxxxxxxxxxxxxx"

# ThingSpeak URL
$url = "https://api.thingspeak.com/update?key=" + $key + "&field1=" + $disk.FreeSpace
LogWrite "ThingSpeak URL: '$url'" 

# Send Disk Space to ThingSpeak
$HTTP_Client = new-object net.webclient
$HTTP_Response = $HTTP_Client.DownloadString($url)

# Check Rate Limit and Display Results
If ($HTTP_Response -ne '0') {
  LogWrite "ThingSpeak Entry ID:" $HTTP_Response
  LogWrite "Disk Free Space:" $disk.FreeSpace "GB"
}
else {
    
  LogWrite "Channel Update Failed - Check Rate Limit"
}