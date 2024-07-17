> [!Warning]
> ⚠️ This branch is now obsolete and remains only for research purposes ⚠️

<div align="center">
    <h1>MYnvim 💫</h1>
</div>

![](https://github.com/nhattruongNeoVim/assets/blob/master/MYnvim/rice1.png?raw=true)

## Advice

> [!Important]
> You should only use this configuration on Linux or WSL (Windows Subsystem for Linux), not on Windows. If used on Windows, it may result in various errors, and I don't have the time to troubleshoot them.

## Dependencies

For other systems

1. Install Neovim 8.0+ https://github.com/neovim/neovim/releases/tag/v0.9.4
2. C++ (windows) Compiler https://www.msys2.org/
3. GIT https://git-scm.com/download/win
4. NodeJS https://nodejs.org/en/
5. Java version 17+ https://www.java.com/en/
6. Some packages: fzf make cmake unzip gzip tar

```
pip install pynvim
npm install neovim -g
```

For Ubuntu user

```bash
bash <(curl -sSL https://is.gd/nhattruongNeoVim_nvim)
```

## Necessary font

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

## Install

- Make sure you have removed nvim and nvim-data

```bash
# Windows
Remove-Item -Path "~\AppData\Local\nvim" -Recurse -Force
Remove-Item -Path "~\AppData\Local\nvim-data" -Recurse -Force

# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

- Then run this command:

```bash
# Window
git clone https://github.com/nhattruongNeoVim/MYnvim $HOME\AppData\Local\nvim --depth 1

# Linux / Macos (unix)
git clone https://github.com/nhattruongNeoVim/MYnvim ~/.config/nvim --depth 1
```

- You can remove .git file with this command:

```bash
# window
Remove-Item -Path "~\AppData\Local\nvim\.git" -Recurse -Force

# Linux / Macos (unix)
rm -rf ~/.config/nvim/.git
```

Now just open neovim and enjoy.

## Plugins list

- A beautiful theme with supports transparency [tokyonight](https://github.com/folke/tokyonight.nvim)
- Inbuilt terminal toggling & management with [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- File navigation with [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- Beautiful and configurable icons with [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- Git diffs and more with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- NeoVim Lsp configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason.nvim](https://github.com/williamboman/mason.nvim)
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- File searching, previewing image and text files and more with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Autoclosing braces and html tags with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Indentlines with [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- Useful snippets with [friendly snippets](https://github.com/rafamadriz/friendly-snippets) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
- Popup mappings keysheet [whichkey.nvim](https://github.com/folke/which-key.nvim)

# (￣ y▽ ￣)╭ Ohohoho.....
