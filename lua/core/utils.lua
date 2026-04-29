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

return U
