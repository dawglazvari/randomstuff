function print(msg,...) io.write(string.format(msg,...)..'\n') return 0 end function printf(msg,...) io.write(string.format(msg,...)) return 0 end

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
	local b = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890-_'
	while true do
		local f = math.random(1,string.len(b))
		key = key..string.sub(b,f,f)
		local b = keyGen(key)

		printf('%s\r',tostring(b))

		if b > c then
			key = ""
		elseif b == c then
			print('Found Key: %s',key)
			return 0
		end

	end
	return 1
end

local errors = {
	['1'] = 'Unable to Compute.'

}

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