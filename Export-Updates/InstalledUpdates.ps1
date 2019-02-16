#map network drive
$username = "bd\svc_sccmNA"
$password = "B1O@IfntZrC@"
$date = get-date -Format yyyy_MM_dd
#ID's and Desc
$KBs = get-hotfix | select-object HotfixID,Description

#SerialNumber
$serialNumber = gwmi win32_bios
$serialNumber = $serialnumber.serialnumber
$FileName = "InstalledUpdates.csv"
$KBArray = @()

$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd
new-psdrive -name T -psprovider FileSystem -root "\\pa-okc-sccm-01\osdlogs$\bitlocker" -Credential $creds

foreach ($KB in $KBs){
	$tempObject = New-Object -TypeName psobject
    $tempObject | Add-Member -MemberType NoteProperty -Name "SerialNumber" -Value $serialNumber -PassThru `
    |Add-Member -MemberType NoteProperty -Name "Description" -Value $kb.description -PassThru `
    |Add-Member -MemberType NoteProperty -Name "HotfixID" -Value $kb.HotfixID -PassThru `
	|Add-Member -MemberType NoteProperty -Name "Date" -Value $date -PassThru `
    | Out-Null
                      
$KBArray += $tempObject
 } 

$KBArray | Export-Csv -filePath "t:\$filename" -NoTypeInformation -Append -Delimiter "`t"

Remove-PSDrive -Name T