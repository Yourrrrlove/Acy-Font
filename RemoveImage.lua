fn='Acy-RegularCID.sfd'
f=io.open(fn,'r')
str=''
line_state=0
for line in f:lines() do
	if line=='Back' and line_state==0 then
		line_state=1
	elseif line:sub(1,7)=='Image2:' and line_state==1 then
		line_state=2
	elseif line=='EndImage2' and line_state==2 then
		line_state=0
	elseif line_state==0 then
		str=str..line..'\n'
	end
end
f:close()
f=io.open(fn,'w')
f:write(str)
f:close()
