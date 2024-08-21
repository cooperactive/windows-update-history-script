if (Get-Command ConvertTo-Json -ErrorAction SilentlyContinue) {
    chcp 65001 > $null 2>&1; mkdir C:\\temp\\scripts\\ > $null 2>&1;
    $Session = New-Object -ComObject "Microsoft.Update.Session";
    $Searcher = $Session.CreateUpdateSearcher();
    $historyCount = $Searcher.GetTotalHistoryCount();
    if ($historyCount -gt 0) {
        $updates = $Searcher.QueryHistory(0, $historyCount) | Select-Object Title, Date, @{name="Operation"; expression={switch($_.operation){1 {"Installation"}; 2 {"Uninstallation"}; 3 {"Other"}}}};

        # Filter only updates that contain a KB number
        $updatesWithKB = $updates | Where-Object {$_.Title -match 'KB\d+'} | Sort-Object {[int]($_.Title -replace '^.*KB(\d+).*$','$1')}

        # Format and save the updates to a file
        $updatesWithKB | Format-Table -Property Title, Date, Operation -AutoSize | Out-File C:\\temp\\scripts\\formatted_updates.txt -Encoding utf8
        Get-Content C:\\temp\\scripts\\formatted_updates.txt
    } else {
        Write-Host "No updates installed";
    }
} else {
    Write-Host "ConvertTo-Json module is not available";
}
