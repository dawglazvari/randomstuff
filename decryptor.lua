--name: hex file decryptor
--date: 6.11.19

return function(FILENAME)
	function round(num, numDecimalPlaces)
	  local mult = 10^(numDecimalPlaces or 0)
	  return math.floor(num * mult + 0.5) / mult
	end

	local file = io.open(FILENAME,'rb')

	io.input(file)

	local enc = file:read('*all')

	io.close(file)


	local check = round(string.len(enc)/2,0)

	if check ~= string.len(enc)/2 then
		print('File is not encrypted!')
		return
	end

	local dec = {}
	local c = 0
	for i=1,string.len(enc)/2 do
		local num = string.sub(enc,i+c,i+1+c)
		local v = tonumber(num,16)
		v = string.char(v)
		table.insert(dec,v)
		c = c+1
	end

	local x = io.open(FILENAME,'wb')
	io.output(x)
	for _,i in pairs(dec) do
		io.write(i)
	end

	print('Saved to: '..FILENAME)
	io.close(x)
end