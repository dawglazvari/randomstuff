--name: hex encrypt/decrypt test
--date: 6.11.19

local enc = require('encryptor')
local dec = require('decryptor')

local i = 'TESTFILE.txt'

local x = io.open(i,'w')
io.output(x)
io.write('TESTING FILE:\n\nTHIS FILE IS FOR TESTING THE ENC/DEC SERVICE.\n\nYOU MAY DELETE THIS FILE.')
io.close(x)

enc(i)
dec(i)