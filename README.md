# kirklin/homebrew-tap

Homebrew tap for [Kirk Lin](https://github.com/kirklin)'s apps.

## Install

```bash
brew install --cask kirklin/tap/magpie
```

Or add the tap first, then install by name:

```bash
brew tap kirklin/tap
brew install --cask magpie
```

## Available casks

| Cask | Description |
| --- | --- |
| [`magpie`](./Casks/magpie.rb) | Fast, modern clipboard manager built with Tauri, React, and Rust — [source](https://github.com/kirklin/magpie) |

> Magpie is ad-hoc signed but not yet Apple-notarized. The cask strips the
> quarantine flag on install, so a plain `brew install --cask magpie` works. If
> macOS still reports it as "damaged", run
> `brew reinstall --cask --no-quarantine magpie`.
