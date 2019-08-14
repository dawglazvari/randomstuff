local len = arg[1]
if len == nil then 
	print('Error: invalid arguments')
	return
elseif pcall(function() return tonumber(len) end) == false then
	print('Error: invalid arguments')
	return
end
len = tonumber(len)

local count = ''
for i=1,len do
	count = count..'f'
end
print('Filling file "junk" with file size of 0x'..count..' bytes')

local b = io.open('junk','w+b')

for i=1,tonumber(count,16) do
	b:write(string.char(math.random(1,255)))
end
print('Finished filling file "junk" with junk')