# /audit-wallet-flow

Review a Solana wallet flow before launch, demo, or bounty submission.

## Input to Request

- Repository or key files
- Supported wallets
- Supported clusters
- Target platforms: desktop web, mobile web, React Native, or embedded browser
- Known constraints: wallet-adapter, Wallet Standard, Mobile Wallet Adapter,
  `@solana/kit`, `@solana/web3.js`, or custom wallet integration

## Procedure

1. Read `skill/references/review-checklist.md`.
2. Inspect provider setup and rendering boundaries.
3. Inspect connection UX.
4. Inspect transaction and confirmation helpers.
5. Inspect mobile/MWA path if mobile web is supported.
6. Return prioritized findings.

## Output Format

```text
Verdict:
Critical fixes:
Recommended fixes:
Nice-to-have:
Manual QA matrix:
```

For findings, include file and line references when code is available.
