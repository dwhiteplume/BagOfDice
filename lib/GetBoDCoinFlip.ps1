
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
    .PARAMETER ResultType
    You can choose from Coin, Binary, or Boolean
    .EXAMPLE
    Get-BoDCoinFlip -ResultType Coin

    Returns 'Heads' or 'Tails'

    IsPublic : True
    IsSerial : 
    Name     : String
    BaseType : System.Object

    .EXAMPLE
    Get-BoDCoinFlip -ResultType Binary

    Returns 0 or 1

    IsPublic : True
    IsSerial : 
    Name     : Int32
    BaseType : System.ValueType
    .EXAMPLE
    Get-BoDCoinFlip -ResultType Boolean

    Returns True or False

    IsPublic : True
    IsSerial : 
    Name     : Boolean
    BaseType : System.ValueType
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
