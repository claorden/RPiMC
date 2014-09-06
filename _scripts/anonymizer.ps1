$configFiles=get-childitem "..\Config files\Flexget\anonymized" *.yml -rec
foreach ($file in $configFiles)
{
(Get-Content $file.PSPath) | 
Foreach-Object {$_ -replace 'username:.*', 'username: XXXXXXXX'} | Foreach-Object {$_ -replace 'password:.*', 'password: "XXXXXXXX"'} | Foreach-Object {$_ -replace 'api_key:.*', 'api_key: XXXXXXXX'} | Foreach-Object {$_ -replace 'apikey:.*', 'apikey: XXXXXXXX'} | Foreach-Object {$_ -replace 'device:.*', 'device: XXXXXXXX'} |
Set-Content $file.PSPath
}