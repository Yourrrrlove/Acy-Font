call afdko_env\Scripts\activate.bat
if exist Regular\Acy-Regular.otf del Regular\Acy-Regular.otf
if not exist Regular md Regular
makeotf -f Acy-Regular.otf -ff Adobe-GB1\GSUB\ag15-gsub.fea -fi fontinfo.txt -r -nS -o Regular\Acy-Regular.otf
ttx -f Regular\Acy-Regular.otf
notepad Regular\Acy-Regular.ttx
ttx -f Regular\Acy-Regular.ttx
