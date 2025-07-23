return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason-org/mason-lspconfig.nvim", -- Installer (Auto)
        "nvimdev/lspsaga.nvim", -- improve neovim lsp experience
        "hrsh7th/cmp-nvim-lsp", -- supports LSP's capabilities
    },
    config = function()
        ------------------------- variable ------------------------

        local saga = require("lspsaga")
        local mason_lspconfig = require("mason-lspconfig")
        local lsb_capabilities = require("cmp_nvim_lsp").default_capabilities()
        local installed_servers = mason_lspconfig.get_installed_servers()
        local seen = {}
        local servers = {}
        local def_servers = {
            "lua_ls",
            "html",
            "cssls",
            "tailwindcss",
            "emmet_ls",
            "eslint",
            "ts_ls",
            "clangd",
        }

        for _, s in ipairs(def_servers) do
            servers[#servers + 1] = s
            seen[s] = true
        end

        for _, s in ipairs(installed_servers) do
            if not seen[s] then
                servers[#servers + 1] = s
                seen[s] = true
            end
        end

        ------------------------- lspsaga -------------------------

        saga.setup({
            use_saga_diagnostic_sign = false,
            error_sign = false,
            scroll_preview = {
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            definition = {
                edit = "<CR>",
            },
            ui = {
                title = true,
                border = "rounded",
                winblend = 0,
                expand = "",
                collapse = "",
                code_action = "💡",
                incoming = " ",
                outgoing = " ",
                hover = " ",
                kind = {},
            },
            lightbulb = {
                enable = false,
                enable_in_insert = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
            },
            symbol_in_winbar = {
                enable = false,
            },
        })

        -------------------------- mason --------------------------

        mason_lspconfig.setup({
            ensure_installed = def_servers,
            automatic_enable = {
                exclude = { "jdtls" },
            },
        })

        ------------------------ lspconfig ------------------------

        -- Change the Diagnostic symbols in the sign column (gutter)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "󰠠",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
        })

        -- Config servers
        for _, lsp in ipairs(servers) do
            if lsp ~= "jdtls" then --> jdtls will be configured in jdtls.lua
                local opts = { capabilities = lsb_capabilities }
                local has_custom_opts, custom_opts = pcall(require, "plugins.lsp.settings." .. lsp)
                if has_custom_opts then
                    opts = vim.tbl_deep_extend("force", opts, custom_opts)
                end
                vim.lsp.config(lsp, opts)
            end
        end
    end,
}
