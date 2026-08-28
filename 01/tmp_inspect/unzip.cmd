@echo off
setlocal
set "UNZIP_MODE=%~1"
set "UNZIP_FILE=%~2"
set "UNZIP_ENTRY=%~3"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; if ($env:UNZIP_MODE -eq '-Z1') { $z=[System.IO.Compression.ZipFile]::OpenRead($env:UNZIP_FILE); $z.Entries | ForEach-Object FullName; $z.Dispose() } elseif ($env:UNZIP_MODE -eq '-p') { $z=[System.IO.Compression.ZipFile]::OpenRead($env:UNZIP_FILE); $e=$z.GetEntry($env:UNZIP_ENTRY); if ($null -eq $e) { exit 1 }; $s=$e.Open(); $o=[Console]::OpenStandardOutput(); $s.CopyTo($o); $o.Flush(); $s.Dispose(); $z.Dispose() } else { exit 2 }"
endlocal
