return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "tpope/vim-dadbod",
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = {
                "sql",
                "mysql",
                "plsql",
            },
        },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_database_icon = 1
        vim.g.db_ui_show_help = 0
    end,
    config = function()
        vim.g.dbs = {
            -- sudo mysql -u root -p
            -- ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'root';
            -- FLUSH PRIVILEGES;
            -- EXIT;
            { name = "root", url = "mysql://root:root@localhost" },

            -- sudo mysql -u root -p
            -- CREATE USER 'albedo'@'localhost' IDENTIFIED BY 'albedo';
            -- GRANT ALL PRIVILEGES ON *.* TO 'albedo'@'localhost' WITH GRANT OPTION;
            -- FLUSH PRIVILEGES;
            -- EXIT;
            { name = "albedo", url = "mysql://albedo:albedo@localhost" },
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "sql",
            },
            command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "sql",
                "mysql",
                "plsql",
            },
            callback = function()
                local ok, cmp = pcall(require, "cmp")
                if ok then
                    vim.schedule(function()
                        cmp.setup.buffer({
                            sources = { { name = "vim-dadbod-completion" } },
                        })
                    end)
                else
                    vim.notify("Error loading cmp: " .. cmp, vim.log.levels.ERROR)
                end
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dbui",
            callback = function()
                vim.api.nvim_buf_set_keymap(
                    0,
                    "n",
                    "s",
                    "<Plug>(DBUI_SelectLineVsplit)",
                    { noremap = true, silent = true }
                )
                vim.api.nvim_buf_set_keymap(0, "n", "v", "<Plug>(DBUI_SaveQuery)", { noremap = true, silent = true })
            end,
        })
    end,
}
