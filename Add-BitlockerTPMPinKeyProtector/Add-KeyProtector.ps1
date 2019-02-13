$SecureString = ConvertTo-SecureString "3948576" -asPlainText -force

Add-BitlockerKeyProtector -MountPoint "C:" -TPMAndPinProtector -Pin $SecureString
add-bitlockerkeyProtector -mountPoint "C:" -RecoveryPasswordProtector
Resume-BitLocker -MountPoint "C:"

$BTL = get-BitLockerVolume -mountPoint "C:"
Backup-bitlockerKeyProtector -mountPoint "C:" $Btl.keyprotector[1].keyprotectorId