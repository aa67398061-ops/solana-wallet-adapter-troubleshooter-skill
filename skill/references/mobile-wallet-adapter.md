# Mobile Wallet Adapter Triage

Use this reference for Android web, mobile-wallet handoff, direct `connect`,
`signIn`, deep-link, and user gesture issues.

Mobile Wallet Adapter is a protocol that lets Solana dApps connect with mobile
wallet apps for transaction and message signing. In Android web environments,
MWA may be the only practical wallet option.

## First Questions

- Device model and OS
- Browser, especially Android Chrome version
- Wallet app and version
- Is the user inside an in-app browser, Android Chrome, or another browser?
- Does the flow fail at wallet selection, authorization, signing, or return to
  app?
- Does desktop wallet-adapter work on the same code path?

## User Gesture Rule

On mobile browsers, wallet handoff often must happen directly from a user
action such as a button click. Avoid:

- Calling `connect()` inside `useEffect`
- Calling `signMessage()` after `connect()` from an async side effect
- Opening a wallet handoff after a timer or background state change
- Starting sign-in from an automatic redirect callback

Prefer:

- Direct button handler for connect
- `signIn()` for connect plus message signing in one user action
- Clear fallback if MWA is unavailable

## Connect Button Pattern

When MWA is already selected, call `connect()` directly. If MWA is available but
not selected, select it early instead of opening a generic modal that sends
Android users through extra steps.

```tsx
function ConnectButton() {
  const { connected, connect, select, wallet, wallets } = useWallet();
  const { setVisible } = useWalletModal();

  async function onClick() {
    const mwa = wallets.find((entry) => entry.adapter.name === "Solana Mobile Wallet Adapter");

    if (wallet?.adapter?.name === "Solana Mobile Wallet Adapter") {
      await connect();
      return;
    }

    if (mwa) {
      select(mwa.adapter.name);
      return;
    }

    setVisible(true);
  }

  return <button disabled={connected} onClick={onClick}>Connect</button>;
}
```

Adjust the exact adapter name to the package used by the app. Do not hard-code
the string if the app imports an exported wallet name constant.

## Sign-In Pattern

If the app needs connect plus message signing, prefer the wallet `signIn`
capability when available. It keeps authorization and signing tied to a direct
user gesture.

```ts
const input = {
  domain: window.location.host,
  statement: "Sign in to this Solana app",
  uri: window.location.origin,
};

const output = await signIn(input);
```

## UX Requirements

- Label MWA clearly, for example "Use Installed Wallet".
- Tell users when no compatible mobile wallet is installed.
- Keep the selected cluster visible.
- Do not show a desktop-only wallet list as the primary Android path.
- Preserve return URLs through the wallet handoff.

## Common Mobile Failures

- Wallet handoff blocked because it was not triggered by a trusted user event
- In-app browser blocks external wallet navigation
- App calls `signMessage` from `useEffect` after connect
- MWA option is hidden behind a modal that is never opened on Android
- Wallet app returns but app state was lost due route reload
- App mixes mobile wallet and desktop adapter state in separate providers
