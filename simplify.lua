--name: fraction simplifier
--date: 5.7.19

printf = function(msg,...) io.write(string.format(msg,...)) end

local frac = {x = 0,y = 0}

printf('Please enter your fraction numerator: ')
frac.x = io.read()
printf('Please enter your fraction denomenator: ')
frac.y = io.read()

printf('\n\nLocating the simplified fraction for %s/%s',frac.x,frac.y)
frac.x = tonumber(frac.x)
frac.y = tonumber(frac.y)

asdf = frac.x/frac.y

b = os.time()

if frac.x == 1 or frac.y == 1 then
	printf('\nSimplified Fraction for %s/%s: %s/%s\n',frac.x,frac.y,frac.x,frac.y)
	printf('No additional information available; No division/No time\n')
	return
end

if frac.x == frac.y then printf('\nSimplified Fraction for %s/%s: %s/%s\n',frac.x,frac.y,1,1) printf('No additional information available; No division/No time\n') return end

for y=1,frac.y do
	printf('\r.')
	for x=1,frac.x do
		if x/y == asdf then
			printf('\nSimplified Fraction for %s/%s: %s/%s\n',frac.x,frac.y,x,y)
			printf('Seconds Taken: %s\n',os.time()-b)
			printf('Division Count: %s\n',y*x+y)
			return
		end
	end
end