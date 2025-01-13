return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local function load_random_header()
            math.randomseed(os.time())
            local header_folder = vim.fn.stdpath("config") .. "/lua/plugins/ascii"
            local files = vim.fn.globpath(header_folder, "*.lua", true, true)
            if #files == 0 then
                return nil
            end
            local random_file = files[math.random(#files)]
            local module_name = "plugins.ascii." .. random_file:match("([^/]+)%.lua$")
            return require(module_name).header
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
            dashboard.button("SPC c i", "  Change header image", function()
                change_header()
            end),
        }

        vim.api.nvim_create_autocmd("User", {
            desc = "Add Alpha dashboard footer",
            once = true,
            callback = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
                dashboard.section.header.opts.hl = "DashboardFooter"
                dashboard.section.footer.val =
                    { " ", " Loaded " .. stats.count .. " plugins  in " .. ms .. " ms " }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
