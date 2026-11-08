# Installation

This guide installs PrintAgent Node on a Windows PC or server and prints a first label without a cloud account.

## 1. Requirements

- Windows 10 or 11, or Windows Server 2019 or 2022, x64.
- Administrator rights for the installer.
- A ZPL-compatible label printer that is reachable over TCP port 9100. A USB-only printer that is not shared on the network cannot be used directly.
- About 150 MB of disk space.
- No .NET runtime is required; the installer is self-contained.
- WebView2 Evergreen for the tray window. Most Windows 10/11 machines already have it. Without it, the local UI opens in your default browser.

## 2. Download

Download the latest `PrintAgentNode-Setup-*.exe` from [printagent.app/download](https://printagent.app/download). That page shows the version and the SHA-256 of the installer.

You can also browse the [node releases](https://github.com/tegrasystems/tegra-releases/releases?q=node-v&expanded=true). The download page is the canonical place; always check the SHA-256 before running the installer.

Verify the hash in PowerShell:

```powershell
Get-FileHash .\PrintAgentNode-Setup-1.5.13.exe -Algorithm SHA256
```

Compare the result with the value on the download page. If it differs, do not run the file and report it via [SECURITY.md](../SECURITY.md).

## 3. Install

1. Right-click the installer and choose **Run as administrator**.
2. Follow the wizard. The default folder is `C:\Program Files\Tegra Systems BV\PrintAgent`.
3. The installer creates and starts the Windows service `PrintAgentNode` and places the tray application in the same folder.
4. If Windows SmartScreen shows a warning: the installer is not code-signed. Check the SHA-256 first, then choose **More info → Run anyway** if you trust the download.

The node starts in **Standalone** mode. It does not need an account, a subscription or an internet connection.

## 4. Open the local UI

The tray icon appears in the notification area. Double-click it, or right-click and choose **Node openen**. The UI opens at:

```
http://127.0.0.1:7160
```

The tray passes a per-start access token. Opening the URL directly in a browser without that token returns `401 Unauthorized`; always open the UI through the tray.

## 5. Print your first label

1. Open **Printers** and add your printer: a name, the IP address or hostname, port `9100` and the correct dpi (203 or 300).
2. Open **Templates** and create a template, or import an existing design as JSON. Choose **Ontwerpen** to open the label designer.
3. Add a text or barcode element, place your fields and save the template.
4. Open **Print**, select the template and printer, fill in the values and print.
5. The result appears in **History**. If the printer was offline, the job is buffered and printed when the printer becomes reachable.

## 6. Link to the cloud (optional)

A cloud link lets you manage printers and print jobs from the PrintAgent app. It is not required for local printing.

1. In the PrintAgent app, open **Agents** and choose **Koppelen** to get a link code.
2. In the node UI, open **Settings** and enter the code.
3. Sign in when the node asks for it.

The node then switches from `Standalone` to `Linked`. If the cloud is temporarily unreachable, it continues printing locally in `LinkedOffline` mode.

To disconnect, use **Disconnect** on the Settings page or in the tray menu. Templates, printers and history stay on the machine.

## 7. LAN access (optional)

By default the UI and API listen on `127.0.0.1` only. To reach the node from another machine on your network, edit `node-settings.json` in the data folder:

```json
{
  "Node": {
    "Http": {
      "Lan": true,
      "LanAddress": "192.168.1.20"
    }
  }
}
```

Use the machine's own LAN address, never `0.0.0.0` or `+`. Restart the service afterwards:

```powershell
sc stop PrintAgentNode
sc start PrintAgentNode
```

Anyone who can reach the port needs the node token or a node API key. Do not expose the node directly to the internet; use a firewall, VPN or reverse proxy with authentication.

The optional actions API listens on port `7158` when `Actions:Http:Enabled` is on. It is separate from the UI and is disabled by default.

## 8. Where data is stored

Everything is stored under:

```
%ProgramData%\Tegra Systems BV\PrintAgent
```

| Path | Contents |
|---|---|
| `settings.json` | Node settings |
| `node-settings.json` | Connection and LAN settings |
| `node.db` | History, outbox, print tasks and scale registrations (SQLite) |
| `printers.json` | Local printers and their cloud link |
| `Products.json` | Local product list |
| `templates\` | Templates, versions and images |
| `node-api-token` | Token for the local UI (generated at startup) |
| `node-api-keys.json` | Hashed API keys for integrations |
| `node-status.json` | Current status and mode |
| `Logs\` | Daily log files |

Back up this folder if you want to keep templates and history. Do not copy it while the service is running unless you use a snapshot.

## 9. Update

The tray checks for updates and can install them. The node asks the PrintAgent API for the latest release and downloads the installer from the release feed.

To update manually, download the latest installer and run it. The installer stops the service, keeps your `appsettings.json`, and starts the service again. Your data in `%ProgramData%` is not removed.

## 10. Uninstall

Use **Apps & features** in Windows, or **Add or remove programs**, and remove **PrintAgent Node**. The service and program files are removed. Data in `%ProgramData%\Tegra Systems BV\PrintAgent` is kept.

To remove everything, stop the service, back up anything you need, and delete that folder manually.

## Problems?

See [troubleshooting.md](troubleshooting.md). If that does not help, ask in [Discussions](https://github.com/tegrasystems/printagent-node/discussions) or report a bug with the [issue template](https://github.com/tegrasystems/printagent-node/issues/new?template=bug_report.yml).
