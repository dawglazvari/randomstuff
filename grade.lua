--name: test-type grading
--date: 5.7.19

printf = function(msg,...) io.write(string.format(msg,...)) end

config = {
	serial = {'AB19291','BA19741','AA19281','BB18753'},
	answers = {
		['AB19291'] = {'C','A','B','D'},
		['BA19741'] = {'D','B','C','A'},
		['AA19281'] = {},
		['BB18753'] = {}
	}
}

printf('Available Serials: ')
for _,i in pairs(config.serial) do
	printf('%s, ',i)
end

printf('\nPlease enter test serial key: ')
local serial = io.read()

answers = {}

for _,i in pairs(config.serial) do
	if i == serial then
		answers = config.answers[i] 
		serial = nil
	end
end

local correct = 0

for i=1,#answers do
	local e = answers[i]
	printf('Enter answer for question %s: ',i)
	local f = io.read()
	if e == f then
		printf('Correct!\n')
		correct = correct+1
	else
		printf('Incorrect.\n')
	end
end

local b = 100/#answers
b = b*correct
printf('Percent Correct: %s',string.sub(b..'',1,3))
