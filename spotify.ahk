SetTitleMatchMode 2 

#Persistent 
SetTimer, RefreshTrayTip, 500 
playingsave := "" 
Gosub, RefreshTrayTip  ; Call it once to get it started right away. 
return 

; "CTRL + ALT + LEFT"  for previous 
^!Left:: 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^{Left}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 


; "CTRL + ALT + RIGHT"  for next 
^!Right:: 
{ 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^{Right}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 
} 

; "CTRL + ALT + UP"  for pause
^!UP::
{ 
DetectHiddenWindows, On 
ControlSend, ahk_parent, {space}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 
} 

; "CTRL + ALT + DOWN"  for info 
^!Down:: 
{ 
DetectHiddenWindows, On 
SetTitleMatchMode 2 
WinGetTitle, now_playing, ahk_class SpotifyMainWindow 
StringTrimLeft, playing, now_playing, 10 
TrayTip, Now playing:, %playing%., 10 , 16
SetTimer, RemoveTrayTip, -3000
DetectHiddenWindows, Off 
return 
} 

RefreshTrayTip:
WinGetTitle, now_playing, ahk_class SpotifyMainWindow
StringTrimLeft, playing, now_playing, 10
if(playing != playingsave) {
  TrayTip, Now playing:, %playing%., 10 , 16
  SetTimer, RemoveTrayTip, -3000
}
playingsave := playing 
return

RemoveTrayTip:
  TrayTip
  return

; "CTRL + PAGE UP"  for volume up
~LControl & WheelUp::
{ 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^{Up}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 
} 

; "CTRL + PAGE DOWN"  for volume down
~LControl & WheelDown::
{ 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^{Down}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 
} 

; "CTRL + END"  for mute
^End::
{ 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^+{Down}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 
}