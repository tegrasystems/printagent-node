# Reporting a bug

A good report gets a faster answer. Before you post:

1. Check the [installation guide](installation.md) and [troubleshooting guide](troubleshooting.md).
2. Search [issues](https://github.com/tegrasystems/printagent-node/issues) and [discussions](https://github.com/tegrasystems/printagent-node/discussions).
3. Reproduce the problem on the latest version.

## Where to post

| Topic | Channel |
|---|---|
| Question or how-to | [Discussions → Q&A](https://github.com/tegrasystems/printagent-node/discussions/categories/q-a) |
| Feature idea | [Discussions → Ideas](https://github.com/tegrasystems/printagent-node/discussions/categories/ideas) |
| Reproducible bug | [Issues](https://github.com/tegrasystems/printagent-node/issues/new?template=bug_report.yml) |
| Security vulnerability | [SECURITY.md](../SECURITY.md), never a public issue |

## What to include

### Version and environment

The version is shown in the tray menu and in `node-status.json`. Also mention:

- Windows version and build;
- node mode: `Standalone`, `Linked` or `LinkedOffline`;
- printer make, model, dpi and connection (network, print server);
- whether the problem occurs with every template or one specific template.

### Steps to reproduce

Write the smallest sequence that shows the problem:

1. What did you do?
2. What did you expect?
3. What happened instead?

If possible, include the template JSON or a minimal design that reproduces it. Remove company data first.

### Logs

Open the log folder from the tray (**Logs openen**) or go to:

```
%ProgramData%\Tegra Systems BV\PrintAgent\Logs
```

Include the lines around the timestamp of the problem, not the whole file. Use a code block.

**Remove tokens, API keys, passwords, company names and customer data.** A log line with a token is not needed to diagnose the problem.

### Screenshots

A screenshot of the node UI, the preview or the printed label helps. For print quality problems, a photo of the physical label is more useful than a screenshot.

## What happens next

- A maintainer adds `needs-triage`.
- We may ask for more information and add `needs-info`. If there is no response within 14 days, the report may be closed.
- Confirmed bugs get a priority and, when possible, a workaround.
- You can reopen a closed report with new information.

We cannot promise a fix or a date. Community support is best effort; see [SUPPORT.md](../SUPPORT.md).
