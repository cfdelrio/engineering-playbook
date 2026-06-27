# Changelog

All notable changes to the Engineering Playbook are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Engineering Maturity Levels (EML) framework for projects
- Product Decision Records (DEC) template and process
- Release governance documentation
- Security policy and reporting guidelines
- Support and contribution guidelines

### Changed
- (Planned) Rename ADL to EDL for clarity

### Deprecated
- (None)

### Removed
- (None)

### Fixed
- (None)

### Security
- (None)

---

## [1.0.0] — 2026-06-26

### Added

#### Foundation
- `CONSTITUTION.md` — 8 non-negotiable articles establishing engineering discipline
  - Article 1: Architecture First
  - Article 2: Spec Before Code
  - Article 3: Domain Driven Design
  - Article 4: Quality Gates (6 mandatory checks)
  - Article 5: AI as Peer
  - Article 6: Security Default
  - Article 7: Observability
  - Article 8: Reversibility

#### Playbook (15 documents in reading order)
- `00-manifesto.md` — Why we build this way
- `01-product.md` — Product thinking and decision-making
- `02-principles.md` — Foundational engineering principles
- `03-architecture.md` — Architecture decision process
- `04-domain-driven-design.md` — DDD framework and patterns
- `05-spec-driven-development.md` — From idea to implementation
- `06-engineering.md` — Engineering practices and standards
- `07-testing.md` — Testing strategy by level
- `08-code-review.md` — Code review process and quality
- `09-build.md` — Build automation and CI setup
- `10-deployment.md` — Deployment and release process
- `11-observability.md` — Monitoring, logging, and alerts
- `12-security.md` — Security practices and mindset
- `13-ai-assisted-engineering.md` — Working with AI agents like Claude Code
- `14-roadmap.md` — Where this playbook evolves

#### Governance
- **Lifecycle** (3 documents explaining document and decision management)
  - `lifecycle/ADL.md` — Architecture Decision Log for transversal decisions
  - `lifecycle/decision-framework.md` — 5-level decision hierarchy
  - `lifecycle/document-lifecycle.md` — Document state machine and archival

- **Standards** (3 documents defining consistency)
  - `standards/document-metadata.md` — Metadata table for all official documents
  - `standards/repository-topology.md` — Folder structure standard
  - `standards/naming.md` — Naming conventions for code, files, documentation

#### Templates (6 ready-to-use templates)
- `templates/adr-template.md` — Architecture Decision Record
- `templates/feature-spec-template.md` — Feature specification
- `templates/pr-template.md` — Pull request template
- `templates/project-readme-template.md` — Project README
- `templates/system-prompt-template.md` — Claude Code context template
- `templates/architecture-decision-template.md` — Architecture decision overview

#### Claude Code Context (9 specialized guides)
- `claude/system.md` — Hub for AI agent instructions
- `claude/architecture.md` — Architecture decisions and patterns
- `claude/engineering.md` — Engineering practices
- `claude/spec-driven.md` — Spec-driven development
- `claude/quality.md` — Quality standards
- `claude/testing.md` — Testing approach
- `claude/review.md` — Code review criteria
- `claude/deployment.md` — Deployment and release
- `claude/security.md` — Security considerations

#### Examples
- `examples/aurora/` — Complete reference implementation of the playbook
  - Domain model, product vision, specifications
  - Demonstrates DDD, architecture separation, spec-driven approach

### Notes

This is the v1.0.0 foundation release. It establishes:
- The engineering constitution (rules)
- The playbook doctrine (15-document learning path)
- The lifecycle framework (how decisions are made and documented)
- Standards for consistency (naming, structure, metadata)
- Templates for common artifacts
- Guidelines for AI-assisted engineering
- A complete example (AURORA)

All documents reference each other through a navigation system. The playbook is
designed to be read sequentially, but each section is self-contained enough to
use as a reference.

**Stability**: The Constitution and core playbook (articles 1-7) are
**stable** and changes require ADL approval. Templates and examples may
evolve with minor releases.

---

### Versioning Policy

- **Major version (1.0.0 → 2.0.0)**: Breaking changes to CONSTITUTION or decision framework
- **Minor version (1.0.0 → 1.1.0)**: New playbook documents, new templates, new examples
- **Patch version (1.0.0 → 1.0.1)**: Typos, clarifications, link fixes

See [`docs/governance/versioning.md`](./docs/governance/versioning.md) for details.

---

**Generated**: 2026-06-26
