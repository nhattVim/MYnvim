return {
    { "nvim-lua/plenary.nvim" }, -- Library used by other plugins ( Very Important! )
    {
        "stevearc/dressing.nvim", -- Improve the default vim.ui interfaces
        event = "VeryLazy",
    },
    {
        "mg979/vim-visual-multi", -- Multiple cursors plugin for vim/neovim
        event = "VeryLazy",
    },
    {
        "yuratomo/w3m.vim", -- Web browser in neovim
        cmd = "W3m",
    },
    {
        "szw/vim-maximizer", -- Maximal/minimal split windows
        cmd = "MaximizerToggle",
    },
    {
        "famiu/bufdelete.nvim", -- Delete Neovim buffers without losing window layout
        cmd = "Bdelete",
    },
    {
        "OXY2DEV/helpview.nvim", -- Decorations for vimdoc/help files in Neovim
        ft = "help",
    },
    {
        "uga-rosa/ccc.nvim", -- Color picker
        cmd = "CccPick",
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag", -- Auto tagging html tag
        ft = "html",
        opts = {},
    },
    {
        "windwp/nvim-autopairs", -- Auto pairs
        event = "InsertEnter",
        opts = {
            fast_wrap = {},
        },
    },
    {
        "LunarVim/bigfile.nvim",
        event = "BufReadPre",
        opts = {},
    },
    {
        "karb94/neoscroll.nvim", -- Smooth scroll
        event = "WinScrolled",
        opts = {},
    },
    {
        "phaazon/hop.nvim", -- Neovim motions on speed!
        cmd = {
            "HopWord",
            "HopAnywhere",
            "HopChar1",
            "HopLine",
            "HopLineStart",
            "HopPattern",
        },
        opts = {},
    },
    {
        "kylechui/nvim-surround", -- Surround selections, stylishly 😎
        event = "VeryLazy",
        version = "*",
        opts = {},
    },
    {
        "Wansmer/treesj", -- Splitting/joining blocks of code
        keys = {
            { "H", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = {
            use_default_keymaps = false,
            max_join_length = 300,
        },
    },
}
