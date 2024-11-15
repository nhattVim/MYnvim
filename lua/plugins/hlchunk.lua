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
            chars = {
                -- "▎",
                "│",
                -- "¦",
                -- "┆",
                -- "┊",
            },
            style = {
                -- darker
                -- "#E06C75",
                -- "#E5C07B",
                -- "#61AFEF",
                -- "#D19A66",
                -- "#98C379",
                -- "#C678DD",
                -- "#56B6C2",

                -- lighter
                "#FF8A94",
                "#FFE19E",
                "#8AD5FF",
                "#FFC28B",
                "#B9F2A6",
                "#EFA6FF",
                "#82F0FF",
            },
        },
    },
}
