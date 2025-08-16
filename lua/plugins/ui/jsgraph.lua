return {
    "Owen-Dechow/videre.nvim", -- JSON Graph (Optional)
    dependencies = {
        "Owen-Dechow/graph_view_yaml_parser", -- YAML Graph (Optional)
        "Owen-Dechow/graph_view_yaml_parser", -- YAML support (Optional)
        "Owen-Dechow/graph_view_toml_parser", -- TOML support (Optional)
        "a-usr/xml2lua.nvim", -- XML support (Optional)
    },
    ft = { "json", "yaml", "toml", "xml" },
    cmd = "Videre",
    opts = {
        editor_type = "floating",
        floating_editor_style = { border = "rounded" },
        keymaps = {
            link_forward = "L",
            link_backward = "H",
        },
    },
}
