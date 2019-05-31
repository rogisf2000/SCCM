$SecureString = ConvertTo-SecureString "987456" -asPlainText -force
Add-BitlockerKeyProtector -MountPoint "C:" -TPMAndPinProtector -Pin $SecureString
