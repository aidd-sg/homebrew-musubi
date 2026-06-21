# homebrew-musubi

Homebrew tap for **R-Musubi**, the internal AI assistant for Jira, Confluence,
Bitbucket, Figma, and Outlook.

> This directory is the **staging copy** of the tap. The live tap is the GitHub
> repo **`aidd/homebrew-musubi`** (the `homebrew-` prefix is required). See
> `../RELEASE.md` (Part A5 + Part B) for how to publish and maintain it.

## Install

```bash
brew install --cask aidd/musubi/r-musubi
```

or, equivalently:

```bash
brew tap aidd/musubi
brew install --cask r-musubi
```

Requires an Apple Silicon Mac (arm64). The download is signed with a Developer ID
certificate and notarized by Apple, so it opens with no Gatekeeper warning.

## Update

R-Musubi updates itself in the background (you'll get an in-app "Update ready"
prompt). To force a full refresh via Homebrew instead:

```bash
brew upgrade --cask r-musubi
```

## Uninstall

```bash
brew uninstall --cask r-musubi          # remove the app
brew uninstall --zap --cask r-musubi    # also remove chats/settings/skills
```
