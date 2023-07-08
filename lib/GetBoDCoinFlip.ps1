
<#PSScriptInfo

.VERSION 1.0

.GUID 2d9a2bb9-05ff-494a-a78c-9f9d573e257f

.AUTHOR Darius Whiteplume

.PROJECTURI https://dwhiteplume.github.io/BagOfDice/

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<# 

.DESCRIPTION 
 Performs a coin flip. Can return heads or tails, 0 or 1, and true or false. 

#> 
Param()

function Get-BoDCoinFlip {
    <#
    .SYNOPSIS
    Returns a coin 50/50 result.
    .DESCRIPTION
    Performs a coin flip. Can return heads or tails, 0 or 1, and true or false. 
    .AUTHOR Darius Whiteplume
    .PROJECTURI https://dwhiteplume.github.io/BagOfDice/
    .EXAMPLE
    Get-BoDCoinFlip -ResultType Coin
    .EXAMPLE
    Get-BoDCoinFlip -ResultType Binary
    .EXAMPLE
    Get-BoDCoinFlip -ResultType Boolean
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Coin','Binary','Boolean')]
        [string]$ResultType
    )
    switch ($ResultType) {
        'Binary' {
            $Range = @(0,1)
            break
        }
        'Boolean' {
            $Range = @($true,$false)
            break
        }
        default {
            $Range = @('Heads','Tails')
        }
    }
    $Result = $Range | Get-Random
    Write-Output $Result
}
