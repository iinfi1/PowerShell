<#Parsing XML files
Output of DiskSPD run#>

$x = [xml] (cat .\DiskSPD_results.xml)
$x.Results.System.ComputerName
$x.Results.TimeSpan.CpuUtilization.CPU[0]
$x.Results.TimeSpan.CpuUtilization.Average
$x.Results.TimeSpan.Latency.AverageTotalMilliseconds
$x.Results.TimeSpan.Latency.AverageReadMilliseconds
$x.Results.TimeSpan.Latency.AverageWriteMilliseconds
