--�ȸ���'Acy-Adobe-GB1-5-Regular-500-999_'
start_y=0
start_x=0
nx=20
ny=25
ej=ny
ei=nx
st=300

I=string.byte('I',1)
T=string.byte('T',1)
V=string.byte('V',1)

function isUpper(ch)
	local b=ch:byte(1)
	return b>=string.byte('A',1) and b<=string.byte('Z',1)
end

function isLower(ch)
	local b=ch:byte(1)
	return b>=string.byte('a',1) and b<=string.byte('z',1)
end

function sendChar(ch)
	local vkCh=ch:byte(1)
	local isCap=false
	if isUpper(ch) then
		isCap=true
	elseif isLower(ch) then
		vkCh=ch:upper():byte(1)
	elseif vkCh==string.byte('.',1) then
		vkCh=VK_DECIMAL
	elseif vkCh==string.byte('-',1) then
		vkCh=VK_OEM_MINUS
	elseif vkCh==string.byte('_',1) then
		isCap=true
		vkCh=VK_OEM_MINUS
	end
	if isCap then
		sendKey(VK_LSHIFT,true)
	end
	sendKey(vkCh,true)
	sendKey(vkCh,false)
	if isCap then
		sendKey(VK_LSHIFT,false)
	end
end

function sendString(str)
	for i=1,#str,1 do
		sendChar(str:sub(i,i))
	end
end

function send2DigitsNumber(n)
	sendString(string.format("%02d",n))
end

repeat
	--���µ����ݼ�
	sendKey(VK_LCONTROL,true)
	sendKey(VK_LSHIFT,true)
	sendKey(I,true)
	sendKey(I,false)
	sendKey(VK_LSHIFT,false)
	sendKey(VK_LCONTROL,false)
	sleep(st)--�ȴ�������Ӧ

	--�����ļ���
	sendKey(VK_LCONTROL,true)
	sendKey(V,true)
	sendKey(V,false)
	sendKey(VK_LCONTROL,false)
	send2DigitsNumber(start_y)
	sendChar('_')
	send2DigitsNumber(start_x)
	sendString('.png')

	--���س�ȷ��
	sendKey(VK_RETURN,true)
	sendKey(VK_RETURN,false)
	sleep(st)

	--����ת��·����ݼ�
	sendKey(VK_LCONTROL,true)
	sendKey(VK_LSHIFT,true)
	sendKey(T,true)
	sendKey(T,false)
	sendKey(VK_LSHIFT,false)
	sendKey(VK_LCONTROL,false)
	sleep(st)

	--�����ҷ����
	sendKey(VK_RIGHT,true)
	sendKey(VK_RIGHT,false)

	start_x=start_x+1
	if start_x==nx then
		start_x=0
		start_y=start_y+1
	end
until start_y==ej
