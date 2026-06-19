# Wallet Connection Triage

Use this reference for provider setup, wallet modal, connect button,
auto-connect, SSR, cluster, and dependency issues.

## Files to Inspect

- Wallet provider component
- App root layout
- Connect button or wallet modal component
- Network/RPC config
- Package versions for:
  - `@solana/wallet-adapter-base`
  - `@solana/wallet-adapter-react`
  - `@solana/wallet-adapter-react-ui`
  - `@solana/wallet-adapter-wallets`
  - `@solana/web3.js`
  - `@solana/kit`, if present

## Provider Invariants

For wallet-adapter React apps, verify the app has this nesting:

```tsx
<ConnectionProvider endpoint={endpoint}>
  <WalletProvider wallets={wallets} autoConnect>
    <WalletModalProvider>
      {children}
    </WalletModalProvider>
  </WalletProvider>
</ConnectionProvider>
```

Common mistakes:

- `WalletMultiButton` rendered outside `WalletModalProvider`
- Connect button rendered before provider initialization
- Different app trees use different wallet providers
- Endpoint changes without remounting or invalidating stale connection state
- SSR imports browser-only wallet packages in a server component
- `autoConnect` enabled while unsupported wallets throw during page load

## Next.js Checks

- Any component calling `useWallet`, `useConnection`, `window`, or wallet UI
  packages must be a client component.
- Keep wallet providers in a client-only boundary.
- Do not import wallet modal CSS from a nested component that may mount late.
- If hydration differs between server and client, confirm wallet UI is not
  rendered with server-only data.

## Cluster and Endpoint Checks

All of these must agree:

- RPC endpoint
- Cluster label shown in UI
- Wallet network expectation
- Explorer link cluster
- Faucet/airdrop instructions
- Token mint or program addresses

Symptoms of mismatch:

- Wallet connects, but balances are zero
- Token accounts appear missing
- Program errors only happen in production
- Explorer links show "transaction not found"
- The same signature works on one explorer cluster but not another

## Dependency Checks

Prefer one wallet stack per app. If the app uses wallet-adapter, do not
silently replace it with a custom `window.solana` integration. If it uses Wallet
Standard directly, keep that path explicit.

Patch strategy:

1. Align package versions across wallet-adapter packages.
2. Remove duplicate copies caused by workspace package boundaries.
3. Keep legacy adapters only for wallets that do not support Wallet Standard or
   Mobile Wallet Adapter.
4. Add a narrow compatibility wrapper instead of rewriting app state.

## Diagnosis Template

```text
Stage: Wallet connection
Evidence:
- Provider tree: ...
- Packages: ...
- Runtime/browser: ...

Likely root cause:
...

Fix:
...

QA:
- Open app fresh
- Connect wallet on target cluster
- Refresh page with autoConnect enabled
- Disconnect and reconnect
```
