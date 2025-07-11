return {
    "hrsh7th/nvim-cmp",
    event = "LspAttach",
    dependencies = {
        -- Soure for cmp
        "hrsh7th/cmp-nvim-lsp", -- source for lsp
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-nvim-lua", -- source for cmp
        "saadparwaiz1/cmp_luasnip", -- source for LuaSnip autocompletion
        "hrsh7th/cmp-calc", -- source for math calculation

        {
            "tzachar/cmp-tabnine", -- source from AI (Optional)
            build = vim.fn.has("win32") == 1 and "powershell ./install.ps1" or "./install.sh",
        },

        {
            "monkoose/neocodeium", -- AI completion like GitHub Copilot
            build = ":NeoCodeium auth",
            opts = {
                silent = true,
            },
        },

        {
            "L3MON4D3/LuaSnip", -- snippet engine
            version = "v2.*",
            build = vim.fn.has("win32") == 1 and "" or "make install_jsregexp",
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
        },
    },
    config = function()
        local cmp = require("cmp")
        local icons = require("core.icons")
        local luasnip = require("luasnip")
        local neocodeium = require("neocodeium")
        local lpath = vim.fn.stdpath("config") .. "/snippets"

        -- Set up completion
        cmp.setup({
            completion = {
                completeopt = "menu,preview,menuone,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "cmp_tabnine" }, -- tabnine
                { name = "nvim_lsp" }, -- lsp
                { name = "nvim_lua" }, -- lua
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
                { name = "calc" }, -- calculation
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, item)
                    item.kind = string.format("%s", icons["Kind"][item.kind])
                    item.abbr = string.sub(item.abbr, 1, 80)

                    item.menu = ({
                        luasnip = "[Snippet]",
                        cmp_tabnine = "[TB]",
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        path = "[Path]",
                        calc = "[Calc]",
                    })[entry.source.name]

                    if entry.source.name == "cmp_tabnine" then
                        item.kind = string.format("%s", icons["Misc"]["Robot"])
                    end

                    return item
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    scrollbar = false,
                }),
                documentation = cmp.config.window.bordered({
                    scrollbar = false,
                }),
            },
        })

        -- Keymap for changing the active choice
        vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true })

        -- Keymap for neocodeium
        vim.keymap.set("i", "<A-f>", function()
            neocodeium.accept()
        end)
        vim.keymap.set("i", "<A-w>", function()
            neocodeium.accept_word()
        end)
        vim.keymap.set("i", "<A-a>", function()
            neocodeium.accept_line()
        end)
        vim.keymap.set("i", "<A-e>", function()
            neocodeium.cycle_or_complete()
        end)
        vim.keymap.set("i", "<A-r>", function()
            neocodeium.cycle_or_complete(-1)
        end)
        vim.keymap.set("i", "<A-c>", function()
            neocodeium.clear()
        end)

        -- load friendly snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- load custom snippets
        require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/MYnvim" })
        require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/bootstrap" })
        require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/javascript" })
        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/laravel" })
        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/laravel-blade1" })
        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/laravel-blade2" })
        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = lpath .. "/codeigniter" })
    end,
}
