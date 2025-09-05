return {
    "nvim-lualine/lualine.nvim",
    event = "BufWinEnter",
    config = function()
        local lualine = require("lualine")
        local noice = require("noice")
        local icons = require("others.icons")
        local macro = require("NeoComposer.ui")
        local module = {
            custom_icon = {
                function()
                    return icons.Misc.Vim
                end,
                separator = { left = "", right = "" },
            },

            mode = {
                "mode",
                separator = { left = "", right = "" },
                padding = 0,
            },

            branch_a = {
                "branch",
                icon = icons.Git.Branch,
            },

            branch_b = {
                "branch",
                icon = icons.Misc.Branch,
                separator = { left = "", right = "" },
            },

            diff = {
                "diff",
                colored = true,
                symbols = {
                    added = icons.Git.LineAdded .. " ",
                    removed = icons.Git.LineRemoved .. " ",
                    modified = icons.Git.LineModified .. " ",
                },
                diff_color = {
                    added = { fg = "#00dc86" },
                    modified = { fg = "#8f21ff" },
                    removed = { fg = "#fc1a70" },
                },
            },

            noice = {
                noice.api.status.mode.get,
                cond = noice.api.status.mode.has,
                color = { fg = "#fc1a70" },
            },

            macro = {
                function()
                    return macro.status_recording()
                end,
            },

            diagnostics = {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "info", "hint" },
                symbols = {
                    hint = icons.Diagnostics.Hint .. " ",
                    warn = icons.Diagnostics.Warning .. " ",
                    info = icons.Diagnostics.Information .. " ",
                    error = icons.Diagnostics.Error .. " ",
                },
                colored = true,
                always_visible = false,
            },

            lsp_clients = {
                function()
                    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                    local lsp_names = {}

                    if next(buf_clients) == nil then
                        return "LSP Inactive"
                    end

                    for _, client in pairs(buf_clients) do
                        table.insert(lsp_names, client.name)
                    end

                    table.sort(lsp_names)
                    return icons.Misc.Database .. " " .. table.concat(lsp_names, ", ")
                end,
            },

            lint_progress = {
                function()
                    local linters = require("lint").get_running()
                    if #linters == 0 then
                        return ""
                    end
                    return " " .. table.concat(linters, ", ")
                end,
                color = function()
                    local linters = require("lint").get_running()
                    if #linters ~= 0 then
                        return { fg = "#EBCB8B" }
                    end
                end,
            },

            spell_icon = {
                function()
                    return icons.Misc.Spell
                end,
                separator = { left = "", right = "" },
                color = { bg = "#8FBCBB", fg = "#000000" },
                padding = 0,
            },

            spell = {
                function()
                    if vim.wo.spell then
                        return vim.bo.spelllang
                    else
                        return "Off"
                    end
                end,
                color = function()
                    if vim.wo.spell then
                        return { fg = "#7aa2f7" }
                    else
                        return { fg = "#888888" }
                    end
                end,
            },

            time_icon = {
                function()
                    return icons.Misc.Clock
                end,
                separator = { left = "", right = "" },
                color = { bg = "#8FBCBB", fg = "#000000" },
                padding = 0,
            },

            time = {
                "datetime",
                style = "%H:%M",
            },

            progress_icon = {
                function()
                    return icons.UI.Text
                end,
                separator = { left = "", right = "" },
                color = { bg = "#ECD3A0", fg = "#000000" },
                padding = 0,
            },

            progress = {
                "progress",
            },

            location_icon = {
                function()
                    return icons.Misc.Location
                end,
                separator = { left = "", right = "" },
                color = { bg = "#C9A0DC", fg = "#000000" },
                padding = 0,
            },

            location = {
                "location",
            },
        }

        lualine.setup({
            options = {
                theme = "auto",
                globalstatus = true,
                icons_enabled = true,
                always_divide_middle = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "alpha" },
                },
            },
            sections = {
                lualine_a = {
                    module.custom_icon,
                    module.mode,
                },
                lualine_b = {
                    module.branch_a,
                },
                lualine_c = {
                    module.branch_b,
                    module.diff,
                    module.lint_progress,
                },
                lualine_x = {
                    module.noice,
                    module.macro,
                    module.diagnostics,
                    module.lsp_clients,
                    module.time_icon,
                    module.time,
                    -- module.spell_icon,
                    -- module.spell,
                    module.progress_icon,
                    module.progress,
                    module.location_icon,
                    module.location,
                },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
