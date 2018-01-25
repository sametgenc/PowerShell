Write-Output "############################################ System Info ############################################" >> powershell.txt
Write-Output " " >> powershell.txt


systeminfo | findstr "OS" | findstr "Name:" >> powershell.txt
systeminfo | findstr "OS" | findstr "Version:" >> powershell.txt
systeminfo | findstr "System" | findstr "Type:" >> powershell.txt


Write-Output " " >> powershell.txt
Write-Output "########################################## Serial-FileSytem ##########################################" >> powershell.txt
Write-Output " " >> powershell.txt


Get-WmiObject -class win32_operatingsystem | findstr "SerialNumber" >> powershell.txt
Get-WmiObject -class Win32_Volume | findstr "FileSystem" >> powershell.txt


Write-Output " " >> powershell.txt
Write-Output "############################################# Network Info ###########################################" >> powershell.txt


Get-WmiObject -class Win32_NetworkAdapterConfiguration | where-object { $_.IPAddress -ne $null } >> powershell.txt

Write-Output "Arp Table:" >> powershell.txt
arp -a >> powershell.txt
Write-Output " " >> powershell.txt
netstat -r >> powershell.txt


Write-Output " " >> powershell.txt
Write-Output "############################################## User Info #############################################" >> powershell.txt
Write-Output " " >> powershell.txt


Write-Output "Users Group Information:" >> powershell.txt
Get-ADGroup -filter * | Select-Object Name,ObjectGUID >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Current User:" >>powershell.txt
[System.Security.Principal.WindowsIdentity]::GetCurrent().Name >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Local Users of this system:" >> powershell.txt
Get-AdUser -filter * | Select-Object Name >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Local Admins of this system:" >> powershell.txt
Get-WmiObject -class win32_groupuser | Where-Object { $_.GroupComponent -match 'administrators' -and ($_.GroupComponent -match "Domain=`"$env:COMPUTERNAME`"")} | ForEach-Object {[wmi]$_.PartComponent } | Select-Object Caption,SID | format-table -Wrap >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Logged on Users:" >> powershell.txt
gwmi win32_LoggedOnUser  | select Antecedent >> powershell.txt

Write-Output "Current User Command History: " >> powershell.txt
Get-History  >> powershell.txt
Write-Output " " >> powershell.txt


Write-Output " " >> powershell.txt
Write-Output "############################################## Process Info ############################################" >> powershell.txt
Write-Output " " >> powershell.txt


Write-Output "Processes:" >> powershell.txt
Get-Process | Select-Object id,ProcessName, CPU >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Running Services:" >> powershell.txt
Get-Service | Where-Object { $_.Status -match 'running'} >> powershell.txt
Write-Output " " >> powershell.txt

netstat >> powershell.txt
Write-Output "" >> powershell.txt

Write-Output "Scheduled Tasks:" >> powershell.txt
Get-ScheduledTask | Where-Object { $_.State -match 'Ready'} >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Tasklist:">> powershell.txt
tasklist >> powershell.txt


Write-Output " " >> powershell.txt
Write-Output "########################################## Domain Info (AD only) #######################################" >> powershell.txt
Write-Output " " >> powershell.txt


Write-Output "Domain Information:" >> powershell.txt
Get-ADDomain >> powershell.txt
Write-Output " " >> powershell.txt

Write-Output "Domain Controller Information:" >> powershell.txt
Get-ADDomainController >> powershell.txt

cat powershell.txt
rm powershell.txt
