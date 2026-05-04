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
            "jdtls",
            "lemminx",
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
            scroll_preview = {
                scroll_down = "<C-f>",
                scroll_up = "<C-b>",
            },
            ui = {
                border = "rounded",
                title = true,
                expand = "",
                collapse = "",
                code_action = "💡",
            },
            hover = {
                open_link = "gx",
                open_cmd = "!firefox",
            },
            rename = {
                keys = {
                    quit = "<C-q>",
                },
            },
            lightbulb = {
                enable = false,
            },
            symbol_in_winbar = {
                enable = false,
            },
        })

        -------------------------- mason --------------------------

        mason_lspconfig.setup({
            ensure_installed = def_servers,
            automatic_enable = { exclude = { "jdtls" } },
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
                vim.lsp.enable(lsp)
            end
        end

        -- Monkey-patch vim.lsp.codelens to use virt_text instead of virt_lines_above
        ---@type any
        local provider = require("vim.lsp._capability").all.codelens
        if provider and provider.on_win then
            local orig_on_win = provider.on_win
            provider.on_win = function(self, toprow, botrow)
                orig_on_win(self, toprow, botrow)
                for _, state in pairs(self.client_state) do
                    local namespace = state.namespace
                    local extmarks = vim.api.nvim_buf_get_extmarks(
                        self.bufnr,
                        namespace,
                        { toprow, 0 },
                        { botrow, -1 },
                        { details = true }
                    )
                    for _, mark in ipairs(extmarks) do
                        local ext_id, row, _, details = mark[1], mark[2], mark[3], mark[4]
                        ---@cast details any
                        if details and details.virt_lines and details.virt_lines_above then
                            local virt_text = details.virt_lines[1]
                            -- Remove the leading padding spaces that were added for virt_lines_above
                            if
                                virt_text
                                and #virt_text > 0
                                and type(virt_text[1][1]) == "string"
                                and virt_text[1][1]:match("^%s*$")
                            then
                                table.remove(virt_text, 1)
                            end

                            -- Add a small padding so it doesn't stick directly to the code
                            table.insert(virt_text, 1, { " ", "LspCodeLensSeparator" })

                            vim.api.nvim_buf_del_extmark(self.bufnr, namespace, ext_id)
                            vim.api.nvim_buf_set_extmark(self.bufnr, namespace, row, 0, {
                                id = ext_id,
                                virt_text = virt_text,
                                virt_text_pos = "eol",
                                hl_mode = "combine",
                            })
                        end
                    end
                end
            end
        end
    end,
}
