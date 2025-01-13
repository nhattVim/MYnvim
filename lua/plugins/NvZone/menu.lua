return {
    "nvzone/menu",
    dependencies = "nvzone/volt",
    keys = {
        {
            mode = { "n", "v" },
            "<RightMouse>",
            function()
                require("menu.utils").delete_old_menus()
                vim.cmd.exec('"normal! <RightMouse>"')

                local api = require("nvim-tree.api")
                local node = api.tree.get_node_under_cursor
                local nested_menus = {

                    color = {

                        {
                            name = "Color Picker",
                            cmd = "CccPick",
                        },

                        {
                            name = "Huefy",
                            cmd = function()
                                require("minty.huefy").open({ border = true })
                            end,
                        },

                        {
                            name = "Shades",
                            cmd = function()
                                require("minty.shades").open({ border = true })
                            end,
                        },
                    },

                    lsp = {

                        {
                            name = "Peek Definition",
                            cmd = "Lspsaga peek_definition",
                            rtxt = "gt",
                        },

                        {
                            name = "Goto Definition",
                            cmd = "Lspsaga goto_definition",
                            rtxt = "gd",
                        },

                        {
                            name = "Goto Declaration",
                            cmd = vim.lsp.buf.declaration,
                            rtxt = "gD",
                        },

                        {
                            name = "Goto Implementation",
                            cmd = vim.lsp.buf.implementation,
                            rtxt = "gi",
                        },

                        { name = "separator" },

                        {
                            name = "Lsp info",
                            cmd = "LspInfo",
                        },

                        {
                            name = "Show signature help",
                            cmd = vim.lsp.buf.signature_help,
                            rtxt = "<leader>sh",
                        },

                        {
                            name = "Add workspace folder",
                            cmd = vim.lsp.buf.add_workspace_folder,
                            rtxt = "<leader>wa",
                        },

                        {
                            name = "Remove workspace folder",
                            cmd = vim.lsp.buf.remove_workspace_folder,
                            rtxt = "<leader>wr",
                        },

                        {
                            name = "Show References",
                            cmd = vim.lsp.buf.references,
                            rtxt = "gr",
                        },

                        { name = "separator" },

                        {
                            name = "Format Buffer",
                            cmd = function()
                                vim.lsp.buf.format({ async = true })
                            end,
                            rtxt = "<leader>fm",
                        },

                        {
                            name = "Code Actions",
                            cmd = vim.lsp.buf.code_action,
                            rtxt = "<leader>ca",
                        },
                    },
                }

                local main_menu = {

                    main = {

                        {
                            name = "Format Buffer",
                            cmd = function()
                                local ok, conform = pcall(require, "conform")

                                if ok then
                                    conform.format({ lsp_fallback = true })
                                else
                                    vim.lsp.buf.format()
                                end
                            end,
                            rtxt = "<A-f>",
                        },

                        {
                            name = "Code Actions",
                            cmd = vim.lsp.buf.code_action,
                            rtxt = "<leader>la",
                        },

                        { name = "separator" },

                        {
                            name = " Lsp Actions",
                            hl = "Exblue",
                            items = nested_menus.lsp,
                        },

                        { name = "separator" },

                        {
                            name = "Run code",
                            cmd = "RunCode",
                        },

                        {
                            name = "Edit Config",
                            cmd = "e $MYVIMRC | :cd %:p:h",
                        },

                        {
                            name = "Copy Content",
                            cmd = "%y+",
                        },

                        {
                            name = "Delete Content",
                            cmd = "%d",
                        },

                        { name = "separator" },

                        {
                            name = " Open terminal",
                            hl = "ExRed",
                            cmd = "ToggleTerm direction=float",
                        },

                        { name = "separator" },

                        {
                            name = "󰏘 Colors",
                            items = nested_menus.color,
                        },

                        { name = "separator" },

                        {
                            name = "Close",
                            cmd = "q",
                        },
                    },

                    tree = {

                        {
                            name = " New file",
                            cmd = function()
                                api.fs.create(node())
                            end,
                            rtxt = "a",
                        },

                        {
                            name = " New folder",
                            cmd = function()
                                api.fs.create(node())
                            end,
                            rtxt = "a",
                        },

                        { name = "separator" },

                        {
                            name = " Open in window",
                            cmd = function()
                                api.node.open.edit(node())
                            end,
                            rtxt = "o",
                        },

                        {
                            name = " Open in vertical split",
                            cmd = function()
                                api.node.open.vertical(node())
                            end,
                            rtxt = "v",
                        },

                        {
                            name = " Open in horizontal split",
                            cmd = function()
                                api.node.open.horizontal(node())
                            end,
                            rtxt = "s",
                        },

                        {
                            name = "󰓪 Open in new tab",
                            cmd = function()
                                api.node.open.tab(node())
                            end,
                            rtxt = "O",
                        },

                        { name = "separator" },

                        {
                            name = " Cut",
                            cmd = function()
                                api.fs.cut(node())
                            end,
                            rtxt = "x",
                        },

                        {
                            name = " Paste",
                            cmd = function()
                                api.fs.paste(node())
                            end,
                            rtxt = "p",
                        },

                        {
                            name = "󰆏 Copy",
                            cmd = function()
                                api.fs.copy.node(node())
                            end,
                            rtxt = "c",
                        },

                        {
                            name = "󰴠 Copy absolute path",
                            cmd = function()
                                api.fs.copy.absolute_path(node())
                            end,
                            rtxt = "gy",
                        },

                        {
                            name = " Copy relative path",
                            cmd = function()
                                api.fs.copy.relative_path(node())
                            end,
                            rtxt = "Y",
                        },

                        { name = "separator" },

                        {
                            name = " Open in terminal",
                            hl = "ExBlue",
                            cmd = "ToggleTerm direction=float",
                        },

                        { name = "separator" },

                        {
                            name = " Rename",
                            cmd = function()
                                api.fs.rename(node())
                            end,
                            rtxt = "r",
                        },

                        {
                            name = " Trash",
                            cmd = function()
                                api.fs.trash(node())
                            end,
                            rtxt = "D",
                        },

                        {
                            name = " Delete",
                            hl = "ExRed",
                            cmd = function()
                                api.fs.remove(node())
                            end,
                            rtxt = "d",
                        },
                    },
                }

                local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
                local options = vim.bo[buf].ft == "NvimTree" and main_menu.tree or main_menu.main

                require("menu").open(options, { border = true, mouse = true })
            end,
            desc = "NvChad menu",
        },
    },
}
