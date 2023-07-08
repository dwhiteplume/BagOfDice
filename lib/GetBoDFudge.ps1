
<#PSScriptInfo

.VERSION 1.0

.GUID 3e85ce14-3a05-4d04-9247-66b9d7e0aff2

.AUTHOR Darius Whiteplume

.PROJECTURI
https://dwhiteplume.github.io/BagOfDice/

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.DESCRIPTION 
 Rolls a single Fudge dice to produce values of -1, 0, or 1. 

#> 
[CmdletBinding()]
Param()

function Get-BoDFudge {
    <#
    .SYNOPSIS
    Returns a value between -1 and 1.
    .DESCRIPTION
    Rolls a single Fudge Die, whi
    .AUTHOR Darius Whiteplume
    .PROJECTURI https://dwhiteplume.github.io/BagOfDice/
    .EXAMPLE
    Get-BoDFudge
    #>
    [CmdletBinding()]
    param()
    $Range = -1..1
    Write-Output $($Range | Get-Random)
}
