return {
    "ThePrimeagen/harpoon",
    opts = {},
    config = function()
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
    end,
}
