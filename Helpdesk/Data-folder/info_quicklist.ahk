#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Last edit 8.8.17


; -- KB Quick Search -- ;

KB_Search: ; The way the particular ticket system this was orginally written for allowed you to enter sections into the URL to  search. Due to the way autohot key handles URLS and symbols this had to be broken up so that it knew how to run the  URL
KBURL1 := "part of url 1" 
KBURL2 := "url part 2"
InputBox, searchterm, Search Box, Please enter in your search terms, , 300, 160
if (ErrorLevel > 0){
	MsgBox, Search canceled
	Exit
}
Run, %KBURL1%%searchterm%%KBURL2%
return


; -- Other quick links -- ;
softcatalog:
run, <URL>
return

knowledgecatalog:
knowledgevar := "BASE URL"
run, %knowledgevar%
return




; -- Most used knowledge -- ; ; Opens URLS to web pages for IT access

knowledge1:
Run, <URL>
return
knowledge2:
Run, <URL>
return
knowledge3:
Run, <URL>
return
knowledge4:
Run, <URL>
return