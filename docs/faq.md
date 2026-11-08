# Frequently asked questions

## Is the Community Edition really free?

Yes. There is no trial, no account, no printer limit, no print limit and no subscription. You can use it for personal and commercial printing.

## Is it open source?

No. The Community Edition is proprietary freeware: the binaries are free to use under [LICENSE.md](../LICENSE.md), but the source code is not published. Bugs and feature ideas are still welcome in this repository.

## Can I use it commercially?

Yes, under the terms of [LICENSE.md](../LICENSE.md). You may install it on any number of computers that you own or control. You may not redistribute the installer or sell it as your own product.

## Does it work without internet?

Yes. Installing, designing labels, printing and viewing history all work offline. Internet is only needed for updates, for the optional cloud link, and for opening links in this repository.

## Which printers are supported?

Any label printer that understands ZPL and accepts raw data on TCP port 9100. That includes many Zebra, CAB, Argox, Godex and similar printers. The printer must be reachable over the network; a USB-only printer needs a print server or router that exposes a raw TCP port.

Printers that only support EPL, IPL or a vendor-specific command language are not supported.

## Does it run on Linux or macOS?

No. PrintAgent Node is a Windows service for Windows 10/11 and Windows Server 2019/2022, x64.

## Does it need a dedicated server?

No. Any Windows PC or server that stays on while you print works. The service starts automatically at boot, so you do not need to keep a user session open.

## How many printers and nodes can I use?

There is no limit in the Community Edition. You can run multiple nodes, each with its own printers, templates and history.

## Where are my templates and data stored?

Under `%ProgramData%\Tegra Systems BV\PrintAgent`. See [installation.md](installation.md#8-where-data-is-stored) for the full list. Back up that folder to keep templates and history.

## What happens when the printer is offline?

The node buffers the job and retries automatically. Jobs are kept for up to 24 hours. A real print error, such as invalid ZPL, fails immediately instead of waiting.

## Do I need a PrintAgent cloud account?

No. The node starts in `Standalone` mode and prints locally. Linking to the cloud is optional.

## What does the cloud add?

Central templates, images and products; users, roles and permissions; central history, auditing and statistics; printer monitoring; centrally configured automation; AI assistance; e-mail support and one year of document and history retention. You can print from the PrintAgent web app to any linked node, and a linked node keeps printing locally when the cloud is unreachable.

The local designer and print API are available in both editions. See [The paid cloud edition](../README.md#the-paid-cloud-edition) for the full overview and [printagent.app/pricing](https://printagent.app/pricing) for the current rates.

## How do I update?

Use the tray icon and choose the update option, or download the latest installer from [printagent.app/download](https://printagent.app/download) and run it. Your templates, printers and history are kept.

## Is the local UI available in English?

The local UI is currently in Dutch. The documentation in this repository is in English, with a Dutch quick start in the [README](../README.md#nederlands).

## How do I report a bug?

Open a [bug report](https://github.com/tegrasystems/printagent-node/issues/new?template=bug_report.yml) and include the version, log excerpt, printer model and reproduction steps. See [reporting.md](reporting.md).

## How do I request a feature?

Start a thread in [Discussions → Ideas](https://github.com/tegrasystems/printagent-node/discussions/categories/ideas). Others can vote, which helps us prioritize.

## Is there paid support?

Cloud subscriptions include e-mail support. Community Edition support is best effort via GitHub, without a service level. See [SUPPORT.md](../SUPPORT.md).

## Can I get the source code or a custom build?

No. The source is not published and we do not provide custom builds. For integrations, use the local print API.
