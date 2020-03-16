call afdko_env\Scripts\activate.bat
if exist Medium\Acy-Medium.otf del Medium\Acy-Medium.otf
if not exist Medium md Medium
makeotf -f Acy-Medium.otf -ff ..\Adobe-GB1-20190729\GSUB\ag15-gsub.fea -fi fontinfo-medium.txt -r -nS -o Medium\Acy-Medium.otf
ttx -f Medium\Acy-Medium.otf
notepad Medium\Acy-Medium.ttx
ttx -f Medium\Acy-Medium.ttx
