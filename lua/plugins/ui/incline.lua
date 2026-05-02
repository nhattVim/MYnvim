return {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
        local icons = require("others.icons")
        local devicons = require("nvim-web-devicons")
        local helpers = require("incline.helpers")

        -- 1. Data configuration
        local git_cfg = {
            { "added", "Added", icons.Git.LineAdded, "#98c379" },
            { "changed", "Changed", icons.Git.LineModified, "#e5c07b" },
            { "removed", "Removed", icons.Git.LineRemoved, "#e06c75" },
        }

        local diag_cfg = {
            { 1, "Error", icons.Diagnostics.Error },
            { 2, "Warn", icons.Diagnostics.Warning },
            { 3, "Info", icons.Diagnostics.Information },
            { 4, "Hint", icons.Diagnostics.Hint },
        }

        -- 2. Register Highlight
        for _, g in ipairs(git_cfg) do
            vim.api.nvim_set_hl(0, "InclineGit" .. g[2], { fg = g[4], bg = "NONE" })
        end

        -- 3. Helper function to process items
        local function build_items(cfg, get_count, prefix)
            local res = {}
            for _, c in ipairs(cfg) do
                local n = get_count(c[1])
                if n and n > 0 then
                    table.insert(res, { c[3] .. n .. " ", group = prefix .. c[2] })
                end
            end
            return #res > 0 and { unpack(res), { "┊ " } } or {}
        end

        -- 4. Setup Incline
        require("incline").setup({
            render = function(props)
                local buf = props.buf
                local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
                name = name ~= "" and name or "[No Name]"
                local icon, color = devicons.get_icon_color(name)
                local signs = vim.b[buf].gitsigns_status_dict or {}

                return {
                    build_items(diag_cfg, function(s)
                        return #vim.diagnostic.get(buf, { severity = s })
                    end, "DiagnosticSign"),
                    build_items(git_cfg, function(k)
                        return tonumber(signs[k])
                    end, "InclineGit"),
                    {
                        " " .. (icon or "") .. " ",
                        guifg = color and helpers.contrast_color(color) or "NONE",
                        guibg = color or "NONE",
                    },
                    {
                        " " .. name .. " ",
                        gui = vim.bo[buf].modified and "bold,italic" or "bold",
                        guibg = "#44406e",
                    },
                }
            end,
        })
    end,
}
