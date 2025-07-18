return {
    "Owen-Dechow/nvim_json_graph_view", -- JSON Graph (Optional)
    dependencies = "Owen-Dechow/graph_view_yaml_parser", -- YAML Graph (Optional)
    ft = { "json", "yaml" },
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
