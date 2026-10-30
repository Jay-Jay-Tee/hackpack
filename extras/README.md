# Extras (optional)

Terminal styling from my Mac: zsh config, Starship prompt, Ghostty terminal and a git config with some aliases. None of this is needed for a hackathon, and it isn't a complete development setup. Use the [setup](../setup/) pages for that.

- `.zshrc`: zsh with Homebrew paths, history settings, aliases for eza/bat/git/tmux
- `.gitconfig`: git defaults and aliases; uses git-delta for diffs
- `git-ignore`: global ignore file for `.DS_Store` and similar
- `starship.toml`: prompt showing directory, git branch and language versions
- `ghostty.config`: Ghostty terminal settings
- `Brewfile`: the Homebrew packages these configs expect (`brew bundle --file=extras/Brewfile`)

The Starship config works on Windows and Linux too. The rest is macOS-specific. Compare with your own files rather than overwriting them:

```bash
code --diff extras/.zshrc ~/.zshrc
```

All of it needs a Nerd Font (for example JetBrains Mono Nerd Font) for the icons to display.
