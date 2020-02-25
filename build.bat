call afdko_env\Scripts\activate.bat
ren Acy-Regular.otf font.otf
makeotf -f font.otf -ff ..\Adobe-GB1-20190729\GSUB\ag15-gsub.fea -r -nS
