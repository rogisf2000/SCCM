<#
==========================================
 Install FireFox
==========================================
 .
 Author: Chris Bond
 Date: 10/16/2018
 .
 Script Details:
 --------------
 This script will:
 silently install or upgrade Firefox
 via the override.ini file, disables the Import wizard
 via the local-settings.js file, accepts new default preferences
 via the mozilla.cfg file, trusts Windows-installed CAs (locked pref)
 via the mozilla.cfg file, disables the Pocket extension (modified default)
 via the mozilla.cfg file, disables SHIELD browser experiements (modified default)
 via the mozilla.cfg file, enables auto updates (modified default)
 via the mozilla.cfg file, disables default browser check (modified default)
 via the mozilla.cfg file, disables "know your rights" screen (modified default)
 via the mozilla.cfg file, disables version update tab (modified default)
 via the mozilla.cfg file, sets homepage to https://search.yojoe.local/ (modified default)
 via the mozilla.cfg file, disables nag to install Flash (modified default)
 via the mozilla.cfg file, disables health reporter (modified default)
 via the mozilla.cfg file, disables telemetry (modified default)
 via the mozilla.cfg file, disables crash reporter (modified default)
 .
===========================================
#>

$Installer = "Firefox Setup 64.0.2.exe"
$InstallDir = ${env:ProgramFiles}

Start-Process .\$Installer -Wait -ArgumentList '-ms'
copy-item '.\override.ini' -Destination "$InstallDir\Mozilla Firefox\browser\" -force
copy-item '.\mozilla.cfg' -Destination "$InstallDir\Mozilla Firefox\" -force
copy-item '.\local-settings.js' -Destination "$InstallDir\Mozilla Firefox\defaults\pref\" -force

