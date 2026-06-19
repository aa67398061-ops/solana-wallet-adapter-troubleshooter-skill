# Wallet Adapter React Rules

Apply these rules when editing React or Next.js Solana wallet code.

## Provider Rules

- Keep `ConnectionProvider` outside `WalletProvider`.
- Keep `WalletModalProvider` inside `WalletProvider`.
- Render wallet UI only under the provider tree.
- Keep wallet provider state stable across route changes.
- In Next.js, put wallet providers in a client component.

## Hook Rules

- Call `useWallet` and `useConnection` only inside React components or hooks.
- Re-check `publicKey`, `connected`, and required wallet capabilities inside the
  click handler, not only at render time.
- Do not call wallet approval methods from effects unless the wallet
  documentation explicitly supports that flow.

## Transaction Rules

- Set fee payer and blockhash before requesting a wallet signature.
- Do not mutate a transaction after signing.
- Fetch a fresh blockhash close to user approval.
- Confirm with the blockhash context that matches the sent signature.
- Surface simulation logs when available.

## Mobile Rules

- Keep MWA connect/sign actions tied to direct user events.
- Prefer `signIn()` for connect plus message signing.
- Label MWA in human terms, for example "Use Installed Wallet".
- Provide a fallback when no compatible mobile wallet is available.

## Error Handling Rules

- Treat user rejection as a normal state.
- Avoid generic "Something went wrong" for wallet failures.
- Preserve the original error in developer logs.
- Stop pending/loading state on every rejection or failure path.
