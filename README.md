# kickstart.nvim

## Introduction

This is my personal fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), a starting point for Neovim configuration. I've customized it to include additional plugins and features I use in my workflow.

Key differences from the original:
- Added plugins for comment, null-ls, tailwind-tools, typescript-tools.
- Modified `init.lua`.
- Changed theme to [tokyodark](https://github.com/tiagovla/tokyodark.nvim)

## Installation

### Install Neovim

Ensure you are running the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) or ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) release of Neovim.

### Clone My Fork

#### Linux and macOS

```sh
git clone https://github.com/ray8118/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
