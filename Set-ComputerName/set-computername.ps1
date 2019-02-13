$ComputerModel = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object Model).Model
$SerialNumber = (Get-WmiObject -Class Win32_BIOS | Select-Object SerialNumber).SerialNumber

$OSDComputerName = $SerialNumber
$OSDComputerName = $OSDComputerName -replace '\s','' #Remove whitespace if name has spaces as is the case with VMware

if ($OSDComputerName.length -gt 15){
    $OSDComputerName = $OSDComputerName.substring(0,15)
}
$TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
$TSEnv.Value("OSDComputerName") = "$OSDComputerName"

<#
# Workstations
if (($ComputerModel -match "Precision") -OR ($ComputerModel -match "Optiplex")) {
    $OSDComputerName = $SerialNumber + "-" + "WS"
    $TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
    $TSEnv.Value("OSDComputerName") = "$OSDComputerName"
}

# Laptops
if ($ComputerModel -match "Latitude") {
    $OSDComputerName = $SerialNumber + "-" + "LAP"
    $TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
    $TSEnv.Value("OSDComputerName") = "$OSDComputerName"
}
#>