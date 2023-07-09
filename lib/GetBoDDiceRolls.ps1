function Get-BoDDiceRolls {
    <#
    .PARAMETER Dice
    The number of dice to roll. Must be a positive integer.
    .PARAMETER Sides
    The number of sides on the die to roll. Must be a positive integer.
    .EXAMPLE
    Get-BoDDiceRolls -Dice 3 -Side 6
    Returns an object like:

    DiceRolls         : {4, 5, 4}
    Count             : 3
    Average           : 4.33333333333333
    Sum               : 13
    Maximum           : 5
    Minimum           : 4
    StandardDeviation : 0.577350269189626
    Property          : 
    .EXAMPLE
    Get-BoDDiceRolls 3 6
    Returns 3 to 18
    #>
    [CmdletBinding()]
    param(
        [ValidateScript({
            if ($PSItem -gt 0) {
                $true
            } else {
                throw "Value must be greater than zero."
            }
        })]
        [Parameter(Position = 0, Mandatory = $true)]
        [int32]$Dice,
        [ValidateScript({
            if ($PSItem -gt 0) {
                $true
            } else {
                throw "Value must be greater than zero."
            }
        })]
        [Parameter(Position = 1, Mandatory = $true)]
        [int32]$Sides
    )
    Write-Verbose $("Rolling $Dice" + 'd' + "$Sides")
    $Results = New-Object "System.Collections.Generic.List[int32]"
    $Rolls = 1..$Dice
    $Rolls.ForEach({
        $Results.Add($(Get-BoDDieRoll -Sides $Sides))
    })
    $Statistics = $Results | Measure-Object -Sum -Average -Maximum -Minimum -StandardDeviation
    $Statistics.Property = $MyInvocation | Select-Object -ExpandProperty Line
    $Statistics | Add-Member -MemberType NoteProperty -Name DiceRolls -Value $Results
    $Statistics | Get-Member | Where-Object -Property MemberType -eq Property | Select-Object -ExpandProperty Name | ForEach-Object { Write-Verbose "$PSItem = $($Statistics.$PSItem)" }
    Write-Output $Statistics
}
