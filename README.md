<div align="center">
    <h1>MYnvim 💫</h1>
</div>

![](https://github.com/nhattVim/assets/blob/master/MYnvim/rice1.png?raw=true)

## Preview

<!-- <div align="center"> -->
<!--     <img width="50%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre1.png?raw=true'><img width="50%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre2.png?raw=true'> -->
<!-- </div> -->
<!-- <div align="center"> -->
<!--     <img width="33%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre3.png?raw=true'><img width="33%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre4.png?raw=true'><img width="33%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre5.png?raw=true'> -->
<!-- </div> -->

<div align="center">
    <table>
        <tr>Theme Select</tr>
        <tr>
            <td><img width="50%" src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre1.png?raw=true"/></td>
            <td><img width="50%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre2.png?raw=true'"/></td>
        </tr>
    </table>
</div>

<div align="center">
    <table>
        <tr>
            <td><img width="50%" src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre3.png?raw=true"/></td>
            <td><img width="50%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre4.png?raw=true'"/></td>
            <td><img width="50%" src='https://github.com/nhattVim/assets/blob/master/MYnvim/pre5.png?raw=true'"/></td>
        </tr>
    </table>
</div>

## Advice

> [!Important]
> You should only use this configuration on Linux or WSL (Windows Subsystem for Linux), not on Windows. If used on Windows, it may result in various errors, and I don't have the time to troubleshoot them.
> You can use this script to set up your WSL (Ubuntu)
>
> ```
> bash <(curl -sSL https://is.gd/nhattVim_wsl)
> ```

## Dependencies

- Prerequisites:

  - Make sure you have installed the latest version of [Neovim v0.10.0+](https://github.com/neovim/neovim/releases/tag/v0.10.3).
  - Have [git](https://cli.github.com/), [make](https://www.gnu.org/software/make/), [python](https://www.python.org/), [nodejs](https://nodejs.org/), and [cargo](https://www.rust-lang.org/tools/install) installed on your system
  - Install [lazygit](https://github.com/jesseduffield/lazygit#installation) to launch lazygit in neovim with `<leader>gg` _(optional)_
  - For [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) _(optional)_
    - live grep: [ripgrep](https://github.com/BurntSushi/ripgrep)
    - find files: [fzf](https://github.com/junegunn/fzf)
  - A terminal that support true color and undercurl:
    - [kitty](https://github.com/kovidgoyal/kitty) *(Linux & Macos)*
    - [wezterm](https://github.com/wez/wezterm) *(Linux, Macos & Windows)*
    - [alacritty](https://github.com/alacritty/alacritty) *(Linux, Macos & Windows)*
    - [iterm2](https://iterm2.com/) *(Macos)*
    - [PowerShell 7+](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) _(Windows)_

  ```bash
  # Then run this command:
  pip install pynvim
  npm install neovim -g
  ```

- Necessary font:
  - [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
  - [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
  - [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
  - [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

## Install

- Make sure you have removed old nvim and nvim-data folders

```bash
# Windows PowerShell
rm -Force -Recurse "$env:LOCALAPPDATA\nvim"
rm -Force -Recurse "$env:LOCALAPPDATA\nvim-data"

# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

- Then run this command:

```bash
# Window
git clone https://github.com/nhattVim/MYnvim "$env:LOCALAPPDATA\nvim" --depth 1

# Linux / Macos (unix)
git clone https://github.com/nhattVim/MYnvim ~/.config/nvim --depth 1
```

- You can remove .git file with this command:

```bash
# Window
rm -Force -Recurse "$env:LOCALAPPDATA\nvim\.git"

# Linux / Macos (unix)
rm -rf ~/.config/nvim/.git
```

Now just open neovim and enjoy.

![](https://github.com/nhattVim/assets/blob/master/MYnvim/rice2.png?raw=true)

## Docker

A special way to test MYnvim with docker.

<!-- ```bash -->
<!-- # create nvim-data volume -->
<!-- docker volume create nvim-data -->
<!---->
<!-- # replace '$1' with the file address you want to open -->
<!-- docker run -it -p 8080:8080 -v '$1':/workspace -v nvim-data:/root mynvim/nvim -->
<!---->
<!-- # example Window -->
<!-- docker run -it -p 8080:8080 -v ${pwd}:/workspace -v nvim-data:/root mynvim/nvim -->
<!---->
<!-- # exmaple Linux -->
<!-- docker run -it -p 8080:8080 -v $HOME:/workspace -v nvim-data:/root mynvim/nvim -->
<!-- ``` -->

```bash
# Create MYnvim-data volume
sudo docker volume create MYnvim-data

# Then run this command for the first time
sudo docker run -it --name MYnvim -v MYnvim-data:/root -v $HOME:/mnt archlinux:latest /bin/bash -c "
    pacman -Syu --noconfirm
    pacman -S --noconfirm base-devel curl wget unzip neovim python nodejs npm lazygit fzf ripgrep
    if [ ! -d \"\$HOME/.config/nvim\" ]; then
        git clone https://github.com/nhattVim/MYnvim \$HOME/.config/nvim --depth 1
    else
        cd \$HOME/.config/nvim && git pull
    fi
    cd /mnt
    nvim
"

# Then run this command every time you want to run MYnvim
sudo docker start -ai MYnvim
```

## Core plugin

| Name                                                                                            | Description                                                                                      | Optional?  |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ---------- |
| [alpha-nvim](https://github.com/goolord/alpha-nvim)                                             | a lua powered greeter like vim-startify / dashboard-nvim                                         |            |
| [bookmarks.nvim](https://github.com/tomasky/bookmarks.nvim)                                     | a bookmarks plugin written in Lua                                                                |            |
| [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim)                                       | delete Neovim buffers without losing window layout                                               |            |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                   | a snazzy bufferline for Neovim                                                                   |            |
| [ccc.nvim](https://github.com/uga-rosa/ccc.nvim)                                                | color picker                                                                                     |            |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                             | nvim-cmp source for buffer words                                                                 |            |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                         | nvim-cmp source for neovim builtin LSP client                                                    |            |
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)                                         | nvim-cmp source for nvim lua                                                                     |            |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                                 | nvim-cmp source for path                                                                         |            |
| [cmp-tabnine](https://github.com/tzachar/cmp-tabnine)                                           | nvim-cmp source for TabNine                                                                      | _Optional_ |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                                      | nvim-cmp source for luasnip completion                                                           |            |
| [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)                                 | the best code runner you could have                                                              |            |
| [codesnap.nvim](https://github.com/mistricky/codesnap.nvim)                                     | snapshot code (_NOTE: press 'gb' on "mistricky/codesnap.nvim" on lazy menu when build fails_)    |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim)                                        | smart and powerful comment plugin for neovim                                                     |            |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                                        | lightweight yet powerful formatter plugin for Neovim                                             |            |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim)                                      | single tabpage interface for easily cycling through diffs for all modified files for any git rev | _Optional_ |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim)                                      | neovim plugin to improve the default vim.ui interfaces                                           |            |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                            | set of preconfigured snippets for different languages                                            | _Optional_ |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                     | git integration for buffers                                                                      | _Optional_ |
| [harpoon](https://github.com/ThePrimeagen/harpoon)                                              | mark and navigate buffer                                                                         |            |
| [hop.nvim](https://github.com/phaazon/hop.nvim)                                                 | neovim motions on speed!                                                                         |            |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)                 | indent guides for Neovim                                                                         |            |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                                 | a modern plugin manager for Neovim                                                               |            |
| [live-server.nvim](https://github.com/aurum77/live-server.nvim)                                 | a plugin to integrate live-server from Neovim                                                    |            |
| [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)                                         | improve neovim lsp experience                                                                    |            |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                    | a blazing fast and easy to configure neovim statusline plugin                                    |            |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                                  | snippet Engine for Neovim written in Lua                                                         |            |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)                        | markdown preview plugin for neovim                                                               | _Optional_ |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)                    | extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.                   |            |
| [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)                            | allow you to automatically install, and automatically set up a predefined list of sources        |            |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                                        | easily install and manage LSP servers, DAP servers, linters, and formatters                      |            |
| [minimap.vim](https://github.com/wfxr/minimap.vim)                                              | blazing fast minimap for neovim                                                                  | _Optional_ |
| [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)                                      | smooth scrolling neovim plugin written in lua                                                    |            |
| [noice.nvim](https://github.com/folke/noice.nvim)                                               | UI for messages, cmdline and the popupmenu                                                       |            |
| [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)                                       | null-ls.nvim reloaded                                                                            |            |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                                             | UI Component Library for Neovim                                                                  | _Optional_ |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                      | autopairs for neovim written by lua                                                              | _Optional_ |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                 | a completion plugin for neovim coded in Lua                                                      |            |
| [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)                              | maintained fork of the fastest Neovim colorizer                                                  |            |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                            | debug Adapter Protocol client implementation for Neovim                                          |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                          | a UI for nvim-dap                                                                                |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)                                        | extensions for the built-in LSP support in Neovim for eclipse.jdt.ls                             |            |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                                          | an asynchronous linter plugin for Neovim                                                         |            |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                      | quickstart configs for Nvim LSP                                                                  |            |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                          | a fancy, configurable, notification manager for NeoVim                                           | _Optional_ |
| [nvim-surround](https://github.com/kylechui/nvim-surround)                                      | add/change/delete surrounding delimiter pairs with ease                                          |            |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                                    | file explorer tree for neovim written in lua                                                     |            |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                           | syntax highlighting                                                                              |            |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                                    | use treesitter to auto close and auto rename html tag                                            | _Optional_ |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | neovim treesitter plugin for setting the commentstring based on the cursor location in a file    |            |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                            | beautiful and configurable dev icons                                                             |            |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                                        | all the lua functions                                                                            |            |
| [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)                   | rainbow delimiters for Neovim with Tree-sitter                                                   | _Optional_ |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                           | smart, seamless, directional navigation and resizing of Neovim                                   |            |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)        | FZF sorter for telescope written in c                                                            |            |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                              | file searching, previewing image and text files and more                                         |            |
| [toggleterm](https://github.com/akinsho/toggleterm.nvim)                                        | inbuilt terminal toggling & management                                                           |            |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)                                     | a clean, dark Neovim theme                                                                       |            |
| [treesj](https://github.com/Wansmer/treesj)                                                     | neovim plugin for splitting/joining blocks of code                                               |            |
| [vim-maximizer](https://github.com/szw/vim-maximizer)                                           | maximizes and restores the current window in Vim                                                 | _Optional_ |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi)                                   | multiple cursors plugin for vim/neovim                                                           |            |
| [whichkey.nvim](https://github.com/folke/which-key.nvim)                                        | popup mappings keysheet                                                                          | _Optional_ |
| ...                                                                                             |                                                                                                  |            |

## Game on neovim (extras)

| Name                                                              | Description                                              |
| ----------------------------------------------------------------- | -------------------------------------------------------- |
| [nvim-tetris](https://github.com/alec-gibson/nvim-tetris)         | tetris                                                   |
| [vim-be-good](https://github.com/ThePrimeagen/vim-be-good)        | nvim plugin designed to make you better at Vim Movements |
| [snake.nvim](https://github.com/Febri-i/snake.nvim)               | snake game on neovim                                     |
| [killersheep.nvim](https://github.com/seandewar/killersheep.nvim) | neovim port of killersheep (with blood!)                 |
| [speedtyper.nvim](https://github.com/NStefan002/speedtyper.nvim)  | practise typing in Neovim                                |
| ...                                                               |                                                          |

> **Congratulations!** at this point you have successfully configured your Neovim.
>
> # (￣ y▽ ￣)╭ Ohohoho.....
