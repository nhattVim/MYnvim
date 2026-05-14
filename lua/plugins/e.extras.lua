return {
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
    },
    {
        "szw/vim-maximizer",
        cmd = "MaximizerToggle",
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {},
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        opts = {},
    },
    {
        "smoka7/hop.nvim",
        cmd = { "HopWord", "HopAnywhere", "HopChar1", "HopLine", "HopLineStart", "HopPattern" },
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        version = "*",
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag", -- Auto tagging html tag
        ft = "html",
        opts = {},
    },
    {
        "uga-rosa/ccc.nvim", -- Color picker
        cmd = "CccPick",
        opts = {},
    },
    {
        "famiu/bufdelete.nvim", -- Delete Neovim buffers without losing window layout
        cmd = "Bdelete",
    },
    {
        "Wansmer/treesj",
        keys = {
            { "H", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = {
            use_default_keymaps = false,
            max_join_length = 300,
        },
    },
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle",
        opts = {
            enabled = vim.g.autosave,
            debounce_delay = 500,
            trigger_events = {
                immediate_save = { "BufLeave", "FocusLost" },
                defer_save = { "InsertLeave", "TextChanged" },
                cancel_deferred_save = { "InsertEnter" },
            },
        },
    },
    {
        "LunarVim/bigfile.nvim",
        event = "BufReadPre",
        opts = {
            filesize = 2,
            features = {
                "indent_blankline",
                "illuminate",
                "lsp",
                "treesitter",
                "syntax",
                "matchparen",
                "vimopts",
                "filetype",
            },
            pattern = function(bufnr)
                local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
                local file_length = #file_contents
                if file_length > 2000 then
                    return true
                end
            end,
        },
    },
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        opts = {
            timeout = vim.o.timeoutlen,
            mappings = {
                i = {
                    j = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                },
                c = { j = { k = "", j = "" } },
                t = { j = { k = "", j = "" } },
                v = { j = { k = "" } },
                s = { j = { k = "" } },
            },
        },
    },
    {
        "mcauley-penney/visual-whitespace.nvim",
        event = "ModeChanged *:[vV\22]",
        opts = {
            match_types = {
                space = true,
                tab = true,
                nbsp = false,
                lead = false,
                trail = false,
            },
            list_chars = {
                space = "·",
                tab = "→",
                nbsp = "␣",
                lead = "‹",
                trail = "›",
            },
            fileformat_chars = { unix = "", mac = "", dos = "" },
        },
    },
    {
        "sindrets/winshift.nvim",
        cmd = "WinShift",
        keys = {
            { "<C-W>h", "<cmd>WinShift left<cr>", desc = "Move left" },
            { "<C-W>j", "<cmd>WinShift down<cr>", desc = "Move down" },
            { "<C-W>l", "<cmd>WinShift right<cr>", desc = "Move right" },
            { "<C-W>k", "<cmd>WinShift up<cr>", desc = "Move up" },
            { "<C-W><leader>", "<cmd>WinShift<cr>", desc = "Move mode" },
        },
    },
}
