return {
    "mrjones2014/smart-splits.nvim", -- smart, seamless, directional navigation and resizing of Neovim
    keys = {
        { "<A-a>", "<cmd>SmartResizeLeft<cr>",      desc = "Resize left" },
        { "<A-s>", "<cmd>SmartResizeDown<cr>",      desc = "Resize down" },
        { "<A-w>", "<cmd>SmartResizeUp<cr>",        desc = "Resize up" },
        { "<A-d>", "<cmd>SmartResizeRight<cr>",     desc = "Resize right" },

        { "<C-k>", "<cmd>SmartCursorMoveUp<cr>",    desc = "Navigate up" },
        { "<C-j>", "<cmd>SmartCursorMoveDown<cr>",  desc = "Navigate down" },
        { "<C-h>", "<cmd>SmartCursorMoveLeft<cr>",  desc = "Navigate left" },
        { "<C-l>", "<cmd>SmartCursorMoveRight<cr>", desc = "Navigate right" },
    },
}
