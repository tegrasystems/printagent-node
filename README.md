# PrintAgent Node — Community Edition

Print labels from your own Windows PC or server, without a cloud account. PrintAgent Node is a Windows service with a local label designer, a local print API and a direct ZPL connection to your label printer.

**Free. No account, no printer limit, no print limit, no subscription.** The Community Edition is free to use but not open source — see [LICENSE.md](LICENSE.md).

Running labels across several locations or teams? The [paid cloud edition](#the-paid-cloud-edition) adds central management, users and roles, central history and support.

[Download](https://printagent.app/download) · [Installation](docs/installation.md) · [FAQ](docs/faq.md) · [Discussions](https://github.com/tegrasystems/printagent-node/discussions) · [Report a bug](https://github.com/tegrasystems/printagent-node/issues/new?template=bug_report.yml) · [Cloud edition](https://printagent.app/pricing)

## What it does

- **Local label designer** — design labels in the browser, with text, barcodes, images and counters.
- **Local print API** — print a template with your own values from any script or application on the same machine.
- **Direct to the printer** — ZPL over TCP port 9100; no driver and no print server.
- **Works offline** — templates, printers and history stay on the machine.
- **Optional cloud link** — connect the node to a PrintAgent cloud account to manage printers and jobs centrally. Not required.

## Requirements

| | |
|---|---|
| OS | Windows 10 or 11, Windows Server 2019 or 2022, x64 |
| Printer | ZPL-compatible label printer on TCP port 9100 (Zebra, CAB, Argox, ...) |
| Disk | About 150 MB |
| Runtime | None — the installer is self-contained |
| Browser | WebView2 Evergreen for the tray window; without it the UI opens in your default browser |

## Quick start

1. Download the latest `PrintAgentNode-Setup-*.exe` from [printagent.app/download](https://printagent.app/download) and verify the SHA-256 shown there.
2. Run the installer as administrator. It installs the Windows service `PrintAgentNode` and the tray application.
3. Open the tray icon and choose **Node openen** (or double-click the icon). The local UI opens at `http://127.0.0.1:7160`.
4. Add your printer on **Printers**, then create or import a template on **Templates**.
5. Open **Print**, pick the template and printer, fill in the values and print. The result appears in **History**.

Detailed steps: [docs/installation.md](docs/installation.md).

## Nederlands

PrintAgent Node is de gratis lokale versie van PrintAgent: een Windows-service met labelontwerper, print-API en directe ZPL-verbinding, zonder account en zonder cloud. Onbeperkt printers en afdrukken. Installeren via [printagent.app/download](https://printagent.app/download); de volledige handleiding staat in [docs/installation.md](docs/installation.md). Vragen en ideeën: [Discussions](https://github.com/tegrasystems/printagent-node/discussions).

## Documentation

| Document | Contents |
|---|---|
| [Installation](docs/installation.md) | Install, first label, LAN access, data locations, update, uninstall |
| [Troubleshooting](docs/troubleshooting.md) | Service, UI, printer, cloud and update problems |
| [FAQ](docs/faq.md) | Licensing, limits, printers, offline use |
| [Reporting](docs/reporting.md) | What to include in a bug report |
| [Examples](examples/) | CSV and HTTP examples for actions |

## Community and support

| I need... | Where |
|---|---|
| To ask a question | [Discussions → Q&A](https://github.com/tegrasystems/printagent-node/discussions/categories/q-a) |
| To suggest a feature | [Discussions → Ideas](https://github.com/tegrasystems/printagent-node/discussions/categories/ideas) |
| To report a bug | [Issues](https://github.com/tegrasystems/printagent-node/issues/new?template=bug_report.yml) |
| To report a vulnerability | [SECURITY.md](SECURITY.md) — never in a public issue |
| Help with a cloud subscription | [info@tegrasystems.nl](mailto:info@tegrasystems.nl) |

Community support is best effort; there is no SLA. See [SUPPORT.md](SUPPORT.md).

## The paid cloud edition

The Community Edition is complete for a single workplace. The cloud edition is for teams that print across several locations, people and systems — and it is what keeps the free edition free.

### What the cloud adds

- **One template for every location.** Manage templates, the image library and the product catalog centrally; publish a change once and every linked node uses it.
- **Users, roles and permissions.** Give colleagues access to exactly what they need, with unlimited PCs and users.
- **Print and monitor from anywhere.** Send print jobs from the web app to any linked node, and see printer status and print history per location.
- **Central history, auditing, statistics and AI assistance.** Every print in one overview, with previews, search and usage reporting — plus AI help when designing labels.
- **Automation at scale.** Configure actions once — file drops, scanner input, HTTP calls or a weighing scale — and sync them to every node.
- **A documented cloud API.** API keys and REST endpoints for your ERP, WMS or other systems.
- **Support and retention.** E-mail support and one year of document and history retention.
- **No lock-in.** If the cloud is unreachable, a linked node keeps printing locally and uploads its history when the connection returns.

### Pricing

One plan: a monthly base fee plus a per-printer rate that falls as your fleet grows, billed yearly in advance. Printing and users are unlimited; you only pay for the printers in your account, and with no printers there is no charge. See [printagent.app/pricing](https://printagent.app/pricing) for the current rates and the free trial.

### Community Edition and the cloud

| | Community Edition | PrintAgent cloud |
|---|---|---|
| Price | Free | Base fee + per-printer rate, billed yearly |
| Account | Not required | Required |
| Printers and prints | Unlimited | Unlimited |
| Users and PCs | Local, no user accounts | Unlimited users and PCs, with roles |
| Label designer | Local | Local, plus central templates, images and products |
| Print API | Local REST API with API keys | Local and cloud API |
| History | Local | Central history, auditing and statistics |
| Printer monitoring | Local | Central dashboard |
| AI assistance | — | Yes |
| Data | On your machine | In the cloud |
| Retention | Your own disk | 1 year of document and history |
| Support | Community, best effort | E-mail support |
| Internet | Only for updates and optional linking | Required |

## License

The Community Edition is proprietary freeware: free to install and use, including commercially, but not open source. Redistribution and reverse engineering are not permitted. The full terms are in [LICENSE.md](LICENSE.md). The cloud edition is governed by the terms on [printagent.app](https://printagent.app).

PrintAgent is a product of Tegra Systems BV.
