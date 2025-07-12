return {
    -- A clean, dark Neovim theme written in Lua
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Function to update tokyonight config
        local function tokyonight_config()
            require("tokyonight").setup({
                style = "night",
                light_style = "day",
                transparent = vim.g.transparent,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    sidebars = vim.g.transparent and "transparent" or "dark",
                    floats = vim.g.transparent and "transparent" or "dark",
                },
                sidebars = { "qf", "help" },
                day_brightness = 0.3,
                hide_inactive_statusline = false,
                dim_inactive = false,
                lualine_bold = false,

                on_colors = function(c)
                    c.c1 = "#9d7cd8"
                    c.c2 = "#7aa2f7"
                    c.c3 = "#fc1a70"
                    c.c4 = "#9049d8"
                end,

                on_highlights = function(hl, c)
                    hl.AlphaHeader = {
                        fg = c.c2,
                    }

                    hl.AlphaButtons = {
                        fg = c.c1,
                    }

                    hl.FloatBorder = {
                        fg = c.c4,
                    }

                    hl.FloatTitle = {
                        fg = c.c4,
                    }

                    hl.TelescopeBorder = {
                        fg = c.c4,
                    }

                    -- Fix transparency on buffferline & lualine
                    if vim.g.transparent then
                        -- Tabs
                        hl.TabLineFill = { bg = "NONE" }

                        -- Lualine
                        hl.StatusLine = { bg = "NONE" }

                        -- Bufferline
                        hl.BufferLineSeparator = { fg = c.c1 }
                    end
                end,
            })

            -- Load theme
            vim.cmd([[colorscheme tokyonight-night]])
        end

        tokyonight_config()

        -- INFO: Create toggle transparency command
        vim.api.nvim_create_user_command("ToggleTrans", function()
            vim.g.transparent = not vim.g.transparent
            vim.notify("Transparent: " .. tostring(vim.g.transparent), vim.log.levels.INFO, { title = "Tokyonight" })
            tokyonight_config()
        end, {
            desc = "Toggle transparency for Tokyonight theme",
        })
    end,
}
