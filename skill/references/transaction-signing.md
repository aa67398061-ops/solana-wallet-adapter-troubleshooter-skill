# Transaction Signing and Confirmation Triage

Use this reference when a wallet connects but transactions fail, hang, return a
signature without confirmation, fail simulation, or behave differently across
wallets.

## Files to Inspect

- Function that builds the transaction
- Function that calls `sendTransaction`, `signTransaction`, or `signAllTransactions`
- Confirmation helper
- RPC endpoint configuration
- Error logs from wallet, browser console, server logs, and simulation output

## Stage Map

1. Build:
   - Are all required accounts present?
   - Is the fee payer set correctly?
   - Are instructions ordered correctly?
   - Are program IDs and token mints for the selected cluster?
2. Prepare:
   - Is the latest blockhash fetched close to send time?
   - Is the transaction version supported by the wallet?
   - Are address lookup tables available on the selected cluster?
3. Sign:
   - Does the connected wallet have the required signer?
   - Are partial signers applied before wallet signing?
   - Is the app asking a wallet to sign a transaction with missing required
     signatures?
4. Send:
   - Is simulation failing?
   - Is the RPC rate limited?
   - Does the transaction need compute budget or priority fees?
5. Confirm:
   - Is confirmation using the blockhash and `lastValidBlockHeight` returned for
     this transaction?
   - Is the app polling the same cluster used to send?

## Confirmation Pattern

Prefer this shape for wallet-adapter flows:

```ts
const {
  context: { slot: minContextSlot },
  value: { blockhash, lastValidBlockHeight },
} = await connection.getLatestBlockhashAndContext();

transaction.recentBlockhash = blockhash;
transaction.feePayer = publicKey;

const signature = await sendTransaction(transaction, connection, {
  minContextSlot,
});

await connection.confirmTransaction({
  blockhash,
  lastValidBlockHeight,
  signature,
});
```

If the app uses `VersionedTransaction`, keep the same stage discipline:
fresh blockhash, wallet-supported message version, send, then confirmation with
the matching blockhash context.

## Simulation First

When a transaction fails after signing, ask for simulation logs or run
simulation when possible. The most useful output is:

- Instruction index
- Program log lines
- Custom error code
- Units consumed
- Account owner or signer mismatch
- Insufficient funds or rent errors

Do not guess from a generic wallet popup if simulation logs are available.

## Common Root Causes

- Blockhash fetched too early and expired before wallet approval
- Confirmation checks a different cluster than send
- Missing fee payer or wrong fee payer
- Token account does not exist
- Associated token account creation is missing or ordered incorrectly
- Program account address belongs to another cluster
- Wallet does not support the requested transaction version
- App requires `signMessage` but the wallet only supports transaction signing
- Compute budget too low under production load

## QA Checklist

- Test devnet and mainnet-beta separately if both are supported.
- Test slow wallet approval by waiting before approving.
- Test rejection and make sure UI recovers.
- Test insufficient balance and show a specific error.
- Test successful signature in explorer for the selected cluster.
- Test refresh after success so stale pending state does not persist.
