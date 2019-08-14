--name: byteshift enc/dec
--date: 6.8.19

--[[
  __                               __     
_/  |_ __ ________________   _____/  |_   
\   __\  |  \_  __ \_  __ \_/ __ \   __\  
 |  | |  |  /|  | \/|  | \/\  ___/|  |    
 |__| |____/ |__|   |__|    \___  >__| /\ 
                                \/     \/ 

property of turret

to use, credit turret.

--]]



function doz(msg)

	severity = 1
	-- your key.
	-- number only
	-- min is 0
	-- max is 4
	-- go beyond and beware of untypeable characters

	local printenabled = false
	local function print(msg)
		if not printenabled then return end
		io.write(msg)
	end

	local del = {}
	for i=1,string.len(msg) do
		local x = string.sub(msg,i,i)
		x = string.byte(x)

		if x <= 47 then table.insert(del,i) end
		if x >= 123 then table.insert(del,i) end
		local b = {58,59,60,61,62,63,64,91,92,93,94,95,64,94}
		for _,v in pairs(b) do if b == x then table.insert(del,i) end end

		local w = {46,32,34,39,44,45}

		--if del[#del] ~= nil then
		--	if del[#del] == i and string.sub(msg,del[#del],del[#del]) ~= ' ' then
		--		print('BLACKLIST: '..string.sub(msg,i,i)..'\n')
		--	elseif string.sub(msg,del[#del],del[#del]) == ' ' then
		--		table.remove(del,#del)
		--	end
		--end
		for _,z in pairs(w) do
			if del[#del] ~= nil then
				if string.sub(msg,del[#del],del[#del]) == string.char(z) then
					table.remove(del,#del)
					print('WHITELISTED CHARACTER REMOVED FROM WHITELIST: '..string.sub(msg,i,i)..'\n')
				end
			end
		end
		if del[#del] == i then
			print('BLACKLIST: '..string.sub(msg,i,i)..'\n')
		end
 	end

 	local delcnt = 0
 	for _,i in pairs(del) do
 		print('CHARACTER IN POSITION '..i..' REMOVED\n')
 		msg = string.sub(msg,1,i-1-delcnt)..string.sub(msg,i+1-delcnt)
 		delcnt = delcnt+1
 	end

	local f = {}
	for i=1,string.len(msg) do
		local x = string.sub(msg,i,i)
		table.insert(f,x)
	end

	--for _,i in pairs(f) do print(i) end

	local x = {}
	for _,i in pairs(f) do
		table.insert(x,string.byte(i))
	end

	for i=1,#x do print(f[i]..' : '..x[i]..'\n') end

	print('Reconstructing original message with bytes\n')
	for _,i in pairs(x) do
		print(string.char(i))
	end
	print('\n')

	print('\nGenerating "encrypted" message\n')
	local ZEUS = ''
	for _,i in pairs(x) do
		if i ~= 32 then -- if statement prevents unit seperator character from being input
			ZEUS = ZEUS..string.char(i-severity)
		else
			ZEUS = ZEUS..string.char(i)
		end
	end
	print(ZEUS..'\n')
	print('\nGenerating "decrypted" message\n')
	local mai = {}
	for i=1,string.len(ZEUS) do
		table.insert(mai,string.byte(string.sub(ZEUS,i,i)))
	end

	local OOF = ''
	for _,i in pairs(mai) do
		if i == 32 then -- if statement prevents ! from being input
			OOF = OOF..string.char(i)
		else
			OOF = OOF..string.char(i+severity)
		end
	end
	print(OOF..'\n')

	return ZEUS,OOF



	--return 1 -- error
end




-- this program area, do not edit

io.write('Please enter phrase: ')

local enc,dec = doz(io.read())


print('\nEncrypted: '..enc..'\n\nDecrypted: '..dec)

print('\nKey used: '..severity)
print('\nTo send to a friend, send "'..enc..' ('..severity..')"')
