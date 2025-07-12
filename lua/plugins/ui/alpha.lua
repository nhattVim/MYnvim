return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local function load_random_header()
            math.randomseed(os.time())
            local header_folder = vim.fn.stdpath("config") .. "/lua/others/ascii/"
            local files = vim.fn.globpath(header_folder, "*.lua", true, true)

            if #files == 0 then
                return nil
            end

            local random_file = files[math.random(#files)]
            local separator = package.config:sub(1, 1)
            local module_name = "others.ascii." .. random_file:match("([^" .. separator .. "]+)%.lua$")

            package.loaded[module_name] = nil

            local ok, module = pcall(require, module_name)
            if ok and module.header then
                return module.header
            else
                return nil
            end
        end

        local function change_header()
            local new_header = load_random_header()
            if new_header then
                dashboard.config.layout[2] = new_header
                vim.cmd("AlphaRedraw")
            else
                print("No images inside img folder.")
            end
        end

        local header = load_random_header()
        if header then
            dashboard.config.layout[2] = header
        else
            print("No images inside img folder.")
        end

        dashboard.section.buttons.val = {
            dashboard.button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
            dashboard.button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
            dashboard.button("SPC f w", "  Find Word  ", ":Telescope live_grep theme=ivy<CR>"),
            dashboard.button("SPC f b", "  Bookmarks  ", ":Telescope marks theme=ivy<CR>"),
            dashboard.button("SPC f t", "  Themes  ", ":Telescope colorscheme enable_preview=false<CR>"),
            dashboard.button("SPC f s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
            dashboard.button("SPC c i", "  Change header image", ":ChDbHeader<CR>"),
        }

        vim.api.nvim_create_user_command("ChDbHeader", function()
            vim.schedule(change_header)
        end, {})

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = {
                    " ",
                    " Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins  in " .. ms .. " ms ",
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        alpha.setup(dashboard.opts)
    end,
}
