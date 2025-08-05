;for AHK 1.1.34.04
;by cheva (c) MIT 2012-2022

;-----Let's init!-----
ClickingActive := false

;-=-\ Functions \-=-
ran(min, max)
{
	random, ran, min, max
	return ran                                                                                                                                                      
}

DoClick()
{
global ClickingActive
  Loop {
    Click                                      
    Sleep, ran(150, 250)
    If GetKeyState("LButton", "P") or ClickingActive == false
    {
      ; If LButton is pressed again, stop the clicking loop
      ClickingActive := false
      Break ; Exit the loop
    }
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

; Assign a hotkey to stop the auto-clicking via reload
; !!!Pause script or exit to use Space!!!
$Space::Reload
