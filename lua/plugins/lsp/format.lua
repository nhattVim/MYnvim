return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "AutoFmtToggle" },
    dependencies = {
        "zapling/mason-conform.nvim",
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
                markdown = { "prettierd" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                cpp = { "clang-format" },
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
                    prepend_args = { "--tab-width", "4" },
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
