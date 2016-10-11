
<#
Command to retrieve System errors in the last 24 hours and type it to a HTML file
#>
Get-EventLog -LogName System -EntryType Error | Where-Object {($_.TimeWritten -ge (Get-Date).AddDays(-1))}| select EventID, TimeWritten, Message | ConvertTo-Html | Out-File error.htm -Append

<#Parsing XML files
Output of DiskSPD run#>

$x = [xml] (cat .\DiskSPD_results.xml)
$x.Results.System.ComputerName
$x.Results.TimeSpan.CpuUtilization.CPU[0]
$x.Results.TimeSpan.CpuUtilization.Average
$x.Results.TimeSpan.Latency.AverageTotalMilliseconds
$x.Results.TimeSpan.Latency.AverageReadMilliseconds
$x.Results.TimeSpan.Latency.AverageWriteMilliseconds

<#
Simple filters
#>
Get-Service | where {$_.Status -eq "stopped"}
Get-Service | where {$_.Status -eq "Running"}


<#Get info from all Computers in the Active Directory#>
Get-ADComputer -Filter * | select -Property @{n='ComputerName' ;e={$_.name}} | Get-Service -Name bits


