return {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
        "nvimdev/lspsaga.nvim", -- improve neovim lsp experience
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        ------------------------- variable ------------------------

        local saga = require("lspsaga")
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local lsb_capabilities = require("cmp_nvim_lsp").default_capabilities()
        local signs = {
            Error = " ",
            Warn = " ",
            Hint = "󰠠 ",
            Info = " ",
        }
        local servers = {
            "bashls",
            "clangd",
            "cssls",
            "emmet_ls",
            "html",
            -- "jdtls",
            "lua_ls",
            "pyright",
            "tailwindcss",
            -- "tsserver",
            "jsonls",
            "csharp_ls",
            "rust_analyzer",
            -- "intelephense",
            -- "dockerls",
        }

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
            automatic_installation = true,
        })

        ------------------------ lspconfig ------------------------

        -- Change the Diagnostic symbols in the sign column (gutter)
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Config servers
        for _, lsp in ipairs(servers) do
            if lsp ~= "jdtls" then
                local opts = { capabilities = lsb_capabilities }
                local has_custom_opts, custom_opts = pcall(require, "plugins.lsp.settings." .. lsp)
                if has_custom_opts then
                    opts = vim.tbl_deep_extend("force", opts, custom_opts)
                end
                lspconfig[lsp].setup(opts)
            end
        end
    end,
}
