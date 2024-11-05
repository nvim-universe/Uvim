<div align="center">
<img alt="logo" src="https://github.com/user-attachments/assets/70fc1c5a-e6b8-4969-826e-cc38e01c901f" />
</div>

<hr>

<h4 align="center">
    <a href="https://github.com/vim-universe/Uvim/wiki/Installation">Installation</a>
    ·
    <a href="https://github.com/vim-universe/Uvim/wiki/Configuration">Configuration</a>
    ·
    <a href="https://github.com/vim-universe/Uvim/wiki/Docs">Docs</a>
</h4>

<div align="center">
    <a href="https://github.com/vim-universe/Uvim">
        <img alt="Size" src="https://img.shields.io/github/repo-size/vim-universe/Uvim?color=%23DDB6F2&label=SIZE&logo=saturn&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/vim-universe/Uvim/stargazers">
        <img alt="Stars" src="https://img.shields.io/github/stars/vim-universe/Uvim?color=%23DDB6F2&label=STARS&logo=saturn&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/vim-universe/Uvim/commits/main/">
        <img alt="Last Commit" src="https://img.shields.io/github/last-commit/vim-universe/Uvim?color=%23DDB6F2&label=LAST%20COMMIT&logo=saturn&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</div>

<hr>

**Uvim** is (_another_) Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

> [!NOTE]
> ***Why Another Neovim configuration?*** I used [LazyVim](https://github.com/LazyVim/LazyVim), [LunarVim](https://github.com/LunarVim/LunarVim), and [AstroNvim](https://github.com/AstroNvim/AstroNvim) for some time. My primary issue is their entire configuration is held within a Neovim package and instead provides a starter file to merge changes with their configuration.  Although this felt good for beginners, I wanted more control over the configuration and the ability to easily see all settings while inside `~/.config/nvim`. So, I decided to take my favorite aspects of each and convert into a monorepo that can be directly installed.

![image](https://github.com/user-attachments/assets/fb5948ec-9103-49d7-8407-2b34c27f5ec7)

![image](https://github.com/user-attachments/assets/5318301e-cc9b-4a54-bad1-d794e534d058)

## Features

### Pre-Installed Plugins

- [Neo-Tree](https://github.com/nvim-neo-tree/neo-tree.nvim) File Explorer
- [Mason](https://github.com/williamboman/mason.nvim) Language Server Protocol Support
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) Debugger Adapter Protocol Support
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) Autocompletion Support
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) Linting and Formatting Support
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Syntax Highlighting
- [Toggleterm](https://github.com/nvim-treesitter/nvim-treesitter) Terminal Support
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) Git Integration
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) Statusline, Statuscol, and Bufferline Support

### Uvim Specifics

- Easy plugin addition using lazy.nvim
- Easily add language support using the provided templates (feel free to PR your language configuration!)
- Default Settings that just make sense

## Getting Started

All documentation will be contained within the [Uvim Wiki](https://github.com/vim-universe/Uvim/wiki).
