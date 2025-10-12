# Neovim Configuration

This is a Neovim configuration written in Lua. It uses `vim.pack` to manage plugins.

## Structure

The configuration is structured as follows:

- `init.lua`: The main entry point, which loads all other configuration files.
- `lua/core/`: Contains the core configuration of Neovim.
  - `opts.lua`: Sets various Neovim options.
  - `maps.lua`: Defines custom key mappings.
  - `auto.lua`: Contains auto commands.
- `lua/pack/`: Contains the configuration for various plugins.
  - `colors.lua`: Configures the colorscheme.
  - `completion.lua`: Configures completion.
  - `formatter.lua`: Configures code formatting.
  - `git.lua`: Configures Git integration.
  - `lsp.lua`: Configures the Language Server Protocol.
  - `mini.lua`: Configures various mini plugins.
  - `notify.lua`: Configures notifications.
  - `tree.lua`: Configures the file explorer.
  - `treesitter.lua`: Configures Treesitter.
  - `whichkey.lua`: Configures which-key.

## Installation

1. Clone this repository to your Neovim configuration directory (usually `~/.config/nvim`).
2. Start Neovim. The plugins will be installed automatically.

## Plugins

This configuration uses the following plugins:

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim): A colorscheme.
- [blink.cmp](https://github.com/saghen/blink.cmp): A completion engine.
- [conform.nvim](https://github.com/stevearc/conform.nvim): A code formatter.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): LSP configuration.
- [mini.nvim](https://github.com/nvim-mini/mini.nvim): A collection of minimal plugins.
- [nvim-notify](https://github.com/rcarriga/nvim-notify): A notification manager.
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): A file explorer.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): A dependency for other plugins.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Icons for file types.
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim): A UI component library.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Treesitter configuration.
- [which-key.nvim](https://github.com/folke/which-key.nvim): A keymap helper.
