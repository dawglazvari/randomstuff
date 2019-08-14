--name: unfinished mute bot from discord
--date: 5.20.19

local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	-- client.user is the path for your bot
	print('Logged in as '.. client.user.username)
end)

function a(msg,cnt)
	if string.lower(string.sub(msg,1,string.len(cnt))) == string.lower(cnt) then
		return true
	else
		return false
	end
end

client:on('messageCreate', function(msg)
	local a = msg.author
	if not a.bot then return end
	if msg.guild == nil then return end
	if msg.guild.id ~= 551498316089917451 then return end

	local ROLE_ID = 0

	local auth == false

	for _,i in pairs(auth) do
		if i == msg.author.id then
			auth = true
		end
	end

	if a(msg.content,'_mute ') or a(msg.content,'_unmute ') then if auth == false then msg:reply('you have no perms.') return end end

	if a(msg.content,'_mute ') then

		local f = string.sub(msg.content,string.len('_mute  '))
		f = string.sub(f,3)
		f = string.sub(f,1,string.len(f)-1)

		local s = pcall(function() tonumber(muteid) end)

		if s == false then msg:reply('invalid ping.') return end
		s = nil
		local muteid = f
		f = nil

		local s = pcall(function()
		f = msg.guild:getRole(ROLE_ID)
		g = msg.guild:getMember(tonumber(muteid))
		end)
		if s == false then msg:reply('invalid role/member') return end

		s = nil

		local s = pcall(function()
			g:addRole(f.id)
		end)
		if s == false then msg:reply('bot probs have no permission to do it') return end
	elseif a(msg.content,'_unmute ') then

		local f = string.sub(msg.content,string.len('_mute  '))
		f = string.sub(f,3)
		f = string.sub(f,1,string.len(f)-1)

		local s = pcall(function() tonumber(muteid) end)

		if s == false then msg:reply('invalid ping.') return end
		s = nil
		local muteid = f
		f = nil

		local s = pcall(function()
		f = msg.guild:getRole(ROLE_ID)
		g = msg.guild:getMember(tonumber(muteid))
		end)
		if s == false then msg:reply('invalid role/member') return end

		s = nil

		local s = pcall(function()
			g:removeRole(f.id)
		end)
		if s == false then msg:reply('bot probs have no permission to do it') return end
	end
end)