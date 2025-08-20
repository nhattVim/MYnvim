return {
    "monkoose/neocodeium", -- AI ghost text completion like GitHub Copilot (Optional)
    event = "VeryLazy",
    build = ":NeoCodeium auth",
    config = function()
        -- Setup neocodeium
        local neocodeium = require("neocodeium")

        -- Setup
        neocodeium.setup({
            silent = true,
        })

        -- Keymap for neocodeium
        vim.keymap.set("i", "<A-f>", function()
            neocodeium.accept()
        end)
        vim.keymap.set("i", "<A-w>", function()
            neocodeium.accept_word()
        end)
        vim.keymap.set("i", "<A-a>", function()
            neocodeium.accept_line()
        end)
        vim.keymap.set("i", "<A-e>", function()
            neocodeium.cycle_or_complete()
        end)
        vim.keymap.set("i", "<A-r>", function()
            neocodeium.cycle_or_complete(-1)
        end)
        vim.keymap.set("i", "<A-c>", function()
            neocodeium.clear()
        end)
    end,
}
