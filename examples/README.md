# Examples

These examples use the local print API of PrintAgent Node. They work in `Standalone` mode, without a cloud account.

## Create an API key

1. Open the node UI through the tray.
2. Go to **Settings → API keys**.
3. Create a key and copy it immediately. The raw key is shown only once.

Treat the key as a password. It can read status, printers and history, and it can print. It cannot change settings.

## Print a template

Endpoint:

```
POST http://127.0.0.1:7160/api/print
```

Headers:

```
X-Api-Key: pa_node_...
Content-Type: application/json
```

Body:

```json
{
  "templateId": "6f1c2a9e4b7d4c0e8a3f5b2d1c9e7a40",
  "values": {
    "order": "A-1042",
    "product": "Coffee beans 1 kg",
    "barcode": "8712345678901"
  },
  "printer": "Zebra ZD421",
  "copies": 1
}
```

The template id is in the URL when you open a template in the designer. `printer` is the name from the **Printers** page. Instead of `printer`, you can pass `host` and `port` to print to an address that is not in the printer list.

Response:

```json
{
  "ok": true,
  "status": "Printed",
  "documentNumber": 42,
  "localId": "…",
  "historyId": 128
}
```

If the printer is unreachable, the status is `WaitingForPrinter` and the job is buffered. If printing fails, the status is `Failed`.

## cURL

```bash
curl -X POST "http://127.0.0.1:7160/api/print" \
  -H "X-Api-Key: pa_node_..." \
  -H "Content-Type: application/json" \
  -d '{"templateId":"6f1c2a9e4b7d4c0e8a3f5b2d1c9e7a40","values":{"order":"A-1042"},"printer":"Zebra ZD421"}'
```

## PowerShell

Print one label:

```powershell
.\print-label.ps1 `
  -ApiKey "pa_node_..." `
  -TemplateId "6f1c2a9e4b7d4c0e8a3f5b2d1c9e7a40" `
  -Printer "Zebra ZD421" `
  -Values @{ order = "A-1042"; product = "Coffee beans 1 kg" }
```

Print one label per row in a CSV file:

```powershell
.\print-orders.ps1 `
  -ApiKey "pa_node_..." `
  -TemplateId "6f1c2a9e4b7d4c0e8a3f5b2d1c9e7a40" `
  -Printer "Zebra ZD421"
```

Edit `orders.csv` or pass `-CsvPath` to use your own file. Every column except `copies` becomes a template value; `copies` sets the number of labels.

## API documentation on the node

The node serves its own OpenAPI document and Scalar UI:

- `http://127.0.0.1:7160/openapi/v1.json`
- `http://127.0.0.1:7160/scalar/v1`

These pages need the node token in the browser. Open them through the tray if you get `401`.

## Actions

Actions (file drops, scales, HTTP triggers) are configured in the PrintAgent cloud app and synchronized to a linked node. They are not part of the standalone quick start. For the local API, use the endpoint above.
