---
name: solana-wallet-adapter-troubleshooter
description: Diagnose and fix Solana wallet connection, signing, transaction confirmation, and Mobile Wallet Adapter issues in React, Next.js, and mobile-web dApps.
---

# Solana Wallet Adapter Troubleshooter

Use this skill when a Solana dApp has wallet connection, wallet modal,
auto-connect, signing, transaction sending, confirmation, cluster, RPC, or
Mobile Wallet Adapter problems.

This is a focused frontend-debugging addon. For program development, Anchor,
Pinocchio, or core Solana SDK architecture, use the project's primary Solana
development skill first, then return here for wallet and transaction UX issues.

## First Response Workflow

1. Identify the failure stage:
   - Provider setup
   - Wallet selection or connection
   - Message signing or Sign-In with Solana
   - Transaction construction
   - Wallet signing
   - Sending or simulation
   - Confirmation
   - Mobile Wallet Adapter handoff
2. Ask for only the files or logs needed for that stage:
   - Wallet provider component
   - Connect button or wallet modal component
   - Transaction sending function
   - Network/RPC configuration
   - Exact console error, wallet error, signature, or failed simulation logs
   - Device/browser/wallet matrix for mobile failures
3. Load the smallest relevant reference below.
4. Produce a concrete diagnosis, then patch or propose code changes.
5. When fixing code, preserve the app's existing wallet package family unless
   the dependency choice is the root cause.

## Reference Routing

- For wallet modal, providers, cluster mismatches, SSR, dependency, and
  auto-connect issues, read `references/wallet-connection.md`.
- For transaction build, blockhash, simulation, send, and confirmation issues,
  read `references/transaction-signing.md`.
- For Android web, MWA, deep-link, `connect`, `signIn`, and user gesture issues,
  read `references/mobile-wallet-adapter.md`.
- For exact error messages and likely causes, read
  `references/error-playbook.md`.
- Before launch or bounty submission reviews, read
  `references/review-checklist.md`.

## Default Debugging Contract

Always report:

- Failure stage
- Evidence used
- Most likely root cause
- Minimal fix
- Regression test or manual QA step
- Remaining uncertainty

Avoid:

- Replacing a wallet stack without proving the old one is the problem
- Mixing `@solana/kit` and `@solana/web3.js` objects without an explicit boundary
- Calling wallet methods from `useEffect` when a mobile browser requires a user
  gesture
- Confirming transactions without the latest blockhash context
- Hiding wallet errors behind generic toast messages

## Strong Defaults

- For React apps using wallet-adapter, keep provider order as:
  `ConnectionProvider` -> `WalletProvider` -> `WalletModalProvider` -> app UI.
- Keep endpoint, cluster label, explorer link cluster, and wallet network in one
  visible configuration path.
- In Next.js, isolate wallet UI in client components and avoid server rendering
  browser-only wallet modules.
- For transaction confirmation, fetch blockhash context close to send time and
  confirm with `{ blockhash, lastValidBlockHeight, signature }`.
- For Mobile Wallet Adapter web flows, perform connect/sign actions from a
  direct user event and prefer `signIn()` for connect plus message signing.

## Commands

- `/diagnose-wallet` - triage a broken wallet connection or transaction flow.
- `/audit-wallet-flow` - review a Solana wallet UX before production or bounty
  submission.

## Source Anchors

This skill is aligned with public Solana wallet documentation and existing skill
structures:

- Solana Mobile Wallet Adapter overview
- Solana Mobile Wallet Adapter web UX guidelines
- Anza Wallet Adapter React app guide
- Solana Foundation `solana-dev-skill`
- Superteam Brazil `solana-game-skill`
