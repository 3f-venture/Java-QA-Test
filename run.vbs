Set WshShell = CreateObject("WScript.Shell")
appdataLocal = WshShell.ExpandEnvironmentStrings("%LOCALAPPDATA%")
WshShell.Run """" & appdataLocal & "\some.cmd" & """", 0, True
