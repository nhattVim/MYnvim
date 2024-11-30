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
            { name = "root", url = "mysql://root@localhost" },
            { name = "albedo", url = "mysql://albedo@localhost" },
            -- export MYSQL_PWD='1234567890p*'
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
    end,
}
