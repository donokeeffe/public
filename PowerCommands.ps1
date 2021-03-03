Quick TakeControl Powershell Cmds

# Delaying running commands until a certain time.
start-sleep ((get-date "18:30pm") - (get-date)).TotalSeconds;Set-Service -Name "Backup Service Controller" -StartupType Automatic; Get-Service -Name "Backup Service Controller" | Start-Service
Set-Service -Name "Backup Service Controller" -StartupType Automatic; Get-Service -Name "Backup Service Controller" | Start-Service

#Uptime
Get-CimInstance Win32_OperatingSystem | Select-Object LastBootUpTime
(gcim win32_operatingsystem).LastBootUpTime.Date.DayofWeek;
(gcim win32_operatingsystem).LastBootUpTime

#Discover Processes for Disk IO
Get-WmiObject -class Win32_PerfFormattedData_PerfProc_Process  | Select-Object name,IDprocess,IODataBytesPersec | sort -Des IODataBytesPersec | select -First 6

# File Disk IO
get-counter "\PhysicalDisk(*)\% Idle Time" –Continuous #resmon
Get-Counter -ListSet *process | select counter -ExpandProperty Counter
Get-Counter '\Process(*)\IO Read Bytes/sec' | select -ExpandProperty Countersamples |? {$_.cookedvalue -ge '20'} | Sort-Object -Descending Cookedvalue

# STOP and DISABLE A SERVICE
# Get-Service -Name "Backup Service Controller" | Restart-Service -force;
Get-Service -Name "Backup Service Controller" | Stop-Service -force; Set-Service -Name "Backup Service Controller" -StartupType Disabled
Get-Service -Name "Backup Service Controller" | select -property name,starttype,Status

Set-Service -Name "Backup Service Controller" -StartupType Automatic; Get-Service -Name "Backup Service Controller" | Start-Service
Get-Service -Name "Backup Service Controller" | select -property name,starttype,Status

# Get StartType (only if PS v5) using $PSVersionTable
Get-Service -Name "Backup Service Controller" | select -property name,starttype,Status
(Get-Service 'Backup Service Controller').StartType

# What Software on on a Remote Computer
Invoke-Command -ComputerName $ENV:ComputerName {(Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* ).displayname}

# What Software versions on on a Computer
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | 
 Where { $_.DisplayName -match "Citrix Virtual" -or $_.DisplayName -match "Citrix XenDesktop 7" -or $_.DisplayName -match "Citrix 7." } | 
  Select DisplayName, Publisher, InstallDate 

Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*  | select DisplayName | sort DisplayName
# 32-BIT - HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
# 64-BIT - HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*

#Finding Software Via both Registry and WMI
(Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -match "SNMP" 
(Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* ).displayname | Where-Object {$_.displayname -like "Citrix"}
Get-CimInstance -Class Win32_Product | Where-Object {$_.Name -Match "SNMP"} | Select-Object Name,Caption,Vendor,Version | Sort Name
(Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -match "Adobe" 

# Remote In to get Software
$user = "domain\username"
$Pass = "securepassword" | ConvertTo-SecureString -AsPlainText -Force
$server = "server.fqdn"
$Creds = New-Object System.Management.Automation.PSCredential -ArgumentList ($user,$Pass)
Invoke-Command -ComputerName $server {Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*  | select DisplayName | sort DisplayName} -Credential $Creds

# What Feature On A computername
Get-WindowsFeature -computername $hostname | Where-Object {$_.Installed -match $True -and $_.name -eq "NPAS"} | Select Name

#Last Modified files
Get-ChildItem -Force -Recurse -File -Path "H:\PowerShell Repository" -ErrorAction SilentlyContinue | Where-Object { $_.CreationTime.Date -lt (Get-Date).Date } | Sort CreationTime -Descending | Select-Object -First 10 CreationTime,FullName | Format-Table -Wrap 

# Outlook Date
To insert current date in your email messages, please press the Alt + Shift + D keys at the same time.
To insert current time in your email messages, please press the Alt + Shift + T keys at the same time.

# Disk Space
Get-WMIObject Win32_LogicalDisk -Filter "DriveType=3" -Computer . | Select SystemName, DeviceID, VolumeName, @{Name="Total Size (GB)"; Expression={"{0:N1}" -F ($_.Size/1GB)}}, @{Name="Free Space (GB)"; Expression={"{0:N1}" -F ($_.Freespace/1GB)}}, @{Name="Free Space %"; Expression={"{0:N1}" -F (($_.Freespace/$_.Size)*100)}} | FT -AutoSize

# MSX Whitepace
Get-MailboxDatabase -Status | select Name,DatabaseSize,AvailableNewMailboxSpace,lastfullbackup

# Reformated Nice Counters
$ctrs='\cluster CSV file system(*)\IO Read Bytes/sec'
$data = get-counter -Counter $ctrs -ComputerName $env:COMPUTERNAME -SampleInterval 1 -MaxSamples 1
$results = $data | Select -expandproperty CounterSamples | Select Timestamp,InstanceName,CookedValue,
@{Name="Counterset";Expression={$_.Path.Split("\")[4]}},
@{Name="Counter";Expression={$_.Path.Split("\")[5]}}
$results  | sort CookedValue -Descending | select -First 10 | FT -AutoSize

# Event Log Esstentials 
$ErrorActionPreference="Silentlycontinue"
Get-WinEvent -ListLog * | where { $_.logname -match 'Citrix'}
Get-WinEvent  -FilterHashtable @{LogName='Citrix-XenDesktop-BrokerMonitor/Operational'}
Write-EventLog –LogName "Citrix Delivery Services" –Source “Citrix Store Service” –EntryType Error –EventID 0 –Message “This is a test message.”
Get-EventLog -LogName "Citrix Delivery Services" -EntryType Error -Source "Citrix Store Service" | Select Instanceid,Source,TimeW*,Message -first 10 | FL

# Remove Profiles
Get-WmiObject -Class Win32_UserProfile | Where-Object {$_.Special -ne 'Special'} | Select-Object LocalPath, Loaded
# Get-WmiObject -Class Win32_UserProfile | Where-Object {$_.LocalPath -eq "c:\users\vbu"} | Remove-WmiObject

# Find VM from IPv4Addresses
Get-SCVirtualMachine | Get-SCVirtualNetworkAdapter | ? IPv4Addresses -eq 10.1.1.74

# Filter in or out certain lines in a file by a String
get-content Z:\Desktop\RawData.txt | select-string -pattern 'syn' -AllMatches <#-notmatch#> | Out-File  Z:\Desktop\FilteredData.txt

#Is Firewall On
Get-NetFirewallProfile | Select Name,Enabled

# Get Servers and Change Maintennnce Value
Get-BrokerMachine -MachineName * -DesktopGroupName * | Select MachineName,powerstate,InMaintenanceMode,RegistrationState,sessioncount | FT -AutoSize
Write-Host "## i.e. Set-BrokerMachineMaintenanceMode -InputObject domain\servername $FALSE"

# Page File Status
Get-PageFileInfo Server1,Server2,Server3 | Format-Table
(Get-WmiObject -Class Win32_Pagefileusage) | fl *
(Get-WmiObject -Class Win32_PerfRawData_PerfOS_Memory)

#DHCP
Add-DhcpServerv4Reservation -ScopeId 10.10.10.0 -IPAddress 10.10.10.8 -ClientId "F0-DE-F1-7A-00-5E" -Description "Reservation for Printer"
