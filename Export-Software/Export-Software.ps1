#map network drive
$username = "bd\svc_sccmNA"
$password = "B1O@IfntZrC@"
$date = get-date -Format yyyy_MM_dd
$serialNumber = gwmi win32_bios
$serialNumber = $serialnumber.serialnumber
$serialNumber = $serialNumber -replace '\s','' #Remove whitespaces
$FileName = "Software.csv"
$FullName = "T:\$FileName"
$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd
new-psdrive -name T -psprovider FileSystem -root "\\pa-okc-sccm-01\osdlogs$\bitlocker" -Credential $creds

$SoftwareArray = @()

foreach ($s in $software) {
    $tempObject = New-Object -TypeName psobject
    $tempObject | Add-Member -MemberType NoteProperty -Name "Name" -Value $s.name -PassThru `
    |Add-Member -MemberType NoteProperty -Name "Version" -Value $s.version -PassThru `
    |Add-Member -MemberType NoteProperty -Name "SerialNumber" -Value $serialNumber -PassThru `
	|Add-Member -MemberType NoteProperty -Name "Date" -Value $date -PassThru `
    | Out-Null
    $SoftwareArray += $tempObject
}

$SoftwareArray | Export-Csv -Path $fullname -NoTypeInformation -Delimiter "`t" -Append

Remove-PSDrive -Name T