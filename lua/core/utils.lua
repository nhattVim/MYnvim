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
        local opts = vim.tbl_extend("force", {
            silent = true,
            noremap = true,
            buffer = bufnr or nil,
            desc = k[4],
        }, k[5] or {})

        vim.keymap.set(k[1], k[2], k[3], opts)
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

-- helper to load .env file
function U.load_env(path)
    path = path or (vim.fn.stdpath("config") .. "/.env")

    local file = io.open(path, "r")
    if not file then
        return
    end

    for line in file:lines() do
        -- ignore comments and empty lines
        if line ~= "" and not line:match("^#") then
            local key, value = line:match("^([%w_]+)%s*=%s*(.*)$")

            if key and value then
                -- remove quotes
                value = value:gsub('^"', ""):gsub('"$', "")
                value = value:gsub("^'", ""):gsub("'$", "")
                vim.fn.setenv(key, value)
            end
        end
    end

    file:close()
end

return U
