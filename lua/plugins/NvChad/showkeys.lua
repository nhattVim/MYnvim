return {
    "nvchad/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
        timeout = 1,
        maxkeys = 5,
        show_count = true,
        -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
        position = "top-center",
        keyformat = {
            ["<BS>"] = "󰁮 ",
            ["<CR>"] = "󰘌",
            ["<Space>"] = "󱁐",
            ["<Up>"] = "󰁝",
            ["<Down>"] = "󰁅",
            ["<Left>"] = "󰁍",
            ["<Right>"] = "󰁔",
            ["<PageUp>"] = "Page 󰁝",
            ["<PageDown>"] = "Page 󰁅",
            ["<M>"] = "Alt",
            ["<C>"] = "Ctrl",
        },
    },
}
