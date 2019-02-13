$SecureString = ConvertTo-SecureString "3948576" -asPlainText -force
Add-BitlockerKeyProtector -MountPoint "C:" -TPMAndPinProtector -Pin $SecureString
