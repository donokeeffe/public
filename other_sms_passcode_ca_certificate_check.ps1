function Transform-Certificate {
[CmdletBinding()]
    param(
 [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
 [Security.Cryptography.X509Certificates.X509Certificate2]$cert
 )
    process {
        $temp = $cert.Extensions | ?{$_.Oid.Value -eq "1.3.6.1.4.1.311.20.2"}
 if (!$temp) {
            $temp = $cert.Extensions | ?{$_.Oid.Value -eq "1.3.6.1.4.1.311.21.7"}
 }
        $cert | Add-Member -Name Template -MemberType NoteProperty -Value $temp.Format(1) -PassThru
 }
}

$today = get-date
$7dayshence = $today.AddDays(7)

$certs = get-childitem cert:\localmachine\root | Transform-Certificate -ea silentlycontinue | where Template -match "CA"| where FriendlyName -eq "" | select-object DnsNameList,NotAfter | sort NotAfter

$expiringcerts = $certs | where NotAfter -lt $7dayshence | where NotAfter -gt $today
$expiredcerts = $certs | where NotAfter -lt $today

if($expiringcerts) {
	echo "The following CA certificates will expire within 7 days.  Please replace before then." $expiringcerts
		if($expiredcerts) {
			echo "The following CA certificates have expired and must be replaced with a renewed certificate.  If already replaced then the old certificate must be removed." $expiredcerts
		}
	exit 2000
}

if($expiredcerts) {
	echo "The following CA certificates have expired and must be replaced with a renewed certificate.  If already replaced then the old certificate must be removed." $expiredcerts
	exit 2001
}

exit 0