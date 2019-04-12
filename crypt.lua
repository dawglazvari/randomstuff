-- code below is under copyright
-- tweaked slightly to take less lines and remove some things that
-- we don't really need. go ahead and take it but make sure to
-- credit the original owner because well i dont want you to get sued
-- Lua 5.1+ base64 v3.0 (c) 2009 by Alex Kloss <alexthkloss@web.de>
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function enc(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end
function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end
-- code above is under copyright

-- ok here's my actual stuff
print('Pick your poison.')
print('(E)ncrypt, (D)ecrypt')
local e = io.read()
if string.lower(e) == 'e' then
	-- encrypt
	print('What\'s the phrase?')
	local f = io.read()
	print('Here\'s the code: '..enc(f))
elseif string.lower(e) == 'd' then
	-- decrypt
	print('What\'s the phrase?')
	local f = io.read()
	print('Here\'s the code: '..dec(f))
else
	print('That\'s not a choice.')
end