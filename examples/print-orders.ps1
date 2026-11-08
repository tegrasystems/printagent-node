param(
    [Parameter(Mandatory = $true)]
    [string]$ApiKey,

    [Parameter(Mandatory = $true)]
    [string]$TemplateId,

    [string]$CsvPath = (Join-Path $PSScriptRoot "orders.csv"),

    [string]$Printer,

    [string]$BaseUrl = "http://127.0.0.1:7160"
)

if (-not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found: $CsvPath"
    exit 1
}

$rows = Import-Csv -Path $CsvPath
$failed = 0

foreach ($row in $rows) {
    $values = @{}
    foreach ($property in $row.PSObject.Properties) {
        if ($property.Name -ne "copies" -and $property.Value -ne "") {
            $values[$property.Name] = $property.Value
        }
    }

    $copies = if ($row.copies) { [int]$row.copies } else { 1 }
    $body = @{
        templateId = $TemplateId
        values     = $values
        copies     = $copies
    }

    if ($Printer) {
        $body.printer = $Printer
    }

    try {
        $result = Invoke-RestMethod `
            -Method Post `
            -Uri "$BaseUrl/api/print" `
            -Headers @{ "X-Api-Key" = $ApiKey } `
            -ContentType "application/json" `
            -Body ($body | ConvertTo-Json -Depth 6)

        Write-Host "$($row.order): $($result.status) (history $($result.historyId))"
    }
    catch {
        $failed++
        Write-Warning "$($row.order): $($_.Exception.Message)"
    }
}

if ($failed -gt 0) {
    Write-Warning "$failed of $($rows.Count) labels failed."
    exit 1
}

Write-Host "Printed $($rows.Count) labels."
