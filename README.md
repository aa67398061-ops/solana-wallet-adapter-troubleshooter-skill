# Solana Wallet Adapter Troubleshooter Skill

A Claude Code / Codex skill for diagnosing Solana wallet connection, signing,
transaction confirmation, and Mobile Wallet Adapter issues in React, Next.js,
and mobile-web dApps.

This skill is designed as a practical addon for the Solana AI Kit ecosystem. It
helps agents debug the parts of a Solana frontend that often break in real
projects: wallet provider setup, cluster and RPC mismatches, SSR boundaries,
Mobile Wallet Adapter user gestures, transaction blockhash expiry, simulation
failures, and wallet-specific signing behavior.

## Why This Skill Exists

Solana frontend issues are rarely caused by one obvious bug. A failing "connect"
button may be a provider order issue, a Wallet Standard mismatch, an Android MWA
gesture problem, a stale dependency, or a cluster mismatch. A transaction that
"does nothing" may have failed simulation, expired blockhash, missing signer,
insufficient balance, compute budget pressure, or confirmation logic that does
not use the blockhash context.

This skill gives AI agents a repeatable triage workflow so they ask for the
right files, inspect the right invariants, and produce concrete patches instead
of generic advice.

## What It Covers

- React and Next.js wallet provider setup
- `@solana/wallet-adapter-react` and Wallet Standard flows
- Wallet modal and auto-connect debugging
- Mobile Wallet Adapter for Android web users
- Sign-in-with-Solana and `signMessage` user gesture traps
- Transaction build, send, simulation, and confirmation issues
- Error string triage for common wallet and Solana client failures
- Production review checklist for dApp wallet UX

## Install

Copy the `skill/` folder into your agent's skills directory, or install the
entire repository beside other Solana AI Kit skills.

```bash
git clone https://github.com/YOUR_USERNAME/solana-wallet-adapter-troubleshooter-skill
cd solana-wallet-adapter-troubleshooter-skill
node scripts/validate-skill.mjs
```

## Usage Examples

```text
"My Phantom connect button works locally but fails in production. Debug it."
"Review this Next.js wallet provider setup."
"Mobile Wallet Adapter opens but signMessage never appears on Android Chrome."
"My Solana transaction signature is returned but confirmation times out."
"Audit this wallet flow before launch."
```

## Repository Structure

```text
solana-wallet-adapter-troubleshooter-skill/
|-- README.md
|-- LICENSE
|-- commands/
|   |-- audit-wallet-flow.md
|   `-- diagnose-wallet.md
|-- rules/
|   `-- wallet-adapter-react.md
|-- scripts/
|   `-- validate-skill.mjs
|-- skill/
|   |-- SKILL.md
|   `-- references/
|       |-- error-playbook.md
|       |-- mobile-wallet-adapter.md
|       |-- review-checklist.md
|       |-- transaction-signing.md
|       `-- wallet-connection.md
`-- tests/
    `-- expected-files.json
```

## Source References

- Solana Mobile Wallet Adapter overview:
  https://docs.solanamobile.com/get-started/mobile-wallet-adapter
- Solana Mobile Wallet Adapter web UX guidelines:
  https://docs.solanamobile.com/get-started/web/ux-guidelines
- Anza Wallet Adapter app guide:
  https://github.com/anza-xyz/wallet-adapter/blob/master/APP.md
- Solana Foundation development skill:
  https://github.com/solana-foundation/solana-dev-skill
- Superteam Brazil Solana game skill structure:
  https://github.com/solanabr/solana-game-skill

## License

MIT
