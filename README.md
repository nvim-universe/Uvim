<div align="center">
    <img alt="Logo" src="https://private-user-images.githubusercontent.com/87681482/383199666-9e9ea78f-ba3e-4428-bd25-34723c36b311.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzA4MTkyNTcsIm5iZiI6MTczMDgxODk1NywicGF0aCI6Ii84NzY4MTQ4Mi8zODMxOTk2NjYtOWU5ZWE3OGYtYmEzZS00NDI4LWJkMjUtMzQ3MjNjMzZiMzExLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDExMDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMTA1VDE1MDIzN1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTc4NmI1NmUwNDg4NTRiMjg4ZTQ0YjhlMWZjMTNlODFmMjQ4M2U2N2QzNWJmNjI0MjBlM2UyMTY2ZjEyZTIyZDkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.zoEcRNOQm8pHMDuJaP1PG8z-jomFVedY65mtnFtz1aM" />
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

Uvim is (another) Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

> [!NOTE]
> ***Why Another Neovim configuration?*** I used [LazyVim](https://github.com/LazyVim/LazyVim), [LunarVim](https://github.com/LunarVim/LunarVim), and [AstroNvim](https://github.com/AstroNvim/AstroNvim) for some time. My primary issue is their entire configuration is held within a Neovim package and instead provides a starter file to merge changes with their configuration.  Although this felt good for beginners, I wanted more control over the configuration and the ability to easily see all settings while inside `~/.config/nvim`. So, I decided to take my favorite aspects of each and convert into a monorepo that can be directly installed.

![image](https://private-user-images.githubusercontent.com/87681482/383192337-c655c137-3ea0-4856-a753-b208b570ade9.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzA4MTgyMjUsIm5iZiI6MTczMDgxNzkyNSwicGF0aCI6Ii84NzY4MTQ4Mi8zODMxOTIzMzctYzY1NWMxMzctM2VhMC00ODU2LWE3NTMtYjIwOGI1NzBhZGU5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDExMDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMTA1VDE0NDUyNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWYzNmQ0NDViM2YyZmQzM2MxZTZiMDczNDFmYWUzNmYyNDM3ODA3NTJhZDU3NWYxN2UwNDRlMmE4ZTIyMjQwMDAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.JjcnSG8z_Gs0uUgWBbVrd5JSIjvjj-UsvyxJbbB0J4o)

![image](https://private-user-images.githubusercontent.com/87681482/383192844-5dca3fda-b1dd-499e-8c37-005b1bd70e77.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzA4MTgyMjUsIm5iZiI6MTczMDgxNzkyNSwicGF0aCI6Ii84NzY4MTQ4Mi8zODMxOTI4NDQtNWRjYTNmZGEtYjFkZC00OTllLThjMzctMDA1YjFiZDcwZTc3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDExMDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMTA1VDE0NDUyNVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTA5ZGJkYWNhMzlmNWM1MDg4Nzg4YjNkODM3MGU1NjM2NDg5NWY1ZmZmZDZmNGViZDg3MmY3NjJlMTk5MDMyZDUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.HN3hh7OQXW4mr9mBAjjhsZBL2oqt5J5boZQZWlobr3c)

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
