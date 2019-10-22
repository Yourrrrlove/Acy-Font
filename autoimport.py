#python 3.7.3
#encoding=utf-8

a=2500 #起始字符位置
b=2999 #结束字符位置

cx=20 #每行字符数量

import fontforge

font=fontforge.activeFont()
for i in range(a,b):
    glyph=font.createMappedChar(i)
    if glyph.originalgid>=a and glyph.originalgid<b:
        font.selection.select(glyph.originalgid)
        #导入
        y=int((glyph.originalgid-a)/cx)
        x=glyph.originalgid-a-y*cx
        img='Acy-Adobe-GB1-4-Regular-%d-%d_%02d_%02d.png'%(a,b,y,x)
        glyph.importOutlines(img)
        #提取字形
        font.autoTrace()
        #删除背景图像
        #因 FontForge 未提供删除图像接口所以不要管它
