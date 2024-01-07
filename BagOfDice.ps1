$BagOfDice = [pscustomobject]@{}

$BagOfDice | Add-Member `
    -MemberType NoteProperty `
    -Name Statistics `
    -Value $null

$BagOfDice | Add-Member `
    -MemberType ScriptMethod `
    -Name DieRoll `
    -Value {
        [CmdletBinding()]
        param(
            [int32]$Sides
        )
        $Die = 1..$Sides
        $Roll = $($Die | Get-Random)
        Write-Output $Roll
    }

$BagOfDice | Add-Member `
    -MemberType ScriptMethod `
    -Name DiceRolls `
    -Value {
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
        $this.Statistics = $null
        $Results = New-Object "System.Collections.Generic.List[int32]"
        $Rolls = 1..$Dice
        $Rolls.ForEach({
            $Results.Add($($this.DieRoll($Sides)))
        })
        $Statistics = $Results | Measure-Object -Sum -Average -Maximum -Minimum -StandardDeviation
        $Statistics.Property = $MyInvocation | Select-Object -ExpandProperty Line
        $Statistics | Add-Member -MemberType NoteProperty -Name DiceRolls -Value $Results
        $Statistics | Get-Member | Where-Object -Property MemberType -eq Property | Select-Object -ExpandProperty Name | ForEach-Object { Write-Verbose "$PSItem = $($Statistics.$PSItem)" }
        $Report = $Statistics | `
            Select-Object `
            -Property `
                DiceRolls,
                Count,
                Average,
                Sum,
                Maximum,
                Minimum,
                StandardDeviation,
                @{
                    Label = 'Request'
                    Expression = { 
                        $PSItem.Property 
                    }
                },
                @{
                    Label = 'StandardNotation'
                    Expression = {"$($Dice)d$($Sides)"
                }
            }
        $this.Statistics = $Report
        Write-Output $Report.Sum
    }

$BagOfDice | Add-Member `
    -MemberType ScriptMethod `
    -Name FudgeDie `
    -Value {
        [CmdletBinding()]
        param()
        $Range = -1..1
        Write-Output $($Range | Get-Random)
    }

$BagOfDice | Add-Member `
    -MemberType ScriptMethod `
    -Name FudgeRoll `
    -Value {
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
            [int32]$Dice
        )
        $this.Statistics = $null
        $Results = New-Object "System.Collections.Generic.List[int32]"
        $Rolls = 1..$Dice
        $Rolls.ForEach({
            $Results.Add($($this.FudgeDie()))
        })
        $Statistics = $Results | Measure-Object -Sum -Average -Maximum -Minimum -StandardDeviation
        $Statistics.Property = $MyInvocation | Select-Object -ExpandProperty Line
        $Statistics | Add-Member -MemberType NoteProperty -Name DiceRolls -Value $Results
        $Statistics | Get-Member | Where-Object -Property MemberType -eq Property | Select-Object -ExpandProperty Name | ForEach-Object { Write-Verbose "$PSItem = $($Statistics.$PSItem)" }
        $Report = $Statistics | `
            Select-Object `
            -Property `
                DiceRolls,
                Count,
                Average,
                Sum,
                Maximum,
                Minimum,
                StandardDeviation,
                @{
                    Label = 'Request'
                    Expression = { 
                        $PSItem.Property 
                    }
                },
                @{
                    Label = 'StandardNotation'
                    Expression = {"$($Dice)dF"
                }
            }
        $this.Statistics = $Report
        Write-Output $Report.Sum
    }

$BagOfDice | Add-Member `
    -MemberType ScriptMethod `
    -Name Percentile `
    -Value {
        [CmdletBinding()]
        param()
        $DiceRolled = @{
            Tens = [int32]$($this.DieRoll(10))
            Ones = [int32]$($this.DieRoll(10))
        }
        if($DiceRolled.Tens -gt 9){$DiceRolled.Tens = 0}
        if($DiceRolled.Ones -gt 9){$DiceRolled.Ones = 0}
        # Write-Host $DiceRolled
        $Result = @([string]$($DiceRolled.Tens),[string]$($DiceRolled.Ones)) -join ''
        Write-Output $Result
    }

$BagOfDice | Add-Member `
    -MemberType ScriptMethod `
    -Name CoinFlip `
    -Value {
        [CmdletBinding()]
        param()
        $Result = @('Heads','Tails') | Get-Random
        Write-Output $Result
    }

# add a .ClearStatistics() method and use it in other methods where needed.