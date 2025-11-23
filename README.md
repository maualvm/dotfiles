# My Dotfiles

## Tools used

- Text editor: Neovim
- Window manager: Aerospace
- Terminal: Wezterm
- Prompt: Oh-my-posh
- Font: Jetbrains Mono NL

## Installation

1. Install [Homebrew](https://brew.sh/) by copying the command below and following the instructions.
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once you have followed the instructions and restarted your terminal, run the following command to confirm Homebrew was installed properly:
```sh
brew doctor
```

If everything went well, the above command should output `Your system is ready to brew.`

2. Install git:
```sh
brew install git
```

3. Configure git by following the [First-Time Git Setup guide](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup):
```sh
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor nvim
git config --global init.defaultBranch main
```

4. Generate and add a new SSH key to your Github account using [this handy guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
5. Clone this repository *in your home directory*:
```sh
# inside ~, run:
git clone git@github.com:maualvm/dotfiles.git
```

6. `cd` into the cloned repository:
```sh
# inside ~
cd dotfiles
```

7. Install all necessary tools using the included [`Brewfile`](https://docs.brew.sh/Brew-Bundle-and-Brewfile) by running:
```sh
brew bundle
```

8. Make a symlink to this folder using GNU Stow:
```sh
# inside ~/dotfiles, run:
stow .
```

9. Install [Mac Mouse Fix](https://macmousefix.com/en/) and [Better Display](https://github.com/waydabber/BetterDisplay) by following the instructions.

You're done!

## Neovim

- Plugin manager: lazy.nvim
- Colorscheme: catppuccin

### Plugins
- File browser: oil.nvim
- File picker: fzf-lua
- Statusline: lualine.nvim
- Git: fugitive.vim
- Autocomplete: nvim-cmp + Github Copilot
