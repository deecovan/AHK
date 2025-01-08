;-=-\ Let's intro \-=-
;ver 23.1129.1
;for AHK 1.1.34.04
;by cheva (c) MIT 2012-2024

;-=-\ Set globals \-=-
global MouseSpeed = % ran(1, 20)
SetDefaultMouseSpeed, MouseSpeed

;-=-\ Functions \-=-
ran(min, max)
{
	random, ran, min, max
	return ran                                                                                                                                                      
}

;-=-\ Init \-=-
SoundPlay %A_WinDir%\Media\Windows Message Nudge.wav

;reload
$^+R::
  Reload
Return

;suspend/resume
$^+S::
;pause/resume
$^+P::
;use both to sleep/pause
  ;thanks to Rohwedder
  ;https://www.autohotkey.com/boards/viewtopic.php?t=50594
  Suspend ;Suspend Hotkeys
  Pause,,1 ;Pause Script
  If !(Reload := !Reload)
    Reload ;Reload Script
Return

;exit
$^+W::
  Send, {^+W}
  SoundPlay %A_WinDir%\Media\Windows Logoff Sound.wav
  Sleep, 1000
  ExitApp
Return

;Steam {PrintScreen}
$PrintScreen::
  Send, {PrintScreen}
  Send, {F12}
return

;-----Let's play!-----
; Emergency exit
$^+F1::Process,Close,League of Legends.exe

; Use Alt Space to lock camera if not set in Preferences
$!Space::
	if (!BreakLoop)
	{
		SoundPlay %A_WinDir%\Media\Windows Navigation Start.wav
		Send, {Space Down}
		BreakLoop = 1
		return
	}
	SoundPlay %A_WinDir%\Media\Windows Menu Command.wav
	Send, {Space Up}
	BreakLoop = 0
return

; Use MB2 to Move, Alt_MB2 to Move to Attack position, 
; Alt MB1 to Move and Attack (key a in prefrences) with click on position
$!LButton:: 
	Send, a
	Sleep, 100
	Click
	SoundPlay %A_WinDir%\Media\Windows Navigation Start.wav
return
