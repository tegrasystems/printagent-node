param(
    [Parameter(Mandatory = $true)]
    [string]$ApiKey,

    [Parameter(Mandatory = $true)]
    [string]$TemplateId,

    [Parameter(Mandatory = $true)]
    [hashtable]$Values,

    [string]$Printer,

    [int]$Copies = 1,

    [string]$BaseUrl = "http://127.0.0.1:7160"
)

$body = @{
    templateId = $TemplateId
    values     = $Values
    copies     = $Copies
}

if ($Printer) {
    $body.printer = $Printer
}

$json = $body | ConvertTo-Json -Depth 6

try {
    $result = Invoke-RestMethod `
        -Method Post `
        -Uri "$BaseUrl/api/print" `
        -Headers @{ "X-Api-Key" = $ApiKey } `
        -ContentType "application/json" `
        -Body $json

    Write-Host "Status: $($result.status)"
    Write-Host "History id: $($result.historyId)"
    $result
}
catch {
    Write-Error "Print failed: $($_.Exception.Message)"
    exit 1
}
