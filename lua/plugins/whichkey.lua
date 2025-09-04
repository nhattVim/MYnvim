return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 200,
        notify = true,
        spec = require("core.keymaps").whichkey,
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        win = {
            no_overlap = false,
            border = "rounded",
            padding = { 1, 2 },
            title = true,
            title_pos = "center",
            zindex = 1000,
        },
        layout = {
            width = { min = 10 },
            spacing = 5,
            align = "right",
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
            ellipsis = "…",
            rules = false,
        },
        show_help = true,
        show_keys = true,
        filter = function(mapping)
            return mapping.desc and mapping.desc ~= ""
        end,
    },
}
