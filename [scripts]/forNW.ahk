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
; Emergency process kill
$^F1::
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
	Process,Close,svchost.exe
return

;enable mouse clicker (random time 1-10 sec, current mouse position)
$^+C::
	Send, {^+C}
	MouseGetPos, ClickX, ClickY
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
	Sleep, 1000
	Loop
	{
		if (BreakLoop == 1)
		{
			BreakLoop = 0
			break
		}
		MouseGetPos, OrigX, OrigY
		MouseClick, left, %ClickX%, %ClickY%
		SoundPlay %A_WinDir%\Media\Windows Navigation Start.wav
		MouseMove, %OrigX%, %OrigY%
		Sleep, % ran(1000, 9000)
		global MouseSpeed = % ran(1, 20)
		SetDefaultMouseSpeed, MouseSpeed
	}
return

$!1::            
	Send, {LAlt, Up}
	Send, {1, Up}
	Send, 6
	Sleep, % ran(150, 200)
	Send, 8
	Sleep, % ran(150, 200)
	Send, 6
	Sleep, % ran(150, 200)
	Send, 6
	Sleep, % ran(150, 200)
	Send, 8
	Sleep, % ran(150, 200)
	Send, 6
return 
