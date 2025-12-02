return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    keys = function()
        local maps = {
            { mode = { "n", "t" }, "<A-`>", "<cmd>TermSelect<cr>", desc = "select terminal" },
            { mode = { "n", "t" }, "<C-t>", "<cmd>ToggleTermSetName<cr>", desc = "set terminal name" },
            { mode = { "n", "t" }, "<A-t>", "<cmd>ToggleTerm direction=float<cr>", desc = "float terminal" },
            { mode = { "n", "t" }, "<A-v>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "vertical terminal" },
            { mode = { "n", "t" }, "<A-h>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "horizontal terminal" },
            { mode = { "n", "t" }, "<c-\\>", desc = "Toggle term" },
        }

        -- Generate keymaps for Alt + 1..3
        for i = 1, 9 do
            table.insert(maps, {
                mode = { "n", "t" },
                string.format("<A-%d>", i),
                string.format("<cmd>%dToggleTerm<cr>", i),
                desc = string.format("Terminal %d", i),
            })
        end

        return maps
    end,
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\>]],
        direction = "float",
        shell = vim.fn.has("win32") == 1 and "pwsh -NoLogo" or vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
        },
        highlights = {
            FloatBorder = { guifg = "#9d7cd8" },
        },
    },
}
