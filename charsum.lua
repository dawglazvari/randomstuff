--name: gets charsum of string in hex
--date: 6.16.19

local function e(str)
	if tostring(str) ~= str and tonumber(str) ~= str then
		return 'Invalid string'
	end
	if tonumber(str) == str then
		str = tostring(str)
	end
	local sum = 0
	str:gsub('.',function(c)
		sum = sum+string.byte(c)
	end)

	return string.format('%x',sum)
end

return e