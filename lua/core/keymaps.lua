-- table M
local M = {}

-- helper function
local function mapper(bufnr)
    return function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
            silent = true,
            noremap = true,
            buffer = bufnr or nil,
            desc = desc or nil,
        })
    end
end

-- helper to set keymaps from table
local function set_keys(bufnr, keymaps)
    local map = mapper(bufnr)
    for _, k in ipairs(keymaps) do
        map(k[1], k[2], k[3], k[4])
    end
end

-- general keymaps (global)
function M.general()
    local general = {
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

    set_keys(_, general)
end

-- default LSP keymaps
function M.lsp(bufnr)
    local lsp_keys = {
        { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
        { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
        { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
        { "n", "gl", vim.diagnostic.open_float, "Show diagnostics" },
        { "n", "K", vim.lsp.buf.hover, "Hover" },
        { "n", "gK", vim.lsp.buf.signature_help, "Signature help" },
    }

    set_keys(bufnr, lsp_keys)
end

-- Jdtls specific keymaps
function M.jdtls(bufnr)
    local jdtls = require("jdtls")
    local jdtls_keys = {
        { "n", "<leader>J", "", "Java" },
        { "n", "<leader>Jo", jdtls.organize_imports, "Organize imports" },
        { "n", "<leader>Jt", jdtls.test_class, "Test class" },
        { "n", "<leader>JT", jdtls.test_nearest_method, "Test nearest method" },
        { "n", "<leader>Jv", jdtls.extract_variable, "Extract variable" },
        { "n", "<leader>Jc", jdtls.extract_constant, "Extract constant" },
    }

    set_keys(bufnr, jdtls_keys)
    M.lsp(bufnr)
end

-- load general keymaps globally
M.general()

return M
