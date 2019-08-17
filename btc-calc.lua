-- name: thing for my server
-- date today

local BTCVal = arg[1] -- server btc value
local currBTC = arg[2] -- player's current btc
local tax = 0.15 -- purchase tax
local banknoteCost = 0.7 -- btc
local banknoteValue = 1000 -- $$
local printf = function(msg,...) io.write(string.format(msg,...)) end

if BTCVal == nil or currBTC == nil then
	printf('Usage: %s (BTC Value) (Your BTC)\n',arg[0])
	return
end

BTCVal = tonumber(BTCVal)
currBTC = tonumber(currBTC)

if BTCVal >= banknoteValue then
	printf('Performing action will result in loss. Action is not recommended.\n')
	return
else
	printf('Performing action will result in production. Action is recommended.\n')
end
print()
local banknoteAmt = math.floor(currBTC/banknoteCost)
local totalEarnings = banknoteAmt*banknoteValue
printf('You currently have %s BTC.\n',arg[2])
printf('You will get %i banknotes.\n',banknoteAmt)
printf('Which when deposited, will give you $%i.\n',totalEarnings)
local btcEarnings = 0
btcEarnings = totalEarnings/BTCVal
btcEarnings = btcEarnings+(btcEarnings*tax)-currBTC
local add = tonumber(string.sub(tostring(math.floor(btcEarnings*100)),string.len(tostring(math.floor(btcEarnings*100)))-1,string.len(tostring(math.floor(btcEarnings*100)))))
btcEarnings = math.floor(btcEarnings)..'.'..add

local btcValString = arg[1]

printf('With tax of %i%s, and the value of bitcoin being $%s, you\'d earn about %s BTC\n',tax*100,'%',btcValString,btcEarnings)