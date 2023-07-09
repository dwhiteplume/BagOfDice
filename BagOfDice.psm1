. $(Join-Path $(Join-Path $PSScriptRoot -ChildPath lib) -ChildPath GetBoDCoinFlip.ps1 -Verbose)
. $(Join-Path $(Join-Path $PSScriptRoot -ChildPath lib) -ChildPath GetBoDDiceRolls.ps1)
. $(Join-Path $(Join-Path $PSScriptRoot -ChildPath lib) -ChildPath GetBoDDieRoll.ps1)
. $(Join-Path $(Join-Path $PSScriptRoot -ChildPath lib) -ChildPath GetBoDFudge.ps1)
. $(Join-Path $(Join-Path $PSScriptRoot -ChildPath lib) -ChildPath GetBoDPercentileRoll.ps1)

Export-ModuleMember -Function Get-BoDCoinFlip
Export-ModuleMember -Function Get-BoDDiceRolls
Export-ModuleMember -Function Get-BoDDieRoll
Export-ModuleMember -Function Get-BoDFudge
Export-ModuleMember -Function Get-BoDPercentileRoll
