#map network drive
$username = "bd\svc_sccmNA"
$password = "B1O@IfntZrC@"
$date = get-date -Format yyyy_MM_dd
#ID's and Desc
$Description = Get-HotFix | Select-Object Description
$HotfixID = Get-HotFix | Select-Object HotfixID
#SerialNumber
$serialNumber = gwmi win32_bios
$serialNumber = $serialnumber.serialnumber
$FileName = "InstalledUpdates.csv"

$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd
new-psdrive -name T -psprovider FileSystem -root "\\pa-okc-sccm-01\osdlogs$\bitlocker" -Credential $creds

$tempObject = New-Object -TypeName psobject
    $tempObject | Add-Member -MemberType NoteProperty -Name "SerialNumber" -Value $serialNumber -PassThru `
    |Add-Member -MemberType NoteProperty -Name "Description" -Value $Description -PassThru `
    |Add-Member -MemberType NoteProperty -Name "HotfixID" -Value $HotfixID -PassThru `
    | Out-Null

$KBArray += $tempObject

#net use t: \\pa-okc-sccm-01\osdlogs$\bitlocker /u:bd\svc_sccmNA B1O@IfntZrC@
$KBArray | Export-Csv -filePath "t:\$filename" -NoTypeInformation -Append -Delimiter "`t"

Remove-PSDrive -Name T