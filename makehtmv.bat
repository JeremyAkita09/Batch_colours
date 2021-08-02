@echo off
setlocal EnableDelayedExpansion



Rem intro 

title Welcome Make a HTML
rem (Batch/Cmd Programming: Lesson 1 (Basics), 2018)
REM it has 3  Different Parameters 
:Start
	if "%1"=="" goto normalStart
	if "%2"=="" goto ErrorMessage
	if "%3"=="" goto ErrorMessage
	if "%4" neq "" goto ErrorMessage
	set name=%~1
	set color=%~2
	set size=%~3
	goto WriteHtml
:ErrorMessage
	echo wrong number of parameters
	pause
	goto finish
:normalStart
echo Select a task:
echo =============
echo -
echo 1) Option 1 :name
echo 2) Option 2 :Color
echo 3) Option 3 :Size
echo -


Rem 
:NAME
echo What name do you want to display?
SET /P name=Please enter your name: 
IF "%name%"=="" GOTO Error
ECHO Hello %name%, Welcome to Name Generator !
GOTO End
:Error
ECHO You did not enter your name! Bye bye!!
GOTO NAME
:End



:colour
echo In what colour (red, green or blue)?
Set /P color=in what colour(red,green or blue)

IF "%color%"=="" GOTO Error
IF /I %color%==red GOTO size
IF /I %color%==green GOTO size
IF /I %color%==blue GOTO size
ECHO Hello %name%,%color%
GOTO finish
:Error
ECHO You did not enter your colour
GOTO colour





:size
echo What font size do you want to use?
Set /P size=What front size do you want to size ?


IF "%size%"=="" GOTO Error
ECHO Hello %name%,%color%,%size%
goto loop
:Error
ECHO You did not enter your size
GOTO size
:End

:loop
if not exist hello.html goto WriteHtml
echo File Exists
SET /P overwrite=Overwrite File?
echo overwrite is %overwrite%
If /I "%overwrite%"=="Y" (goto WriteHtml) else (goto loop)
If /I "%overwrite%"=="N" goto finish
REM this line is never reached    
REM  (CMD?, 2018)

echo hello %1 %2 %3
:WriteHtml
echo. > hello.html
echo ^<^html^> >> hello.html
echo ^<^body^> >> hello.html
echo ^<^p^ ^<^span style='font-size:%size%pt'^>^Hello^<^/^span^>^  >> hello.html
echo ^<^span style='^color:%color%'^>%name%^<^/^span^>^<^/^p^>^  >> hello.html

echo ^<^/body^> >> hello.html
echo ^<^/html^> >> hello.html


pause

:finish   
echo finish


echo hello %name% %color% %size% 


REM Codeproject.com. 2018. Get User Input From DOS Prompt - Codeproject. [online] Available at: <https://www.codeproject.com/Tips/123810/Get-user-input-from-DOS-prompt> [Accessed 24 April 2018].
REM CMD?, H., 2018. How To Check The Result Of An Overwrite File Request In Windows CMD?. [online] Stackoverflow.com. Available at: <https://stackoverflow.com/questions/24034608/how-to-check-the-result-of-an-overwrite-file-request-in-windows-cmd> [Accessed 24 April 2018].
REM YouTube. 2018. Batch/Cmd Programming: Lesson 1 (Basics). [online] Available at: <https://www.youtube.com/watch?v=kboexp3QiUg> [Accessed 24 April 2018].