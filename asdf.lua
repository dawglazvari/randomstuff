os.execute('cls')

function printf(msg,...)
	io.write(string.format(msg,...))
end

function print(msg,...)
	io.write(string.format(msg,...)..'\n')
end

function keyGen(str) 
	local g = 0 
	for i=1,string.len(str) do 
		g = g+string.byte(str,i) 
	end 
	return g
end 

function keyBreaker() 
	printf('Please enter Technician Key: ') 
	local c = io.read() 
	c = tonumber(c) 
	local key = "" 
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890' 
	while true do 
		local f = math.random(1,string.len(b)) 
		key = key..string.sub(b,f,f) 
		local b = keyGen(key) 
		printf('%s                                   \r',tostring(b)) 
		if b > c then 
			key = "" 
		elseif b == c then 
			print('Auth Code: %s',key) 
			return 
		end 
	end 
	return 1 
end 

keyBreaker()