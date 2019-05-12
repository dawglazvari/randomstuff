local e = '[.......................................................................]'

offset = string.len(']')
timer = 10000000 -- amount of ticks between each =
lolcmt = 1.01

b = string.len(string.sub(e,2,string.len(e)-offset))

printf = function(msg,...) io.write(string.format(msg,...)) end
if string.len(string.sub(e,2,string.len(e)-offset)) > 117 then
	printf('Satisfactory Effect Engaged!\n')
	e = '[......................................................................................................................]'
	timer = 1000000
	lolcmt = 1
	b = 150
end
printf('Performing meme for %s\n',string.len(string.sub(e,2,string.len(e)-offset)))
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