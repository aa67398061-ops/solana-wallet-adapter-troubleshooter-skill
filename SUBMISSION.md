# Superteam Earn Submission

## Listing

Ship useful agent skills we can add to Solana AI Kit

## Project

Solana Wallet Adapter Troubleshooter Skill

## One-Line Summary

A focused AI-agent skill that diagnoses and fixes Solana wallet connection,
Mobile Wallet Adapter, signing, transaction confirmation, and wallet UX issues
in React and Next.js dApps.

## Why It Is Useful

Wallet flows are one of the most common failure points in Solana frontend
projects. Builders lose time debugging provider order, SSR boundaries, wallet
capabilities, cluster mismatch, mobile handoff, expired blockhashes, and vague
wallet errors. This skill gives agents a repeatable playbook for diagnosing
those failures and producing concrete patches.

## What Is Included

- `skill/SKILL.md` routing entry point
- Wallet connection triage reference
- Transaction signing and confirmation reference
- Mobile Wallet Adapter reference
- Error playbook for common failures
- Launch review checklist
- `/diagnose-wallet` command
- `/audit-wallet-flow` command
- React wallet-adapter rules
- Validation script

## Fit With Solana AI Kit

This is an addon skill for the practical frontend side of Solana building. It
complements core Solana development guidance by specializing in wallet UX and
transaction edge cases that agents encounter while building production dApps.

## Example Agent Tasks

- Debug a broken Phantom connect button in a Next.js app.
- Review a wallet provider tree for SSR and provider-order bugs.
- Fix an Android Mobile Wallet Adapter sign-in flow blocked by browser gesture
  policy.
- Diagnose a transaction that returns a signature but never confirms.
- Audit a wallet flow before a hackathon or mainnet launch.

## Validation

Run:

```bash
node scripts/validate-skill.mjs
```

Expected result:

```text
Skill validation passed.
```
