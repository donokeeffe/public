# SNMP  https://techexpert.tips/powershell/powershell-snmp-communication-example/
# iDRAC https://www.logicmonitor.com/support/monitoring/server-operations-hardware/dell-hardware-health
# IPMI  https://www.logicmonitor.com/support/monitoring/server-operations-hardware/ipmi-supportSupport - All that is required is that IPMI be enabled on the hosts, and IPMI credentials be set for the ipmi.user and ipmi.pass properties located on the resources being monitored within LogicMonitor

# NOTE Adding in SNMP should add Dell DataSource also

$destination="sc-lon1-vh01"
ping $destination
tracert $destination

test-netconnection $destination -port 161

# Troubleshoot SNMP by running this on the destination server to find current commununtys, Permitted Managers.
Get-ChildItem -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters' -Recurse

# Hardware SNMP Query
$SNMP = New-Object -ComObject olePrn.OleSNMP
$snmp.open('sc-lon1-vh01','public',2,1000)
$snmp.get('.1.3.6.1.2.1.1.1.0')

# Tree Search SNMP Query
$SNMP = New-Object -ComObject olePrn.OleSNMP
$SNMP.open('sc-lon1-vh01','public',2,1000)
$SNMP.GetTree(".1.3.6.1.2.1.2.2.1.2")
 
# Uptime SNMP Query
$SNMP = New-Object -ComObject olePrn.OleSNMP
$SNMP.open('sc-lon1-vh01','public',2,1000)
$RESULT = [TimeSpan]::FromSeconds(($SNMP.Get(".1.3.6.1.2.1.1.3.0"))/100)
$SNMP.Close()
$RESULT

# Tree Search to Grid with OID;'s
$SNMP = New-Object -ComObject olePrn.OleSNMP
$SNMP.open('sc-lon1-vh01','public',2,1000)
$SNMPDATA=$SNMP.GetTree(".1.3.6.1.2.1.2.2.1.2")
$RESULT=@()
for($i=0;$i-lt $SNMPDATA.length/2;$i++){$RESULT+=[pscustomobject]@{"SNMP ID"=$SNMPDATA[0,$i];"SNMP Value"=$SNMPDATA[1,$i];OID=($snmp.OIDFromString(($SNMPDATA[0,$i])) -join ".")} }
$RESULT | out-gridView

<#
Configuring the Firewall to Allow SNMP Requests
To configure the Windows Firewall to allow SNMP requests on a Windows 2012 server or Windows 2016 Server, perform the following steps:
In the Start menu search bar, enter "firewall" to open a Windows Firewall with Advanced Security window.
In the left pane, click Inbound Rules.
Locate the two SNMP Service (UDP In) rules.
If one or both of the rules is not enabled, right-click on the rule and then select Enable Rule:
#>

PowerShell.exe -NoLogo -NonInteractive -InputFormat text -OutputFormat text -Command "& {$Password = ConvertTo-SecureString '******' -AsPlainText -Force;$Credential = New-Object System.Management.Automation.PsCredential 'Backup', $Password;Get-WmiObject -NameSpace "ROOT\CIMV2" -Class Win32_PerfRawData_PerfOS_System -ComputerName "10.238.4.30" -Credential $Credential | Format-List }"


