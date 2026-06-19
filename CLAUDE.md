# Solana Wallet Adapter Troubleshooter Skill

This repository contains an agent skill for Solana wallet-flow debugging.

When maintaining this repo:

- Keep `skill/SKILL.md` as the main dynamic routing entry.
- Keep detailed guidance in `skill/references/`.
- Keep commands short and action-oriented.
- Avoid large copied documentation blocks; link to upstream sources instead.
- Run `node scripts/validate-skill.mjs` before publishing.

Primary use cases:

- Wallet connection failures
- Wallet modal/provider issues
- Next.js client/server wallet boundaries
- Mobile Wallet Adapter browser handoff failures
- Sign-In with Solana and message signing issues
- Transaction signing, send, simulation, and confirmation failures
