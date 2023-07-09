# BagOfDice
PowerShell library of dice rolling functionaility.

# Functions

## Get-BoDCoinFlip

Allows for a 50/50 decision. Allows for return of three file types:

Option | Type | Result Set
:--- | :---: | :---
Coin | string | 'Heads', 'Tails'
Binary | int32 | 0, 1
Boolean | bool | True, False

## Get-BoDDiceRolls
Rolls a number of same dice based on provided number of dice and number of sides.
## Get-BoDDieRoll
Rolls a single die of the provided number of sides.
## Get-BoDFudge
Returns a -1, 0, or 1
## Get-BoDPercentileRoll
Returns a number between 1 and 100, or 0 and 99, based on preference (``-Zero`` switch for the latter). Roll is based on two d10 combined into a string, then converted to an integer.
