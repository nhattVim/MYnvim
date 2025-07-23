return {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    config = function()
        require("ufo").setup({
            preview = {
                win_config = {
                    border = { "", "─", "", "", "", "─", "", "" },
                    winhighlight = "Normal:Folded",
                    winblend = 0,
                },
                mappings = {
                    scrollU = "<C-u>",
                    scrollD = "<C-d>",
                    jumpTop = "[",
                    jumpBot = "]",
                },
            },
        })

        vim.keymap.set("n", "K", function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end)
    end,
}
