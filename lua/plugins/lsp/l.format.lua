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
            mode = "n",
            desc = "Format Buffer",
            function()
                require("conform").format({
                    async = true,
                    timeout_ms = 500,
                    lsp_format = "fallback",
                })
            end,
        },
    },
    config = function()
        local function indent()
            return tostring(vim.bo.shiftwidth)
        end

        require("conform").setup({
            --------------------------------------------------
            -- Formatter by filetype
            --------------------------------------------------
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                sh = { "shfmt" },
                zsh = { "beautysh" },
            },

            --------------------------------------------------
            -- Formatter options
            --------------------------------------------------
            formatters = {
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
                            path = vim.fs.dirname(ctx.filename),
                        })

                        if #found > 0 then
                            return {}
                        end

                        return {
                            "--tab-width",
                            tostring(vim.bo.shiftwidth),
                        }
                    end,
                },

                stylua = {
                    prepend_args = function()
                        return {
                            "--indent-type",
                            "Spaces",
                            "--indent-width",
                            indent(),
                        }
                    end,
                },

                ["clang-format"] = {
                    prepend_args = function()
                        return {
                            string.format("-style={IndentWidth: %s}", indent()),
                        }
                    end,
                },

                shfmt = {
                    prepend_args = function()
                        return {
                            "-i",
                            indent(),
                        }
                    end,
                },
            },

            --------------------------------------------------
            -- Format on save
            --------------------------------------------------
            format_on_save = function()
                if vim.g.autoformat then
                    return {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                    }
                end
            end,
        })

        --------------------------------------------------
        -- Toggle auto format
        --------------------------------------------------
        vim.api.nvim_create_user_command("AutoFmtToggle", function()
            vim.g.autoformat = not vim.g.autoformat
            vim.notify(("Autoformat: %s"):format(vim.g.autoformat and "ON" or "OFF"), vim.log.levels.INFO, {
                title = "Conform",
            })
        end, {
            desc = "Toggle autoformat on save",
        })
    end,
}
