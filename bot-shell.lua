--[[
	Bot Shell for bot in lua
	made by turret.#1938

	Discordia Bot Shell (c) 2019 by turret.#1938 

	Requirements:
		Knowledge of lua.
		Access to discordia wiki.
		Discordia installed in the directory with this file
		A soul

	Adding a command:
		First, in the cmds = {}, add your command so it'll be like:
			cmds = {'help','eat','pie'}
		Next, go to the runCommand() function and add your command data so it'll be like:
			elseif cmd == 'COMMAND NAME' then
		Then, place your command!
		If you want, add the command  to the help index, so help = {{'COMMAND NAME','COMMAND HELP'}
																	,{'ANOTHER COMMAND','ANOTHER COMMAND HELP'}}

	Feel free to remove this area, but at least credit me for a part in the bot.

]]--                                                              i have this comment tag for ocd. i have mild ocd so this is here

local discordia = require('discordia') -- grab discordia libs
local client = discordia.Client() -- grab discordia libs

local token = 'INSERT TOKEN HERE' -- store token for AUTH
local prefix = ';' -- store prefix for COMMANDS
local game = 'with aids | ask turret. for help' -- store game for "Playing ...", ex "Playing with aids | ask turret. for help"

local cmds = { -- command index, add command in LOWER CASE plain text for it to be added for runCommand()
	-- ex: 
	'help', -- end of example
}

local help = { -- help index, view example below
	{'help','Shows this message!'}, -- end of example

}

function runCommand(cmd,args,msg) -- actually runs commands.
	-- args is after the command, cmd is plain text for teh command (ex. 'help'), and msg is the original msg, usually used in
	-- msg:reply('text to go into channel')
	if cmd == 'help' then
		-- stock help command
		local f = '``ini\n[Bot Help Index]\n'
		for _,i in pairs(help) do
			if i[2] == nil or i[2] == '' then
				f = f..'['..i[1]..'] This command has no help!\n'
			else
				f = f..'['..i[1]..'] '..i[2]..'\n'
			end
		end
		f = f..'```'
		msg:reply(f)
	end
end

--[[


	                    [WARNING]
	This section below is actually code of the bot!
	Please refrain from editing this section below.
	All code that you need to edit is in the above section!
	Only go down here if you know what you're doing!


]]--                                                                         hey this comment tag is also for ocd. sorry bout that
client:on('ready',function()
	print('Bot ready to receive commands!')
	client:setGame(game) -- set game from `local game = '...'` value
end)
client:on('messageCreate',function(msg) -- i'll document this for anyone intrested
	local cmd = nil -- initalize cmd var
	local args = nil -- initalize args var
	if string.sub(msg.content,1,string.len(prefix)) == prefix then -- if the message starts with prefix
		for _,i in pairs(cmds) do -- for everything in the commands do
			if prefix..i == prefix..string.sub(string.lower(msg.content),string.len(prefix)+1,string.len(i)+1) then
				cmd = i--< sets what was found in command index to cmd ^  if the command is what was found in the command index
				args = string.sub(msg.content,string.len(prefix..i)+2)
				-- ^ sets arguments for args var in runCommand()
			end
		end
		if cmd ~= nil them -- if the command was actually found then
			runCommand(cmd,args,msg) -- run the command
		end
	end
end)
client:run('Bot '..token)