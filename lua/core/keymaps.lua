local U = require("core.utils")
local M = {}

M.general_keys = {
    { "v", "<leader><leader>", "<esc>", "Exit visual mode" },
    { "n", "u", "<cmd>silent! undo<cr>", "Undo" },
    { "n", "<C-r>", "<cmd>silent! redo<cr>", "Redo" },
    { "i", "<C-k>", "<up>", "Move up" },
    { "i", "<C-j>", "<down>", "Move down" },
    { "i", "<C-h>", "<left>", "Move left" },
    { "i", "<C-l>", "<right>", "Move right" },
    { "v", ">", ">gv", "Indent right" },
    { "v", "<tab", ">gv", "Indent right" },
    { "v", "<", "<gv", "Indent left" },
    { "v", "<S-tab", "<gv", "Indent left" },
    { { "n", "i", "v" }, "<C-s>", "<cmd>silent! w!<CR>", "Save" },
    { { "n", "v" }, "<C-v>", '"+p', "Paste from clipboard" },
    { "i", "<C-v>", '<Esc>"+pa', "Paste from clipboard" },
    { "c", "<C-S-v>", "<C-R>+", "Paste in command mode" },
    { "v", "<C-c>", '"+y', "Copy to clipboard" },
    { "n", "<C-a>", "ggVG", "Select all" },
}

M.lsp_keys = {
    -- Navigation
    { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
    { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
    { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
    { "n", "gt", vim.lsp.buf.type_definition, "Go to type definition" },
    { "n", "gr", vim.lsp.buf.references, "Find references" },

    -- Info
    { "n", "K", "<cmd>Lspsaga hover_doc<cr>", "Hover" },
    { "n", "gK", vim.lsp.buf.signature_help, "Signature help" },
    { "n", "gh", vim.diagnostic.open_float, "Show diagnostics" },

    -- Edit
    { "n", "gR", vim.lsp.buf.rename, "Rename symbol" },
    { "n", "ga", vim.lsp.buf.code_action, "Code action" },

    -- Format
    {
        "n",
        "gf",
        function()
            vim.lsp.buf.format({ async = true })
        end,
        "Format buffer",
    },
}

M.jdtls_keys = {
    { "n", "<leader>J", "", "Java" },
    { "n", "<leader>Jo", "<cmd>lua require('jdtls').organize_imports()<cr>", "Organize imports" },
    { "n", "<leader>Jo", "<cmd>lua require('jdtls').organize_imports()<cr>", "Organize imports" },
    { "n", "<leader>Jo", "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract variable" },
    { "n", "<leader>Jt", "<cmd>lua require('jdtls').test_class()<cr>", "Test class" },
    { "n", "<leader>JV", "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract constant" },
    { "n", "<leader>JT", "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test nearest method" },
    { "n", "<leader>Jv", "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract variable" },
    { "n", "<leader>Jc", "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract constant" },
}

M.whichkey = {
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
        "<leader>/",
        "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
        desc = "Comment",
        mode = "n",
    },

    {
        "<leader>/",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Comment",
        mode = "v",
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
        { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
        { "<leader>lc", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        { "<leader>lq", "<cmd>lua vim.diagnostic.setqflist()<cr>", desc = "Quickfix" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format" },
        { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
        { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
        { "<leader>ll", "<cmd>lua require('lint').try_lint()<cr>", desc = "Linting" },
    },

    {
        "<leader>g",
        group = "Git",
        { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
        { "<leader>gt", "<cmd>Gitsigns toggle_signs<CR>", desc = "Toggle" },
        { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
        { "<leader>go", "<cmd>Telescope git_status theme=ivy<cr>", desc = "Open changed file" },
        { "<leader>gc", "<cmd>Telescope git_commits theme=ivy<cr>", desc = "Checkout commit" },
        { "<leader>gb", "<cmd>Telescope git_branches theme=ivy<cr>", desc = "Checkout branch" },
        { "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Hunk" },
        { "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Prev Hunk" },
        { "<leader>gl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
        { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
        { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
        { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
        { "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    },

    {
        "<leader>u",
        group = "Utils",
        mode = { "n", "v" },
        { "<leader>un", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
        { "<leader>uh", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop" },
        { "<leader>ub", "<cmd>lua _BTOP_TOGGLE()<cr>", desc = "Btop" },
        { "<leader>up", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
        { "<leader>ur", "<cmd>lua _RANGER_TOGGLE()<cr>", desc = "Ranger" },
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
                require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
            end,
            desc = "All buffer",
        },
    },

    {
        "<leader>d",
        group = "Debug",
        { "<leader>dp", "<cmd>lua require('dap').pause()<cr>", desc = "Pause" },
        { "<leader>dq", "<cmd>lua require('dap').close()<cr>", desc = "Quit" },
        { "<leader>dg", "<cmd>lua require('dap').session()<cr>", desc = "Get Session" },
        { "<leader>ds", "<cmd>lua require('dap').step_out()<cr>", desc = "Step Out" },
        { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Start + Continue" },
        { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step Into" },
        { "<leader>dt", "<cmd>lua require('dap').step_back()<cr>", desc = "Step Back" },
        { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "Step Over" },
        { "<leader>dd", "<cmd>lua require('dap').disconnect()<cr>", desc = "Disconnect" },
        { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", desc = "Toggle Repl" },
        { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
        { "<leader>dx", "<cmd>lua require('dap').clear_breakpoints()<cr>", desc = "Clear Breakpoint" },
        { "<leader>du", "<cmd>lua require('dapui').toggle({reset = true})<cr>", desc = "Toggle UI" },
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

    {
        "<leader>t",
        group = "Test",
        {
            "<leader>tt",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            desc = "Test File",
        },
        {
            "<leader>tr",
            function()
                require("neotest").run.run()
            end,
            desc = "Test Nearest",
        },
        {
            "<leader>tl",
            function()
                require("neotest").run.run_last()
            end,
            desc = "Test Last",
        },
        {
            "<Leader>ts",
            function()
                require("neotest").summary.toggle()
            end,
            desc = "Toggle Summary",
        },
        {
            "<leader>to",
            function()
                require("neotest").output.open({ enter = true, auto_close = true })
            end,
            desc = "Show Output",
        },
        {
            "<Leader>tp",
            function()
                require("neotest").output_panel.toggle()
            end,
            desc = "Toggle Output Panel",
        },
        {
            "<Leader>tx",
            function()
                require("neotest").run.stop()
            end,
            desc = "Stop",
        },
    },
}

-- load general keymaps one time
if not vim.g._keymaps_loaded then
    U.set_keys(nil, M.general_keys)
    vim.g._keymaps_loaded = true
end

-- default LSP keymaps
function M.lsp(bufnr)
    U.set_keys(bufnr, M.lsp_keys)
end

-- Jdtls specific keymaps
function M.jdtls(bufnr)
    U.set_keys(bufnr, M.jdtls_keys)
    M.lsp(bufnr)
end

return M
