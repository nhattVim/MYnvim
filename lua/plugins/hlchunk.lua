local Colors = {
    -- NOTE: Lighter
    { fg = "#FF8A94" },
    { fg = "#FFE19E" },
    { fg = "#8AD5FF" },
    { fg = "#FFC28B" },
    { fg = "#B9F2A6" },
    { fg = "#EFA6FF" },
    { fg = "#82F0FF" },

    -- NOTE: Darker
    -- { fg = "#E06C75" },
    -- { fg = "#E5C07B" },
    -- { fg = "#61AFEF" },
    -- { fg = "#D19A66" },
    -- { fg = "#98C379" },
    -- { fg = "#C678DD" },
    -- { fg = "#56B6C2" },
}

return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "HiPhish/rainbow-delimiters.nvim", -- Rainbow pairs
    },
    opts = {
        chunk = {
            enable = true,
            style = "#ffffff",
            chars = {
                horizontal_line = "─",
                vertical_line = "│",
                left_top = "╭",
                left_bottom = "╰",
                right_arrow = ">",
            },
            duration = 200,
            delay = 100,
        },
        indent = {
            enable = true,
            ahead_lines = 100,
            exclude_filetypes = {
                hydra_hint = true,
                TelescopeResults = true,
                ["leetcode.nvim"] = true,
            },
            style = Colors,
            chars = {
                -- "▎",
                "│",
                -- "¦",
                -- "┆",
                -- "┊",
            },
        },
        blank = {
            enable = true,
            ahead_lines = 100,
            style = Colors,
            chars = {
                " ․․․",
                " ․․․",
                " ․․․",
                " ․․․",
                " ․․․",
                -- " ․․",
                -- " ⁚⁚",
                -- " ⁖⁖",
                -- " ⁘⁘",
                -- " ⁙⁙",
                -- " ⁙⁙",
            },
        },
    },
}
