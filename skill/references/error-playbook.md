# Error Playbook

Map exact errors to likely wallet-flow causes. Always prefer real logs over a
similar-looking message.

## WalletNotConnectedError

Likely causes:

- Transaction handler runs before `publicKey` exists.
- Connect button and send button are not gated by `connected`.
- App state assumes auto-connect succeeded.
- A provider was remounted and lost wallet state.

Fix:

- Disable transaction actions until `publicKey` and wallet capability are
  present.
- Re-check connection at click time.
- Avoid hidden background sends.

## User rejected the request

Likely causes:

- User cancelled in wallet.
- Wallet popup showed unclear transaction details.
- App retries automatically after rejection.

Fix:

- Treat rejection as a normal branch.
- Show a specific retry option.
- Do not retry without another user click.

## Transaction simulation failed

Likely causes:

- Program account or mint belongs to a different cluster.
- Missing account, ATA, signer, or owner.
- Insufficient funds or rent.
- Compute budget exceeded.
- Program custom error.

Fix:

- Inspect simulation logs and instruction index.
- Add preflight UI checks where possible.
- Map known custom errors to human-readable messages.

## Blockhash not found / transaction expired

Likely causes:

- Blockhash fetched too early.
- User took too long to approve.
- Confirmation used a stale blockhash.

Fix:

- Fetch blockhash immediately before wallet signing.
- Confirm with the matching `{ blockhash, lastValidBlockHeight, signature }`.
- Rebuild and request a fresh signature after expiry.

## Signature verification failed

Likely causes:

- Missing required signer.
- Partial signer order is wrong.
- Transaction mutated after signing.
- Fee payer changed after signature.

Fix:

- Set fee payer and blockhash before signing.
- Apply all non-wallet partial signatures before wallet signing.
- Never mutate signed message contents.

## WalletSignTransactionError

Likely causes:

- Wallet does not support the transaction version.
- Wallet rejected unsupported instruction or account shape.
- App requested signing outside a supported user flow.

Fix:

- Check wallet capability.
- Try a legacy transaction only if the app can safely support it.
- Provide a wallet-specific fallback or message.

## Hydration failed / window is not defined

Likely causes:

- Wallet code runs in a Next.js server component.
- Browser-only wallet package imported server-side.
- Wallet UI renders different markup between server and client.

Fix:

- Move wallet provider and wallet UI into client components.
- Dynamically import browser-only wallet UI when needed.
- Keep provider state stable across route changes.

## Requested resource not available / rate limit

Likely causes:

- Public RPC endpoint is throttling.
- App sends repeated simulations or polling loops.
- Confirmation loop has no backoff.

Fix:

- Add backoff and cancellation.
- Use a dedicated RPC endpoint for production.
- Reduce duplicate polling from React effects.
