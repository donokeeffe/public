$multiplelines = @"


▒█▀▀█ █▀▀█ █░░░█ █▀▀ █▀▀█ █▀▀ █░░█ █▀▀ █░░ █░░ 
▒█▄▄█ █░░█ █▄█▄█ █▀▀ █▄▄▀ ▀▀█ █▀▀█ █▀▀ █░░ █░░ 
▒█░░░ ▀▀▀▀ ░▀░▀░ ▀▀▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀▀▀ 

"@

$Label Here = @"

####################################################################
#####                                                          #####
#####                                                          #####
#####             DATE      : 01/04/20                         #####
#####             WHO       : Don O'Keeffe                     #####
#####             RATIONALE : <PLACE HERE>                     #####
#####                                                          #####
#####                                                          #####
#####                                                          #####
#####                                                          #####
#################################################################### 

"@

<#
  .SYNOPSIS
  Counts VDI's in Summary State equaling "Availible" and ensure we have more than three spare.
  .DESCRIPTION
  Adds a file name extension to a supplied name.
  Takes any strings for the file name or extension.
  .NOTES
  Don O'Keeffe
  .PARAMETER Name
  Specifies the file name.
  .EXAMPLE
  C:\PS> extension -name "File"
  .LINK
  Online version: http://www.fabrikam.com/extension.html
#>


Start-Transcript -Path C:\Temp\PowerShell-History.txt
Clear
$startTime = Get-Date
Write-Host "The script was started $startTime" -ForegroundColor red -BackgroundColor white
Write-Warning "An error has occurred (well reported)."
Set-Location -Path C:\Temp
# make the variable a constant
New-Variable -Option Constant -Name MyEmailAddress -Value "firstname.surname@gmail.com"

function Show-PSBanner {
    param()
    Write-Host $multiplelines
}
Show-PSBanner

Write-Host $multiplelines
Write-Host "This Is Red Text On A Yellow Background" -Foregroundcolor Red -Backgroundcolor Yellow

$findcommands = @"

▒█▀▀▀ ░▀░ █▀▀▄ █▀▀▄ 　 ▒█▀▀█ █▀▀█ █▀▄▀█ █▀▄▀█ █▀▀█ █▀▀▄ █▀▀▄ █▀▀ 
▒█▀▀▀ ▀█▀ █░░█ █░░█ 　 ▒█░░░ █░░█ █░▀░█ █░▀░█ █▄▄█ █░░█ █░░█ ▀▀█ 
▒█░░░ ▀▀▀ ▀░░▀ ▀▀▀░ 　 ▒█▄▄█ ▀▀▀▀ ▀░░░▀ ▀░░░▀ ▀░░▀ ▀░░▀ ▀▀▀░ ▀▀▀ 

"@
 
Get-command Write*
Get-Command -Verb Show*
Get-Command -Noun Service
Get-command *netfirewallrule*
Get-Alias
Get-Module -ListAvailable
Get-Module -ALL
get-command get*
get-command dir | format-list
get-process | get-member -MemberType property
get-help get-process -online
Get-Process | Where-Object {$_.handles -gt 200}
Get-Module -ListAvailable
Get-Module -ALL
Get-Command –Name *IP*
Get-Command –Module NetTCPIP –Name *IP*
get-verb
get-command -Verb new
Get-Command –Module ActiveDirectory –Name *Lock*
Get-History | Export-Clixml -Path c:\temp\AppsCommands.Xml
Get-Command -Module Windowsupdate
Get-Module -Listavailable
Get-Help *Instance*
dir env:
gci env:
ls env:
#All are aliased to
Get-ChildItem env:
Get-Command | Sort Source -Ascending | Select -First 50
Get-PSProvider

#Select History from the Grid
 h|ogv -Title "Select the command(s) & hit 'OK' to run" -PassThru|%{iex $_.commandline}

<#
CommandType     Name                                               ModuleName  
-----------     ----                                               ----------  
Alias           % -> ForEach-Object                                            
Alias           ? -> Where-Object                                              
Alias           h -> Get-History                                               
Alias           r -> Invoke-History  
#>

$dateandtime = @"

▒█▀▀▄ █▀▀█ ▀▀█▀▀ █▀▀ 　 ░█▀▀█ █▀▀▄ █▀▀▄ 　 ▀▀█▀▀ ░▀░ █▀▄▀█ █▀▀ 
▒█░▒█ █▄▄█ ░░█░░ █▀▀ 　 ▒█▄▄█ █░░█ █░░█ 　 ░▒█░░ ▀█▀ █░▀░█ █▀▀ 
▒█▄▄▀ ▀░░▀ ░░▀░░ ▀▀▀ 　 ▒█░▒█ ▀░░▀ ▀▀▀░ 　 ░▒█░░ ▀▀▀ ▀░░░▀ ▀▀▀ 

"@

# DATE AND TIME DATE AND TIME DATE AND TIME DATE AND TIME DATE AND TIME DATE AND TIME DATE AND TIME

#Uptime
$os = Get-WmiObject win32_operatingsystem
$uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
$Display = "Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes"
Write-Output $Display

$wmi = Get-WMIObject -Class Win32_OperatingSystem
$lastboottime = $wmi.ConvertToDateTime($wmi.LastBootUpTime)
$sysuptime = (Get-Date) - $lastboottime
$uptime = "UPTIME: $($sysuptime.days) Days, $($sysuptime.hours) Hours, $($sysuptime.minutes) Minutes, $($sysuptime.seconds) Seconds"
write-host $uptime

$date = Get-Date -Format dd-MMM-yyyy_HH.mm
$date

Get-Date -Displayhint Date
(Get-Date).Addminutes(137)

(Get-Date).Addminutes(137)
(Get-Date).Adddays(-42)
Get-date | Get-Member -MemberType Method -Name a*
New-TimeSpan -Start (get-date) -End (get-date -year 2019 -month 12 -day 25)

$a = "{0:D}" -f (get-date)
Write "a = $a"
$a = "{0:hh:mm:ss}" -f (get-date)
Write "a =2 + $a"
$startTime = Get-Date
Write "The script was started " $startTime.ToString("U")
Write "The script was started " $startTime.ToString("T")  

<#
Spécificator    Type                                Example (with  [datetime]::now)
d   Short date                                      26/09/2002
D   Long date                                       jeudi 26 septembre 2002
t   Short Hour                                      16:49
T   Long Hour                                       16:49:31
f   Date and hour                                   jeudi 26 septembre 2002 16:50
F   Long Date and hour                              jeudi 26 septembre 2002  16:50:51
g   Default Date                                    26/09/2002 16:52
G   Long default Date and hour                      26/09/2009 16:52:12
M   Month Symbol                                    26 septembre
r   Date string RFC1123                             Sat, 26 Sep 2009 16:54:50 GMT
s   Sortable string date                            2009-09-26T16:55:58
u   Sortable string date universal local hour       2009-09-26 16:56:49Z
U   Sortable string date universal GMT hour         samedi 26 septembre 2009  14:57:22 (oups)
Y   Year symbol                                     septembre 2002
#>

