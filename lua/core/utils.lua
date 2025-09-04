local U = {}

function _LAZYGIT_TOGGLE()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
end

function _NODE_TOGGLE()
    local Terminal = require("toggleterm.terminal").Terminal
    local node = Terminal:new({ cmd = "node", hidden = true })
    node:toggle()
end

function _HTOP_TOGGLE()
    local Terminal = require("toggleterm.terminal").Terminal
    local htop = Terminal:new({ cmd = "htop", hidden = true })
    htop:toggle()
end

function _BTOP_TOGGLE()
    local Terminal = require("toggleterm.terminal").Terminal
    local htop = Terminal:new({ cmd = "btop", hidden = true })
    htop:toggle()
end

function _PYTHON_TOGGLE()
    local Terminal = require("toggleterm.terminal").Terminal
    local py = Terminal:new({ cmd = "python3", hidden = true })
    py:toggle()
end

function _RANGER_TOGGLE()
    local Terminal = require("toggleterm.terminal").Terminal
    local ranger = Terminal:new({ cmd = "ranger", hidden = true })
    ranger:toggle()
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
