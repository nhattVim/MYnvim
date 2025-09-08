return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm" },
    keys = {
        { mode = { "n", "t" }, "<a-t>", "<cmd>ToggleTerm direction=float<cr>", desc = "float terminal" },
        { mode = { "n", "t" }, "<a-v>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "vertical terminal" },
        { mode = { "n", "t" }, "<a-h>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "horizontal terminal" },
        { mode = { "n", "t" }, "<c-\\>", desc = "Toggle term" },
    },
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\>]],
        shade_filetypes = { "none" },
        shading_factor = 2,
        direction = "float",
        close_on_exit = true,
        shell = vim.fn.has("win32") == 1 and "pwsh -NoLogo" or vim.o.shell,
        float_opts = {
            border = "curved", -- include: single | double | shadow | curved
            winblend = 0,
        },
        highlights = {
            FloatBorder = {
                guifg = "#9d7cd8",
            },
        },
    },
}