#Difference between my Birthday and Today
$StartDate=(GET-DATE)
$EndDate=[datetime]”05/30/1974 17:30”
$MyTimeSpan= NEW-TIMESPAN –Start $StartDate –End $EndDate
write-host("You have been on this Earth for", $MyTimeSpan.days)
write-host("So I make your Birthday.. ", (get-date).adddays($MyTimeSpan.Days))

#Date
$StartDate=(GET-DATE);
$EndDate=[datetime]”01/01/2014 00:00”;
NEW-TIMESPAN –Start $StartDate –End $EndDate

# Up time function
function Get-Uptime {
   $os = Get-WmiObject win32_operatingsystem
   $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
   $Display = "Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes"
   Write-Output $Display
}

$SessionData = @"


▒█▀▀▀█ █▀▀ █▀▀ █▀▀ ░▀░ █▀▀█ █▀▀▄ 　 ▒█▀▀▄ █▀▀█ ▀▀█▀▀ █▀▀█ 
░▀▀▀▄▄ █▀▀ ▀▀█ ▀▀█ ▀█▀ █░░█ █░░█ 　 ▒█░▒█ █▄▄█ ░░█░░ █▄▄█ 
▒█▄▄▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀░░▀ 　 ▒█▄▄▀ ▀░░▀ ░░▀░░ ▀░░▀ 

"@

Get-WmiObject –ComputerName $env:COMPUTERNAME –Class Win32_ComputerSystem | Select-Object UserName
$env:USERNAME
Get-ChildItem Env:
Get-Item Env:Path
$env:UserDomain
Get-Host | Select-Object Version
# 32bit OS or 64bit Check
if ([System.IntPtr]::Size -eq 4) { "32-bit" } else { "64-bit" }
$PSVersionTable.PSVersion
get-executionpolicy -list
Get-Variable |%{ "Name : {0}`r`nValue: {1}`r`n" -f $_.Name,$_.Value }
(gwmi WIN32_ComputerSystem).Domain
(Get-ComputerInfo).oslastbootuptime

Write-Output 'COPY THIS INTO THE CLIPBOARD AND GOING TO OUTPUT IN WITH A PASTE NOW' | Set-Clipboard ##### -Append
Get-Clipboard 

# Gathering Data
Get-Disk
query user
get-computerinfo

# MATHS AND STATS
# Import-Csv c:\scripts\test.txt | Measure-Object score -ave -max -min
# Import-Csv c:\scripts\test.txt | Sort-Object score -ascending | Select-Object -first 5
# Measure-Command {c:\apps\PingComputersOU.ps1}
Measure-Command {get-process}


