# Superteam Submission Answers

## Repository URL

To be filled after public GitHub repo creation:

```text
https://github.com/aa67398061-ops/solana-wallet-adapter-troubleshooter-skill
```

## What did you build?

I built `solana-wallet-adapter-troubleshooter-skill`, an agent skill for
diagnosing and fixing Solana wallet connection, signing, transaction
confirmation, and Mobile Wallet Adapter issues in React and Next.js dApps.

The skill includes a `SKILL.md` routing entry point, focused references for
wallet connection triage, transaction signing, Mobile Wallet Adapter, error
mapping, launch review, command templates, React wallet-adapter rules, install
scripts, and a validation script.

## Why is this useful for Solana AI Kit?

Solana agents often help builders ship dApps, and wallet flows are one of the
most common places where those projects break. A generic coding agent may give
broad advice, but this skill gives the agent a repeatable diagnostic workflow:
identify the failure stage, inspect the right files, check provider and cluster
invariants, map exact error strings, and produce concrete patches.

It complements core Solana development skills by specializing in the frontend
wallet layer: wallet-adapter React setup, Next.js client/server boundaries,
Mobile Wallet Adapter browser behavior, signing UX, blockhash expiry, simulation
failures, and confirmation logic.

## What makes it novel?

The skill focuses on wallet-flow triage as a complete agent workflow rather
than a single code snippet. It combines:

- Wallet provider and connection invariants
- Mobile Wallet Adapter user gesture guidance
- Transaction confirmation and blockhash patterns
- Error playbook for wallet and Solana client failures
- Production review checklist for wallet UX

This helps an AI agent move from vague symptoms like "wallet connect fails" or
"transaction never confirms" to a specific root cause and patch.

## How can reviewers test it?

1. Clone the repository.
2. Run `node scripts/validate-skill.mjs` or `npm run validate`.
3. Ask an agent to use the skill for prompts like:
   - "My Phantom connect button works locally but fails in production."
   - "Mobile Wallet Adapter opens but signMessage never appears on Android Chrome."
   - "My transaction returns a signature but confirmation times out."
   - "Audit this Solana wallet flow before launch."

Expected validation output:

```text
Skill validation passed.
```

## Suggested tags

```text
solana, wallet-adapter, mobile-wallet-adapter, react, nextjs, ai-skill, solana-ai-kit
```
