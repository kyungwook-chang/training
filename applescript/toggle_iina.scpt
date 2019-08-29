#!/usr/bin/osascript

on is_running(appName)
    tell application "System Events" to (name of processes) contains appName
end is_running

if is_running("IINA") then
    tell application "System Events"
        set windowMinimized to (value of attribute "AXMinimized" of window 1 of process "IINA")
        if windowMinimized then
            tell application "IINA" 
                reopen
                activate
            end tell
            tell application "System Events"
                key code 49
            end tell
        else
            tell application "IINA" to activate
            tell application "System Events"
                key code 49
                keystroke "m" using command down
            end tell 
        end if
    end tell
end if
