function a(a,b)
	return a-b
end

function b(a,b)
	return a+b
end

io.write('Please enter password: ')

local f = io.read()

local sum = 0
for i=1,string.len(f) do
	sub = sub+string.byte(string.sub(f,i,i))
end
if sum == 1623 then
	if a(string.byte(string.sub(f,1,1)),string.byte(string.sub(f,2,2))) == 30 then
		if a(string.byte(string.sub(f,2,2)),string.byte(string.sub(f,3,3))) == 27 then
			if string.byte(string.sub(f,3,3)) == string.byte(string.sub(f,4,4)) then
				if a(string.byte(string.sub(f,4,4)),string.byte(string.sub(f,5,5))) == 61 then
					print('good so far')
				end
			end
		end
	end
end
--sUpp3r_s3cr3t_c0d3