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

-- helper to yank file path with selected line range
function U.yank_file_path_with_range()
    local start_line = vim.fn.line("v")
    local end_line = vim.fn.line(".")

    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    local path = vim.fn.expand("%:p")
    local text

    if start_line == end_line then
        text = string.format("%s:%d", path, start_line)
    else
        text = string.format("%s:%d-%d", path, start_line, end_line)
    end

    vim.fn.setreg("+", text)

    vim.notify("Yanked: " .. text)

    vim.api.nvim_input("<Esc>")
end

return U
