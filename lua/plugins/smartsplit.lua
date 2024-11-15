return {
    "mrjones2014/smart-splits.nvim", -- smart, seamless, directional navigation and resizing of Neovim
    keys = {
        { "<M-a>", "<cmd>SmartResizeLeft<cr>",      desc = "Resize left" },
        { "<M-s>", "<cmd>SmartResizeDown<cr>",      desc = "Resize down" },
        { "<M-w>", "<cmd>SmartResizeUp<cr>",        desc = "Resize up" },
        { "<M-d>", "<cmd>SmartResizeRight<cr>",     desc = "Resize right" },

        { "<C-k>", "<cmd>SmartCursorMoveUp<cr>",    desc = "Navigate up" },
        { "<C-j>", "<cmd>SmartCursorMoveDown<cr>",  desc = "Navigate down" },
        { "<C-h>", "<cmd>SmartCursorMoveLeft<cr>",  desc = "Navigate left" },
        { "<C-l>", "<cmd>SmartCursorMoveRight<cr>", desc = "Navigate right" },
    },
}
