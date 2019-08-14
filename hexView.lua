local path = arg[1]
local split = arg[2]
local printf = function(msg,...) io.write(string.format(msg,...)) end
local x = string.format
if path == nil then
	printf('Usage: %s (file path) [split]\n',arg[0])
	return
elseif split == nil then
	split = 16
elseif pcall(function() return tonumber(split) end) == nil then
	printf('Usage: %s (file path) [split]\n',arg[0])
	return
end

local suc,file = pcall(function() return io.open(path,'rb') end)
if file == nil then
	printf('Usage: %s (file path) [split]\n',arg[0])
	return
end

local normal = file:read('a')
file:close()
local dataTable = {}
local curr = ''
for i=1,string.len(normal) do
	local x = i%split
	if x ~= 0 then
		curr = curr..string.format('%02X',string.byte(string.sub(normal,i,i)))
	else
		table.insert(dataTable,curr)
		curr = ''
	end
	if i == string.len(normal) then
		if x ~= 0 then
			table.insert(dataTable,curr)
		end
	end
end

local addressformat = '0x%08X'
local range = {32,126}

for v,i in ipairs(dataTable) do
	local address = x(addressformat,(v-1)*split)
	local hex = i

	local readable = string.gsub(hex,'..',function(c)
		local b = tonumber(c,16)
		if b >= range[1] and b <= 126 then
			return string.char(b)
		else
			return '.'
		end
	end)

	if string.len(hex)/2 ~= split then
		local len = string.len(hex)/2
		for z=len,split do
			hex = hex..'  '
		end
	end
	print(address..':\t'..hex..'\t'..readable)
end
