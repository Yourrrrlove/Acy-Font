nx=20
ny=25

local strpath
if arg[1]==nil then
	require("wx")
	strpath=wx.wxFileSelector("选择文件",".","","png","便携式网络图像文件|*.png|所有文件|*",wx.wxFD_OPEN+wx.wxFD_FILE_MUST_EXIST)
else
	strpath=arg[1]
end
if strpath==nil or strpath=='' then
	os.exit()
end

local _,sppos=strpath:reverse():find('%.')
local dpn=strpath:sub(1,#strpath-sppos)

require("gd")

img=gd.createFromPng(strpath)
local dw=img:sizeX()/nx
local dh=img:sizeY()/ny
local charImg=gd.createTrueColor(dw,dh)
for j=0,ny-1,1 do
	for i=0,nx-1,1 do
		charImg:copy(img,0,0,i*dw,j*dh,dw,dh)
		charImg:png(string.format("%s_%02d_%02d.png",dpn,j,i))
	end
end
