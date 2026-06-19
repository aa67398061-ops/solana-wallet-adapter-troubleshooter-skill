# Wallet Flow Review Checklist

Use this before launch, bounty submission, or code review.

## Provider and Rendering

- Wallet providers wrap every component using wallet hooks.
- Next.js wallet code is inside client components.
- Wallet modal CSS loads exactly once.
- Provider order is correct.
- No duplicate wallet providers exist in nested routes.

## Cluster and RPC

- Endpoint and cluster label match.
- Explorer links use the same cluster.
- Program IDs and token mints belong to the selected cluster.
- Production does not rely on public dev endpoints.
- RPC errors are surfaced with actionable text.

## Connection UX

- Connect button is disabled or loading during connection.
- Disconnect clears app-specific wallet state.
- Rejection is handled without automatic retry.
- Auto-connect failure does not block manual connect.
- Wallet list is readable on mobile and desktop.

## Mobile Wallet Adapter

- Android web path prefers MWA when available.
- Connect/sign actions happen from direct user events.
- Sign-In with Solana uses `signIn` when available.
- MWA is labeled clearly, such as "Use Installed Wallet".
- In-app browser limitations are handled with a clear fallback.

## Transaction UX

- Fee payer and blockhash are set before signing.
- Transaction is not mutated after signing.
- Confirmation uses matching blockhash context.
- Simulation errors show useful details.
- Slow approval and expired blockhash paths are tested.
- Success links open the correct explorer cluster.

## Error Handling

- User rejection is not treated as an app crash.
- Insufficient funds message is specific.
- Missing token account path is handled.
- Unsupported wallet capability has a fallback.
- Rate limits and RPC failures do not leave permanent pending state.

## Manual QA Matrix

Test at least:

- Fresh load then connect
- Refresh after auto-connect
- Disconnect then reconnect
- Reject connect
- Reject transaction
- Slow transaction approval
- Insufficient SOL
- Devnet and mainnet-beta if both are supported
- Android Chrome with MWA if mobile web is supported
