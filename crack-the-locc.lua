-- cracc teh locc

math.randomseed(os.time())
local code = math.random(0,9999)
math.randomseed(math.random(0,9999))
local curr = string.format('%04i',math.random(0,9999))

print('DEBUG DATA: '..tonumber(curr)+code)

local layout = [[

  %i %i %i %i  
--%i-%i-%i-%i--
  %i %i %i %i  

(S)olve the lock
Row (1) modification
Row (2) modification
Row (3) modification
Row (4) modification

> ]]

local rowmod = [[

  %i  
--%i--
  %i  

(U)p
(D)own

> ]]

local split = function(x)
	local ret = {}
	for i=1,string.len(x) do
		table.insert(ret,string.sub(x,i,i))
	end
	return ret
end

local printf = function (msg,...) io.write(string.format(msg,...)) end

local printCurrent = function()

	local temp = split(curr)

	local b1 = tonumber(temp[1])
	local b2 = tonumber(temp[2])
	local b3 = tonumber(temp[3])
	local b4 = tonumber(temp[4])

	printf(layout,
		tonumber(string.sub(tostring(b1+1),string.len(tostring(b1+1)))),
			tonumber(string.sub(tostring(b2+1),string.len(tostring(b2+1)))),
			tonumber(string.sub(tostring(b3+1),string.len(tostring(b3+1)))),
			tonumber(string.sub(tostring(b4+1),string.len(tostring(b4+1)))),
		b1,
			b2,
			b3,
			b4,
		tonumber(string.sub(tostring(b1-1),string.len(tostring(b1-1)))),
			tonumber(string.sub(tostring(b2-1),string.len(tostring(b2-1)))),
			tonumber(string.sub(tostring(b3-1),string.len(tostring(b3-1)))),
			tonumber(string.sub(tostring(b4-1),string.len(tostring(b4-1))))
	)
end

local rowMod = function(num)
	if num == nil then
		return
	end

	local temp = split(curr)

	local base = tonumber(temp[num])

	printf(rowmod,
		tonumber(string.sub(tostring(base+1),string.len(tostring(base+1)))),
		base,
		tonumber(string.sub(tostring(base-1),string.len(tostring(base-1))))
	)

	local choice = io.read()

	local valid = {'u','d'}

	local aaa = false

	for _,i in pairs(valid) do
		if string.lower(choice) == i then
			aaa = i
			break
		end
	end

	if aaa == false then
		print('invalid')
		mainMenu()
		return
	end

	if aaa == 'u' then
		curr = string.sub(curr,1,num-1)..tostring(string.sub(tostring(base+1),string.len(tostring(base+1))))..string.sub(curr,num+1)
	elseif aaa == 'd' then
		curr = string.sub(curr,1,num-1)..tostring(string.sub(tostring(base-1),string.len(tostring(base-1))))..string.sub(curr,num+1)
	end

	--print(curr)

	mainMenu()
end

mainMenu = function()
	printCurrent()
	local choice = io.read()

	local valid = {'s','1','2','3','4'}

	local aaa = false

	for _,i in pairs(valid) do
		if string.lower(choice) == i then
			aaa = i
			break
		end
	end

	if aaa == false then
		print('invalid')
		mainMenu()
		return
	end

	if aaa == 's' then
		if tonumber(curr) == code then
			print('\n\nCongratulations! You win!')
			return
		else
			print('\nUh oh! It didn\'t work!')
			mainMenu()
		end
	else
		rowMod(tonumber(aaa))
	end
end

mainMenu()