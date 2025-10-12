# 🚀 Neovim Nightly Configuration

[![Lua](https://img.shields.io/badge/Language-Lua-blue.svg)](https://www.lua.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

A modern, fast, and feature-rich Neovim configuration written in Lua, using the built-in `vim.pack` for plugin management. This configuration is designed to be easy to understand, customize, and extend.

## ✨ Features

-   **Plugin Management**: Uses Neovim's built-in `vim.pack` feature for managing plugins. No external plugin manager needed!
-   **LSP**: Full-featured Language Server Protocol (LSP) support for autocompletion, diagnostics, and more.
-   **Completion**: Fast and intelligent code completion with `blink.cmp`.
-   **Formatting**: Automatic code formatting with `conform.nvim`.
--   **Git Integration**: Git integration with `gitsigns.nvim`.
-   **File Explorer**: A modern file explorer with `neo-tree.nvim`.
-   **Treesitter**: Advanced syntax highlighting and code analysis with `nvim-treesitter`.
-   **Which-Key**: A popup that displays keybindings.
-   **Notifications**: A beautiful notification manager with `nvim-notify`.
-   **Mini Plugins**: A collection of minimal and fast plugins from `mini.nvim`.

## 📁 File Structure

The configuration is structured as follows:

```
.
├── init.lua                 -- 🚀 Main entry point
├── lua/
│   ├── core/
│   │   ├── auto.lua         -- 🤖 Autocommands
│   │   ├── maps.lua         -- 🗺️ Keymappings
│   │   └── opts.lua         -- ⚙️ Neovim options
│   └── pack/
│       ├── colors.lua       -- 🎨 Colorscheme
│       ├── completion.lua   -- 🤖 Code completion
│       ├── formatter.lua    -- 💅 Code formatting
│       ├── git.lua          -- 🐙 Git integration
│       ├── lsp.lua          -- 💡 Language Server Protocol
│       ├── mini.lua         -- Plugins from mini.nvim
│       ├── notify.lua       -- 📢 Notifications
│       ├── tree.lua         -- 🌲 File explorer
│       ├── treesitter.lua   -- 🌳 Treesitter
│       └── whichkey.lua     -- 🔑 Which-key
└── README.md                -- 📖 This file
```

## 📦 Plugins

This configuration uses the following plugins:

| Plugin                                                              | Description                               |
| ------------------------------------------------------------------- | ----------------------------------------- |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)           | A popular colorscheme for Neovim.         |
| [blink.cmp](https://github.com/saghen/blink.cmp)                      | A fast and intelligent completion engine. |
| [conform.nvim](https://github.com/stevearc/conform.nvim)              | A code formatter.                         |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)           | Git integration for Neovim.               |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)            | Configurations for the Neovim LSP client. |
| [mini.nvim](https://github.com/nvim-mini/mini.nvim)                   | A collection of minimal and fast plugins. |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                | A notification manager for Neovim.        |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)       | A file explorer for Neovim.               |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)              | A dependency for other plugins.           |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)   | Icons for file types.                     |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                   | A UI component library for Neovim.        |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Treesitter configurations for Neovim.     |
| [which-key.nvim](https://github.com/folke/which-key.nvim)             | A keymap helper for Neovim.               |

## ⌨️ Keybindings

The leader key is set to `space`.

### General

| Keybinding | Description                  |
| ---------- | ---------------------------- |
| `<leader>w`  | Write the current file.      |
| `<leader>q`  | Quit the current window.     |
| `<leader>e`  | Toggle the file explorer.    |
| `<leader>ff` | Find files.                  |
| `<leader>fh` | Live grep.                   |
| `<leader>fb` | Show buffers.                |
| `<leader>fp` | Search help.                 |
| `<leader>fm` | Format the current buffer.   |
| `<leader>c`  | Comment/uncomment the line.  |
| `<leader>bd` | Delete the current buffer.   |
| `<leader>bD` | Force delete current buffer. |

### LSP

| Keybinding | Description              |
| ---------- | ------------------------ |
| `gd`       | Go to definition.        |
| `gr`       | Find references.         |
| `gi`       | Go to implementation.    |
| `gk`       | Hover documentation.     |
| `<C-k>`    | Signature help.          |
| `<leader>ca` | Code action.             |
| `<leader>rn` | Rename symbol.           |
| `<leader>fe` | Show diagnostics.        |

## 🚀 Installation

1.  Clone this repository to your Neovim configuration directory (usually `~/.config/nvim`).
2.  Start Neovim. The plugins will be installed automatically.

```bash
git clone https://github.com/r181104/neovim-nightly.git ~/.config/nvim
```

## 📸 Screenshots

*Coming soon...*

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/r181104/neovim-nightly/issues).

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
