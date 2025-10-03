local U = {}

-- helper to create toggleterm by cmd
function U.toggle_term(cmd)
    local term
    return function()
        if not term or not term:is_open() then
            local Terminal = require("toggleterm.terminal").Terminal
            term = Terminal:new({ cmd = cmd, hidden = true })
        end
        term:toggle()
    end
end

-- helper to set keymaps from table
function U.set_keys(bufnr, keymaps)
    for _, k in ipairs(keymaps) do
        vim.keymap.set(k[1], k[2], k[3], {
            silent = true,
            noremap = true,
            buffer = bufnr or nil,
            desc = k[4] or nil,
        })
    end
end

-- helper to set lsp keymaps
function U.set_lsp_keymaps(bufnr)
    U.set_keys(bufnr, {
        -- Navigation
        { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
        { "n", "gt", vim.lsp.buf.type_definition, "Go to type definition" },
        { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
        { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
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
    })
end

return U
