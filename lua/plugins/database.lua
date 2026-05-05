return {
    -- NOTE: These plugins are just UI/wrappers.
    -- You still need to install database CLI tools.

    -- MySQL       -> mysql
    -- PostgreSQL  -> psql
    -- SQLite      -> sqlite3
    -- Redis       -> redis-cli

    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
        "tpope/vim-dadbod",
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { "sql", "mysql", "plsql" },
        },
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_database_icon = 1
        vim.g.db_ui_show_help = 0
        vim.g.dbs = {
            -- sudo mysql -u root -p
            -- ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'root';
            -- FLUSH PRIVILEGES;
            -- EXIT;
            root = "mysql://root:root@localhost",

            -- sudo mysql -u root -p
            -- CREATE USER 'albedo'@'localhost' IDENTIFIED BY 'albedo';
            -- GRANT ALL PRIVILEGES ON *.* TO 'albedo'@'localhost' WITH GRANT OPTION;
            -- FLUSH PRIVILEGES;
            -- EXIT;
            albedo = "mysql://albedo:albedo@localhost",

            -- db aiven, load from .env
            aiven = os.getenv("DB_AIVEN_URL"),
        }
    end,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
                vim.bo.omnifunc = "vim_dadbod_completion#omni"
                local ok, cmp = pcall(require, "cmp")
                if ok then
                    cmp.setup.buffer({
                        sources = {
                            { name = "vim-dadbod-completion" },
                        },
                    })
                end
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dbui",
            callback = function()
                local opts = { noremap = true, silent = true, buffer = true }
                vim.keymap.set("n", "s", "<Plug>(DBUI_SelectLineVsplit)", opts)
                vim.keymap.set("n", "v", "<Plug>(DBUI_SaveQuery)", opts)
            end,
        })
    end,
}
