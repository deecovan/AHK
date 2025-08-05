;for AHK 1.1.34.04
;by cheva (c) MIT 2012-2022

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
    ; Set a flag to control the clicking loop
    ClickingActive := true
    
    ; Loop indefinitely while ClickingActive is true
    Loop
    {
        ; Check if the right mouse button is being held down
        If GetKeyState("RButton", "P")
        {
            ; If RButton is pressed, stop the clicking loop
            ClickingActive := false
            Break ; Exit the loop
        }
        
        ; Perform a left click
        Click
        
        ; Add a small delay between clicks (optional, adjust as needed)
        Sleep, 50 ; milliseconds
    }
Return

; Assign a hotkey to stop the auto-clicking if needed (e.g., if you want to stop it without pressing RButton)
$Space::
    Send, {Space}
    ClickingActive := false
Return