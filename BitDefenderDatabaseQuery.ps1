# Monitoring with PowerShell: Monitoring Bitdefender status
# https://www.cyberdrain.com/monitoring-with-powershell-monitoring-bitdefender-status/

if (!$SQLLite) {
    Invoke-WebRequest -uri "https://cyberdrain.com/wp-content/uploads/2021/02/System.Data.SQLite.dll" -UseBasicParsing -OutFile "C:\Programdata\System.Data.SQLite.dll"
}
 
try {
    add-type -path "C:\Programdata\System.Data.SQLite.dll"
}
catch {
    Write-Host "Could not load database components."
    #exit 1
}
$con = New-Object -TypeName System.Data.SQLite.SQLiteConnection
$con.ConnectionString = "Data Source=C:\Program Files\Bitdefender\Endpoint Security\Quarantine\cache.db"
$con.Open()
$sql = $con.CreateCommand()
$sql.CommandText = "select * from entries"
$adapter = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $sql
$data = New-Object System.Data.DataSet
[void]$adapter.Fill($data)
$sql.Dispose()
$con.Close()
 
$CurrentQ = foreach ($row in $Data.Tables.rows) {
    [PSCustomObject]@{
        Path               = $row.path
        Threat             = $row.threat
        Size               = $row.Size
        'Quarantined On'   = [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($row.quartime))
        'Last accessed On' = [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($row.acctime))
        'Last Modified On' = [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').AddSeconds($row.modtime))
    }
}
 
if ($CurrentQ) {
    write-host $CurrentQ
}
else {
    write-host "Healthy - No infections found."
}

# Scan Result monitoring

$LastScanResult = (get-childitem "C:\Program Files\Bitdefender\Endpoint Security\logs\system" -Recurse -Filter "*.xml" | Sort-Object -Property LastWriteTime | Select-Object -last 1 | get-content -raw)
 
if (!$LastScanResult) {
    write-host "Unhealthy - could not retrieve last scan result."
    exit 1
}
$ScanResults = [PSCustomObject]@{
    Scanned       = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.Scanned | measure-object -sum).Sum
    Infected      = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.Infected | measure-object -sum).Sum
    suspicious    = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.suspicious | measure-object -sum).Sum
    Disinfected   = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.Disinfected | measure-object -sum).Sum
    Deleted       = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.deleted | measure-object -sum).Sum
    Moved         = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.moved | measure-object -sum).Sum
    Moved_reboot  = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.moved_reboot | measure-object -sum).Sum
    Delete_reboot = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.delete_reboot | measure-object -sum).Sum
    Renamed       = ($LastScanResult.ScanSession.ScanSummary.TypeSummary.renamed | measure-object -sum).Sum
}
 
$Alertresult = $ScanResults | Select-Object -Property * -ExcludeProperty Scanned | Where-Object { $_.psobject.properties.value -gt 0 }
 
if ($Alertresult) {
    write-host "Unhealthy - Last scan found issues"
    $ScanResults
}
else {
    write-host "Healthy - Last scan found no issues."
    $ScanResults
}