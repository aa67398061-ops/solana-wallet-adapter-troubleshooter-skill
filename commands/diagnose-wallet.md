# /diagnose-wallet

Diagnose a broken Solana wallet connection, signing, or transaction flow.

## Input to Request

Ask for the smallest useful set:

- Wallet provider component
- Connect button or transaction button
- Transaction send/sign function
- Network/RPC config
- Exact error text and browser console logs
- Wallet, browser, device, and cluster

## Procedure

1. Classify the failure stage:
   - Provider
   - Connect
   - Sign message
   - Build transaction
   - Sign transaction
   - Send/simulate
   - Confirm
   - Mobile handoff
2. Load the matching reference from `skill/references/`.
3. Check the highest-value invariant first.
4. Produce a minimal patch or a precise diagnostic plan.
5. Give one manual QA step that proves the fix.

## Output Format

```text
Stage:
Evidence:
Root cause:
Fix:
Patch:
QA:
Remaining risk:
```

## Common Fast Paths

- `WalletNotConnectedError`: inspect button gating and provider remounts.
- `window is not defined`: inspect Next.js client/server boundaries.
- `Blockhash not found`: move blockhash fetch closer to signing and confirm with
  matching blockhash context.
- Android Chrome MWA failure: inspect user gesture and `signIn` path.
