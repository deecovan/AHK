;-=-\ Let's intro \-=-
;ver 23.1129.1
;for AHK 1.1.34.04
;by cheva (c) MIT 2012-2024

;-=-\ Set globals \-=-
global SMin = 200
global SMax = 600
global MMin = 2
global MMax = 6
MouseSpeed = % ran(MMin, MMax)
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
;$^F1::
;	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
;	Process,Close,svchost.exe
;return

;; Enable mouse clicker (Shift-Click, random time 200-400 msec, return to current mouse position)
$^+C::
	Send, {^+C}
	MouseGetPos, ClickX, ClickY
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
	Sleep, 500
	Loop
	{
		if (BreakLoop == 1)
		{
			BreakLoop = 0
			break
		}
		MouseGetPos, OrigX, OrigY
		Send, {LShift Down}
		MouseClick, left, %ClickX%, %ClickY%
		SoundPlay %A_WinDir%\Media\Windows Navigation Start.wav
		Send, {LShift Up}
		MouseMove, %OrigX%, %OrigY%
		Sleep, % ran(SMin, SMax)
		MouseSpeed = % ran(MMin, MMax)
		SetDefaultMouseSpeed, MouseSpeed
	}
return

;; Hold keys Down

$^+G::
	Send, {G Down}
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
return

$^+LButton::
	Send, {LButton Down}
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
return

$^+RButton::
	Send, {RButton Down}
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
return

$^+MButton::
	Send, {MButton Down}
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
return

; View and Run

$!W::
	MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
	Send, {LAlt Down}
	Send, {W Down}
	SoundPlay %A_WinDir%\Media\Windows Pop-up Blocked.wav
return

