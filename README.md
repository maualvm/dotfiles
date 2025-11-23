# My Dotfiles

## Installation

1. Install [Homebrew](https://brew.sh/) by copying the command below and following the instructions.
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Clone this repo into ~/dotfiles

3. Install all necessary tools using the [`Brewfile`](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
```sh
brew bundle
```

4. Make a symlink to this folder using GNU Stow:
```sh
# In ~/dotfiles run:
stow .
```

You're done!


## Tools used

- Text editor: Neovim
- Window manager: Aerospace
- Terminal: Wezterm
- Prompt: Oh-my-posh
- Font: Jetbrains Mono NL
