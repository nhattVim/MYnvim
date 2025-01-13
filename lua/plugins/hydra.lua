return {
    "nvimtools/hydra.nvim",
    keys = {
        {
            "<leader>o",
            desc = "Options",
        },
    },
    config = function()
        -- Load default hydra hint module
        local M = require("hydra.hint.vim-options")

        -- Add more %{val}
        M.autosave = function()
            if vim.g.autosave then
                return "[x]"
            else
                return "[ ]"
            end
        end
        M.ats = M.autosave

        M.transparent = function()
            if vim.g.transparent then
                return "[x]"
            else
                return "[ ]"
            end
        end
        M.tpr = M.transparent

        M.foldenable = function()
            if vim.o.foldenable then
                return "[x]"
            else
                return "[ ]"
            end
        end
        M.fold = M.foldenable

        M.formatonsave = function()
            if vim.g.autoformat then
                return "[x]"
            else
                return "[ ]"
            end
        end
        M.fos = M.formatonsave

        -- Vim option menu
        require("hydra")({
            name = "Options",
            hint = [[
  ^ ^       Options
  ^
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _l_ %{cul} cursor line
  _c_ %{cuc} cursor column
  _n_ %{nu} number
  _r_ %{rnu} relative number
  _a_ %{ats} auto save
  _f_ %{fos} format on save
  _t_ %{tpr} transparent
  ^
       ^^^^          _o_ [Quit] ^
]],
            config = {
                invoke_on_body = true,
                color = "pink",
                hint = {
                    show_name = false,
                    position = "middle",
                    offset = 0,
                    float_opts = {
                        border = "rounded",
                    },
                },
            },
            body = "<leader>o",
            mode = { "n", "x" },
            heads = {
                {
                    "n",
                    function()
                        if vim.o.number == true then
                            vim.o.number = false
                        else
                            vim.o.number = true
                        end
                    end,
                    { desc = "number" },
                },
                {
                    "r",
                    function()
                        if vim.o.relativenumber == true then
                            vim.o.relativenumber = false
                        else
                            vim.o.number = true
                            vim.o.relativenumber = true
                        end
                    end,
                    { desc = "relativenumber" },
                },
                {
                    "s",
                    function()
                        if vim.o.spell == true then
                            vim.o.spell = false
                        else
                            vim.o.spell = true
                        end
                    end,
                    { desc = "spell" },
                },
                {
                    "w",
                    function()
                        if vim.o.wrap ~= true then
                            vim.o.wrap = true
                            vim.keymap.set("n", "k", function()
                                return vim.v.count > 0 and "k" or "gk"
                            end, { expr = true, desc = "k or gk" })
                            vim.keymap.set("n", "j", function()
                                return vim.v.count > 0 and "j" or "gj"
                            end, { expr = true, desc = "j or gj" })
                        else
                            vim.o.wrap = false
                            if vim.fn.maparg("k", "n") ~= "" then
                                vim.keymap.del("n", "k")
                            end
                            if vim.fn.maparg("j", "n") ~= "" then
                                vim.keymap.del("n", "j")
                            end
                        end
                    end,
                    { desc = "wrap" },
                },
                {
                    "l",
                    function()
                        if vim.o.cursorline == true then
                            vim.o.cursorline = false
                        else
                            vim.o.cursorline = true
                        end
                    end,
                    { desc = "cursor line" },
                },
                {
                    "c",
                    function()
                        if vim.o.cursorcolumn == true then
                            vim.o.cursorcolumn = false
                        else
                            vim.o.cursorcolumn = true
                        end
                    end,
                    { desc = "cursor column" },
                },
                {
                    "t",
                    function()
                        vim.cmd("ToggleTrans")
                    end,
                    { desc = "toggle transparent" },
                },
                {
                    "f",
                    function()
                        vim.cmd("AutoFmtToggle")
                    end,
                    { desc = "auto format on save" },
                },
                {
                    "a",
                    function()
                        if vim.g.autosave == true then
                            vim.g.autosave = false
                        else
                            vim.g.autosave = true
                        end
                        vim.cmd("ASToggle")
                    end,
                    { desc = "auto save when changed" },
                },
                { "o", nil, { exit = true } },
                { "q", nil, { exit = true, desc = false } },
                { "<ESC>", nil, { exit = true, desc = false } },
            },
        })
    end,
}
