j=24
i=0

nx=20
ny=25

ej=ny
ei=nx

I=string.byte('I',1)
T=string.byte('T',1)

--digit: starts from 1
function getDigitVkCode(num,digit)
	s=string.format("%02d",num);
	return string.byte(s,digit)
end

function sendChar(ch)
	sendKey(string.byte(ch,1),true)
	sendKey(string.byte(ch,1),false)
end

function sendString(str)
	for i=1,#str,1 do
		sendChar(str.sub(i,i))
	end
end

function send2DigitsNumber(n)
	str=tostring(n)
	sendChar(str:sub(1,1))
	sendChar(str:sub(2,2))
end

repeat
	sendKey(VK_LCONTROL,true)
	sendKey(VK_LSHIFT,true)
	sendKey(I,true)
	sendKey(VK_LCONTROL,false)
	sendKey(VK_LSHIFT,false)
	sendKey(I,false)
	sendString('Acy-Adobe-GB-1-5-Regular-0-499-')
	send2DigitsNumber(j)
	sendChar('-')
	send2DigitsNumber(i)
	sendString('.png')
	sendKey(VK_RETURN,true)
	sendKey(VK_RETURN,false)
	sendKey(VK_LCONTROL,true)
	sendKey(VK_LSHIFT,true)
	sendKey(I,true)
	sendKey(VK_LCONTROL,false)
	sendKey(VK_LSHIFT,false)
	sendKey(T,false)
	sendKey(VK_RIGHT,true)
	sendKey(VK_RIGHT,false)
	i=i+1
	if i==nx
		i=0
		j=j+1
	end
until j==ej
