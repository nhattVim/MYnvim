return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")

        telescope.setup({
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    i = {
                        ["<C-q>"] = actions.close,
                        ["<C-f>"] = actions.send_to_qflist,
                        ["<C-j>"] = actions.cycle_history_next,
                        ["<C-k>"] = actions.cycle_history_prev,
                        ["<C-x>"] = actions.file_split,
                        ["<C-h>"] = actions.file_vsplit,
                        ["<tab>"] = actions.move_selection_next,
                        ["<S-tab>"] = actions.move_selection_previous,
                        ["<C-p>"] = action_layout.toggle_preview,
                    },
                    n = {
                        ["<C-q>"] = actions.close,
                        ["<C-f>"] = actions.send_to_qflist,
                        ["<C-j>"] = actions.cycle_history_next,
                        ["<C-k>"] = actions.cycle_history_prev,
                        ["<C-x>"] = actions.file_split,
                        ["<C-h>"] = actions.file_vsplit,
                        ["<tab>"] = actions.move_selection_next,
                        ["<S-tab>"] = actions.move_selection_previous,
                        ["<C-p>"] = action_layout.toggle_preview,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
