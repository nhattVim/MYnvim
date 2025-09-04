-- Config for Neovide
vim.o.guifont = "MesloLGS NF:h12"
vim.g.neovide_floating_shadow = true
vim.opt.linespace = 4

-- Set title color
vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
vim.g.neovide_title_text_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

-- Fix mouse
vim.keymap.set({ "n", "v" }, "<LeftMouse><LeftMouse>", "")

-- Open last directory
local last = vim.fn.stdpath("data") .. "/last_dir.txt"
local f = io.open(last, "r")
if f then
    local dir = f:read("*l")
    f:close()
    if dir and dir ~= "" and vim.fn.isdirectory(dir) == 1 then
        vim.cmd("cd " .. dir)
    else
        vim.cmd("cd ~")
    end
else
    vim.cmd("cd ~")
end

-- Save last directory
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        vim.fn.mkdir(vim.fn.stdpath("data"), "p")
        local success, fw = pcall(io.open, last, "w")
        if success and fw then
            fw:write(vim.fn.getcwd())
            fw:close()
        end
    end,
})
