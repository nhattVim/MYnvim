return {
    "Owen-Dechow/nvim_json_graph_view", -- JSON Graph (Optional)
    ft = "json",
    cmd = "JsonGraphView",
    opts = {
        editor_type = "floating",
        floating_editor_style = { border = "rounded" },
        keymaps = {
            link_forward = "L",
            link_backward = "H",
        },
    },
}
