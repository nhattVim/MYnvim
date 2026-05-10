return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
        "nhattVim/alpha-ascii.nvim",
        opts = {
            header = "random",
            exclude = { "calm_eyes", "color_eyes" },
        },
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find File  ", "<Cmd>Telescope find_files<CR>"),
            dashboard.button("o", "  Recent File  ", "<Cmd>Telescope oldfiles<CR>"),
            dashboard.button("p", "  Recent Project", "<Cmd>ProjectList<CR>"),
            dashboard.button("w", "  Find Word  ", "<Cmd>Telescope live_grep theme=ivy<CR>"),
            dashboard.button("b", "  Bookmarks  ", "<Cmd>Telescope marks theme=ivy<CR>"),
            dashboard.button("t", "  Themes  ", "<Cmd>Telescope colorscheme enable_preview=false<CR>"),
            dashboard.button("s", "  Settings", "<Cmd>e $MYVIMRC | :cd %:p:h <CR>"),
            dashboard.button("i", "  Change header image", "<Cmd>AlphaAsciiNext<CR>"),
        }

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = {
                    " ",
                    " Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins  in " .. ms .. " ms ",
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        alpha.setup(dashboard.opts)
    end,
}
