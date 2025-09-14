return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 200,
        notify = true,
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        win = {
            no_overlap = false,
            border = "rounded",
            padding = { 1, 2 },
            title = true,
            title_pos = "center",
            zindex = 1000,
        },
        layout = {
            width = { min = 10 },
            spacing = 5,
            align = "right",
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
            ellipsis = "…",
            rules = false,
        },
        show_help = true,
        show_keys = true,
        filter = function(mapping)
            return mapping.desc and mapping.desc ~= ""
        end,
        spec = {
            -- Hidden keymaps
            { "<leader>X", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others", hidden = true },

            -- Keymaps
            { "<leader>q", "<cmd>qall<CR>", desc = "Exit" },
            { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" },
            { "<leader>n", "<cmd>nohlsearch<CR>", desc = "Nohl" },
            { "<leader>w", "<cmd>silent! w!<CR>", desc = "Save" },
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Expl" },

            {
                "<leader>x",
                function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    local ft = vim.bo[bufnr].filetype
                    local bt = vim.bo[bufnr].buftype
                    if bt == "" or ft == "alpha" then
                        vim.cmd("Bdelete!")
                    else
                        vim.cmd("close")
                    end
                end,
                desc = "Close",
            },

            {
                {
                    "<leader>/",
                    function()
                        require("Comment.api").toggle.linewise.current()
                    end,
                    desc = "Comment",
                    mode = "n",
                },
                {
                    "<leader>/",
                    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
                    desc = "Comment",
                    mode = "v",
                },
            },

            {
                "<leader>h",
                group = "HL",
                {
                    "<leader>hd",
                    group = "Disabled",
                    { "<leader>hdh", "<cmd>TSBufDisable highlight<CR>", desc = "Highlight" },
                    { "<leader>hdi", "<cmd>DisableHLIndent<CR>", desc = "Indent" },
                    { "<leader>hdc", "<cmd>DisableHLChunk<CR>", desc = "Chunk" },
                    { "<leader>hdb", "<cmd>DisableHLBlank<CR>", desc = "Blank" },
                },
                {
                    "<leader>he",
                    group = "Enabled",
                    { "<leader>heh", "<cmd>TSBufEnable highlight<CR>", desc = "Highlight" },
                    { "<leader>hei", "<cmd>EnableHLIndent<CR>", desc = "Indent" },
                    { "<leader>hec", "<cmd>EnableHLChunk<CR>", desc = "Chunk" },
                    { "<leader>heb", "<cmd>EnableHLBlank<CR>", desc = "Blank" },
                },
            },

            {
                "<leader>s",
                group = "Split",
                { "<leader>sv", "<C-w>v", desc = "Vertical" },
                { "<leader>sh", "<C-w>s", desc = "Horizontal" },
                { "<leader>se", "<C-w>=", desc = "Default size" },
                { "<leader>sx", "<cmd>close<CR>", desc = "Close window" },
                { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximum window size" },
            },

            {
                "<leader>r",
                group = "Run",
                { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code" },
                { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File" },
                { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project" },
                {
                    "<leader>rs",
                    '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
                    desc = "Auto Compile Sass",
                },
            },

            {
                "<leader>f",
                group = "Find",
                { "<leader>fb", "<cmd>Telescope marks<cr>", desc = "Find bookmarks" },
                { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find oldfiles" },
                { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
                { "<leader>ft", "<cmd>Telescope colorscheme <CR>", desc = "Find theme" },
                { "<leader>fs", "<cmd>e $MYVIMRC | :cd %:p:h <CR>", desc = "Find settings" },
                { "<leader>fw", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find words" },
                { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find helps" },
                { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
                { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
            },

            {
                "<leader>z",
                group = "Lazy",
                { "<leader>zz", "<cmd>Lazy home<cr>", desc = "Open" },
                { "<leader>zi", "<cmd>Lazy install<cr>", desc = "Install" },
                { "<leader>zu", "<cmd>Lazy update<cr>", desc = "Update" },
                { "<leader>zs", "<cmd>Lazy sync<cr>", desc = "Sync" },
                { "<leader>zx", "<cmd>Lazy clean<cr>", desc = "Clean" },
                { "<leader>zc", "<cmd>Lazy check<cr>", desc = "Check" },
                { "<leader>zl", "<cmd>Lazy log<cr>", desc = "Log" },
                { "<leader>zr", "<cmd>Lazy restore<cr>", desc = "Restore" },
                { "<leader>zp", "<cmd>Lazy profile<cr>", desc = "Profile" },
                { "<leader>zd", "<cmd>Lazy debug<cr>", desc = "Debug" },
            },

            {
                "<leader>l",
                mode = { "n", "v" },
                group = "LSP",
                { "<leader>lm", "<cmd>Mason<CR>", desc = "Mason" },
                { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
                { "<leader>le", "<cmd>Lspsaga finder<cr>", desc = "Show finder" },
                { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Show outine" },
                { "<leader>lb", "<cmd>Lspsaga winbar_toggle<cr>", desc = "Breadcrumb" },
                { "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
                { "<leader>lg", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
                { "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
                { "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
                { "<leader>ls", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show diagnostics" },
                { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
                { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
                { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
                { "<leader>lc", vim.lsp.codelens.run, desc = "CodeLens Action" },
                { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
                { "<leader>lq", vim.diagnostic.setqflist, desc = "Quickfix" },
                {
                    "<leader>lf",
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
                    desc = "Format",
                },
                {
                    "<leader>ll",
                    function()
                        pcall(function()
                            require("lint").try_lint()
                        end)
                    end,
                    desc = "Linting",
                },
            },

            {
                "<leader>g",
                group = "Git",
                { "<leader>gg", require("core.utils").toggle_term("lazygit"), desc = "Lazygit" },
                { "<leader>gt", "<cmd>Gitsigns toggle_signs<CR>", desc = "Toggle" },
                { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
                { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
                { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
                { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
                { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
                { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
                { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
                { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
                { "<leader>go", "<cmd>Telescope git_status theme=ivy<cr>", desc = "Open changed file" },
                { "<leader>gc", "<cmd>Telescope git_commits theme=ivy<cr>", desc = "Checkout commit" },
                { "<leader>gb", "<cmd>Telescope git_branches theme=ivy<cr>", desc = "Checkout branch" },
            },

            {
                "<leader>u",
                group = "Utils",
                mode = { "n", "v" },
                { "<leader>un", require("core.utils").toggle_term("node"), desc = "Node" },
                { "<leader>uh", require("core.utils").toggle_term("htop"), desc = "Htop" },
                { "<leader>ub", require("core.utils").toggle_term("btop"), desc = "Btop" },
                { "<leader>up", require("core.utils").toggle_term("python3"), desc = "Python" },
                { "<leader>ur", require("core.utils").toggle_term("ranger"), desc = "Ranger" },
                { "<leader>uc", "<cmd>CccPick<cr>", desc = "CccPick" },
                { "<leader>uu", "<cmd>ShowkeysToggle<cr>", desc = "ShowKeys" },
                { "<leader>us", "<cmd>ScrollViewToggle<cr>", desc = "Scrollbar" },
                { "<leader>ut", "<cmd>Translate vi<CR><Esc>", desc = "Translate to vi" },
                {
                    "<leader>ul",
                    function()
                        if vim.bo.filetype ~= "alpha" then
                            vim.cmd("Alpha")
                        end
                        vim.cmd("Leet")
                    end,
                    desc = "Leetcode",
                },
            },

            {
                "<leader>j",
                group = "Hop",
                mode = { "n", "v" },
                { "<leader>jj", "<cmd>HopWord<cr>", desc = "Hop word" },
                { "<leader>jl", "<cmd>HopLine<cr>", desc = "Hop line" },
                { "<leader>jc", "<cmd>HopChar1<cr>", desc = "Hop char" },
                { "<leader>jp", "<cmd>HopPattern<cr>", desc = "Hop arbitrary" },
                { "<leader>ja", "<cmd>HopAnywhere<cr>", desc = "Hop all" },
                { "<leader>js", "<cmd>HopLineStart<cr>", desc = "Hop line start" },
            },

            {
                "<leader>b",
                group = "Buffer",
                { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Buffer Pin" },
                { "<leader>bx", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffer" },
                { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffer" },
                { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right Buffer" },
                { "<leader>bk", "<cmd>BufferLineMoveNext<cr>", desc = "Move to Right" },
                { "<leader>bj", "<cmd>BufferLineMovePrev<cr>", desc = "Move to Left" },
                {
                    "<leader>bb",
                    function()
                        require("telescope.builtin").buffers(
                            require("telescope.themes").get_dropdown({ previewer = false })
                        )
                    end,
                    desc = "All buffer",
                },
            },

            -- stylua: ignore
            {
                "<leader>d",
                group = "Debug",
                { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
                { "<leader>dq", function() require("dap").close() end, desc = "Quit" },
                { "<leader>dg", function() require("dap").session() end, desc = "Get Session" },
                { "<leader>ds", function() require("dap").step_out() end, desc = "Step Out" },
                { "<leader>dc", function() require("dap").continue() end, desc = "Start + Continue" },
                { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
                { "<leader>dt", function() require("dap").step_back() end, desc = "Step Back" },
                { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
                { "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect" },
                { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle Repl" },
                { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
                { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoint" },
                { "<leader>du", function() require("dapui").toggle({ reset = true }) end, desc = "Toggle UI" },
            },

            {
                "<leader>p",
                group = "Play",
                { "<leader>p1", "<cmd>Sudoku<cr>", desc = "Sudoku" },
                { "<leader>p2", "<cmd>Speedtyper<cr>", desc = "Speedtyper" },
                { "<leader>p3", "<cmd>SnakeStart<cr>", desc = "Snake" },
                { "<leader>p4", "<cmd>VimBeGood<cr>", desc = "VimBeGood" },
                { "<leader>p5", "<cmd>Tetris<cr>", desc = "Tetris" },
                { "<leader>p6", "<cmd>Nvimesweeper<cr>", desc = "Nvimesweeper" },
                { "<leader>p7", "<cmd>KillKillKill<cr>", desc = "Killersheep" },
                { "<leader>p8", "<cmd>HackAuto<cr>", desc = "Hacker" },
                {
                    "<leader>p9",
                    group = "Typr",
                    { "<leader>p9s", "<cmd>Typr<CR>", desc = "Start" },
                    { "<leader>p9a", "<cmd>TyprStats<CR>", desc = "Achievements" },
                },
            },

            -- stylua: ignore
            {
                "<leader>t",
                group = "Test",
                { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test File" },
                { "<leader>tr", function() require("neotest").run.run() end, desc = "Test Nearest" },
                { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Test Last" },
                { "<Leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
                { "<leader>tp", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
                { "<leader>tx", function() require("neotest").run.stop() end, desc = "Stop" },
                { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
            },
        },
    },
}
