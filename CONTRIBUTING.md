# Contributing to Engineering Playbook

Thank you for improving the Engineering Playbook. This document explains how contributions work.

## Philosophy

The Engineering Playbook is the **source of truth** for engineering practices across AURORA, ProdeCaballito, Engage, Storysell, and future projects.

- **We don't change it lightly.** Playbook changes affect all projects.
- **Every change is intentional.** We document the WHY, not just the WHAT.
- **We evolve together.** Contributions come from real experience, not theory.

## Types of Contributions

### 1. Typos, clarifications, link fixes (Patch)

These can be fixed directly and merged with a quick review.

**Example**: "This section is unclear" → rewrite for clarity.

**Process**:
1. Fork and create a branch: `fix/typo-in-architecture`
2. Make the change
3. Create PR with title: `Fix: Clarify X in playbook/03-architecture.md`
4. Merge once approved

**No ADL needed**: These don't change the decision, only the words.

### 2. Improvements to existing documents (Minor)

Updates to existing playbook sections, templates, or examples.

**Example**: "This template is incomplete" → add examples, fix structure.

**Process**:
1. Create a branch: `improve/feature-spec-examples`
2. Make the change
3. Create PR with title: `Improve: Add examples to feature-spec-template.md`
4. Link to any related issues or discussions
5. Merge once approved by a maintainer

**No ADL needed**: Just improving the form, not the principle.

### 3. New playbook documents (Minor)

Add new sections to the playbook (e.g., "15-versioning.md").

**Process**:
1. Create a branch: `feature/new-playbook-versioning`
2. Write the document with standard metadata (see `standards/document-metadata.md`)
3. Add navigation links to adjacent documents
4. Update the main README
5. Create PR with description of what this adds and why
6. Discuss in the PR whether this needs ADL approval

**May need ADL**: If it's a transversal principle affecting all projects, propose it as ADL first.

### 4. New governance concepts (Major)

Add new layers like EML, DEC, or EDL; changes to decision framework.

**Example**: "We need Engineering Maturity Levels" → propose before implementing.

**Process**:
1. **Create a Discussion issue** (GitHub) or slack thread describing:
   - What problem this solves
   - How it affects existing projects
   - What breaks (if anything)
   - Why this timing

2. Await feedback (1+ week)

3. Create a branch: `feature/eml-engineering-maturity`

4. Implement as one or more documents:
   - New playbook section
   - New template
   - Updates to decision-framework.md

5. Create PR with complete proposal

6. **Requires explicit approval** from at least 2 maintainers

7. Merge to main

**See also**: `lifecycle/decision-framework.md` for the 5-level decision hierarchy.

### 5. Changes to CONSTITUTION or core principles (Breaking)

Modifications to `CONSTITUTION.md` or `lifecycle/decision-framework.md`.

**Example**: "Article 4 (Quality Gates) should allow 5 checks instead of 6."

**Process**:
1. Open an Issue describing the change and rationale
2. Create an ADL (Architecture Decision Log) proposal
3. Write a detailed case for the change
4. Link to the ADL from the issue
5. Wait for feedback (2+ weeks)
6. Require vote from maintainers
7. Merge only if unanimous (or with documented dissent)

**These changes must be tagged v2.0.0+** (major version bump).

---

## How to Create an ADR (Architecture Decision Record)

ADRs document **project-local** architectural decisions. Use this process:

1. Copy `templates/adr-template.md` to your project's `docs/architecture/adr/ADR-NNN-title.md`
2. Fill in:
   - Status: "Proposed" or "Accepted"
   - Decision: Clear 1-2 sentence decision
   - Context: What led to this decision
   - Alternatives: What was considered but rejected
   - Consequences: Tradeoffs
3. Request code review (1-2 engineers)
4. Update status to "Accepted" and commit

**ADRs are immutable** once merged. If you need to change a decision, write a new ADR explaining why.

See [`lifecycle/ADL.md`](./lifecycle/ADL.md) for transversal ADLs and [`lifecycle/document-lifecycle.md`](./document-lifecycle.md) for full lifecycle.

---

## How to Create a DEC (Product Decision Record)

DECs document **product/business** decisions (not technical). Use when deciding:
- Target customers (coaches vs. athletes)
- Feature scope (include X or not)
- Release timing
- Sunset decisions (stop supporting Y)

1. Copy `templates/dec-template.md` to `docs/decisions/DEC-NNN-title.md`
2. Fill in:
   - Status: "Proposed" or "Accepted"
   - Decision: What choice was made
   - Rationale: Why this choice (business, user, competitive)
   - Alternatives: What was rejected and why
   - Timeline: When does this apply
3. Request approval from Product + Staff Engineer
4. Merge to main

DECs help future engineers understand the business logic behind feature choices.

---

## How to Create a Feature Spec

Feature specs bridge Product and Engineering. Use this process:

1. Copy `templates/feature-spec-template.md` to `docs/specs/FEATURE-NNN-name.md`
2. Fill in all sections:
   - Product Brief (1 page summary for stakeholders)
   - Domain Spec (business rules, domain model impact)
   - Technical Spec (architecture, data flow, implementation notes)
   - Acceptance Criteria (how to verify done)
3. Request review from:
   - Product (brief is clear)
   - Staff Engineer (domain and tech specs are sound)
4. Update status to "Accepted"
5. Start implementation
6. Update status to "In Progress" as you code
7. Update status to "Implemented" when PR merged
8. Update status to "Released" when live

See `playbook/05-spec-driven-development.md` for the full flow.

---

## Code of Conduct

This project adheres to the [Contributor Covenant](./CODE_OF_CONDUCT.md). By
participating, you agree to uphold this code of conduct.

---

## Questions?

- **About the playbook**: Open an issue and tag a maintainer
- **About contributing**: See [`SUPPORT.md`](./SUPPORT.md)
- **About security**: See [`SECURITY.md`](./SECURITY.md)

---

## Maintainers

- Carlos del Río (@cfdelrio) — Lead maintainer

Maintainers review PRs, approve contributions, and guide playbook evolution.

---

**Last updated**: 2026-06-26
