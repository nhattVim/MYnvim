return {
    "williamboman/mason.nvim",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = {
                "javadbg",
            },
        },
    },
    event = "VeryLazy",
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
