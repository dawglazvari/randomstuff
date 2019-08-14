--name: charsum key gen & braker
--date: 5.12.19

--[[
	Key Generator and Breaker.

	A key generator makes a value based on the input.
	The key breaker will make a key that will give you
		the value that you inputted. Putting it in the
		key generator will give you your value back.

	A number on the breaker will change very fast. This is the value
		that it is trying. If it goes over the amount you specified then
		it will reset. Once it reaches the number you specified then
		it will give you the key corosponding to the number given
]]


VERYBADJUNK = false 
-- enables characters outside of the normal
-- typable range to be entered. characters like NUL and DEL will be inputted.

breakerJunk = false
-- enables special characters ($^&*(##@#%$}":>"))                                                                                                                                                                     


findMoreThan1 = false
-- finds more than 1 key in key breaker
-- ctrl+c to quit






-- actual code below.
-- only come down if you want to copy my code

















os.execute('cls')
os.execute('color a')


function print(msg,...) 
	io.write(string.format(msg,...)..'\n') 
	return 0 
end 
function printf(msg,...) 
	io.write(string.format(msg,...)) 
	return 0 
end 

printf('Welcome to the Key Generator/Breaker!\n\nTo start, choose a mode.\n(G)enerator or (B)reaker\n> ') 
function keyGen(str) 
	local g = 0 
	for i=1,string.len(str) do 
		g = g+string.byte(str,i) 
	end 
	return g
end 

function keyGenerator() 
	printf('Please enter a key: ') 
	local key = keyGen(io.read()) 
	print('Key Value: %s',key..'') 
	return 0 
end 

function keyBreaker() 
	printf('Please enter a value to receive: ') 
	local c = io.read() 
	c = tonumber(c) 
	local key = "" 
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890' 
	if breakerJunk == true then 
		b = '' 
		for i=33,126 do 
			b = b..string.char(i) 
		end 
	end 
	if VERYBADJUNK then 
		b = '' 
		for i=0,127 do 
			b = b..string.char(i) 
		end 
	end 
	local TIME = os.time() 
	while true do 
		local f = math.random(1,string.len(b)) 
		key = key..string.sub(b,f,f) 
		local b = keyGen(key) 
		printf('%s                                   \r',tostring(b)) 
		if b > c then 
			key = "" 
		elseif b == c then 
			print('Found Key: %s',key)  
			if not findMoreThan1 then
				print('It only took %s second(s).',tostring(os.time()-TIME)) 
				return 0 
			end
		end 
	end 
	return 1 
end 

local errors = { ['1'] = 'Unable to Compute.' } 

local g = io.read() 
g = string.lower(g) 
if g == 'g' then 
	local f = keyGenerator() 
	if f ~= 0 then 
		print('\nThe program exited with an error. Error: %s',errors[tostring(f)]) 
	end 
elseif g == 'b' then 
	local f = keyBreaker() 
	if f ~= 0 then 
		print('\nThe program exited with an error. Error: %s',errors[tostring(f)]) 
	end 
end

os.execute('color f')
