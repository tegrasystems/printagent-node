# Troubleshooting

Start with the log files in `%ProgramData%\Tegra Systems BV\PrintAgent\Logs\` (one file per day) and the status on the node's **Overview** page or in `node-status.json`.

## The service is not running

```powershell
sc query PrintAgentNode
sc start PrintAgentNode
```

If it stops immediately, check the log for the startup error. A missing or invalid configuration is the most common cause. The installer puts `appsettings.json` next to the service executable; do not edit it unless you know which value is wrong.

## The browser shows 401 Unauthorized

The local API requires the token that the service generates at startup. Open the UI through the tray (**Node openen**), not by typing the URL yourself. The tray adds the token to the page.

The token is stored in `%ProgramData%\Tegra Systems BV\PrintAgent\node-api-token`. Treat it as a password.

## The local UI does not open

- Check that the service is running.
- Check the port: `netstat -ano | findstr :7160`. If another process uses it, change `Node:Http:Port` in `node-settings.json` and restart the service.
- Check the Windows firewall if you access the node from another machine. LAN access must be enabled explicitly (see [installation.md](installation.md#7-lan-access-optional)).
- A wrong `Host` header returns `400`; use `127.0.0.1` or the configured LAN address.

## The WebView2 window does not open

Install the Microsoft Edge WebView2 Evergreen Runtime. Without it, the tray falls back to opening the UI in your default browser. This does not affect printing.

## The printer is not reachable

Test the network path from the node machine:

```powershell
Test-NetConnection 192.168.1.50 -Port 9100
```

- `TcpTestSucceeded : True` means the port is open. If printing still fails, the printer is probably not in ZPL mode.
- `False` means a network, firewall, VLAN or printer problem. Check the IP address, the subnet and the printer's network settings.
- A printer that only accepts USB is not reachable over TCP. Share it through a print server that accepts raw port 9100 traffic, or use a network-capable printer.

## The label is blank, cut off or unreadable

- Check that the printer uses ZPL, not EPL, IPL or a vendor-specific emulation.
- Check the dpi in the printer configuration in the node (203 or 300) and the label size in the template. A 300 dpi design printed on a 203 dpi printer is scaled or clipped.
- Check the preview in **Print**. If the preview is correct but the paper is not, the problem is in the printer configuration, not the template.
- Very small text and dense barcodes can fail on a 203 dpi printer. Increase the size or use 300 dpi.
- Make sure the label size configured in the printer matches the physical label.

## The job stays on "Waiting for printer"

The node buffers the job when the printer cannot be reached and retries automatically. Check the printer's network connection and power. When the printer is back, the job is printed without further action. Jobs are kept for up to 24 hours.

A real print error (for example an invalid ZPL command) fails immediately instead of waiting.

## The cloud does not see my node

- Check the mode on the **Overview** page: `Standalone` means the node is not linked; `LinkedOffline` means it is linked but cannot reach the cloud.
- Check the API URL and hub URL in `node-settings.json`, and test internet access from the machine.
- Linking requires an outbound connection on port `5140` for the login flow. Corporate firewalls sometimes block it.
- Check the **History** page for uploads that are waiting in the outbox.
- If the node was disconnected deliberately, link it again from the PrintAgent app.

## The update fails

- Check the log for the download or installer error.
- Download the latest installer from [printagent.app/download](https://printagent.app/download) and run it manually.
- Make sure the service account can write to its program folder and to `%ProgramData%`.
- An antivirus product may block the installer. Check its quarantine and allow the file after verifying the SHA-256.

## SmartScreen or antivirus blocks the installer

The installer is not code-signed. SmartScreen may show "Windows protected your PC". Verify the SHA-256 on the download page, then choose **More info → Run anyway** if it matches. If antivirus quarantines the file, restore it only after verifying the hash.

## I need to start over

Stop the service, back up `%ProgramData%\Tegra Systems BV\PrintAgent`, and rename that folder. Start the service again: it creates a fresh configuration. Restoring the folder brings back templates, printers and history, so only do this if you accept losing them.

## Still stuck?

Ask in [Discussions → Q&A](https://github.com/tegrasystems/printagent-node/discussions/categories/q-a) or open a [bug report](https://github.com/tegrasystems/printagent-node/issues/new?template=bug_report.yml). Include the version, the log excerpt, your printer model and the steps to reproduce.
