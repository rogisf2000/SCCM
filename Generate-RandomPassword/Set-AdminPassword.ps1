Function GET-Temppassword() {

Param(

[int]$length=10,

[string[]]$sourcedata

)

 

For ($loop=1; $loop –le $length; $loop++) {

            $TempPassword+=($sourcedata | GET-RANDOM)

            }

return $TempPassword

}

$ascii=$NULL;For ($a=33;$a –le 126;$a++) {$ascii+=,[char][byte]$a }

$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment

$tsenv.Value("PasswordString") = GET-Temppassword –length 16 –sourcedata $ascii
