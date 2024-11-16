return {
    "sindrets/winshift.nvim", --  Rearrange your windows with ease.
    cmd = "WinShift",
    keys = {
        { "<C-S-h>",     "<cmd>WinShift left<cr>",  desc = "Move left" },
        { "<C-S-j>",     "<cmd>WinShift down<cr>",  desc = "Move down" },
        { "<C-S-l>",     "<cmd>WinShift right<cr>", desc = "Move right" },
        { "<C-S-k>",     "<cmd>WinShift up<cr>",    desc = "Move up" },
        { "<C-S-Space>", "<cmd>WinShift<cr>",       desc = "Move mode" },
    },
}
