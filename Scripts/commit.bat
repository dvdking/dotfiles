@echo off
SET currentDir=%cd%
start "" "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" /command:commit /path:%currentDir% /closeonend:1