os.execute('color a')
os.execute('cls')

math.randomseed(os.time())
keysample = math.random(10000,20000)

function print(msg,...)
	io.write(string.format(msg,...)..'\n')
end

function printf(msg,...)
	io.write(string.format(msg,...))
end

function keyGen(str) 
	local g = 0 
	for i=1,string.len(str) do 
		g = g+string.byte(str,i) 
	end 
	return g
end 

printf('Technician Key: %s\nEnter auth code: ',tostring(keysample))
local g = io.read()

if keyGen(g) ~= keysample then
	print('System still locked.')
	os.execute('pause')
	return
end

print('System Unlocked!')
os.execute('pause')
os.execute('color f')
os.execute('cls')

print('Microsoft Windows [Version 10.0.17134.706]\n(c) 2018 Microsoft Corporation. All rights reserved.\n')
printf('$ ')
function eat()
	os.execute(io.read())
	printf('$ ')
	eat()
end
eat()