--name: shuffle a file
--date: 6.18.19

-- for cl
-- not for require()

printf = function(msg,...) io.write(string.format(msg,...)) end

printf('Welcome to file shuffling software!\n\nPlease enter the EXACT NAME of the file you wish to shuffle.\n$ ')

local file = io.read()

local filec = io.open(file,'rb')
io.input(filec)
local filecontents = io.read('*all')
io.close(filec)

print('shuffling file, this may take awhile')

local chars = {}
for i=1,string.len(filecontents) do
	table.insert(chars,string.sub(filecontents,i,i))
end

local complete = ''

function a(b)
	if #b == 0 then
		return
	end
	local x = math.random(1,#b)
	local ch = b[x]
	table.remove(b,x)
	complete = complete..ch 
	a(b)
	return
end

a(chars)

local filec = io.open(file,'wb')
io.output(filec)
io.write(complete)
io.close(filec)

print('\nOperation completed!\nSaved to '..file)