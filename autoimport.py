#python 3.7.3
#encoding=utf-8
#在 FontForge 中选择File,Execute Script...右键导入该脚本执行

a=4500 #起始字符位置
b=4999 #结束字符位置

cx=20 #每行字符数量

import fontforge

font=fontforge.activeFont()
for i in range(a,b+1):
    glyph=font.createMappedChar(i)
    font.selection.select(glyph.originalgid)
    #导入
    y=int((glyph.originalgid-a)/cx)
    x=glyph.originalgid-a-y*cx
    img='Acy-Adobe-GB1-4-Regular-%d-%d_%02d_%02d.png'%(a,b,y,x)
    glyph.importOutlines(img)
    #提取字形
    font.autoTrace()
    #删除背景图像
    #因 FontForge 未提供删除图像接口所以需要执行完后手动删除

#选择字形
font.selection.select(("ranges",None),a,b)
#之后需要手动选择Edit, Clear Background
