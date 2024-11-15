--------------------------------------------------------- CMD  ---------------------------------------------------------

-- auto reload file when it changes
vim.loader.enable()
vim.cmd([[au FocusGained,BufEnter,BufRead * checktime]])

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- copy on WSL
if vim.fn.has("wsl") == 1 then
    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.fn.system(
                "echo " .. vim.fn.shellescape(vim.fn.getreg('"')) .. " | iconv -f utf-8 -t utf-16le | clip.exe"
            )
        end,
    })
end

-- exit terminal
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<c-x>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- harpoon
vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    callback = function()
        -- highlight harpoon border
        vim.cmd([[highlight link HarpoonBorder TelescopeBorder]])

        -- vertical split (control+v)
        vim.keymap.set("n", "<C-v>", function()
            vim.cmd("vs")
            vim.cmd("e " .. vim.fn.getcwd() .. "/" .. vim.api.nvim_get_current_line())
        end, { buffer = true, noremap = true, silent = true })

        -- horizontal split (control+h)
        vim.keymap.set("n", "<C-h>", function()
            vim.cmd("sp")
            vim.cmd("e " .. vim.fn.getcwd() .. "/" .. vim.api.nvim_get_current_line())
        end, { buffer = true, noremap = true, silent = true })

        -- new tab (control+t)
        vim.keymap.set("n", "<C-t>", function()
            vim.cmd("tabnew")
            vim.cmd("e " .. vim.fn.getcwd() .. "/" .. vim.api.nvim_get_current_line())
        end, { buffer = true, noremap = true, silent = true })
    end,
})

-- highlight
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.cmd([[hi MarkSignHL gui=italic guifg=#fc1a70]]) --> marks.lua
        vim.cmd([[hi MatchParen gui=italic guifg=#ff966c]]) --> matchup.lua
    end,
})
