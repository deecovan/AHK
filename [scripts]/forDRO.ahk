;for AHK 1.1.34.04
;by cheva (c) MIT 2012-2022

;-----Let's init!-----
ClickingActive := true

;-=-\ Functions \-=-
ran(min, max)
{
	random, ran, min, max
	return ran                                                                                                                                                      
}

DoClick()
{
  Loop {
    Click
    Sleep, 100
    if ClickingActive == flase 
      Break
  }
}

SoundPlay %A_WinDir%\Media\Windows Message Nudge.wav

;reload
$^+R::Reload

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
return
;-----Let's play!-----

; Assign a hotkey to start the auto-clicking
$LButton::
Send, {LButton}
    if ClickingActive == true
    {
        ; If LButton is pressed again, stop the clicking loop
        ClickingActive := false
    } else {
      ; Set a flag to control the clicking loop
      ClickingActive := true
      DoClick() 
    }
Return

; Assign a hotkey to stop the auto-clicking if needed (e.g., if you want to stop it without pressing RButton)
$Space::
    Send, {Space}
    ClickingActive := false
Return