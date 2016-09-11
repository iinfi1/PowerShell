<#
Command to retrieve System errors in the last 24 hours and type it to a HTML file
#>
Get-EventLog -LogName System -EntryType Error | Where-Object {($_.TimeWritten -ge (Get-Date).AddDays(-1))}| select EventID, TimeWritten, Message | ConvertTo-Html | Out-File error.htm -Append
