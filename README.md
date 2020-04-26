# Push-Data-To-ThingSpeak-Demo
Demo on pushing data to ThingSpeak Channel using Powershell Script

## Getting Started with ThingSpeak
[ThingSpeak](https://thingspeak.com) is an open source **Internet of Things** application and API to store and retrieve data from anything using HTTP over the Internet or via a Local Area Network.

### Sign Up for ThingSpeak
1. Sign Up for New User Account - [https://thingspeak.com/users/sign_up](https://thingspeak.com/users/sign_up)
2. Create a new Channel by selecting _Channels_, _My Channels_, and then _New Channel_
3. Copy and save the ThingSpeak Write API Key and enter it into the PowerShell Script

## Freespace-DiskDrive.ps1
When this script executes, _[Freespace-DiskDrive.ps1](/Freespace-DiskDrive.ps1)_ will report the free space of the disk drive to a ThingSpeak Channel.

### Script Notes:

1. Place the Freespace-DiskDrive.ps1 PowerShell script at some location on our system.
2. Make sure you set the correct drive letter, such as "C:" or "D:"
3. Make sure to enter your ThingSpeak Wite API Key for your Channel

