--------------------------------------------------------- OPT: ---------------------------------------------------------

-- Options enabled by default in Neovim:
-- filetype syntax on
-- set autoindent autoread background=dark backspace=indent,eol,start nocompatible display=lastline encoding=utf-8
-- set hidden history=10000 nojoinspaces incsearch laststatus=2 ruler showcmd nostartofline tabpagemax=50 timeoutlen=50
-- set ttyfast smarttab wildmenu wildoptions=pum,tagfile
-- https://neovim.io/doc/user/vim_diff.html#nvim-defaults

local my_opts = {

    -- Global options
    globals = {
        mapleader   = " ",
        transparent = true,
        autoformat  = false,
        autosave    = false,
    },

    -- Neovim options
    nvim = {
        -- Appearance
        number         = true,                         --> show line numbers
        relativenumber = true,                         --> show relative line numbers
        cursorline     = true,                         --> highlight current line
        cursorcolumn   = false,                        --> highlight current column
        cursorlineopt  = "number",                     --> highlight options "line" | "number" | "both"
        -- Update time
        updatetime     = 250,                          --> specifies the update time interval in milliseconds for recording changes
        timeoutlen     = 300,                          --> this determines how frequently NeoVim saves changes to the undo buffer.
        -- Tab
        tabstop        = 4,                            --> how many characters Vim /treats/renders/ <TAB> as
        shiftwidth     = 4,                            --> number of spaces to use for auto-indentation, <<, >>, etc
        softtabstop    = 0,                            --> how many chracters the /cursor moves/ with <TAB> and <BS> -- 0 to disable
        expandtab      = true,                         --> use space instead of tab
        autoindent     = true,                         --> enable automatic indentation for new lines based on the previous line
        -- Search
        ignorecase     = true,                         --> ignore case in search
        incsearch      = true,                         --> Show search results while typing
        infercase      = true,                         --> Infer letter cases for a richer built-in keyword completion
        smartcase      = true,                         --> /smartcase -> apply ignorecase | /sMartcase -> do not apply ignorecase
        -- Split
        splitright     = true,                         --> vertical split created right
        splitbelow     = true,                         --> horizontal split created below
        -- Spell
        spell          = false,                        --> autocmd will enable spellcheck in Tex or markdown
        spelllang      = "en",                         --> lang
        spellsuggest   = "best,8",                     --> suggest 8 words for spell suggestion
        spelloptions   = "camel",                      --> consider CamelCase when checking spelling
        -- UI
        signcolumn     = "yes",                        --> render signcolumn
        scrolloff      = 7,                            --> keep minimum x number of screen lines above and below the cursor
        termguicolors  = true,                         --> enables 24-bit RGB color in the TUI
        showtabline    = 0,                            --> 0: never, 1: >= 2 tabs, 2: always
        laststatus     = 0,                            --> 0: never, 1: >= 2 windows, 2: always, 3: always and have one global statusline
        showmode       = false,                        --> dont show mode since we have a statusline
        cmdheight      = 1,                            --> size of neovim command line for display command
        wrap           = false,                        --> wrap code
        guifont        = "MesloLGS NF:h10",            --> font in neovim-qt
        -- Fold
        foldenable     = true,                         --> auto folds until close them using zc/zC or update using zx
        foldmethod     = "expr",                       --> use `expr` function for folding with treesitter
        foldexpr       = "nvim_treesitter#foldexpr()", --> treesitter folding
        foldlevel      = 90,                           --> using ufo provider need a large value, feel free to decrease the value
        foldcolumn     = '0',                          --> number of fold columns
        foldlevelstart = 99,                           --> nvim-ufo
        -- Others
        fillchars      = {
            eob = " ",
            fold = " ",
            foldopen = "",
            foldsep = " ",
            foldclose = "",
        },
        mouse          = "a",                     --> allow mouse in all mode
        confirm        = true,                    --> confirm before exiting with unsaved bufffer(s)
        mousemoveevent = true,                    --> enable mouse move events to track mouse movements
        iskeyword      = vim.opt.iskeyword + "-", --> append '-' to the list of characters considered as keyword parts
        clipboard      = "unnamedplus",           --> allows neovim to access the system clipboard
    }
}

for key, val in pairs(my_opts.globals) do
    vim.g[key] = val
end

for key, val in pairs(my_opts.nvim) do
    vim.opt[key] = val
end

---------------------------------------- WSL ----------------------------------------


-- Install win32yank on wsl by this command:
-- curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip && \
-- unzip win32yank-x64.zip && \
-- chmod +x win32yank.exe && \
-- sudo mv win32yank.exe /usr/local/bin/ && \
-- rm win32yank-x64.zip


local is_wsl = vim.fn.has("wsl") == 1

if is_wsl then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
    }
end