# Get OS 
(Get-CimInstance Win32_OperatingSystem).version
Get-ComputerInfo OsName,OsVersion,OsBuildNumber,OsHardwareAbstractionLayer,WindowsVersion
Get-WmiObject –ComputerName $env:COMPUTERNAME –Class Win32_ComputerSystem | Select-Object *
(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").productname

 
Get-WmiObject win32_processor | select SocketDesignation,Name,NumberOfCores,NumberOfEnabledCore,NumberOfLogicalProcessors,ThreadCount,L2Cachesize,L3Cachesize
 
Get-CimInstance -Class Win32_Processor | select *
Get-WMIObject Win32_BIOS
 
Get-ComputerInfo | Get-Member | more
(Get-ComputerInfo).osuptime
Get-ComputerInfo -Property *BIOS*
 
Get-WmiObject -class Win32_PerfFormattedData_PerfProc_Process | Select-Object $properties | Format-Table -AutoSize

# HARDWARE HARDWARE HARDWARE HARDWARE HARDWARE HARDWARE HARDWARE HARDWARE
Get-WmiObject -Class win32_processor | ft -Property NumberOfCores, NumberOfLogicalProcessors -auto

# How Much Memory I have in GB
(Get-WmiObject Win32_PhysicalMemory | measure-object Capacity -sum).sum/1gb
Get-WmiObject win32_physicalmemory | Format-Table Manufacturer,Banklabel,Configuredclockspeed,Devicelocator,Capacity,Serialnumber -autosize
get-wmiobject -class "win32_physicalmemory"
(systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()

# Getting Types of Varibles
$HostContextSwitches
$HostContextSwitches.Gettype().fullname
($VM).Gettype().fullname

Get-ComputerInfo | ? osu*
Get-ComputerInfo | % OsUptime 

Get-Variable | Select Name
$DefaultVaribles = $(Get-Variable).Name
Remove-Variable * -ErrorAction SilentlyContinue; Remove-Module *; $error.Clear();
Get-Variable | Select Name

# Unique and Get-Unique
$Results.status | sort -Unique
foreach ($element in ($TotalCSVsFound  | Get-Unique)) {}

# Grouping with Group-Object
get-childitem | sort-object -property extension | group-object -property extension

# Good Examples Of Grouping with Group-object 
1, 1, 1, 2, 2, 3, 4, 4, 4, 4, 5, 5 | Group-Object -NoElement | Select-Object @{ n='Element:Count'; e={ '{0}:{1}' -f $_.Values[0], $_.Count } }
1, 1, 1, 2, 2, 3, 4, 4, 4, 4, 5, 5 | Group-Object -NoElement 

# If Null 
if (!$variablename) { Write-Host "variable is null" }

# Tables with Format-Table
get-process svchost | select * | ft -HideTableHeaders 
get-process svchost | select * | ft -Wrap

# Get Software
Get-Wmiobject -Class Win32_Product | Select-Object -Property Name

$Strings = @"

▒█▀▀▀█ ▀▀█▀▀ █▀▀█ ░▀░ █▀▀▄ █▀▀▀ █▀▀ 
░▀▀▀▄▄ ░░█░░ █▄▄▀ ▀█▀ █░░█ █░▀█ ▀▀█ 
▒█▄▄▄█ ░░▀░░ ▀░▀▀ ▀▀▀ ▀░░▀ ▀▀▀▀ ▀▀▀ 

"@

#MatchVsLikeVsContains
"This is a PowerShell String" -Match "PowerShell" #True
"This is a PowerShell String" -Like "PowerShell" #False
"This is a PowerShell String" -Contains "PowerShell" #False

#LIKE operator is used with the wildcard character(*).
"This is a PowerShell String" -like "*PowerShell*" #True

#CONTAINS (works with the collection of objects or Arrays)
"Apple","Dog","Carrot","Cat" -contains "dog" #True

#MATCH match the keyword in the string
"This is a PowerShell String" -Match "Shell" #True

# Finding Asterisks in a String
$From = "ikea*"
if ($from -match "\*")
{
  write-output "String contains the * character"
}
else 
{
  Write-Output "String does not contain the * Character"
}

"This is a test" -split " "
"Brien","Posey" -join " "

$string = Write-Output "Hello World"
$string | Get-Member
$string.Length
$string.ToUpper()
$string.ToLower()
$string.Replace(‘Hello’,’Goodbye’)

<#
Special characters are used to format/position string output.

   `0  Null
   `a  Alert bell/beep
   `b  Backspace
   `f  Form feed (use with printer output)
   `n  New line
   `r  Carriage return
 `r`n  Carriage return + New line
   `t  Horizontal tab
   `v  Vertical tab (use with printer output)
#>

<# comparison operators -eq, -lt, -gt, -contains, -like, -match

-eq             Equal
 -ne             Not equal
 -ge             Greater than or equal
 -gt             Greater than
 -lt             Less than
 -le             Less than or equal
 -like           Wildcard comparison
 -notlike        Wildcard comparison
 -match          Regular expression comparison
 -notmatch       Regular expression comparison
 -replace        Replace operator
 -contains       Containment operator
 -notcontains    Containment operator
 -in             Like –contains, but with the operands reversed.(PowerShell 3.0)
 -notin          Like –notcontains, but with the operands reversed.(PowerShell 3.0)
#>

"Operator".length -gt 7
$w = "December","January","February"
$w -contains "February"
"Peter" -gt "Paul"
"PowerShell" -match "ower"
"PowerShell" -like "Pow*"
if($a = "Peter"){…}

# Filters - A PowerShell Filter will accept the following operators      
$demo = $null      
 if (-Not ($demo)) { write "Zero, null or Empty"}      
 if (!($demo)) { write "Zero, null or Empty"}
$myVar -is "String"      
 $myVar -eq 123      
 $myVar -ceq $myVar2      
 "abcdef" -like "abc*"      
 "abcdef" -replace "dEf","xyz"      
 $myVar1 -is "String" -and $myVar2 -is "Int"      
 "{2:N}" -f 24.4567      
(1 -eq 1) -and -not (2 -gt 2)
$mycmd = ps | select id,ProcessName      
 foreach ($proc in $mycmd) {"{0,-8}{1,-20}" -f $proc.id, $proc.ProcessName}

#Concatenate
$Name='John'
$EMail="$name Doe"
$EMail

# FINDING STRINGS GREP FINDING STRINGS GREP FINDING STRINGS GREP FINDING STRINGS GREP 
#Adding lines ethier side of files....
select-string -path C:\SCRIPTS\ERRORS.txt -pattern "0xC0000064" -casesensitive -Context 1, 1 | Select-Object line | Out-String

# $Name = Read-Host "Please Enter Your Name"; 
# $Password = Read-Host -Assecurestring "Please Enter Your Password"

# Character Count
$a = "This is a two-line value `n stored in a variable."
$a | Measure-Object -word -line -character

Write-Host "Data For " -Nonewline; Write-Host "Atl-Ws-01" -Foregroundcolor Red -Backgroundcolor Yellow -Nonewline; Write-Host " Retrieved";


$services = @"

█▀▀ █▀▀ █▀▀█ ▀█░█▀ ░▀░ █▀▀ █▀▀ █▀▀
▀▀█ █▀▀ █▄▄▀ ░█▄█░ ▀█▀ █░░ █▀▀ ▀▀█
▀▀▀ ▀▀▀ ▀░▀▀ ░░▀░░ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀

"@

get-service -name wsearch -computer $env:COMPUTERNAME

Get-Service | Convertto-Html | Out-File Services.Html

# We can use the -PassThru command to keep passing the input object through each script.
# Get-Service -Name audiosrv | Restart-Service -PassThru | Stop-Service

$svc = Get-Service
$svc[0].name
$name = $svc[1].name
$name.length
$name.ToUpper()

Get-Service | Where-Object {$_.name -Match "win"}

Get-Service | Where-Object -FilterScript {$_.Name -like '*audio*' -and $_.Status -eq 'Running'}


# $services = Get-Service
# ForEach ($service in $services) {
#  $service.Stop()
# }

# restart-service spooler -force
# get-service net* | where {$_.Status -eq "Stopped"} | restart-service

Get-Service | Where-Object -FilterScript {$_.Name -like '*audio*' -and $_.Status -eq 'Running'}

(get-service cuagent).stop()
(get-service advanced*).stop()
(get-service eGurka*)stop()
Get-Service -DisplayName "telnet" | Stop-Service

Get-Service | Out-File -Filepath C:\Service.Txt -Whatif
Get-Service | Out-File -Filepath C:\Service.Txt -Confirm
Get-Service | Convertto-Csv -Notypeinformation | Out-File C:\Apps\Serv.Csv

get-service | where {$_.status -eq 'running'} | select  Name
$s = get-service b*
$s | select -expandproperty RequiredServices

$diskspace = @"

█▀▀▄ ░▀░ █▀▀ █░█   █▀▀ █▀▀█ █▀▀█ █▀▀ █▀▀
█░░█ ▀█▀ ▀▀█ █▀▄   ▀▀█ █░░█ █▄▄█ █░░ █▀▀
▀▀▀░ ▀▀▀ ▀▀▀ ▀░▀   ▀▀▀ █▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀
"@

$Disk = Get-WmiObject win32_logicaldisk
Foreach ($Drive in $Disk) {Switch ($Drive.DriveType) {
1{ $Drive.DeviceID + " Unknown" }
2{ $Drive.DeviceID + " Floppy or Removable Drive" }
3{ $Drive.DeviceID + " Hard Drive" }
4{ $Drive.DeviceID + " Network Drive" }
5{ $Drive.DeviceID + " CD" }
6{ $Drive.DeviceID + " RAM Disk" }
}
}

Get-WmiObject win32_logicaldisk
get-ciminstance  win32_logicaldisk -Filter 3
Get-CimInstance Win32_LogicalDisk -KeyOnly | Get-CimAssociatedInstance
Get-CimInstance Win32_LogicalDisk | Select DeviceID,  DriveType, VolumeName, Size, FreeSpace
Get-CimInstance -Query "Select DeviceID,  DriveType, VolumeName, Size, FreeSpace from Win32_LogicalDisk"
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='D:'" | Foreach-Object {$_.Size,$_.FreeSpace}
Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='D:'" | Select {$_.Size,$_.FreeSpace}


Get-WmiObject -Class Win32_logicaldisk -Filter "DeviceID = 'C:'" -Computername $env:COMPUTERNAME
Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" -Computername $env:COMPUTERNAME | Select-Object -Property DeviceID, DriveType, VolumeName, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}}, @{L="Capacity";E={"{0:N2}" -f ($_.Size/1GB)}}
Get-WmiObject Win32_LogicalDisk | `Format-Table DeviceId, Size, FreeSpace, ` @{Name="PercFree";Expression={[int]($_.FreeSpace/$_.Size * 100)}}, ` @{Name="ReportDate";Expression={(Get-Date -Format "yyyyMMdd-HHMMss")}}

# Size of Folder and Sub-Folders in MB's
$directory = "."
$big32 = Get-ChildItem $directory -Recurse | Sort-Object length -Descending | Select-Object -First 32 | measure-object -property length –sum 
$big32.sum /1mb

# Disk Space on All Drives
Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'" -Computername $env:COMPUTERNAME | Select-Object -Property DeviceID, DriveType, VolumeName, @{L='FreeSpaceGB';E={"{0:N2}" -f ($_.FreeSpace /1GB)}}, @{L="Capacity";E={"{0:N2}" -f ($_.Size/1GB)}}

Get-WMIObject Win32_BIOS
Get-WMIObject -query "Select * From Win32_Service Where State = 'Stopped'"

Get-WmiObject -List | Where-Object {$_.name  -Like "*Adapter"}
Get-WmiObject -List | Where-Object {$_.name  -Like "*Adapter*"}
Get-WmiObject -List | Where-Object {$_.name  -Match "Adapter"}

Get-WmiObject Win32_bios | Get-Member
$WMI = Get-WmiObject -List | where-Object {$_.name -NotLike "CIM*" -And $_.name -NotLike "__*"}
$WMI
Write-Host `n $WMI.count "WMI objects not contain CIM or __"

# Get Files in this Folder and Below and Display and Count duplicate files.
$Files = Get-ChildItem
# $Files = Get-ChildItem -Recurse
$Files | Group-Object -NoElement | Select-Object name,count | Sort count -Descending | where {$_.count -gt 1}

foreach ($i in get-childitem c:\scripts) {$i.extension}

gwmi win32_volume | ft DriveLetter, FreeSpace, Capacity, @{Label="PercentFree";Expression= {"{0:P}" -f ($_.freespace / $_.capacity)}}

#Space of Disk in GB to the 4 decimal.
$disk1 = Get-WmiObject Win32_LogicalDisk -ComputerName $env:COMPUTERNAME -Filter "DeviceID='D:'" | Select-Object Size,FreeSpace
#$disk.Size 
($disk1.FreeSpace/1GB).Tostring(“.00”)#When you want to convert a value from other than bytes to KB/MB/TB/GB:

# Largest Ten files 
Get-ChildItem c:\temp -recurse -force -ErrorAction SilentlyContinue | Select-object Name,DirectoryName, @{Label=’Size’;Expression={($_.Length/1GB).ToString('F04')}} | Sort Size -descending | select -First 10

# -lines, word, character in files.
get-content c:\scripts\test.txt | measure-object -line -word -character

$windowsdialogboxes = @"

█░░░█ ░▀░ █▀▀▄ █▀▀▄ █▀▀█ █░░░█ █▀▀   █▀▀▄ ░▀░ █▀▀█ █░░ █▀▀█ █▀▀▀   █▀▀▄ █▀▀█ █░█ █▀▀ █▀▀
█▄█▄█ ▀█▀ █░░█ █░░█ █░░█ █▄█▄█ ▀▀█   █░░█ ▀█▀ █▄▄█ █░░ █░░█ █░▀█   █▀▀▄ █░░█ ▄▀▄ █▀▀ ▀▀█
░▀░▀░ ▀▀▀ ▀░░▀ ▀▀▀░ ▀▀▀▀ ░▀░▀░ ▀▀▀   ▀▀▀░ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀▀ ▀▀▀▀   ▀▀▀░ ▀▀▀▀ ▀░▀ ▀▀▀ ▀▀▀
"@

$msgBody = "Reboot the computer now?"
$msgTitle = "Confirm Reboot"
$msgButton = 'YesNoCancel'
$msgImage = 'Question'
$Result = [System.Windows.MessageBox]::Show($msgBody,$msgTitle,$msgButton,$msgImage)
Write-Host "The user chose: $Result [" ($result).value__ "]"

# Host Varibles for Windows 
$Host.ui.rawui
$Host.Version

Write-Progress -Activity "I'm going to sleep for 5 seconds" -Status "Zzzzz"  
Start-Sleep 5  

$SEventLogs = @"

▒█▀▀▀ ▀█░█▀ █▀▀ █▀▀▄ ▀▀█▀▀ 　 ▒█░░░ █▀▀█ █▀▀▀ █▀▀ 
▒█▀▀▀ ░█▄█░ █▀▀ █░░█ ░░█░░ 　 ▒█░░░ █░░█ █░▀█ ▀▀█ 
▒█▄▄▄ ░░▀░░ ▀▀▀ ▀░░▀ ░░▀░░ 　 ▒█▄▄█ ▀▀▀▀ ▀▀▀▀ ▀▀▀ 
"@

Get-Eventlog System -Newest 5 | Sort-Object Eventid
Get-Winevent -Listlog * -Computername $env:computername | Where {$_.Recordcount}

$events = get-eventlog -logname application -newest 100
$events | select-string -inputobject {$_.message} -pattern "failed" -Context 2,3

# Event Search, Count and Group(s)
$events = get-winevent -logname "Windows PowerShell"
$events.count
$events | group-object id -noelement | sort-object count -desc
$events | group-object leveldisplayname -noelement 

$s = "Server01", "Server02", "Server03"
foreach ($server in $s) {$server; get-winevent -listlog "Windows PowerShell" -computername $server}

$events = get-winevent -logname "Windows PowerShell"
$events.count
$events | group-object id -noelement | sort-object count -desc
$events | group-object leveldisplayname -noelement

Get-EventLog -ComputerName $env:computername -LogName system | Where-Object {$_.EntryType -like 'Error' -or $_.EntryType -like 'Warning'} | Sort-Object Source

Get-Eventlog -List
Get-Eventlog -List
Get-EventLog -Log "Application" | Out-GridView

# Use Get-EventLog to get the events in the System log and store them in the $Events variable.
$Events = Get-EventLog -LogName system
# Pipe the events to the ForEach-Object cmdlet.
$Events | ForEach-Object -Begin {
    # In the Begin block, use Clear-Host to clear the screen.
    Clear-Host
    # Set the $i counter variable to zero.
    $i = 0
    # Set the $out variable to a empty string.
    $out = ""
} -Process {
    # In the Process script block search the message property of each incoming object for "bios".
    if($_.message -like "*‎2019‎-‎02‎-‎07T16:49:34.926392600Z.*")
    {
        # Append the matching message to the out variable.
        $out=$out + $_.Message
    }
    # Increment the $i counter variable which is used to create the progress bar.
    $i = $i+1
    # Use Write-Progress to output a progress bar.
    # The Activity and Status parameters create the first and second lines of the progress bar heading, respectively.
    Write-Progress -Activity "Searching Events" -Status "Progress:" -PercentComplete ($i/$Events.count*100)
} -End {
    # Display the matching messages using the out variable.
    $out
}

$NumberFormatting = @"

█▀▀▄ █░░█ █▀▄▀█ █▀▀▄ █▀▀ █▀▀█   █▀▀ █▀▀█ █▀▀█ █▀▄▀█ █▀▀█ ▀▀█▀▀ ▀▀█▀▀ ░▀░ █▀▀▄ █▀▀▀
█░░█ █░░█ █░▀░█ █▀▀▄ █▀▀ █▄▄▀   █▀▀ █░░█ █▄▄▀ █░▀░█ █▄▄█ ░░█░░ ░░█░░ ▀█▀ █░░█ █░▀█
▀░░▀ ░▀▀▀ ▀░░░▀ ▀▀▀░ ▀▀▀ ▀░▀▀   ▀░░ ▀▀▀▀ ▀░▀▀ ▀░░░▀ ▀░░▀ ░░▀░░ ░░▀░░ ▀▀▀ ▀░░▀ ▀▀▀▀
"@

$a = 348 
"{0:N2}" -f $a
"{0:D8}" -f $a
"{0:C2}" -f $a
"{0:P0}" -f $a
"{0:X0}" -f $a

#When you want to convert a value from other than bytes to KB/MB/TB/GB:
#Bytes by default
245760/1GB

Bytes to MB then rounded
(909090245760/1MB).ToString(".00")

[int]6.5

# due to the “P” format specified it can handle difference in formats MB \ GB
"{0:P}" -f (999MB/2GB)
"{0:P}" -f (5/21)
(5/21).tostring("P")

# File Character Count
Get-Content AppsCommands.Xml | Measure-Object -word -line -character -ignorewhitespace

# Windows PowerShell example to check If File Exists'
$ChkFile = "C:\temp\computers.txt"
$FileExists = Test-Path $ChkFile
If ($FileExists -eq $True) {
Write-Host "Yippee, computers.txt exists"
}

# Rounding Numbers in PowerShell
$Number = 13.5
#Cropping:
[math]::Truncate($Number)
#Rounding Down:
[math]::Floor($Number)
#Rounding Up:
[math]::ceiling($Number)
#Standard 0-4 Round Down 5-9 Round Up:
[math]::Round($Number)

#Bytes by default
245760/1GB

Bytes to MB then rounded
(909090245760/1MB).ToString(".00")

[int]6.5

[math]::Round($a)
$RoundMem = [math]::Round((([String]$comp.TotalPhysicalMemory /1gb) ))

# due to the “P” format specified it can handle difference in formats MB \ GB
"{0:P}" -f (999MB/2GB)
"{0:P}" -f (5/21)
(5/21).tostring("P")

$Label Here = @"

█▀▀ ░▀░ █░░ █▀▀ █▀▀
█▀▀ ▀█▀ █░░ █▀▀ ▀▀█
▀░░ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
"@

#File
Get-Childitem -Recurse | Where-Object {($_.Psiscontainer)} | Get-Acl | Format-List

# Find Oldest 5 FileS
get-childitem -Recurse  | sort-object -Property LastWriteTime -Descending | select-object -First 5 | format-table -Property LastWriteTime,FullName -Autosize 

Add-Content Test.Txt "The End"
Add-Content Test.Txt "'Nthe End"
Get-Process | Tee-Object -File Test3.Txt
Import-Csv C:\Scripts\Test.Txt | Measure-Object Score -Ave -Max -Min
Import-Csv C:\Scripts\Test.Txt | Sort-Object Score -Ascending | Select-Object -First 5

get-content c:\temp\example.txt | measure-object -line -word -character

# Use a pipe to break up the lines
Get-ChildItem C:\temp Sort-Object Length –Descending

 $a = Get-Content c:\temp\example.txt
 Write-Host $a[0]
 Write-Host $a[2]

#rem Creates 11GB file
fsutil file createnew test.txt 1112

#Writing Output to a file then reading the file back into the screen.
get-process | out-file -filepath C:\temp\process.txt
get-content C:\temp\process.txt | out-string

get-childitem c:\,c:\windows,'c:\program files'
help Get-ChildItem -online
Get-ChildItem Env:
Get-Variable -Include M*,P*

# Files Create, Add, Get and Delete
Test-Path c:\temp\
New-Item c:\temp\test.txt
Set-Content c:\temp\test.txt 'Line1'
Add-Content C:\temp\test.txt "Line2"
Add-Content C:\temp\test.txt "`nLine3"
Get-Content c:\temp\test.txt
Remove-Item 'c:\temp\test.txt'
if (Test-Path -Path c:\temp\test.txt) {Remove-Item  c:\temp\test.txt}

# Duplicates Entry's Removed by Creating A list of Servers and Sort and Get Unique Values.
Test-Path c:\temp\
New-Item c:\temp\servers.txt
Set-Content c:\temp\servers.txt 'Mars'
Add-Content C:\temp\servers.txt "Pluto"
Add-Content C:\temp\servers.txt "Saturn"
Add-Content C:\temp\servers.txt "Pluto"
Add-Content C:\temp\servers.txt "Earth"
$filename="c:\temp\servers.txt"
$newfileName="c:\temp\sorted_servers.txt"
gc $filename | sort | get-unique > $newfileName
#(But remember, the Get-Unique command only works on sorted data!)
Get-Content c:\temp\servers.txt
Get-Content c:\temp\sorted_servers.txt
if (Test-Path c:\temp\servers.txt) {Remove-Item c:\temp\servers.txt}

# Create and XML File
# New-Item cmdlet is used to create a xml file and Set-Content cmdlet to put content into it.
New-Item c:\temp\test.xml -ItemType File
Set-Content c:\temp\test.xml '<title>Welcome to TutorialsPoint</title>'
Get-Content c:\temp\test.xml
Remove-Item 'c:\temp\test.xml'

# Grep Output with lines before and after. Also Capturing lines not containing Strings also.
Test-Path c:\temp\
New-Item c:\temp\servers.txt
Set-Content c:\temp\servers.txt 'Mars'
Add-Content C:\temp\servers.txt "Pluto"
Add-Content C:\temp\servers.txt "Saturn"
Add-Content C:\temp\servers.txt "Pluto"
Add-Content C:\temp\servers.txt "Earth"
Select-String -Pattern "Saturn" -Context 1,2 C:\temp\servers.txt
$LinesNotWithSaturn = Select-String -Pattern "Saturn" -NotMatch C:\temp\servers.txt
$LinesNotWithSaturn.count
if (Test-Path c:\temp\servers.txt) {Remove-Item $FileName}

get-childitem c:\windows\system32\* -include *.txt -recurse | select-string -pattern "Microsoft" -casesensitive

# CSV CREATION CSV CREATION CSV CREATION CSV CREATION CSV CREATION CSV CREATION CSV CREATION 
# Add Coloums for Data
Add-Content -Path C:\temp\Employees.csv  -Value '"FirstName","LastName","UserName"'

  $employees = @(

  '"Adam","Bertram","abertram"'
  '"Joe","Jones","jjones"'
  '"Mary","Baker","mbaker"'
  )

$employees
# Add Data Records
$employees | foreach { Add-Content -Path  C:\temp\Employees.csv -Value $_ }

#Spilting the CSV file after certain points to extract third field which is Usernames by delimiter "",
$filename = "C:\temp\Employees.csv"

Get-Content $filename | ForEach-Object {
    $_.split(",")[2]
}

$Lists = @"

█░░ ░▀░ █▀▀ ▀▀█▀▀ █▀▀
█░░ ▀█▀ ▀▀█ ░░█░░ ▀▀█
▀▀▀ ▀▀▀ ▀▀▀ ░░▀░░ ▀▀▀
"@

# Get-Unique cmdlet can be used to get the unique objects from a sorted list of objects.
$list = "one","two","two","three","four","five"
$list | sort | get-unique

# Measure-Command cmdlet is used to meaure the time taken by script or command.
Measure-Command { Get-EventLog "Windows PowerShell" }

#Write-Host cmdlet is used to write customized messages.
Write-Host (2,4,6,8,10,12) -Separator ", -> " -ForegroundColor DarkGreen -BackgroundColor White

#Powershell Variables
$MyList = "one","two","two","three","four","five"
Get-variable MyLis*
Remove-Variable -Name MyLis* -ErrorAction SilentlyContinue

# Create an Array with Duplicates and display array with Duplicates
$a = @(1,2,3,4,5,5,6,7,8,9,0,0)
$a = $a | select -uniq
$a

# Arrays (Basic)
$x = 0,2,3,4,5
$x
$x[0,1,3,4]
$x[0] = 1
1..5
$x.Length
write-host("using for loop")
for ($i = 0; $i -le ($x.length - 1); $i += 1) {$x[$i]}
write-host("using forEach Loop")
foreach ($element in $x) {$element}


Get-Random -InputObject "red", "yellow", "blue"
1..1200 | ForEach-Object { 1..6 | Get-Random } | Group-Object | Select-Object Name,Count

# Hashtables vs CustomObject
$Hash = 1..10 | %{ @{Name="Object $_" ; Index=$_ ; Squared = $_*$_} }
$Custom = 1..10 | %{[PSCustomObject] @{Name="Object $_" ; Index=$_ ; Squared = $_*$_} }
$Hash   | Format-Table -AutoSize
$Custom | Format-Table -AutoSize
# $Hash   | Export-Csv .\Hash.csv -NoTypeInformation
# $Custom | Export-Csv .\CustomObject.csv -NoTypeInformation


$Processes = @"

█▀▀█ █▀▀█ █▀▀█ █▀▀ █▀▀ █▀▀ █▀▀ █▀▀ █▀▀
█░░█ █▄▄▀ █░░█ █░░ █▀▀ ▀▀█ ▀▀█ █▀▀ ▀▀█
█▀▀▀ ▀░▀▀ ▀▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀

"@

Start-Process Powershell –Verb Runas

#List Processes With and Without Headers
get-process svc* | select name
get-process svc* | select -ExpandProperty name

Get-Process | Where-Object {$_.Name –eq “outlook”}
Get-Command | Where-Object {$_.Source –eq “AWSPowershell”}
Get-Process | Get-Member
Get-Command | Sort Size -descending | select -First 10
Get-Command | Where-Object {$_.Source –eq “AWSPowershell”}

Get-Process | Sort-Object ProcessName, ID
Get-Process | Select-Object Name, Company
Get-Process | where-object { $_.VirtualMemorySize -gt 100000000 }
Get-Process | Where-Object {$_.id –eq “10696”}
Get-Process | Where-Object {$_.Name –eq “iexplore”}

$Processes=Get-Process
$Processes | Where-Object {$_.ProcessName -eq ‘dllhost’}
$Processes.ProcessName

Get-Process | Foreach-Object {Write-Host $_.Name -Foregroundcolor Cyan}

Get-Process wmiPrvSE | Stop-Process -Force    

Get-WmiObject win32_process | select Name,Commandl* | Where-Object {$_.name  -Like "*Pow*"}

# Background jobs
$myjob = start-job -scriptblock {get-eventlog -log system}
get-job
# get-job -state NotStarted
$results = receive-job -job $myjob

Get-Process | Sort-Object ID
#Run CMD as Another User
`PsExec.exe -i -u "NT AUTHORITY\Network Service" cmd.exe`

$procs = @{name="explorer","svchost"}
Get-Process @procs

# Running Jobs in the Background
Start-job {start-sleep 90}
<# 
Get-Job - Gets Windows PowerShell background jobs that are running in the current session
Receive-Job - Gets the results of the Windows PowerShell background jobs in the current session
Remove-Job - Deletes a Windows PowerShell background job
Start-Job - Starts a Windows PowerShell background job
Stop-Job - Stops a Windows PowerShell background job
Wait-Job - Suppresses the command prompt until one or all of the Windows PowerShell background jobs running in the session are complete
 “-AsJob” 
#>

$HTTP Curl Requsts = @"

█░░█ ▀▀█▀▀ ▀▀█▀▀ █▀▀█   █▀▀ █░░█ █▀▀█ █░░   █▀▀█ █▀▀ █▀▀█ █░░█ █▀▀ █▀▀ ▀▀█▀▀ █▀▀
█▀▀█ ░░█░░ ░░█░░ █░░█   █░░ █░░█ █▄▄▀ █░░   █▄▄▀ █▀▀ █░░█ █░░█ █▀▀ ▀▀█ ░░█░░ ▀▀█
▀░░▀ ░░▀░░ ░░▀░░ █▀▀▀   ▀▀▀ ░▀▀▀ ▀░▀▀ ▀▀▀   ▀░▀▀ ▀▀▀ ▀▀▀█ ░▀▀▀ ▀▀▀ ▀▀▀ ░░▀░░ ▀▀▀

"@

(curl wttr.in/London?0 -UserAgent "curl" ).Content
(curl http://cheat.sh/ls -UserAgent "curl" ).Content
(curl http://rate.sx/btc -UserAgent "curl" ).Content

# HTML Draw Down
Invoke-WebRequest -Uri "http://woshub.com"

http://ipinfo.io/json
http://ipinfo.io/8.8.8.8/json


$Wmi Objects = @"

█░░░█ ░▀░ █▀▄▀█
█▄█▄█ ▀█▀ █░▀░█
░▀░▀░ ▀▀▀ ▀░░░▀

"@

# WmiObjects and Searching them for Strings
get-wmiobject Win32_perfRawData_perfOS_Memory
get-wmiobject Win32_PageFileSetting
Get-cimclass | Select-String -Pattern "page"

$ErroHandling = @"

█▀▀ █▀▀█ █▀▀█ █▀▀█ █▀▀█   █░░█ █▀▀█ █▀▀▄ █▀▀▄ █░░ ░▀░ █▀▀▄ █▀▀▀
█▀▀ █▄▄▀ █▄▄▀ █░░█ █▄▄▀   █▀▀█ █▄▄█ █░░█ █░░█ █░░ ▀█▀ █░░█ █░▀█
▀▀▀ ▀░▀▀ ▀░▀▀ ▀▀▀▀ ▀░▀▀   ▀░░▀ ▀░░▀ ▀░░▀ ▀▀▀░ ▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀▀

"@

<#
Write-Debug - Write a debug message to the host display
Write-Error - Write an object to the error pipeline.
Write-Host - Display objects through the host user interface
Write-Output - Write an object to the pipeline
Write-Verbose - Write a string to the host’s verbose display
Write-Warning - Write a warning message
#>

$whereobjectexamples = @"

█░░░█ █░░█ █▀▀ █▀▀█ █▀▀   █▀▀█ █▀▀▄ ░░▀ █▀▀ █▀▀ ▀▀█▀▀   █▀▀ █░█ █▀▀█ █▀▄▀█ █▀▀█ █░░ █▀▀ █▀▀
█▄█▄█ █▀▀█ █▀▀ █▄▄▀ █▀▀   █░░█ █▀▀▄ ░░█ █▀▀ █░░ ░░█░░   █▀▀ ▄▀▄ █▄▄█ █░▀░█ █░░█ █░░ █▀▀ ▀▀█
░▀░▀░ ▀░░▀ ▀▀▀ ▀░▀▀ ▀▀▀   ▀▀▀▀ ▀▀▀░ █▄█ ▀▀▀ ▀▀▀ ░░▀░░   ▀▀▀ ▀░▀ ▀░░▀ ▀░░░▀ █▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀

"@

Where-Object {$_.name -Match "LON2"}
Where-Object {$_.EntryType -like 'Error' -or $_.EntryType -like 'Warning'}
Where-Object {$_.handles -gt 200}

$ConditionalStatements = @"

█▀▀ █▀▀█ █▀▀▄ █▀▀▄ ░▀░ ▀▀█▀▀ ░▀░ █▀▀█ █▀▀▄ █▀▀█ █░░   █▀▀ ▀▀█▀▀ █▀▀█ ▀▀█▀▀ █▀▄▀█ █▀▀ █▀▀▄ ▀▀█▀▀ █▀▀
█░░ █░░█ █░░█ █░░█ ▀█▀ ░░█░░ ▀█▀ █░░█ █░░█ █▄▄█ █░░   ▀▀█ ░░█░░ █▄▄█ ░░█░░ █░▀░█ █▀▀ █░░█ ░░█░░ ▀▀█
▀▀▀ ▀▀▀▀ ▀░░▀ ▀▀▀░ ▀▀▀ ░░▀░░ ▀▀▀ ▀▀▀▀ ▀░░▀ ▀░░▀ ▀▀▀   ▀▀▀ ░░▀░░ ▀░░▀ ░░▀░░ ▀░░░▀ ▀▀▀ ▀░░▀ ░░▀░░ ▀▀▀

"@

# Alias           % -> ForEach-Object                                            
# Alias           ? -> Where-Object  

# Where-Object {$_.name -Match "LON2"}
# Where-Object {$_.EntryType -like 'Error' -or $_.EntryType -like 'Warning'}
# Where-Object {$_.handles -gt 200}

# -lt Less than
# -le Less than or equal to
# -gt Greater than
# -ge Greater than or equal to
# -eq Equal to
# -ne Not equal to
# -like Like (uses wildcards for matching)
# -notlike Not like (uses wildcards for matching)  

# FOR FOREACH-OBJECT FOR FOREACH-OBJECT FOR FOREACH-OBJECT FOR FOREACH-OBJECT FOR FOREACH-OBJECT FOR FOREACH-OBJECT
1..10 | ForEach-Object -process {
  # code here will repeat 10 times
  # use $_ to access the current iteration
  # number
  WriteOuput $_
}

# FOR LOOPS 
for ($i = 1; $i -le 100; $i++ ) { Write-Progress -Activity "Search in Progress" -Status "$i% Complete:" -PercentComplete $i; }
for ($a = 1; $a -le 10; $a++) {$a}

# IF STATEMENT
 $a = "white" 
 if ($a -eq "red") {"The color is red."} 
 elseif ($a -eq "white") {"The color is white."}  
 else {"The color is blue."}

# FOR EACH STATEMENT 
1..10
1..10 | ForEach-Object -process {Write-Host $_}

# SELECT CASE STATEMENT 
$a = 2
switch ($a) 
 { 1 {"The color is red."} 
   2 {"The color is blue."} 
   3 {"The color is green."} 
   4 {"The color is yellow."} 
   default {"Other."}
  }

$fruit = "orange"
$result = switch ($fruit) {
   "apple"  {"We found an apple"; break}
   "pear"   {"We found a pear"; break}
   "orange" {"We found an orange"; break}
   "peach"  {"We found a peach"; break}
   "banana" {"We found a banana"; break}
   default {"Something else happened"; break}
}
$result

# DO WHILE LOOP 
$a = 1
do {$a; $a++} 
while ($a -lt 10)

While (Test-Path $path) {
  # commands  
}


while($val -ne 10)
     {
       $val++
       Write-Host $val
     }

$a = 1
do {$a; $a++} 
until ($a –gt 10)

for ($a = 1; $a -le 1000; $a++) {
(Get-NetTCPConnection -remoteport 40705).Count | Out-File c:\scripts\counts.txt -Append
# Get-Process wmiPrvSE | Stop-Process -Force
Sleep 5
Write-host "Iteration Number #" $a 
}

for ($a = 1; $a -le 1000; $a++) {
#Get-Process wmiPrvSE | Stop-Process -Force
get-service Advanc* | restart-service
Sleep 3600 # 1 Hour
$Date=get-date
Write-host $a $Date
}

1.100 | % #foreach# {do}


$Concatination = @"

█▀▀ █▀▀█ █▀▀▄ █▀▀ █▀▀█ ▀▀█▀▀ ░▀░ █▀▀▄ █▀▀█ ▀▀█▀▀ ░▀░ █▀▀█ █▀▀▄
█░░ █░░█ █░░█ █░░ █▄▄█ ░░█░░ ▀█▀ █░░█ █▄▄█ ░░█░░ ▀█▀ █░░█ █░░█
▀▀▀ ▀▀▀▀ ▀░░▀ ▀▀▀ ▀░░▀ ░░▀░░ ▀▀▀ ▀░░▀ ▀░░▀ ░░▀░░ ▀▀▀ ▀▀▀▀ ▀░░▀

"@

# You can just combine them in to one variable by adding it to one another.
$combinedVariable = $body + $size + $project
# Or you can combine them as a message
$combinedVariable = "This message shows you how much $size of your $project is used"
# You can also add every variable to an array to pile up in the loop and later on use them separately
$array += $combinedVariable

# Concatenated using +$concatenatedString = $hello + " "  + $world  +  "!"
# Using embedded variables$embeddedString = "$hello $world!"
# Using string.Format powershell version (-f for format)$formattedString = "{0} {1}!" -f $hello, $world

#How-To: Concatenate in PowerShell
$demo = 'abc' + 'def'
$demo
# abcdef

#Concatenate string variables:
$string1 = 'abc'
$string2 = 'def'
$string1 + ", " + $string2
# abc, def

$text = 'Hello'
$text += 'world'
$text
# Helloworld

#For longer expressions this can be spread over several lines with line breaks:

$string1 + ", " + $string2
# abc, def

#Concatenate numbers with strings:
$int1 = 42
$string2 = 'def'
$int1 + ", " + $string2
# Cannot convert value "," to type "System.Int32". Error: "Input string was not in a correct format."

#The expression above is evaluated from left to right so converting the string to an integer fails, if we swap around the order they will both convert to a string without error:
$string2 + ", " + $int1
# def, 42

#String substitution - surround the whole expression in quotes, everything is evaluated as a string:
”$int1, $string2”
# 42, def

# String Substitution has one important limitation: PowerShell will identify each variable in the expression by matching characters, that are legal for a $variable name, as soon as the first non-legal character is found (a space, comma or full stop) that matching stops.
# This means that a subexpression like $object.property will be read as just $object

#Explicit sub-expression expansion:
"$($int1), $($string2)"
# 42, def

#Single or Double quoted strings can both be expanded:
$sq = 'a single quoted string'
$dq = "a double quoted string"
"$sq--$dq"
# a single quoted string--a double quoted string

#Within a single quoted expression no variables are expanded:

'$sq--$dq'
# $sq--$dq

# Substitution with the -f operator


PS C:\> "{0}--{1}" -f $sq,$dq
a single quoted string--a double quoted string


Join with the -join operator:


PS C:\> $sq,$dq -join ", "
a single quoted string, a double quoted string


A further nuance that often catches people out is that Write-host by default adds a single space separator between items, to remove that you must specify an empty string '' as the separator:


PS C:\> $one = 'one'
PS C:\> $two = 'two'
PS C:\> write-host $one $two
one two




PS C:\> write-host $one $two -separator ''
onetwo


Using the .Net concat() method:


PS C:\batch> [System.String]::Concat("abc","def", "ghi")
abcdefghi


An alternative concatenation method is to use a StringBuilder .Net object, this has the advantage of being much faster which may be important when working with long strings or repeatedly in a loop.


$stringbuilder = New-Object -TypeName System.Text.StringBuilder
$null = $stringbuilder.Append("Hello")
$null = $stringbuilder.Append("World")
$stringbuilder.ToString()

# Get Date and Convert it to a Frendly version for File Titling Plus USERNAME like this "dokeeffe-06-01-2020-16-40-41.csv"
 $d = (Get-Date).ToString().Replace(' ','-').Replace(':','-').Replace('/','-')
            $1 = quser 
             [string]$2 = $1 -match 'console'
            $3= $2.TrimStart().Split(' ')[0]
            $File  = $3 + '-' + $d+ '.csv'
            Write-Verbose $File -Verbose
# The Export using something like | Export-Csv -Path "d:\$file.csv" -NoTypeInformation

$Colours = @"

█▀▀ █▀▀█ █░░ █▀▀█ █░░█ █▀▀█ █▀▀
█░░ █░░█ █░░ █░░█ █░░█ █▄▄▀ ▀▀█
▀▀▀ ▀▀▀▀ ▀▀▀ ▀▀▀▀ ░▀▀▀ ▀░▀▀ ▀▀▀
"@

function Show-Colors( ) {
  $colors = [Enum]::GetValues( [ConsoleColor] )
  $max = ($colors | foreach { "$_ ".Length } | Measure-Object -Maximum).Maximum
  foreach( $color in $colors ) {
    Write-Host (" {0,2} {1,$max} " -f [int]$color,$color) -NoNewline
    Write-Host "$color" -Foreground $color
  }
}

$colors = [enum]::GetValues([System.ConsoleColor])
Foreach ($bgcolor in $colors){
    Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
    Write-Host " on $bgcolor"
}

$Split =
 @"
█▀▀ █▀▀█ █░░ ░▀░ ▀▀█▀▀
▀▀█ █░░█ █░░ ▀█▀ ░░█░░
▀▀▀ █▀▀▀ ▀▀▀ ▀▀▀ ░░▀░░
"@

#Split a string by the - character:

"abc-def" -split "-"
#abc
#def

Split a string by the \ character, note this has to be doubled:

PS C:\> "abc\def" -split "\\"
abc
def

Split a string by a space:

PS C:\> $demo = "abc def"
PS C:\> $demo.split()
abc
def

# Chain .split() to split by multiple characters, here " and ' :

$demo = "abc""def'ghi"
PS C:\> $demo.Split("""").Split("'")
abc
def
ghi
# Split up a Mac address and convert each number:

$MacAddress ="12-34-56-78-9A-BC"
($MacAddress.split('-') | foreach {[byte] ('0x' + $_)} )

18
52
86
120
154
188

# Split up the pathext environment variable:

$env:pathext -split ';'
$env:pathext -split ';' -replace '\.','*.'

# When using Split() against a text file or the string output of a command, you are dealing with an array. PowerShell automatically converts each line of the text file to an element of the array. This makes the file easy to work with, but you do have to specify the line that you want to split.

$demo = get-content C:\demo\sales.txt
$demo[2].split()

# Or split all the lines and match the tokens you want to retrieve:

$data = get-content C:\demo\sales.txt
$data | foreach {
   $items = $_.split("=")
   if ($items[0] -eq "ProductA"){Echo $items[1]}

"1,2,3" | foreachobject.{$_ -spilt ","}

#############################################################################################################################
#Menus
$title    = 'Reducing VMs Per Cloud'
$question = 'Are you sure you want to proceed?'
$choices  = '&Yes', '&No'
$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {
    Write-Host 'confirmed'
} else {
    Write-Host 'cancelled'
}

 #or

$confirmation = Read-Host "Do you want to reduce VMs to one per Cloud Y or N"
if ($confirmation -eq 'y') {
   Write-Host 'Reducing to one VM per Cloud'
} else {
    Write-Host 'No Reducing will occur'
}


#############################################################################################################################

Get-Process | Out-File C:\temp\ProcessesAppended.txt –append
Start-Sleep -S 3
Start-Sleep -Milliseconds 1000
pause
$endTime = Get-Date
Write "Done at $endTime.  Time for the full run was: $(New-TimeSpan $startTime $endTime)."
Stop-Transcript
