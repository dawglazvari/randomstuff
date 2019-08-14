--name: fake system error
--date: 5.13.19

os.execute('cls')
function printf(msg,...)
	io.write(string.format(msg,...))
end
function print(msg,...)
	io.write(string.format(msg,...)..'\n')
end

print('WARNING:\n\tMultiple Systems nonfunctional.')
print('\n\nPlease contact your system administrator for further details.\n\tError: $ERROR')
print('\n\nQuestions or concerns shall go to your system administrator.')
 
 print('\nSystem Reset Status: ')
local e = '[...........................................................]'

offset = string.len(']')
timer = 100000000 -- amount of ticks between each =
lolcmt = 1.01

b = string.len(string.sub(e,2,string.len(e)-offset))

--printf('Performing meme for %s\n',string.len(string.sub(e,2,string.len(e)-offset)))
printf(e)

for i=1,b do
	printf('\r[')
	for x=1,string.len(string.sub(e,2,string.len(e)-offset)) do
		if (i == x) or (x < i) then
			printf('=')
		else
			printf('.')
		end
	end
	printf(']')
	for x=1,timer  do io.write() end
	timer = timer*lolcmt
end

print('\nSystem reset complete.')
print('Press any key to restart system.')
os.execute('title File Deletion')