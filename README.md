<p align='right'><em>Last updated: 2025-07-12 08:31 UTC+7</em></p>

<div align="center">
    <h1>MYnvim 💫</h1>
</div>

![](https://github.com/nhattVim/assets/blob/master/MYnvim/rice1.png?raw=true)

## Preview

<div align="center">
    <table>
        <tr>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre1.png?raw=true"/></td>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre2.png?raw=true"/></td>
        </tr>
    </table>
    <table>
        <tr>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre3.png?raw=true"/></td>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre4.png?raw=true"/></td>
            <td><img src="https://github.com/nhattVim/assets/blob/master/MYnvim/pre5.png?raw=true"/></td>
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


## Lsp Plugins

| Name | Description | Optional? |
| ---- | ----------- | --------- |
| [zapling/mason-conform.nvim](https://github.com/zapling/mason-conform.nvim) | Automatically install formatters registered with conform.nvim via mason.nvim |  |
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client implementation for Neovim |  |
| [rshkarin/mason-nvim-lint](https://github.com/rshkarin/mason-nvim-lint) | Extension to mason.nvim that makes it easier to use nvim-lint with mason.nvim |  |
| [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) | An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support. |  |
| [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) | Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters. |  |
| [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) | improve neovim lsp experience |  |
| [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim. |  |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Lightweight yet powerful formatter plugin for Neovim |  |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Quickstart configs for Nvim LSP |  |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | A UI for nvim-dap |  |
| [jay-babu/mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) |  |  |

## Nvzone Plugins

| Name | Description | Optional? |
| ---- | ----------- | --------- |
| [nvzone/minty](https://github.com/nvzone/minty) | Most Beautifully crafted color tools for Neovim  |  |
| [nvzone/showkeys](https://github.com/nvzone/showkeys) | Minimal Eye-candy keys screencaster for Neovim  200 ~ LOC |  |
| [nvzone/volt](https://github.com/nvzone/volt) | Plugin for creating reactive UI  in neovim |  |
| [nvzone/timerly](https://github.com/nvzone/timerly) | Beautiful countdown timer plugin for Neovim |  |
| [nvzone/menu](https://github.com/nvzone/menu) | Menu plugin for neovim ( supports nested menus ) made using volt |  |
| [nvzone/typr](https://github.com/nvzone/typr) | Most Beautiful Typing practice plugin for Neovim with dashboard |  |

## Ui Plugins

| Name | Description | Optional? |
| ---- | ----------- | --------- |
| [dstein64/nvim-scrollview](https://github.com/dstein64/nvim-scrollview) | A Neovim plugin that displays interactive vertical scrollbars and signs. | _Optional_ |
| [jinh0/eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim) | 👀 Move faster with unique f/F indicators. | _Optional_ |
| [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) | a lua powered greeter like vim-startify / dashboard-nvim |  |
| [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | 🏙  A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish. |  |
| [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | A snazzy bufferline for Neovim |  |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | A blazing fast and easy to configure neovim statusline plugin written in pure lua. |  |
| [Owen-Dechow/nvim_json_graph_view](https://github.com/Owen-Dechow/nvim_json_graph_view) | JSON explorer using Neovim's terminal interface. | _Optional_ |
| [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Highlight colors for neovim | _Optional_ |
| [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | Rainbow delimiters for Neovim with Tree-sitter |  |
| [shellRaining/hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim) | This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed |  |

## Others Plugins

| Name | Description | Optional? |
| ---- | ----------- | --------- |
| [Febri-i/snake.nvim](https://github.com/Febri-i/snake.nvim) | Snake game on neovim, practice your hjkl or whatnot! |  |
| [szw/vim-maximizer](https://github.com/szw/vim-maximizer) | Maximizes and restores the current window in Vim. |  |
| [alec-gibson/nvim-tetris](https://github.com/alec-gibson/nvim-tetris) | Bringing emacs' greatest feature to neovim - Tetris! |  |
| [Febri-i/fscreen.nvim](https://github.com/Febri-i/fscreen.nvim) | Plugin for easily create game on neovim |  |
| [OXY2DEV/helpview.nvim](https://github.com/OXY2DEV/helpview.nvim) | A hackable & fancy vimdoc/help file viewer for Neovim |  |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Nvim Treesitter configurations and abstraction layer |  |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration for buffers |  |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | A completion plugin for neovim coded in Lua. |  |
| [uga-rosa/ccc.nvim](https://github.com/uga-rosa/ccc.nvim) | Color picker and highlighter plugin for Neovim. |  |
| [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for telescope written in c |  |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | 💥   Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type. |  |
| [seandewar/nvimesweeper](https://github.com/seandewar/nvimesweeper) | Play Minesweeper in your favourite text editor (Neovim 0.7+) |  |
| [jim-fx/sudoku.nvim](https://github.com/jim-fx/sudoku.nvim) |  |  |
| [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | markdown preview plugin for (neo)vim | _Optional_ |
| [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Plugin to improve viewing Markdown files in Neovim |  |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice. |  |
| [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) |  |  |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Use treesitter to auto close and auto rename html tag |  |
| [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) | Add/change/delete surrounding delimiter pairs with ease. Written with :heart: in Lua. |  |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Find, Filter, Preview, Pick. All lua, all the time. |  |
| [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Set of preconfigured snippets for different languages.  | _Optional_ |
| [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) | A fancy, configurable, notification manager for NeoVim |  |
| [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) | Smooth scrolling neovim plugin written in lua |  |
| [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Provides Nerd Font icons (glyphs) for use by neovim plugins |  |
| [MoaidHathot/dotnet.nvim](https://github.com/MoaidHathot/dotnet.nvim) | .NET Neovim plugin for improving the .NET dev experience in Neovim,  written completely in Lua |  |
| [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls |  |
| [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) | Neovim plugin to improve the default vim.ui interfaces | _Optional_ |
| [ThePrimeagen/vim-be-good](https://github.com/ThePrimeagen/vim-be-good) | vim-be-good is a nvim plugin designed to make you better at Vim Movements.  |  |
| [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) | :brain: :muscle: // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more |  |
| [CRAG666/code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) | Neovim plugin.The best code runner you could have, it is like the one in vscode but with super powers, it manages projects like in intellij but without being slow |  |
| [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | luasnip completion source for nvim-cmp |  |
| [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) | nvim-cmp source for nvim lua |  |
| [LunarVim/bigfile.nvim](https://github.com/LunarVim/bigfile.nvim) | Make editing big files faster 🚀 |  |
| [tzachar/cmp-tabnine](https://github.com/tzachar/cmp-tabnine) | TabNine plugin for hrsh7th/nvim-cmp | _Optional_ |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu. |  |
| [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI Component Library for Neovim. |  |
| [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) | A library for asynchronous IO in Neovim | _Optional_ |
| [monkoose/neocodeium](https://github.com/monkoose/neocodeium) | free AI completion plugin for neovim | _Optional_ |
| [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim) | A better user experience for viewing and interacting with Vim marks. |  |
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | autopairs for neovim written in lua |  |
| [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) |  |  |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet Engine for Neovim written in Lua. |  |
| [yuratomo/w3m.vim](https://github.com/yuratomo/w3m.vim) | w3m plugin for vim |  |
| [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion) | Database autocompletion powered by https://github.com/tpope/vim-dadbod |  |
| [Wansmer/treesj](https://github.com/Wansmer/treesj) | Neovim plugin for splitting/joining blocks of code |  |
| [mrjones2014/smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | 🧠 Smart, seamless, directional navigation and resizing of Neovim + terminal multiplexer splits. Supports tmux, Wezterm, and Kitty. Think about splits in terms of "up/down/left/right". |  |
| [max397574/better-escape.nvim](https://github.com/max397574/better-escape.nvim) | Map keys without delay when typing |  |
| [letieu/hacker.nvim](https://github.com/letieu/hacker.nvim) | Hollywood hacker experience in your neovim |  |
| [andymass/vim-matchup](https://github.com/andymass/vim-matchup) | vim match-up: even better % :facepunch: navigate and highlight matching words :facepunch: modern matchit and matchparen.  Supports both vim and neovim + tree-sitter. |  |
| [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) | nvim-cmp source for path |  |
| [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | nvim-cmp source for buffer words |  |
| [nvimtools/hydra.nvim](https://github.com/nvimtools/hydra.nvim) | Create custom submodes and menus |  |
| [booperlv/nvim-gomove](https://github.com/booperlv/nvim-gomove) | A complete plugin for moving and duplicating blocks and lines, with complete fold handling, reindenting, and undoing in one go. |  |
| [aurum77/live-server.nvim](https://github.com/aurum77/live-server.nvim) | A plugin to integrate live-server from Neovim |  |
| [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | nvim-cmp source for neovim builtin LSP client |  |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | A file explorer tree for neovim written in lua |  |
| [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod) | dadbod.vim: Modern database interface for Vim |  |
| [okuuva/auto-save.nvim](https://github.com/okuuva/auto-save.nvim) | 🧶 Automatically save your changes in NeoVim |  |
| [famiu/bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) | Delete Neovim buffers without losing window layout |  |
| [seandewar/killersheep.nvim](https://github.com/seandewar/killersheep.nvim) | Neovim port of killersheep (with blood!) |  |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | ✅  Highlight, list and search todo comments in your projects | _Optional_ |
| [kawre/leetcode.nvim](https://github.com/kawre/leetcode.nvim) | A Neovim plugin enabling you to solve LeetCode problems. |  |
| [hrsh7th/cmp-calc](https://github.com/hrsh7th/cmp-calc) | nvim-cmp source for math calculation | _Optional_ |
| [azratul/live-share.nvim](https://github.com/azratul/live-share.nvim) | Creates a "Live Share" server in Neovim, similar to the Visual Studio Code Live Share functionality  |  |
| [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multiple cursors plugin for vim/neovim | _Optional_ |
| [NStefan002/speedtyper.nvim](https://github.com/NStefan002/speedtyper.nvim) | Practise typing in Neovim |  |
| [mcauley-penney/visual-whitespace.nvim](https://github.com/mcauley-penney/visual-whitespace.nvim) | Imitate VSCode's "Render Whitespace" feature in visual mode | _Optional_ |
| [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) | Simple UI for https://github.com/tpope/vim-dadbod |  |
| [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre) | Find the enemy and replace them with dark power. |  |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | A neovim lua plugin to help easily manage multiple terminal windows |  |
| [sindrets/winshift.nvim](https://github.com/sindrets/winshift.nvim) | Rearrange your windows with ease. |  |
| [jbyuki/instant.nvim](https://github.com/jbyuki/instant.nvim) | collaborative editing in Neovim using built-in capabilities |  |
| [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | Neovim treesitter plugin for setting the commentstring based on the cursor location in a file. |  |

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/a6ae04023a8d572b4bdced45af963d1f8d1234e7.svg "Repobeats analytics image")

> **Congratulations!** at this point you have successfully configured your Neovim.
>
> # (￣ y▽ ￣)╭ Ohohoho.....
