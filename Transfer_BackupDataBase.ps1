CD 'C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy'

$Source = ""
$Date = (Get-Date).AddDays(-1).ToString("yyyy_MM_dd")
$file = "perfix*" + $Date +"*"

$Dest = "https://xxxx.file.core.windows.net/folder"
$Token = "TOKEN"

$logfile = $Source + "log_"+$Date+".txt"

$Result = .\AzCopy.exe /Source:$Source /Dest:$Dest /DestKey:$Token /Pattern:$file /NC:2 /Y /V:$logfile
$Result
[int]$Failed = $Result[5].Split(“:”)[1].Trim()
$Journal = "$env:LocalAppData\Microsoft\Azure\AzCopy"
$i=1
while ($Failed -gt 0) {
    $i++
    [int]$Failed = $Result[5].Split(“:”)[1].Trim()
    $Result = .\AzCopy.exe /Z:$Journal
    $Result
    $i
}
[int]$Failed = $Result[5].Split(“:”)[1].Trim()
if ($Failed -eq 0)
{
    $Source = $Source + "*"
    Remove-Item –path $Source -Filter $file
}