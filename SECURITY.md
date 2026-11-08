# Security policy

## Supported versions

Only the latest release of PrintAgent Node receives security fixes. Please reproduce the issue on the latest version before reporting it.

## Reporting a vulnerability

**Do not open a public issue for a security vulnerability.**

Use GitHub's private vulnerability reporting:

1. Go to the [Security tab](https://github.com/tegrasystems/printagent-node/security).
2. Choose **Report a vulnerability**.
3. Describe the issue and how to reproduce it.

If you cannot use GitHub, e-mail [info@tegrasystems.nl](mailto:info@tegrasystems.nl) with `Security` in the subject.

Please include:

- the PrintAgent Node version and Windows version;
- a description of the vulnerability and its impact;
- steps to reproduce, and a proof of concept if you have one;
- any suggested mitigation.

We aim to acknowledge your report within 5 business days and to keep you informed about the progress. Please give us reasonable time to fix the issue before disclosing it publicly.

## Scope

In scope:

- the installer, Windows service, tray application and local web UI/API;
- authentication and authorization of the local API, API keys and node token;
- handling of templates, images, actions and print data.

Out of scope:

- the PrintAgent cloud platform (report to info@tegrasystems.nl);
- third-party printer firmware and printer configuration;
- vulnerabilities that require an attacker to already have administrator access to the machine;
- social engineering and physical access.

## Safe harbor

We will not pursue legal action against researchers who report a vulnerability in good faith, do not access or modify data that is not theirs, and do not disrupt production systems.
