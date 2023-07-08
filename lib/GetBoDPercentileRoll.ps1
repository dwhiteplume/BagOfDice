function Get-BoDPercentileRoll {
    <#
    .SYNOPSIS
    Rolls 2d10 and returns an integer.
    .PARAMETER Zero
    Allows result to be 0 when 00 is rolled. Otherwise 00 returns 100.
    .EXAMPLE
    Get-BoDPercentileRoll
    Returns 1 to 100
    .EXAMPLE
    Get-BoDPercentileRoll -Zero
    Returns 0 to 99
    #>
    [CmdletBinding()]
    param(
        [switch]$Zero
    )
    $Tens = Get-BoDDieRoll -Sides 10
    Write-Verbose "Tens = $Tens"
    $Ones = Get-BoDDieRoll -Sides 10
    Write-Verbose "Ones = $Ones"
    if ($Tens -eq 10) {
        $Tens = 0
    }
    if ($Ones -eq 10) {
        $Ones = 0
    }
    [string]$Result = "$Tens" + "$Ones"
    Write-Verbose "Result = $Result"
    if ($Result -eq '00') {
        if ($Zero) {
            $Result = 0
        } else {
            $Result = 100
        }
    }
    $Result = [int32]$Result
    Write-Output $Result
}