return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "AutoFmtToggle" },
    dependencies = {
        "zapling/mason-conform.nvim", -- Installer (Auto)
        opts = {},
    },
    keys = {
        {
            "<A-f>",
            function()
                require("conform").format({
                    lsp_format = "fallback",
                    async = true,
                    timeout_ms = 500,
                })
            end,
            desc = "Format Buffer",
        },
    },
    config = function()
        -- Setup formatter
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                cpp = { "clang-format" },
                zsh = { "beautysh" },
                sh = { "shfmt" },
                rs = { "ast-grep" },
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = {
                        "-style={AllowShortFunctionsOnASingleLine: false, IndentWidth: 4}",
                        -- "-style={IndentWidth: 4, SpacesInParentheses: true, SpaceBeforeParens: Always}",
                    },
                },
                prettier = {
                    prepend_args = function(ctx)
                        local config_files = {
                            ".prettierrc",
                            ".prettierrc.json",
                            ".prettierrc.js",
                            ".prettierrc.cjs",
                            ".prettierrc.yaml",
                            ".prettierrc.yml",
                            "prettier.config.js",
                            "prettier.config.cjs",
                        }

                        local found = vim.fs.find(config_files, {
                            upward = true,
                            path = vim.fs.dirname(ctx.bufname),
                        })

                        if #found > 0 then
                            return {}
                        else
                            return { "--tab-width", "4" }
                        end
                    end,
                },
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
            },
            format_on_save = function()
                if vim.g.autoformat then
                    return { timeout_ms = 500, lsp_format = "fallback" }
                end
            end,
        })

        -- NOTE: Create auto format command
        vim.api.nvim_create_user_command("AutoFmtToggle", function()
            if vim.g.autoformat then
                vim.g.autoformat = false
                vim.notify("Disabled autoformat on save", vim.log.levels.INFO, { title = "Conform" })
            else
                vim.g.autoformat = true
                vim.notify("Enabled autoformat on save", vim.log.levels.INFO, { title = "Conform" })
            end
        end, {
            desc = "Toggle autoformat on save",
        })
    end,
}
