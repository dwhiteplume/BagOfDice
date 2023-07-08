function Get-BoDDieRoll {
    <#
    .PARAMETER Sides
    The number of side on the die to roll. Must be a positive integer.
    .EXAMPLE
    Get-BoDDieRoll -Sides 6
    Returns 1 to 6
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
        [int32]$Sides
    )
    $Die = 1..$Sides
    Write-Verbose "...rolling 1d$Sides..."
    $Roll = $($Die | Get-Random)
    Write-Verbose $Roll
    Write-Output $Roll
}