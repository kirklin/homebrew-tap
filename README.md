# kirklin/homebrew-tap

Homebrew tap for [Kirk Lin](https://github.com/kirklin)'s apps.

## Install

```bash
brew install --cask kirklin/tap/magpie
```

Using the fully-qualified `user/tap/cask` name trusts just this cask, so it
works out of the box — no extra steps.

<details>
<summary>Prefer the short name?</summary>

Homebrew 6.0+ requires trusting non-official taps before loading them by short
name, so add a `brew trust` step:

```bash
brew tap kirklin/tap
brew trust --cask kirklin/tap/magpie   # or `brew trust kirklin/tap` for the whole tap
brew install --cask magpie
```

</details>

## Available casks

| Cask | Description |
| --- | --- |
| [`magpie`](./Casks/magpie.rb) | Fast, modern clipboard manager built with Tauri, React, and Rust — [source](https://github.com/kirklin/magpie) |

> Magpie is ad-hoc signed but not yet Apple-notarized. The cask strips the
> quarantine flag on install, so a plain `brew install --cask magpie` works. If
> macOS still reports it as "damaged", run
> `brew reinstall --cask --no-quarantine magpie`.
