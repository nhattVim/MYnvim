return {
    "folke/todo-comments.nvim", -- Highlight todo comments (Optional)
    event = "VeryLazy",
    opts = {
        -- PERF: fully optimised
        -- HACK: hmm, this looks a bit funky
        -- TODO: what else ?
        -- NOTE: adding a note
        -- FIX: this needs fixing
        -- WARNING: ???
        signs = false, -- show icons in the signs column
        keywords = {
            FIX = { icon = " ", color = "a", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "FIXX" } },
            PERF = { icon = " ", color = "e", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            TEST = { icon = " ", color = "f", alt = { "TESTING", "PASSED", "FAILED" } },
            WARN = { icon = " ", color = "b", alt = { "WARNING", "XXX" } },
            NOTE = { icon = " ", color = "d", alt = { "INFO" } },
            TODO = { icon = " ", color = "c" },
            HACK = { icon = " ", color = "b" },
        },
        colors = {
            a = { "#fc1a70" },
            b = { "#FBBF24" },
            c = { "#7aa2f7" },
            d = { "#15c782" },
            e = { "#9049ff" },
            f = { "#FF00FF" },
        },

        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment" }),

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" }),
    },
}
