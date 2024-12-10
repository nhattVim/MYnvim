return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = {
                "javadbg",
                "codelldb",
            },
        },
    },
    opts = {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}
