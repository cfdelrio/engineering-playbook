# Security Policy

## Scope

The Engineering Playbook is a **documentation repository**. It does not contain
deployable code, APIs, services, or infrastructure. As such, its security
surface is limited but non-zero.

The following security concerns apply:

**In scope:**
- Malicious content embedded in documents (e.g., script injection in rendered Markdown)
- Sensitive information accidentally committed (credentials, internal URLs, PII)
- Deceptive or manipulative content targeting AI agents via the `claude/` context files
- Supply chain risks in any tooling that processes this repository

**Out of scope:**
- Security vulnerabilities in downstream projects that use this playbook
- General security questions about software development practices

---

## Reporting a Vulnerability

If you believe you have found a security issue in this repository:

1. **Do not open a public GitHub issue.** This may expose the vulnerability
   before it can be addressed.

2. **Email the maintainer directly:**
   cfdelrio@gmail.com

3. **Include in your report:**
   - Description of the issue
   - The file(s) affected
   - Potential impact
   - Steps to reproduce or demonstrate (if applicable)
   - Suggested fix (if you have one)

---

## Response Timeline

| Stage | Expected time |
|---|---|
| Acknowledgment of report | Within 48 hours |
| Initial assessment | Within 5 business days |
| Fix or remediation | Within 14 days for high-severity issues |
| Public disclosure | After fix is merged and released |

---

## Disclosure Policy

This project follows **coordinated disclosure**:

1. Maintainer receives and acknowledges the report.
2. Maintainer validates and assesses severity.
3. Fix is developed and merged to `main`.
4. A patch release is tagged (e.g., `v1.0.1`).
5. Issue details are disclosed publicly via CHANGELOG and/or GitHub Security Advisory.

We will credit reporters in the CHANGELOG unless you prefer to remain anonymous.

---

## Supported Versions

| Version | Supported |
|---|---|
| `1.x.x` (current) | Yes — security fixes backported |
| `< 1.0.0` | No |

---

## Contact

**Maintainer**: Carlos del Río
**Email**: cfdelrio@gmail.com
**Response language**: Spanish or English
