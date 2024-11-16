return {
    "sindrets/winshift.nvim", --  Rearrange your windows with ease.
    cmd = "WinShift",
    keys = {
        { "<C-W>h",        "<cmd>WinShift left<cr>",  desc = "Move left" },
        { "<C-W>j",        "<cmd>WinShift down<cr>",  desc = "Move down" },
        { "<C-W>l",        "<cmd>WinShift right<cr>", desc = "Move right" },
        { "<C-W>k",        "<cmd>WinShift up<cr>",    desc = "Move up" },
        { "<C-W><leader>", "<cmd>WinShift<cr>",       desc = "Move mode" },
    },
}
