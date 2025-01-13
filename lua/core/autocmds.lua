--------------------------------------------------------- Auto CMD  ---------------------------------------------------------

-- create augroup
vim.api.nvim_create_augroup("nhattVim", { clear = true })

-- reload file when it changes
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = "nhattVim",
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = "nhattVim",
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "nhattVim",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "nhattVim",
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = "nhattVim",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = "nhattVim",
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = "nhattVim",
    pattern = {
        "PlenaryTestPopup",
        "checkhealth",
        "dbout",
        "gitsigns-blame",
        "grug-far",
        "help",
        "lspinfo",
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
        "notify",
        "qf",
        "snacks_win",
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
            })
        end)
    end,
})

-- exit terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = "nhattVim",
    pattern = "term://*",
    callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<c-x>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end,
})

--------------------------------------------------------- User CMD  ---------------------------------------------------------

-- command to compile debug file for cpp
vim.api.nvim_create_user_command("CompileCppDebug", function()
    local input = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:r") .. "_debug"
    local cmd = string.format("g++ --debug %s -o %s", input, output)

    local result = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
        vim.notify("Compilation failed:\n" .. result, vim.log.levels.ERROR)
    else
        vim.notify("Compilation successful: " .. output, vim.log.levels.INFO)
    end
end, {})

-- command to copy from WSL to Window clipboard
vim.api.nvim_create_user_command("WslCopy", function(opts)
    if vim.fn.has("wsl") == 1 then
        local content

        if opts.range > 0 then
            local lines = vim.fn.getline(opts.line1, opts.line2)
            if type(lines) == "table" then
                content = table.concat(lines, "\n")
            else
                content = ""
            end
        else
            content = vim.fn.getreg('"')
        end

        if content == "" then
            vim.notify("Nothing to copy", vim.log.levels.WARN)
            return
        end

        local escaped_content = vim.fn.shellescape(content)
        local result = vim.fn.system("echo " .. escaped_content .. " | iconv -f utf-8 -t utf-16le | clip.exe")

        if vim.v.shell_error ~= 0 then
            vim.notify("Failed to copy to clipboard: " .. result, vim.log.levels.ERROR)
        else
            vim.notify("Copied to clipboard", vim.log.levels.INFO)
        end
    else
        vim.notify("Not on WSL", vim.log.levels.ERROR)
    end
end, {
    range = true,
})
