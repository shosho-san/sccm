<#
.SYNOPSIS
Check-DPreplication.ps1 - SCCM DP Server Health Check Script.

.DESCRIPTION 
ce Script permet d'effectuer les 1ers tests localement la bonne santÃ© d'un point de distribution SCCM.
Il vérifie:
* l'accès au site IIS
* Si le serveur central est membre du groupe "admin local" du DP
* S'il reste de l'espace disque libre sur les disques System et DATA

En cas d'anomalie, il envoi un email de notification

.LINK

.NOTES
Written by: Guillaume DUPRE


Change Log
V1.00, 08/06/2018 - Initial version
#>

#requires -version 3
function script:Test-SCCMisPresent
{
  <#
    .SYNOPSIS
    Verify if the server if member of the local admin groups

    .DESCRIPTION
    get information about the the server in parameter in the group S-1-5-32-544, return true or false

    .PARAMETER SCCMserver
    Name of the server to check

    .EXAMPLE
    Test-SCCMisPresent -SCCMserver sccm01
    return true of sccm01 is member of local admin group
  #>

  param([Parameter(Mandatory,HelpMessage='Name of the server')][string]$SCCMserver)
  Import-Module -Name microsoft.powershell.localaccounts
  [bool](Get-LocalGroupMember -SID S-1-5-32-544 -Member $SCCMserver -ErrorAction SilentlyContinue)
}

function Test-Freespace
{
  <#
    .SYNOPSIS
    Short Description
    .DESCRIPTION
    Detailed Description
    .EXAMPLE
    Test-Freespace
    explains how to use the command
    can be multiple lines
    .EXAMPLE
    Test-Freespace
    another example
    can have as many examples as you like
  #>
  param
  (
    [Parameter(Position=0)]
    [string]$Freespace = '10000000000'
  )
  
    if ((Get-WmiObject -Class win32_logicaldisk  -Filter 'Drivetype=3' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FreeSpace) -lt $Freespace)
  {$true}
  else
  {$false}
}



Test-SCCMisPresent -SCCMserver csiadmsrv01

test-fre
