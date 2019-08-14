--name: hex file encryptor
--date: 6.11.19

--local FILENAME = 'IMPORTANT.txt'

function f(FILENAME)

	local file = io.open(FILENAME,'rb')

	io.input(file)

	local enc = file:read('*all')

	io.close(file)

	local dec = ''
	--print(string.len(enc))
	for i=1,string.len(enc) do
		local ch = string.sub(enc,i,i):byte()
		ch = string.format('%x',ch)
		if string.len(ch) == 1 then
			ch = '0'..ch
		end
		dec = dec..ch
	end
	--print(dec)

	local x = io.open(FILENAME,'wb')
	io.output(x)
	io.write(dec)

	print('Saved to: '..FILENAME)
	io.close(x)
end

return f